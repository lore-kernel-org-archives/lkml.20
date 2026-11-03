Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730345;
	b=FYH7awYjoN0q9p6byb2keN8iR+q/ff8N53ep671is/E7I/VJsC1lwG9RHQJajWVbg4jc
	 Ypwq0KZJRi3k1jI4DhaccPh5M51TtUSxqvKA4YXm0oaEiIFhadwaP6bpxNLnmtxLIXCuQ
	 S/tgHgnLaYw8yJG9v/r+7M8l1R0jZkg35sSxauRVjw44rnOcBOGnTrFlMzThyPJSXHUf2
	 tJFI4DicbnS3RkVxFh178fiIZKGEq6NdugMI+4CaLyTlZa7/eRzzGDJSZNsqD1es57jpc
	 k07oNcuo0oXyM+saMLhOE8GBR6MqnTk6K5S+159N1dSjYNqhp1YXFDXt3bVEHXjIS/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
	b=WdJn088F6Ncu3TrLLYYvPl6SGDHXnu50+9bW0P5eKAkwPbbtnYbO8+X18i8WXr+cja1k
	 pBuunjQDs43ztVBHWzHjPUCbsOGyrQr939bz1b8uv3Es4IeZO34xPG+zeI2r6spYa5sV5
	 OOOz5trATU9yBj7GOqJJRwjhQ9r0VguQUPh2wzNtjEL4sWGQXyJzJJTqMAtQ6nVs4IYvL
	 PCnrRBelbFstGeQAVletZcM86QDvfgQ4t5/c4Gda1U48aNE0wxqr6kspT4kwuFIyqMqhO
	 Tnus32btUgFVuwq0dKa0+GUWINaUT18XcHVEbfp/jqlWc/hOTFjKBJ8tb4EkAhYLV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBNpcd46;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YdU+kBZq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A368A606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A368A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBNpcd46;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YdU+kBZq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPQ183518575
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=; b=WBNpcd46dTWj1jQI
	ue4Od341ZIwYNIcE5jT5ZW1L+CK7vBaVe37HmFbqbmPiU5rzfrsCLRtSvL+oYa9j
	D2x8RJFZ1IHrTE2cK/l/Zf2TDw6O+J9Pu6CktyfPFBppLmcFX+VYiK3O/J5rqhPZ
	DdZr4ZBCOSL1ERM6Ati1iuOT0ZBg/K+hf5MoYKun5NiED65othJk1cOzN2YmteL+
	6yLHRZt+LWgQThiqi5nXk3aYFKykue5wfCJGmOIeNA+TUeIlqDCtug/SW1GG0lWN
	kQiNt0jqayGfMtx3aSXr4Mo3PoPh3mecdV+5dWxAkjLSppr+RxL2ABNvqlOv9nV1
	neHakQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyph1gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:25:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso12036262eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793730342; x=1794335142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
        b=YdU+kBZqMFs8laiF9aAtGTlYQDaGmuzmWoW6uwXzIFr+G4qLiBfrIHM83UJOHnNo5f
         a5LNeRBabM0vGc33To7x8tKYKKqqr3u8DtFWUor44TK1ByKYupTJHAM026idZt6O3WOq
         dBCcDMgm45nK23/hKKrxAC83IvkNLSV6w0vMVkTz/x2BIftB8yFhNVkCgvueACQGJQib
         d/fGOxXhx0YD6so16K9cMl98QpEl9uGhfZKwfX5Zq8hpvwz9+VPvfaL2F7j17IIbsfQ0
         7qmvQB6BSs1fK/R83Wz7lqF65PemHXY5CSWmRYmc4I9bAxOnRgWLpFNYiHny+f1XDbBL
         eedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730342; x=1794335142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
        b=Ps5g1N+xjDXBMcymYrnnYLB23y76LQpblTfqmGn7u/eurMWBmbMNoYbIY9LNP/sXyu
         8oGAkJKB6Gh3GWKGpttDrKDL2Kz5585SE4Kj3fvijuitLKTXzIepV5YcjUmGLLUi7BBh
         k/hY5QjolJa2jPe3xPsAeht6d+ClV/MbeGDG9Bu+6lf3mHkfS003TORuAe1L+cVTB3wK
         3TUHfuGexr0hVxkZJX+4YjW7RtLhLRBpV2R8LrinlpzgnRDaTuKdXMIt1m+AKrtVOTLX
         FgbMNIkM5JyiR9jFMJ4+kSEC2rHL2r46Q3mvkHprpb04SoXLgZ7rEPzznC3CAsot4zJE
         uuPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3tCe/aS5L2Pr+p3WGHtvlO5KWsc1QGnYKiZj+eVBUBG56alV0CY3NSHXa2A0+DSgAaKsOqw+DhnDsUUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QScOLjAnhIXRiIvOTaNE1CsVCZBg5m+/FJSWdaovlmsmWbyF9
	egxN1VJu1hKedudn+B5LQ9c6wHpPsxJk7gBHWm/NUxPaYkg9IsMwdA3HLWsuwB1yArlOVu0J5PD
	sH3MyyxaS1mKKzJ1BhmFOwumUvgQ19FW+lPkVUZO7pKdp5nLVpwET8QtWUinRbY7MAIE=
