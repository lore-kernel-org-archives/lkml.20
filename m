Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B2A2DC791
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791757860; cv=none; b=KJPzJGPU9nTGC/dGmSZv7fG9a0iCrOllauGRQzGj0LUODG0nLWUZG+cTxPQw0bWeE/XyTYk5qmpmbLgVNrMaXD5UW4I9Va1HB2jvWMNxb8T70fZGITD7cBC05FOpE2QBJeX3+YLFEA0d8SnJI70adNaZ+n5FnMk/PQmgJKLnRUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791757860; c=relaxed/simple;
	bh=RUhZ687WiXbhHP2A7uEREv91fU3FDbersCArglngaxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ou7zz9AUTod/UISfYB/QReIQvvtZmy86vrLkE9dLBndGK/inqdHGIweQQZg+M6MQWpMg3BWs7z3rpj8f6JZAMABbK6Fcq1k02DlfLqaQxHRVQ3/cMzSAKyuRpT/wT/PEJjKdsoBfD1uPuc5l323hZYkH71K43gvMZoC840u2os8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=icjRwqbP; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="icjRwqbP"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5338c1197easo10568991cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791757857; x=1792362657; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUhZ687WiXbhHP2A7uEREv91fU3FDbersCArglngaxQ=;
        b=icjRwqbPlBojkQofC5EzCPZGf8XxvgLLPHDYu0na0R4+WiQEnSci8sH3DkIpNwjkE6
         fIDyR/aY1oeIpKyVdowLEWOC7bP0KC/5lh/uZ8BUs+HGS9qIriwmvf7GHQxh6WfAGzai
         4TZ3bLoykATY7OM/pU6FJkVFm7SoCHlbdL5bw4dqfWXRPuYeJUhWGH6xk2Ry0ETGFwjZ
         TCYEnEqAj+1pzkM+Myp8xEfZRTtOVYm7CacWLAsO+tk9NGxDV3gKTWl1NQ58fU5y6dtY
         EZ0bDZdAXUyiMd2qHv41E1faJ36kaIsuD4s8OY2GjLGEfjsE64soX57mI0bBXCTufxt9
         8wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757857; x=1792362657;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUhZ687WiXbhHP2A7uEREv91fU3FDbersCArglngaxQ=;
        b=UincwS9sV6a3Zf2G1QBx/Rxjf80ZHDxQShey2UD6PNGwCeFT/5zjyiTfbmmk8dM0wQ
         U385+TPUJ0/TFBmNZasuPqWeCL4uqUmLs+ckGJis32y2sBMxbLtoUcmxhcw4k10pWdES
         SG2u822YyqhVz36yeca06NmqYoZq7fRpu5FOVI9sB+DlPxmQH1Qlu10j/82I01wdEZJB
         kkxF49iU27HM4BA2n2yJ8U4ni5dE7LBe8m9uEHx8RMeTaeq3nxy6CVlxGI9CMLJNR2ax
         001/EnrCVpYCLgetzqWqOkJHe4eG5Ws7qyVpJuQ6IC/CRNj8GG8Zbbr6djYGoDgE3PUU
         bRWg==
X-Forwarded-Encrypted: i=1; AKwUvBxY6piwoHARvvyzsUzrS8wQLUGsZLQTlpg+nOOaj+l6bps3NkAXtwA2JEm5ay3S/Tncw9h1cHNQJsxcLIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzbaZpxk8Ao6DCT3Ay2ZvzqwK+qea533gbDaWMOaj0xQYSCTzr
	fnmIwd7RSk9eggoKzLdDT/V2rmokO3cBIREwVV7/OdqHpAn787o/GG3gPs6DM3A4Zzc=
