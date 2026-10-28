Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194756;
	b=DMeMoL4aE1MOgUQ4h28w/fMao/IVZZHz3TJgVx5pUudeaE3ccopWCt8zLtF9yRCpzf4M
	 DTr5i/3fa4s7yl+sU3C2etgJWVrkwMxSeGr7abH9n6cDnY9xzefCWHmwT3EUjvueXX7iv
	 zmzLW6771SZTqusc76zzDzMapNQPoWYbzLJ5RcBNsH+8lc0sjCfaWUuDEsCn9CnQOyoaJ
	 uuqCEbeCLXUkMaPgJ42ipWp3nSq37oGKNCGgEBLuLCQw9KNyGQBcRSEC5imqkCaMXRppk
	 wKJoo41Jc9WadAvpv3JYmNuBOygpprdNkICzuYETujYNQb9i7hlwJshiPTVCHminlpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m+Ne4+mem7clbk7diUwLgzqxNtPillBEGVAT9SSEH4U=;
	b=c824fVCayy4KmB1bvu6aXgbtqvDczbHG7wIhWGfZacauNbhQc9rmTU8qa5q+zInZz46q
	 M6TvXvGRauSV6AeHfkBoElQ8yAQ4jVc5S9XLohb8FvbDm4JSuTKf0qQDdFy2CszyIocL6
	 a6FlJ1gDZ6+yxKSeP15TH16jxjA2pdJC+Xj18aVEDpCkoUwBCZznToZhVXexeE+yfgrfj
	 CG1pBIqBFkCIfKulmJJ01SMGzYyWXmLJk4Sdp/4tavwsvN2L7SJb6FpH6wdzSG9DGp4pQ
	 RpUTOWKCpzuFo70TJ1l6sCGPPss8S9M9hTAcXwyaV6xcwwq/R4Jcvm1rmIoIv5Vu48Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2j29zY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XWxQ6PMN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94653606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94653606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2j29zY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XWxQ6PMN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIUCU3917676
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m+Ne4+mem7clbk7diUwLgz
	qxNtPillBEGVAT9SSEH4U=; b=di2j29zYseF2kVmIw9AQuqgbb83seqjgGCS0rE
	93NcV2yt+nM8bkTMmUnT7w+xLKFIb7vIZ61Rk7MrF0NFxJMneICNpGe4eJEXb+6S
	Op9um7CxhQeyBtbHcDMw24+lRSTCbHHovfp7K1tjtYDdbI3oK204pygbY2/nMqd/
	9y19Z7wMIwdDO8Zs0bIBD9BZ+217o1oHyG9tMBfbkwqKprZsLS3FjcyoR8EIwT0M
	n63CgS5fVAC3TLCp1rrpfRHA8HNgmg7XcRad9LdUr5O4r7PDEmACoYyl3nsh0gEE
	l88Y0W0IyLOk4wN3Ixv7h2keQF889jm5Ukjw5CexK+zo5Trw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtng2ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:39:14 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0ef88fb27so664467b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194754; x=1793799554; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+Ne4+mem7clbk7diUwLgzqxNtPillBEGVAT9SSEH4U=;
        b=XWxQ6PMNKGJ+IuDt7DI6eAAJduV8gd4a0ZjWRVdLSiz9ogH6wgsJoJ7cGEbo9z5UDj
         FziMeK5auMnlVbOcyrNEE0rD9FywGvMTWeTQtCdFk4mNK6bUB94BNcQzK2BaZGlM4dLD
         HYs1ffKyQrZhNRq7l2xnSrXYX6mi/RYYxe1lV3S0762NOt6le3+MWBMG5E4ZVDZH2nw6
         /K/jnC/7phIfOlIPsYm7vyc5pRsnfk6D9tUrnZF8Hi2vC2UNgcmTI9zgJAg+a0zzbj50
         b/KT6Pz6tLwOgtXlJBsiBG5ZnG07j1z7jfT0agStDf5xIrL0b8vwpWKpKEPIE8e8kFxP
         W+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194754; x=1793799554;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m+Ne4+mem7clbk7diUwLgzqxNtPillBEGVAT9SSEH4U=;
        b=xfyGY535RDC4kyoJj4wOEWJDSnSoesM4SFta2irBzxoYIWjSVYccjB9BdhhY52tm/E
         Y+n/iOsNk4HPVPDEiE2HQxE4ET0pTS/5PGeL6LTjt4mLE0fa3kg1d9Kzv6ru6TaprUTP
         gpe0EhBM50XpmVxwrVr8gtBtnBrxxngr+loFwyzaiDK27FhFFJOPnrf0QEwGjZ5UWaRG
         exe1SoBGHg/P5ri3NvobznkP5ttEgaZ9QO8Mw/4DqtplcYg41WOsCLY1gDMrANR3xUBz
         feP6IKw+LD2fyRmteaNUN07pURt5PBPMNYAFhTGAjzqTq8R0L6ipsvxqru1VKPLesY2C
         V5Ng==
X-Forwarded-Encrypted: i=1; AKwUvByiCJkfotPIpfj2I3oVU52mxHBAr8w/oaYq20mTY8lYm8lapMJ7IsEd3zqFXwq5mayXzofB2vOyROxhTg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzKFduhCORiFoKgiZD4KmZsZnNEz4fM1srSc+/XC6oH/JB8pPW
	c2lAUJHvVgAUonBpdqL2BLmNh+UTlkt1fhCfS1b01htvgiYesyD/ZM1fQyBPdqv4VuooogLHfPR
	2v73HJ3d9LHvyxY5agpxr3CO+SRupg04KyavE7pizvMfduAGN2Ue/5CkqpoB0uFDGONTmbTvd7f
	K1tBRk
