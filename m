Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1A2DCC13
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908193; cv=none; b=ejRLXPvx6JulhMneOi6Of6LFfjcP5dZjkPWt757QNcMMsgv83WgctTjbM0CtopBiuqa97ESAz/fUwFTWfK7caZkPUW82m60YirO4L9mK6eYgz2/5X2AKXr4GoPORbqmWU5UTNxb+LLGM0UjporWHjv9i4GkDjRnGkKa6MB9UcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908193; c=relaxed/simple;
	bh=uBmifK3xn1U4UEUvqjN0GE7aW0v2ASpRaduNpRDS4wY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tUr0eFWgxpgocKJX3uatpn4+W7kaERRSTfgWI+xtY4QamG0y29scUrHVK5IQMyCMHF5E/omDs3YS/+ssaeMVUKuxfGgBHQJLcvIm0lmkfoKzBflZgPiclPZaiLFTcrZ+1YqFI4awTqyyn9Tb2WRCi+8u0OIBZwisK/raPb2lfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKQ5jiKY; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKQ5jiKY"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1030214a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908192; x=1788512992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+BhIxsHGdJK+bIOBGnbSxpqWH2lge1r88/JK8Sl0ts=;
        b=cKQ5jiKYPs1QrwdK0pyRgKAAFtzWV+QkGwnGskZsztIYJ8YTYKVW3lpSHVN61GpZDL
         1AtNJaEp4NvwQxfBGePBJVDyEoVjuLIdeNDC6lXC7uSDNs6EsDiqnX/khlHiOeUG3oXs
         Y4ltC340i12MidtSuMpvTfD0zu5Y3cjzbHOJOM477Gawumpef3Wut+mZRSPUMAaBCUWJ
         oocIXV2cWNhQBByuE+duzka6EnheEfdoWzyLLiCgEgFQMamIauoPXsWBGRD2BE5sOd0/
         OVUcI4dQtPi2KtYe16MIH3G0L+XyN/EnEfmiCN7hELghAQ4LVSoCPvitcRESx3IijFOc
         R05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908192; x=1788512992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+BhIxsHGdJK+bIOBGnbSxpqWH2lge1r88/JK8Sl0ts=;
        b=FDE060bgTUWre4O+v716ZxjBqPC9b9N3dDc2xTg9o/GwDtmB5z4s29CDMtOsNDyyL3
         IkzG5Kyn4fjPYgj2gU0vacJj/PGOq7dcQu3EhHfgdjnKvbenHhQqAc0tCAf/buv9hn42
         jCIdY6x+RQk1AA1WXHPuHzebU9Q0Y4uqGOJc8fBioksHxiLjHonr481miz50zhxVxyBK
         Vz55kY7ley9YLpkzjV8/4FPD9QYM5QL8EaJ52c/Gg+Q9Ma5DM7xat/YRsFZrE6OfJ58J
         41XsKdLj1QiSW3pRb2dRFzDv4WEVWUZdCEYvtWmA+v4hkWxaAkaWf/79n2VIMfzlzFkq
         V3vA==
X-Gm-Message-State: AFuF++ldQPCgKmzdxNBVNF5Ol+u/Z5csl+l8+veUI1+OHzDPiQshE9Ze
	JpZijmQP7Ee//PBhmEJQyyDry3ObAflv8psMLbYPJXuZD1laIp4RLSYhtOPlMq+IooCEnQ==
X-Gm-Gg: AR+sD13UyAs5hDz3wmVcH6dyrb1CD7HSDmepx0wHysTRUehSCjayXkF4H9VUB7NcJ1S
	EaCtuSC2W8exkzuujeCboKZBuOuKWDAbDFvC838bf7eIl2YU1MMZG3jnn0B8xyg1wxZ4XIbGKCo
	IVzNqesAKsv+RyaxzASOEgz9zeET8HqzIkiiOYS8mAa0SR+hpIRizQg6P5QDmykn4kpd967sjJw
	Unrdu3KKMYzsqKaD2I+gGZ7sEU57XP/pjfFmtJhambXdAzlj2RYEbgfY6d+HykB46UPnJf7bmwP
	B3i7IO55l+MElStDM0kadA0OQMbIYL7Gj+QBuI1cchCl9yAQhbCW8xXD3LSc9ssK+pYaNk2f4hP
	IZRzGfV66t6A9+C1lnzvVAq23brmx90q9E6qT2lFc+zCx4bJvm/TmuIe18cd3Fu4fLbMSv9MoIY
	aQmEPftHpQrF3qP1DoAIWN8m8MG25aBHQGr/ak0D9n7Dn6dZRYZxufM7lM6XJvHWAROxlLAFQEr
	fnec9RWDlcEwXoByU3xL3UW6axdA5AVwmXxs8izLNteyUWRlOnsWkZFgKcC0WxrGbtsmiqqhJm5
	A2KQFELyahOuXv8vH2U=
