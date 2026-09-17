Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E56354706A;
	Thu, 17 Sep 2026 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680385; cv=none; b=RGatcWJEf+XYXw6KzDs9TBPjeHGc2REbFIHncct9GEhfTwRU3x5XWP6bOwlsK1lPSTC3zMGunSp+uKD9yd3MLNX9fIQ4r9A64q9m/MUwSpFRTwoCt7cBLLyMowMjwBowXdk6Ux68IGFAXGX/Hcw9LdY0Iqsj/feejWml5Zd5MUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680385; c=relaxed/simple;
	bh=lOphSDroDxi/xS1bG4UR3DKMxweWGl2LvJp+2HXDkGw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=n5RB1WlyWnQkO6iOYLu2kIQpe0GEVwiJEBHQ/FUK96acwF7xmLKe3mv+qoqCYfKtKwIB+rEE7lRJyMf4N3QDH957jCBO8LAvFsGIxqGb6JUA66lz8m7um0YYbB6HlExvVHESfDZxhFnBDsvTLhuiNEEjpMb8dVkh6qUPkHquRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sRzIUNhb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+B8IOuWD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sRzIUNhb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+B8IOuWD"
Date: Thu, 17 Sep 2026 21:26:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789680381;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/y0KnlVdZa1bhtYFzUlqKUjPFHuDd1BNU2z9MYF2hww=;
	b=sRzIUNhbO5yF3m0RjUped1N8Zq/R4FAgUzkR6QiAk7Z7jkKO9axcAOUqjSO5rkOjdWP6xb
	EhQk5r7yLw4XYkDap4Y99Jl9tQyE1vDeIEIdpWbuSTAGi6i5skKoSX1Qr0vhpAzEeHTsrl
	zYmMFO/8V/Qja8AzXl0FzUxGnD+LtkHW0u0huFG14eWZLyB92C2vhgMYd1G8SobQ5BEcIb
	U0DQ4FnREg7AhVDhLL4BqEmePQ7l1oVU1DCN+ilHnfwp17o6MGRLJnTgrjTZJyudJ1vM/L
	5pqCGI1WpXv/mVE3wQlh7hyY1fzUrAuoPBmYmWfIgArJ0UItmRz08WIdbFOY0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789680381;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/y0KnlVdZa1bhtYFzUlqKUjPFHuDd1BNU2z9MYF2hww=;
	b=+B8IOuWDjE+bOdIIhIDStGrg0SsAk2xxuvGALd0GCjVkbuJgKo583wVTunNGlBTaxbKJAx
	zM/SX0tNAAxzP0DA==
From: "tip-bot2 for Dmitry Antipov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] fs/resctrl: Simplify pseudo_lock_measure_trigger()
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260821081128.19242-2-dmantipov@yandex.ru>
References: <20260821081128.19242-2-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178968037988.1720534.5384771268226600209.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     a3f5e6eba41885dcffb635b54d6c4a18aa579cd5
Gitweb:        https://git.kernel.org/tip/a3f5e6eba41885dcffb635b54d6c4a18aa5=
79cd5
Author:        Dmitry Antipov <dmantipov@yandex.ru>
AuthorDate:    Fri, 21 Aug 2026 11:11:28 +03:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 17 Sep 2026 12:08:47 -07:00

fs/resctrl: Simplify pseudo_lock_measure_trigger()

Use convenient kstrtoint_from_user() to simplify pseudo_lock_measure_trigger(=
).

No functional changes.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/20260821081128.19242-2-dmantipov@yandex.ru
---
 fs/resctrl/pseudo_lock.c |  9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index dea2b4b..56ab63f 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -750,17 +750,10 @@ static ssize_t pseudo_lock_measure_trigger(struct file =
*file,
 					   size_t count, loff_t *ppos)
 {
 	struct rdtgroup *rdtgrp =3D file->private_data;
-	size_t buf_size;
-	char buf[32];
 	int ret;
 	int sel;
=20
-	buf_size =3D min(count, (sizeof(buf) - 1));
-	if (copy_from_user(buf, user_buf, buf_size))
-		return -EFAULT;
-
-	buf[buf_size] =3D '\0';
-	ret =3D kstrtoint(buf, 10, &sel);
+	ret =3D kstrtoint_from_user(user_buf, count, 10, &sel);
 	if (ret =3D=3D 0) {
 		if (sel !=3D 1 && sel !=3D 2 && sel !=3D 3)
 			return -EINVAL;
