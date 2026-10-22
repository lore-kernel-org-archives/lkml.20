Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665660;
	b=UfygD0Rdwq/BJMWSN6LOo5IjYsJPIfgY3OAvmd4QJqjRYEUNdD1Px7b+98A15f812jpT
	 zJagwdURn9gtIijrrK+BfHX30k4l3H5TnrTRUrYifrd55NA/3KaCtRNAxHKA5SY3YRSl8
	 rwNrrrjBinUL8j+p8/EuBP1yk9FaAs6lKJUMzNBWsu4b92skRA46ku/Va7K5KOLBPnIrQ
	 h/eZ+BxiwXVMS1+W7ItwtKRw9nkU3rxvyuFWcbsFTnwkHdUJBtebRPSgsJwdkDdsphxy+
	 SfRAYKu+vLaAAPugNGhC6Y1WAAm3oJ/o5xRJNy4bwz9M+unQWhH8Mv62X2zgFxfgFFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=;
	b=ZEFo7lcx9K2kCmoZU9JJm8SJljrEE/NKN77AhhWA0cu4cEEudtvciSU6PBEG5sgJe6Q5
	 wsUSErrBRd334N+pAVnaLVc8A0//SQN8oQ3fR0wZP8OoucphT5sN+uC8dTdEooOrglwQm
	 EK9bxi4fvVlLuYlb800S02lIXEcfkUaS9hSWuzXrJViM77ej1xNFK3rHiFDoaiKPdU4Yg
	 HpnB4KAGErQyL8TUF3xY/KtB3AxDyFKWeiWl4rX+mhwvDMcMJRKb0vTCwTw13GWVIaG2v
	 vPnFenAhm/QnLIlFAF+Ugchx84znHRUQ27T8eldD9vNhjjOJs3v/aq/61+FixiKWZyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=crAUTjbF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZH0bXuc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=crAUTjbF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZH0bXuc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xpb03478820
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=; b=crAUTjbFr6+0fev2
	prazN3ntxMaB87Pkd6triQrAkPeaOHnXvqCRj+sfWcV8wn0thp1piti7vumsX71p
	p6DawZJpen9AEqq4sGa1VSsiki2qvri9TLNL585TgWDhUedYE8Be6xoeYPoW3WR4
	KTQH0/vERv7N89xddeF35zIEAnrwxtx4hi0p4SQA0SNXPw5GltkNhG14BXSHfoO/
	dFrV37GjFYjp1WUk5yNp9baY8ENT7TI/7dnu6rgNe/qcdCY5rPtFRPEetOsaJxwl
	pFYHiK1RlN0cNtkC89Z/3SYNuBMci13KujMtymmorhAFEe4bzxcEB6+pu8sXqKvC
	kxHQNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a25kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:40:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so41771585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665653; x=1793270453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=;
        b=ZZH0bXucSdBxV5mv2SdZHz1NuO66aldssfhhznZfFMSGPcFhvONJ7VT/iiBICenvhr
         9HUmcfNOh1wqaVJZA22Tzgm2lbx5Jndl31aQ4TgjRuF6CAMQ2VWIgaIBEyqUBq65qS0B
         oXAG0FfEgBf4CkzybpFXLeSu3mklgjFZanHMeplUCgbr2/VSMlxA6spJjBKl46hQGty8
         CqOS2oAGVVg1kmRVKgdJNyyIqfRHgmDNLhDc8BKXVLQac33jY8jX9sRVpPUhErkLhHHL
         BLAWE9iZmYUXszxho15sc3GsJwijBZiz8WK13G01HzgfWmzAV4k/Lz0J7m4Pp7jWZ9ga
         p8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665653; x=1793270453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=;
        b=zgULglLrJPVB6tGEnbQT207jo+efcGakTcrmo4VWSXMj8+yKrbQ1LZKAQBjo5DyEO/
         YuI85lRCB1AWFJnc3kPUlQMQVZyRlUd4OSRlqn5EAqrmAgN3/y015I7JpG4hfk9Oab0P
         3CzjmZN9yLZg3jTjznoFUIy+/3vmMF+Uqi0xheJHW/d6KKrOT4nQujEkZuTBuQ3KOfa6
         yQoRc/tDD/OoNVH8aFTKAJ+qblW1LTRvI3E+E80IILvoKP7XZGBrU1rk0qfYu5borE+Z
         PEaP8TCz2EeeyLps8P+FJ+DI4tzoLrvdf9VIl3nPZIoBnvGGfghzAQVIA7r+8sYoZ/W3
         pH5w==
