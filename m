Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478549;
	b=BxFjHBJ4YPTQbM0fHDhQHrf5NRaNWdhg9opClbrFNY/YrDVcIGgbNL9x/xvLZOM5M1p5
	 g2CXdyd02jCeIm4nXV8YU+Z7SnK3WQKAtyyJGH4nBay43lWV1B0anJf9ykw6GqPth6Vd9
	 JQGfcFFsDRby3MMCh7SbrvIJ9PQevrSoYxzjfy63oxtCE8UO+fBoeMWS7DQrRD3R2F17S
	 oPyG/F5u+gD8DPHDrjHrKUGckDGgaTeL8VkvtMYUjAx1rxeND+GNqeJQ5tcSkTkML7/WA
	 5lFc7bIYZpDG6AHR8rBm6Z/gcY0abTi9eGdF6Jh4QfFzT05qjU2y2nu/ve6s/T8A1tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rcf7KX2/k1jjCd0zZNcv+h8VDra3CCI6aK6Rh3JpzWs=;
	b=RUkEM+fQh3NekKhBpAZot0u4B+Zzx3WDnas8byIeNt6azi+PsWKEuID/fIf/rHe87h80
	 7v4I1gpE56tI306/FmaocQiDGTDRhhfjlTrF2BzfHs0T9RkIsko9VIVlrRr3y+oHUZRc1
	 PfsYS5J8RDbF4sscQScjwqpgTZFP8Ps+fj+whacRUrbeusMz0gcp0s1VO4rn0aJXqxMHI
	 RZZmB/eLUBCaup54Pg50jZO+kWPl+zT7CVUB5/CmUpYQPbqD8oigW426jsvvj2ylw80i9
	 LWXQDmjoxAoBXStfRgcglpy9NfoaeegiqIBvMhayUzbirSBp/IZivpmNTFPB5wvzOQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kK6g/sVP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQ7LbsO8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7BB606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7BB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kK6g/sVP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQ7LbsO8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9E0Ej480138
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rcf7KX2/k1jjCd0zZNcv+h
	8VDra3CCI6aK6Rh3JpzWs=; b=kK6g/sVPxEq/537kJrMxhljfwMxmf7yPaRAnd7
	aOftMKlG2vo62K702jKPIZEhXhbjvIYtRBeP98/QE5E8kl3yA+FGcvc/NDcbB6Hr
	UlRKxmfUN7jtgUdhJZRCVTp6xPcHwizF/E2s3WHDfXwHDqV4t8RtQjLvTpacdz/o
	W2fp8qPqzOWsSXlrvYhCJyobR8MxjUAOeXXjV8/VY5YQArVaUGewu7RoCjRKtH5/
	YNOgevYEDKVNKLYum2ulTH5f13RpBwIuIFCxTx3u9ajVw324KlU0GEcD5YtGT6pu
	1L3ujOdlwG66RZj4YJHqnVEBJUB8jmNgJCqMEloqVBwCOF0Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4r76n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso5382521b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478546; x=1795083346; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rcf7KX2/k1jjCd0zZNcv+h8VDra3CCI6aK6Rh3JpzWs=;
        b=GQ7LbsO8K81lRhxoZyiMNa4C499FETNbcoEoDJ6lPt0bsojmTUTtd2EqJVGNdtvbFi
         bWYoTX7h9OGeMaI7O8iF7NxOweHh0Obql5+mAFLy9BB+J44hxHiQwAp7pf/q9cdXPccv
         3oO3/k4hnaQgiDD8zliaIfh1cerLO+H0tdt2+nGbaREoWKSLWIZzyUTOAHbdmMcjNDxl
         PsFqVXLgb61dorZbfBUIn/+poLtlgpUz99yEVMlNkewwZAMQ4MSUCM6CJvEZYlOZD7bj
         36Hc7nBlB1PAHeW7MkQN6XgXFpkjQXO2tLMuF9iYF1wrzob3HeIy2+s3ylepF6ccaxKm
         A3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478546; x=1795083346;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rcf7KX2/k1jjCd0zZNcv+h8VDra3CCI6aK6Rh3JpzWs=;
        b=DGHwRtCE58pTgisPzACwx+NBRUFHU33Y20nTbN6q208ybWp/E3VwcegvUeAlcTBAVW
         VBEqe24yrM0xN1mBEkvKJC+O/rV33ZoED5edD9slG+xr6CrT3gDq5TlGPHFuKlCvdYTH
         b/KlhR4zHdTcp1A/kJjjosMX0WyFOzuofIUyR3N5O9YZN+4YaATEMik2bmR/HvYGVII4
         vLntw7EH7xfXWX7eU5xEwEPL8iu6kDupkLI6FOcR1JE7BpS5fiIsAr19OEJ8jMEMHa+k
         vcv1N7TMgeTh5zi7OXuLhcqECaqXmGcuMlyVI9+tZol8nWcUymJwvjq3L8eTueTYqaML
         YFxQ==
