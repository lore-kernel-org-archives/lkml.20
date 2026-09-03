Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE3E370D57
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406476; cv=none; b=jV6QG0A7zRPuPsAkBDg0MjG3vXOLJYb/IKN9iAKcWOAXdalHQmNcYtXI19clk0hZMmOrr1BxUuKY68HYP1V/H1I9NpzZ4jJNE0bKutCwIcEmVpbOxa1DP6SzKLDRxFKORXsNc+6wMbcttq4N9UHxW2oHEkioWpbyrDMH56TAPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406476; c=relaxed/simple;
	bh=999fk6SijFJaMb+FsqTZaZPYEBCkE+cV+0fvrZ0b3yc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nd8FnNcK7FShzVKS4vuKEcdHAzWpQuvZxYYPH3KAlTSAmSK1RDwRDEXIpAttfM0Oe6yUUySpO/TuxJGELVG+1qO4kr+eRk/PeO3t3cDVfgjf36K6bo3uemp3KvGy6XjhIM81qB/UmAbw4rFW0jN107CfyD2AT6ilS2oH9wKYtzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogp7MkMr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3aXcgRs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogp7MkMr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3aXcgRs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xoBr3907836
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 03:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QrJbejrVOsCHZAaABWltVD
	j2zdgifZ9sUL4/mxqszzA=; b=ogp7MkMrzaMxfduc9tejVvURCf1HrqHWH4T+Ra
	fRlQ7IE8AkTyq8Q746hfnV5IFzo67fum/EQI393n5Z5Ngx/TSIHuhTtXR2bdhl8w
	UDLprxhVRkyo0pwFOevSRy84mhwG03L+F+q7cY0OxBhwpY+x+bYG/6bShzcuXH3R
	2bkkVyaAwD536tl4wH6ncnl40Xg7DpM2jEIUvnpkHNVFBVjwEcNlDWDOv3twbYaE
	gxtlN8GUnBPHT/f5BGG2wpw6PqFoy1D7MNbbxvKb+kfo6E//d8JSDllrfqO01RY3
	7lNMPdpaOwOHwl2Fmtp4nRwTs2xdDlSaCy3bqMTz4SKpAkFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy49tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:34:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3989b317c31so385650a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788406472; x=1789011272; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QrJbejrVOsCHZAaABWltVDj2zdgifZ9sUL4/mxqszzA=;
        b=X3aXcgRsBrj0+kSxROHG7kPlY4vJBkJZwuC7rly7GQxcF899pIpZy7Ct00kEUI2FZh
         uASJ0S/6gd8sC4mrvLpBE2r7KCUK0IYKxyOYJsuv+Cp4gSyAuf5vIM5xKpv3MWDpAmK/
         brn0AtNqRXDlvG9dtnpmz/F9AhYqS3nNxlP+wVJSZPappB1e0WvHgbwnjXrMGFsOwgOu
         sFkxRlrQ2U16+dd+iAGYcEF9ZhFW63NkYwao6jFLJkjmq6Lx6kwH4MLbTK/M0I6BUGgC
         lCNXSB0TDdsRHk/IxklrrYY+3BQQXq3ZJ3S1skip0v63X0/o1gPUX4bG9OicdzJYF/+p
         jsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406472; x=1789011272;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QrJbejrVOsCHZAaABWltVDj2zdgifZ9sUL4/mxqszzA=;
        b=dynihFWLSYaxd0CEAk2m4qjar1gvolfp0T/EVLzOg/qlX7k/0pdfibKdemIEFeenju
         eyFSYJTXFF6UsuOfpoE78UsHgDwn/FFbaTR+CwgL8yrsNR0goND8nldTtGiB4ikTxTZE
         GVXPANOAnchL9IGlUrgClExzrDX80eSi5JtrFM6bzGhonfQcV+tU9PHp4t3ZVqQ0vJA6
         4wwJOYDpr3eUOYVwNpEO3uRRFsui8dKoWVTB5Wy7pTM+U9SOcLdMsHFPigr+Mw3ZShS7
         PCgEgpdq7yTuFO/+xQMzJUEgyRSQELhAOF48GygVGUCXIFRis1GSUEpUcPVYiSwU7FwA
         EjeA==
X-Forwarded-Encrypted: i=1; AKwUvBxej/9zgbJbtrC5vI6/oq+4RWkjOVAe3Pr2/4zwyNmai2RL+kHJyPbVo4Iqjl30btlATGKwhOZz19j7yok=@vger.kernel.org
X-Gm-Message-State: AFuF++nE/SRHpzTOU4zJuxNegjtagrJKJC5sOCZLEuaUT/R0cpoagvo1
	3+AqFLfZZusH3AKIwTNg1o0YQ4WF1BRkCUXjJw9a7XdV4DwE3T2srlROBfhA5vp/i+r2CSlvGro
	qP2Z2Qca2LmSKet7cXsHpq6H5c7QmVQ7gfWadxUKo/vDASPSIFKOoOJDfSy1h0PCJyNk=
