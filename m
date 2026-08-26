Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB773E9F9E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750767; cv=none; b=RnOS/q6r6N9jWUFv9YCG5DQ6tIvaD6Q5aLatkglgs6WWc8sfGJ7Jm2p8G5SiI3TXLlH3iBMtLYQoJxou69MBXjWwku+CnUCOkx9C1fJkxdjhdS5oGJSosd7a8IbJ62+MCozO4ujP+Bcf3ynxTuNv3ypjqoeVbtU8uS9JAj/F5xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750767; c=relaxed/simple;
	bh=9P/mxSvpF3bR3tFDHNmq61Ve/osDwxIH3CqbWQqC31s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GlmkC1ZFOe83x5nTnO50gspNI5VgMk8+uWIoJ8cwxB+dp0I1Ao54Ujzjy769MRiRgIB0dDIM6NQn4ipwSOU/dwzfg1qPZ9UO+09j0HJb6Rsii9JQ5jtOFgeyrDwd8XJoMRYHU9M7Q182qqrM2sDpfURU/EefKQ6ARKJ0w8jnutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpcD0B2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xkc7ISSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpcD0B2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xkc7ISSj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBjqn1909029
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bB/Mx69oBZb+rLa8duMgJQ
	gKK4MnuS8x8VisngUjkTE=; b=CpcD0B2l5a/wd5kyDMUKF4KqONW+t+0nSvMDHZ
	tHf1HdGBwJWRsnW55q6mcE6Fige79B5q+JBdTZlEZ9jreqMJeBPwOEpGgl9pTddY
	Kxv2cMwPuITfYZwinGdcbHDf3ksekNhWi8gUfAmvEOiFcm/ShJRHd9HlhRkGF1nF
	ZQzKs8dGgku3137CG9hj36vVZPQGOKPnNlbJcrRcZWvWV0AA1oi+M/CIwccDjjAw
	+RT5xIiqMrXK7aFDot2KAD3GLP1G4HI0BYC8neit5cSTxMyhNGeqkoy1F6O+h7RF
	2u8+2lAseN+36R6Ttp1Pqh4Ihx0SS1x0LBehbrmNuFsKK8gw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1se4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1264903a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750764; x=1788355564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bB/Mx69oBZb+rLa8duMgJQgKK4MnuS8x8VisngUjkTE=;
        b=Xkc7ISSjBGjYtQ4C7lN7EFfmfWloOu8XFRW4jxqPSWDfIXoRXN1+9M6dgn2acNvX6x
         mlUU0TBscm+bSGMvwwYZyL1qFz8hRMOUeQFLNB7LeFcuy0J734vdJjT+4TroHRjol7W0
         qMpaKuhDCte8AH6MewkJJM7s5ld3YaAw6wELs/MPD6jMwRK9j5QGWV2Osi0Rdql1M2Ge
         pYdBQkq/OiolYquhycNjV1VRxY0G7+c2sMU40LBGohs+MCjZSzxx1AUJBYxr8vUvTMjY
         3Sd3KnXL73R490oMi3KtGQYePf92Er/C2X/nGAXZ9aAKfUAsZMOfGa9WcHF5iwX/BaA7
         knAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750764; x=1788355564;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bB/Mx69oBZb+rLa8duMgJQgKK4MnuS8x8VisngUjkTE=;
        b=QrfBzoGIr3pZlFogqTEkYIZd0ZeAijkAShgtPLwiHXpASzXwhZ0fLigoIqAx9HQmpH
         bRZKiksf0p36vvoC9BfCUl+dd0ilVGItU/K0o/gjJ3NXH/nYdS4fb707RCJSTEQKwIno
         exmrd27esYflXrW6+PTQVuOrDulp7bEyYUHMajAlubNo3gSSRHDS8kdmACnlVbhBVS/C
         ymIUmK9ZkuZUbR11j4DYPpDYLgbJMMM6dD7Krvxh63qZE4HJwebsaAwvKj4Mtzp0CeKh
         HW2QCOlavo1neZKkELV8cRrIprQdJv4APjLQuPhIdFYOatiC3OsXTmhQXh3j5SFk3BMq
         GLUg==
X-Forwarded-Encrypted: i=1; AHgh+RqjZoD1BxlByzjxTnCAadxeTjK6own0oDqO2yavaj6Li/tk+B7afW4cjJH2+1dy6+YNPTW6+ZoV731tYhc=@vger.kernel.org
X-Gm-Message-State: AFuF++kSHR9Mr8PoATSBx/K+MEZuOniof472l97DZyZpqk3/RA270J6h
	zTof4v4oaD9nq/HoNTqEV5qQJakALJqsSFblEirLzB7vF6m/z41QU4JPkuBCsn7cCTQOm6zhrA0
	yX76gaeADMImc+nlQyH0MlznpEHgXf51S5BGT5ssTgniFcQPV4AdGzjvxd352RSXyKso=
