Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA8435AAB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962581; cv=none; b=qC1OuKvJ+vjKHb4ui+REkxa+sZz/H4sZSm3WR0zd67Cf4r4bcDcxyZae8ky53V9BX758SQVwRq3jjSENsGRy32BHiDRdiakZcDeF8Qa2Rz6Kxx2Mi6yLRT7cyOLufLJ62nOJu2NnC8Y27HKeOn3Q/lfk+0Jovj2KJKiWe8LiOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962581; c=relaxed/simple;
	bh=ZlhCbGROAC+/y7ldfDGTyZwTBEszhshydS2EHj9w/4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsIyhbBUJTgiJnG3Hfn9JePVMYkJ2FY0q5Kfappg+io+3iBi0ynefepuOPMnwWftg59VvijCdjbhK7pIGI47CkoD3EKrhYfwatPl/lbxVvR1Iz61yV8KRlbpyRcDag4kEzFkE96vpSpf62JR1kgzEsFoiVVRCvJUr8Lpq9Bh2eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffp71oOV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffp71oOV"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso3799525f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962575; x=1792567375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQKZaUmW/157OYpiPu8J9Ezy+PJ6t5W87ff0e+oVUDw=;
        b=ffp71oOVYogA2Ncgv2KHCnYPIY+WLTjpq97pyq3XjVqWaEi1kRwjW8yBVl1vYmVgKC
         jWjLlH05vMPaBA/lZooB3iPJnfonxZDzY1RLYWLh3X1FLWIMhXTnqi6cyZO15tClO9DG
         FLrnAr7V4+SI+El219/5RWo5RLQ1mSI4PNmUHl50ctDSbyDDr6l+QBiUO/7Br9RBsNfh
         yeMwptNGmU4+VsQAuavj03EFJ8542p+MEOaaZA4Xlmg6S9eJ7bMOErsmPL5lACysVSNy
         fcXosIuWOyLhyjipYdrBzy3R8WyKmppvnI4cC6ukwA+644mHokY/rHLIqWUJ5bBM3Yhm
         peaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962575; x=1792567375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQKZaUmW/157OYpiPu8J9Ezy+PJ6t5W87ff0e+oVUDw=;
        b=QawOn9Y4iHbB60dr/S2QhP70KqQs7qZoc6XQIm4FZOwMbc+LCJcoaKJzdhstFjxLnS
         U8PJqSY7NlcEy+FluY9bxeH549ThZjqRtci4aInkj6wF+klKUQYR57nzqDWscYVsynHu
         4YpUFqT1xaQw7RA/0fDheWmmte/GsA5eCsa+OufWWoFEtKYjqU7yJGAoAuT02SSuZEHB
         xfQNPDeyvx+4tZAaaMLnTCk4QdUEXxMI5PYPTHuMerLJCfnCV6G4xl6sAXSK2eBshfy0
         wvXs4X2WREgc5hONe85JWGunOFBITJ9S+3I3nZO3u+n83kjB2Kbe56d2so+JrP3u73S/
         2H6g==
X-Forwarded-Encrypted: i=1; AKwUvBynwNdI8NcR+NBOXGLhPr0BFhozlCueNHgwKn3ke5JgaLsHRa12If6rizahBjhsn0ev4MuiIBChKH+G+rE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIrwuIYCXrl8CMgF1L7oZOala+v18kb8ziy6rufReBUetU27qU
	hpJ/Rj/BzKuJ78WOPJA8nT/FQp9COJhRkkJNJhlO5xBpfdWO2Se+sOhT
X-Gm-Gg: AYBFou3Sp6ZKKULa1wywjk2lcNdpjL8/GTBxiigrAV2zjU7TyM9c+JlHCIqUl9763w9
	bWQUYWs8DGTvxj/qbP63RvyuyhQ/9Tl6jqEKrhA7FmObsrQhZeFNv6Xh4AvQzZnDBINQS4a6QG+
	F392o4WGSrmwtSg98uQxKAzDI2BCp7BLFyTAzFx4pu+R7GQ0yvmkG4YarDaBW8bz2svk7lbYoAP
	aNd6QFcpfBivPCJmL/7AzozRRZx/umFwwOeOjIU56SKT2LC7wwv3DO0KR/9JZsiafdmsSfsxiUf
	wK9MJfGcJnqyNH9l2QaGa5tDA8+6Ks2seBSGBG/Syj9roL2ePayLt2HetGGssbGSyjZT6SuQ6jo
	Kviin116/0f4BQyZYkY0sJPEhUftcvEEdESXDb9ACaj6KcxsOPvfqiPqaSfJdt/rqyrmwkJHUxU
	UO0ZjonqCbw4Pblp4bVrz9Wcaf5mM4GFqOwXhPXz4mir18x0JZ/dxutELmFCnt4rG/dp8rZIAtY
	Kx1+vW7z3D4MnRlpuzhnSlOZDXkuCGQNG6QWgL+l2vAKZvl+oFu/k9FgZX45gxjQVpOCzCQbzxT
	M2YSWnpp/7IvSUXog70i9lG3O/YAtRMLgOjbt0qsaSZrD/nVNh0B0m3FeqOQFw==
X-Received: by 2002:a05:6000:200f:b0:48c:5669:747b with SMTP id ffacd0b85a97d-48db9465ffdmr33882716f8f.8.1791962574656;
        Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset controller bindings
Date: Wed, 14 Oct 2026 08:20:45 +0100
Message-ID: <20261014072109.1759502-6-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define logical reset indices (0, 1, 2...) for the topcrm and crm2
reset controllers on ZTE ZX279128S SoCs.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../dt-bindings/reset/zte,zx279128s-reset.h   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/reset/zte,zx279128s-reset.h

diff --git a/include/dt-bindings/reset/zte,zx279128s-reset.h b/include/dt-bindings/reset/zte,zx279128s-reset.h
new file mode 100644
index 0000000000..5b580bcda8
--- /dev/null
+++ b/include/dt-bindings/reset/zte,zx279128s-reset.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
+#define _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
+
+/*
+ * Top CRM logical reset lines. Mapped by drivers/clk/zte/clk-zx279128s.c
+ * to hardware register offsets and bit shifts.
+ */
+#define ZX279128S_RESET_USB_B9		0
+#define ZX279128S_RESET_USB_B10		1
+#define ZX279128S_RESET_USB_B11		2
+#define ZX279128S_RESET_USB_B14		3
+#define ZX279128S_RESET_COUNT		4
+
+/*
+ * Top CRM 2 logical reset lines.
+ */
+#define ZX279128S_CRM2_RESET_PCIE0	0
+#define ZX279128S_CRM2_RESET_PCIE1	1
+#define ZX279128S_CRM2_RESET_COUNT	2
+
+#endif
-- 
2.55.0

