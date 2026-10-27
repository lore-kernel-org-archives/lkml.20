Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142705;
	b=ahJeN6FyEJIB7Ud3UG0ozAXsJlr+m0PUti4BPtRmJpGG5W5iazmosbjrnnU5D16C25e2
	 GZn8zkrdQ7vbVx7z8nKG3AV7rX3Z6SQ9jtddOiWzKTdSpw5azeHFDKCR8odzGoFnra1qO
	 HdulEu9ai9DSy3V34eg0UEY6Bmef2c9uY62jAgINTE90q2O9H6EQhQKZ1mURwYlq1a+49
	 Kjyl4NsopSbb8FrRsIwhQWb24+RtojkXeLQ5Sq+wnXlV7pIxQG6dMZRsgGPaTpvrhzugo
	 4Hmlrb0fl7cyaXTzT3CKx/btbYcscVUJlsFW90VVJPs/s4MCymbC8X/aW7n3jijsaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142705;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PXoetgO1CUUCBq2JpzhySy2jWaXIOCkRLKW2lGpa+yU=;
	b=cHABUP3rIrCnsz65olEwf9E0a1DGLvyhjaBVlgYgD5Lhsaj89aDkL7zn8EBJdjwcr/lW
	 wxJc9R8t6eIWDua/OqpHDgd9J1+1r8E4e9dmmfNGA9/U1Ujw3tYSMxlMNvzOxmZ0udNjR
	 DFLua/8449NXau5xtjC7184GWzUcaxEIqK3vCH5lUN6C5knFYtS6Rqs/k3FgLVztVXacN
	 hcptCiLvC0VLWF3gpbPcDHRDNzDxE3A8ciLb1OhjD7qf0obro27G5OC2dXmer06XuX/XS
	 EoNGpnPXBEHbYNzXh3KvMbHJilRJcsmo/+u9lxQxwoahUe/xg13XHP7dJ76P/z2vQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="pr/fke88";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=e0hThbe4;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A8606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=pr/fke88;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=e0hThbe4
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793142673; bh=PXoetgO1CUUCBq2JpzhySy2
	jWaXIOCkRLKW2lGpa+yU=; b=pr/fke881R2ele5X33CmHLtODGz5T2ZSqPD0QJta8+RzaTxm9Y
	kHYR/YBtCrOfZSh3K1LQu5kH+a+oKOPGGenNu0aK1rSmCC3xjE+XQrIHJ/bjO0mRyKxPBPlNunz
	gPD+pi+IcRIeFIg/FXWxAWMtU5S2qMBEW/abPlbd4gsvo1HnfMiS3CEA8RTiX5HOamj7dtXxpqa
	CzcaiqNXbQUZKpkKr2GiiBZnu1KxswZYkDLAmybIGRYkkcM6mbu/2XQJ9tPLE2fQmvpEAUXKwOX
	Mf5hbGWzIhvk2Igpnp+T/BBbFq53rxgX5ebqepqRUzh2vHdx2LE4NLJ1kR5rCQ6LAlA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793142673; bh=PXoetgO1CUUCBq2JpzhySy2
	jWaXIOCkRLKW2lGpa+yU=; b=e0hThbe4lAUBNYYSkl06ucJ/kFylYBTMovlCjNYf2h3MkibaZK
	IH7AuLJgGWGx6/xfbBbRDVL5Sx8Eo72SaFCA==;
Date: Tue, 27 Oct 2026 23:11:14 +0000
From: Bradley Morgan <brads@mainlining.org>
To: devnull+mt4022.columbia.edu@kernel.org
CC: akpm@linux-foundation.org, brauner@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, mt4022@columbia.edu, oleg@redhat.com,
 tz2294@columbia.edu
Subject: Re: [PATCH] exit: use READ_ONCE() to read mm->owner
In-Reply-To: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
Message-ID: <6F241BB0-3651-424B-879A-C7CC72E9AE1E@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 27 October 2026 20:09:23 GMT, Mani Tofigh via B4 Relay
<devnull+mt4022.columbia.edu@kernel.org> wrote:
>From: Mani Tofigh <mt4022@columbia.edu>
>
>mm->owner is written with WRITE_ONCE() when ownership moves to another
>task, but mm_update_next_owner() reads it with a plain load.  The race
>is expected, so read it with READ_ONCE() to match the writer.
>
>  [   14.915975] BUG: KCSAN: data-race in mm_update_next_owner / try_to_set_owner
>
>  [   14.916154] write (marked) to 0xff11000004471b80 of 8 bytes by task 71 on cpu 0:
>  [   14.916204]  try_to_set_owner+0x100/0x140
>  [   14.916302]  mm_update_next_owner+0x177/0x300
>  ...
>
>  [   14.917246] read to 0xff11000004471b80 of 8 bytes by task 75 on cpu 1:
>  [   14.917293]  mm_update_next_owner+0x2a/0x300
>  [   14.917396]  do_exit+0x575/0x18b0
>  ...
>
>  [   14.923906] value changed: 0xff1100002ec04180 -> 0xff1100002ed3a0c0
>
>Found with KCSAN while fuzzing under a deterministic hypervisor that's
>currently under development.

