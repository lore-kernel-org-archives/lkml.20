Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783509;
	b=FJdvdet4KvMRRFQ6sBXmkpydc7+wDGp3PK+S5MFHBYgZsCsFTOEJayWhzgBPxtz6CVcg
	 iZ2NpUp1boIIXhJ+9J32O46L8Z3KbA8TIlL5kRjCs2ur5i0+rQBrlhLJyxVs0TUuQM4gi
	 zpUbbAfLB2jXXMiCzHFxPeZQO7K7kUNIBglDrCY9xydSfZ4pjDBuRx9ik/Aj8uuE2+54B
	 CoYlpDoJIEb8ZwMOZ82DGNEXBrKFZJhVZ+gj3XDi/vGdNIvm8djWXPYVkxzfIkL7Hdsos
	 jtJ2bZO5kL4EAwtHyDSvg0fW1WVv8FHDNIUh6bnMzJ7jejsmLPNOWJwNbwsHv7THuOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H2B5SGJlFgy21hJZry/CquPSo2DWZ1AoJ09UdiQ0LRo=;
	b=wBorYeqtR6SonQKe5FsZAiKdI3v4qztlPMl11BKikczzQugpvHZtVimL1MU1mHArs/Pz
	 VyMu8XEhVWnYX8RMij/rqnQjh1JZhVkqVgpS0OE7X39cGtvq7/BdZhfSdawZzxHqatRa7
	 uKA3qMZPQPZeFvjYvaH/ShLWFIhIAskBjRaT5CJZJoFApahyPV2WMzAKvsbfp6thfd3zg
	 1lQhwCEIKVWPnWVMPWTh52c0LgBncUBpb6fVHLT35DRb+gydlPgUJKnCO8PL+3c4Bc4DW
	 wqKJpN3yDiwGy7vloj0MvlE88uYUPdf4wc0Ynra8hQJhDR5rfW+Zz0I2D5TmOKmmXtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hys0TX5T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQJoNn6J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865EF606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hys0TX5T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQJoNn6J
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KuPL715428
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H2B5SGJlFgy21hJZry/Cqu
	PSo2DWZ1AoJ09UdiQ0LRo=; b=hys0TX5TBZYlzyDg42eQBNIgnHgwauEItfK7UG
	396IvuvL/C3oXqDXI9oQknLGifomiwibAuomRz92eqGThtWw2+zYdu7fIHS6TWA9
	2wFy4DBL5AkcQRiQqpqNjIgs8xIA/UA75Lrcua8uBUcIEmnNBX34ePCJgDMtZTR4
	cwhPuE31+CGXuIM4dsw7Kj0pMgz3c8kEbr6jczg5wsNpvbYuFmK20CmE+DVaDMc8
	SqysNxZEPj/riPjKukVCnhEvQHPvUdeFcQ5yWF399R9UPMOqrWGyCIn3ZDsFW+6R
	WrGYlTIHr4aY82EAORpaVKii9aXdxXe9uJYA3NYgodQgCNcw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y2y39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:11:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so838676a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783507; x=1794388307; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H2B5SGJlFgy21hJZry/CquPSo2DWZ1AoJ09UdiQ0LRo=;
        b=aQJoNn6JKjkq8xh3CBcxw8grJRnv3Wtj7KpoeIcgqezEqzrspLZRxYtMysLw2cnhv3
         Qd4V5QCrxi4pKDxARxUsjCiQkql0GcJTpIHH91aBaKHG3F4AClARi5eX/K0KfC67Xixj
         F6vvY2K9+xxrkloaIri0hE9AGavRGIzMo4luwIMNrH+fl11CF6la5dheflhZV14s0YUy
         r2+eSYHHU1E4yYOrONrCLcEiuEEXrv0zJJYTlfEkkqHURWlD4dVmXJi2K7F9F+lE0aP+
         rS/tfSHW75JOxSkArCc6GrigXGbxp7lgkjmJqvt0724YvTmnRMU5mEm+uRppsMMVpvUy
         nUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783507; x=1794388307;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H2B5SGJlFgy21hJZry/CquPSo2DWZ1AoJ09UdiQ0LRo=;
        b=N85Pm3mSLSCTDXSKoWbnNB1D2sTUc4mLQmlJ5wLuqhaBGEotYgAm/KJTwTj6iLdCkk
         lZuvpORgV5QteN7l5bDQKhScRJ3H/WT4mkzHrYAFcOlALEaZtU6AZCTzDUv4F5trBJ/M
         eFACv7GIK8h3jG4z9tFbjM8JXp6S0soVJFYQtUrZtQt3pUsqmn75SHn5LiIOFFRgoZ6Q
         dNS243ZwMG7XVs0hzv9sZ3HgUDHudDBrtBSpjjESKSIyWVmEbJYpJ4623IOan1j0KRfn
         f52VoCc0dLoyr3NF4pUkAthwaZQK6hk7j38AwfMKXyrqJCitcjFrukvPf/cB3oTORhIf
         YqFA==
X-Forwarded-Encrypted: i=1; AKwUvBxRryxDSaNZak7Iojq5/UPhOaHkqndU9osxu90jQSoPSq0K4qctek5AvsGV+o0O++9Ce+uwz47TGafM99k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mQDxqC6/qMhQClatSs0GpJS6tCiqR74GDglh2XljRIOkYY+zK
	qOIoJSEMzhCEYPZPNAbxNk3YHr4KBu0lYvVGOImm7qT9C+ghzGog9FB3uF1L8VOWCYa0AH5eQNC
	OJvHvSLQwBdK+xQIHKEQlSRgJkv1DsO2GujLRW0UG65OBPTR98KrAEkv1yfwYToZaBCM=
