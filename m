Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238914;
	b=CIyeCCODSQRADe0IH44K/kJ546HCYPSnuPpwcuq///bNK46HNsCmpxUP+88RkAfc3Cwl
	 oHi03tztSNc0+FIG5NNEG7UvrBZLDlDbymzVkge4w9h/civ3/srLKBeMWcenZMw4YB81E
	 qyHUYzHLs52jim3p8t4lz51rUUqortlPy1FzP6/KAbd13Q40vak77nIfHuz+z3rmck3AR
	 gCae76JW+Y1yZo7lVyqufMYINgUaw6xq9TUiNsSBN4F5g7AhPYgCT5C4JQlolmMfd3T8/
	 AbhHUkntmESwdfG9Zu5g6MiKKSUV3WIrmquAVPSJKoWkvJ4DUoF64BkssB2Agkmcvtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238914;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=fG+mmmwvpSEd16WqctDQ4G6KvJU9q7uJr2YMSC6KHmY=;
	b=CKOqYSmYdKI4ZiRP9jj09k2lUheOppN4cimba4XP7kUbv6EnxeqPAQ5wFBn4zURoFlYZ
	 Z7BNmdC626Y376JgURzDG23LtwrSggqPGqS7EviBnoMTjH2SpilxHWNkgpJBy+kOPn9E9
	 7Y5WYDjBVRqzOMensoXv4MIEuYR9ActOIbyy++yK+y1yhKJEn2XVjpdsWL3CTkhQwLCtN
	 07fPcYCa2H/HM9xi15wkZMpbcEPIdHTfPpVwbVjORCK9faszfIlz2SZ+ILjAY3TuCCIiI
	 dkQO/lGxDJjpwaWGo1pdUeQgiG93pCD/FIYUriStEUL0Y8LyzfEjNo6Q3DnblOsMX4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jeh957CP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lH7t4mgz;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CB606A334;
	Mon,  9 Nov 2026 15:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3CB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jeh957CP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lH7t4mgz
Date: Mon, 09 Nov 2026 15:41:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794238911;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fG+mmmwvpSEd16WqctDQ4G6KvJU9q7uJr2YMSC6KHmY=;
	b=jeh957CPWtvIxhwKSbo5FVdS+i/3YeL80Ox40CwZ/bIz4e35oQeGbUaAbEuODM7MOFa60m
	8Fm/mnpPK+B5ELss3UjzoGZ80QzeV91ekxhxJZmC8M2a5So4rsxAATD57xYwU9g4sXI9wW
	XPhddbDdmzZck3nWBBfZhV1uQYZps2KIHZSDMBMjr0N1YO6oXVjiGHOnbI0TnXBIhbYML4
	xN6z+ysIOTrYDgsUItIrJ77IriFBS4Tr6zcacJRsQIWumRxkCTx28gn5KAjYXjUsdlXaHx
	NzC8wHrrVfyUHoWn+p4GNscZtLpoiNQQxKdLyrr5X3ugWoJ8ILIGVO7fA72D2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794238911;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fG+mmmwvpSEd16WqctDQ4G6KvJU9q7uJr2YMSC6KHmY=;
	b=lH7t4mgze7559fyz7yq05XDF3BAUEK/TDJ0wDS7XHUniz9GDcVlBQEOeWSh0JhfTiAmtah
	RB1anRnWv73K3VBA==
From: "tip-bot2 for Ian Rogers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/urgent] tools headers: Update the vdso/unaligned.h copy
 with the kernel sources
Cc: Ian Rogers <irogers@google.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020163210.742728-2-irogers@google.com>
References: <20261020163210.742728-2-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179423890977.2093942.6473317468035728157.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/urgent branch of tip:

Commit-ID:     5e85b36768b7bba53a55b1c9a1b1cdcab3684634
Gitweb:        https://git.kernel.org/tip/5e85b36768b7bba53a55b1c9a1b1cdcab36=
84634
Author:        Ian Rogers <irogers@google.com>
AuthorDate:    Tue, 20 Oct 2026 09:32:10 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 16:34:51 +01:00

tools headers: Update the vdso/unaligned.h copy with the kernel sources

To pick up the changes in:

  vdso: Add VDSO_UNALIGNED_PACKED config option

Signed-off-by: Ian Rogers <irogers@google.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261020163210.742728-2-irogers@google.com
---
 tools/include/vdso/unaligned.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/include/vdso/unaligned.h b/tools/include/vdso/unaligned.h
index 9076483..726fd15 100644
--- a/tools/include/vdso/unaligned.h
+++ b/tools/include/vdso/unaligned.h
@@ -4,6 +4,20 @@
=20
 #include <linux/compiler_types.h>
=20
+#ifdef CONFIG_VDSO_UNALIGNED_PACKED
+
+#define __get_unaligned_t(type, ptr) ({							\
+	const struct { type x; } __packed * __get_pptr =3D (typeof(__get_pptr))(ptr=
);	\
+	__get_pptr->x;									\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {						\
+	struct { type x; } __packed * __put_pptr =3D (typeof(__put_pptr))(ptr);		\
+	__put_pptr->x =3D (val);								\
+} while (0)
+
+#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
+
 /**
  * __get_unaligned_t - read an unaligned value from memory.
  * @type:	the type to load from the pointer.
@@ -41,4 +55,6 @@
 			 sizeof(__put_unaligned_val));			\
 } while (0)
=20
+#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
+
 #endif /* __VDSO_UNALIGNED_H */
