Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83D361DD0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976788; cv=none; b=pQpYGbCcs/C3m3+5DvOK4x7ep8I2DA7NZDpxAtN8W2ct7sL50xqyOfp5ySqj8DnT9XNUn7puhPl+bYRZeP96JykjtiNkPsac0reHEV7v3XZqEfCKLk0+V2HJzMvTGdeJQ/KiVliYqFhrfGgbIvGxGuhKOdP5dqAoJLoOs0AJjpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976788; c=relaxed/simple;
	bh=ub1scIj3BF8CHOFPhajO4ma191C3gPpOV34BmAIx/e8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o07Wpjxj0APK2ee7bd4ppQIV3zDFbVh5TnEbAIVv9/WV29R4wgx/JwwEYtNZ6zfW72IAQpjRwwr+YTITFIqG0/hpWZq09lER2KEqtq1qEK4vFTuEvJUDv6H4yjuRLioUGBk/j4TJL0AqOMWFuiUeUcIGwVl+Ui7r33+xMUbj3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TL30/8MW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TL30/8MW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so1766405e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790976785; x=1791581585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JXXVqov+h6l/s57fJo22fn6XLlN1F4hCqMTncjYdxs=;
        b=TL30/8MWUWa8tL2IjZXt5Rw2nJkc2hDXv27PV9EYxeDuooAasAqQMotPOUJKi+zJI9
         CQKpC/CyqXnxQaTss6chjEm21QVLYmVU/IuQdOO10Q0GT8G9kSmAHZxBW3WIOwrCqZxe
         lNVfY3nZ3MP8xaQ3db68jMh9ue3dZlK8q69lnjQn3P9v7EYuWmV3i6weRpD4i3Zgud1+
         N9bofWcNAmRpHuF38aWkex0cVXrKn0wY0UJH4HS6th6DJqflS8BAG924uadtGx4MSo+4
         NX1Z05Y+LmXSJrYu5lApQG0aMWtPeU1k0h+/wfPfvc0rIiFniyuHb3r6uasYrgRlVRh0
         ut7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976785; x=1791581585;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JXXVqov+h6l/s57fJo22fn6XLlN1F4hCqMTncjYdxs=;
        b=dUrPvlhGBWJx5o+faPzIUBmYY3s7PZ5ZBd2HmpoxLkt+WDjDFUF9xiVKjLAbrtNwE+
         TvapZS0MEN06RpJ6Iq6mBQbGncsrcLgSebS2pfOk2uCzAuZpU/xHCR2qIeNuir9mqF0r
         pmM3Tcip8IR80F/c7xdIWFqWmZbG2752FKnQ9m31QvaIIaHfRNLId3jG4teKQA2um9U5
         CCg3XJNySJDkx85iT2DiTI24jsPjrvpQbYAkc2243jmQpAJiYXr/XT9SZLcS83rWl1kO
         h92IUQjYIGnhDVG/5UaPLUEHgMJ+ckB0etm8u1ZUaM5O6KluNkntTTUkWLCcanyv7D4w
         00Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzpINZoc//FQYsG+P7G3O+SxPjYzctJkm7FYtMoNcwk0O3QC9g7uT89BFKs0cZ8qIQEVel5byIr4VAIPGc=@vger.kernel.org
X-Gm-Message-State: AFuF++m3kQ5uiQDxo6YAu7K6hE9l5N0SNMv3s4wQfjl0xVb+JzBpd8Zh
	oAKFfVtbLgm7T7tvv8K8ZCVH/wUi4ZpSs46XoOrjrB35wNdkSY97kxuU
