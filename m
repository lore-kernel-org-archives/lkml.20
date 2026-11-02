Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602914;
	b=vDt/KbwAOAQVyd3fFP6aI1+g8EwVehH4CIgtlcbNjT5RRE6br639a6DqTwtUWDjkw/my
	 tOExUTHnOa1kdvNa4cWkwqWgLUbcZrxFaB4BmZJ0vsb7OAbVV55uHWqfVgD9gW9K427h0
	 OlVlz9/QtiZvjxyB7sInb0zFtIE6NIGlrdKMnD7trxiyqLahLV6OEIVTJN8j97Dye/ZK6
	 i2ZMzs0P1eOfwnHmCoZ5H8hfHa7jIFf7GV7Iu5MeYMRz0quyyqUo0U6fs59YhUt1Fdhin
	 rl/5ui0q4B32tDXsOapgkg/y8NSo1Ms1QesC+vCj85hoppH/fkhqxNQ4OKpj8KiTbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TFrwAf3wYXNxoR0JQCwLQKVfKkU5+LXdIBOmYaVR4HE=;
	b=ZHgHbOo7FFPwV1iEXA6M2Ts6YwZ5Vftjo8asFf0KzqaHZyM8MZavT6XZnDKZ6ZElfd0P
	 VyoHcdktvlxW4CVrbsn8E9ZcAIIdS92O6tmVZP5lOrrHXz+wVsm+yU4hkTsLDuRyZGAmd
	 Pnj8VrD8RVmR+6joWV5m098DyGPDpWMTBR+woXzZvFhIIUiBYE2vDrPK7ToixVhn1Xkcs
	 vo1Vd98Dvs4/MaZnbB+VBJwTWgQLa3KdzEd4TlyMkTRxnqo40Z0XbScpUBnLkNcLxuoBJ
	 VUliwrHD0wcjCC8GlwxXEdhMcd1a6Kvv5bmE7p8HCshjbJ/obKot9l4WTANrxcjnFFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bC86Q7o5;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A9B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A9B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bC86Q7o5
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso3338830a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602912; x=1794207712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFrwAf3wYXNxoR0JQCwLQKVfKkU5+LXdIBOmYaVR4HE=;
        b=bC86Q7o5SJjrFjl8XuDTaDkDOxt9pHLZYSwPjfWXOWFp9L6MTaxZgUyjfkfK7wiRxs
         ssjHgqGpjyYjKaksgKP73NeDWTXb0cSWY9kfvEnhoMRc5LITndmaCgND6EudybXoaCAp
         VI/qx12hWpiQ3+Eb6bCRWy5bswqh9zLldI50XQGCpm/cz0O5NWq6vYksf/OjdEJBEXCY
         NdNncdhBrc3iOOlfS8pXZ/34bO1h7SLcy9uHObOOFImhcqZIzLxIannjvjzjV28pw9xS
         SXM7BBzDjIz19zAWi02tyLR5Ilfo2+WOEcEHIK3LYf66a2/OJsydF9hrBhKL+4PFdnVl
         iGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602912; x=1794207712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFrwAf3wYXNxoR0JQCwLQKVfKkU5+LXdIBOmYaVR4HE=;
        b=BpmbiB/THGog5MchqgKJy28m2lizM/Yt3858L8d9BsYXHiLlfmBdIIGE+7prWDAvNa
         R7Ff1XgkEEGMYtV34pxT4QyUGqBxVL5oYO60WvOfZYKaSMfxnVaCympZ4hIhl92xj+tz
         i1L9zRQ4gs0J+mOXB/TMAY1edaUYWHpBKu/kZRBs3SOrmuHpoY9vCtHi0k6SQOpMMjyn
         h+a5ulM/ibK3PnU0Vdx7KDp1xy/T01gEPBW7eqlBxdT8Pm/hCsejuceTAy9z3BMxhf26
         w28ju6iNZMcdUFTRGwiQsnJzsIjjS1IGJSpPT99xD8y2RivZPOFUfLRWEHxp9F2H0GAW
         XBXw==
X-Forwarded-Encrypted: i=1; AKwUvByZd1qN+E8igNhu3LaHzDBS2TaknHGxupuc8xL9BXErihgxj49IHytS3vgzCuerIh8o7zkBkn6gv+xzOIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ww9OmlQi8uRomGZGUQkf+Cy3D6Wx6z8wF7ryGap/xM3veYcvD
	RuTh9TGqLeL5mTVD6DOt77KaonMiUKMVcWLTrvSywlsomncHm+FjJcxW
X-Gm-Gg: AYBFou3MaKWNYqWJ1yB6wUvdH2nDRyZgqMxjgTTOEMRZbchc/FGCgMHwLJ0kYgT7G3V
	wsvLxXK+hTSuqWpQJY8jmvddnBs4HsdJb0bdQIb3s0fVPlbQgqlJr0aIGakxQ+ZSQvi+Y776Acr
	TXB8L3e05tVR5A0x2CeUSkyWe8pgF4z2bGrMQXdTiOXfjceCqFuc/h93Lk7m1ZVShXzYsJ7Ol5+
	bGsVE1eEiWJxqvqUeLj8glfTnFe05kzlEmwc7GsJ1oj4lhXiDu4yyb7ih1o+9tdRQDAOvPsH2l2
	ehKBWTLDNjchOAG3UeVbzSvM+tzgtEw13qmO9YDka0Jv61SzbJwzDTLhX4OCBpTXjB4jzu277JP
	8FhNQJ64grPQNCUuChQoFBbiDRrnUe2IjAswb2/tDRJrIYbIatvJEsrc3p289LdWyofkpU5JTJ8
	tmaIIEAOP/XmxQUAREpyVro/VYb85cQCmRXId1Lg7WcKVLFxf+9T/T5hh8jSpdM+HNXpY0bHgFE
	HWl/dmdVy6xZ5YHHpvrGbS0x9UTK5Rfu/uAHuusrOEm9EMtksheEAFu3J7NQYwXc8UEYF4dqlXg
	pOVpZuKa6Tu8YM0XdHz8CrUQRudo0JkMeSg=
X-Received: by 2002:a05:6402:c4ca:20b0:6b4:1cf5:2202 with SMTP id 4fb4d7f45d1cf-6b4d438a5bfmr4526477a12.12.1793602912404;
        Sun, 01 Nov 2026 23:01:52 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:f970:5a5f:bc55:da4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm17580579f8f.41.2026.11.01.23.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:01:52 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] timers/itimer: Preserve nonzero remaining time for active timers
Date: Mon,  2 Nov 2026 09:01:49 +0200
Message-ID: <20261102070148.1064849-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

itimer_get_remtime() preserves positive remainders below one
microsecond, but struct timeval only stores whole microseconds.
So, for example, the conversion to tv_usec truncates a 500 ns
remainder to zero, causing getitimer(ITIMER_REAL) to report an
active timer as disarmed.

Clamp active remainders below one microsecond to one microsecond
so they remain nonzero after conversion.

Fixes: 2ff678b8da64 ("[PATCH] hrtimer: switch itimers to hrtimer")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/itimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
index 03a32dffc56c..a472a4f8babb 100644
--- a/kernel/time/itimer.c
+++ b/kernel/time/itimer.c
@@ -36,7 +36,7 @@ static struct timespec64 itimer_get_remtime(struct hrtimer *timer)
 	 * then we return 0 - which is correct.
 	 */
 	if (hrtimer_active(timer)) {
-		if (rem <= 0)
+		if (rem < NSEC_PER_USEC)
 			rem = NSEC_PER_USEC;
 	} else
 		rem = 0;

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

