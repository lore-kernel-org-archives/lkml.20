Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC0B35C68E;
	Wed, 30 Sep 2026 04:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741239; cv=none; b=SRxkc8z6lxdmrluOvw2YaZMQltWWvHFWaY5AoCqeS2djI//EIdXKjepF1p6B16Gub9gk+NVxEspRH8tuzRsqtSZ57uG9SjzsgMkJ2CDLDfxFBdVdO/WHYxXo+Qfr5WideS9MQ/5h5R0YER0B6gKmElfO34nOhTZjKv0jymn2X+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741239; c=relaxed/simple;
	bh=Lu8ZQPi2OxEIWypUkHNymgoSd6aOra+NkH6mwVXbKzg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=n+xY6806gMh27ghjxRzlTu7AgmueBF9/1E9NO4x0kOnv28bVByyCSxWVqZFT0YSsRvYJx0NjXZ6P7SOocnxdjBuOfnbCfy684LX7K/RFrWjF0ojD915UCSp+sidvs/jDqkO6PNtWCMQWHXH+5DSd88j0Cj82WOcsKQdreVQR0aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PifqFxZ9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6FBWHyM+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PifqFxZ9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6FBWHyM+"
Date: Wed, 30 Sep 2026 04:07:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790741236;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUykl832QLZ17HbYE8mmT+kS0hKWuIqwgxU7/wvfCuw=;
	b=PifqFxZ9DeTqxz7VZphtruWoeWyrtj6T0RbehcoAwX4dS31KAaIZpFbg4LC2jEpQlbvmg/
	jAd/L4eA4ToxMPBfUCzQmkfMYmLXaxEPeoKMN7hM5ZyG/ARMTNYHYUyBc7J6AI9Eah2e2U
	C3DESsFe4EhcgN4NDFA5bnwcsteB+q8jZk7x2uCM5ee8YJnyOc0fZgk6yT1sjzP0OFubIO
	P+mNv8V6dwCN/0uJ6wyrsIkEEtExmEbRQnkPgQY0+D6u3aSiZKeS4eU3Wz7HXHucwl+hdA
	cuEj1rau7BnzghhG+Cj+nKoRSiRehHUhnEAZOFeISkuVU8CwzEMYIvkTuvgz/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790741236;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUykl832QLZ17HbYE8mmT+kS0hKWuIqwgxU7/wvfCuw=;
	b=6FBWHyM+yRnIkkxQDH3byfvzpFyD3QvF4e/gtGZETvNE6ObNGrK8EVHrUb2BD44q3aJ8xA
	5GSYecOxRUGNzTBg==
From: "tip-bot2 for Ethan Nelson-Moore" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/cleanups] x86/um: Remove unused <asm/required-features.h> header
Cc: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918031807.449816-1-enelsonmoore@gmail.com>
References: <20260918031807.449816-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179074123423.3910103.1285160358219471163.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     2c6a75adb15f8fbeb7a8cc6b1f35beb21db20762
Gitweb:        https://git.kernel.org/tip/2c6a75adb15f8fbeb7a8cc6b1f35beb21db=
20762
Author:        Ethan Nelson-Moore <enelsonmoore@gmail.com>
AuthorDate:    Thu, 17 Sep 2026 20:18:01 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 29 Sep 2026 20:48:21 -07:00

x86/um: Remove unused <asm/required-features.h> header

arch/x86/um/asm/required-features.h only existed to satisfy dependencies on
the non-UML x86 header of the same name, which was removed in

  8f97566c8a81 ("x86/cpufeatures: Remove {disabled,required}-features.h").

Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260918031807.449816-1-enelsonmoore@gmail.com
---
 arch/x86/um/asm/required-features.h |  9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 arch/x86/um/asm/required-features.h

diff --git a/arch/x86/um/asm/required-features.h b/arch/x86/um/asm/required-f=
eatures.h
deleted file mode 100644
index dfb967b..0000000
--- a/arch/x86/um/asm/required-features.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef __UM_REQUIRED_FEATURES_H
-#define __UM_REQUIRED_FEATURES_H
-
-/*
- * Nothing to see, just need something for the i386 and x86_64 asm
- * headers to include.
- */
-
-#endif
