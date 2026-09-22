Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C35285061
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790039821; cv=none; b=NveUnawwN/AFgHMAnpojDJd50AuWSaQYGb/i+f+8jrdfkIHD8RGfs7j8ElKDrwcyOuCGsP5vpz9B2VhFuLv2sg7roYzqX+U6HTYGvVYb3ryrB/iScVe2jnxjFsbzc1ULy+6JatmTKaVjLsqmdSfofDAHC3tFOKFRGRDGLBWfBY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790039821; c=relaxed/simple;
	bh=TsY62ASiPI2u81AFfd89JOC43m5AyPSYuz/MbM++HG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eHkHr5AzNBJtDNG7RXzlojePU2RjqV8QKroObmpHm1Liq2XlRAaEYzx97e+oEQh82PkkLWmDCxnxns10XHlLcKFzDJ2Hyr8UVy9T8ztwBpVme+8NUfQqeRyEqnqTj/2arUkBl0SukcLZNmh9R8nlcDW7I2BodfEOy9FMPjuuigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWVpppnm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWVpppnm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF29C2BCB3;
	Tue, 22 Sep 2026 01:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790039820;
	bh=TsY62ASiPI2u81AFfd89JOC43m5AyPSYuz/MbM++HG0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oWVpppnmOhjTMYQFWKhYQEM6QJRyRkcLa1HIZi+SoWaAn+P1wN12x/IZQWpAwrVTi
	 AXngdrymg/5DuZCi+MoaW9olDYcMJfQJ5ydmQ2RVTFXTxPOClSlFFvYVFv0PouNnQ8
	 hMXs/cUYTSfeW+3iApltqi2RQeRnVkfHWP81xABwD/paPN5vxmMVtpjf83srL7pcXG
	 CSRYJKo5YhXxFvhdrX6Zfx3ccgCEhVc6LpP0FmSV4wwIJls+igfSDUj7J2+AN8bWiC
	 bXUojyTN3xdIIH7c0NY/GLWdjX5CQF1cNrNWYsVfIuu2IZug9dRFNHNfn7eQDCb3nx
	 sJFfgpXZlkVig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B974C982E6;
	Tue, 22 Sep 2026 01:17:00 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:16:54 -0400
Subject: [PATCH] pstore: publish big_oops_buf after max_compressed_size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-pstore-v1-1-46f9a6129d58@vt.edu>
X-B4-Tracking: v=1; b=H4sIAAXXsWoC/yXMQQrCMBCF4auUWTvSxGjQq4iLJJ3aEUzLTC1C6
 d1N6vJ7PP4VlIRJ4dasILSw8pgLzKGBNIT8JOSuGGxrL+3VGnxHnHQehdB7is6cXWd6C+U/CfX
 83Vv3x9/6iS9Kcw3URwxKGCXkNNRp5+KPJ5TkYNt+uXfH4I0AAAA=
X-Change-ID: 20260921-mb-pstore-77eb4154d1f2
To: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790039820; l=1864;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=26FmX6iupwLCuZy1xu2UL820vauzL5xEatEEuA4DQrg=;
 b=daBzOeeHWyv0ierrs8BW70+IyumHw4HDFye9fWH5NBlG1tj9K/EapyfiCjjoQyA5DXuwMCRPN
 dGZBWnZn7tlAZk2JXtY8vn8xX/b6zYDp7CRbODJAXGEHcWMDMtItP+n
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

From: Jaidev Shastri <jaidevshastri@vt.edu>

allocate_buf_for_compression() stores big_oops_buf and then
max_compressed_size, both with plain stores. pstore_dump() runs from
kmsg_dump on any CPU, tests big_oops_buf without psinfo_lock and then
reads max_compressed_size.

Store the size first and publish the buffer with smp_store_release(),
paired with smp_load_acquire() in pstore_dump().

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 fs/pstore/platform.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 1d76c9d92..1ad6e40f4 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -240,9 +240,14 @@ static void allocate_buf_for_compression(void)
 		return;
 	}
 
-	/* A non-NULL big_oops_buf indicates compression is available. */
-	big_oops_buf = buf;
 	max_compressed_size = compressed_size;
+	/*
+	 * A non-NULL big_oops_buf indicates compression is available.
+	 * pstore_dump() tests it without psinfo_lock and then reads
+	 * max_compressed_size, which is stored above. Publish the buffer
+	 * with release semantics.
+	 */
+	smp_store_release(&big_oops_buf, buf);
 
 	pr_info("Using crash dump compression: %s\n", compress);
 }
@@ -316,7 +321,8 @@ static void pstore_dump(struct kmsg_dumper *dumper,
 		record.part = part;
 		record.buf = psinfo->buf;
 
-		dst = big_oops_buf ?: psinfo->buf;
+		/* Pairs with the smp_store_release() in allocate_buf_for_compression(). */
+		dst = smp_load_acquire(&big_oops_buf) ?: psinfo->buf;
 		dst_size = max_compressed_size ?: psinfo->bufsize;
 
 		/* Write dump header. */

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-pstore-77eb4154d1f2

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>


