Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737033;
	b=XD0LsqHrlOZOGTWYnWobIp9Tu/yqQtl8+6HVgLgLCYAr8+o2zjTa6LqsqI51V5n7E4jf
	 V+dxaPUdehuJhHKMQs+VhU5XsVGe2V2aLNHQ9tpDREF54LMsrBBWnFXrhOK7BZS9PfBdA
	 ftv4/a9bSh3d/0noIYWQQKD8T4wykD/l39wNZR/41Pvx8uAzufV4XuMSsXMsCglMDRvAG
	 PIdS/SwR/XyEoDc3pmrFUNtD/GmQnFiraDD3mR4idhhub7+fACDRmAVTNQzKy33LblReI
	 qM8ckjc/t/sChxrh8DUqaSg8dsmJl2ntMxEICduygSxkzN3uT/JzCKPwQzLBus8skmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dajxrEaDockhm1J9VMJl3eglzhZN5GaUOBfpcXrRGjM=;
	b=Toh1kZ4Bw2e5yGyTpQlkKR8znXzRJRJCWo7aLL67ByFkTCu9TJYDK9DcnUtz3BzFFTp6
	 8PmsNye0xfKntu9Muu8midntZg419nGZew+U6yGbffcJ4TEhn8o6NS3PrsQ/RM1UxD5Tj
	 HFlXH2V5X+N1JtRfPXFHKuFCpoiZ8IwZs6vxVpWIEp6QYPlTI33iOyLKjaEorVX99HkEr
	 wxW9GVeN215hV3QP9iEJn212WUM/W9MMCegyXGm05kWyRKjJl4khytcQQiEgzkMXNo7bi
	 sHLI5c3gJ6ggwJl+VgeyGXn0YXX+m8OBMQ1O+PaQ6SDhy/Pt1Aj3+aI56EJoUPjz2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZJNfaURT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qa7Ahlfy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A7606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00A7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZJNfaURT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qa7Ahlfy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IYsZB2710149
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 20:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dajxrEaDockhm1J9VMJl3eglzhZN5GaUOBf
	pcXrRGjM=; b=ZJNfaURTJaYDh4iNUJTByJNVwr/sZiboWwalJLMPCSrliq+bZGT
	I5PCq50mdtrOW5eWVdV4FRk5MBsa9ex4wNVHtzn0op2K93bPIASvPzri/EmeRPOo
	m3aSOcp7ThPL5U0O77Y6xqG4Zt2knE5gTKiwRUT/5d+8TrbOsisnJ2RN1kcFMcs4
	2t4QZiZJBj8ftkhUuoGM4B1o9GlEts/5oJcB8ESLvt/MUVKWsHNEiCYSK2NLgkkB
	hl1BnIDLaZwQEIuA10Pjwc42DlKr/mYGjwGh5Ifc4fLPXbGNRl4mj8eNP9p+iO+l
	hn9kED1pWHaKBMlOE2yotZ4M0S8g7LYxylQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bsn12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:17:12 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so1628241.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793737031; x=1794341831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dajxrEaDockhm1J9VMJl3eglzhZN5GaUOBfpcXrRGjM=;
        b=Qa7AhlfyzjSWBTbPnh0qWqP2nyHy2eVqgi3U2TOMyXfFPEZn+JtEpSg4WOK8f8q7yf
         2IfFUjHuTrOPj96VuOVIFyPAZ3s5kCUcryjcQ2kgUhNeswr8LgU1P8CAo2zg/wIb6kta
         gdiUozcEgmDtkzcFVfTHqQ9DqgMMNKnblT8dXUXdQWH7wOt8M9BmsSr5UnkItGAZf15B
         0G/PXEPJYvIyhKcE/FvVtOKwhcdmNYFJWfigs2O2devsp4OVBNIEzbGnATrwPjanAUOo
         AW8vYaiFU7mpp6d/kNSZSmiJuVb4alP0cT+arFmVyc25MNYWgKeAajGQ2+T8fsevTwhs
         nf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737031; x=1794341831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dajxrEaDockhm1J9VMJl3eglzhZN5GaUOBfpcXrRGjM=;
        b=m34uqjxL2GpA34t67XBf48dmBQ3u0Dl3wuIXlts+gg0yI6WMVMA14w2V6s2IUHH2W2
         yZARKYcan7d2hvyshbpPOtXL2MCkBdTQqDWAE9yOSVjhscNt1pIIbZKywrCgxuxIY6hl
         pvhJaOcRl5l0LrjLIpLsPQEuWguc4rIO3TikDjLZBcSzrAfGgMaLLULjjskBIF8L2cUA
         XXyTJoR6wHrTuSz9JscNE94q4NwCx/0QMLJEb9+oKvI/n8Swor8lylnRIQXf+pDpTDQp
         NXr2jqkYtNxK38zkrXP+FVri0xLcxI/wNrPxNFdSL3p+wXuV80U2yJJZtEcoGH7X8nQs
         zwoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA5VpFPA0R9cwRG5pOjNl0yPIxK2H/bl+9OEalZP7YdhWxYFGSYIw7eLCZhhzEJspQGCvEr0UgUbOd/Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g+9bZz6qg3v56AJN8iliu6wLBdcDLbFiA9iCiotxI26SmWCEc
	WmngmnMhkDiTBZlHDfltdn3WtOwqVrJTcffot8Tq2YuhwZTVL3VvsVV9gy6eslpRnsdcPM8Woii
	GkTSO+qKMQIKITx2oJQxPJYvt5Er0KWKd7I3kKwFudyFF/Sfi0CHi+Bh+fnQ0IiES/fM=
