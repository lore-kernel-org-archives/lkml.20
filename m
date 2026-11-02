Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626711;
	b=SZVer63j6hmAhU+E8UgkOvWq/5WuvuLcv2JRhuFY1J+XXxno6ThsxQPK+YbxoGPZofCq
	 cXVDgCt5Pt2Xyv49hKMRTAxJnpUMOkcBfApXYyL4mfpr+Qz3aL8NGcOqdC+uWnwNcTSrP
	 +Fy9iK/qMEuLb0vOfgUctACXYrm2gwomjGyypyra90Z1tf8ueHA7KY+SBpDlw7z4s5t0j
	 2dhWY1pSa6q8EgmrKqDlO1/huHK3krcf23Ah7rFPlgII0k2c/R+3uzinLzhAttBSrJTDe
	 OzbE1GJEvbRUSN8JD/SXPsA1nyLniTLCISuPymk8zL+Ls9hFX216djpXZ8/XUjmsG3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=;
	b=qIlciwaS3uU1Aty4hiy/WjgY5E7jq8T8AewhoGRtfH/clRxZpQl/9/j1EnxHmCXP0+g0
	 PuRdDb7ODIwnk2r82QsJIRQbaRZ3kpgJ4NpY57E1zhybLj6Bt6XBwtp6vouNW6BOvaw5T
	 ZvFSexOj8PmUcbzb87Qg6Ioad9gSGrirrWe9AcPET9H/l3cjdGlxO9NWQ0MG2prAYGyyU
	 BY4aFF1wZryNo0Fbw/Sq3jTOJQtZmJW/R15a+JTt9RthWut906dUgvU81P5H/1UFI9mHX
	 Xj9N+DIxQLYVWuWBds6wN5v+yzaa+AVzFqNVrwj6/O+6S7wt4xF2s1jybzC5goL52QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KMQLsu/d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mi7TfXCn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1F606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF1F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMQLsu/d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mi7TfXCn
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAHb82902177
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=; b=KMQLsu/dZ+9p+xSa
	RFz1+xEPMEHgJy+HNNzDUcWqwXvco0yHJXy1nCngbWDJo0QZeKwDGdvpBEX0Z7fX
	4CQLX4pRb/8S90Z1wag9ZwZPlbbpWsPJVsjKNivF1g7aJuP3ySaIQn7ZLigzmoNC
	hL9HVMok4zlU0HDNwN2C0ed8m6NAzdsuCVqeMEArqGlnmZpwgBdjx+vTO2hRXr3N
	bqWa4/4u1IzzhhnRwK/ZjFoLjzxU9PxmNVVVFbR57xWMAzZkfnBiYhuQlaObuX3b
	biaPJ3OBPTBKhwsul0hOS9mzC379i0yNuIL72FklOYCE4puOog7ln6A+dHs+mvRD
	x7FSuA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavghsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:38:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c10b8abe29so2453169137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626709; x=1794231509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=;
        b=Mi7TfXCnwNgz6/urgUY6Pxfug0qftuVxqHF3pJnlxvZJPZMtf049dekM9/DdFqKSOw
         CaU6nuXzZEn/WDuOXfF8+xnIgY+izpqYLLNaFIUqNVHh7q6POLPPwaBfgOdLLz7gyg9f
         AngnM3b/bFhSfQF/h8xsKr36YvPbysGBiKax7mN3y4sIOi7IrNpP4b3i0HzIvpDlpeSy
         emsXgctD9TMDYFgao1JGwZvEKvlFF/YIuRZdseOqTVbccBGylKy6J9bCF1v084KVaNyG
         cstKDpkKTupMRCZL+IWwvFilEsZMFqcqCuRulhra4LA/QnrpIdZxllJ3YJD1UjmF3ftf
         ahRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626709; x=1794231509;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=;
        b=Kq7sVVPSK4Zm0koDzcL6ti6WSD7WPFzhtEBFMkOgXoKNg12xuAZvMrpy/qo1eQtQ14
         pBLSoHcAfcH0PSv2QqgqxNeXXqx+vqdRLsf1sKFfnxBuvg3M33uzQSPmmJFl1D6nA8X9
         +fIkvQXyDhjckyTn4kY6RnL3/gOP3sxki1IeeC5/Oz5/42eCd1G3fA0Eeg6qEXhr3Fy4
         tlhzg3gjLDdmQqOWJjAAwAPnyMJOsI17ddXhM309YNukSM1b89S4alVTaBCLlmADGGuT
         HL5In8ZmCfVNyJEyePPM+TsShJM0+8DNL3cq/C2zJwQEpe0yH2ZDioL7Uz6hfwFo5H64
         e7lw==