X-Forwarded-Encrypted: i=1; AL+hErGSc1GOZYdUJcJE/hWOHvNUa6d34BW8YK+1gn1GfzEJV4SqEa5rkljVx5jre0pLdxw8HBh4pz1A6JcXU7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D/P8wtk7R2nRKWHlbtYxVgBrbTqzarUJ6jMPO2z3oKJbSNX7o
	C5eVjWEtQ3UPIaX3hHsbDkQboC0o80vo975AAE6X2XzbptC3qYcGhIwLoHPT1H+D7x4rRrkd+aI
	F7L1YIR5BfUI/ltS4zRGXoFzs2U37MTVT8/S7E7qpNUk4Aj61lcdtQ4UwbpObbYpqJGg=
X-Gm-Gg: AYBFou1UPBw3UruoV44T9Et0iIggXDhB1lHYIysCtAhfC3+WFfFWNdnPqLtTZ3KkZxu
	qc7x4etZhjo/d7dz/BOaE1ZB5WTioC2NTPf1iYUMiRSmTxSFFuxqGBsLUxHOYk7nmUW3edCt6pL
	bmSO1wjF/hOwrzae8+c9J6av1inJKZOHywQyFO/CH9zy4o5FLygnV6Hcjsi6CV4p7gpgPFAKnHU
	lUPsF9DQ8aP1OzGXiZ4fOkWyLGCuOCnefyT83g/NAG1leYnYuAdKdOx4yhKeCKIaZnGhm17m6yn
	+sZ/m79HStRmEQMyFQcroEjclV7hSiCFt/1lw3GZKWTdzNHMiyaD1Ci8qcWfV+xpMKpNKnklxnE
	J6D7cKkvxgHOcpZ2sATqF4h9Reis6citp7TB0T3E5PiuiUbGMwSsDQc9Erc/eSJJy2fAtdLxLI0
	l3
X-Received: by 2002:a05:6a00:278c:b0:890:a995:1f4f with SMTP id d2e1a72fcca58-8bc1c7837dfmr4652727b3a.20.1794478546383;
        Thu, 12 Nov 2026 02:15:46 -0800 (PST)
X-Received: by 2002:a05:6a00:278c:b0:890:a995:1f4f with SMTP id d2e1a72fcca58-8bc1c7837dfmr4652711b3a.20.1794478545943;
        Thu, 12 Nov 2026 02:15:45 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:15:44 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Parade PS195 bridge support to enable HDMI on
 Glymur/Mahua/Kalambo CRDs
Date: Thu, 12 Nov 2026 15:45:33 +0530
Message-Id: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMWR9WoC/yXMSwqAIBRA0a3EGyek9N9KNLB85gv6oBlBuPesh
 mdw7w0OLaGDNrnB4kmOtjWCpwmMRq4TMlLRIDJRcs4FW6Txkhm1EKsRq2LItRKNhBjsFjVd36z
 rfzs/zDge7wFCeADXmfYNbgAAAA==
