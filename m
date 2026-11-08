Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145578;
	b=FgoKA7ql5VJYSqxEmTkH6yEqH2vTaFoE9+rExRfeqcbN4sSU9qqblkAn33VPD0aNp3hK
	 HLZ38HQ/HnqU7qhnyzUNJdr27GOW5YecgFS6JEeFgkEnARc8LFS1OaDk0nAYzLe61SrNR
	 bloQOoKUo/bo8elGwR5AXXhY3Lii0zHgyi2yIn4EyrmIMX+QkfUcl9Sz/IIEtWrxXSKyB
	 /2otvS8YTMs0mgoCs6gfd+EZw+XPcZ0A/Ajp6dC4g0+TkdsvTk56onMpmf0/3lS7mJ5HY
	 Kmz01XbocE6tBBuqBpos7oJ5Tb32Pq1omtBPh/hEchtF51aNPREu73j1ojuWq0uvDrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145578;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=kISgTnHIfHTm0e8ym4nUx3sMj5w1C3/m/dreB4Iw6v8=;
	b=dIHDv7l3i1jMytHW4Tsq9gT378OIvf90JPI2fdCItVrAn9d1YVJcoTFT00I1nGxjf2aI
	 fFz08R7XC5/DV/FQOO6rpTN2hV7BkElJCHs6Eqn+vnhVFzeOZd/caCAfdfhxlT2IcSavb
	 dy6uPSNtPKk+BauOp2JB+CDuNgmXKBBiSbhtG0+isfcE46+GtV1HtDkYYcUCMhIVYQANd
	 0HcSOlXX6DlMOFSZBm6blICE0R3VYm2P1Zk+NmgtH5Blgb9B9WjvUXlJEcLvUNVZC0BW0
	 O8Kq2v24XnmTmzRlzaJOdNxi3eyf/rSYUlxaFagI+ocbL56Vz6AFyF+HCCHotxmWx3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g69A2wiH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB887606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g69A2wiH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FFF1F0089F;
	Sun,  8 Nov 2026 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145577;
	bh=kISgTnHIfHTm0e8ym4nUx3sMj5w1C3/m/dreB4Iw6v8=;
	h=From:To:Cc:Subject:Date;
	b=g69A2wiH3xaIcxnOAqJqeo+UtllGuNeCcNaNQwNeNfpG7b7pw6hmL6zNnjVh12kIo
	 ao+nn5vylhg33G5M+o6n/2CEl6BQVJGe0q7NQn8Zl1nywoYhQHlt/3DdDlgB+6/YF6
	 urfvAuV5zXYsA42sBBhzul17wJEKJVSDV9QFjvhvR6gveiMeBW9aZGgIVEATS5T8oj
	 dfXjXGmNtcSrXMrxCLogYKa0WM/+5pfUfTgoYODpA3cq3ABOW35DyJLD5rW2Q6WsAv
	 n3rg+LglcVJw7QBQ7xAcSnYyXeKnQT3SykIP4r+469/JAuo6SLyh/RjdNJSR2B+mdg
	 frlRYR24t4Hfg==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] m68k: amiga: Mark sine_data as __initconst
Date: Sun,  8 Nov 2026 14:45:00 +0100
Message-ID: <20261108134501.404852-3-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=679; i=blum@kernel.org; h=from:subject; bh=n+7czhDIYW9szePk+kbNWzEOMsoBqv0mHCZBTb3GoVs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfau5OOPD/zb/+jR+ib7/133toetM3lndvM6utTjx7r txQyl92pKOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAmUvKJkeG/iazctLlhChJO 0wO+8GYmdy1cu3wha2+I8s48t9Att1cz/HfnZ8pyCzPq9J+81kfhV/DCClOBaR1HXp5aM69xknn yKyYA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

sine_data is only read by the __init function amiga_init_sound().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/amiga/amisound.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
index 5fd93dfab809..5ae1f017b39b 100644
--- a/arch/m68k/amiga/amisound.c
+++ b/arch/m68k/amiga/amisound.c
@@ -19,7 +19,7 @@
 #include "amiga.h"
 
 static unsigned short *snd_data;
-static const signed char sine_data[] = {
+static const signed char sine_data[] __initconst = {
 	0,  39,  75,  103,  121,  127,  121,  103,  75,  39,
 	0, -39, -75, -103, -121, -127, -121, -103, -75, -39
 };
