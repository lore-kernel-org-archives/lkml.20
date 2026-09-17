Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9515A5142
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658788; cv=none; b=EfL5cyaywMV9/nXLqVGl+uiV9lCyS5zEPwjm+83cZCr1uty83M4axMvlpeQ+27Temuc+PDUJQMHWC753x8P8R3N8yG1IhcLRllVYRccDW+F+JRgvFnnTPb0F1rqt+wRp0GOVw0NN2CF5qcB5GHlVAqX+1fgcQRwOnqva+4uCufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658788; c=relaxed/simple;
	bh=3qmlskWMzY85Oikfhb/KXg46Z6tfOC9OdCPH+ZehnJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wzg10a2QP2qMMI7P7JrgzDIF2lMYLEJClbE6vRsszSM1n8Y9xmeJ4Yq/mocXbQTQ1xuLNx2APE0boh3Dc0lLNt3/LKM2nFbS1DPtxF9DbhIRxP58ZUD1SRnB6mX249/U1lamE7XLjiNGkWnmM9BrKlVSrE7VZw1fsAa0hdDpraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/r+rU3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoJeDqDd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/r+rU3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoJeDqDd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj14I2266096
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ln57oQHyBkL7V+ZLstDX/rR8
	u1lfqU3aYXYeyOqWe4E=; b=U/r+rU3nLB+dvF0TXAM7NKyQDeLKUjbIyQ8IyH8q
	zHYKb7kGN7xu4WIAEOq4K9kOAyIvvKrJ3us66pLC62z5kP/9cEDYX7xB1ohEIOA5
	CcJTkZL8NVU8CFt8i9qCv73hftU1mjLTZUcXG8tftC1nrPH8qsMPuMowLxI4OKd9
	Bo1VMNr4MCVaX3OCEqqHHZ9Ygln1anRO/2vULSoIgjpp/5mHU+H7D2RwLYK7FlhP
	4vGTGMXKRXE0/az1woszeD7DVx1bvtnoq5gLTuxthBZxOpU+oqwhTYgG13Urn0B3
	lbJS+5dTNrKq5DB5mVH2xqhGre5Go7S74NzJPqWtTyeXjw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfpph0rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:26:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8135d7eeso16276716d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658767; x=1790263567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=aoJeDqDdLdHkj7EXitk/82HUu9mbJSvyeBgFtNUSQbdXMfSzryWzMPD8ouC2zfsKp9
         br7eh3Ax6LQ4xRyvZJHWyzxPMfRjoch93WJNlQn6cM8qoE3tyo8lkO7RHC33tO5onHGV
         APdT0Oa3th1kN5h6MWcEXwkhBDIG8Q7/tQPUv7YTlzJm+V8MuqERfClalmnB8C8kfyPn
         k4Nl4UIl42zdOa0ntCXfa9gt64Ejh2TAwScF3oJHTVAniVgh3uhY+Eckh/MX4cDs7HCn
         ckAoRa80E6CM7qUnYrqt4zCTmKZlxIj0Evdk9RQTPh1pZIIZ3hSsK00dweW+wKkarLtW
         ymnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658767; x=1790263567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=tNAD3+fJ9Uo9LzbLviQXNiiXfznC/ovJ5weLZiq57LciXS2q1+misipQST5JnicYrB
         CIuGRrvq1tY7vtedeFr2DyqXdLiQ2Ura2TEALuqfB10ClE2rrHizhCnk+61eL2+S41KP
         NmgZsbwD5kzXyDT3DwV/+LAOmcnSW4PvhCzl1u2HUtUACR0dfkt+Jt5y7BX67RHUx/e9
         aEAkTWCfyEuWp9K0dvdjTGKiGriYkVLZbMslIzztfCzxClvmxzgePiRnmiS7pA/NWmJ8
         nrqMoolq7y/jHiKtu1kF6TJlp5whJPYhOtnhdXwl0/krno/6qYbwkaVTZYeZ2fugoadZ
         PNFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6zxKkhypxcpA4q6uQUw9oJIVWeaaiqGxZMhobYedOhKb9YlMOXzvpNdckpk8XaZ1g13+B/qI4ZPIkMkE=@vger.kernel.org