X-Change-ID: 20261112-mahua-hdmi-8ee75b4fd29a
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=2072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=v5XDZt9qzklAugLYWJ0KPcKjOVcV/r7Hu8yNX/ldZrY=;
 b=HVxI65GVY+yVZsqR4s5Z83O7AuyvDoKkcrQS5X7IYKBbRuMlH3g2sJZ34tvUgmlqNKH1zAwuz
 rAcO6fnb5SgB5wdTayeYX3dqiUYW7upAQ4EY11TiOa6lk9T/hj0/nK9
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: 7ygOuYj1bgMe-mfmUIaL2OaMZ7KegDmU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX1raYtBleV4Vf
 fV+OtN5rrfvhyNzE78xIfXcRqpXAk97VGA5334fFi5GZV05r/fXu/jljeN93qT18Pvqd6ejGhBo
 ZDmRYgSx6VtRokmdKLmNbwPB69tP9f0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX4Wg5XpipmIZA
 ie3KnRTI+zkWMRQw7Gi28q9DQ2VP0QeeAVUg+GZqvniywbM6t35QYvrKOIQYTLZ5DaO6FARbM/t
 Et+9jf680QelVZzOA2mhb8qNt1alKiD69DlnKh3uLfd1c2eQWzdEg7LUagB7mxO/nlbTPq/J21H
 iBhkdUSI53ZTIlMv0gpOVuHmfQMpvHP6hiS0X6aD8MyXbYhWTHhSQRtCWKv76MiJJfPImqwI7hg
 EbZk5FFzcyyDsAteaXYHzFbN87Hw9HkIEdtokt3daTd0p8DYLcF5j0SxkHZcU2py5/0DVJa8g2c
 Yh3DGguVqj0FsNZZVNKHel44ylnWOAK6WabhFGDj8CNgHoFKaoPrdWU0KbXApXKHtEjSrPn+vxi
 dJd9hGyCnkLOjKbZ7IKJKABAk3Pg2DS8sKCmJUBxACmxKGjYLusMYRvqQs9LX+tM0cmZLcSdq9R
 prjHIXQ/XPzlegsf5Ig==
X-Proofpoint-ORIG-GUID: 7ygOuYj1bgMe-mfmUIaL2OaMZ7KegDmU
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af591d3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KmDV3LX3zDEL7CZQN7UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040

This series adds initial Linux support for the Parade PS195 DP-to-HDMI
bridge and uses it to enable HDMI on the Qualcomm Glymur CRD family
(Glymur CoB/SiP, Mahua, and Kalambo).

The PS195 operates autonomously using firmware loaded from external
SPI flash — it handles link training, EDID access, and hotplug detection
without host register intervention at runtime, so no existing bridge
driver fits its power-sequencing and reset model.

It introduces:

- a DT binding for PS195 (supplies, optional reset GPIO, and port graph),
- a DRM bridge driver that implements PS195 power sequencing and PM handling, and
- arm64 integration (defconfig + shared glymur-crd.dtsi wiring) so all three
  variants can route DP over USB2 QMP combo PHY to HDMI through PS195.

Deps:
PHY PLL change: https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
Glymur commonize change for regulator: https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Mahadevan P (4):
      dt-bindings: display: bridge: Add Parade PS195
      drm/bridge: Add a driver for the Parade PS195
      arm64: defconfig: Enable the Parade PS195 bridge
      arm64: dts: qcom: glymur-crd: Enable HDMI output via PS195

 .../bindings/display/bridge/parade,ps195.yaml      |  98 ++++++++++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 142 +++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   6 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |  10 ++
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/parade-ps195.c              | 197 +++++++++++++++++++++
 8 files changed, 462 insertions(+)
---
base-commit: 944e974742c54a1d8236fe16897644c35ffd6433
change-id: 20261112-mahua-hdmi-8ee75b4fd29a

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

