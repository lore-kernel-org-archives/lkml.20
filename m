Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374110;
	b=rZGUmhRKjUYFnmoJcD1T6y/2Dl2wF57sFFKkr6eTkAULDQh1TF62P4sCQbh7xqVg2XmW
	 D8cGRcCgnX3VhS2uyTw4BzpaGbjnfywB/pMs/rSx7+HGR3R8OSUvLRDYJhmMjVGDqMRDf
	 L/nOTBCbDPWF5kzUrm0Tw+WNHZjcCJZrai7AmXQSS2XU/CkTC39Y8NwnK7Yd5T16wDDFi
	 21P+u3bVQz0Qbfc9AWkbNKinN9TryV6UXun2CINZI5qmcwvFKp8o/nzFZyxUHwUy6h5xO
	 1jigKva2VcMt+PeN3PDohftM18i+hAVtFxShoqTNKf8eTMjMObpXMKwNuuMzBQQUD2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
	b=Ln4vL7fJY2lntgBlweVnnFRj4r9PRwCQ+ZYv3pCn3AVz3YbOA6bSnwIHmVS7QUk0/TIX
	 lghOYjx/GrU5nIvBXuIJU3OQpWVj+CtMuxGSA1nP/xJzbZk9Vz1EFuNylgt8v9//JYzHb
	 b+7jhl7kO2eq8CdQCG/gnAhSEbQyV2uv7p0NRvHuIB2nGj9SVXezRmHaPIsA9nWhGfglo
	 qXPiwNnA1/sGAZeEzj+eh3/LmXW4OkDB5+yqTsuzLnAZDjZCOH/U0fnOQpEqQA93OUcVZ
	 IEdHuBJn556L4zEud1ryIF24NXjr2HJBMt7bhpadbP36Y2wp3jgox3uvrnbyIMq18Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+3+fxFw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZNVkaPO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C17F606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C17F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+3+fxFw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZNVkaPO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER8CN346877
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFd
	KhIIYMKc=; b=U+3+fxFwbUycfEfDWzdEZEkezQkkmX5LhHYrXiKTKDmXAhAZAmX
	Ouc0e4EpDLJZ+tRPg5gGMM0QOnCKLEHj2+0TtUo1I1zMZ0ISFR2xN66sXTJzP4YW
	LoeoUnS8frQyxbD65ILv9il06sYulY5YGkY47LHB8VANKEN+T17I6C4AvklrZ2+E
	ZZOLiATmnONCPYJeFcHYab3hmFG7ekIH4KdEFn78kcSqgoBF8WRD15e+Dw8ITAp9
	5x4d/70RGHVNITYdJrtQY1t6KMpgqxyFZXE4t6CT2ntYHwPp9c1L+QaV4cX9QRaE
	Ski4NR74OILZ29kreLLAGIo0TdXc7iSxxkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rkuc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:28:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so131851685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793374108; x=1793978908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
        b=jZNVkaPOd5/zJQ+yj7jb4ve8KjxZdjbL1XgLwBqo/pS+d7PFFuuQqZpWXXM9REdIHE
         zodT7+pR2sKkyyUxyDdMhl8yMSd5sMtvcPAat8r47B5ORrlMlLfYbgKjYCPnYxqlidLW
         5N8gmJ2BvP5rG6m3PMl3hkeKY8sE6/DCWBR1uLE5Px0SN8MhHjq/dHACmSsotCwzsteL
         4YG2mbf2qICqgIBmLHjEomRmLc7WapiAmt6HCbTWyy0QeIpQH7Jlr9t2KaVKw/4p6cQY
         14mEFYzZF3e3J8hUDnX5ECcaSxB+CrUxom1t6zpYZv3LewGCW1GAHt2BYzSH5Zf1ZJyn
         vKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374108; x=1793978908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
        b=X37MdD0m/ObHweVSmHZdGVTSS74EH7Kcp51NyNvJmJPP3xPbmEeScS1Qx3X9fJvwnO
         ZuySNTsNoOo7UsokQt4UHlndMu0nGJXKlj4xRs3FzbRiptJ2pL2V6722vrO92VmxRfXW
         TJh0ujkDBt1yUsjHBsUE3B6KzQZZv6eDpbFmcLnH9+dTJEBH+0mVctsL4QZ0QvmM+su9
         xbSLXu69ohg6VFW2+fyCrixPE9bp3r3eSu4yoJVv2ChHXDllZeiX9zoY2DMT0Yr0u2BW
         vUUZNFI5MzLBtBF730wMjrw9lNF+GQjej5714NckybNe2G2bbtBMq+uIrX2WhTCEfCGY
         5Q9Q==
