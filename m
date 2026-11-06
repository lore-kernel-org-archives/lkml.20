Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975366;
	b=HUCsPBP02C0Q0nqGovyPZKv8Xnz6FhIYm7DfBrd0FOW/k7sEMxXN+X4yUVplee+JvM7q
	 TTe2ZS4qLWSkr1ETOk3VUnqwqEcCk9UmOLBb03GBxfeGA0Ymvql+vDvisofM1KeVw/9nq
	 10mH/8vy7QCyYNVlPV3cMhyvG3ANdzscBWm88EZRsZ/k9h2bdQM6Lb6yFQp5oL0z8nVK4
	 zmid9d90a8Y5Qb/+nsXk02DsX3FJzadCajaIJsM22SfVmRA3Sph/ptwzW6x8ZVnO8VcrH
	 mxl8u//eX1bcXsrDKs5PN2A8buOhFrT4Fz9Y122/4yxqUHD9M7FiLXN//u7JH5Zvo+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gT8k/UqrXcceVrd65LBPRzbdDHfe+aeDILXl24N3ino=;
	b=njgGzoPg7/ua+KFW4J0PNFM6kj56bXM4X5V97hHO8XbLrVtBGM5eHKnSMukAH+Mh7Y+W
	 XcwyVBx7nMKJ+BWKBRB2p/OIObcKYD/+xskK38P7tAK+sYuA9fyG6FAfNWTd0zXGCKlkZ
	 ++fbPSb19Gw3D3W+XyTm7eVSsYnSeIpkiiDn2TfVMjQvdtOpteFKBSYpkY5PBtFdBXJpk
	 ymmUgjlHlk5v2PIhFq5S8V26sAcSVo7YI6z46ZK/xXPdV/Mg0MP+6JUd22WSmdt0XjOck
	 aIG9GJQhe74kZ+L74zAAdtF5CozZP1jNkvS/0V4GN7C8HsALpHSSxRAIvOSFCBMlr1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LeR9nlih;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jbgbw0HJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669F606D804
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4669F606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LeR9nlih;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jbgbw0HJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ6tY012155
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 14:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gT8k/UqrXcceVrd65LBPRz
	bdDHfe+aeDILXl24N3ino=; b=LeR9nlih/O6bd9Pof1XTFMZQsfDvQ0pjgpcyZR
	GuvROnJOl4nDeQ2henoBCF3Gb39vXv7jr53x5E3NHRJMrVsrUPaD7i7MwY+6VWSE
	aKh1Vc+v6HpLblcXNnI8I5be7XPKz0EhrhvAyTiHFy8P/ef8UmjG/iT1evqmRc3u
	01Phy9aqBARSsabcjivqQGnghVaMgtoSNNcmCIYgdsLwCkTkdQ/lF869lKy3qMwd
	d68JxymGoeBJ56dxiAxIIvtq9s9zdqpgFzri8ysuYfkHMgAartqCv55QLx0FsWvq
	V1cJryZph/OP+t9G05/IVczq7JXMp7zGXuu/kul+rVIPWGfQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa355b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:29:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso576986b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975364; x=1794580164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gT8k/UqrXcceVrd65LBPRzbdDHfe+aeDILXl24N3ino=;
        b=Jbgbw0HJA6CpNAozK7ruLE/T/xlmr9LtgLSeVMWNzMK80yRREQ172Pdk1pVp31euHO
         8jMVfc+RyEve/5wlwtlL2+m3+xQ82myMe3uT19X6SeBhgeJYq3mkXl5fzzjPzQvcoXkQ
         Eza8FacbNjApHYzSV/v6knFO0n4lJGiNaXely1Zw2uX8u+eYXO4+CPYD3o1J+CCFo6ta
         bx1u7ObT3f5pKLJY+OJlcj/K3MLyzjUycuH3G9OhDyiVF/LBbIhNfEB+hFeln2f5as5u
         0LHz372rfJ/DRBxdWHd9w8SzfRKXQk1i+/Qdii+S11SMrJ60ciuv3VDLaQuavrzqR8FR
         ruGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975364; x=1794580164;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gT8k/UqrXcceVrd65LBPRzbdDHfe+aeDILXl24N3ino=;
        b=Gqo5qMBXvHRcZeJQbtna+g0P6uzTArfgltOh8CG9SZc88TCGzvS8G98zaN2hLP7NHk
         wyo9QyDZagpvF+DU/WYWxFACvyUF+SnI8NGSjcqJ6V4jlEepV9jyIYq9u83rdtzcsenX
         t3Bafh/nlFizhbydKm5uGDgXTTekAQ1BzmCuIB501yXDXAX+cR08UgH3APtMDZcYC/Wb
         RyKz6gFmRpvhV1bc8S9iUqXE1SIAAsfCfFAPFY8K7uhaQ1ccq5v/va6xNac5Vp9cx4rd
         bF9adWFk4aFDbN+hJgKb6vNadYcRw9Sz/AGaQPQe9mdnHRtM/mgleAd3mPq767BY6CL5
         r6Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxyGfgbMIjSyq/EWSkJeVrva558JLuGs+5enK3weLJ4DhxGNF9UgVQSXKhyNq9dIAf3e/xyvvfpCNJaM/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z97Vwut2yDadtTQG12kzGsVczc3MI2hMsxyX8xVOUyKhc5i/aJN
	JO0IxALampMMT1Lvbpw9cXzspif6CHrKXkfwUsAG2kv2a+idX7jutARF2i1zs+cCUSchxYsg1j5
	KLN+omRkHNcfB1KxSnmsoM4BipZrJtT66ILeQ0IdzvmIWZoe3bLjnOXvxVHFl0MmEcUU=
