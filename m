Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18D346EC84
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786045; cv=none; b=eC+U9DqfTkJtkqqFr19WXUfrH9pi5d+iuXc2vEgKPx8SiFZ2lbcCzSPm8r4ghS+5NmT8v9SV+lrf5OP+6RkCSI8F+RzrzHGbQlN/HoUbxRQKMYQwH0tYPzyW1K9K7EtL6YSDSey+Uu0Ehzt5H2Z9xgp8qCT38881H+7Al/erYtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786045; c=relaxed/simple;
	bh=R1heoqafdwqzfSRjHxzsYA5WusvEWpky2358S6ReQdE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UNvQQ04PrwsU6xXgs0NYbmKcUCGJBRX78KE9x1n2ZmyUGhBkymWmEb5KnLgoiqQogK60E3LPpwHPOzxBHC569/nUZPifjlWiflFDoH6VxaoDT1DkvNsDi9T/3d3JntMqDx6GyTn3RLXgL8zekS6lkUAApLkXsHHbIETRh005isU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxt0CBN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5KQd7i0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxt0CBN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5KQd7i0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnPiU4064569
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mbgqvHTyaHpGvMkymmdVNW
	iCsdeQ9ZFYWr/yEdLCQX0=; b=oxt0CBN4ZdJ5fnFpr/aCb/DkgARIdywr5hcXdg
	QeLRYmLUgdpc02LH5T+pqd96XxO2aDu03PsQOC+cce94V3ESIlmcEZHbw4CSts6G
	nVRvntGN+AVp0FI9c2aXNFM5lHfvu/FUj9maHE1WdW0CYV72k72jHx9PeJRaGGUD
	Px3O3Px04BI2F55pT2sYSvXDuv076mpo6gaoXynP8p70ed3HOX9uV7Tx79OZ32QF
	QQBpbfETEn55tKKU6g3pwdroMY6n82OKG27FYd5BnhO22fDQKAab2JbPQUwI0/59
	GA8uSas4eqRZ31g27rnMzK7JZkQ9p8Rz6L8Rrfk44BZJY5Mw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86s9fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:00:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73883529f72so3007733137.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786029; x=1789390829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mbgqvHTyaHpGvMkymmdVNWiCsdeQ9ZFYWr/yEdLCQX0=;
        b=Y5KQd7i0xgNZ2gXa1sO7BcQUAKiF5Jjv6esMiWCP74nt05TTkkOO+E+8YPVSxF2Z0K
         pXtb8+VlihxO9ptxPUNiu1/l6jvdbc9H7X/BE2s+GnHSdFvbcp+rV8U2JIU21QovY7I9
         xw4Xvzej0ifMR8r33rmzRDgKmmpu3R4Uzs5xkNYvT6DmwKi55GY2VcvpDvyK8rVGbaIw
         pVVDgK4MGjxJBgo7zvNWqL5ZXgfQ0P6KRkouKyVZvwsFbGbDTeAzOrQeptfF70tobl99
         /yKMOiWDIRP061N1GNYxglzhkn4sw8EjEszkEMKNl0IteTCCijCsQ3AHNFuQQo9QQEqv
         MSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786029; x=1789390829;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mbgqvHTyaHpGvMkymmdVNWiCsdeQ9ZFYWr/yEdLCQX0=;
        b=UQXeFtjWKSAGtXZxYnO4181K/AZ8//PTFz9GfriW6kBmyWrcEvDw/lx0KmzPz3xs+3
         frLMZeV22sBK1HIe5Db/cA/lrlPs5CaYJjBb07fPElUKfEecrnbtgEVeWtLC0vZ8Z6VQ
         ev1ikilPTVu7AqqXH+7WrswTeUiR+jEGK3o/FIrGuK7Al0ONOGoQWcfV6yPzpfjigmHY
         c+ZK68JZK8/hWBOGxwOxmoDMMeqHWAypP6NaSdHF0pVF1EwMfBYT0YnGyParTcmtQIdw
         PwNDfZx7CQBVRmgL+hjHOkQer6Lql+jo3I748pYCSH8td9WVFAhLdZpPh56TvU0EfdeL
         CgIA==
X-Forwarded-Encrypted: i=1; AKwUvBwuE7eoHVHokRDgoqR98JPw5u2/CHy8kvjLK56kNdp3znpBcmFplFypM+Oyj41dynUz+zNG1VB1ovfqtpA=@vger.kernel.org
X-Gm-Message-State: AFuF++kPDZkvgCzjbDodEuBICujtHXqEFQ51u/L2HubTfoV2388dwCf2
	2nkSyiFNRh+GPxMIBfHP1jd75yGjG3lN/2Ll2anXTZXiKjSDTXvQ7RDGXxVLbmX1kCTneNb94Il
	R29j6kis6uwEDk+gz7DLNcvY8aQy3Mq0WQWd3h/zWw2kdYfW3JuvJaiOS9PpgmW7YVR8=
X-Gm-Gg: AYBFou0o51u/JzAvM7ZYzGYwvdkifGt2Q7AEd3V/7Edqeh4xlvU0ibTh7ISNt09rMjs
	M9jhdwFUcznyOTHSUMkf/GIT2Uw8+S9XKdvCJuzjugySPiY3+jgTMQOBT/ScImz1HQD9ZKaGvSQ
	9kT7wAxOBGwejKvWvkHnuXnTbrfxRSxUABZ0jvmPr3k+RQv45Kqzv99NJF3oZVBXWBJzVOLAsMY
	N5n4kh6ajkmgx45vLB4mbXMpFWQw6nY3Bt9VpSBEv6j7iGsaHUgF633HRqPoYEhttbNAgYTzpH3
	ShO82cx6ROw/+VtCvPwAaFBc+W0RUQc6RlUq7ZI/egwMHW+GCP/vwQERdtukFGCgvAE24X03wiS
	mcug3oSC3islPMJyWVX+3XJI=
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9352518137.6.1788786029480;
        Mon, 07 Sep 2026 06:00:29 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9352452137.6.1788786028936;
        Mon, 07 Sep 2026 06:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/7] drm/msm/hdmi: Fixes/Cleanups before Eliza
