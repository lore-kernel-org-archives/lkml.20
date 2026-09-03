Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64C3B5318
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462182; cv=none; b=dGlZvewdc395NwEW8kj2MvSPuYQ2fiEVhLtentpp2kGzDe5dOqHACQbPnEXsLBtA4u0r2AMAsNYmOYzGC41kZ5xCPd4a7dnHbfLDD74Z94xGE54E+hbSzU2CaTHwmyl1Tz0onRwQ1+mT+PrwKEFIQzQK/YpHP1zgJj7w9HtmxuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462182; c=relaxed/simple;
	bh=Av+Ccu+qywSP4Z4y6HFs4D81a3D7FkQfr9mBxELay8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ipNusQkCgMx276rDHlsykmmbhOkFdORQC5fKYqj6kgdiroeisPRA/rq8CxRQdExW897owuEfbhUatM+RaEFMIQjmGkGMJjNny0o7fJitac+UZImacR169C7Bm0i4vJmZeehUwe2Q3hM6Lbvf62zUqfq2jNNnMDy/P9tQETL25XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZo/CuYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AppJtzah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZo/CuYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AppJtzah"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G2pJx1698687
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 19:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=; b=IZo/CuYrTpW5faji
	hWievtY3uFaYyripF76Bn2w8Y5mLeCN/vgWaf/YxXSWVIuENrDCJsqGeXlctTkAN
	JeQnaoQ/nrqogbgoUZ+IyZnAy3opIXHotBY02+BmX6Qn0m9jZt5+IfBIjPNm5Mlh
	82OMr7v+NLN8mBZoNI2frUBmaH5YBtom/1acLgXH20ajZCFAih7IYtUtfe4iTRCr
	BdVR5hay93DxsM8Gf35jxUTNcPSsMsh9UrzXHH+zgrWZ8K01iRnCk51uDuo5G8Dy
	wJK91kKxwS4P4RY9rCAjt/2WwhSfHcm7QxpuhOXFMKmwEGhvizTkn7KWD1IWWZBy
	7PYd5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvh008-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:02:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso361632a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462173; x=1789066973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=;
        b=AppJtzah7KFX7J5VqUr9tkmWh+FahdHLf4PUz4I6od9nYE0TNEQa4W0tl8qsFIBnZP
         ed+UCrrHgvP/xiziTtD97KgMP9mqozA4ALNiwrIfQ9s3EKpHKbZVkNHOp+qTvXu3c0ZU
         ABOeaOHHupz3nT1xaQwv2QHn50bTICW/KxIx3TUTq6c8nJMlnjWRoH9CEhZVH4Cxz/tw
         MHfBvFnh0644mv/XLM4BF1xELCTIIgxvdKtH9CQiXBa5+noyACkW4u+kErmlZri41sxy
         7y8mi9ITECzITixVnmDbPU2dwW+TDVOr05Nx8vWUYtNKioBdx6f1F5lVH9sgXk5voSSB
         SL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462173; x=1789066973;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=;
        b=QXtU/2NkxkHmNkFRG1gxGEKXVX9XXCnSbHApJEvcaYJfz4esXBkHYSuG6+ImCD/Lpc
         IOVd1T74G3YEvnhb9gA72ETSRgxT4j1p40pxSS3shtlTIHgZGci4+PWIecDdjtb/S2dB
         NQ1qs4ybSLAuomWISJcH9vBf0mo0/gw9LhJWIEaFQt3I2z+EGvIrVinP+aiFIKr/NPD0
         c3+6Qsf/AjIGuBXXILiEpd7IZiRjKiAq1bR3e+jeuwbuTdk6k2z+QDQqabVOihVaEXZ+
         kwXIPGKTVXHJVnKrNsZsUH11Oo07izvH68z+tNeKtuDBGck65sGK93n1ryuUt5JC2WBc
         1OuA==
