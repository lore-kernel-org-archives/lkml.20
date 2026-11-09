Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254015;
	b=TvgS9CuzNDy2CT5h0rCJ+pf0ea/6h3vNLfZiP0kfzjHruHGeVvp9t+5zxm8iqcp795Rb
	 4yvQP3aLO8BJI38WjCTC/0Z8MC4htdKMY4W/PRtnjAvjDwHS/OD+Omxi8F0SqqmAHYt7s
	 vtYieBNjjD8IjSvPP2NtXWsua4+rKlDTYIm+7duU39aA9/hdFRKiMfZIpnn1Kx+QDdS0V
	 shKYUYmifMoRfrU1pvhsCAetxfS1xT4zxBHHzc88LkVkTzlBxIQB6ra5Zhq9DqGGmmgzb
	 tsA501wKzHgQCgRM8dqHHYbMlAjs2Hb0CvTqiw0xh3tKnt7zmSFXozz0kjTEPO+JVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254015;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=DJk0BW5yVZTHNC5aDmvO7sr/Ah/Ub+gSGcpierrh47U=;
	b=mfGeWR7MXTRa+fMnBbwiM0+EyXKSd/DnM3X6US9ZBtn4yLZ+yg4bsyrl5sl30aB0Gi0r
	 7oaf37fnhI+6zw4IJxrwNKkFrIemtrVOF0HR958jTBpuD3rfrzdIJsitx0a+TIyd7ibOP
	 uENj5O2TAL+WhfCNiQYxRvuYOFNa73MOyG9vjZuUWuL1BYvFGddphG2s0sdxD4qOHEdRe
	 w16s6Uik0LNAURbub0O6mK5i5ecFesjF+LAxHcNjzmt6wMPwfWt7pSiZh/67mGyn80s++
	 IQMrD14wwZZktHv1Q4fJY3N+5KJAcMwJnuCBjLkhMNC3+bjmuukoYGCfiaGDrkj2ntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vpmxkxSO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eC7yVBYm;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40C60A2639;
	Mon,  9 Nov 2026 19:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C40C60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vpmxkxSO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eC7yVBYm
Date: Mon, 09 Nov 2026 19:53:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254013;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJk0BW5yVZTHNC5aDmvO7sr/Ah/Ub+gSGcpierrh47U=;
	b=vpmxkxSO07eliwi9lGPh2s7HetWBoZLpweGc8ndBgYYAWWQsl6x97qR6unSBJatfSFwveJ
	cpg/U+W9O+JMKl6okvKEbRSHmCuaYStgyhpEqeE3E8re4JFoc3PepbQ71Fa81KOBwz3pU8
	RiaP1guE1QCUEWBEf2tYLFd2+ebVQ72ebZM2I8cdsaaUO7s2X8G7Plbuu6TQ0QfbfKIpOo
	n2FuiHzrVI+N24s70wYOJuc3Vi2fjNzoJNqEF9yJ0JTtybAS6efLofGf0auXse7rYJt8Ot
	9DUZJveaa+vG7DDIT6now6YwzUs7tLi5+ZLmRuE7Su/F71YtNuOuSa4E6E8tfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254013;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJk0BW5yVZTHNC5aDmvO7sr/Ah/Ub+gSGcpierrh47U=;
	b=eC7yVBYmHfOy/5Gf2z7c1HJ0hxqshvM4ZjYmT5utTm0650rO7wcDo5oOa+YK2THxwoCjIj
	ZylgZWswzqwD0LBQ==
From: "tip-bot2 for Sasha Levin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] selftests: timers: raw_skew: Initialize mon
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103232307.1924618-2-sashal@kernel.org>
References: <20261103232307.1924618-2-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425401154.2093942.3336795034421438169.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     c280328a7b02d751b9686156d80de4d2eea0b0a1
Gitweb:        https://git.kernel.org/tip/c280328a7b02d751b9686156d80de4d2eea=
0b0a1
Author:        Sasha Levin <sashal@kernel.org>
AuthorDate:    Tue, 03 Nov 2026 18:23:06 -05:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:21:47 +01:00

selftests: timers: raw_skew: Initialize mon

gcc 16 doesn't see that get_monotonic_and_raw() always sets *mon, as
the first iteration of its loop takes the diff =3D=3D 0 branch, and warns
once the function is inlined into main():

  raw_skew.c:46:26: warning: '*(__time_t *)((char *)&mon + offsetof(struct ti=
mespec, tv_sec))' may be used uninitialized [-Wmaybe-uninitialized]

Initialize mon to quiet it.

Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261103232307.1924618-2-sashal@kernel.org
---
 tools/testing/selftests/timers/raw_skew.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selfte=
sts/timers/raw_skew.c
index a61f6a0..5f43b03 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -91,7 +91,7 @@ void get_monotonic_and_raw(struct timespec *mon, struct tim=
espec *raw)
=20
 int main(int argc, char **argv)
 {
-	struct timespec mon, raw, start, end;
+	struct timespec mon =3D {}, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
 	long tick_nom;
 	struct timex tx1, tx2;