Date: Mon, 07 Sep 2026 15:00:14 +0200
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTsQg9rWq0gXTfLXjphWZlTE0
 rsbdfnB4y1kUIHRsVpI8RSTeSrwm4ri2E9nsKRi8s4fXOtqTpo5W+YxZeFBXjAOGGYF4yrvnmM
 bYr1t9qnZRSqXm+JXlcmp+9se4YJ4/25pXT84UbbLgwAAAA==
X-Change-ID: 20260907-drm-msm-hdmi-fixes-before-eliza-c9bc7185d84c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1heoqafdwqzfSRjHxzsYA5WusvEWpky2358S6ReQdE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVgvrThFbbkovfh6cZdBXUsee9/xtJ+Onlei
 4EMFYCmFb+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61YAAKCRDBN2bmhouD
 103PD/sH/PGcJ8BqD0NEQzgF9UlC1sIfzFQ7EdPuYBXVAsrkN0m8vlTsaAZzy7Dq9dAItUvy7vB
 4fnH+3WOZAHyhWPl4x/APMty6S+vRF85VkcIn5KnhrKa5vxziTLTm/RH8n1/4Sw8Z5A847QM4TC
 R15b7xwRXnPfPkfR+LD9jyUZGqDqxNScd4nFSkj9wtkRaHBGXLNJurFpbY+z2FYn6WigE0PCgkv
 fYpE30RywfqJ1Dpqku2f3umvp2R+Tvh2xkN95cFHKcjy3KpDMZuYbKapA4y9FcFR/IOfrep5B2q
 LcTAPfYMhDI+/UeyQdKg1deD7sSY52Z+cDF9HUeNls8P/L+MpV5kCsAhHvh7fEsu1Aji3kyS43d
 6TN35XMDZ+2t7WSc3OCI2jxILkLDKGMhfWbZ9MJoPV98rdWrNrI5cZZGmzpqICL0jpWWC3p2FQs
 zP9XCEGFQv2PeXuqe44uqG83Mgo3JpN2bpDBvoOHKMVELMyoNS/ae9XP5Hg9zitUgQaN6thAkkN
 nnBRABELem9F+bnSjzvEAiE1/KFhT65f92erZBDy5N36bgTQiaP1sjcT9pDDduutWHUvc/GLXPm
 NPQSTJGYo4ZZRCnMDd/0jXBhmi45KJEkAKxVY5x3R0Tniy67dp48UvQPGpzBRY7mhnWvFL45w1v
 OFXv2FZD0gtQhAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: XvBRr54XOyLaEwFAR82aTRN67rtGIJOY
X-Proofpoint-ORIG-GUID: XvBRr54XOyLaEwFAR82aTRN67rtGIJOY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX1qxdw34VR4KQ
 YXHKFQh/ECJ3q1XACZLWftErtWr56V7+5BMprogNpaRyN5ALRfMQZpISfzkf9nPnprxn5MZMoeS
 W28O2GTRDJMgEa8BqCS0wBMahc7Rh68=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9eb56e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3rGLuoqwPg9cSPe0pR8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX/dijWjK7zbQv
 7E7hl0STATY43jIXl5GeZATnumEu0vpkLwFdUop5a/DEa999PjBag33+q8vaT2ifYnRbFpyDT/T
 QWPosKQOpZ10bNDSPr6TcMoXzJ2hqUArSk6Fd/3am61f3vk7k9uWF79C7m8e2u7ADNSIGQfqKhO
 LDBYq+Uev9OXBebEjN3rpZChJvB7K17L8Zoify5Ow9TYZKkiY8kcGfXwMbt8FIsVIJEoWmlHyVh
 bAPK3FdFLA2/GzFQaChPt2xtEvuS7GcCHVK92F2CnNd+yGuuBE+iN5qgyCVGxIAfsf0S0u6Am88
 lBG8btweElX9cWVmWK46NsshpKqLphRq0xzaAm5/0KUYk4XbMgnU7dSRpPxNp/gdRYqFgh64ELL
 C38dtHf2ASLQDuD4wP8NB40xGOq/BV623xr6NZMdpeBlVyoJqomvm5qDrkCtiZ3Vxhhq5AnQqPh
 hohfKMZ3EDFxWt0HBdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

Split from Eliza patchset, thus `b4 diff` won't exactly work.
v1:
https://lore.kernel.org/all/20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com/

Changes since v1:
1. New patches:
   drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
   drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
   drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable

2. Patch #5: use simpler ?:

3. Add tags.

---
Krzysztof Kozlowski (7):
      drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
      drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
      drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable
      drm/msm/hdmi_bridge: Drop redundant initialization in msm_hdmi_bridge_init()
      drm/msm: Properly handle msm_ioremap() without name
      drm/msm/dsi: Fix indentation of if block in dsi_mgr_bridge_mode_valid()
      dt-bindings: display/msm: hdmi: Correct name of disallowed supplies

 .../devicetree/bindings/display/msm/hdmi.yaml      |  4 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 36 ++++++++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                | 14 +++++++--
 drivers/gpu/drm/msm/msm_io_utils.c                 |  6 ++--
 5 files changed, 43 insertions(+), 19 deletions(-)
---
base-commit: 6e95d4043b2c59f1887fd72d1620b7fd3d3138a5
change-id: 20260907-drm-msm-hdmi-fixes-before-eliza-c9bc7185d84c

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

