Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254020;
	b=y75KhT9QH+YWucBAP/ScerdtL11M7tNFtXLbkRyY1UR1GbqRmH9EldwQWaJipl3O170P
	 mnTGeLLApPGyLn2aR5wTD7HtatLwmATH/nDpgRSn7iwf8LrYQCHxuSc7AGYgEhRoB1zPq
	 C4/LLhpGWh8uCSAt7DeSIDQ9H2E9YxD5+7OaRKPZJG5+oUP9dhYC/sHvqnucxEDpf862A
	 G+oO3uIfJ7IQUalBj2HOU923PpjFcvgK/NlV5I7d8tFQHoujSRdGONC30JHsYajp2HAAj
	 +cynqJhPA5+Y6dZUEoC/jFgj7NbxkjgHL6loZUprVbxlkNSxpR+2xInRf6MvyU2ndVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254020;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=DDfAr+D9HAbp95x2CAO3SR0ObyRGBOIWhlwafbN89lc=;
	b=Hu8BXYxfrQUbVE0xyeVhT7P3HRpS91DtB8EMxoKVVqvtP1eIvQaiurvzRh8jjz3xIKLW
	 oqFlI16F54lZAQWZjc5BSJxFzcCYbQ0/yIAiYE6NNNV7Y04BEVIold64y27lyu3tSeFTO
	 il2LaZTJvV7hSRuqbX6uEBl7jRa0B2vwV6/t2xVHXpCNrWK3hEMAfSIeH/78oZInPPjDa
	 lWCFYKIgareZgyo1+fejVetn2GiGgCeYdchVtDh+taNQbkCe69q3bs5VOGguEJQyDFdXh
	 lxv3qBWCg59cBRrJG3vERcqTwmpXsnJgv+RnD0APn0V5kKGSMufnbGv3ltjA37uIZKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lH3TxxwQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VjUd+5Vf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8899260A2613;
	Mon,  9 Nov 2026 19:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8899260A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lH3TxxwQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VjUd+5Vf
Date: Mon, 09 Nov 2026 19:53:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254018;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDfAr+D9HAbp95x2CAO3SR0ObyRGBOIWhlwafbN89lc=;
	b=lH3TxxwQDApVs++bxy0P1qtdAEi/dkDJZeR3rdrsit9OVV30Ai7si3xHdLep/hb5pYQtvA
	HjWTxuqme1zdpIbTEfi3rKCxTJFu1Ut3mwlHckJjtrOgLaZ80tKsZU6N0fAL7iJbjumDVG
	0n+fMBc7nRYu2REjbrt49xY2Ovg+QPHt6no58PT3Lpx/aTOq0chUsF4lbf3H+Fuc9hqv2V
	BuuBcqN0sVqNeW0FLQbvLJZg2XilJDPlPWLCq+jaSWcDlxJuW7pGEXL4kUYGObxsk263+Q
	0lv6oqlhv/t4ohREw3JTtw/MibfkltKm6pRp56FE4FZRWXkvGdlmj1/ANXkLZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254018;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDfAr+D9HAbp95x2CAO3SR0ObyRGBOIWhlwafbN89lc=;
	b=VjUd+5VfhKKSkTej6a58wdEp4pa3sNUvDbGd3tCCAE9LFbfv86uoH+FjzSVf73zxh06EHy
	cTpEOFbaHLHttMBw==
From: "tip-bot2 for Miroslav Lichvar" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] timekeeping: Initialize TAI offset to 37 seconds
Cc: Miroslav Lichvar <mlichvar@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105135316.2465369-1-mlichvar@redhat.com>
References: <20261105135316.2465369-1-mlichvar@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425401614.2093942.10070685003145903157.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     a2fbc5e623e6ad1372804403863ebf94956b2748
Gitweb:        https://git.kernel.org/tip/a2fbc5e623e6ad1372804403863ebf94956=
b2748
Author:        Miroslav Lichvar <mlichvar@redhat.com>
AuthorDate:    Thu, 05 Nov 2026 14:53:15 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:21:47 +01:00

timekeeping: Initialize TAI offset to 37 seconds

With Resolution 5 of the 28th CGPM (continuous UTC becoming effective on
20 May 2027) [1] and no leap second announced for the last possible
date at the end of the year 2026 [2], no more leap seconds or other
leaps in UTC are expected for at least a few hundred years. The TAI-UTC
offset can be assumed now to be constant (37 seconds).

Set the offset in the timekeeping initialization to the expected value
to not require it to be set in user space via ADJ_TAI. It can still be
changed, and leap seconds can still be set, but nothing should be
expected to do that anymore. Existing applications are expected to
either set the offset to the same value, or not touch it at all if they
see it is not zero.

[1] https://www.bipm.org/en/cgpm-2026/resolution-5
[2] https://datacenter.iers.org/data/16/bulletinc-072.txt

Signed-off-by: Miroslav Lichvar <mlichvar@redhat.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: David Woodhouse <dwmw@amazon.co.uk>
Link: https://patch.msgid.link/20261105135316.2465369-1-mlichvar@redhat.com
---
 kernel/time/timekeeping.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index be72cfd..3668bd2 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -34,6 +34,8 @@
=20
 #define TK_UPDATE_ALL		(TK_CLEAR_NTP | TK_CLOCK_WAS_SET)
=20
+#define TK_INITIAL_TAI_OFFSET	37
+
 enum timekeeping_adv_mode {
 	/* Update timekeeper when a tick has passed */
 	TK_ADV_TICK,
@@ -2095,6 +2097,8 @@ void __init timekeeping_init(void)
=20
 	tk_set_wall_to_mono(tks, wall_to_mono);
=20
+	__timekeeping_set_tai_offset(tks, TK_INITIAL_TAI_OFFSET);
+
 	/*
 	 * Use TK_UPDATE_ALL so the NTP layer picks up the clocksource's
 	 * cs_tick_adj via ntp_clear(). Clearing NTP here is otherwise
