Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166534D4E9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145067; cv=none; b=o+bG0FNSptovg+GoBRlUGylVKzdcKgAf2Q02EDOJrDsxH7t/QW3fFo7MxrLQ3Wdeza3kL2QIw5YgA57C+mEKzxw96BGm9D7ahrgXVojTwVa49oo854GHYb8twjQ8Ir3+u+LF61xH2GHBx5d4splCm6UWbwkf/hCTd7VEHFZ5zGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145067; c=relaxed/simple;
	bh=KRsMfl0dl8Qf6tQlsyjrXTK7LiHsTdlrKuIcd3ee2pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH2tECd2QL5f/3zzsp6nMkm0tsqvDKn1vJ3e7CKwOP350bWZjysSvyOltlMgK6qwyhb9y67wwlOnq7f3YM1x4VVdtpVUOqfDpNOECvcDI9jQsP5yfNVIpc70HtYzrgGMiqM5WxcJN1vCK94cadLJ1BNLyAdOgFZQvkBBgTN46SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVtEGn1d; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVtEGn1d"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-852c481415fso1413369b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789145065; x=1789749865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRsMfl0dl8Qf6tQlsyjrXTK7LiHsTdlrKuIcd3ee2pg=;
        b=VVtEGn1dLuYeawnHlcMuXIGTgHPzzP3k64zHfo+kVaZuu7IdVPqv261EzPOhVSXs9d
         e0e2JUoDUNWyq/PjDKUpuyKKrTIudhsBqjIFydf9N68idHQwMl2eiefRfdyL9c23NFgk
         EF5y+yAy8N9xMKtJr68U8eNwWA6nxyXTEdJ8GSjr90RCuWflfxnmVLeJDYxZxaDJYBer
         XPAtgwD9ecQeY1OHeM6m1ox4gtKh//Un9e4ZZmu01BINq7xMc36CSpN+iiMLhUz6cmfH
         ydgnW1JDCTEucKT+iAv26Jsd3Jrii/TgnfCnKk6XIhbiQTbLHtKH02ssvDShpFAG7jb2
         IR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145065; x=1789749865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KRsMfl0dl8Qf6tQlsyjrXTK7LiHsTdlrKuIcd3ee2pg=;
        b=TgeYJXdzkcZ76T2lxwChd6sGKR/NZXPiBR+7EyN8WXZsDidbhQlZlibWyCjCWyyz/j
         GsLeMst0CP3g7lPvK3F6jbsowInPw5YK4HNKz2ApxJAlMY8V2AnxeKAeHTc+jztMXV04
         ioFvt9gTCNDajUalu9rhhi10+YKtg+4XFRABMVbR2b8LC+7KmJKxBtEF+UWAPY50QHHX
         xIzHb0UGBRPmFz6SVNRJII515l6Rr5+dktTjEkD4ov6LLRHGelgT9q7FUZVXNo8sPbnd
         IFfSHj+jKxqIPVNPWtWr8V6VwxghPnPu2o9+xREf/v/sSsb1wm4vV3LA9o6lYhw9ZfcT
         JLfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz03iZyGoHIM609fGv0U5rcYLV1qtnI5lriSyZfAS96CiP6M/MYbiLwleLW6THDKYnL7mSzJvIsFiryWcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n1uGaL1J0+34gEpt8zmSJWNLIxM4YXPr5kEEz9qpuL05mTbynR
	B2JVkuLC+zRrw5wSLkU++sSJK+bVafkepA7Uj5BLNIBddQ4+SlKFjUpw
X-Gm-Gg: AYBFou3IH+nooCl18xjJ/QWvzOnjmYrAa1zhS7w3xFoM5L43PSSMvSPJnLYHMZNo0v4
	wofjR4/7Ag4hTuPmr6A7LApwvAVkQKN5PDVKaCu8auM9XjHuSrJnugpYfQ69YMZ40kZiZKV1EgE
	XjKym6S238na/skDz/uOIoA+yXKR6yirnqQsr27MitZ+mK+eDCx9D+exT2BqaxPrqLrCAy4MqhE
	Fhpaq98CYkxuTgutobFIngEzUl8SxdGZrmnSeoJfGyfCTiJuE/pZjBi2hFyv60blpMxo+896VqV
	tZSeNK/C/X3ARfv0u2V9WVOzJCjvXNZ+zqnhXWo5d3ol5nqSruPEeeAFHbx5qAZojN4eNo4jLcK
	R+Y3U8gyxTEDMPuAjptl5RvHeeUnvlIu5WDyjaoqv56BA5SjW7RjfQY26VNKW2XqZq98S1GsNhm
	ZtJHRo8Cs1S3J0FQDVCJ47stEPTaIWyB8f0nFvFSOl+ba4tn6bI0HSKn/U+HpNsczAu6Cq10tzA
	eaIiAGagQdc2o53KKY=
