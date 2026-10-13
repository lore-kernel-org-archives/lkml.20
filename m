Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52E52CCDE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929350; cv=none; b=Tm1vKX/vUJzDx7ApK/HrdLxpZSjcYjwJn+9iIVQw7PSJMfXErWtSkvv8/+PlH8BbH07b+51YZQDMqsfLqn6a/GheEdIvb3hhubaHIBxZlVGIa/EkmxV/1pQlL7qi1/2pOmjkAf+14ufN5WEnD85v0NxctA8rvNK71IdSTOikPoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929350; c=relaxed/simple;
	bh=PYBC4PYddErwzreL9d7e3W9N6VWcJLYl+RxspMecDL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tB8VCZVqI8aLM56EIIpBPW/KN63T3qY3XWz1S66JWA0WniSWle6X1YPbePfntCrFngFVaP9PDoOV8D5W91UeBjP4rd+ujnVYM5saNSCg6zCfs6kQHn8iJGgP34CM5HiuyYfUOVzujjeSa86Z5fGZFYLtsUqgdmcdhyXJ0f0fYLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjL8+cDj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjL8+cDj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso24895535e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791929347; x=1792534147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r16N6Bcquou4n0SyVmg+6OcVew17A2VRLXfMymweVaQ=;
        b=pjL8+cDjoTQ8WLJuHir77S2HONUyz3AyF16x6KbZb2jPtbBgq4LlWslhUAcRQrvr1W
         0eXteTX3/RqwlJJxH9ku3CrKSEtR7+BzmE0lOfb1TetIano9O/ibiTVJuKtLHrDO9jwy
         SyoayDoyVuQutNgs3nAhCHddT7b1LfBRk/541TuOxBDqdfsA8Wzcbfj7Ru1Gsny7+1bQ
         M4hn8h6JePmOHT5zObk/tfK2PUMLFsBT/fh8mYs8Vo8qHsZuDz6+cPIjRhwaepidUKQP
         I6qO6xwk1scejU4lBjEI1fPxl7SCUEEGffxQmjNju9C5UfG4ibPp2uqTuTbfS4sbpLGi
         rNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929347; x=1792534147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r16N6Bcquou4n0SyVmg+6OcVew17A2VRLXfMymweVaQ=;
        b=hC0KtdNxBYnxuFMRFMNiiqmYtH0+MZuk0CMLmUYBc4VTz8M0FqyeF3v4xXCX10J91t
         cjcbO6Xc4uherfdF/ijZ+lWA7JfTVvYcy4/nq8l6M2stEgc4Pq6Ata8gUo0VgT9NM/NU
         XT4dUa02XpamvOOH4Rrm4QlmOi2hZNOiairg9mfNB7XRejBcIm/tcwNqIfkCMKjedvbi
         fs/Ys9Dlpd7so3vp2Km+SZNr/ForRuHUlrrVsW7N2ojVsyw+JjlhzbwdHxnNfZWBYiOV
         2qZliIfzK1yxfN4XgV48onCvSXV0QD+i2hWRNZsL9fMEbZ93Xd/ATRnvU8WCESrzO9rd
         kmCw==
X-Forwarded-Encrypted: i=1; AKwUvBzSkPINAi4fT7XsZAyG1zefffV2Cx+G5XxEb7yZzYKcFqptkRq+Q/l3tiEnwvh2dI/9xeWgq0t32b9vEaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgEM6xi9i93iF3K+l1fFp6zz7PzqC9R0zEGaJELSdtueHPGzF3
	hWAGAyOP3Ce3Za7YBLZX+GbbDmifC5x2FLO6IwqFvQRlg/gztnk72CxZ
