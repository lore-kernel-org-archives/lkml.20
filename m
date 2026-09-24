Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F6E48C408
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284504; cv=none; b=bQWp55YzPf34woS1I+Wufou1jMaZoRqhcVL1Cev9oo+vw+1/5oB2O/UHbPxXZCWy5cMNKhYEJUUIodrk40bO+a8ff7Anbgue7KidT9K15cBrHdFpo8VKEzbQGSNna+uh1yJzs48fk5mBQWMPP6v0rOkKBJUTGhvsBnkfXkAv8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284504; c=relaxed/simple;
	bh=6IUXPSdbKOsyfWx4OSWOwiBNqzxDAfnOvLLzJ+xlzUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZNlj4qdtb8CoAEJI/c7J0cfZEYmMZGirBwkHVVrGYR55flMC1qOmeW4BFJIcrwQjyE3kHov+iZetPawAqgs9qIzqUGQ7S+DgzI4w2ql/vbPLkM9xYaooC3o4Uwg1fZgQjDSnGJtIX89ph54nL569ddS0EJmNTofNgOc45J5XpBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1tYCmgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShgwmVaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1tYCmgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShgwmVaM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdsRP2302758
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nGnvZWXMboJT5WL07jHly7
	5r0lu1CZomvdfiX/iCkcg=; b=X1tYCmgcBs9GzqHf812XUBsofrXPjVwYjrwb2L
	UHoA65e8b29PKcBl17NocwC5VG7dIMjakjp24eUFZFJhPu6ysIkf8+VZIW8XoQQG
	8I8201X4tWoluXbnNmkbQCij/8F4dYQKt+SJzviOh7iK+KnprBntcZKsNSfoiMSl
	eSeaGrWSIN6wrYOAkinq7wUy07Ww51YeX5vZMVzesSgPdodDgMmuGHLKZ6ZePjw7
	HPAlJNHb36LitcBHEhwv/2DXpi7EZjhePD1rB/TSr8JNwR6RKk06LKMQrFw7ywBE
	yHxRvgqrd28wc1utHEda1Lqfp47i9H6RZzvIcZeNwkcVzbBg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7tp12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-333543ac378so229875eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284500; x=1790889300; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nGnvZWXMboJT5WL07jHly75r0lu1CZomvdfiX/iCkcg=;
        b=ShgwmVaMZVtggL3IIhGKNz2lqm4N8tX1k2xYN0bC9WFiGWiKhGoZs5P56v6tH4zyUk
         at9Lw4sN2Zg+zGGU2hFeQ20PI0P6lHTmd31SGqw5yYf/DPUJQKDYGM2mW7aJ2ObixmM9
         fEk9wDb1s6AOOyx6/81euH5Sc/X8SVQMEEjTedzR6KklpX9SnRH/ejEgKI9Qre/E+K+D
         NiE9DSpeBQiphbNhj718oEeed4ODT4b0yVrSB3zr4rYJUnn0M/JVjvOkT9AXMUgQjPtz
         VR3EbqqrL3VX1LogUFYRMlMvx240Ab6uaGvRlJSzqDSPfoRb7QrEkl+IMWa5cwjsB6LC
         7d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284500; x=1790889300;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nGnvZWXMboJT5WL07jHly75r0lu1CZomvdfiX/iCkcg=;
        b=ISI0bjgY62YPIa+Uoo4mrzHLPUWsusB8DaeNWooPkFNg54GV1vWmtRAjZHHZRI0Dba
         m5ZaaIRCiJv+67WNIEpiuzJdWMHHaaQsoijABkuwHK6vO8cN/Pg3V1wVjPOFMRYADl/4
         6QNI5eS5Z7tXGxLSUv8z5ZxTkWwWlMH7QuProVrsOG/sbFRBJ27+tzU0R206fZtpX1uA
         Z92GUzmjhmFJWIPo06jq9lA6Wn5YA61cCDcslsyVhEmXeuWFyXIwcV36BjtnQkf5OdLs
         aH+ncG/O7QGFBZBT/GD//6rRF5gnl5K2bI5Oe0sznNL3LS9qa2nMxXv/C684Kn7Lhya0
         SOQw==
X-Forwarded-Encrypted: i=1; AKwUvBz4ZBi3fT3xT/OFzD+lukMFqtCBe8Lb8G4A+AikxAHfDNgu050RbSZLEkdJwIOrno+T84BcwlaqMnt0bmw=@vger.kernel.org
X-Gm-Message-State: AFuF++mLk+Xts/ml9dAXzteIcEWc+eBfKQA6PgpcWWAqVmD+YOe/Zl+v
	NkN+OS2B18Wma5tRG1NxOZmSSZUUDBSylnrefezTm2kPM6BL3eAWK0A58CEZslIkZ+2vSh9J8Er
	vxwft4TYj1ScSiXRP11zFPj3x/a810dBDCnqwAH8XTA8QBrzs0RVZSjW0cHcROUR0HQE=
