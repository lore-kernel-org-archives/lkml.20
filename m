Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5497133BBD7;
	Tue,  8 Sep 2026 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853410; cv=none; b=bB5IMPxnLXrtDWVUG6r7diHJotRrxnlWzw8SsyvJQXFyigqjVfnNSRmc2G37E41v4/4VCwJc36ks4Ez9LawnlTAZtHH3+eooFaw1vxEdHcAyUKE5LFX8PrGxfPQtXdQ7QW57ju5Dvft8kPerZDrR0193ckUqUgxDVBQlfJIUVrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853410; c=relaxed/simple;
	bh=Bw+axu43avkyFLTiQQZ6kVUvzDKn3N2bQGb9RJKbMhQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=L2+BSzVRRSBvu1Uh4lOhfS/JfmLAPHAxXkoHLuqsIqWMZmG6QU44CYJCM4dIPrs5k0xdXblL/7RiNhqxUAUy4T2t2Z2Vda6wXNyFSOWjYEAAiiP8rG0wdQAuWR4nJDGCEsaVdpChJKIXQP900R4scp8kqak2I2pBxuGzA8PdEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hEihOaDp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rCOmH0x7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hEihOaDp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rCOmH0x7"
Date: Tue, 08 Sep 2026 07:43:26 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788853407;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbJ+JyFBWq30OXKCQxIasTApAKF3nXO2y4UjUlihjtg=;
	b=hEihOaDpzWyntxUgfa0eq6yX5RKvhhUhHHCxguRtm+o7RRGxJZULqItVgf1+iAQ/rH4nFz
	WHKff5OS1kG1YWl2ikG22FoblJeARjylqR5qTeVmgIZ9EOnNTf2ug5ttTrZISZdwJpplyz
	/W4tR8UxmIslzsEvuMra/9xluRiQD0PtpJPyF3obizcKLyR2wVvLzh1w/wZdeCVbha1I9Q
	PPVYBx5CNR0dYcy23jHo4hk3lT9PPiIFv4xR5HT/KKu5Yly+FG7JA96TC9iK81P3/ELlDg
	WyXCN87kWOXS87R/ASxbuD8/8eI8tiKTttfbHb/kMvrndqI35vwghNyFCG1aYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788853407;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbJ+JyFBWq30OXKCQxIasTApAKF3nXO2y4UjUlihjtg=;
	b=rCOmH0x7oSKGry2oATVjoDy71D2hvUBLMz1azZRKfLL68Is6lXV0gqjrG9dsU27N9Op4AW
	xa0xQzap5waZVPCQ==
From: "tip-bot2 for Yafang Shao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/urgent] klp-build: Fix wrong index in funcs cleanup error path
Cc: Yafang Shao <laoar.shao@gmail.com>, Song Liu <song@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816090442.18128-2-laoar.shao@gmail.com>
References: <20260816090442.18128-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178885340612.623050.6013140772652803851.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/urgent branch of tip:

Commit-ID:     4825ef699cda4c6f2f0586b17a5e225560481da6
Gitweb:        https://git.kernel.org/tip/4825ef699cda4c6f2f0586b17a5e2255604=
81da6
Author:        Yafang Shao <laoar.shao@gmail.com>
AuthorDate:    Sun, 16 Aug 2026 17:04:41 +08:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Mon, 31 Aug 2026 17:50:06 -07:00

klp-build: Fix wrong index in funcs cleanup error path

In the object allocation loop, when kzalloc() for funcs fails, the
cleanup loop uses `objs[i].funcs` instead of `objs[j].funcs`. Since
`objs[i].funcs` is still NULL at that point, it repeatedly calls
kfree(NULL) and leaks all previously allocated funcs arrays.

Fixes: 59adee07b568 ("livepatch/klp-build: Add stub init code for livepatch m=
odules")
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Song Liu <song@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Link: https://patch.msgid.link/20260816090442.18128-2-laoar.shao@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
index f14d8c8..16aff8f 100644
--- a/scripts/livepatch/init.c
+++ b/scripts/livepatch/init.c
@@ -51,7 +51,7 @@ static int __init livepatch_mod_init(void)
 		if (!funcs) {
 			ret =3D -ENOMEM;
 			for (int j =3D 0; j < i; j++)
-				kfree(objs[i].funcs);
+				kfree(objs[j].funcs);
 			goto err_free_objs;
 		}
=20