X-Gm-Gg: AYBFou3664rAmtmIJSg8wkjlkNgg7Ye0ps0JuvGVgHFESA4kf96JkK5RnFMotPSqokT
	YjyHkyHpto6Lf5iW+c9ySN0gg+sKA4Np0mflSdhxD59pfWy/mYvuBGRwfkSxvuK86wr+1Ul9LG1
	D1DsUPRZwa4nZZSFmLK4XuMbCB6NZ/eGzv96y/qUC00rwO/RpTAoZ6OPrdht6c70H40Uis1hhwJ
	lxctcOaMOwmjCtrdGXZd+W4nF8QZEzj4EaU9fDAuZvUspgiVeoUOtckG7t8YNgoaRhY/v9xCota
	NYZ2fxCLqCcOICbRBwLvDi5Wiue6K3kWMSGIo6ZC5SZObldbhJToBct5GALy4Aqhg7Vf59LDcuB
	rMixAjEwPmAvAWlsnoEJ2GvGYjkz6OU3LnbXQYTfxCWoNq/4DoLkE81Ird0WErYgP2fgQfO3nw+
	Rvm3C9ld6yEW8rYzQdc+CrDwkc3hKywjXOaYZJXflR5wfzpbmiBAZIsBkA0ubeWMxPUOdlERhqW
	giH9Ee7TcfsAYsrHZuf6qHpMi/wbvbOa98xHeyXfImUg/0Gru+e3+RWSN9bP2H8MxSY0G5GTg1w
	dBppyZmXBWO94KlqXGHWEZw=
X-Received: by 2002:a05:600c:6388:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1ac666396mr67570285e9.15.1791929346529;
        Tue, 13 Oct 2026 15:09:06 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:ce47:40ff:fef1:ce77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de77b35b5sm1627717f8f.21.2026.10.13.15.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:09:06 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v2] wifi: rtw88: pci: wake the TX queues when the rings are reset
Date: Wed, 14 Oct 2026 01:08:39 +0300
Message-ID: <20261013220839.39149-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <02b86ed0d0814f009cb5ca83bae343c7@realtek.com>
References: <02b86ed0d0814f009cb5ca83bae343c7@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I'm thinking if here is too early to wake up queues. Should we do this in
> rtw_reconfig_complete()?

It is too early, and rtw_reconfig_complete() is the right place. v3 does
that.

On the reset path rtw_core_stop() has already cleared RTW_FLAG_RUNNING by
the time rtw_pci_reset_trx_ring() runs, so anything mac80211 hands the
driver between that wake and the end of the restart is freed again by
rtw_ops_tx(). reconfig_complete() is called from the wake_up label in
ieee80211_reconfig(), where the comment reads "If this is for hw restart
things are still running". It also makes the fix bus-independent instead
of PCI-only.

I measured it at the new hook before sending, with two builds of current
rtw-next that differ by nothing but this patch, using mac80211's own
tracepoints instead of a register read. Under load the BE queue is
stopped by the ring-full path, then rtw_fw_recovery() is called:

  without the patch
    511.499278  stop_queue  queue:2 reason:0      DRIVER, left dangling
    511.501625  stop_queue  queue:0-3 reason:4    SUSPEND, the restart
    511.957404  drv_reconfig_complete reconfig_type:0
    511.957411  wake_queue  queue:0-3 reason:4    only SUSPEND is woken
    AC_BE stays 0x00000001, 100% loss

  with the patch
    475.930915  drv_reconfig_complete reconfig_type:0
    475.930925  wake_queue  queue:2 reason:0      10 us later
    475.930926  wake_queue  queue:0-3 reason:4
    AC_BE reads 0x00000000, 0% loss

So the wake lands after the restart has completed and before mac80211
wakes the SUSPEND reason itself. No TXPAUSE write and no injection this
time - the ring fills on its own under load, which is also why I am happy
to leave the measurement out of the commit message.

One consequence I should flag, since v2 covered it and v3 does not. A
plain "ip link set wlan0 down/up" also reaches rtw_pci_reset_trx_ring(),
and mac80211 never clears a DRIVER stop on interface down - nothing
outside the stop/wake helpers touches local->q_stop_reasons[]. So with v3
a queue stopped before a down/up stays stopped. Is the restart case the
one you want fixed, or should a down/up release it too?

I also left ring->queue_stopped alone. It stays set until the first
completion after the restart, which clears it, and rtw_pci_tx_write()
does not read it before stopping a queue, so a stale value costs nothing.
I can clear it in rtw_pci_reset_trx_ring() if you would rather the driver
state did not claim a stop that is gone.

> As I see, the commit message can be very simple -- wake up queues for
> ieee80211_restart_hw() case.

Done, and the subject names it now. The measurement paragraph is out -
you are right that the stall belongs elsewhere.
