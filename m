Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476508;
	b=wOGJ48zxJ/meBfU/aJeFkpczQvtdioWCNIV5bjSYbvN/8xstbyM2u4YUPLWEM57Ns6dg
	 Ie7sbOyYxYKV88O6U59IcDnnHDx1oghs11eI7VT55SCPasEoP02qIqLb2e843bRjjbKf5
	 npBmNhFsj2jn8Hm3d+ADwIHwqPax3IavQKVMT1l3hfrd1ByltxvIGhLo3FDJA+/xZSfYJ
	 sU+cGYL7ZSqH+W0+gxTrPVBQNr7/AJfTeUIlHBKj+vSyJg+EImszyN7mN0x5Ha5SatODD
	 oaAuK8QQzZFY8NNJ2P//vwPQ+JaPYxbHxoQCkT5PlhGUtCAnKy2O0PPRKTeG6T0N+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=;
	b=kVx7h5kVG6KaxbbQIRbrLIk5fzv8ZxX1JB3sqv6YgB5MhkGxrWZPdHZQQyBvM0qQxJ9J
	 FQuCdJfERS/GvTE9oM4SfoNcYcj2pD3LDU7Fq7UpusDvrBwtIQ+Spa6aXgH2bECL6kzV5
	 k3G0Nj2XTPTD1shdYaUMPGRx8Bu5dUHJVQ7tgEm8lPuGIhK+mohcGe1AobNeguZcHk2Ky
	 Hjc549e6axwmRHvyruza8DI4vbAIwskK0/UHZkKD8QHfZxCTZ51vO9cASwOYGFZMq/80+
	 13sa7Kzdg4MGzCHu40XKdQT/aPdB0yJK9KQxeSNqTGFktMv6F8e8a702Whclq7j+YoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVBD8bQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5puDmyV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C7606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1C7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVBD8bQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5puDmyV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t5qi185780
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=; b=fNVBD8bQd1vvR7NG
	ppkIpg/b7chIA73L9syfO1/5Fhhutg+6z5XNeHAL4ME/Qcw67MHjmq8WUk/IAsT6
	hWOcRcXkVEeVxDPX0wf/JniBKbO7WvKyyFJjxHr4v9ABvk6HhSRBOXpDzgNQSysB
	wiD+DX2y0lvfWn4ugW3+wCMmg+1aeMMJ7Pz4TIYnY0MUIOQIjVSYtUtG8r1OrRhm
	dzAdp/dHOTaJ4e0U9Uk8NBehdjRssbp8d6V4ySQB2GYAPZY/c1IUtdUsp/A9MK6E
	N4WzIe1YFW/LCEWBBJ+FX5X5n3CTevWmeaLdy/YDz0mj5LIpLCv6f12Q1VT4+8J4
	jlbBiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ns3pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:08:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso66559485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476507; x=1793081307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=;
        b=I5puDmyVz8JAKxCfWnfUSJC0IX9AdnHiAJKPKn0BDT/leodrNUIeldcU4DM4rwbuxo
         iPmJnFXCePIJx08ldlRDlfJVMiqcgafDbo1JvpbdCvIZpp/+gIfEmLWX6APhcmDiZTDR
         sdXbnyGVMXXxcVwlrJUX5elyWaH1qT+cTnaxmUPJOiHwzG30bXEk8Dl8CFLG+sYzYXc7
         A2rGxGGtK4+3b+jfOyUU/l79/8RoMDj0EqfucXYlB0HbPoXeZA0oz46T22IWDEESDu4w
         UhQ009KUJZQDGbMgA31sYrgDe5mKNP2L2QZ4Rmv+QI2jGvi1RTWWm3UHa1WMLC8VGCGc
         +2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476507; x=1793081307;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=;
        b=e+Zv3vHOroYEwtSoCWBDaqwN8WMJlntZFE4b1Nkdd0UOOLVtB4OA6sC36vF8RqZHF5
         WO4SbxV6a9Rt1PES6PrRJsTGA07UWGBqiAUyNKsSSI5BJ3g7YVdEMHuHeMmOJ5df/Ypc
         amCfc9r5akLMVybkv369K5YkXZOk0OaMDa8ceTSMEID4UGacpQMkUkjYy44VGvmAB8me
         +Vns4+CRPnoZ7YQkFd1gM2FCR1+cAO2jj8YJmd/jyWKlvPmh2xmQzD05R6xHAFyFfVoA
         /3lKuYb2Ydkw66u4PsYxy2Z2cG1UTYiJ95uWy7sAwVXdnMP4gjTmCZEP3+b1lVwW/9MS
         a6VA==