X-Gm-Gg: AYBFou1QLG+W7fj1BpiFfyuR/YAXY5K/ReRCNRqEmhxbeHm4neN+nXwIG/TKKZRD9SG
	goTK7PJGz3Af4WXKuifc4G4SbV4KVytld2EVpcm1s0kecBa+OZr11gWF2Y3TsoI2IXZYX6FXJrz
	S29Zl66L4Ydc9szawBJ2tu4D1wfrqOxiZH7g2S2E18cR2DWD9Jy4oIlRrzJXMB/Wt2oXYaus2NF
	wZisucvkh8uK0EFwk9l02pCnHSEZwsDEP5v2M0HLOyyCRpUta0QCafrzWt8MmWfLSAjwxpw4BeD
	7M0SlLtQiFmZPZEhv+2hiHUd4ThHo9WNyLGtCkB5CLcA7js2vSfjpSsZckrY2K8ZhASW59CK0fS
	zsdsO1i7sWOWG4DxcSmR5eZbmX/BvgjnQ9FS1OZMlb2rB2sszoJM4pnXp4997vj53sizPu2RPoY
	duTb/8eV1xsgEB66gotUxD
X-Received: by 2002:a05:690c:a083:10b0:8b1:a4b1:7abd with SMTP id 00721157ae682-8b1b595b3femr22089477b3.1.1793194754004;
        Wed, 28 Oct 2026 06:39:14 -0700 (PDT)
X-Received: by 2002:a05:690c:a083:10b0:8b1:a4b1:7abd with SMTP id 00721157ae682-8b1b595b3femr22089197b3.1.1793194753373;
        Wed, 28 Oct 2026 06:39:13 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e6365b6sm28184207b3.41.2026.10.28.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:39:12 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 06:39:09 -0700
Subject: [PATCH] Bluetooth: hci_uart: Remove redundant NVMEM dependency
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
Message-Id: <20261028-fix_kconf-v1-1-624788921368@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPz64WoC/yXM4QpAMBSG4VvR+W01S4xbkWRzxqFGG1LavRt+P
 n1f7w0eHaGHOrnB4UmeVhuRpQnoqbcjMhqiQXBRZFxIZujqFr1aw/JBoixzqVRlIP43h3H8Wk3
 72x9qRr2/AQjhAeK8BzhtAAAA
X-Change-ID: 20261028-fix_kconf-4d8e8748bb9f
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: r71o_wo0OZQjruMElHJj3vRKrgE8ddsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfX2qVoBwFxgow/
 /cdJWClw02OI4OZ0JwQIcq/MIyzIO6KtXJFAxVUqNVCemZhtcfJqkmthkgJ4NlejWCWbw9Omm47
 LmwQK95qZnczS7O4LYoB0o/GdpCAMo08O/WYdFOWv6HAkkjgQqQAdOy/+oo4C4zT8kMy78o67CP
 oDS6Eb43tndOcYwmaMfKdqflGcOca/siRr9280FWOtCF7WLU5EcD4Mxk/qo9hanNDsFFjvWDuWb
 s7/k0WR6i96LtcE4YUEcdjEdHhnaMaJr+XslAW4w84RC5EmWRQa9AFvk3AiVUD2se/OwCrfgwyu
 v+6siVJORgg6ZH1PLuJG7+cUXem0OFNh3J4zs+ENqDCplg7Zyxc6uc2qWoi4j2ZcmAZdiy0kKPE
 fJ1zjni23F5fThX5fheUG+AyPKR/1aLchpDQL3k3LmPMr0l2Vk/2dG/PpN+vudPR7nLaDNF17dN
 ben9tR6zcky8pDCC7iw==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae1fb02 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4keN-7vRS7seC8qMJf0A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: r71o_wo0OZQjruMElHJj3vRKrgE8ddsn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfXz6ku5j7HjjHE
 AF2lB0RG9CQ5ZuzztusB+TocVWc1SFHRO9VMdkya/OE3p/uvN+8BH/c6cew5GsIZdjQI66AyrcK
 DL6pTYFKGa8DQKTrasWLvaCzKwyV7rY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280054

The dependency always evaluates to y since the following commit changed
NVMEM type from tristate to bool:

Commit 2a37ce25d9f2 ("nvmem: disallow modular CONFIG_NVMEM")

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 68929d12f608..fd4525255dd6 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -113,17 +113,16 @@ config BT_HCIBTSDIO
 	  SDIO interface.
 
 	  Say Y here to compile support for Bluetooth SDIO devices into the
 	  kernel or say M to compile it as module (btsdio).
 
 config BT_HCIUART
 	tristate "HCI UART driver"
 	depends on SERIAL_DEV_BUS || !SERIAL_DEV_BUS
-	depends on NVMEM || !NVMEM
 	depends on POWER_SEQUENCING || !POWER_SEQUENCING
 	depends on TTY
 	help
 	  Bluetooth HCI UART driver.
 	  This driver is required if you want to use Bluetooth devices with
 	  serial port interface. You will also need this driver if you have
 	  UART based Bluetooth PCMCIA and CF devices like Xircom Credit Card
 	  adapter and BrainBoxes Bluetooth PC Card.

---
base-commit: 47d4d9f67e92d56ef3965f2727f9c98a5a611368
change-id: 20261028-fix_kconf-4d8e8748bb9f

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

