Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760645;
	b=pFI9dX9nsa6IzTAxiARIWnX7YGiok+RycG/ZfMuQZzu/5WUqyWZLw8Pi59EUOBtO7pU8
	 HhHI9YvUB8FM6zTLlZIEkSGtT7fxBLchrw5R5OixWy5YxTIIaecl7WMic3TsSS1FLH4Hn
	 dtWLTvMVJBohgdSYhbWdGoW4UhtVqDbPUGTTtgyVcfLfCnt3U9HGq0WsTuxtya7qvNL3x
	 0hjRJT3pnLNqPouDRHWXExAbVstzy5CfPK0mcQZPaM/K9X1NZO07nG49RdyBoQd4M0miA
	 4dTFxopEjUkdH2KF46V6ZUX95ehu5+QAPZLK8lJh9jtHZ/xlPGpz1mAxDG4qfWi+DZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/9TYoue951zik+HLDn2qBXp3ej+wU6PZVq7TvgCLbEQ=;
	b=QbaMoi2buhRGBJjaf3KmNfkH82NgiXnmSTYICJH/rpTb5h7Uk/ZTDT1wxTTy4+6PQJVR
	 +SHubm6K8COO9NcGDUtacDGpt/EeCax0W7qXpnJofoj+DkwO+XoNzuJci04PLs4PThVpP
	 pfviFLuH9P+YQnkUSJ/yGqgfuoACmrm0n0lJppc0iQes46bLRMvvmS2NG56h9EOw5vxIY
	 8ZwRv1f/2niIxzcGEpOIOkYMGhuIPYpKzvYU1C2JNYSLufyMe27z+/HTNHSqxcRlmWJ0k
	 0BUrQo2ihyA4xULykQSD3IXqKOz+Ppx9O0gPJGx8FWigBZynS/v101QnZ7nUAGyPx4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAtgVZwo;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA55606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA55606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAtgVZwo
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2148865eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760644; x=1795365444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9TYoue951zik+HLDn2qBXp3ej+wU6PZVq7TvgCLbEQ=;
        b=uAtgVZwojQJCinEpTZQYUXgjae1maAfkSWGFQ5hHxgVKonuy6Rb6f27MKHYs0XuYsA
         Z4Qrrh0bUbJOIN3pUukFqxgT6GIIVdTYX4iwiYffxJ5Z+Annvwws1fia06BjzULhwHv9
         jRq/LmcE5l8i0DY8xdsm3wsMgoDI0KwYqiQcD3/h5yuMMV+P47FIvVA3i9OFjiqAVb8E
         IWjf8N0ZyNfey+MS0UCwySZLL64MWnAfwp3JSsWfsNBCOxAhkTlDnRycvksAAAmLlqDl
         iNFYt9TgF6PzgI94YIVbnJ6VijWtiMZzG3E4zOafTybEJZjPWBWOA2s1rPSHXO/QgVtR
         sF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760644; x=1795365444;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9TYoue951zik+HLDn2qBXp3ej+wU6PZVq7TvgCLbEQ=;
        b=qb4i/is5hovB26K5T3upHgb77NwkjBFErQM1hSWM1/KFJTPi/efYWZZVYahRMlqgqk
         OiiAqLLazo5Tm2MpDtORWZ5+/VekazHh+5ZSyKCttjZAq06O/qw0nuYb7rkx3TnIgyhd
         tda08dff6HoyZ6TURdn+QQwYJzXUWlrWYy0a31P5EaqjL5wS+yIMwF0gXCTFiUkxTdCI
         fw0XTsY4V9ULu8LFM7HMty2JTM/IY2Ax689rUXEOqpTzFdxVNdDs8JyJd7dZU13uJNGk
         PP3wFwCy49pB3Fm4QvvG7IkRtE2TEs3qD/UwTf28mYVCVQymGYaDlccfnKiU787nRqY4
         F+NQ==
X-Forwarded-Encrypted: i=1; AL+hErF7dm1HrKd7ThspqY8qzjMWgUM89eOvBZLUel8vOhOb+HH+Uon2aUEMwK7hZQcuHryhc3JqVwlGSqX1Zrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Rk6JyFyylEJby4FyTvSlZcW5d+puhO7DOv0luofUH836sj6k
	ez+MxuJyWnlwiDC7OIKYG/d7kpv207ZJR3rP+YXesezKPsLHz3cR9gmW