X-Gm-Gg: AYBFou23jiGIBtU4gbiMnfhI+YNCS9POvefOmC1z+lpfbYuvtotzyDxEscyakLbpz7B
	5BmbNSMMSDKN2laqqpmwBhAEA9OZLpom4bq8YldUnlhbxMMDuQXsaG3OGkIUGPzXKmjFnmJZmVs
	3kY3v1BFkn3zOSRNDa53QqVWN1F3W7L/7qVYelgQRM6tsnTUs5BfqQ+bLm4d2L3WHAhe6XaDpzg
	VoTtrub206zAb0g8d8JZ5E85wS0XoP5JMGiBkySxN7pYwcxS+uHzRMjwjdg25GIhec+/WCwcULu
	q3Yao6RiV23KfryWNF6zd6YJrCaRr+xndPuSjubJcVuH4K3PFk/9UbPUkJQvyLkUde+jUI3KXMd
	wzd8lpD+Z/4jc7J42JYf6yKDSMt93weDUkMR7A8iys34u0gj162HBQ3XZJB+mrOxkQSht50lwmN
	3BNVKwFrQLrnH1uLenYu3l
X-Received: by 2002:a17:90b:39ae:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-39aee1b3eebmr8240280a91.4.1788406472082;
        Wed, 02 Sep 2026 20:34:32 -0700 (PDT)
X-Received: by 2002:a17:90b:39ae:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-39aee1b3eebmr8240235a91.4.1788406471555;
        Wed, 02 Sep 2026 20:34:31 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2375624eec.3.2026.09.02.20.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:34:30 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v4 0/2] drm/panel: Add BOE DV215FHM-R01 LVDS panel support
Date: Thu, 03 Sep 2026 09:04:16 +0530
Message-Id: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALnqmGoC/33NwQ6CMAyA4VcxO1uzdgPBk+9hPIyt6BJkynTRG
 N7d4UUP6KXJ36RfnyLy4DmKzeIpBk4++tDn0MuFsEfTHxi8yy1IUinXWEOjoUsuwtn03IELFmx
 TSGV1Y6hhke/OA7f+/jZ3+9xHH69heLxfJJy2/7SEgFAarCyhstSW2xDj6nIznQ2n0yoPMaGJP
 lCFcg4ikNBSJljJuq7qH5D6hvQcpDKExmFBRjvFdgYax/EF55Uw30sBAAA=
X-Change-ID: 20260719-b4-lvds-panel-doc-cb503c4ba2be
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788406464; l=1429;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=999fk6SijFJaMb+FsqTZaZPYEBCkE+cV+0fvrZ0b3yc=;
 b=9R14RgT7yl+pdwHoe2npyooWtj27A9yHwUw82twMUFTNodT9eqx7UPDpMvDnKuKhm6HzOSIf8
 SaWP6eVZK/hCa0ygQJGHcMRy+31qOehC8rAbsl2ZxTXL43Pem/Yydll
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a98eac9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dmYVuBIMaTYquxi6TZ4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: C-zv17bZsQKa5leI-17BoXLjC0uf4xnX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfXyus3n2EQQgb/
 8feuYX/sCNPqAIjrGkfqBF7gpQFeRoJNBqWcZPwAeiEOJ8MH3JI1bz4KeK1Ti6gqqVMMeb3ddSk
 upivk3iZzvujbBFvD5OVtZwCAmlBprQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfXyW5wFG9aU1fZ
 3AwVilRc//7ehdc9IqvYQ2LTuPkpMTVDZg4mErLy2VnNClcRrgVt6j4zEafUU++Hqmm7D65ArZr
 jKVX7FEaeU/+tZmMhTl5CYqgp51D4Ju3MoZnQ5xxERJy1yQVK/h8s2FHi0yxG7uNRfhxtDm88z7
 qadUjjgpOFiXxuPTolKysEls7tANdUjYz4FXbYybPgDQH4400uFVKNwrzsNof8v0LOkUf/boi70
 HvO9LSjxltQyUiM2N+graNseS2bngphBPN9cHKBPPwm2k29RzXIfPWII0WzzNIN6RVqVV8zsDDn
 GLcZXdWJ9LFxOAayb6txM8sM10YgQXKpwmqIKfc5NOMjMmrf5wESIi1gSSlDpAloUm1o1PuhGZQ
 z95Cyu2Dbi8UaQnJU6MJHjCggwxj22sQzCgLJMgB3rHryh0ciK2LY/oYFI5ASSQvdjRhP023wm8
 C401s4kNN5WJlpaSypw==
X-Proofpoint-ORIG-GUID: C-zv17bZsQKa5leI-17BoXLjC0uf4xnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030027

This series adds support for the BOE DV215FHM-R01 21.5" FHD
(1920x1080) dual-channel LVDS panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v4:
- Rebase onto drm-misc-next
- Pick up Acked-by from Liu Ying and Reviewed-by from Neil Armstrong
- Link to v3: https://lore.kernel.org/r/20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com

Changes in v3:
- Reordered commits, keeping the compatible documentation first [Krzysztof]
- Link to v2: https://lore.kernel.org/r/20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com

Changes in v2:
- Move panel support into panel-simple-lvds-dual-ports.yaml [Rob]
- Add  panel timings which were previously added in DT:
  [https://lore.kernel.org/all/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com/]  
- Link to v1: https://lore.kernel.org/r/20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com

---
Vishnu Saini (2):
      dt-bindings: display: simple: Add boe,dv215fhm-r01 compatible
      drm/panel: simple: Add BOE DV215FHM-R01 panel

 .../panel/panel-simple-lvds-dual-ports.yaml        |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: 97c594f71fa71dc30a0583a76d8b6ef5c5ea10b1
change-id: 20260719-b4-lvds-panel-doc-cb503c4ba2be

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

