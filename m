Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C247209E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254008; cv=none; b=ePWPAOpy+EVd8uX4Lj6osc/lcXuoty+gl8paObgneHW5mtGd6S27naAr3fn6HywiBmQYBw+jONvHZNeg5qJX/duaro/HnUy9KnAkwJiOfQGJEOs7Q6kMwXfqNB/fVpan7ugwxIhDR2LMD2vn9m8xHIBVfVVcqrjkZIZMPlKt69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254008; c=relaxed/simple;
	bh=raBrAw35EWTAP5CEc84+fn4ROJEN1MDvqDJz9+PbPD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOm/nnrru6zePX8J7GsG55ngQxRHSBA5Cn6IziX+q4QKo/uJ3/WYeaZ8D8A0KoyISVbi2dZqCwJOOM+fNCH7kcfIRj0KjG/FzfaJlMC0weG16h8t7YUZeDmyO3AHkIb4REIjcFPG5Ucn9T1bHyU2XkBwX0/PYFgXyuzG5KbwctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUHuEjhM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUHuEjhM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441fa5c37so526434f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254004; x=1788858804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9b1jPB4bA53YCp9BQLCagLlbltcciaSkWcFVBMe8IVA=;
        b=mUHuEjhM5/rpgOGcZPvXMGAV0CIr4jLyfAIA53S0QUQM6qBoWAXrFmMStIGO5VEPlB
         TllQE9Qmd0/h31EXNvW4T8f8C2h9AiXxWbDOTYAtfH/AjUyl++WBeaMXtCTX74Hbdyd3
         WZxCw5uIcYrIc6m2+T4I0IEkaDjIfBO0mwfKBaKcimpKs1qoqxOyCGDfPeuDUXzYzTC9
         8G3Bk2lj2XF2ttvtEnzdDf0NrdkFgRA8UYrywb8lKLj3inp/5Nn3Y2BTeKLFWCel0TwW
         r8FU1EL/adnT1+ljssuzeKCUILFQToHd62Q1jI4epy6T/MMc5qNbXFb5R+z1u5xgeiln
         FiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254004; x=1788858804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b1jPB4bA53YCp9BQLCagLlbltcciaSkWcFVBMe8IVA=;
        b=dHBZ8zyo5IeDg6b9cFcJxyFZtGBkEdZfSPjeRsW+hrpJuWWIz0JX9X9lnGCyUfD7Pp
         txT/ryJwrjIuNAc/7HacMDAxiT4wS7ny1b+Bm7nziCn4F2hsWm9W7jc+r40QYtrLe4b2
         8w8ICvbCzSjbTl4w2/3Jnt0251oNJwQctuQze9RUahFRi4fMhsbtxWwR3EpzxUTPZqj5
         kGuARdiu/uUp8qaYurd1gVGgjE35uzPRGtW+szaBc+zVKbeDnJKdebn6iJSqYTY2VJ1e
         eDaBadS+DjtlT2iaLuQaEwje7dMf17+lW8o6kxfryhv90gCmHrsJPwb2CD3I6EQdfNZ/
         Hruw==
X-Forwarded-Encrypted: i=1; AKwUvBycNwWwrfSG1FOAULuP9Wk9DV9sNrNiqrXvxrdUc37KmU2HSqPa8QvY5PG9WL9z7E7UQHpHqTa2oW9p8oY=@vger.kernel.org
X-Gm-Message-State: AFuF++mMaePrpx9FnD/HF0ObBW11d1/+YZyWyJLU1uCGjt4ul70nvHU3
	4dwqO9EIOCPZcpTiJ1YFgOSxPzVcuUMA08rne8iU2MCT998lKjjroN7j
X-Gm-Gg: AYBFou100+hPCHkakzQU/Ohn3p/nDDLUi8DbuBmyWztElqN7IYG6NktgoBV5DvY8JuC
	pI4R9O46rEjEQJGxwxnh/4HRja7DvvcOEBZKMzDU54c9EWTc0DPrRHqQHav5jdoIfgWZkM6T0Xr
	zRUcPMRVuALPjaE+0Tf/hZQNoy2G/C2ZjiVy28eLtdAoboA1W1cEQQ4TaQzKkjHxfKZLy1eOwRU
	CQg9/JOjXsAIMk+VR9pp0vS+FW0sg/e9nmMRcbxQS2HAKblgYJUpgw4kEKlXPE2apIa3Y7DfLr6
	QuQ88aWFAg8wdNtU+EbndCbawTsvTrZJyzvLNq4ABh7nAX7rHCQf6MABD/k/Jg5+B1/XzG6fMDp
	0yZxRHJDpgE2n+bQhzT+Xbo8gk38gJ1E6KcEtX4254qYWucttPFQbEhvjB+RXc/usNvYJnYdpDZ
	KAeBeUP6nbzbGTQbqkrpsjNt1zsgO0YmDpEQFklrMf3Wm3XCQpqH1ZpaBdL0JBy/TUtomCh7HmI
	uq9RUktyhjrkL8aWaJ7UqeE7PRWxRiXcUfti0TY93WbL0CktBXLmaS6A5DUHgRQL1SnyGLH7DXB
	9XqpiDMpHerCeDg0nMGSvBc17tX8Z7UKb39SY5yPOJYSGngxFdF7kSHxsWUTZYyNgrPy
X-Received: by 2002:a05:6000:470b:b0:474:530:9d with SMTP id ffacd0b85a97d-482f79b0048mr53664370f8f.13.1788254003967;
        Tue, 01 Sep 2026 02:13:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d781bcsm3378291f8f.26.2026.09.01.02.13.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 02:13:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1.y 0/2] ALSA: aloop: fix trigger/close UAFs
Date: Tue,  1 Sep 2026 11:13:00 +0200
Message-Id: <20260901091302.66860-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2026050445-connector-rebuff-f713@gregkh>
References: <2026050445-connector-rebuff-f713@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport the two ordered aloop fixes for the trigger/close peer-runtime
races. Both carry Cc: stable and each fixes a separate syzbot-reported
UAF, but neither reached this tree.

826af7fa62e3 ("ALSA: aloop: Fix racy access at PCM trigger") covers the
peer lookup and state checks with cable->lock. e5c33cdc6f40 ("ALSA:
aloop: Fix peer runtime UAF during format-change stop") pins an in-flight
peer stop across snd_pcm_stop(), which still runs after that lock is
dropped, so it applies only on top of the first.

The failed-apply report for this branch named only the second fix.

The series applies to v6.1.186 and v6.1.187-rc1. Patch 1 omits
access-mode support absent from this tree; patch 2 matches the 6.12.y
backport by patch-id. The identical 6.6.y backport is submitted
separately. 6.12.y and newer already contain both fixes.

KASAN/QEMU functional A/B tests passed: 4096 captured frames matched
byte-for-byte; control notifications, mismatch handling, and 32
open/close iterations passed; no KASAN, Oops, or WARNING was reported.
As upstream, a prepared-but-idle capture remains PREPARED when
mismatched playback starts instead of being forced to DRAINING.

Cássio Gabriel (1):
  ALSA: aloop: Fix peer runtime UAF during format-change stop

Takashi Iwai (1):
  ALSA: aloop: Fix racy access at PCM trigger

 sound/drivers/aloop.c | 98 +++++++++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 36 deletions(-)

-- 
2.53.0
