Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237919;
	b=RGxj5YmZ5Ii81leB8PVVGCI0Yhm8P1mqkRivKHpOymuHyT7AE07YitXEl6XIHEPxa2k1
	 a5+JpxXxnuOIhKPXezvR2I67Q7F3DfU5OzMOlz3Lq0WEJqOqjJvSEHdrReGxAG9eZu6LO
	 1OWWbLSHnDKkzMOR6tZM11wFMlCOPVDfc0XVH0Gw4/skXfzdTTldQCvV5jzqofghfIK+f
	 hKhg1lw9+EBIcLjR2i04ziSnaPpx9XbzYtHSECDbdph2X/vrLasgSkbsKBxYfsu/bZ4eT
	 1uMvfrsZtix+tdfq9C7HLFs09gBLb59835CbRgqpcALiam3t4kGPVgl2on+vzbhcu2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237919;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=iZleujFBvqPqOsleB251CwKn42Cdi9jzvEsFErldcqM=;
	b=24SpF1Ch3SpSeizfZyzT0B4RckrbE5gTkYM8vNGx4ozJHi461p0YXOByACAKos0qXQ6D
	 nvsIwfLi/nZ1MKZRtDGEKw+i6mrFC2KHfH3bZik3DHoU6nke6RtuH7xWMJkPFIZ7Sswon
	 c01BsH4+X4Pat3cb8wi6YSk0FJZBAzLwz1dybLAIEVUzHnZQlmk6L1hC0zBB7LpuN0uS6
	 qzmqkXXdi013pdQ3AetFSspmVxfrAe91ehkfaLVdyd6QzSgyr1kgcpmxPzVt46LgPSRjo
	 DCX7Xre02vyHjwlCyscdAlA+b7G/cjBEo8T6V+swDwapF5XLDLaG4nHBNTgvE5Qd7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="lO+X2/2V";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yqwc26Ay;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDA606A321;
	Mon,  9 Nov 2026 15:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BEDA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lO+X2/2V;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yqwc26Ay
Date: Mon, 09 Nov 2026 15:25:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794237917;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZleujFBvqPqOsleB251CwKn42Cdi9jzvEsFErldcqM=;
	b=lO+X2/2V+Umz8lEaxSgNBkH1F9O3lPmiM9T0BfXWWaS1gADi5o2ysOqUSh/5AhSOq8o8g2
	h3vMld4OxkTGt3volFttG4J/MjNVnVW6EHdq4lMU4ePwcVG1GXW8dzw+Wa9aDhbu8nGmMJ
	kiXHrJX2u3b0dNWJ98ReV4r/M4OiAv68B/jvINqcc+ptwJ4KGc2esSIgb9AL0n2uAxKaSy
	Z/wqLSlxWMZROawAkm/0BG+qYS5dFX6FFt/qLZZ7Pr98ry5EMa9J7gStX/9v0jjrWsGqmS
	G+lUoWWXfUz0zPPmWFch+0tDkdDMJOCX1q0FTaQftJCkpGp9/JQ1xQyYp1SUFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794237917;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZleujFBvqPqOsleB251CwKn42Cdi9jzvEsFErldcqM=;
	b=Yqwc26Ayjgstgsn2JYBnzfT4glz7AjZNGRhawLEKIWftIzYWv6Y6ntcQr3GrbmSfDb7JjN
	EBF9EZ2yo6rLD/Bg==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/gettimeofday: Assert that the clockid fits
 into the u32 bitmask
Cc: Thomas Gleixner <tglx@kernel.org>, Zhan Xusheng <zhanxusheng@xiaomi.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016153212.2733798-1-zhanxusheng1024@gmail.com>
References: <20261016153212.2733798-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179423791538.2093942.12115550429606898902.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     40b7421a2e85e8d2a4cd1f81939274b397aa4b1b
Gitweb:        https://git.kernel.org/tip/40b7421a2e85e8d2a4cd1f81939274b397a=
a4b1b
Author:        Zhan Xusheng <zhanxusheng@xiaomi.com>
AuthorDate:    Fri, 16 Oct 2026 23:32:12 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 16:23:37 +01:00

vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask

__cvdso_clock_gettime_common() and __cvdso_clock_getres_common() turn the
clockid into a bitmask:

	msk =3D 1U << clock;

The shift count stays in range because vdso_clockid_valid() rejects
anything above CLOCK_AUX_LAST, which is 23.  Nothing records that, so
raising MAX_AUX_CLOCKS past 16 would take CLOCK_AUX_LAST to 32 and make
the shift undefined.

Assert it in vdso_clockid_valid(), which is where the bound comes from
and covers both conversion sites.

8 * sizeof(u32) rather than BITS_PER_TYPE(): the latter lives in
linux/bits.h, which lib/vdso/gettimeofday.c only reaches on
architectures whose asm/vdso/gettimeofday.h happens to pull it in.

MAX_AUX_CLOCKS=3D16 still builds, 17 trips the assert.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261016153212.2733798-1-zhanxusheng1024@gmail=
.com
---
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index a324b2f..67c9bcd 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -99,6 +99,12 @@ static __always_inline const struct vdso_time_data *__arch=
_get_vdso_u_time_data(
=20
 static __always_inline bool vdso_clockid_valid(clockid_t clock)
 {
+	/*
+	 * The callers turn an accepted clockid into a bitmask with
+	 * 1U << clock, so the largest one has to fit into that u32.
+	 */
+	BUILD_BUG_ON(CLOCK_AUX_LAST >=3D 8 * sizeof(u32));
+
 	/* Check for negative values or invalid clocks */
 	return likely((u32) clock <=3D CLOCK_AUX_LAST);
 }
