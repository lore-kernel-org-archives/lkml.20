Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F74D2ED9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731797; cv=none; b=ZOa+p3PuvyDNdor5pJUHgB0gYNLVG8mBNZLSYNSVd7dZhDAuuWayR2jbhRHWL8tCVZMHxaC8pYc5/wmq6aDIqR6z0cP10SvNR0/ve590ZSR/bwLj7IWA7d4HMGFH2WOMGEvo/5IcrESzMwAj+oNZbt2UQDhKaLP7Fhj1gc0KjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731797; c=relaxed/simple;
	bh=YPCbPoNI3G9onv6LNr9Q7xmUQkFxJiPZUTMXLRk5Fuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g0A4UsKg7RRY/bzBdd11JjY0E8vaD3Ji03BXmQAbZbuVKbBpVExUGS4P1iue70wflD9f93hHJlywfaig0qgLJOKGsy2DjZvwcu8kGrV6cdvfKDsKz0tmAdNEosg7FvKqPlcEQ+wKXoq16fSnsi94NrPKbNCfvEl3nGZn9gijnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcPgz3en; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcPgz3en"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39e588a7a12so456822a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731795; x=1790336595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erDD/o7ItCDetIXe4X0kGs36t1bSEm4QSr1YQGtDTmY=;
        b=hcPgz3enKsdNyRZDTBxR1fMf0kByHJM/dg4IeqOjS6jSwLgsNqIsG8STeMDcX/GR/X
         eczR9k0xquf2Yfg18KY5dhUldKpb2sY3SxyqHLVqzSDktQgUQJgxBhbXrupDrp4AACmI
         3aYOLI2YMhIz1X68CsFBhFDLourDKhmr4al5PLflJ9PK0ty7SC5VpNYYxfl6UjykvnrU
         yjnlZICImKkJrXZfUT38GyBhz78+rYNRU86eUW3TwhkQWiV/iEijHQ8/xcem69sbQCmH
         57d6PvpDHmHvRzMxoEZ/Qq1tR/M/G1a0TGwnFqCEkOrtq0E5IYyDyrpbRAShASh5JQvV
         xTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731795; x=1790336595;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erDD/o7ItCDetIXe4X0kGs36t1bSEm4QSr1YQGtDTmY=;
        b=MEi86cgWtHA8sGigUhVh80sru8MrQYGmgav/2tkkB8mFekznGLgSatpefn9+OyjMOE
         jx1yaPayGLvPp+yf7mJbl4RoznFaVGd0ZscDu3aQFDqKPcw9aHKlt87CqPpzHmOeGtu5
         yME8LZmvQy7nQqKnne827V3QVUUnvOKFlIwK+2NaRQo2TP8DyvNdnXqtmTX43hiDwrOp
         AX8Yt9Olgj9Q68BeDCXrc/UuuHQyvTAG+NjDKn54DupyngrwNx5/vYGdAMLZ9k9anktC
         ca197+W8lj3x/7zJJp+CGF1n2AHGLYElUujhnvEVFcb4V5G1zBmo3CBZzEyJHyrlpUGg
         1YZg==
X-Forwarded-Encrypted: i=1; AKwUvBwHXP3z0Ms9BsWr+1E6ZlltsHA/uKLFRQyNtOgmfxn9Akh2yCfUNmxPXGglwsLYM3AK1ZqC3MKKj1Qpe8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nZK9popVed1f0FJCgz1YRUjP99l1ehEpIeWMLG5SstIMADmbBL
	pDkUVi77PgYuygHi9WmA7OZjXQWjWt+kiKuvAMbaMRWYkA1/1L5k2Gej
X-Gm-Gg: AYBFou0IwIgcrfC0gar49OssSPWDnhCdq07Yiv8qrVbWj5PLzrF4qFyZlqk1iDgVFrn
	bSCObJat0QRdKcCcaARVGcOM41dQ4zSmEp2rN0puVRn24WEVzBwYoBqqu0B8SVi7hYHcM3Y7oD4
	DmV87/hp9InhJDeeXLcfm2uVA08dOQyPoAax2Om8AP2JxrjspkNDHBzo6lyXHod53tnXSUoMVYF
	g99yucFYFbYBMZnYQeCzkUaDv4ELaqnpcqMg284bxNg0CqvgMRboE5sX41A+3XgVq92/qUXgsZr
	zoBxZuaWN214hymC/D+c4XR4roeeL8//DXUTtlG3MW4ygMnp2GrsRz9ZxPjZz6Ng46pEgHmMJua
	TDBZTYE2N4uDZI4ADrFIMrsFG/mJPvzIANEMDeZHxMAjI7tKUVS72bbdc3bFatyK34Oax5XTJ6V
	kWeosKSw/iwKdc3xjuanmkDtuCEaUokk6P1nwcqwpsoSM31N4raEs6/cIhZsnhFsRQVNgZgepaR
	x1lL/OZHf5CfJqef0E+Ag==
X-Received: by 2002:a17:90b:1c84:b0:39e:4c97:ce09 with SMTP id 98e67ed59e1d1-39e4c97cf02mr4613634a91.42.1789731795473;
        Fri, 18 Sep 2026 04:43:15 -0700 (PDT)
Received: from 73ebd4c7787b ([183.194.144.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4603983eec.9.2026.09.18.04.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:43:14 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Carey <carvsdriver@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] USB: cdc-acm: skip URB restart in port_shutdown if disconnected
Date: Fri, 18 Sep 2026 19:43:08 +0800
Message-ID: <20260918114309.3659635-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg and USB maintainers,

This patch fixes a use-after-free race in drivers/usb/class/cdc-acm.c
introduced by commit f58752ebcb35 ("USB: cdc-acm: Add quirks for Yoga
Book 9 14IAH10 INGENIC touchscreen").

Problem:

When a CDC-ACM device is unplugged, acm_disconnect() sets
acm->disconnected = true and then calls tty_port_tty_vhangup(), which
eventually triggers acm_port_shutdown() from the tty-port layer.

acm_disconnect() has already called acm_poison_urbs() at this point
and is about to proceed to usb_free_urb() and usb_free_coherent()
for all control and read URBs.

However, acm_port_shutdown() unconditionally calls acm_unpoison_urbs()
and — when the ALWAYS_POLL_CTRL quirk is set — immediately re-submits
the ctrlurb and read URBs via usb_submit_urb() and
acm_submit_read_urbs().

If acm_disconnect() then frees those URBs and their DMA buffers while
they are still in flight, acm_ctrl_irq() or acm_read_bulk_callback()
will fire and access freed DMA memory, causing a kernel use-after-free.

Fix:

Add an early return in acm_port_shutdown() after the delayed-anchor
drain loop when acm->disconnected is set.  This keeps the URBs
poisoned and prevents any resubmission during the disconnect path.

The fix is a 2-line guard, no locking changes or functional impact on
the normal (non-disconnect) tty-close path.

Yuchao Zhang (1):
  USB: cdc-acm: skip URB restart in port_shutdown if disconnected

 drivers/usb/class/cdc-acm.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.53.0