X-Received: by 2002:a05:6a00:a244:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-86b3011a828mr7287479b3a.14.1789145065008;
        Fri, 11 Sep 2026 09:44:25 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:b928:dcab:35a4:adf0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm1404407b3a.58.2026.09.11.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:44:24 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: mst@redhat.com,
	jasowangio@gmail.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: pbonzini@redhat.com,
	stefanha@redhat.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] scsi: virtio_scsi: bound EH timer resets to avoid unkillable hang
Date: Fri, 11 Sep 2026 23:44:17 +0700
Message-ID: <20260911164417.33860-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911163509.684191F000FF@smtp.kernel.org>
References: <20260911163509.684191F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review -- the eh_host_reset_handler finding is correct,
and the underlying mechanism is worse than a stale read.

Once virtscsi_eh_timed_out() lets SCSI EH run to completion on an
unresponsive host, scsi_eh_bus_device_reset() leaves the command in
work_q (device reset fails the same way abort does, via the same bounded
virtscsi_tmf()), and since virtio_scsi implements neither
eh_target_reset_handler, eh_bus_reset_handler nor eh_host_reset_handler,
scsi_eh_target_reset()/scsi_eh_bus_reset()/scsi_eh_host_reset() all fail
immediately (scsi_try_*_reset() return FAILED when the handler pointer is
NULL) and the command falls through to scsi_eh_offline_sdevs(), which
calls scsi_eh_finish_cmd() and frees the tag back to the block layer.

The struct virtio_scsi_cmd for that command lives in scsi_cmd_priv(),
i.e. inside the now-freed request. If a new command is queued on the
same tag, it gets the same address. If the host was only very slow --
not actually dead -- and eventually completes the *original* descriptor,
virtscsi_complete_cmd() will read cmd->sc from that shared address and
call scsi_done() on whatever command currently occupies it, which by
then is the live, unrelated command still in flight on that tag. That's
a double completion on a request the driver itself has not finished,
not merely a read of stale memory.

The original virtscsi_eh_timed_out() comment ("The host guarantees to
respond to each command... Reset the timer unconditionally") reads, in
this light, less like an optimistic assumption and more like the
invariant that kept this reachable at all: as long as EH could never
progress past abort/device-reset into offline+free, the tag-reuse race
had no opening. My patch removes that invariant to fix the wbt hang, but
doesn't supply a replacement, which is the hole you're pointing at.

What I looked at as a replacement and why I'm not sending it as a v2 yet:

Adding eh_host_reset_handler that mirrors virtscsi_freeze()/
virtscsi_restore() (virtscsi_remove_vqs() + virtscsi_init()) was my first
instinct. virtio_reset_device() does call virtio_break_device() +
virtio_synchronize_cbs() before dev->config->reset(), which is meant to
guarantee no vq callback is still in flight when del_vqs() runs -- but
that pairing is compiled in only under CONFIG_VIRTIO_HARDEN_NOTIFICATION
(drivers/virtio/virtio.c:255-264), so the safety property isn't universal.
Separately, a host reset triggered by one wedged command on one LUN would
tear down and reinitialize every virtqueue on the host, silently
abandoning any genuinely in-flight, unrelated I/O on other LUNs/targets
that scsi_error_handler() never queued for recovery in the first place --
freeze/restore can rely on PM having fully quiesced the block queues
first; EH's SHOST_RECOVERY only blocks new submissions, it doesn't drain
what's already dispatched. I don't want to trade the tag-reuse race for
a config-dependent fix plus silent collateral I/O loss without your
input on whether that tradeoff is acceptable or whether there's a
narrower primitive intended for this.

Is virtio_break_device() (independent of host reset, and independent of
CONFIG_VIRTIO_HARDEN_NOTIFICATION) the intended way to make a single
wedged command's descriptor permanently safe to let go of, without
resetting the whole device? It looks close -- virtqueue_get_buf() checks
vq->broken before touching the used ring at all -- but it's one-way (no
unbreak short of recreating the vq), so I'm not certain it's meant to be
used outside device teardown. Has this class of problem (bound a SCSI EH
timeout on a transport that can't cheaply prove a command is gone) come
up for virtio_scsi or virtio_blk before, and is there a pattern I should
be following instead of inventing one?

Happy to do the legwork on whichever direction you point at -- I have a
QEMU virtio-scsi repro harness already wired up for the original hang
(clearing PCI_COMMAND_MASTER mid-write) that I can extend to exercise
the recovery path too.
