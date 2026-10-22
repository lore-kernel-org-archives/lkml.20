Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644108;
	b=jhMrJJEfdjHrFU5/EXHJT/EX/iqvtg6qz605Ombc0BqshkQu0vLBSMBTVd+2Fri5R4kj
	 zQ2LCfdlxJEyGHQc0NeHbXi9R1eUiP3hVtPlnGUe216+9KB/vxjkrF+S7gTzb+fcelyZW
	 O7/8aJrjjp2m4nfRYVThlw07BatdHp5GWJByuf6ngt1xDFiW46gm2oiHstRh6UwXyrEMp
	 AXCfBCw4t6v+k/4X/pK7Q3AOh4zbd+3BX0k38V5oJNVZtZ4g6Bj5ges4HkufChH3vkLQj
	 vgeBnv67XbMP51Nn6475O6ArWNFp8Ab4a7Spgm0rCIQSZNOD1tuj/xu83DuuKr0x53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
	b=HhJesRXJCV2Efg8/TNX0g3ucsA/hiU0rP+kkOoX3ytR83WNfkJduHaKwDAr57tKGAzLV
	 PmQv4nN4z6Z38d6dPCJIly6XfNs9BRUiWmoVmlOhSX6wwQTniBJcgzni2ilznrUedf4QP
	 EKUTN+yFt4met8KBw4toTck4Nxs8ZxcK2KjWqE6srms0EbyU4M3SHpqHJLxaJbwzL+Qdy
	 /SjtNfR03VAnv8OekmzdUA2UG5H1Ce3JvVq+ajGFKdw5pxCQL/d9uI3yI+xkRpnojZ2p0
	 xqRFl13TiIUt4AzwxRIpf1/wH+79kMwNpAyrjMHElL4NtUIma/vbxrDL74cDaZy1h5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1TyOzD5;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A22606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A22606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1TyOzD5
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso851697a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792644107; x=1793248907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
        b=E1TyOzD5bPpwzVqP5br99+6oh3FeSycO8lcfeW74GAhw2rlpgT/M/FF22LIEXTZPws
         kMjM5K0pNbdnWtqZMaR7KrlD+xif3ghDb1IEKVr0vXuA7NcjjUPPySQvRRAihPHtRf9c
         D5lWNU++NIx4AZi2w43o+3IgjeuvoBoiTLIfCZqRY8RSoxHhTSgrE8kg+T+HEgrz+9Zc
         wozz2wgsYHkBzBPSyJvixXoUj7D4FqX+jXIsUehMu6KS3+B4SzcKoa+FxYjIHOaGtu6P
         aGAdzRCj/zFPL8h4c06TnKJ/sSQT3uTHAiPmrcaXJbQ2t1q73Xmdb5XMksw5GJRxrnAC
         14fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792644107; x=1793248907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
        b=blX6j5GOeKh0fGQII1adxqF/UalPOK5q7peLRrRp5H5JcSa/FsOyRL+Dfn70JvEkq3
         G0dh2e6Ahd1gTqJCC2quGjCQdg7cHnBi4fiZbtsYuHbDIWzs63V0+A4k7kbGYL1BYxz8
         rLfrCtmZf+vlCJF+a+t8/SPk9rWQ7FttX84hUDkOoIjBFvKH/9JHKj/e28b0G6PuFF9Y
         HGfDpN8cvZk1pU+id2otZfia/nEZdbVC8tGo57fs70vZ5Uia+Ws/lpQxKRYO/vnVI8Vu
         xZI+B+j7ccsqwg/sZEnFlyaWtRpXf3d4zHnUUTYFs8oXWWvmkkVa3i6klp5IJd3ohXLS
         twwA==
X-Forwarded-Encrypted: i=1; AKwUvBzFstcwQN7uuT6BXLEDcjTEzvuzWbCWOSRZdOt87/epWtWZCr9NZp5/oIVHjGdT1T5xwHyMzHfLoydTOoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdP70hzG2Zb2KxrC8/67dq2DPJvHBjn29MVz0QrCjzA5f1C9R8
	K5p5IJ9GsFx3ZTliw2DBJ5BNeO+1eu0FA4Z3tzsy0iPl0uX5CSAmV4Qx
X-Gm-Gg: AYBFou1Sw3DT1OEGeCiVkvu+42lMXcDpQIRzEUaoa2KLkC+UpBMS4vq4M31eFsk48vJ
	xLQyZ75TaDAJLF6x3c/a4KDRymP8wL6BzfeBoKt9yjthKRG+vwGaE9CkLmbc4obYwVxBA7EUZhQ
	sVQS2lzQyf/V0LDCsd8kNZwdAKKbF1dqZyWm5bVxCqQPOTafH3b4LEwLNqI+xAtmhUhiAQjVocn
	WiQv60UaTxVbBfbvv4Ri4v6mdXHAM7rA4kwyCiNMkiPugEet3/6d4u9zvkV+yN/pbMLYekbgBMZ
	lySi5znhOYh/tPDmRC4FgViGCNvciqmK5jCQwFodZMm4xjXPGUsDh23yIY5gmwldcGv3TLOxiMY
	qIlne+WMqwoyhbqblr8pcWaGw4wZJ/YlqgexuOjbs/uq1rMLWAmrygc7ra8q/iKI5hsTblHKb0o
	W87kE/OSUCegGe8vbHpMoSuEniKBInT5EGIlF5Ybrw9xcNwTHBLVCGg0C+CDaEGbqsXcES6Oy5I
	r2P9/6jWX5hUOJvrqZtAS+lsgfLCKby3y5M4v0X5MFz39vRzsefNpAhUycFimrpUh/D55xrECdz
	UqPJrBF7Z6115A==
X-Received: by 2002:a17:90a:d443:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ad86d07086mr2617064a91.28.1792644106885;
        Wed, 21 Oct 2026 21:41:46 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f42d40sm3351291a91.2.2026.10.21.21.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:41:46 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: geert+renesas@glider.be
Cc: daniel.lezcano@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: Add SH7305 support
Date: Wed, 21 Oct 2026 22:41:35 -0600
Message-ID: <20261022044135.275485-1-artem122novak@gmail.com>
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

Add the SH7305 compatible string to the Renesas TMU Device Tree
binding.

Exclude SH7305 from the mandatory resets property, following
the convention used for older SuperH TMU implementations.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
Changes in v2:
- Rename the compatible string to renesas,tmu-sh7305.
- Sort the compatible string alphabetically.
- Exempt SH7305 from the mandatory resets property.

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..ed30e0c861c5 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -51,6 +51,7 @@ properties:
           - renesas,tmu-r8a779f0 # R-Car S4-8
           - renesas,tmu-r8a779g0 # R-Car V4H
           - renesas,tmu-r8a779h0 # R-Car V4M
+          - renesas,tmu-sh7305  # SH7305
       - const: renesas,tmu
 
   reg:
@@ -110,6 +111,7 @@ if:
             - renesas,tmu-r8a7740
             - renesas,tmu-r8a7778
             - renesas,tmu-r8a7779
+            - renesas,tmu-sh7305
 then:
   required:
     - resets
-- 
2.56.0