X-Forwarded-Encrypted: i=1; AKwUvBzpYG4Ph9q7pJuH3FXNu/LCmLUX/pOuQL4cWnmBeipP+afwr6PearHeXVXHc9SQwMaVjQYYHyB3MdJjvVY=@vger.kernel.org
X-Gm-Message-State: AFuF++ls2r+yeSMs+VNuIK/JqdFSgO4atN5Ej6qgMJL6UkLsbkKfwFtk
	KLr0BM/zPBMIgRgftgfHyqdaSDuV4Ztk0sbw/R4vq8z9ApYI7FLfD8G+JHMgnbnR+LA1VmYyixG
	ypMmDeUO6JEZyf/cLUrXZpWAS4zPNmpW76576oj5Q5HUD6RBq1+JvRFpfFdWgPqHo06g=
X-Gm-Gg: AYBFou35pXXbWBxWrusJoFuXF7ltAYqLhhmYyvp8I6kc2jezSc6Hh8pG9C0ZBiGDiDU
	1mqWxxVC8YwSIAkkA+FjIQqpRS5ZWAlCi1/b/JwPsfU+SMen+gtl+VtCS3sQvFkHY81pXkI2k+h
	fbodfGgCj8ApWjfDtB+JDc4ip/EztmG/2iYifPu8sxGJxqOtnacIprcd8Yt4biMNqCLQ0PXidzO
	EJYlzlNtaQ6HOUKfgnqgoDxZej2jTBLmMMtdIRM1WM9QlvrLIjGPbBcPCWLBLMJnJiEgUXF8euw
	nHIvyviRCEdvMbIkPuag6pZYPWA3FfZgJPSzpVy+HtKm/IfcPC/m7TyYecLWndosEOEbNRL/viS
	/vbofEaSDX9peggkY4PvClWfAi56r9MGWpnUQ45eGQueN8NUaXc/42c0=
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr794445a91.11.1788462173248;
        Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr794309a91.11.1788462172645;
        Thu, 03 Sep 2026 12:02:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew LaMarche <andrewjlamarche@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
Message-Id: <178846217113.824911.11446976488422487073.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: jEQuJeY9THvhfpZzR7Bv8hWeXV75ygbC
X-Proofpoint-GUID: jEQuJeY9THvhfpZzR7Bv8hWeXV75ygbC
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a99c45e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX0pitqwncN4+y
 +Wd4EuAJUhFLFt6qpfBMA3Dk7Jp8byKynk8iimvAqEzCecrUkvkXJNNTZtA7IKdzaQi2EsvEJoB
 b+ijqR97riVT53woySvCp416TN8jc97V0b5uYEvGATCt1NNTZDtxU2XdeNMFNVsvdUmizBJG/9z
 uE7j8hyDdK5yARzpJzQZiKu86ciMPig0Si0wEkaM62U4fihWgQVL5dUxCIagR3xheLiXIRFHbuN
 3znSnH0eJdrqi1FFBmaqV3621wwzEDsvgpdHA0ogGUltaWo9sQPniQgqmk8tQw2OR6JC0S6doEO
 lngsgex9eBfKPAGcruy/EZh5h+1rt+gNifLHyYlX3aahS2PvnPL8CuZXXp9T9MgtDbkpZEJ4Bj4
 kbiMRDSY6NAPwd/K7FpO4kOB9qJmqmxNqnj6Q86elUeMLBzmBr2DIXrq58+a2dK4QqFtUtaqRYx
 qQVlhoON7/M4stsDLOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX7iWVUSNWHPV5
 NOCQtGy/+g5aKqIF0s4CdFyUcVunN3erNYrU7QypKJWiePwcamLBd7Ping2hBsWtHYlu441smQj
 eb+RtxdXfb9zbPjpeGhb24Fn7c8C7Tc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166


On Tue, 30 Jun 2026 13:30:00 +0000, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: support calibration-variant from device tree
      commit: 06cca100ad083609ca9cc2d1f692546369144189
[2/2] dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant
      commit: e6c2d73f27b3948cabec1017c9443fba24f1dcc1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