Good fix, not complaining 

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>
>Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
>---
> kernel/exit.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/exit.c b/kernel/exit.c
>index d5e7bc2af804..cc78596db74d 100644
>--- a/kernel/exit.c
>+++ b/kernel/exit.c
>@@ -494,7 +494,7 @@ void mm_update_next_owner(struct mm_struct *mm)
> 	 * If the exiting or execing task is not the owner, it's
> 	 * someone else's problem.
> 	 */
>-	if (mm->owner != p)
>+	if (READ_ONCE(mm->owner) != p)

Wow!

> 		return;
> 	/*
> 	 * The current owner is exiting/execing and there are no other
>
>---
>base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
>change-id: 20261027-kcsan-exit-109dce625d81
>
>Best regards,
>--  
>Mani Tofigh <mt4022@columbia.edu>
>
>
>
>From mboxrd@z Thu Jan  1 00:00:00 1970
>From: Mani Tofigh <mt4022@columbia.edu>
>Date: Tue, 27 Oct 2026 16:09:23 -0400
>Subject: [PATCH] exit: use READ_ONCE() to read mm->owner
>MIME-Version: 1.0
>Content-Type: text/plain; charset="utf-8"
>Content-Transfer-Encoding: 7bit
>Message-Id: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
>X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBNU6Pcq0aJ0qimwcCyC6O5ZL
> b/FexcwekKGOrnA40FMq4tQaQJm6tyIgmw0aKlzJXUhFsOdE3hSEEpW1mCuM1sqiMHmcaDzmzX
> tb977GU14D3DfD5lpoW9uAAAA
>X-Change-ID: 20261027-kcsan-exit-109dce625d81
>To: Oleg Nesterov <oleg@redhat.com>, 
> Andrew Morton <akpm@linux-foundation.org>, 
> Christian Brauner <brauner@kernel.org>
>Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu, 
> Mani Tofigh <mt4022@columbia.edu>
>X-Mailer: b4 0.16.0
>X-Developer-Signature: v=1; a=ed25519-sha256; t=1793131763; l=1574;
> i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
> bh=WXjCMdCN2l86r1jkTnC4XOf4kZ6T9fA2oOWN9xZ8maQ=;
> b=P4fzFN8wMHtZOrSvTz2cGZqT83oLhWqh1Yl+Q6idpSUy4YBkJ/VD293cGAp/MVmQ0NcTSTKL6
> UTAzDy6KdpKAIEtlMq8vulmMt2Se0lha0gFkV8W1YvL068x2hwvXryx
>X-Developer-Key: i=mt4022@columbia.edu; a=ed25519;
> pk=gljCMQDuxyKPmd5y37CRpEJGSPXDV1MyAnHBhCgXl0I=
>X-Endpoint-Received: by B4 Relay for mt4022@columbia.edu/20261026 with auth_id=1322
>List-Id: B4 Relay Submissions <b4-sent.feeds.kernel.org>
>
>mm->owner is written with WRITE_ONCE() when ownership moves to another
>task, but mm_update_next_owner() reads it with a plain load.  The race
>is expected, so read it with READ_ONCE() to match the writer.
>
>  [   14.915975] BUG: KCSAN: data-race in mm_update_next_owner / try_to_set_owner
>
>  [   14.916154] write (marked) to 0xff11000004471b80 of 8 bytes by task 71 on cpu 0:
>  [   14.916204]  try_to_set_owner+0x100/0x140
>  [   14.916302]  mm_update_next_owner+0x177/0x300
>  ...
>
>  [   14.917246] read to 0xff11000004471b80 of 8 bytes by task 75 on cpu 1:
>  [   14.917293]  mm_update_next_owner+0x2a/0x300
>  [   14.917396]  do_exit+0x575/0x18b0
>  ...
>
>  [   14.923906] value changed: 0xff1100002ec04180 -> 0xff1100002ed3a0c0
>
>Found with KCSAN while fuzzing under a deterministic hypervisor that's
>currently under development.
>
>Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
>---
> kernel/exit.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/exit.c b/kernel/exit.c
>index d5e7bc2af804..cc78596db74d 100644
>--- a/kernel/exit.c
>+++ b/kernel/exit.c
>@@ -494,7 +494,7 @@ void mm_update_next_owner(struct mm_struct *mm)
> 	 * If the exiting or execing task is not the owner, it's
> 	 * someone else's problem.
> 	 */
>-	if (mm->owner != p)
>+	if (READ_ONCE(mm->owner) != p)
> 		return;
> 	/*
> 	 * The current owner is exiting/execing and there are no other
>
>---
>base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
>change-id: 20261027-kcsan-exit-109dce625d81
>
>Best regards,
>--  
>Mani Tofigh <mt4022@columbia.edu>
>
>
>


--- Thanks!
