Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592036;
	b=mAaIJBf4+uHxuVqhfAgloYCo4ZXqxN/3SDRVWIvvxljGZgdDfeBpB1752xYl/+cxdJHk
	 8eFmb4c3TQkbdFKeIpAGq1oeTrJTkj+wDt8zdlXpBqOIE5My73oZVJVtHiyJe/rFF9V0T
	 hefYr3KiVsdcx/2aXyITPqv7AbVvYY8IAwoIukGog7j1tVqDo302Q0uMbDeYRiO/ZtlgR
	 cYJDf1GMOlgDULhE8koEpElV5LAN1R85TTGR3SaS5zEdMhEbY79/BgEu286kBd4s2pr08
	 hpLjhhOyPyI2F608ETFzoLExc3cihcYOCe1OHGEwQyhJl6A9AvaJZ0B2Nu2+MgXZhAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
	b=Zt4ibp70AFPyIohcwgXlbYjxU71XQRF3ShnXW3rDlAjH9rKN3A1yCFErBkMmO0Zf0A0f
	 Gfllrd0vlQDF0rpElUEdr4ZoIP3Tct4AgA/JyKMlsY3WpRwY0tItTS+UTcq7udPpzB2GA
	 xGbZVH9MB5kTccbw+iFfSNzJ4IOgvwlbkwLJClihWSSPGXPzKKotjzVWLRlXeYmwPr4Mf
	 hX5yWmB1YagcULaxjc9eN3mnyVFFZ3IHAGNUcxKeOaQMtbD2j/pRbdSys0sB3jhP2HRHL
	 E+BOhtcVmRW0dbH6TRiCUfEg/kyaxc8zcvDIlDsAaHh4CS3ZbFR7RmEA6TyMTOR9gOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLgYD711;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c+/JnLdQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D662D606B203
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D662D606B203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLgYD711;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+/JnLdQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR4jY2023031
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=; b=XLgYD711Nb6RdnRZ
	pQM/51Q183vY/GeyYUbr8tGR4RkZZkYV2YZLlpgqyAn6ep8vMEH3k7k5XmsTr6Zm
	dg4JtobSMy2N/EQQcfrNKmRJT5MRHku+6LyZ696Kz4uqWEnfZDpGBQIiY5yMuVtq
	/vvumqxB+tt/zkmIDA6XX7vwN/iLx/oPCpTqQsI6KcS5POxjqi3RVrrQzff1UhCu
	qb8l4Ow38i8jqlUuWr8EBtw+dWgLGU2bfB1M33C6drxYHw5GpzI/bDQRlKe0GEuI
	4xveG2iHz8mEJb50e8UCyeyD2PMSmP8dSapmmAeePBNVReEyHsGi+9Eo+37VDu6M
	5P6New==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21mm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so15683885ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:47:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592034; cv=none;
        d=google.com; s=arc-20260327;
        b=oIYleX0XxvtviGJvzWLDYlw8N5vKTnKQqXktSgQ1H1gh+tUc1vLvlk6RZCE2ZTBo1m
         pvOhfsxhsutqd4njnkifwxPU/2zA9FIIbDTtcA8nifP7+g+jYspxdTHO0v6Zc5ejE1y/
         MN2lcOfIIpXceiUwYl48vNV+p0NASlnS6E8YVaa+7LiQrMOnXZux6b7tvJdqWGD+AC4L
         44p88OIpCBoEgfOOmkY1ucPqWjHPIdJK+bevX/aAHHLZwYfV6uyBCDgfq+LIfqjuIdMh
         01I052U4OHrDhZn39TNHRIGWU5ymDfXWL9HSmTx7DCZFfBZs6+RjMSCduAcvMFlwXGTR
         3D9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        fh=mVroeoXEnab73p1lQ/o/W1fRDX8VDa1Qh4BOJKQXUrQ=;
        b=EL9INgZAsEt0xPvbTf0kfaqBJrHk9YnMPHn+n5a3Mj5OH/GuRM4Woy1pFm+iB7M4Yy
         9k0zfRD8XutvJZDmNR9GkOwAR9au9yIr0o7HESzu5ZKxc6wLHg6ejRG1UTScHz2qoGF7
         r3RQ9w7JpXBR/n+4kXjDuDEEjd0L1ZOCz4E07ocGPOAR0BXzhwaWf7HSDIo+irJSF2Qo
         gDg57XwUsaVV73i5iRA+9h7TFfIGI038pUBHBwtbJh2I1TPRh8iHXVVSLwkbLVXmHpFG
         ykq0TyrTfxH21HgP7XyM9Usa9m0OOIdKGvw/7In+GAOSHcLwmJrdqZPzODT1WO1urgOk
         d/kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592034; x=1795196834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        b=c+/JnLdQhX6F1a7DHfl1cUH4zp8dgXgNYqDJxHsjF5oXW5dxAFIUA7TbUy+LwlDKbS
         CsMFj3E+scMnV5FV3X/fc+fzU3robIDtwnv5pZpyz97MXlgTkHboihJb6W/J9ygdIqpq
         57ACxjlSYOwx2kilV1OKEeCNZEk1oGbH77L16dkR3GO+DFY9esQMICUlXbu1ABQZlfAw
         ffquzZvlNY3Tr7mj/y1D/0Q/Tjyq3hFbhtmpOFYekGtDteWgx1ekN65ndpaD4JFewqnH
         2r0mhhzp+YKvWGdH6rqXjVp4qzcbvu3pCbZRzatdY5BmOas2rrsz4bvdYr/r2dI8BYGB
         OQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592034; x=1795196834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        b=d8sD05LhVNXpP1obDpQkmw/eCoA2rCY1sYI52b6fju/62njNDrPx6cJoS2gVftZ1aG
         4jj30t6NPYLGaUHGf9iDEyYvCcAZexJC0iYEqdARfQ0JSLLI+r/5PF5ZcK7Dd601SsdN
         JG+wD+C/gKnNja3tL4TCUPVqoVQrsgkQ1CwLuT1kb7RkI9X8c70gCng4p+wnxCtdScRW
         cL8H0sOaUIw7fV9ufD2XyAnq8EJrG0kIhnBZvSpd11JC7kaqDz7HVqHvuTvcrMGed4GK
         ft4aNDbtu8vtAi41MGwRFKEzQy2FvJ4NvFHYZhIpsm7Bz16a5amKo5pphXDmqG95U1cp
         TFKQ==