X-Gm-Gg: AYBFou2Bmb9p1ZDg3o2fhNVtFAoO2H4KUGwSweKqzSnP/NMVXfDGOr6TT9SEEy5M5p9
	q6gDEDQ4BunTal+BzeexY+/tJ41TKl4uZ1EcOzEMQdTRWl/eUJIQJ5OzAB9WbzZQxb3QLYuw3zz
	ASs4bTKVSLrOYgxpU+t580a/ubD/jJQ0l14oajLuKry4a3IrkXREGKiIf6pVQX5M0WPMykGB9WH
	h+5U1IEsVi904H1JoMVGgSqwNPWwpQdqwFX4CehGfI/doxQV6/W29P/TF+bCcPJL3gDedzJi30k
	mwLtd9EDrZyIbfTDM/mTEAI0bYpMSL1BDR8ZAKDV32zb+uUUR9CaSMO0sQ3LYvx5HsZSO04rRrJ
	CBXrWIeJA4my+cVjQK5orAL0=
X-Received: by 2002:a05:7022:fd09:b0:143:4710:a869 with SMTP id a92af1059eb24-14503fc15c5mr3510210c88.2.1790284500154;
        Thu, 24 Sep 2026 14:15:00 -0700 (PDT)
X-Received: by 2002:a05:7022:fd09:b0:143:4710:a869 with SMTP id a92af1059eb24-14503fc15c5mr3510187c88.2.1790284499546;
        Thu, 24 Sep 2026 14:14:59 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:14:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm: Mahua GPU support
Date: Fri, 25 Sep 2026 02:44:31 +0530
Message-Id: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeStWoC/y3MywqDMBCF4VcJs+5AMqlCfZXiItWpziLR5iKC+
 O4Ntcv/cPgOSByFE3TqgMibJFlCDXNTMMwuTIwy1gbS1OoHNejdXBxOa0F7N840rbYjWaj/NfJ
 b9p/17K+O/CmVzNcIL5cYh8V7yZ0KvGf8swT9eX4BxBlgrYwAAAA=
X-Change-ID: 20260925-mahua-gpu-341a15603d23
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=1715;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6IUXPSdbKOsyfWx4OSWOwiBNqzxDAfnOvLLzJ+xlzUM=;
 b=ZDEuG39y/xeorwQ7rLvMYxmR6FW0MXfI++Z1rFW9qkPnL+UFiFq4+ELnF3gGqaBqVuQBjciXU
 eSZZxq7cjqWBMVoi2tv7DRDO3k94/hha0y1i+5bnnTJRCAoufmyxkQ5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: LQD6u_7rJ-KicLSV0Y2AqEN_goaeSpvO
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab592d5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=44lFysMMeNXQ0hntYWMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX34mo5OCJ8p9y
 R5J5xyFyKrkWfXy1cI5cUsoX4zd4jfYvE93NruxDHN/+F/mBZA3qnFd6wY//vlNrgyEkomDL1Bo
 4sFutQMzVPL0oFepQxzWNOOs8Q1h/+Kg55OBh9gw9HTFwpLsH2Nckdh5pzPXDn8rR+Tl8CZrHn6
 jTrJ/ryTA28cKFYAg0a2yUfSQiWvPFUo8GX3emXyBlrzoiWOyM5hJ2IdbGvL0JWor9Me5xnlEFj
 ovpxNtJypm2ICy1oY0MWOHX1vK3e6MNHMFQkhH6Hs73UL+LW6RkcoFgPcy4Cluvk3Cs0Zyh5FFW
 mZWV5uSLKhxAJ6dIhf2yg/TYgqO9sOEHoLqJslRgppR/RM/qd4IkrtZbKUgK5JFUBoIA1nfpZEd
 BXWNfGRopFzBhqNKjS4M3ltDMncW+HvgDTuS1i4HGE0UC5stuV+b+/z+crSwC6ev88AR6gNhcHX
 xtcnItib+/lzbvBnQbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX004VF4+bCFtt
 AlIwMgrgptVBZqcmL1B/JHCtgWCnS1AHDzWtnBNN0EMBQbHLhGXeTWz8h9XQ3VcTWBxgfVTkpoO
 ZfDl9xmmraDrNe85RSRKStvP9qj4gO0=
X-Proofpoint-ORIG-GUID: LQD6u_7rJ-KicLSV0Y2AqEN_goaeSpvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240086

This series adds support for the Adreno X2-85 GPU present in the Mahua SoC.
It is a smaller variant of the Glymur GPU, with fewer slices and smaller
internal memories, but it shares the same register layout. As a result,
only minor changes are required to enable support for it.

The first couple of patches fix an error I introduced in the earlier
Glymur series. I incorrectly assumed the X2-85 was the GPU used in
Glymur and used it in the compatible string. I believe it is reasonable
to correct this now, considering that the Glymur DT patches were only
picked up recently.

The DT patches are for Bjorn and the remaining patches are for Rob Clark
to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Jie Zhang (5):
      dt-bindings: display/msm/gmu: Fix Glymur's compatible
      arm64: dts: qcom: glymur: fix Adreno X2-90 GMU compatible
      drm/msm/a8xx: Add Mahua GPU support
      dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
      arm64: dts: qcom: mahua: Support GPU and GMU

 .../devicetree/bindings/display/msm/gmu.yaml       |  4 ++-
 .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  8 +++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 42 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  7 ++--
 7 files changed, 61 insertions(+), 5 deletions(-)
---
base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
change-id: 20260925-mahua-gpu-341a15603d23

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