X-Forwarded-Encrypted: i=1; AKwUvBxUFH82MKh7Kvbc2ZNQxLHy0+72kUZMBht3MNMLDvN7YlDUguJnEeY+hWPDbDz5IzxIzhbnDHgNC0feLSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAbdlNly312XOQ+EkjlMyZX+gG7P0ZWvUc5ki5AGATi88900WD
	bWXLted2YvRFgVGk5Ck1gIl6e450tGbO3+Sof5eGeZOtpE8hIZXbsHj3eULRSazKDskd7UCaTRp
	fFWD9TwDg71iiNy08IQLH5X0q6idpc9fFPJRacyRgjPVizOeoXHv9kN+Sq0c9g9jH//s=
X-Gm-Gg: AYBFou2txnOax6Pt1YccfsMNOmn0Lpf78/P/Hodu93Ft5KW0d/h1ZNl+Ht5G4QYqIDJ
	qWfXl9cIiG/5aT+HPDCrcZ63TSeB4pwnTwMsVLad3PsMqXOtUx0fytmltyq9WXqwEETfVet9ptO
	uocCwVIlyIYSNuyS4GX6Bmt7RgpjboH2Z6u5KD6FATpaW/0GJwC5FMtNTrKIxGGKxAgnIpsb31H
	JQrWsWhH7N34h+yIb+2HCdxh9lraRQGl8g3OBroePyWJAD+R+Jk2ETVVEJNNgxj8vyrSBAqXV2V
	nlCof4aHHbHUZWcVoCFSZ3XS0dTMMRdwxwGaP2hjc1P1wWsuIMrhxYJ1lu/zdhIqjapp60rHgXQ
	eOogUitfberRB8CeVXAFjAQ==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1911840485a.3.1792476506801;
        Mon, 19 Oct 2026 23:08:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1911836485a.3.1792476506224;
        Mon, 19 Oct 2026 23:08:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3cd39ec18sm2243135a12.16.2026.10.19.23.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:08:25 -0700 (PDT)
Message-ID: <74dc9718-9911-4a13-9e10-0c2932007a4a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:08:22 +0200
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
Subject: Re: [PATCH 3/3] regulator: qcom_spmi: don't take a sleeping lock in
 the SAW IPI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
 <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OrvyywGi1kgNhCgxtW1saWhIO8dOguzc
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad7055b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zBMmP5lLP3iSaWE8ja4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OrvyywGi1kgNhCgxtW1saWhIO8dOguzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX53pztKZZe6dr
 9AM5JYq3u7DwOHs5TueU2UzGEQg7N442kydBpUrISIEWHtHkE+X3ylOUsJDV+jS/3Z6pEkxVf9a
 EpkT73R5fQJJbk0ks3G3boRyaVKr2r45A6YFXoPKtZkEa8Mf+9UuUqcp399HMiqwBDK1J0uaQoL
 BRKHeJpD4a2fUqhKqvduYdMZEYurAp8cQ3VgsNIS/kxt4operoQp+gznh7/DEeBa9TX3uIaCNEr
 VaPej60xgpkr73bmgYgi9+oG2CAf0fzp5pQHHTiGLbtS+QoShCcTPl86OmVwfcxde9QlWdbi8n9
 O3dMcb3PoiC/tyf3VubW1yQK7ouXDVCHUYs7lvC6RlXo3Yt32tAyByNwVfLGRaP3gyWn0jq9ViA
 p9wCfjA7BMZUnhq4O0fjjxL1boLlTV3Q9WHfeJrt4Z9VYiR/KfqLdzutyLApoN2ZUiBbz+wj6yi
 gebj+F6DUYyGl6oxGfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfXzF22JhLsj4px
 KMMWBI9LTEZbZYG4KS6w1iZyL/7vbRLNIJWMvVo0x0OVeZdiVoVX4CH/R9rC/3D5dMdYBy566rU
 yNTZZbuGxuU1Z10mCLwGIzwV1pXsr04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

On 10/19/26 4:39 PM, Dmitry Baryshkov wrote:
> The SAW voltage change runs on CPU 0 from an IPI, but it reaches the SAW
> registers through the syscon regmap, which is protected by a spinlock_t.
> That is a sleeping lock on PREEMPT_RT, and lockdep complains as soon as
> VDD_APCC actually changes voltage:

The SAW handling barely belongs in that driver to be honest.. but
separating it out would make a mess out of sharing the of_node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