X-Forwarded-Encrypted: i=1; AKwUvBx07c9VNQKHt7CtfICUEB7zWN6aXSLs7fgNof2zZ909sWVN0LMvlkm6sbW6ktEk+qj/oqO5OKsafXEW/DQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDmWz/wzQyrRVwFm/n2AaMLxB8iyKlFaqYJZ65I6675+UUAUJb
	dBE1kpJkctBZzEl8IVNULtx1Vd4d+jtjbCSLE7rc9CeFMhLUz6ol1mIXKL9oMesHhRkhxKGtoGL
	K0f2ssWLee453qNZyDVhpe3B9qlDGu/xH+ByUsjsxNZ09OGpdg/i47YXrHQuik0YjItg=
X-Gm-Gg: AYBFou3K54q4HyMgjL1rWCxF8MP40G6ywxrOIl6Q7NxzGRPiVuoW1qK6HZV2URQMB00
	0qSd1vhuIOAA6yg3h5tGTQm2kfNjZeRP4QyZyLvwf6iTJ0uZCRMSzJuAnz77p9vY4liCl6sErwZ
	aLxqo45YSHFwaN83xzOgoC0hwwI7D5XRWWXuMBwwhE4gjnqFXkHxT3d1Di1neqqRbyXHEplhJnY
	VzRMaZqtAVec81FfaTZPvHxEp7bX3PDRcb+l78+w1tWaiCGA85kYWd+mF6P5BJJGwf9W/WBkc1c
	9Bb4otq5E1JljAN283CqBQaM7vBYQvMJ5VlpaTUlkr6wCDbMJksAHwQSdB4cloSjvGaKIc1A4Gg
	BermseV3sKNX4nP8iSLBG2w==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr1020948185a.1.1792665652797;
        Thu, 22 Oct 2026 03:40:52 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr1020944685a.1.1792665652217;
        Thu, 22 Oct 2026 03:40:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316bcd6sm1606316a12.36.2026.10.22.03.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:40:50 -0700 (PDT)
Message-ID: <08503be4-d40f-45b2-9f78-27f49125909c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:40:47 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXzSDWsav/A0a4
 v1/zwy6UL/REeqPTG0sSzInyJQgGxhcVzeCYayC6JKdSjDLzmL6Z0dYPI6BkmsJPdzDa9rzGFdp
 KqFo9nqF+hFTJqrw7k2UjatL0jCDM7gX2PefFRasV/XJ3oBcZ03AEhbmn+3eiKx1X1zqM/zSzrX
 ddtKYvnHzGvOIjYvNbHaf8wJMYe224++9J8+iYf2nbsLr8iTYDGOQdigcnfJAN+g5jSvs7JTKu2
 awnJ/fWqObNUatsiCOP2qzmurmPb0oiVnmrRbO/mxqTER+keg2aPIacPt8djthiuYtc4owD9s+C
 O8JVNbUynrh75/SzENDvJUsYcmfq5YV3QluWxroCxdxOha6C9lPaFPWQaPqiYlw0TsiRMBl+VL0
 hxPjhhLfP2kXi1DV9CB6q+JM/JfKKLkI1M47TKIMrHiTbgw53gHRFC2PbmaC1f6HTVcTA+4K9Y6
 4ulMfR8jz/+ZN/49mzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXx5+5p3oeNTYK
 Tk/YGNAaewCdpcjbQEr5gP8Utx4mdrI+s9s48/bIf/mPgdKNCk0F/ufXktGbERrkHH9piAH93ee
 IyJZTouHE0X7D2uPOqq9mHomq4o6GH4=
X-Proofpoint-GUID: cS2xWFtEsyvkr7WNTUyo28L6482zQTrB
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9e835 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20IFmG_dcDsSQBPH43QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cS2xWFtEsyvkr7WNTUyo28L6482zQTrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add PCS-level drive level tables for the Glymur (V8) DP PHY:
> - qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
> - qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
> - qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
>  HBR/RBR

[...]

> +/* HBR3 & HBR2: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */

These comments are a bit superfluous

[...]

> +	/* PCS-level drive level tables (v8 / Glymur) */
> +	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
> +	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];

Why can't we reuse the existing fields?

Konrad