X-Gm-Gg: AYBFou2vEVcF9Ja9v0eW6miniCMTNOl+EIw4n4t4UavnXWbl6kDdV9o7f0OjQTl+tG0
	UT633xsWt4w3r/dUGPGElHVVYX3LixEdUd9eyc3FW3yNYBDjvERpkwSd5JKGe3Kg7P4Ak+ELmZL
	JotiLrfNZ0k17J9Mwdclb6SxLGMyoDTxAnPuVuvIO9RFdLS0p1Dy1sYqD6IlyIwYX/9y6Oz+gt4
	bfrxYXJm08limab31XnQMLa+NCsxpQvOrxuGUHCfjoacAHfTpmLeXNQC+PWcAt91yyq9R4uDY0i
	Habdefvz6cdKxYcD+jigxk3C/iejPuBefuLd5RLxn2OZTKR0uYWCfU4E2Wa/XG7NkEy8oSNOv1o
	AW2zbR31xF+ySgSEGTKzphjEnAqC8UPutzcczd10YNqCrhgE+eqc6mk68X5pajIpQw0SfyRcTHL
	3sG7ItVw==
X-Received: by 2002:a05:6a00:a02:b0:898:f575:7bec with SMTP id d2e1a72fcca58-8b37ac9efe2mr2503138b3a.17.1793975363982;
        Fri, 06 Nov 2026 06:29:23 -0800 (PST)
X-Received: by 2002:a05:6a00:a02:b0:898:f575:7bec with SMTP id d2e1a72fcca58-8b37ac9efe2mr2503111b3a.17.1793975363386;
        Fri, 06 Nov 2026 06:29:23 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm690244b3a.26.2026.11.06.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:29:23 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] i2c: qcom-geni: Quiesce hardware on shutdown and
 panic
Date: Fri, 06 Nov 2026 19:59:15 +0530
Message-Id: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADvk7WoC/42OQQ6CMBREr0K69hNaUkBX3sOwKO2vfCMttoAaw
 t0FjHs3k7xkMm9mFjEQRnZKZhZwokjerSAOCdOtclcEMiszkYkiq3gJyhiI7TgY/3SgnIFeOdL
 g/ECWMID1AUhoKEqRW51ZKUtk61of0NJrN13qL8exuaEetvmt0VIcfHjvVya+9X7W6m/rxCGDo
 815I61CaYuzjzF9jOqufdela7B6WZYPZjGvhPcAAAA=
