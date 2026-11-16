Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796357;
	b=F6Z9UL8tTc1O3Rg313ZFt/Kc48CV34VlrEpxkuHtzRn8jD4Lq7B7ULZ6W0mYxrPO91Fn
	 GBl5A/Cm72tEI/PKBj0CK3nCzBA7uPmJUniATe+5aOG/TAb1SiHPuRnvnKDaluLfzau8C
	 1FeWaPaDK/ViLE3kgljrZrCxDcYFw1q+cnwkir+Xwh/xaBMaueX0rEv/gverb/q3/UNfW
	 SXMdlQrrxVG4woN2ZhSfJCOlIMVYzvuNh5PplO6SXGC1H0nQdWLbNXLEMXV9YrnGN+aY8
	 zj3Zzk47tvomVKjoZtby1AX97QNV7RHwsiAaLkrPXs9tST/6Z6z1BDouLAcwl6E/prQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fTYEXn/H/KMmLXiSIKhoHlh+5CYKLFjft0p8zIigQa8=;
	b=Amv1aFzty61z3J2Gm9Dvika54ZCeu1DgoGpRe7fBvr7zrDGF7mDRzTIEFQz2dgu98Gp0
	 ++AzARo+gqXDfWbVqW8CmEltZVc6iSLq49MUeCaVDg4CTRxvX2MQvc1kVOBPFPOr5rsEL
	 gnJTzAgi6dYqIUbc8SPabvNL8Y6cTtfqw2oxnc3uFzQYStytj88u1KcS22WYwP+SVkjA8
	 7Mykzy3ErQq5XyM49FpoJ6h/8snF1iO4ObXMyDe2RxlTE6wtKYLkvmxG45xDFUiFKQruj
	 +K4kSGdROg23IONWAqwy43SZBC9O915WlYwzopWwlkF9lw2uKmsq8FQ+NNckC+QXvJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gJ/eTfec";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+WhRbR4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909AB606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 909AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJ/eTfec;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+WhRbR4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1KsZU2361685
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fTYEXn/H/KMmLXiSIKhoHlh+5CYKLFjft0p
	8zIigQa8=; b=gJ/eTfeceB1xp2APXmSXKhgV21k6uuXmepPYx9FAYgTEEGXaPkZ
	L9SS+K+Rq8XhUzbDOE6LpVN2i5nFXlW8jTZom18GfpT09VZzVwEhpqX0C+tKztXW
	OnIf4e/C/41dyTjd4AGQ7a4HDyjiDjM6BIryhiGUZFRvhwP5VBfy7XzzilEZFaro
	Gq/eTKptSR6Wt3iGmkKPPG1kaQe1jPUP02jZpMu059mFgn03gdWD/vVlTyT4M+XT
	ziLrJ1IgqX9DXrFS+2zFBM5wBns+FK9jD0GA/rK9x08MVffLCQMO9LYNMvUMu3z6
	USMlCiy+spDEN3I+TxxZWO7zixxRI5IO/sw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj44dgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:32:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1054667a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796354; x=1795401154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTYEXn/H/KMmLXiSIKhoHlh+5CYKLFjft0p8zIigQa8=;
        b=c+WhRbR4zrZUIinr9hbeT2zNozovMQQryHhGA0UvQZBp6IoO6SNimnT+q0e7BlaVJK
         +27pvf+zf3rcORG7XPGMTSc7QxFbe9TJHMadspr9uEhrkFo8tJgNPWwo2QNAN8CEys/p
         cqayZMt0MhB54Cb4nMrfrGKi7Oo7DM931s7x1h52gFcJhpTMxsXlIuqqLP8BY4MMukAR
         xG78n91U8H1iyweCJArQh/sxl0h7Kut09fHeMeZN9OHVYcHkXo10HON40fmbB22jaGXA
         I8QHKpZIa+H+BQPEOfEfR+uQNTquT0DoMDx6zmScuUT+IsMGFlFM4rrKhEvhvxfX/Fuf
         /2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796354; x=1795401154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTYEXn/H/KMmLXiSIKhoHlh+5CYKLFjft0p8zIigQa8=;
        b=extLCkqRrZNDJ6EGIe3vN7tz545MFR+ajEH4vMEea90a1IncfXUKokPtXLzLOoMYV2
         9iMQSMok/w0AOb1qwfpFMv1g+Vfkm7ryZX+79I/iV+wP5nNSqoikbFy3+huh04f9dS6r
         2g25Qsq0ub1rSdIccHM2ak48Vhcm9rEHZJRRd2Y+u6v9k5fPy1RCyd3G7U9PFKnGx8wT
         j7MHlJ48dE5S3dx98id9K7mHCu03FiAiIl6bRvfgSTa9sU9jMvPVGYA9evP6i6tB//pf
         bENm28lzkJCJ4QoGrTJM2njxKd0gk4dpc+FtF+1FFVRV6tO2E+EMZbSg0XXxxu2PWqKE
         Y7qQ==
X-Gm-Message-State: APuU4Z/AppBgSw3/m1a0EKrl/MBqRgWPLJQZi/eeZV5Jo4raTLJt1RIM
	tMX+KqzSCnzsAzxu4WomI7VfCtxEzxqg2MnI9THMSzsOGuIZoPm+bPLTUx5W/PFygsRWdboS2jA
	AqYYfeJE2vSFKfP0iH7IP455qILLWUtgkil8fYvhs3Gd4J+dMvkwaX+SpccwAJiTWPF4=
