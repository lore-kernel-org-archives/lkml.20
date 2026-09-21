Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F97393DF9;
	Mon, 21 Sep 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018818; cv=none; b=fsor+CXeuGnNpXmjZlDKGGu88VtSukG9uV+j56qcI70E2WVyx/kgRGO83dM09q3ZKigSEWP8JSqsUF/ti25FaMbezCfd9BXZdDZk4Rz+ski/vnjQALHgF9Cr84KbvwS7pKzRICqyPWbyPFVs7/lRckdHd45yvi0PMkL3vOSVeps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018818; c=relaxed/simple;
	bh=qJLZuq6oAKYSgk0uQ2rXXPYSBjR3EEGDlaGy9xqzv0Q=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Jt5ZPjlNyrdvliOC5zlN7QP9ULWXj6lIgJEmHD2lIAlbcEKIsI65JwOQxP8dZae9f8+bZeGng0QnkAlWQ/8LTbUcPOZXUbOeX4tmXmHKQ0RqPI+3CurKexpL9LaQhbdjXRn+b/f9CTW2+EfuCjE++kY+lTuuQybI2g/+h4W40LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KFvf9Wf2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xJAtRNKH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KFvf9Wf2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xJAtRNKH"
Date: Mon, 21 Sep 2026 19:26:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790018813;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TII1CVaV7BwFL3gqAnn/KjVqhARTZYzJnCV7H/QysIo=;
	b=KFvf9Wf23rINSxGiBjT8fjs3+5MHkqpoeDxwoGRFHRVgNcQywmlslBoM57YIUEU4GPXilh
	GJsZu8H5T+cpAKgKe4NR4AYJ51wxUXSlAQMrZ4ikrWcOHSaoIIOqkxTe3TpenvXy4ISpKE
	sWQLCQNYMpob5MUU9Nly1UfkuOgkwrj/bYIzXJISlhyOJbqziYcfjGqgCOOFb6TATvoyzL
	wbbnBnyVfLDiZfDpv9j9hQExOEjG6jp4w81TSRs0H9Nos89+fs4cL9t5GVpzUx8QhmnHyZ
	8bsCOE8On4F0aji2kW31M2zU1+WFf8hRdfNNIORdHtwOC49c9M1dio/pWS61sA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790018813;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TII1CVaV7BwFL3gqAnn/KjVqhARTZYzJnCV7H/QysIo=;
	b=xJAtRNKHoloL6Q+ih9/+tmAYMsQsgOnlAO7QNoJQSTEbge6HvLa0RMAEK01ouUpKNlri9n
	2uCrZ5qpxpkFA+CA==
From: "tip-bot2 for Mike Rapoport (Microsoft)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/mm] x86/mm/pat: Use pr_warn() for early W^X warnings
Cc: Nathan Chancellor <nathan@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260913-fixes-verify-rwx-v3-1-5e1d6a08bd02@kernel.org>
References: <20260913-fixes-verify-rwx-v3-1-5e1d6a08bd02@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179001881134.2819794.17652991935036294067.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/mm branch of tip:

Commit-ID:     ea6fd393cb9e6811a748c7551de0dd3090f9dcde
Gitweb:        https://git.kernel.org/tip/ea6fd393cb9e6811a748c7551de0dd3090f=
9dcde
Author:        Mike Rapoport (Microsoft) <rppt@kernel.org>
AuthorDate:    Sun, 13 Sep 2026 10:37:27 +03:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Mon, 21 Sep 2026 12:23:22 -07:00

x86/mm/pat: Use pr_warn() for early W^X warnings

Nathan Chancellor reports the following warning:

  CPA detected W^X violation: 8000000000000123 -> 0000000000000123 range: 0xf=
fffffffc0400000 - 0xffffffffc0400fff PFN 100e00

from its_alloc() doing set_memory_x() during early retpoline setup.

The warning is not factually wrong but it is unproductive. First, the RWX
permission is temporary and fixed up by execmem_restore_rox(). Second,
at the time of the warning, all kernel text is mapped RWX. So there is not
even a transient actual security issue.

The right way to fix this up is to relax RWX detection during boot but
make a final verification pass over all kernel page tables before running
userspace.  There is code to do that today (debug_checkwx()) but it
must be enabled explicitly in Kconfig.

For now, retain the warning even if it's unproductive, but make it
scream less loudly: use pr_warn_once() rather than WARN_ONCE().

Remove the warning once debug_checkwx() behavior becomes unconditional.

Closes: https://lore.kernel.org/all/20260905044253.GA3816371@ax162
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Link: https://patch.msgid.link/20260913-fixes-verify-rwx-v3-1-5e1d6a08bd02@ke=
rnel.org
---
 arch/x86/mm/pat/set_memory.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index b306000..a799f53 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -697,6 +697,21 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t=
 new, unsigned long star
 		return new;
=20
 	end =3D start + npg * PAGE_SIZE - 1;
+
+	/*
+	 * If the kernel text is still RWX, gently complain, this could be a
+	 * false positive.
+	 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
+	 * the warning can be removed completely.
+	 */
+	if (!kernel_set_to_readonly) {
+		pr_warn_once("CPA detected W^X violation: %016llx -> %016llx range: 0x%016=
lx - 0x%016lx PFN %lx\n",
+		  (unsigned long long)pgprot_val(old),
+		  (unsigned long long)pgprot_val(new),
+		  start, end, pfn);
+		return new;
+	}
+
 	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016l=
x - 0x%016lx PFN %lx\n",
 		  (unsigned long long)pgprot_val(old),
 		  (unsigned long long)pgprot_val(new),