X-Forwarded-Encrypted: i=1; AL+hErF2DQP5kNHCUcL1KKgl93pk+yzNtN6SEwyoC82IcB0aVSJx+IJKINa07SQogPVBRcB4FeJpwpmdLEifAaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ldJn4tbzUaxI8YV0wO/yktP9I7DLV5sUxK+YuMghoj0Yef3SE
	sWJIB8KOgl17OHEPh/59hS/B+ZTJP08u4HlSHDiQITyUe2+PZ+4OPpHI4VOeY5Ifn5J3gtMuDgG
	wGkVAzlHRoCfQ0uJFf1bJaC/gqsVd3tIzo0pkHA/7uhZKripcImDFgLmXkscVlGtfnDiCsk0s6D
	IYzJtMDqEG+9IrCF7Emfsay0JohTIvVPB8KzzbVT5ZacISvJMWMg==
X-Gm-Gg: AYBFou33P8cgW1zV/otiV7OyroCMjgcOKGkf64fM6X8SBOSJHUefawLSDfMzBNsUXdv
	0yQq+o4WP154Nno0i84Ck0OHAW5t7gnE5q10svOhI4H1YrO+oZCloGyA7ahXPZFVlck6ris0+Fj
	sVd1eVA46yfA79lPuQ+Nj2A7LDRf1kgyKz6u238WlSfU6gpbEuQMzolSu/fA==
X-Received: by 2002:a17:902:f603:b0:2ed:4456:fb2a with SMTP id d9443c01a7336-2ee0dedd363mr31379215ad.36.1794592034226;
        Fri, 13 Nov 2026 09:47:14 -0800 (PST)
