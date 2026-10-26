Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007913;
	b=dsqaGpw8rDK4rdMMHnYkTGZJARjNmlneAn/ddYNA8x886nh5J4daOQuhQXZKf9GWcMqR
	 NA4x2W7QU4NRw+SSWhS4WpBxVY+iyA9PPk0tdD0Mr+9bxX21ucP7CmQn3pHuBHuOwSYJJ
	 I4qG0gEajOoUxBI8y//x2SnZ/6rxY6VSklW9fZ9QdvsF7oFHSPjBxAjRPgjPVZwToaz4a
	 hWSLYyMwD84g7PVvm7YAv9swZnnC+se/2DditFLVxRzSP/DkXuj2f2d4hh/0mwh81eefm
	 U937QWE6pRpkmfFHiuTz9MNIjGhkq+eYnkevDbIGV37JpNZgW38Spb3BbRxkLuU5ZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lO0MFluqBf0mYNkf9/R5BtgFlYo1UJ32JSCP8hcoe5o=;
	b=kkYJY9n+kLadTnO+3mTHqGoZbdZnaBgBn/PEFzaL5etazgxLd+zZrMS9RD/j468583pd
	 +VkMTBJR0wSAEycFO47Hn59yFgknrici/zV53+ToMdpXBKcRZROKWtlQAe3AWK0q/3bH3
	 SdACVEeYQuq/y0/w0TQQ6sWo5VGKW1xLbI0NLUhDJV0/gO6GmWResP8Hj0vkA4BPetLc+
	 MV6T30ruOPTWnO02aM/3Mdm9uZsPTD6q8c/HS8vUjWxRsDnw2VK/MxMojIHU50/4iq4JA
	 iZmfQIwKZdtsTVr3saDyBffH5rLGZB3yaFGg5rUtZjxPuCYydwzS916VwzU8e9jc+KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP6sGin6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoYRFuGj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DC8606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8DC8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP6sGin6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoYRFuGj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPju2222508
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lO0MFluqBf0mYNkf9/R5BtgFlYo1UJ32JSCP8hcoe5o=; b=CP6sGin675or+lEO
	X+3bMtYFNK4WKRtl+nYdBSnL9Sdad5BkSmRaERFJPOx9lcWlKONg/UKWkDr5DpGa
	C/3PBJo3k+nlFB27NduTRCnzEERKiSL6RWLK3dJP3ekqZAxSn7ZPqPSQ71pE/lma
	Aj34eLat5EdTAOqapq30V1JfWqKRtGXFCcixn0YNrzw1NekUrti7OoDzoqWG9znk
	0rtjZJuRjdlu6NOcmLpMAacRIGS2QkCI7VeKxAVZQY6j1LFhYrg2XYw7t2ngjmVt
	57u4PpCLozahYjufmlkzSDtO6gQ/KajJSEpo0k+uGYg+ZUn74q9ay5cArQJthvTN
	vi/mWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9h76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:45:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so44345685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007911; x=1793612711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lO0MFluqBf0mYNkf9/R5BtgFlYo1UJ32JSCP8hcoe5o=;
        b=PoYRFuGjBDxZlCb36BUj535gsToYx52TsVX6StcjuWTmyqfjFhVznJEe7N/8Ex8QcJ
         SPcgIQXYnrYiAfALkfR8h9gg+TtwK2oosaCxzkGhb4BteynyPicLNX6v4k64FNDm2g2q
         YIyhkLSOJPdJUhvuuSmyNE3gcCS7itowOz2GQiRmvuGlD75ogXF/RbfBK28NSTjRDTSB
         NstZCawgHmLn8w8vvIjBcVCMOJXCuW1FhDl8FfKiWeVdt7EWd56yS3t0pJ4DvtHX8iFH
         LDJUC71SkFJBcleqNepcXHYT3vKtGG6eUvW42LBE94puejtzmsOvPL0TDdwFeOtzQrT2
         JBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007911; x=1793612711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lO0MFluqBf0mYNkf9/R5BtgFlYo1UJ32JSCP8hcoe5o=;
        b=jL/1Lbo1DUMr1XiF8oK72vaflrgh/qllDo1FjlkQVJR2kSCtpghCVTYCXXlE3bZvDe
         r5XaLbttZcbm26K6qvUhQ0dI/pE88daeeLMme+qNw31DT1/9ge5EwFdnS6qX8y0Ffstt
         wTxa+yJocyk2odQTGNoqMmQ6FARyeN6Vg9ficaJs6uR624oVwqpV3yYdwb0ModGjojKR
         oCqxIdYQzRxaPGL1eLX0FvplJTxWL7rSSRk0iC88xci30TbWPlFCSG0DDqgp9fTfZEKB
         hbSbQK849ejgrPeK5Zp5eQaNkOClKUWemUW/55gQ49Lpj7+g4MxNpcGIj3pG4ONqimTM
         H8NA==