X-Gm-Gg: AYBFou3yPXq9dKE6cQP8LfdZJ97TVQ5D2Gk/Ng/zZsWt44tmds/poiKea7AOlrxM1fl
	aklzjIwBDu7yuRBi7jLQGsBHOPMVIfH8pcNYEImNceU1aduDen4OVscyv2OdodDGg4L/VczmLLZ
	JH6yt00m1nT0Qy4HgiO7dhOAa419f2sR5/BtSgkSxwdwEbA9pwkkO2NOOJ01P0hXy2lFf1YwSmi
	H1lpHd4GyD6orE491LelSAlKC1p3Vp88nTuBAay8qsZ1QhQ6GZnthOutd8jXuXrbFN9TguogKi8
	xVPU1/9pJzn521rUP4sLPtEtznP2FCIlaqJI4B1CduxmfBZ5RlAJl101iai7yxx/oyP6dBmJ/Is
	wXih1Hgl916uOqpJZHjDETCRPq8wa2ZDYmJo3hRLCfpuWBZWfn9+gZYRYgbdLpBf+363yGXa+Vn
	4rZe/WiC0p7PCpFCFU9aW7ZaZ3Vv7fJpcv4zf0aZoPXMUP/pnEf6CKPSu27HGyogyCRzI4Fuc3y
	HRucU6bsZLD765tTTiQl3FWL+/1hiv6xUs6ZhD6VeJmy7SRvR+NRHRUATGt7i0O4kHaLIGjFCMC
	IlEUGOw497yLJfItLSVrtyUgss+w+vaAxrncqZbEiyaRZmGF3jq+rzbDTczvgOiWTFOn
X-Received: by 2002:a05:7301:6185:20b0:372:601a:6278 with SMTP id 5a478bee46e88-37967027be8mr8454445eec.33.1794760643686;
        Sun, 15 Nov 2026 08:37:23 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm52062445eec.20.2026.11.15.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:23 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: failed altsetting restore leaves xHCI ep with a NULL ring
Date: Sun, 15 Nov 2026 08:37:16 -0800
Message-Id: <20261115163716.226763-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg, Mathias,

This one is from reading the code only; I could not reproduce it. It
needs SET_INTERFACE to fail and then the restore of the old altsetting
to fail too, on xHCI, so it is very unlikely in practice.

I know the kerneldoc of usb_set_interface() says that after a failure
the original altsetting may be disabled and drivers cannot rely on any
altsetting being in effect. My concern is only that a later usbfs
ioctl can still reach the HCD with that endpoint and oops.

The sequence, as I read it in next-20261113:

1. usb_set_interface() calls usb_disable_interface(dev, iface, false)
   and then usb_hcd_alloc_bandwidth() for the new altsetting. On xHCI,
   xhci_check_bandwidth() frees the rings of the old endpoints that
   are not reused. xhci_drop_endpoint() does not clear their hcpriv.

2. SET_INTERFACE fails, and the restore call
   usb_hcd_alloc_bandwidth(dev, NULL, alt, iface->cur_altsetting)
   fails too, for example on a ring allocation failure. Its result is
   ignored, and cur_altsetting still points at the old altsetting.

3. USBDEVFS_RESETEP on a bulk or interrupt endpoint of that old
   altsetting passes findintfep() and checkintf(). usb_reset_endpoint()
   still finds the endpoint, because usb_disable_endpoint() with
   reset_hardware=false keeps dev->ep_in/out[], and nothing checks
   ep->enabled.

4. xhci_endpoint_reset() sees a non-NULL hcpriv, passes its other
   checks, and reaches list_empty(&ep->ring->td_list) with a NULL
   ring.

Either side could avoid it: usb_set_interface() could check the
restore result and disable the interface with reset_hardware=true,
or xhci_endpoint_reset() could return early when ep->ring is NULL.
I have a draft of the first, but it is only tested on the normal
altsetting paths, not on this failure. Please tell me if you think it
is worth fixing and where.

Thanks,
Cheng Yongkang