X-Gm-Gg: AYBFou3jDDs3xTPhttDXBi2E/JugbIjRhIv3MnbXI5VD+7V0tykGCS/kTq1+WAKlyc5
	GYSU7dSOGW8bY7659bh/6vsoHKpnbKsGCOKSYE5FSuO8WDuDTxir+xEaxo+k9y0w2opKGisDb1k
	k2M4/jb1Daf/cVVjJMcuT9xjdiSmVM0qu4lTGQgy/wPPoSpKG45RLekmpDiLJr8slDDDs5fW+Zp
	t+mMLmDeYL1Dc903F0/VnOkZna2lnZatO30IsC1w8lNy/H3YJwf2zr2rMHlZ8pZEYMvAPUJoa5O
	8mcQdbJahVSx275ORqlxSAhd3LeJU+6tBvBXVnbcHbOLsEY6BisT2KUwakIdK4TvoqgdD57PQ6s
	94hYO3ARVhDnCVA0/JQfl5LfNIoMn9Qm4NnLa8tgubrc9hgDLUiDo0hM34R4ieAlj0dkhUT2oCh
	Bw2Yit1yzZ8tpD7EnSrrKbJHm9dLesfS3XMigjwmwh3fYa9I/7vUjcGsSY/9uWwY/uz3DEWetca
	g6EEL03wg==
X-Received: by 2002:a05:600c:4505:b0:4a1:62b8:9e8c with SMTP id 5b1f17b1804b1-4a162b8ae34mr37980065e9.33.1790976784731;
        Fri, 02 Oct 2026 14:33:04 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm101584085e9.3.2026.10.02.14.33.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Oct 2026 14:33:04 -0700 (PDT)
Date: Fri, 2 Oct 2026 23:33:00 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>, Ming Lei
 <ming.lei@canonical.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hcd: Cancel BH giveback works on removal
Message-ID: <20261002233300.705d5a7f.michal.pecio@gmail.com>
In-Reply-To: <20260823125831.6ea35650.michal.pecio@gmail.com>
References: <20260823125831.6ea35650.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 12:58:31 +0200, Michal Pecio wrote:
> Turns out, we do actually need to flush them, because workers use the
> 'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
> after all URBs are completed to track pending completions and possibly
> reschedule themselves, see usb_giveback_urb_bh() implementation.
> 
> Flushing would suffice if the works don't reschedule themselves, but
> cancel_work_sync() is more robust against stray completions.
> 
> Syzbot may have found the issue due to unlucky hard IRQ timing. It can
> be reproduced by adding udelay(3000) in the work function, disabling RH
> autosuspend to maintain the status URB and unbinding a real HC:
> 
> [10818.828029] ehci-pci 0000:00:12.0: USB bus 1 deregistered
> [10818.828077] hcd_release freeing high_prio_bh ffff88814a950978
> [10818.829211] usb_giveback_urb_bh still running on bh ffff88814a950978
> 
> Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
> Fixes: 94dfd7edfd5c ("USB: HCD: support giveback of URB in tasklet context")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---

Hi Greg,

Any interest in this fix? If you think it's too theoretical I can
drop the stable tag, but this code just isn't really correct.

Syzbot has found another case: primary HCD of vhci-hcd is freed
if secondary HCD creation fails (e.g. USB bus number limit). This
(again) races with the giveback work still using the primary HCD
after unlinking its root hub URB.

https://lore.kernel.org/linux-usb/6abb3515.c6a7fab7.e5ea7.0459.GAE@google.com/

> slab-use-after-free in usb_giveback_urb_bh+0x441/0x560 drivers/usb/core/hcd.c:1692
>
> Freed by task 1:
> hcd_release drivers/usb/core/hcd.c:2690 [inline]
> kref_put include/linux/kref.h:65 [inline]
> usb_put_hcd drivers/usb/core/hcd.c:2704 [inline]
> usb_put_hcd+0x149/0x1f0 drivers/usb/core/hcd.c:2701
> vhci_hcd_probe+0x342/0x4e0 drivers/usb/usbip/vhci_hcd.c:1415
>
> Last potentially related work creation:
> queue_work include/linux/workqueue.h:700 [inline]
> usb_hcd_giveback_urb+0x330/0x4a0 drivers/usb/core/hcd.c:1758
> usb_rh_urb_dequeue drivers/usb/core/hcd.c:845 [inline]
> unlink1+0x418/0x510 drivers/usb/core/hcd.c:1580

Regards,
Michal