X-Gm-Gg: AR+sD11N2pCQabVMHIeF3Lq/kFe4FEzZkVzLtK3+1zPIuVrC2p25jTiPgvYpgqMjK1P
	PI24W+X5K67DjUd+Pu87bFuT7okFwlCaxQgCY9ZWn5KADh6pdO4sFKvxcRncOslWk/5ogifGJqK
	JpTAmyOGgYsV3CRf4aOBO7g74jfxcYv2PHLI0PGPtRm6tXavqbEoWc9+D5G96db0H816iml/UV1
	f1/7vS82KDLyZxz/Suh3T5EPESQyCgnM9vTJryMJxVKKKTPsoJMVzAfv5cPk2kXUtEj+wm3rIPS
	v0VoujJMj4W2gnhN+t4R8c4RsBi1XgJb2Pt3uxOCYVDCHK3BmcvXdBp3Dh6UnKKCE6qckbWtq3d
	C47nPxCPTmwQMaK9B8x5DrDUdVBUPgNiH0Q==
X-Received: by 2002:a17:90a:dfd0:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3966d3a8f3amr15824160a91.8.1787750763540;
        Wed, 26 Aug 2026 06:26:03 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3966d3a8f3amr15823968a91.8.1787750762781;
        Wed, 26 Aug 2026 06:26:02 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:02 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v4 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Wed, 26 Aug 2026 18:55:48 +0530
Message-Id: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzpjmoC/3XMzQqDMAzA8VeRnldpa3F2p73H2CHWdBbmx8wsG
 +K7r3oRZF4C/5D8JkY4eCR2SSY2YPDkuzaGPiXM1tA+kPsqNlNC5SIXhldjzwlpuSOOoMACWGm
 MZvGlH9D5z8rd7rFrT+9u+K56kMv2AAqSS65yk2koS+Mgu3ZE6WuEp+2aJo2DLV5Qm3EWxc5QX
 PAKtHDGmgJUeWBkm1EovTOyaOhSSFOh0yj+GfM8/wAmIqArNwEAAA==
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=2213;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=9P/mxSvpF3bR3tFDHNmq61Ve/osDwxIH3CqbWQqC31s=;
 b=4xm/wk6ic1DGhn00WjuMS8HNa86/c05hLVp4f0R7zF9xenCMKZMI3wJW0E3feBNaMh6c/zsHG
 t1mlONpYoqTDhC84KX0WKzxs7vtwsg2xsjynmroapNTdzt/Ie0juo/4
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: XVjqzyNUfueT-9wB8wvdNW7e_l9hMZD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX0U6Jyqxfjn4Z
 57BWamqzyi7J0NWQYtiE0cdWFnLi+RMFyvDMcYUWzwRJprvXo7E2fnr9thU7WRW73jNbLskUocV
 VBNRRWFxBvt5uTYn7eTgZKd7qI74DhSdgq1z1RVkanSqAlZhhqKQyPzlJrhJVnXAxuUtZ5Z0Oa2
 m1OH+d5uoB3aLd8dC57iwP7kJmnc9Gc5HAqKE2lzifFjJ+5jB2mXJOx+DB/T/i8OsmUz4Qi6Jfw
 TUvyXidY1RyKlTLvmBSN8LXhQ7aGHPgNfrWiYtpPrsSr5KiIJcgRzE4AreXJRJODx0ARHWT6tBH
 YQE6CFL6v3p1laBjMnEJwxkWPm4A9oo5aeLfJnXzFxxF8S1vSqa5y1EBEb8PCmPNVr0k3GsELKj
 9/bQBX79wJmT48x7tJ2D1wNAYOsboYy03qsj8K3ff+17Kjj/O2vil1RdyEeI01Ow1VHZQhepikm
 eMCsfOtgt43sV7rEq5w==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ee96c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vdYYOim__DPnj8GFrYsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XVjqzyNUfueT-9wB8wvdNW7e_l9hMZD2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX5B0xOdF67XbT
 6Q9th0WrNZ/Gjn9vjWJWuTUL5PhHcPd4jG+jxEWcDpKWd0/BVwy4ROSQDjhcJGR9kAhZloxcjJl
 L/XKtTKPkHYGeTutN97MKmj8ooAD7hQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, some DT set:
  qcom,nsessions = <5>;
which duplicated sessions inline during context bank initialisation.
Upstream feedback indicated that this policy does not belong in DT and
should be handled at the driver level instead.

This series iterates over CB child nodes directly and synchronously,
replacing of_platform_populate(), and moves the ADSP session duplication
to the driver. The qcom,nsessions binding is deprecated in the same
series.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v4:
- Rebased on latest linux-next (a8406e6c0b79, 2026-08-25)
- Link to v3: https://lore.kernel.org/r/20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com

Changes in v3:
- Add patch to fix async probe race with of_platform_populate().
- Rename fastrpc_cb_probe() to fastrpc_cb_init().
- Reorder series: sync fix, nsessions, binding.
- Collect Reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com

Changes in v2:
- Added patch to deprecate the qcom,nsessions dt-binding.
- Kept the logic unchanged; only split into two patches.
- Link to v1: https://lore.kernel.org/r/20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com

---
Vinayak Katoch (3):
      misc: fastrpc: iterate CB nodes manually instead of of_platform_populate
      misc: fastrpc: move ADSP duplicate session creation to the driver
      dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   2 +
 drivers/misc/fastrpc.c                             | 112 +++++++++------------
 2 files changed, 48 insertions(+), 66 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

