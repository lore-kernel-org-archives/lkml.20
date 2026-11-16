Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861886;
	b=UgZH2Dv+VlbpaiF9JvdY1GHk94zbSGGa7yQAmWoTX1/0GBN0dcFCM+YP5h5sPJGo4O3n
	 gslNBiPjQ03p/Pb77e7kqcxyzo9YDF3LCQDZKwO5RnXaHlvueQny4AAA0xMHHUtsI/rxf
	 V4EehebSrfFHOIvFdkcuWamu6UoCyxUBi/E4tHYkCMUcDxCb/Bg00fDafxp91c3J7puNc
	 I6F+gpsB1iVTDXRBuT++QxyUvMk4ngm9OGmAMXJP0LS09HiLYf30v8Za4NDjw8lZho3BH
	 77+5NfEgZg+t3hwXt5vU0R9vmjTtDqhHjPxbM1ap5SwAn7/HS6jAuAeO2d0hNYS7ERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861886;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=/extzcJil/STyxo/f0U+n9eeeyv6WwXbxkpnizZU2uQ=;
	b=XRSeYNcJ4QeL6KngEaDnH1mGvL4+LXut4CgFuX7qlAE+P+XaS84h0NUtB7HF3GP8mQvf
	 2fD5I3XK0MhaWiW498IIFk3xymXcAVcowPGqVqE12NU2FWF+4x4NyAqEqmUAUyPvqQ/v3
	 3IgNC6Thr97Quz+Kv7KKM/Gp5KPbOJYPsPPslH5B0a5x3tKJGmC0O1ujBx0ffo4HXyDO/
	 lW1ukVlHXpyVg1UmDUcFj+e/me+53hPs7IrFaKRS1nyPPgbwTdPhMJRNampJUnl/6ruLn
	 HfCo3a8ycdb4XyMRj2HEF2TniH/e96WlI+N8Dc23sMwkYypXmdETxPxAVwMPg0AOLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bA6Yc7y7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC4606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bA6Yc7y7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92931F000C4;
	Mon, 16 Nov 2026 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861885;
	bh=/extzcJil/STyxo/f0U+n9eeeyv6WwXbxkpnizZU2uQ=;
	h=From:To:Cc:Subject:Date;
	b=bA6Yc7y7BhGrYXL3P25bUMES9tRYeOsevxR5glZe2N+ao03qwnTlnza1CwSKWLcTg
	 NLgxzty+FZ/rtmm71D7gR9ptnoNPpPdlylSJd1QhD5q8s6E9jeNH1A6NliGv4sM6Rk
	 aeKhXcuVaXUaLGtxP/r4ezQ3/5Pb/O9wML7vICoOasQ+Acy/OwyQmSkYGdgh6dsaEH
	 2VjJG1dmlyEWmK9oZjdiGEp2NZmhaL4N3/ky2V8jrhO8Po6+RrUGmAcyRZnA7F9ZE2
	 1oTdQ3gAKFRUOl2RzH8gqFp4JzvEPJENkH7tcOxLx3MAMAKZ5/cOaBTw7ZMyXD4iFC
	 LxsMc0QA9DG6A==
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/boot: Use the compiler's stdbool.h
Date: Mon, 16 Nov 2026 21:44:29 +0100
Message-ID: <20261116204433.420205-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=blum@kernel.org; h=from:subject; bh=edu57q4XW/8e+HLck/8OCAPfW7bMbwmob20ECUxpF4M=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFm/sw1XfzobdUaYU6Br22zRhtxMwRLViblrC6cf/CMkL cxx5dO6jlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZgIPw/DfydBOf2snG9c7J2d yveecD70X5Lx8d29Kce8ruuk5Nky3GFkOP3uXpT2iw0GUhda7su+yCopkDU0C+F6Y3Xtxt3Du1Q S+AA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Commit c762c69e106f ("powerpc/boot: Add support for XZ compression")
added custom boolean definitions to types.h and a local stdbool.h that
only includes types.h.

However, the boot wrapper already adds the compiler's header directory
to the include path. Remove the local header and the custom boolean
definitions so the existing include in types.h uses the compiler's
stdbool.h instead.

This changes bool from int to _Bool and its size from 4 bytes to 1 byte.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
This patch applies on top of:
https://lore.kernel.org/r/20260828130622.576064-3-blum@kernel.org/

 arch/powerpc/boot/stdbool.h | 9 ---------
 arch/powerpc/boot/types.h   | 9 ---------
 2 files changed, 18 deletions(-)
 delete mode 100644 arch/powerpc/boot/stdbool.h

diff --git a/arch/powerpc/boot/stdbool.h b/arch/powerpc/boot/stdbool.h
deleted file mode 100644
index 2dfe247ede80..000000000000
--- a/arch/powerpc/boot/stdbool.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) IBM Corporation 2016.
- *
- * This file is only necessary because some of the pre-boot decompressors
- * expect stdbool.h to be available.
- */
-
-#include "types.h"
diff --git a/arch/powerpc/boot/types.h b/arch/powerpc/boot/types.h
index c5085c2632bf..08529138c524 100644
--- a/arch/powerpc/boot/types.h
+++ b/arch/powerpc/boot/types.h
@@ -37,13 +37,4 @@ typedef s64 int64_t;
 	(void) (&_x == &_y);	\
 	_x > _y ? _x : _y; })
 
-typedef int bool;
-
-#ifndef true
-#define true 1
-#endif
-
-#ifndef false
-#define false 0
-#endif
 #endif /* _TYPES_H_ */

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
prerequisite-patch-id: 068c3f1381513a18034f0a88224c0bf37db8cfa3