X-Gm-Gg: AYBFou0vRT4lvOj0O6hz+yEkNC44Q95xYwwB1NTXjjCNywNBuMmDfNyUgBYy2A+KzZM
	m69h5KZ1kB5e5PmFpeZuYM+/b6/uGl2ES4l38Oyadvt6emm1lxDL81fww6x3L+Y7oks05vuuEz8
	/zyzBnMAyiMx4JzkwvLoM6G/3npV7jNxaDPvWbWcmgB/ISOesJ71RwmQpCzW4MNl5QlKkRoKBlt
	d+g8UISBc04Owd2Y1Rebxk6+0haI9b4CeCfQx/V2ikhRqYttbLzWQP/2g6xBalB9tqSKuJ60FYi
	M6MCPPvr0RmeYSgH7A5y8O8MTUnakhF4zag88Yu0bJcWt0llar4LpAe1yuzqbbm9vSVHMQxfqdR
	8SBvY4dgqkbE1kpOayA2IJXQ8ps0LVPzeWIShMtcJXg3RguvYzjsU8S1vPoLGtQ==
X-Received: by 2002:a05:6102:3707:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7d072d11c63mr4757914137.30.1793737031046;
        Tue, 03 Nov 2026 12:17:11 -0800 (PST)
X-Received: by 2002:a05:6102:3707:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7d072d11c63mr4757906137.30.1793737030545;
        Tue, 03 Nov 2026 12:17:10 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd5fc954sm329561f8f.59.2026.11.03.12.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:17:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] .get_maintainer.ignore: Add Krzysztof Kozlowski
