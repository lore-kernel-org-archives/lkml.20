Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473674;
	b=f3ie/6diLU151/tiSRGbePKFcGXqyz8QHBeKzdti27iFNQbRXGVabfWN7jOu31mfUAUi
	 n5r69sc0tKRd8TgHUQLqHywp1s1HgwjNQVj0+LMzltksdV95hEXiuy+YOC2zss7IEd42o
	 nvxwD60qIGaPQyDyNjxOUwI+7r4eX2UEJe8aX+s6iwvd4nExZJvBpcQB/l2In4187cXsc
	 s9nCZ+j5hqDhgk8NhJ6q6ioOO4Kvcc72Avft2JYMqo/+42u9iCpinziybcUBOdGgEbCaK
	 vLtjgaz2/kQeXdeSpoyYmqFKPbBj9KiajmIE3epW9DPeKzEgl8quKnrVYjyZvAzfNvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473674;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=BNXanafRm0ZUp2R427jVGWZDKvZgJXmbIt7xpKa0TKg=;
	b=eorvWHW0ZEVodqE14a+9jIBhtp9CcYif/crnGETTdgAN94Ll8ccCuUKLnNL7vN+CpbQh
	 UhcKMWvHt7ihSElydd2f8yqepr7b+CQweDpS0abmrHoGhV0tvg6KJGAIpva/BoiJhCMbM
	 J3f9PcVKskEkF40KP/HS00lbf4ep+g8g07zqmmpAI31RnsgE63kaMMEH/nmUUIU3CHWA/
	 wK52tU13z+XkFMS51nlmLBXZBA+A4sVvHgzS1a+ylBXbLANsdwd5PghNAfYQBuHK/7WkF
	 MpHQ2eZPq2rij/UtlFc5jjFa90ntYktzeYvJ8gi9r6fjVlkpPwXPgpznsHWWoNvuysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ynx96CBv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EHpratHX;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B2606A321;
	Thu, 12 Nov 2026 08:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301B2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ynx96CBv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EHpratHX
Date: Thu, 12 Nov 2026 08:54:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794473672;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNXanafRm0ZUp2R427jVGWZDKvZgJXmbIt7xpKa0TKg=;
	b=ynx96CBv0AjUrPlv/gj+baJnu4orOFw9Kl9S3uIha6Cniz+Pdn/BqEi/NVH3HKPawOUlvZ
	qPL0Aukdj8h/WTDMnwe65+32e4mU0nzDBGYR07o0EU93QVsFXaN/lsoanrig49zrhV37y4
	RVfu/a5Q+wnnX6apdyQhC+3GsWfbjG79fKnmukAFqrnhefL8IaKVnfSR+j/Q2B57aZD21I
	ex5e9/0lzvLiHVcUnMYTykzY0pGeif0MrP0+ZdJLTGBBgmflUdNkesx0Qy3fPDwKHX4ixf
	a2v8SVrRjwMAPDvTgP+2sRwdYvse+oUdwvO+U5soc2uYjHYtV87YZlVXZhtyZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794473672;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNXanafRm0ZUp2R427jVGWZDKvZgJXmbIt7xpKa0TKg=;
	b=EHpratHX83R5b1QPzqFoNzJYU18FFGL7+/01n4pfvtDZkVwdVVZt1obyI86b95yfHTGBTV
	HFWe5nfVOJ6qCuAQ==
From: "tip-bot2 for Rik van Riel" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/mm] MAINTAINERS: Add myself as X86 MM reviewer
Cc: Rik van Riel <riel@surriel.com>, Ingo Molnar <mingo@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110205444.39dc9c43@fangorn>
References: <20261110205444.39dc9c43@fangorn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179447366982.2093942.1334670904291982610.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/mm branch of tip:

Commit-ID:     65477e925b016cd35a9ef0dd4f40a262fd1c64cd
Gitweb:        https://git.kernel.org/tip/65477e925b016cd35a9ef0dd4f40a262fd1=
c64cd
Author:        Rik van Riel <riel@surriel.com>
AuthorDate:    Tue, 10 Nov 2026 20:54:44 -05:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Thu, 12 Nov 2026 09:47:37 +01:00

MAINTAINERS: Add myself as X86 MM reviewer

arch/x86/mm is an area where the maintainers are spread
pretty thin, which I care about, and know something
about after various TLB flushing adventures.

I should probably help review things there.

Signed-off-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Link: https://patch.msgid.link/20261110205444.39dc9c43@fangorn
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc..ef9d082 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30413,6 +30413,7 @@ X86 MM
 M:	Dave Hansen <dave.hansen@linux.intel.com>
 M:	Andy Lutomirski <luto@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
+R:	Rik van Riel <riel@surriel.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
