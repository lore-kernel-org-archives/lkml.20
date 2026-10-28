Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197144;
	b=g55w9tPFPm59F0QJL+0F69wDWjJ3wlTP8mZli5jPGicAlCqJou6RvfKnRG2yuIRg15+P
	 yn0qxvBQ5xMmN30tFjuFSqLeCPdcRy1OZhBZi8dquJ+qOnCKfP5Ae975W3GgFfeldnEg4
	 CXGn97+yHrPCidFnVcwMLV4DW9kL7cZUKEO5YS5G2DvHWIqYWb5D/ReSVCXo9Tr3qUUnh
	 GVEVHnJlab3XVG/XfJuF++2HtXuSR9v/6bSFINFGHJ0+eLF5q4K4E8JJU8JTLTzSEAqGQ
	 bg6UFoWcg+HcjbONN3Ga2i6626Gy1F/z7eG0i9q+MkgRU/p+7oUc63HXCmPc7ltYkUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vJcqemAVLZEHHjqG5FdeoT2RuY6git3ZTy8KuOQKtb4=;
	b=aQX/ioZ5weLlpwpRRlzOIAh1ywBUg8qgRPhWu4DSaE7wfpQ9rB5yBbNaotwhWgnPFtk3
	 CMDFaGEFrJ8PIEYvF03AHwOww1xlWiey4FTohW0GNP+dfqL9f6RGxkh5EPHd78fw6IoGI
	 Pe+suBGee/OSL6UjYudM7wVtkFhu7tYonPjM0E1E45WhBzjtNZXFstrRXvITwJ6ldi7VI
	 ZibTzKYLX4pYw064ypCOgI4LQzHQiRyqG37GU7xMHwX0ecaznNdMyI2TkBHXWx7rIEo1+
	 Y/Ll4ocC5RrDJ1uUpy0Gs+jF0es+28AQ6+T8Miq0SJSxx6F+yP4+AVE3YTD02Mj2eVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAbfw0vn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sg3pJ29J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D62606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D62606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAbfw0vn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sg3pJ29J
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe0sm4154661
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vJcqemAVLZEHHjqG5FdeoT
	2RuY6git3ZTy8KuOQKtb4=; b=DAbfw0vnINYnAreMLLbRIdLi5J/Htmu9L5hFbS
	Afatuj0XQ9NMh/ZYWe/O6er9r8kqZgjWW160Yci8+G3Q+stYOWMZc1e7pGizQNdb
	wTmSty91xH8hm/+xVc+BxqN7d0oJi2VUCf7Urqd/CjdlY8w0FijIfdIcNgdIbKo0
	KBDGvGaeLqI55BcOrMkPVLaq4yoPr5LVRqZQ7wtFWBVdKW5zHqpQRNzpUvqwScV1
	ujsk15dSxB5ajAKcCkjYAnQJ4SlFP52+OWB90oBBRV6XztDbiJpVsfdlW0P9SU/q
	wNDBA2iF00ED3ekcadE3mWuKAnWakhQhmE46pQie1JPnv1fA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp17cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:02 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80c63d27682so184252a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197142; x=1793801942; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vJcqemAVLZEHHjqG5FdeoT2RuY6git3ZTy8KuOQKtb4=;
        b=Sg3pJ29JpUA7YO3pzRmjQ1iCPlhUOWoYtreYuczxhnTG/jw6Dq2BFumeNOtIUFBB6N
         VknmNSWkvJWLHeuZLcViTfY/qQB2hPD56EKxyhvgZb5A4+WJ2CMWbGivMl/t0RW+BJCQ
         yitivjsSweJjmOXuug0qdOGfYT4ZYdP+XHykKqN7jeC0B14hEEtsikXHbWZ56rJTDju9
         MT5XCtD/6bC5+mL3RxUxeA1qf9lVt680Sdi6dP8JdMP6LZxUfWn7MMnZ+dMMifPKahJj
         jcp3LTKgQr/84RjtwzKtBaG9ghogXucH55hOMwrYe3++B8zp2V2FPWrP0YpG4FedFCa4
         lPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197142; x=1793801942;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vJcqemAVLZEHHjqG5FdeoT2RuY6git3ZTy8KuOQKtb4=;
        b=2YFmLYWW5oPgeWHUjBwx+EX2WnSBekcyOFU55xRRGbEtabN8v2AvnYQc4HX9EBA3dj
         Nt1UMrCQfCCStKlZwyvNgTKA41ADHKkYy5Vbd8lZ3N+iwX1vI8E0TC3/NWXBfJHqZ3QM
         OEP31OBgQpFKpQClFZP5H+/ZJ2/BLwykzN2ClV/0dWcOpM/XBolHJVeps/NPmqc+c5rV
         +zNujGwGxAkHakLzwo37jHZ9nBbl6CXduVoyF/dHl6nA6dXb/tG7DcFV7+phYcOSMTCR
         RDZtuDd80PFiE0LNlCriboPLHMsbqyW0S+HtilQkPAoyb5lFHIIeoIH+6zeU/yRHozqw
         3ulA==