X-Gm-Gg: AYBFou07ojLoTmjkORF9NwmOcj6U060ul1+gbdBTCKQgo4NEQ3GOC+e4r41iZlQmRs0
	Wed6YjlyCWtoNjxopGK81uGIwzsPzk8Ntz1Uxg9bfujVC7dyubpHCtfDEIFDdKrpcjzDDdJsAt/
	otdajcSWDuG1fHaI8M51VRdGdQ+hfwWrIlrA4xvlbhkLW8C9Zc/+5O6gMR9Hd9+OeYh3c9z6MjC
	/SL8b68eOiwvCOgbnL/XRqCmxMqop9lRZeCsh7BPrAM1N0LcsNfxfAkHpZg9/+HWbCqI9taTke2
	tURmTRtld05JO9c3M3sx4OTXBHPhYygR1dlCqoKWBVIPkMVG3XdSTYsHEnpnbcv8WxlDu7pAS1O
	APL7lJ83nWRPJNeLl4fIL0t0s/DUL2WalQ4xrGnjky3O54mpSgYBOSkhLecmfKOm0CP5jyfc7Kw
	PZ
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr19146164eec.2.1793730342298;
        Tue, 03 Nov 2026 10:25:42 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr19146127eec.2.1793730341766;
        Tue, 03 Nov 2026 10:25:41 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm51979568eec.7.2026.11.03.10.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:25:41 -0800 (PST)
Message-ID: <a30d7d12-9cbf-4920-b4dd-d9791149b6c9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 23:55:34 +0530
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
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
To: Christian Cortner <ccortner@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfXzDOKvnPdtzsa
 DTrhsXIvIPn9KKXcMe3WC3yxBTvJioBOOFwHo9IH+Eku6gT7P36K8ZG10Vq6+WgkvLRtPpVStCN
 O7R/yPjiF0HKCq4hBa/2uqoOFoFy+A4=
X-Proofpoint-ORIG-GUID: x2fcvixU5gxiW2y55_BvEFNYDpvJccPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX7vow8z1rMqNJ
 GCfR3mDEgjpI9ftUNgdv9UpadIvec98uZXgJ8a6W1fXX+vdEPcgiguhpV29VMeqS2uQ2/6bWSD3
 +JFTMUA0xV9eghU4Dk7gTMLXlDwENBpPTa/Z9eAdQeLtmrJL94eHUtr4OuFlc37olO3jMqkAdnK
 ofJAzk+rgtptMfYW8pW+Ow2XFly3fKuvxp5Dz7hdDfWqMblBacx8wdJyVBgQJlIRRjL1WnF/gpw
 wKgWQhkUbM5aoRaWWlMyILvbh3eSXwD57RTosT9XmTOofGNQOI1G7B+pQUKmg1e8fFOYi1IDcsC
 KIO205ygeNcZwdWZF0PH6TxV9xk21RkE/FH6rAehaH1Mqnba2VbaSgTTfDJOQ98yclNudCfGV7K
 3rhIzRdjJ317QJ7uLcZwQxuKKaOdRDbIyhZ3VoAR/u0QiHXM/fxtfedrwt0OqydEejnRv/y+Ahs
 M1s08imsutsSQlwV1DQ==
X-Proofpoint-GUID: x2fcvixU5gxiW2y55_BvEFNYDpvJccPl
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea2727 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=4afNKWI_y86-DhA6_rsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030073



On 31-10-2026 21:54, Christian Cortner wrote:
> For 1-3:
> 
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
> 
> With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
> CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
> through libcamera. The A16 node is the CRD wiring with ov02c10;
> happy to share it.

Hi Christian,

Thanks a lot for testing this.

It would be great if you could share the A16 camera node patch. I can
either include it in my series, or you can post it separately as a
follow-up patch depending on this series, whichever you prefer.
-- 
Regards,
Nihal Kumar Gupta