X-Forwarded-Encrypted: i=1; AKwUvBygFws/u5LWjGMJgHidgw2ONVwJBTEMkOOJEODbSV7EqkQtcA9s+52/bWrIObfTy0pxQp5dnSpZ86PivkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjEh1XUkunjqf9hJDSQe53pL0NeKXdp7PQQcKOzG5IiFlXGzuF
	7yWTR6FBVx572E3Yjdn7lAxhNJEGP4wBscGK8NWeQYBtWJNXVbFNDxroGJ5Ndsyvin/JCvxX0Dn
	/Xm+ACwTOGz8iOwzF7J53yUEJfF7HwpsUD+IMeV10Qv6sTecXFQBj/FR9RUSaUpksoAM=
X-Gm-Gg: AYBFou0d7H4Dl7sxs4OdgYa8AFyTmfq5ji1rXdmnMUZ9k1vtu+UXjPr9vYnKuKiuT5l
	nVuAiybKzdC5ob6nQGSwmt6r/j1UioAP448L0ADPHsue0DUZGOqbGVovkXabuxhPjy2qQKiCi9c
	yOHbCEY4ExZGuXxOR3wjSTWZ+BCygTLPq0njJTIb5rM5V8MvNB5Bt15Y1DmfMhz6qwnGr7LQn1a
	xNI+cRpYZIjHxhtew/Zrh16IaBa2mB6kMQlV9+v0Ui/y0+21GZbuTmKw7LjqjLbbuWHwew9JPe+
	Uvdd2ZRkepkaPjDqhUxI0OgczTCd4pDqu6X0/JkevYmVRqw/pf3judmYFgBW65t9DxTzuUOShVW
	BsQYDiFkNKjTtXify0nQS/w==
X-Received: by 2002:a05:620a:a181:20b0:936:2f59:dfe4 with SMTP id af79cd13be357-940ef67bc89mr925204985a.0.1793007910997;
        Mon, 26 Oct 2026 02:45:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a181:20b0:936:2f59:dfe4 with SMTP id af79cd13be357-940ef67bc89mr925201485a.0.1793007910500;
        Mon, 26 Oct 2026 02:45:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd649997sm296085066b.42.2026.10.26.02.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:45:09 -0700 (PDT)
Message-ID: <f502a9c8-67d4-47a2-b855-9a6bab4356ac@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:45:06 +0100
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
Subject: Re: [PATCH v3 14/14] drm/msm: drop the runtime PM flags from the KMS
 teardown
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-14-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-14-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j7M9bOMlHEoRf64-voFs4kKFSdyjAzVC
X-Proofpoint-GUID: j7M9bOMlHEoRf64-voFs4kKFSdyjAzVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX7YNE25M0LXX2
 52gY0B1TJ9vPZIT9fVEtYrTLVx/WKyDtdoPBj+lw8XhP6Kvc2rWcjpYoQzDktyc9MLIhHf6Rb4L
 4HGTARyMJ5C9E0gWC5iic58bDup9qmTUKkAY42do2wwcMC83ngXD4pdFhcoAP12naXjMsQOIWzN
 URLIfXvVAK0egGQbz9clfwbHIWB5/dN4LrnlBPGoMNAAfcOld9Ffxae8WXc3scybCTrs52Zyl+5
 pSWMCHgTGMnXClrirEpxivwdrQgemtYVtKxMmH+Oh6ucMhtE79wFq6wiZXu2SyCktcRvLNfzp1U
 bFL8FFhF7Ujqz3fkiRcZKLris+vHFGUr2wfuO//nmCH3jXh0r3zQx1u/yM2iIbqagPqN6Gr4X7K
 Ir1AaBFsM117dAxv6tfSNmjCpCtNwlpRrAJs7Ywu6TParaBJgudrpzOlVziVITscMktrnHQetsv
 9v2AfEA8l59SAtwQf0A==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf2127 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PRaoJ6uHHRdXhmLcd8sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX5v2Agszihwh/
 mxs4WARpYdJhXvqY5XO2JmbE+ratBCfEdTPKH9DO17ky7CzDwEMg6+cozBaaEgSpcj+LYwrdCEW
 jxbBcD9O0bAbcr24OAv5GSb/OFaNsP0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> The DPU, MDP4 and MDP5 drivers track whether they have enabled runtime PM,
> and MDP4 whether it has pinned its blank cursor, so that ->destroy() can
> tear down a KMS whose init failed half way. ->destroy() now only runs for
> a KMS which was initialised successfully, where both are always true.
> 
> Drop the flags and the checks.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