Date: Tue,  3 Nov 2026 21:17:03 +0100
Message-ID: <20261103201702.350717-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=807; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ONnrwjPCepjizLymY2UDj1q658PO47z66TSpNerWuEY=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGrqQT6huDSNyz7WGI6oQgrLqKNEgfGjWc3cGDRp5kMsbBcHc
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJq6kE+AAoJEME3ZuaGi4PXpVEP/jWM
 3AFEqrtn3XUCvPNn5WNUKL/aXL7mlE9fymMMLKV6zDh6rbs45Qp6U9hyK67GcnIOVHTP3qgoWhM
 icDsIPAe4Em4T9SGGhkdG6WA9ki88Hjpechs0Z7M4X9nRjqQazSIOiAYRG+U1/ngkKWwNAeC9bQ
 ZsYExNrmE35DGxURpsSSH4XMmB1OithDKf5gH0q7Jr1gBPOhQOT989gyvo+dxL0bPTZeo0GlGaM
 S+dAYml3c3hKLdwwMM30LhY3wXvqt+Tw8buAFlFOLV9w6y1tCRaaihuYQKc+3zUtCPr4f3Aq+oA
 yPs/1UehFWn4w/MDBNbs5qg41tLwbmtHQGzyNiBmoTxRGizfwzkRW0p1A3KgAqgPASmkR77pWGE
 Fi+b6IoK3cvTPtrUnbjoRIiS6JWUgAjmfg3SW99/tIcIleXI2PqA/RWJSAzqvppyYLd+M7wPbmw
 sOaxo4Lu8JJzLkfxxyXjWBuvHgeIkChRJ71/9UKMYHMrT1+oOvVZ40LJjCejbTHDlpSp7Lr6c1k
 63Y8qleu6tStNcEgXHFAip2RLCGPJYZLK9pjqp6BI6dmLDuAxFzTAXBDOsw9n9Nz1gznx4n6DwN
 i2q3dfH8ZjAhc410MYj9M9Kq1zb42hVoge32hji5E5xIWj6H3FKFwnhOvHXKlm6KZooi+QDtliU IYkoI
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX1bRkzzKe4nbA
 ZKrRBlB1OFodYXCV966ZLgMqTxcAmFqWOv3ZGEubsdd/ocXrGPZvRhxi97ADfeBCEtAd8ni53Ug
 /w39HnTYExPMMdRLyaR4ea5NPVdZj7U=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea4148 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8 a=WPyIoOwQAAAA:8
 a=4soc8nNHfR5fbkWxQKQA:9 a=TOPH6uDL9cOC6tEoww4z:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=S-HzPIwwDS8t1QcwSuWs:22
X-Proofpoint-ORIG-GUID: ARfCMUq3llhG6VzrVoJpSOVOx7zgSbhC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX5pnQ7VjAAD62
 kzB/54RhGY0GOphY2WVqEYABy66BdIUsd0xGQ9xNYpv3FAGWwUZc84vPQ0jhvt9LTUGn3gYAtQe
 LcBuVCvZe01fA4Ud0l1Eh3sFY9UMD+IvwaftKSiu38SkSXE3CR0/bnnUb1hSgZU3WNrsvpjFq3B
 R1pQQfnNLYLp84m08NKLUwZ6DSxT2nBqyM276vzcR/zwaL30EqdZTnzGNrLNKKKMyzlL1+G1Sm8
 NSIpTlPxL628gP9oY7WMvTmFPKc+BA7Uqvwb4Fs+dpixSDSstUN5l5o+9BXLMJzaiAZl+lEkKV2
 joPPNQGvBoDT8qUrv1RSZHCQ7eYygbXa6X15WfyIe0BIfS4iQHrauTiveMax9SpRz0CT7sNK2Ix
 seFrv8QyBJxmAUZaFjm3mSTteiTrX9OhQXSm49RNa50233Ridze7uBHO9BkSNHzLTiKewbKOTsG
 Iykyz12nBBmlw9IxTyw==
X-Proofpoint-GUID: ARfCMUq3llhG6VzrVoJpSOVOx7zgSbhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

I have been doing various drive-by all over the driver tree, so my email
address does pop-up purely because of past commits.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .get_maintainer.ignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.get_maintainer.ignore b/.get_maintainer.ignore
index a5946cb30cf9..230b001d7f24 100644
--- a/.get_maintainer.ignore
+++ b/.get_maintainer.ignore
@@ -7,6 +7,7 @@ Jeff Kirsher <jeffrey.t.kirsher@intel.com>
 Johannes Berg <johannes.berg@intel.com>
 Johannes Berg <johannes@sipsolutions.net>
 Kees Cook <kees@kernel.org>
+Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
 Marc Gonzalez <marc.w.gonzalez@free.fr>
 Nathan Chancellor <nathan@kernel.org>
 Ralf Baechle <ralf@linux-mips.org>
-- 
2.53.0