X-Forwarded-Encrypted: i=1; AKwUvBzSABI4HBEkkyCOk7xANx97v9aTSxSr90fIx9NoMSE2Sx2rkTp4dUKZ9wYLbs1jVAQihA00Y44HSttgQFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYINji23epVR/UiOk968uFZdMyY2tE4Bx5avFFKn4H03fQnHZRc2
	BlK6s/fNGKswWcRb7IriCzvXl0kq6m3KmAtRwLO+Mzx5LR4pWoDjULBy3tRmPyUoDZoOgrq3HQJ
	rl921HL9c7pXoHm6lBU4LWRAiVyghaQxEJsJ8HVa7p3vqCPypZSA3I3avH6KehyvJoP4=
X-Gm-Gg: AYBFou0n5XU0cacAzBuYzWBf14XSSmeJIBvmpvxeI6KQKChxO/P5gve/4l9mqX1u1vl
	X9rHFKgxp5JQkANiJogDPohfO2JsaKNqvtt/7M0FCu90upQ7wf8FfhF11qVJqInehUCnaytZm24
	A6EZTTsyn5X6aR9mR1UBtdQ5YAeARtvPSkX2N+rpFrE+NQHdXgVEfuyYgWypA/tBvYcy6cIGSB7
	b3hsYhyf0ATlCNono6jJlbdNXTMl3pzV4pOuTM2CEDxLpOTNZVgxtMniUzaD5V0C4Xwum5A3oKg
	k3S+gfukcU04ACy7I+26dwBkKRj9pI78pmWBypwjsYI60GnqMuN21tKit8T/PaFK7YP2k3I8hYA
	WoxBAcCrMSoXPRdhc+G2yOlPbJBsYg2tGelf+iafgUr6SdR2lkvElNbZFtHCoBTEPKINVMc3TKO
	CJ7vVHU9SH1UqXHSjUUnA8
X-Received: by 2002:a05:6820:6204:b0:6f6:5595:915e with SMTP id 006d021491bc7-713ee85fbbemr1936297eaf.1.1793197141913;
        Wed, 28 Oct 2026 07:19:01 -0700 (PDT)
X-Received: by 2002:a05:6820:6204:b0:6f6:5595:915e with SMTP id 006d021491bc7-713ee85fbbemr1936261eaf.1.1793197141306;
        Wed, 28 Oct 2026 07:19:01 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71429e7b7basm1330411eaf.1.2026.10.28.07.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:19:00 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 07:18:52 -0700