X-Received: by 2002:a17:90b:4a92:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-396d0f75f22mr10898991a91.9.1787908191775;
        Fri, 28 Aug 2026 02:09:51 -0700 (PDT)
Received: from localhost.localdomain (ppp-171-96-189-61.revip8.asianet.co.th. [171.96.189.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc07777sm1928532a91.12.2026.08.28.02.09.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 02:09:51 -0700 (PDT)
From: scadastrangelove <scadastrangelove@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Sergey Gordeychik <scadastrangelove@gmail.com>
Subject: [PATCH v2] rust_binder: use KVVec for files_to_translate
Date: Fri, 28 Aug 2026 12:07:57 +0300
Message-Id: <20260828090757.96282-1-scadastrangelove@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sergey Gordeychik <scadastrangelove@gmail.com>

The num_fds value in a binder_fd_array_object is bounded by the
transaction buffer. However, its in-kernel metadata is larger than the
u32 array on the wire.

On 64-bit systems, FileEntry occupies 24 bytes. About 900,000 entries
therefore make files_to_translate request roughly 20.6 MiB of
physically contiguous memory, triggering a warning in
__alloc_frozen_pages_noprof.

translate_fds() later allocates Reservation entries from the same
count. At 16 bytes per entry, this requires another 13.7 MiB contiguous
allocation.

Neither vector requires physical contiguity. Use KVVec for both so
large allocations can fall back to vmalloc.

Tested under QEMU/KVM. The 900,000-entry reproducer no longer triggers
a page allocator warning, and a 300,000-entry transaction that repeats
one valid fd reaches translate_fds() without WARN or BUG.

Found with the rust-in-peace agentic pipeline
(https://github.com/scadastrangelove/rust-in-peace).

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Sergey Gordeychik <scadastrangelove@gmail.com>
---
Changes in v2:
- Add missing [PATCH] tag.
- Suggested-by must be an email address per checkpatch; "rust-in-peace
  agentic pipeline" isn't a person with one, so moved the credit into
  the commit message body as prose instead.
- close_on_free question answered in a separate reply in this thread.
- Link to v1: https://lore.kernel.org/r/20260825161712.41471-1-scadastrangelove@gmail.com
---
 drivers/android/binder/allocation.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index ea5846e4d..6a95298f2 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -208,7 +208,7 @@ pub(crate) fn translate_fds(&mut self) -> Result<TranslatedFds> {
         let num_close_on_free = files.iter().filter(|entry| entry.close_on_free).count();
         let mut close_on_free = KVec::with_capacity(num_close_on_free, GFP_KERNEL)?;

-        let mut reservations = KVec::with_capacity(files.len(), GFP_KERNEL)?;
+        let mut reservations = KVVec::with_capacity(files.len(), GFP_KERNEL)?;
         for file_info in files {
             let res = FileDescriptorReservation::get_unused_fd_flags(bindings::O_CLOEXEC)?;
             let fd = res.reserved_fd();
@@ -567,7 +567,7 @@ fn type_to_size(type_: u32) -> Option<usize> {

 #[derive(Default)]
 struct FileList {
-    files_to_translate: KVec<FileEntry>,
+    files_to_translate: KVVec<FileEntry>,
     close_on_free: KVec<u32>,
 }

@@ -581,7 +581,7 @@ struct FileEntry {
 }

 pub(crate) struct TranslatedFds {
-    reservations: KVec<Reservation>,
+    reservations: KVVec<Reservation>,
     /// If commit is called, then these fds should be closed. (If commit is not called, then they
     /// shouldn't be closed.)
     close_on_free: FdsCloseOnFree,
@@ -595,7 +595,7 @@ struct Reservation {
 impl TranslatedFds {
     pub(crate) fn new() -> Self {
         Self {
-            reservations: KVec::new(),
+            reservations: KVVec::new(),
             close_on_free: FdsCloseOnFree(KVec::new()),
         }
     }
--
2.43.0