X-Received: by 2002:a17:902:f603:b0:2ed:4456:fb2a with SMTP id
 d9443c01a7336-2ee0dedd363mr31378845ad.36.1794592033770; Fri, 13 Nov 2026
 09:47:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com> <6777074.j6PcuT4dK6@diego>
 <CAPx+jO_gRtipR7iuh0D7G2Wi25GZoqFD1JHVbJNmhd1UyC3Bmg@mail.gmail.com> <20261112072146.41218-1-gahing@gahingwoo.com>
In-Reply-To: <20261112072146.41218-1-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:02 +0100
X-Gm-Features: AclHuK_xZYTfne11hVPWnloCpcRGvh8w3tWYpN49I_tY52oUY-lip7RnFHUhpQI
Message-ID: <CAPx+jO-KKvgRS0br-3QGh6Jt4efWJ+A6YoRZKFV_bcfB+8sm6w@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, finley.xiao@rock-chips.com, shawn.lin@rock-chips.com,
        tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de,
        ogabbay@kernel.org, zhangqing@rock-chips.com, royalnet026@gmail.com,
        abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
        sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, leonard@lausen.nl, jeff.hugo@oss.qualcomm.com,
        rfoss@kernel.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX2kfvC8Wv3Awo
 hFBaY0o4/DXM9bTlWMBr8XdDX//VEaQti1qLFhIJyEia1kceXRFXk39ntz9jLK8HRfURcfbCwec
 FjbXJTFZ3qneaYODHIpoKuRcFyz92IInd2twr9jRiPLbJ4xfPeIXoB978dmvAJo3hy/7TiMmO/R
 hOd2BhQZ7hI+/q+rlLEdshr4a4cPiWpFmv26V6mrKSH8V4+IOtIQTNIBzRPGQv6wScTGsUy8j2V
 iOq3iaI3eG8OwcGvqY1xOCPnkQb4Yt5por0ltxVMKcK+sAKO0nAsGhVen78bd14jOY/P2/0b3Rl
 qZkNInq841dWyLV2NehpUXqrICdnc4JDgHGJfcieavvHPKxfIcNpyH7Rl9Lm1BCaskDRnhY50kk
 F30/DTJC/itBRMW7/GuYwdIe2zkn43sFj+3OOlNzyqGSwHPK/5M1A3b/FDHW+OarrzgKQBIrzmZ
 jlN4kCQqnKUDPx8MjFQ==
X-Proofpoint-ORIG-GUID: FAPz2LTXNkcpqOFjLV6D5tuX8YTBxtgv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX3ffUEWfFcPAV
 JWzlRRJnae4g/ud+uFsUmcUBg4XzVa6Wv4oKJRofTotImvmz4aDgnzTRLNsizry3EuQv9gY0PXX
 g2AeHgmcA3kZAfLdWTLgFZbKCCxyd5c=
X-Proofpoint-GUID: FAPz2LTXNkcpqOFjLV6D5tuX8YTBxtgv
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af74d22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8 a=9GNsruGHAAAA:8
 a=KA_qeCUQCZmkxMg8J8kA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130070

On Thu, Nov 12, 2026 at 8:22=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Thanks Ulf!
>
> On second thought, I think it would be best to drop patch 7 (the
> binding) and patch 10 (the reset) from next. Once patch 10 is gone,
> patch 7 is no longer needed either.
>
> Finley Xiao from Rockchip pointed out on v16 that the reset is not
> needed, and testing on the current code confirms it:
> https://lore.kernel.org/all/ca90a994-70cc-410a-902d-5c4c0aacc9b7@rock-chi=
ps.com/
>
> Patch 9 can stay. I will send a separate small patch to fix the delay
> table.
>
> Thanks!
>
> Jiaxing

I have dropped them all, let's start over! I needed to apply a fix for
the rockchip power domain driver anyway, which caused conflict with
these patches.

Please rebase on my next branch and submit a new version.

Kind regards
Uffe