X-Forwarded-Encrypted: i=1; AKwUvBz9OML+HFRm9y8AFp4Y536xomAGTQAhHpamUvB1KlPtdRj//rrz8gZul32pM+meG2BLPpVCma8XZATOe0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZZS2SSMDEI6yvtq2o4tpbjwBPmiuJ5HEtLTpLhucXLRMI9I7Y
	OIY+UyZs7b2hZ/IwwAxbCE2jaJi8NiZFAyBPuqWr6BbJLYP9nw82UfHkKz8k0LDpyyI9RNLc2og
	GwTmzfQy2Rns7O61pwzC1/s/AtC2NhKGiGNoZpAOSZtey0VOz6pJT8QEwRjEH2Ih8Y3g=
X-Gm-Gg: AYBFou0NzPF90te7U/JKE9nSN36YO3ApfWq6Tc8vmj9iKFz+OfPKuvOhJyMO5a3xGEv
	ECxqpcrFPUlu2b7PKocZg/z4419rZJB7iQQ/lGrl6mLabfaizp73Ss54BdAgO+GJorfsWVFpXVG
	SP8DEeRHj0nCCHkAIvnJSnG+P9ktgdOBg9z1T3xt28R32mg+lM+0xhTm8pUJdASDj2D1NB2JtXM
	Yt1vKMLvnuagBtYrlf8cel4TkPkraJYmUULpfLMwugZ4+Nek6YssrQqwwpBXz9xC0sCv/pfxDG5
	O50UzCtoHmgB1oZ0BeL1dDjW+kiWWmGoUVRKl6qBqcpKglE4WuxNw6fwOv+hs2qSrR4RGLtoAP3
	z6OoqGtIDco6vNU58pwQG2BX46W6/1yWd+0RtI+13IILv0mtZOSnVsPhDP4PMW7OU5VxHWrr5jF
	gR
X-Received: by 2002:a05:6102:f88:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d07262e924mr3971074137.12.1793626709133;
        Mon, 02 Nov 2026 05:38:29 -0800 (PST)
X-Received: by 2002:a05:6102:f88:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d07262e924mr3971063137.12.1793626708667;
        Mon, 02 Nov 2026 05:38:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm1194928f8f.5.2026.11.02.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:38:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mpc8xxx: Fix potential use-after-free of IRQ domain
Date: Mon,  2 Nov 2026 14:38:25 +0100
Message-ID: <179362670032.76770.9373132482307036196.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a4fec7fe970d6fc9135b488f57ba7e145b809359.1793377433.git.liguangshuo@mail.sdu.edu.cn>
References: <a4fec7fe970d6fc9135b488f57ba7e145b809359.1793377433.git.liguangshuo@mail.sdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX4I6K63zvGeHT
 oUUNpa7kBngpBZrFiw8ydCnGsSKN5tdO7i/BJfgTp9+4aGdG4VxvDXf+5NxTjOuyecH1ZstW3NG
 fhkOsGRmy+rm5/37ErzsH6AXRuTfwovjXC9SSKsKQCosQFF+MblEqarPqAWulmi614BNlPCgIzm
 qDJDVT8ABLX0F/+QcAtqe61KJwNhF7J5AticAyRvBIk1caJPQiI0rAR4LOUaiQIdJs0VpH83UOg
 iFIkHiEw2t2d3DmqGlZC+V40cgErwB1PqO68mdkcsavTgtnYIf9wjdikA7AY9/ZeLLhhT3ZH7zZ
 Vc6woZqkT8K/gRQ0z82v8+RaNavtjxuFpZ+FehOw8PLWWbMcC3QDxYLIRz92zMooPN5mD4evYBp
 qOtUNyKSVue7fsa4/fK4qGZWEpay70yQStODId/rsmWfqUph1hjmNcQJJ//c3Mv8FcpjfuJ1189
 xBeO88YdXMjAoSbQJtA==
X-Proofpoint-GUID: tngBC2sH8axHs1qj8TKF94XPdsMuqK5p
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae89255 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iSS-Be4OmSBwA7muS1YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXxkqzoUQYPyYM
 WLo4i7K529HkYwLAyHn89RPh8AyqOf4HKfP9KKWZiSUmGAXYYVRSQFSL3n+3mqH1Ks4PZ2nyJBw
 nW/xaTW/nW1rViDu5LCP9rTi2dC/8Dk=
X-Proofpoint-ORIG-GUID: tngBC2sH8axHs1qj8TKF94XPdsMuqK5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054


On Sat, 31 Oct 2026 21:05:41 +0800, Guangshuo Li wrote:
> GPIO chip cleanup can call the to_irq callback while releasing requested
> GPIOs. Removing the IRQ domain first leaves that callback using a freed
> domain, both on removal and after an IRQ request failure.
> 
> Register domain cleanup before GPIO chip registration so devres removes
> the chip before freeing the domain.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpc8xxx: Fix potential use-after-free of IRQ domain
      https://git.kernel.org/brgl/c/ede1a6a551d3728165b31b494bfaae73b328354e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