X-Forwarded-Encrypted: i=1; AKwUvByj4inoqBpnvFElJWq8rKUcvCpYtKKokS+BnC9QeHHlxvCQKUoovcRMSvj7lsdf+UdKhHIASvn+1o2zXuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIIwgmJkLX5rNbcdzTi3Q2C523AReo0wucDaG7zMmDctn3beZA
	oJX2sCUyNx6PkbrIUB1jlJERWcSsFwA3ZAm4pCFV0cwDbZMsw5/Q80HWt+6kkVbqBL1iepropHh
	018uQRjD+nwcgCwpmWwlz+6qZdmLHk1JiFtTunC/8EZv2QSDa3TIroi/sFc6SbRfPABc=
X-Gm-Gg: AYBFou2HQ05EhRyciz5ax08o/RHf+nTz6lTGYCDEOzQELXqaVug7TkcBDAUYXTHK5s8
	N7aVQWY81RFwHPEW8U3ha6LS0+Rd5itGPiwyzviOqcUtTE9b0bhgTyuXAESY8IyZpxgp2k6iYWM
	NZQG3RwXE/TG41mIau0aPowaya/v/rz0Ad/BKGG6chE3cTlD+frwuRbBBjdZqSQnR5kIBWL2+5t
	xav8pB3a3Tn1em/rzjaBon/IvoeTHjiYvpeX5WhDQsQdQqKg/smisGRzY5LwQA856sNxyXAa355
	dSi1TED8juoSYI1UXSwFlcxp/4RsvrE2RJHL5mEu6zAdDSvmncMZNZe4cZTyVcRmskm0FSipUH0
	BDoZzqJ/oPTGNT2c1z6gSDLz6Smdm5+YJNZzRDLM5MhH4zw3ZOqMN1MNbjowyYA==
X-Received: by 2002:a05:620a:480b:b0:93e:5fff:db07 with SMTP id af79cd13be357-9442175c1bemr457806885a.40.1793374107369;
        Fri, 30 Oct 2026 08:28:27 -0700 (PDT)
X-Received: by 2002:a05:620a:480b:b0:93e:5fff:db07 with SMTP id af79cd13be357-9442175c1bemr457799685a.40.1793374106734;
        Fri, 30 Oct 2026 08:28:26 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm68611655e9.2.2026.10.30.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:28:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: mfd: Drop MEN F21BMC (bouncing email)