X-Gm-Gg: AYBFou2mFao0qzmuBNcJ5PWjQ8f9vUj/7R/eGGikn732ij/J49qEYgh4jVEK+2ztgkU
	P40PzwKRQtOw/weqzv1QAhQM43Jb4Z8tpZ+LoHxY+i73JsCYxZfCkpUKi0AaQNH/qL+DdXIQa7V
	Jw6iZEirIb5AikrpH7ZHQ6EhT/HSY9RSVmoq4jdPorSULyymQZ10qR9WbZWnFIAuZkGk8wDzMQV
	4FvJGctLVtD8UTJMkN7sMj8sE06YJSp3djSDtUGBIEidj6TZ4aVLQi0uORek2HAsDh9fs9MHPlO
	/XG0/TSj/Dz14FAfu9yQc1TVOReNwdQaWFp6336ZPZbPsSLEQBHAkLPrY3vouTiDusJwC+lxuLj
	2CRp5UDIO5qa34CgdOk71WfhuSvL/fQRpNvdAfU+kQFZnZu/0cRa2taTOk5QEcxTsHDaI9FRj21
	9Dg7SH0pqloffebMswmLxGqmsXJQ2+5PEZmk4BpFQ1AzEZ72WU0ZZagX9Wv6djVYVXryrRF5r5D
	zdhezbjHqtVIi5UA/mk66cpZS1RjZRbDayUhtCTvkxSusOdHmJ5ihrQ1zAS
X-Received: by 2002:a05:622a:22c6:10b0:535:db6c:139e with SMTP id d75a77b69052e-535db6c1fb3mr1848091cf.64.1791757857443;
        Sun, 11 Oct 2026 15:30:57 -0700 (PDT)
Received: from boomzilla.local (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7324c9sm67778241cf.12.2026.10.11.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:30:56 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/2] Input: discard pre-registration events and test state seeding
Date: Sun, 11 Oct 2026 18:30:51 -0400
Message-ID:
 <179175785190.2.15570576039664484922.input-plain-reply@voidship.net>
In-Reply-To: <assT056aFmzMHmON@google.com>
References:
 <20261010180031.7-1-kabel@voidship.net> <assT056aFmzMHmON@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Resending in plain text; the mailing lists rejected my previous reply
because it contained HTML.

Hi Dmitry,

The observed problem is the initial switch event being delivered later and
undoing a subsequent Bluetooth soft-block. It does not depend on the event
timestamp.

hotkey_init() seeds SW_RFKILL_ALL=1 before registering the input device,
without calling input_sync(). That updates the switch state, but also
leaves the event queued across registration.

In the unpatched hardware trace:

At 74.486 seconds, Bluetooth is explicitly soft-blocked.
At 80.300 seconds, Xorg injects LED updates followed by SYN_REPORT. There
is already one event queued.
That flush delivers the old SW_RFKILL_ALL=1 to rfkill_event(), which
schedules a global unblock and turns Bluetooth back on.

rfkill_start() already reads the initial switch state when the handler
attaches; this later delivery produces an additional action after userspace
has changed the soft-block state.

Regarding the missing input_sync(): from reading the initialization path,
simply adding it alongside the seed would be ignored because EV_SYN is not
enabled on this device until input_register_device().

I targeted registration because input_event() documents pre-registration
seeding as updating initial state without delivering those events to
handlers. The patch retains that state while discarding the pending events.
The timestamp reset addresses a separate stale-timestamp case covered by
the tests.

Thanks very much,

Karlos


On Sun, Oct 11, 2026 at 12:45 AM Dmitry Torokhov <dmitry.torokhov@gmail.com>
wrote:

> Hi Karlos,
>
> On Sat, Oct 10, 2026 at 02:00:29PM -0400, Karlos Abel wrote:
> > This series prevents input handlers from receiving buffered
> initialization
> > events after device registration. On a ThinkPad T14 Gen 6, a later LED
> > update flushed a stale SW_RFKILL_ALL event seeded by thinkpad_acpi.
> > The fix drops the pending events and their timestamp before handlers
> > attach, while retaining the seeded switch and absolute-axis state.
>
> Could you explain why these seeded events give you trouble? Is it
> because thinkpad_acpi() forgets to send input_sync() and so the
> timestamp is stale/wrong?
>
> Thanks.
>
> --
> Dmitry
>
