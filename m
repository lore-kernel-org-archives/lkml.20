Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202040;
	b=b9vu4axIQced3/Cc3jZXGFkNpKKExWXkwJ0I8X6F2ZATNzkL6OTa1Klt59zwLM0uZ7SH
	 LNx1QdOuuU33Z5j2DHKt4hdrQ7JN/Nv72vocM+nUrFTPjlrn4yGw4emsD4y7d3WalVqlL
	 ykBgGvVQTEoJY1tVm1Tnml1Rf9Pn4pYr8POUqQfqHDl8epIFulWYEKJpJZuxxVZts4CDI
	 a03N8e33BplHzUcN7xFB9wwIp3e7AiSrwUpkw7RMdIzJtRlCIklFxichE1cv0arfEofrz
	 ApdBnWSn2XDUnbOMbKRS0Sl+4ahkRckHyHHua7CC+JM5oB/Ycu0iOiGpwurFOQciebA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
	b=QzwIPTo1mZmpihU5DabPuH/jbP6B/AmF6eHCh7hg8J47S0lckGWaNfDednumuwr7jbTk
	 EuMk+/sAGI0a9B4QPv1e54gwVqLTPcRfWm8/4QiwMj/3NIAEzUaJ9jXB9UFFvfzMEBHHD
	 nI3jgs2YKd5BjIMoVysl6EEQWzgqEZE2Q9s2OOG92zrwZd2BZoSgyIeOQwnHIc/gTtZAF
	 Nlkcdyf22xrMbdCyPM5bkeH/YGu+XbNK59OfT5HOZXHQJ1fLu14Tjbog0IcLW40OxFPr8
	 z1gDYK0TFupUjxJMIUT79AbvpT/mXts+qU7SUA43G3Ydjx+BvFLLi4+1m91Q/BgLBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgeVx0VL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+ddBu1M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E1606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4E1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgeVx0VL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+ddBu1M
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAEPQ2001647
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=; b=PgeVx0VLO8vCzUwF
	tMyB3jGpL9zIaslqt9um98HscVyltNYVrwW0dilEmNtKsTnJt62+cABWgcPbPmJo
	AL3MyXGHXLp6wMPZ8tyldAQ1hr0sCI0EXMdYc45CxmoQRN4XZN2zpmU42V3F9+bN
	320HdnEW6CZTKekbDavuLpIRS5OZPdA23aesX5ZmtRnzgB1PsSa7gpkerev7PZL4
	xF1MBg5YzqAic3+6elLEGqqatEMNOk2Mm4HIz/TKqnW9yfV4jNYx8qk8My3PnSM9
	WTAWEzs4hDR+lxgab09+qMpXVDQjdPHauknYK36WJQHTumyuDnvlwA6tQALKvx58
	I6O4Qg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sr58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:40:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so215946485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202038; x=1793806838; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
        b=a+ddBu1MXZQ0eIed2kPyglRdXFMyk1XRdjz5WpbC1TOBrEvkF797E0SuyJxKyoytw1
         jpR7D4X/1NETv41nLSYzuYBRVSyroejKWdQp4i+ZKwbAWyLDfIGgqSFK/NXvQmKDpDtK
         qshrakXiMCQ/jbZY0d0ZaWuYY82HTKsS25ZBguoAZwd0PpcWtFcNKV7d0AScbWZsDn3H
         fRNGr3O9FVC76EABQ0dxxoIqHGU2HpkZKcfTE7AnhjzrGWVh854HdD8UMFJxgt3qE/qk
         t9dZIJsI+J8j8R7aNBSrNkGqSD+sj3FDerXTNi8ouD73IwiKlC9SDpCiNRhyLgFwHcmH
         LcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202038; x=1793806838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
        b=h4wDOICDJezmscds70i4Bj9/iGBPDnCB5dV8z8v+D02Unb5qCLJlDSIlzsVCCGh2pM
         JsqqEYmUI6vRSie4cKa3WvnrqfuPcOFgJss22c7LDqstjuU8QtFzrVtsEWqt0NicGaaR
         cKuhmPolErfoyS/9TPO6kPdXGwnW4QR5/4cf3O38WR5KSiygEctnUsOh+eFW+1cLtVJz
         z7F6DL+ttpukg1YOVK3WRCf+zxn6ffrC9YNcDnYp1brwyaKlz30UiVOSk8cJ52nAbZEE
         H5853HsD0ozmpm8S7uwmdSCVUYZA7lON538MAKV8PkWYpulyDmUXHwlNxk4w5+QlyrHm
         nYsA==