Date: Fri, 30 Oct 2026 16:28:22 +0100
Message-ID: <20261030152821.283215-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kmNdPJPVrDCm9e0u73KRmJcOPX1/jig+MXW5yF+K7Dw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5LeW67VWmOyJl9abzEjB7AZHf33RHGV+iUb9V
 o3xT37t19GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauS3lgAKCRDBN2bmhouD
 12TLD/9UHhzB9Z2iclhe4fo+vxrjjRArNxuOUcSc99LCrx/pP6rmMi851ehP1mZm9863/6NI7rP
 9JiIol3rVgs1ak+t8fTNHW2KmiTKVUV/KUrAwjnee74F4/yfn92XwfJuQ+oPKHiVAfqgOkpaWVD
 k7zmsJrb2Bnu6KfvDzo1y5Oe4kjpsm7Un2+bHtPWBuuKi4T8HzcUSOn5xxLROvrp841M3H9j/m2
 0b7Zgr5LWI76z+ITgmpNINDoJtTbUL0nZ4ebxk+ShswE4/OjJ03C+Fup5LonLaoessEACzVXxaL
 J45SWgIOBOU0mFZCmcmwhDWZH+/onIumakKmocioSQEL8d80e44NlUyDehk4F5ZJMIoe90rAy6O
 tQtUtjoWjJiqLRWUqdosDwq077Zfw0QVavmXC8TXVPf/tuckcEHtoEPxzumhWDDYTJOCquBXRxx
 wOdVRkcM2beCYpoZhSAE70Flps6QGuLQCsZAcAyiXCdp97MWwQxMJV4RDD111RKbDehYwYxUZkJ
 0IijTO6Sw1AgXT2oYulLQj5HNfV8tBFaueHE41GorN0ueaEjz89SwRb3yA3itaTTlnqcFiu2D0B
 cG+O5Nne8q2rMBNQE4Gr7OF+UKbpvo4rVE0xlUGgOlMbhH1ry+aQ8poskus8B0glPkvPHhV1RJr c7uOwSrR+EZvlQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kDEuAQvODyrTqED1TArlmLN8mGawjI9c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX/pejQHaNy5Dw
 0mS9ofckGhc0Ui87BDEplv7f1M6eGvSlk1O61rZcNGHluVACB/3FkuUWuHNAzu2m/qUN6tgmbkt
 RztQnrCveNGG3QmklWucTsNmxn2SIxY=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4b79c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2haQ2MhrNbTofsgfN2sA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX8rh6zE1ZwhLr
 VPWmmV9CbGbomfKhBYGD7KH7UDNmhET6lroZ032K27ZAL1u0e3ag0IZwiZvSUqamOuyEm8S9plK
 ZcxwbVvxdSX0F3ajNJ8GbRp5BihH6tTGJ/InArOEhYT1Wz/h+c1GwnOxnjLZKJHzn2AnRpKbZxZ
 kNDkIQpOqSUcmnmfnvAvfa/ebSbSHaxxoFWTFogLAj2sepcLvadbCYl2/m53ptMzAHH/gq3H0O1
 LkFeEBfsaAQK0aZafjt1fQPsAGoJL3p4jLflKVAQwpjNdf5KbLl+jrx3xCRHA6vOsptSFPwYFcC
 r6sV0FKNH3pBlUtyD6sK3cZgWdPjIvbCcgJsEd6LWaZGfAbhX7lEmjqrCUprD1WYRMt9uvHMfr7
 0EkOtosBPSp96RPmpymGlS9APiqbqSHQsCIq6KoqTB4veO/9W4csod/gBe+Q3o+mroDuCA4XW2h
 4r1zjq/fjWhknqWUm4Q==
X-Proofpoint-GUID: kDEuAQvODyrTqED1TArlmLN8mGawjI9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061

Emails to Andreas Werner bounce ("reason: 550 5.4.1 Recipient address
rejected: Access denied.), so apparently driver is not supported
anymore.  Last emails from Andreas Werner are from 2016.  Drop the entry
completely.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Maybe this can go via MFD tree?
---
 MAINTAINERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 365bec8eb7fb..51673747ab91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17998,15 +17998,6 @@ F:	Documentation/driver-api/men-chameleon-bus.rst
 F:	drivers/mcb/
 F:	include/linux/mcb.h
 
-MEN F21BMC (Board Management Controller)
-M:	Andreas Werner <andreas.werner@men.de>
-S:	Supported
-F:	Documentation/hwmon/menf21bmc.rst
-F:	drivers/hwmon/menf21bmc_hwmon.c
-F:	drivers/leds/leds-menf21bmc.c
-F:	drivers/mfd/menf21bmc.c
-F:	drivers/watchdog/menf21bmc_wdt.c
-
 MEN Z069 WATCHDOG DRIVER
 M:	Johannes Thumshirn <jth@kernel.org>
 L:	linux-watchdog@vger.kernel.org
-- 
2.53.0

