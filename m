Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668474;
	b=BzFM8t3YxndI4yAqqD1ZDxweSGZKdUU38somgJWoq6d1Mw7Rw6dBbxEgSGn2s45Oko62
	 dvFaXwsE3NiewRz8/V57W97DR3v11uaf4BoPkU52cSAGLuKK+YSx+vWVwQYcCqBsKnKp2
	 XQP/xpVEWnfGOLiQLa8D0nnAgdRVr+z37iineqZexdMFeIbulirDor8+Om18WvM9WKNoH
	 SlN3ZZoXIwctBDtV2+yYJGF/FZWjec9GjZPZh1l+g+ECvMp5kiJVnBqiJiZuJ1X5zCLlB
	 yoQ6rRa0MsirSHI7mVUavVgAkQN5khB4XbyWrS0vYtSebF4tbX9shkMEqbuDWVrZuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668474;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Fq98sHTYCsrFoomue1WOZStbEKhPD5S/Xw0WEXE/lKI=;
	b=OidVKViowX7NOclU08lOVNU1wJ6PiQSQrEUQCn5bomS+A63WSOtwpH5neM1bGUYyHPUI
	 9IF8b7TxxIZJUX7gXn3Bqp7hhfRhzHBChzObam+3LW076TAFmmaHMJCDEMvmmx6+M/DWp
	 EFVUviudkUyjaiqYW2D3mPRAutP72IBsKLfR7gsmRgaRFXLqzlQPTNeMZfAwjcriQKm6v
	 2yltOpWYeDNdY4p3DB4VqWQm3yI31NX6QGS8Q/SZaK1V1G7ZwA0vBICm2eoMEWlKndOb8
	 GLCQzzRL0vZHVwg1VMQr+jtVbxiv/y70TtkxpOzHneK52uJsXTLTTui8Fvj0LlUY8xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NFPIPcJf;
	arc=none smtp.remote-ip=91.218.175.191
Received: from mta0.migadu.com (out-191.mta0.migadu.com [91.218.175.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AC0606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NFPIPcJf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PJB7fKF+/loiiW1a3Y/RpW9YC0ahitzGq3HxxmTug7o=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668471; v=1; x=1794273271;
 b=NFPIPcJfSbRhdYmTOTJQADzw8qsTEKYvtUqhYAD08bbYVF3eeY93ffhSM8mZC+eFozustoNs
 qSv4mkMmszpV0f1BHw7xYHG6QJ3OWr6rkg+APLQoUMD7dtEgQ7g7oW/gTC+pkEVZc/ZBehKVB20
 k/ReX3Zu5ekfY16DXjfzA+BabbAkGHz18FdB2gS9n1SeGrYhqhbUNBlIPA+Do1CEQj8MyZ8a5nZ
 8TbxJEFdHFZUTKCYZWx+/m2Vbh/joTgGXBdrlzSxfUQl2CafK9ARQrQmdrY2RHytmUB7B1YBXCE
 QGhrFVmZqyA/pTB6MB9P72mr/vsRoR8cIYHp4B5KwXriQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 59894c97548e53e0;
	Tue, 03 Nov 2026 01:14:31 +0000
X-Mizu-Trace-ID: 59894c97548e53e0
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/msm/a6xx: Fixes for a680 (SC8180X)
Date: Mon,  2 Nov 2026 22:13:49 -0300
Message-ID: <20261103011358.65398-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series includes:

* the missing gbif_cx sequence patch that's been around in a
  Surface Pro X downstream WIP tree for a while;
* new fresh patch based on a (rather slop-py but valid) comment
  on my report about Vulkan texture corruption:
  https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15349
  GMEM starting at 0 did fix it here;
* an import of the hwcg sequence from downstream (kgsl) which
  is just-in-case more than anything, feel free to skip it if
  it's not actually the right thing to do.

Thanks,
~val

Maximilian Luz (1):
  drm/msm/a6xx: Restore GBIF CX config for A640 family

Val Packett (3):
  drm/msm/a6xx: Fix GMEM range on a680
  drm/msm/a6xx: Add GMU_SP_RF_CONTROL registers
  drm/msm/a6xx: Import a680 hwcg sequence from kgsl

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 58 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  7 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +-
 .../gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 +
 4 files changed, 66 insertions(+), 4 deletions(-)

-- 
2.56.0

