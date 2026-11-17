Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919708;
	b=uCkQl7gCGYT8gpdyZK8hyCZEsAClfJbIzDqTQvWnHVHOJqzV+MkEH3nEQwrLmqLt86db
	 pd+tdrYpRRalSEuLfheawJZB4+TU9W6SB3Ecv7Fpb9I9wEd+TadxnKA3YYguMJH1lxUfM
	 VqoXXO4prk/QS8X7SdS8/ZdV/LQapdeI/oyy6akM1XQRBzVkIX0wwUgtRwKvyU95uypPT
	 3k4GpU3hAmoQ2MuOHMmdOCxQxivvX8LFCZ6ZllwsZr6TDvfLuiD2xiMpZN18H4CY07Gft
	 kgn1byVbuXhyG6XFyyA+HTHSZa7tY03SackOUYiLpwVjRXA9NBtn/AW883nyJfCjatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919708;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tu3myA99X5EY88QQep0RWVi8oQyHKupWfuRxA/X3tDg=;
	b=dNwcEZs2roYUt4VuHa9Vvk7TknFuVv1gZjLSZ503pExj/V3JILqV7ctcqvZbKhY5S3tZ
	 IDiyaS+/+QyoKkhtBa4Li1sTZ6wtdTAvY2zbhd7fQdCZ0gGvtK7RL5VWtuEMQ+FSaH/x8
	 WJHr1jWtYqAeGBzxB66opokszo3nK5M2szM+rt2UkiyDzdM0lMOu6IL74AL48ZjkLXEJ8
	 2KnqMn3dNkMz6T6Ut5Y7fBzPiTOiqvI2xinAJjUPIKpYb81ssAJVdWophX4SKepIZGY6Z
	 ElfayoYshrZLlvigLzY5vY7E8ZrA4I3gE7qByVja0JhyPN4ftBa6uanEQ2cEbd4xLCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=H39zdS8o;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5878606A329;
	Tue, 17 Nov 2026 12:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5878606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=H39zdS8o
Received: from p-745-g5.pavel.bz (unknown [130.94.27.201])
	by mail.pavel.bz (Postfix) with ESMTPSA id 7AC4A616B5;
	Tue, 17 Nov 2026 12:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 7AC4A616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794919705; bh=Tu3myA99X5EY88QQep0RWVi8oQyHKupWfuRxA/X3tDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H39zdS8ok7x3nJ/ngLdGxZdWN9leIzlnakzBgW1wv8ULun2SPllctMNg/3eXPohYN
	 sK+QdNI4hoj5ZAOwM4OQEr9sjx/+BsSsb1H724LWUo9WwhFk9dlaNNtG+jm+AjwGRv
	 9KlKq7FB2hOtTnj7x/5hhtfdOZjHl2ifyV97W+tlaUomWeGe5VqnZcdRL6vJg8shB8
	 0MAOa8G1wsAlN539Ax15F0aiuy93GL46TYEkJZUG9rfoivqPJsEuGGtSSJXxfLqYwv
	 G0NJiKw0U0/glNXWdFNiPMoq8dv5gyXL0bUfKwJ8wTthjYPqB52n/RfF51eCRNUaDl
	 7RQHH9uvVa5pQ==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>,
	sashiko-bot@kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag
Date: Tue, 17 Nov 2026 19:48:17 +0700
Message-ID: <20261117124817.13534-1-a@pavel.bz>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <sashiko-outbox-218562@kernel.org>
References: <20261117092532.408981-1-a@pavel.bz> <20261117092532.408981-3-a@pavel.bz> <sashiko-outbox-218562@kernel.org>
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

Thank you for another sharp pass - all seven findings are addressed
in a v4 just sent.  Mapping, with one correction:

> stale master and mute writes in snd_usb_mixer_resume()

Confirmed.  restore_mixer_value() now returns early for the deferred
controls, exactly as you suggested; a resume re-pushes them through
the flush mechanism instead, which also re-asserts cached mute
switches - nothing is playing yet at that point, so the chop-on-mute-
write property of these devices is respected.

> unlocked restore_mixer_value() clobbers deferred puts

Confirmed; with restore no longer writing these controls, every
remaining writer holds the mixer lock.  (The same unlocked-walk race
exists for direct puts on stock kernels; v4 leaves that untouched.)

> mutex_trylock() in snd_usb_mixer_resume() drops re-push

Confirmed, including the sharpest case: a flush whose first write
triggers the resume runs the callback on the worker thread that
holds the lock, so trylock fails and the latched-then-cleared
flush_full drops the request.  Re-push requests are now lock-free
atomic bits and the worker re-checks them after every run, so a
request is never lost; no PM callback touches the mixer lock at all
now (a blocking one would self-deadlock in exactly that scenario).

> sticky master_explicit breaks volume after alsactl restore

Confirmed - a boot-time alsactl restore would pin the master
forever.  Ownership is now with the last writer: an explicit master
put stops derivation for the unit until user space writes one of its
channels again.

> flush_work races with system suspend and drops mute state

Both halves confirmed.  Suspend now marks the mixer and a running
flush stops before its next unit instead of issuing transfers into
an ongoing port suspend; a write that fails keeps its value pending
(previously the pending bit was cleared before the write, and the
full re-push only re-asserted volumes, so a failed mute write was
lost for good) and the resume re-push retries it.

> race re-arming flush_work in snd_usb_mixer_disconnect()

Confirmed for the put path and stream-opened (whose check sat
outside the lock); disconnect now marks the mixer under the lock
before the synchronizing cancel and every arming site holds the lock
and re-checks.  One correction: the resume-path arm is not a
use-after-free window - usb_unbind_interface() autoresumes the
device before calling the driver's disconnect, so the resume
callback always completes before disconnect starts.  It stays
lock-free by design, for the deadlock noted above.

> overly broad cache invalidation suppression on notify

Confirmed; the suppression is now scoped to the deferred volume/mute
controls at both sites.

-- 
Pavel