X-Gm-Gg: AYBFou34G7tF2M541VVogHSEAp4R6tou+hGKZMV2XicUkmb07ASXagrPRx0NX46/IOK
	nVtNxOamF7reD6TO7g0zZbIMxIHt2FMQnsIRk159+VI5Mk6VEYU7k+nLkxJNkbelWafOGx1AMVT
	SOhlSNk0UPUGs18ZdeoBW96wFS6y1bhBLKsZ3jR1LOrmP+aROo2baMKpHcPU4B/Ec0tiy8Mexrm
	5uGh6c0CnaxSNkV+0za9G6vsw8v+u89XLjcJaGx0Qhmde12WkFywwbX7KbtbDqWzSHaaLqBBfk7
	oNlw/62LjVh9BpV+R4s3RGBnBT5kJ4APaS6uPAYm/2TswpEMa5hZQGgDmpkfvdaPDhXjtPUYQx6
	mMnFWnRwyP1Uh5YMXLPSasIuMkd6/Jv7iOvQyomxXN/7NNcA5Nq8tpck3HeY4F2fs1Nf0s6yt1R
	NugtP3T41f
X-Received: by 2002:a17:90b:2882:b0:3ac:8897:7b9d with SMTP id 98e67ed59e1d1-3ae89574cd6mr13912250a91.1.1793783506801;
        Wed, 04 Nov 2026 01:11:46 -0800 (PST)
X-Received: by 2002:a17:90b:2882:b0:3ac:8897:7b9d with SMTP id 98e67ed59e1d1-3ae89574cd6mr13912209a91.1.1793783506302;
        Wed, 04 Nov 2026 01:11:46 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm8253877a91.9.2026.11.04.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:11:45 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/panel: Add support for Novatek NT37802
Date: Wed, 04 Nov 2026 14:41:35 +0530
Message-Id: <20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMf26moC/yXMQQqDMBBA0avIrA0k0VbrVcRFOo7NKETJqAji3
 ZvW5Vv8f4JQZBJoshMi7Sw8hwSTZ4DehQ8p7pPBavs0RpdqFE+Td1GFtahqbZV7OF29sMQeCVK
 2RBr4+C/b7rZs75Fw/X3gur7pRRu/dAAAAA==
X-Change-ID: 20261104-jshekhar-nt37802-a5a079c4cdce
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783500; l=1143;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=z3uvju1pN5NHrCsshehfOyEGWd/5HX3WCZMbJ6sj91w=;
 b=X9Tx0Q3lQhYYdNB1elLXJJf+WfAbrOm018IM2ixlNdww4xKtt8J45R3/2Wo53DObcQkC2bOU2
 WxpOiETXiEpAAEu/cnsw6fE8WuOgmCXUvjK5hfOcDi9qj16FdFI/EDa
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: IuYWBWq3sLSiZMhOj1gc8D5AgGzAD0R6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXxA5yw2fL6Z1q
 0Q/eQJFtuT53IL+CntojuxCstO6T0lASyTKcJvaTSWVTJN6qAkjLGn7YQwPIg5m98OarmjvXBWf
 IHAxooT6KRN8gjPZEfUa4U/ic3z8LapZYltVRYEMkJXYTifv2MvUDaNyBtyrhrOfG67ZVMgbI1R
 VanUkVNnvkFKGudNPoyiFybYySm/MTccAMZuknKqzyZLcL+FBw/eGF+rv/Rqac8XpfAXJlGnkLj
 TfsLv22mPyE3eyjQgu+wejfc+LZ9+fchprOfnc9GgozYipwid1FZrE0qg3jfjIRPHMrXSWoslyq
 wHUDJCiLbYxNjgQ6cSYIBCsgp+hxjnPLL1O5wuIMFJWUrKjpD7Ikc6YJl+l7wLah+nRPVjq4dLg
 G39E2NrH9/DoVkV7D810jSZT3p6agPG4Wd6YpYBEfVD1l7N4sneAeWq8MbIMybevLuwa169aG1x
 Mku/X/fC5Sf+PXf92rA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX0F9qJvTbhJ16
 rAYGvv4wAlyh2NNYD7z3QafvGqKeXCH7zyh9Pj4SQMAn9gcCR/ilM/e7Tp+iJ2Pb5Qeu/euYZiH
 pcXVT9uFBrzfxwzs7V9mQr+zfgf/Bpw=
X-Proofpoint-ORIG-GUID: IuYWBWq3sLSiZMhOj1gc8D5AgGzAD0R6
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeaf6d3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QthHNoVtvuTdp5M_hsQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

Add support for the Novatek NT37802 AMOLED DSI command-mode panel used
with the Maili/Pebble platform.

This series first documents the panel's Devicetree binding, then adds a
DRM panel driver and enables it in arm64 defconfig. The driver provides
the 1440x3200@120Hz mode with DSC 1.2 over four DSI lanes, sequences
the panel supplies and reset GPIO, and exposes DCS brightness control.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Jayant Shekhar (2):
      dt-bindings: display: panel: Add Novatek NT37802
      drm/panel: Add driver for Novatek NT37802

 .../bindings/display/panel/novatek,nt37802.yaml    |  69 +++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  16 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37802.c      | 544 +++++++++++++++++++++
 5 files changed, 631 insertions(+)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-jshekhar-nt37802-a5a079c4cdce

Best regards,
--  
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