X-Change-ID: 20260817-add-shutdown-and-panic-notifier-for-i2c-6723fc0f557e
To: konrad.dybcio@oss.qualcomm.com,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793975360; l=1840;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=64FEtBBjlH7O3UHiksty7i2Aaty9sIEf/YcPqDv1UyI=;
 b=Cw1HQQGcaCrsB8h7/fK1gkS71C/QX4vG2RCtxkK3GL5S5DEKkAupH5OBPRQLdKB5Vu4rHcFOY
 pmJFLMd0CVFDj6w7EmczWHeyw2qTmVgFkGAPrCBIevPnt880KeJ//O6
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: CcWg2Wv8Y4wMp4gcsYwllgioBUm5oR_r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX/cH+oVgQI6XH
 G3odV6Xc3JRyfamL+9mzU0EuLNlCAmSvnYNGS9EpL4FM3cGcf+6Zcg7t7ChKssEmFV9IVQ1NiJP
 lF4kUwsd2a1rT7rkIDH7bwxbo3e11pE=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aede445 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zZcfVseh7FeFBNu0234A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX499tkrltzK/N
 nqX7mPpgvYSMqNiNEx9uIMBteNbJB846C4ArgKEQYRr4TezBqTOru7RmHXKxnBe/cNCGpWdjivB
 i6a/mFHHpawClho33dngRxj3vAq73D/ZSI2+FrVrZFuZyqqhKNcimrcVfTDe3nSuVavaEwj3QgH
 0A5DuWYNc3g+9OsJzl7iV3xN1rVQ1xr9OHJ//dHaMgVO22ZQI05WIoMCf9LMJNXDlLEH9qeqjXb
 8Vmdfx+2Iiy/qSLz6N5zxVCZN4Zmike360L9UvrGOUHSzfauH66anbVIZ8Hli7SF/MZ1ttiYJVz
 P0OYNgOSmWCF+ix/JI7/znydd2KWPa+4A0CHYP7E6mbun97Q4erotVwhV9IrEfcHYSQdCy3rcCk
 1+Ogb7Apb5BYhrx2y8dYyFoN+7c4ueT25Sp2SAxffhy8kYUh8dYGbcLbIE877TPhtur1cglX6s/
 yDR4iQ904skDWI34Hmw==
X-Proofpoint-ORIG-GUID: CcWg2Wv8Y4wMp4gcsYwllgioBUm5oR_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060057

This series hardens the GENI I2C driver against two related VM-teardown
scenarios where an in-flight I2C DMA transfer can trigger SMMU context
faults after the VM's memory context has already been invalidated.

Patch 1 adds a shutdown callback that cancels/aborts any in-progress
GENI or GPI DMA transfer and resets the TX/RX FSMs before a normal
reboot proceeds, so the hardware is left idle rather than mid-transfer.

Patch 2 adds a panic notifier that marks the I2C adapter suspended and
performs the same cancel/abort/DMA-reset cleanup as the shutdown path,
using atomic-context-safe DMA termination since panic notifiers cannot
sleep.

Together these prevent both hardware state corruption on reboot and
SMMU faults (which can affect other VMs sharing the same SMMU instance)
during VM shutdown/crash.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Log an error if the TX/RX DMA FSM reset times out in geni_i2c_quiesce()
  instead of silently ignoring the readl_poll_timeout_atomic() result
- Drop the duplicate i2c_mark_adapter_suspended() call from the panic
  notifier, geni_i2c_quiesce() already marks the adapter suspended
- Link to v1: https://patch.msgid.link/20260818-add-shutdown-and-panic-notifier-for-i2c-v1-0-9f31b5fae5f6@oss.qualcomm.com

---
Praveen Talari (2):
      i2c: qcom-geni: Add shutdown callback to quiesce hardware on reboot
      i2c: qcom-geni: Add panic notifier to prevent transfers during panic

 drivers/i2c/busses/i2c-qcom-geni.c | 79 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 3 deletions(-)
---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260817-add-shutdown-and-panic-notifier-for-i2c-6723fc0f557e

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

