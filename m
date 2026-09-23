Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B4B43CE69;
	Wed, 23 Sep 2026 05:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142759; cv=none; b=RKhPYqi2k2JT7egEyaCFZlB/tqqwTwgy39wY3tZ+e8ATqPDkDdxQsocfrcq2X6lJ1oYrtKcezIeaXNvSN05E+ea1tYjxuXYTbFFY9lcrRTbWFW+mVb+CRB+60lSiRfVG/ts1F2vZ5SwwsV6Jt7KToWo+YGrrMwtKMQVMWRWLWAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142759; c=relaxed/simple;
	bh=FZ0xKDZD9xT6ggMd9O6hi2k2RQv8zLhuVtKTp0vnKTU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=G+9EotzGS4qkJtddoVJCOl0iMsi5k4z+k8TlfQHet1ExOzdDZWK4Ysst1DV4EfpZoAxPug3LxdzpHbH8/cMj9vvaE8g+8h4f6CUMGErKZ2H4X9oHth120aG76uQJhwWoH+AH1Mkyh2PmGyCbdDhpP4LmvzYKtxkRTIs8+CVj0E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CA6wQKh9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DSL+fExT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CA6wQKh9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DSL+fExT"
Date: Wed, 23 Sep 2026 05:52:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790142755;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekxZfTMNg4tjF/gKappKbkt6JC7CWUEUGgjU/xAWYD4=;
	b=CA6wQKh9aLBsn1MsWCkRh+1E9kQt6F6jBxd88xS59DT+/6VpDon5us8EExhaIF17yWAHsP
	QFe366SvYh/6z/8Mb6pCjaEALb5YZUjh42xng4N2Pa6YAC8zIMjb/KbpIV0HaNQl/qfMCH
	tDbN+LECjivohj90BmJkbzV7apY0k4Wg3sFlBPMGuCr1a8rAA7yEjuba4RQCZX6zg8Go9m
	CCCpzAIOYuTabw1eqA+v18ERTqUEo5BhKlkbb/peAbWIqmrwudsXSLan1KDVsgFfB3XDj7
	KeljE2fpb3rIMW0MUNNsQ8GpGKlqgC8VE7bI0gFO1p9fZ1z/KRR+NPUvcmMp5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790142755;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekxZfTMNg4tjF/gKappKbkt6JC7CWUEUGgjU/xAWYD4=;
	b=DSL+fExThP1z7x4aRiwKaW8AkTmDMP7A5Pm8FEH+/qrhtpuLDTn6pwGigwpBYoxrBRgtK3
	EhloLkkKyWnxuZDg==
From: "tip-bot2 for Mauricio Faria de Oliveira" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/boot: Remove redundant "cc" clobber in memcmp()
 and document it
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 Mauricio Faria de Oliveira <mfo@igalia.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-pvh-kasan-inline-v10-1-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-1-08da47943d8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179014275415.2819794.14495523541088141017.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     94509668fccfa098e0a3d57e7093a9afd88aea9f
Gitweb:        https://git.kernel.org/tip/94509668fccfa098e0a3d57e7093a9afd88=
aea9f
Author:        Mauricio Faria de Oliveira <mfo@igalia.com>
AuthorDate:    Mon, 21 Sep 2026 22:36:32 -03:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 22 Sep 2026 18:22:38 -07:00

x86/boot: Remove redundant "cc" clobber in memcmp() and document it

The "cc" clobber remains recognized for source compatibility, but it has
no meaning anymore; it is automatically generated without condition-code
constraints:

  https://lore.kernel.org/all/57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de

Comment out the redundant "cc" clobber for documentation purposes.

  [ bp: Massage commit message. ]

Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length test i=
n memcmp()")
Reported-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260921-pvh-kasan-inline-v10-1-08da47943d8e@i=
galia.com
---
 arch/x86/boot/string.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 1632d40..e10260e 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -36,11 +36,15 @@ int memcmp(const void *s1, const void *s2, size_t len)
 	/*
 	 * Make sure ZF is properly set in the len=3D=3D0 case because in it,
 	 * RCX=3D=3D0 and the REPE; CMPSB won't get executed.
+	 *
+	 * The "cc" clobber has no meaning anymore, just source compatibility.
+	 * On x86 the flag status bits are automatically added to the clobber
+	 * set when there are no =3D@ccXY constraints. Keep it as documentation.
 	 */
 	asm volatile("test %3, %3\n\t"
 		     "repe cmpsb"
 		     : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
-		     : : "cc", "memory");
+		     : : /* "cc", */ "memory");
 	return diff;
 }
=20