X-Gm-Message-State: AFuF++mrK3v6KQJ/oBTcxpQIzERLdlPWHcBuYvAaVbvfzt4qk92wnA81
	/87aT8OlG9YVfdgxlk+rMD2MUlzwYAof9IgcjnT5+MboBypvcZxs5oqEs0TKGlHMF6Id8odqRPK
	VnXTYlaCCuxriREJg7tWtzya2px16GzTEji0SXCyUhuhp4MEaQS7SE6rOMJZm5Of6k3k=
X-Gm-Gg: AYBFou2GJ+tc8PVevlKATT95LYSaCAYuLKVPlWjIcgi6NYl6FY8a3ywRofvoXgM4NJM
	tF2+o9fGFqq/0HJbpqaU2Z/5k2QqlZen2HiMBN7+02eyOVsoG+EaTzUvG4hOuU4wYUgwChM3TBN
	aVobickBnTYlG9ADCdSLWfMyfObov5PNyoHI0K5dBoDmU7rf7XnyiVrpQJSISwWKb5u9oTSMFXX
	H064DuXFDmWWDVQjUmLdetWsOp7FRPxBo+J8Tmv6bT6Dd4CeLM8nSHA7vd1X0dmOIdexpJ6IOq+
	6MAKxwxKtqY2AO6vHBFn3EslftxAMCrtAT3vhWuQEg9C7HNl6g0yVE9kLkReWjFW0FWZPk0zKMu
	ssI8lrr9LjuU41Pg=
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825886d6.8.1789658766435;
        Thu, 17 Sep 2026 08:26:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825146d6.8.1789658765936;
        Thu, 17 Sep 2026 08:26:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm82102005e9.12.2026.09.17.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:26:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:26:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
Message-ID: <2zraylrv7h25qgkxbqpq7rg7nodw7hsajshsdxxf5gsgtrigxy@3keepqqao3eb>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-GUID: odFw-RdbjnMrlQCxxItJO4AoQGjCQxOB
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac068f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: odFw-RdbjnMrlQCxxItJO4AoQGjCQxOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX2uQGXDD78rc4
 cS4v30i7ERz4hjlBilqyWCddShqz4jDPfm3aRmfALCAb8Cdwa4jxZLjl6HyDNL33cc7IEIx5bv4
 6ceLPAvcSdXcurQ9UsaYeq1xujP6s5mKwFS7XB2OkM8lTcggLCkoaK7IaiJ78CMrW+wMXEVtocP
 AlMR8yWgrPTFvgORboZCGskawQEyKEIF8OdH06J1njYTt26Voxwr8i5oFE152EVftQ56XlW/wzr
 wHCFdwdu703Ek9I3w4glVlomCIexTZcRgDdMrJByzVAO/ocSud36R2WncXyL/EuXNMc/gotZnTB
 sKYcBXPetvVHKPjALmlJDW19DoU0iMvWu3QauPvRDt9pLbdsEb6BPBVDJkCeVRzEAJ8Gv0EAJjp
 egEpsQECPhL/FIMHtFbgudtNpkLvgKkWG/q+BcjCR03RRfqIOrmsn23pnlAnMQ20aDoBtolwzzc
 LBoQMYTT39KhPIBjKWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXzMo+jdKR/vCB
 w2/AygaQgccmGCC/ceCxkytyruWuKy2k/s+G/K3kM/KxMvgBcYzn3ognfMRFPqiSCCTWzFSIybw
 /H0o7Gtdqo95KqYD7VpkcHqwf3t4CUo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218

On 26-09-17 17:11:00, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