X-Forwarded-Encrypted: i=1; AKwUvByMPIVoPOb0P8Kbc6BfnlcMVDPIGa/l+nWk4upeGjL59gOu3NstOf9tZoqJc8kZdF1SfEvFDkDdQKgpoks=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfW0YIue11QKnuRtNg5QPiOmfmWxN428Vn91RahV8qvXe7Cfa2
	OMNRZWZXc8bOQSmkHg+n8LV/jt5unKitePZUy63q3gTH73fAx7y4JF4+zv39saf9HZAnZkYM0Yb
	f/qy7Z1NeHFLvYRB7kbLhTc7Xi3AlPwO7/1+Y7IVNnssGd9SfYDeUCIBd+cHOFwiFjg0=
X-Gm-Gg: AYBFou2r6rqYVRDr/X8q5dcsPW6hrvqkmRxJC1WtgqPmmsnYD84JNfmxJ7Vg92G6Ier
	NIkf1UxNaShtAucH7sj9U4Vv00XqLd4CYxE9U6Sembntmu1P7HYWEMoqjuzCIFQusouxaTqAhkK
	Gmp5yHr10WjF8Nsx48YRs18+bse7EOkL5SVe61JOzuTYAJllOvr7QTc+q6NIK1g42SPE+auA1xA
	/N8LYFoCKEOhFBylwFe9IUBeQfXAqQz2te2YnIWIVl1oAf92C4QQlMZZuxOdO/Y4Dc1ArFOhY7a
	/ejNzloraiDCLUC1BJzN0Hu6AVElm8KEQs8U52veY9wqP/+NF7qFZwJOJMzMSMIlMRZxuYQThpK
	XQzsCAYCiJDli95kbo6XMGsJzs2CkVqp+MPabYCArQ9stZuCsozya1NHa4UkGa4hUxQ==
X-Received: by 2002:a05:620a:4723:b0:943:eb21:cf25 with SMTP id af79cd13be357-944089436bcmr392008385a.12.1793202038360;
        Wed, 28 Oct 2026 08:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4723:b0:943:eb21:cf25 with SMTP id af79cd13be357-944089436bcmr392002285a.12.1793202037535;
        Wed, 28 Oct 2026 08:40:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f41895fsm674315e9.5.2026.10.28.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:40:36 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:40:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?S=C3=A9rgio?= Ferreira <ferreira@se-rg.io>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add
 PWM backlight
Message-ID: <wb3fxm5mb6jcmf3cr2djmp7wkjuowhcdjjb5safy7xymq36wkw@qsrlcebvxf5p>
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae21777 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6K7-PZ8FUrUA4GMtlBgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: E6LFSYCESVbKefqCRisDzO0fpFeT9FVv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX3fYSxV5Ov1lK
 8i0TF8okBXAt5u1RWWNs2YmKJ4UUcq5go33asktsAwlT5p7SVzNS16+HxFM+1NjJqkEIS5MsEQl
 BvT/v6VdBdw4i/P1kv9xmT+Hlcq5HZM=
X-Proofpoint-ORIG-GUID: E6LFSYCESVbKefqCRisDzO0fpFeT9FVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX3CAYFew5qW/N
 iAmB1wjJsctuGY9dRCeXkMst2E93oMjzBjLNeT6TajGs0BS9QI2QhZO0jTp5NspD7Nt7U9g0JtZ
 LZL5qpb2EPie1LNeFlHK1Yx6EZ9LplVtRvdkFpNRbbx7syHIWJa4I6nxpkFwmGXC3nDE3IGXaui
 NhXng5srVyduYwtoZGoYVt5WiqIMcob/QkJBmRF370I1dFowth0ZEyAYbsX6N8euC8CmERXTuzN
 9a0dnk8C1DGr0cUm7oQ/0w5iRwvwljAG0vXogomciI9wOgfJPDrylSxadaRMOdShFc4M4GwdttF
 +77U3hlzXw9ih8SRAmfLaWal+Sfd6CNkOTHagw0riYn8IhrVMRy2rqPTvv6Q2qcIV6g8BWCRDvV
 CG74dBx5qPt/xvvK+DZXRli/uI+4s72lfK2KWdDsmRRLi3IIoGuwSoFyqp4e2J2R/cHt3FeECr8
 0D+qd64mLtxpK/N6vSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-25 08:51:26, Sérgio Ferreira wrote:
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
> 
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
> 
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
> 
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
> 
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
> 
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
> 
> Assisted-by: LLM
> Signed-off-by: Sérgio Ferreira <ferreira@se-rg.io>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