X-Gm-Gg: AYBFou3yl0EkehMPM2pDi7Be25u0lX5BZxoxQjsHr7UWHDEE5su+P6QUt9FFtd2iPp/
	SaerOTlwwpcp3/5VHS4ow1RSTW7XXSkw9oCnua5nXVTOzlHlhj4vquAgdWqcZdTmaLhL1zh0NiY
	M6l2EPOlwJ1HBkjoyApcF2mNulmSAUilEJ5q9gKujh7PK+3+jOuQ/778F51q/10OK1N2260j35K
	viN4NzjkcC1kg4ElDZrvRVxmoyCKsEwao/FN756N842IlJsXpcRz1YvuJCwb1Ra5ulLLt8wFHPl
	myRp2vsTyDDMt3Ft8E2/o2Ihtd9z4L2lP+WcC2FL0SZgYiXOUFECfvieR4JE+mG5HhnkYLbaqRD
	akMiFGeFBOoA+y4ZYfGYAWA6sbk+6DurRyPbfuVjFcQKYZc7M0Z7hoYnFbVEBNct4ywyLLafA5I
	tEscHulXFt3pFbJF8ebi77jj+XHXKv1+Q=
X-Received: by 2002:a17:90b:3c4e:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b1b0b667b4mr9384411a91.13.1794796354487;
        Sun, 15 Nov 2026 18:32:34 -0800 (PST)
X-Received: by 2002:a17:90b:3c4e:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b1b0b667b4mr9384388a91.13.1794796354045;
        Sun, 15 Nov 2026 18:32:34 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1515a1esm3328496a12.1.2026.11.15.18.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:32:33 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com, akpm@linux-foundation.org, kuba@kernel.org,
        alex@sverdlin.org, cel@kernel.org, ehristev@kernel.org,
        s.grosjean@peak-system.fr, alice.kernel@fastmail.im
Cc: linux-kernel@vger.kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH] mailmap: add entries for Miaoqing Pan
Date: Mon, 16 Nov 2026 10:32:26 +0800
Message-Id: <20261116023226.17265-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAwOSBTYWx0ZWRfX0B3hCtRSU74m
 772cFGlomxfQdIPGYzpSefNtebsop7kwTxZcg5jfamBkWy09yaXfloHk2GNj+y/4YKSYeG2jycB
 GfNe+ttUugLQUv6W/0ajd/OFfd84go9eExQvyJLCeOiTdKE6kXhkcxy+Y2Qw3fIW6AhCP/9B61H
 4Wb/RhFgaqEc+YPkgOHHYY8XEBOKs5fUCUoSJLgaGG/6t1VsYG4KNzhRloHNCpXvoEW/1vT39uP
 r/2uW+oI1MtTbsoVJEc7cV3krb/6xk17D6C0JukoS3zxbWGrCxfZNKsMTjLF4qX1cQGDJCeiJIX
 qxYu3jf+xkWUWBzaWwj4Lft9vNl7Cmm267jdRh2S4vOsq9R0nYMEBc/xImthDVDnmLopX2pp7cv
 5EM2sR+ev792S0bvRye9PtZxnzvzLhbOdwlV0Vtc3jgC2E8I2Im3XzU+rcDtB0jjGkb3KfN7qPG
 Ytvxg3ajNCyNn69VwpQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa6b43 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=sozttTNsAAAA:8
 a=Q-fNiiVtAAAA:8 a=VwQbUJbxAAAA:8 a=B8496N7PIxWfQy4dOL0A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: PPjvt1kevoRm7g9ptHH3xiMny5RUkok6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAwOSBTYWx0ZWRfXxPgdtgWeCm75
 c2yJ4jgm3bdgUMNOMt4FN4idEpyfLBBqhbjHjgKdpVxHxjzIJsF/tFYlmYr4rlPcPUuti2hMM4N
 8pRjeepVLJSciQeQeuyOaNh22u+noOc=
X-Proofpoint-ORIG-GUID: PPjvt1kevoRm7g9ptHH3xiMny5RUkok6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160009

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index d73ec73e5ba9..3b3525869278 100644
--- a/.mailmap
+++ b/.mailmap
@@ -640,7 +640,8 @@ Maxwell Doose <maxwell@maxwelld.cc> <m32285159@gmail.com>
 Maya Erez <quic_merez@quicinc.com> <merez@codeaurora.org>
 Mayuresh Janorkar <mayur@ti.com>
 Md Sadre Alam <quic_mdalam@quicinc.com> <mdalam@codeaurora.org>
-Miaoqing Pan <quic_miaoqing@quicinc.com> <miaoqing@codeaurora.org>
+Miaoqing Pan <miaoqing.pan@oss.qualcomm.com> <miaoqing@codeaurora.org>
+Miaoqing Pan <miaoqing.pan@oss.qualcomm.com> <quic_miaoqing@quicinc.com>
 Michael Buesch <m@bues.ch>
 Michael Chan <michael.chan@broadcom.com> <mchan@broadcom.com>
 Michael Grzeschik <mgr@kernel.org> <m.grzeschik@pengutronix.de>

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.34.1

