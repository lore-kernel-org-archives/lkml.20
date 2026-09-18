Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956474D17A3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727413; cv=none; b=E7GCsBo8y9QB5OzHRweINy7k6ReAmXgdZCvZoSycTHs6GSEGG3U+yCUi8renej0t75YYHHl4ed4/LLfRjcck1AAkzzzfUstPc64J+yvfvD3OhdhgkF8VGxBTK1aK2bQYTKjkkjssDX5U2ZbxzsY8kldi+TAXMUKIibMk+IEj83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727413; c=relaxed/simple;
	bh=aE7dK6gR8HyazRioVCXc+Dpci0RqEgy7tYeJ45C4NnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=li3X0Tw56rDOEcOygjS4AGoDEVyVkuSM/fF8GLRc6QeCqOiBiphf+fsllicGK3kFQJYmJgnL7636DLtHMqf26pm1RYdy6/eOE6FmlgWaAGl5e3a1/Fcm9YljckRiOu5JaSOF8F78wHLJdQSJqxltAlC7IkBncub6VLVx0k7T1xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U7cyPzVs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7sMPvsEj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U7cyPzVs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7sMPvsEj"
Date: Fri, 18 Sep 2026 12:30:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789727409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oHcaA1qLUPwSY+4yJb2bIzA1vPNN4t75i6jugzFgUnI=;
	b=U7cyPzVsvq50AMNaQJe/xec3akhWut9W2i4/wvf9FHX8UPzWIM4XrMsuWAB1BSj3oZt04+
	M7vKdNeaYu7GGV8o42NjDwjS5x8uCHEPhDI5q6oMhR7pfhjo04Tdu3WkVaJiEZ7KQOUVwL
	W70kVnuG+UpDRg9uEgBcSB6E4fwqdxiH7x1ikfrnqfnScox5UW4XJkkV0309AtiTrXgvtQ
	RPOGR1ajXgHRWMnzR78jMrYCRecwDkw32VoowwAFkuGXNM+dyPqry5CJpLF+tWrnHH88nk
	yXaNyu+RnwUkZd7gBQoFruXBucWKhTB6st2MdwUMYyRMV1TxWK3irsij9dEuBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789727409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oHcaA1qLUPwSY+4yJb2bIzA1vPNN4t75i6jugzFgUnI=;
	b=7sMPvsEjKt9CHClkX59GcaiDkhj4pH2HI+Qn3h4F7B0P29ZYN3YFf9eRaS0KNOjffWy+Er
	elQtrwyLtQy88dBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Todd Kjos <tkjos@android.com>,
	"Tiffany Y. Yang" <ynaffit@google.com>
Subject: [PATCH] binder: Use %p for pointer formatting
Message-ID: <20260918103008.IkhCxRgs@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Commit 8ca86f1639ec5 ("binder: replace "%p" with "%pK"") introduced the
%pK modifier in order not to leak kernel pointer.
Since commit ad67b74d2469d ("printk: hash addresses printed with %p")
pointers are hashed by default and the behaviour can be controller by
`hash_pointers' boot argument.
Commit 57483a362741e ("binder: Create safe versions of binder log
files") introduced a hashed version while preserving the other interface
where pointers are returned. This interface is for debugging of memory
leaks. Ideally it would provide just one interface without leaking
pointers.

The policy on %p is to not introduce new ones. Rather then removing the
pointer output make it use %p.

Cc: Tiffany Y. Yang <ynaffit@google.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/android/binder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8f2ef1bd539f1..0a42d2957772d 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6413,7 +6413,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
 	spin_lock(&t->lock);
 	to_proc = t->to_proc;
 	seq_printf(m,
-		   "%s %d: %pK from %d:%d to %d:%d code %x flags %x pri %ld a%d r%d elapsed %lldms",
+		   "%s %d: %p from %d:%d to %d:%d code %x flags %x pri %ld a%d r%d elapsed %lldms",
 		   prefix, t->debug_id, t,
 		   t->from_pid,
 		   t->from_tid,
@@ -6578,7 +6578,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
 				     struct binder_ref *ref)
 {
 	binder_node_lock(ref->node);
-	seq_printf(m, "  ref %d: desc %d %snode %d s %d w %d d %pK\n",
+	seq_printf(m, "  ref %d: desc %d %snode %d s %d w %d d %p\n",
 		   ref->data.debug_id, ref->data.desc,
 		   ref->node->proc ? "" : "dead ",
 		   ref->node->debug_id, ref->data.strong,
-- 
2.55.0

