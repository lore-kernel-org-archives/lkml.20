Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793131764;
	b=tyfUfs5ctQo1VS2Ygu/5dHwMMkApOfxpwbG133FPCPurBYPWHKVFXp7+7mlm4yPSZkN9
	 0FlRv5xMf6t6X2KmZMd9Cn+wx3NiS2aO5wVqBsnaJW5e6o9D6FSVdg20MBYh8QceXIzLd
	 Npp5Uljvc7YkRWifyO7M2eAdBWBUUoWB4guQE5lQ8UckeAiqtfZhqKb6t2dhpdjStY8gF
	 DRZOhmnAOcqFhwfMRelXj0jV1K4fTC890NoDyneFaYxc+4El+Rq3YsJ0Wxe6BoUFrgCB8
	 VaHsM/HoTaWskjjZ+giUyFqsk4hlXNeOxiuHez6Gb3hG8WQYJAfIW24BhgfRnhvXAFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131764;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qCB2VNIuJaytvnyi8XURzmlcjZmcQYR874A5wGXc/C0=;
	b=Y1ei+dMB3/uua6bnqncqaLNRwP5KxMphwgF4bJCvMKO0A5KGubktKYk8CuBS6aXeZqzS
	 QIblODe0oCu12TKrBe2tPtZbxn53oM5lBwEZtX0P/5+Ct8dJQ7zcbxOHY7849Vqxb07vA
	 V9BbTXga0SQUwYvBzLY9BUZ/+rTtO+98DBtmrR1e2juJZCGBx7VY/Ppeb8CpRN6G/Y5EP
	 EA7pNoMqyGJlDz1GyHKkrupTjYaHw+gLoSNSRr8eMUZ9x9EZ+MMqu32Gr6DEOWp9rrne3
	 EdrsLN3VfbUZrzYN1S1MQ863Eae5uXxD8/H5CzLulnrqUSatEXt0UaHKUTUVJxASnPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ecakqe2i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C323606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ecakqe2i
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793131764;
	b=cXbW7ExwM6MIMWp9yxGA+QUuxdViCRoIl9gUtoPh2fb1GJ6+MRvNMkW7V/NIavoXhQH8
	 HIsuWYpyenz/uxOU1t5jD/0fRpHH8oVYQ1iu7VI5V4DtxP90W0URGSWSbMWdYh+dWhQi4
	 Q35dM3f/bV31qaEOotcWVWQBA9k5SBu92/2cc8bacbroCakqUyhxHzPlS/UjWf8Khs9a0
	 +8qTXtuAh1nallAumYuai37Xp7cQxNplwDLeKE6XJJFyUAIxGrRjkfSPiDB62YH9Ujj89
	 CZgi7pri42ZNP4ldG3OI7YoK/4qH/BqREekGvSSGI4M+AdaBBZDC35M14lxG3N6wI1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131764;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qCB2VNIuJaytvnyi8XURzmlcjZmcQYR874A5wGXc/C0=;
	b=e3CjuIW7lvA0XhbjTpqRRG7eGwGF9uQex4V/Pe75veT5nCKSZ32Lscva1cVwyzNDi0yU
	 F46AkM5muu0i9k2W9FMNZ58k5jAK7q3WbxHt/WlhDC4gU1H1rDGLQwCMTVU0KVTSyMIch
	 YWj+NJJB854uk5S4N+FwPGPJ8dtF8VdtFCb+0nYumlXdF8cmutjUw5EDSp2Ym2TU9eS0/
	 eOR+VwC5r1Rrj27f7G3oFBVTAoFab0/ud4tF24CUS7hACLawRSZYylseXaht5/sRz7on/
	 kcgFaPFq136IgaRmdcYCAuUx7ARYTMkAeZ/Rwiav3Bkf+6izpycpRJvMEmUtPlfvsMg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89A211F01825;
	Tue, 27 Oct 2026 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793131763;
	bh=qCB2VNIuJaytvnyi8XURzmlcjZmcQYR874A5wGXc/C0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ecakqe2ijzu+zd4Vn1EhzS4EAsMhu1JCHwRExSlEPvkq2DXhaPoswpJrvqCNLsp6R
	 ZiE5EsVL3fHbQRskZFaWuFSU8odxwX11JMuAN89RbF2oBYEWLDaZg9IuUP4Wzf9DfF
	 8Dqqm7zy39/9VMZNG24iSHu/lx0HqDTSUUc/wYjGDI+nQD24nu0fseHtbOWV6/DVRY
	 cFyNFcApGOsLPZYp6TbwKXiDOrnluMjw7Ylwaa5hb7AMEXCBQavUhHc+zOTZQtWUMn
	 lcefn5MBF/hLJ9PoPdjV5pzzbfT7oadmatZQAokZgxQO3uO9+APLfWja7auPdIT2lU
	 LRV0v5Hn+o9JA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1AE8F451B4;
	Tue, 27 Oct 2026 20:09:23 +0000 (UTC)