Subject: [PATCH bluez] doc: Add CONFIG_POWER_SEQUENCING to tester.config
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-fix_tester_cfg-v1-1-e965db9c3c09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEsE4moC/yWMUQqDMBAFryL73UCy0CpepRQx8UVXii3ZKKXi3
 Zu2n/N4MzspkkCprXZK2ETlsRRwp4rC1C8jjAyFiS1fnOXGRHl1GZqRuhBH0w9NbXFmxz5SkZ4
 J5fELXsnfV7zp9p919TNC/sboOD6o7ttoeQAAAA==
X-Change-ID: 20261028-fix_tester_cfg-ad870e5212bf
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Bluetooth <linux-bluetooth@vger.kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: HQbCJHE2qee8fTHwyChCOk9HTG1rgWSE
X-Proofpoint-ORIG-GUID: HQbCJHE2qee8fTHwyChCOk9HTG1rgWSE
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae20456 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gn8PFS6gxBoOce5iwNIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX094VYIjw1cHP
 IQazKQdNzXNWhVSjG1G5sw26KgpV36yd6t7TLiWXQdtQr/CBRN94TqX9XvAgW60RVBebp9owRdG
 ByPETIhYmNyYu9oM3RZSd2WIkLq6fMxz7qOL8RbsvDtIO4oq5Y7rrjaxKZxdGYVoc6Qvy6CyaAe
 3l09zzAy2rTjkJl0DATB3ueyZBKHW5b60pPYlnIveeClYzPQ5B5vF5rJWvxzz15x11N3+Cr53zX
 YdzoWihMcOqnLX8v0QsdeGeL7I+ozdP/Zg8GAGkFa4cy77fKNR3/nPrvPab/ZL44ruKRNmDS1ZK
 PfeivlroEq6rN2F0NXGuMmGLAeTywt/sBhHLsjJeaPx+Y+kYFrx0ffCtNSgjkeu2m5v3Nuen9Rt
 +3EvUVRB4P65Gf+XLTgxPpneVecNjEtPjBDy3/ww46bsbYsYPAuTSBNVYiw1Vd0amSuHERK8GCp
 mU3gYY6H3YRlSNcaSLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfXzcod24iecdfK
 IyCRsN8sg3NyAH2gNGZMHYGihxQsVPconMG3pC4h6TN1KS/QQYMJQQd4v+fM/Nl1GpWhgnleJ/M
 IRYIpha23gBU0MejrNXnfC74Mmd0Wv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280056

Some x86 /boot/config-$(uname -r) have CONFIG_POWER_SEQUENCING=m,
which prevents hci_uart from being built-in due to the kernel Kconfig
dependency:

  config BT_HCIUART
          depends on SERIAL_DEV_BUS || !SERIAL_DEV_BUS
          depends on POWER_SEQUENCING || !POWER_SEQUENCING

This causes the following error in the guest:

  Attaching BR/EDR controller to /dev/hvc1
  Failed set serial line discipline: Invalid argument

Fix by setting CONFIG_POWER_SEQUENCING=y, as is already done for
CONFIG_SERIAL_DEV_BUS.

Assisted-by: Claude:claude-opus-5-5
---
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 doc/tester.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/doc/tester.config b/doc/tester.config
index a9d8de22173f..bb0627c216a1 100644
--- a/doc/tester.config
+++ b/doc/tester.config
@@ -69,16 +69,17 @@ CONFIG_LOCKDEP=y
 CONFIG_DEBUG_MUTEXES=y
 CONFIG_KASAN=y
 
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
 
 CONFIG_SERIAL_DEV_BUS=y
+CONFIG_POWER_SEQUENCING=y
 
 CONFIG_6LOWPAN=y
 CONFIG_6LOWPAN_DEBUGFS=y
 CONFIG_BT_6LOWPAN=y
 CONFIG_PACKET=y
 
 #
 # Bluetooth device drivers

---
base-commit: b0bf49270d445da0852851f393cd67a0a1e5f05e
change-id: 20261028-fix_tester_cfg-ad870e5212bf

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