From: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
Date: Tue, 27 Oct 2026 16:09:23 -0400
Subject: [PATCH] exit: use READ_ONCE() to read mm->owner
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
Message-Id: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBNU6Pcq0aJ0qimwcCyC6O5ZL
 b/FexcwekKGOrnA40FMq4tQaQJm6tyIgmw0aKlzJXUhFsOdE3hSEEpW1mCuM1sqiMHmcaDzmzX
 tb977GU14D3DfD5lpoW9uAAAA
X-Change-ID: 20261027-kcsan-exit-109dce625d81
To: Oleg Nesterov <oleg@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu, 
 Mani Tofigh <mt4022@columbia.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793131763; l=1574;
 i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
 bh=WXjCMdCN2l86r1jkTnC4XOf4kZ6T9fA2oOWN9xZ8maQ=;
 b=P4fzFN8wMHtZOrSvTz2cGZqT83oLhWqh1Yl+Q6idpSUy4YBkJ/VD293cGAp/MVmQ0NcTSTKL6
 UTAzDy6KdpKAIEtlMq8vulmMt2Se0lha0gFkV8W1YvL068x2hwvXryx
X-Developer-Key: i=mt4022@columbia.edu; a=ed25519;
 pk=gljCMQDuxyKPmd5y37CRpEJGSPXDV1MyAnHBhCgXl0I=
X-Endpoint-Received: by B4 Relay for mt4022@columbia.edu/20261026 with
 auth_id=1322
X-Original-From: Mani Tofigh <mt4022@columbia.edu>
Reply-To: mt4022@columbia.edu
Content-Transfer-Encoding: 7bit

From: Mani Tofigh <mt4022@columbia.edu>

mm->owner is written with WRITE_ONCE() when ownership moves to another
task, but mm_update_next_owner() reads it with a plain load.  The race
is expected, so read it with READ_ONCE() to match the writer.

  [   14.915975] BUG: KCSAN: data-race in mm_update_next_owner / try_to_set_owner

  [   14.916154] write (marked) to 0xff11000004471b80 of 8 bytes by task 71 on cpu 0:
  [   14.916204]  try_to_set_owner+0x100/0x140
  [   14.916302]  mm_update_next_owner+0x177/0x300
  ...

  [   14.917246] read to 0xff11000004471b80 of 8 bytes by task 75 on cpu 1:
  [   14.917293]  mm_update_next_owner+0x2a/0x300
  [   14.917396]  do_exit+0x575/0x18b0
  ...

  [   14.923906] value changed: 0xff1100002ec04180 -> 0xff1100002ed3a0c0

Found with KCSAN while fuzzing under a deterministic hypervisor that's
currently under development.

Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
---
 kernel/exit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index d5e7bc2af804..cc78596db74d 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -494,7 +494,7 @@ void mm_update_next_owner(struct mm_struct *mm)
 	 * If the exiting or execing task is not the owner, it's
 	 * someone else's problem.
 	 */
-	if (mm->owner != p)
+	if (READ_ONCE(mm->owner) != p)
 		return;
 	/*
 	 * The current owner is exiting/execing and there are no other

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-kcsan-exit-109dce625d81

Best regards,
--  
Mani Tofigh <mt4022@columbia.edu>


