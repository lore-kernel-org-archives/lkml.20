Received: from mail-dy2-f23.google.com (mail-dy2-f23.google.com [74.125.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE5A49B211
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162455; cv=none; b=fmpvo7YwlJKnouCwJGRqxAQ1QiQFz3OneoBAiJUORo1b52RnL6ibFhZ/wQc1rV9xt7kI7MfFH+rVqAeby0/yPL+m52pCdc/70FLKBtr/9haNiWYHJlZEGKPfgpzWwHkt154t+F+JHroEXOanFIKKN/7AIkYuTED+9vY/RJef0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162455; c=relaxed/simple;
	bh=ljPZGMW3EOOyQDGbBFq6Gu4+MAFs0+T56XB1zZrbm2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okEUbKqDV/hmSSgnY9jSRaTOjoFhZTJFLjKkQd0/wyCWxwPJboKikUU9r3v1IOjpp1bQqixLx+KHc5amVZyh2PIXq+MoXVYt8aywsduR1c7d/v1Uwza11qgULyjwX8BszlmmKDdRzAgEs2UuVvJdSzpMqcc/IJGIlEaExbIbZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVWOiFIK; arc=none smtp.client-ip=74.125.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVWOiFIK"
Received: by mail-dy2-f23.google.com with SMTP id 5a478bee46e88-32be7127c64so81925eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162452; x=1790767252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3A4c/xbFZ6e0tq+hH+/3HeXVXMCnlcmFGa/+buKPU0=;
        b=BVWOiFIKs2ja0GMbAE2WuwcWnyFcW3E1bmvWj/P1Z4sHdFzevPgXnMLf6U+4SChNRK
         ThMpxkMNan5bX1AZ904J4qOgvBHI+bvo7Wa3R2jS8W0mhkhuCIOhCZ+t2YAgD9gaW5Ub
         zVD7Jwz8oDk0rE4qOBeWvnpjD9dwVG1M7YCZBKeAGmtIChPbY+ZZAXnOBTSL9ok+IQN0
         LD7s0I0nEBWlKZ7vOBMgUkeJqrIWaZ+8rqGcJkq3wQRfedt4qrowVvH3ODniEF24JtkB
         d6MwreZxeMkp3AfN9Dz+//01pDqy5eL55GmfJfRAwzJUXgoWU7jW+vOHKcHrFHPkFkoZ
         QjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162452; x=1790767252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3A4c/xbFZ6e0tq+hH+/3HeXVXMCnlcmFGa/+buKPU0=;
        b=cd8ttMjhcCq8DONDrKs7agER7eFYF65wa8SHZF2TMlfkM7D6Wm2RpUW5h8r8y6oSSt
         9H95Xxh5SC33YSstBSeFwYL+PCmxHeKfxE781IUux2syhB1sNc/ojzhEWHFtxPzpxros
         P746i33KAKKkWs093olRvqVNjxu6FGkjoQzhpItipxbogIJjRBI7l9SSQjjDJ6+3kzFZ
         ws26JzHa+vpNGG+dZLNQr9VjuDyYmxHEWGI1EBc2QQwYbkcJ6Jo+XixP9GKtmE8ql7QH
         1RSlg422GmPjeVNJS31Q5hBLVvFA3A38v/ccG++oiuHQ/2BuYLXAscg0xMCE0Put1WQ4
         bI9g==
X-Forwarded-Encrypted: i=1; AKwUvBwvDNZsM7J/th3ox/xpbI0WdCfS2UvHXSzi3lqpmHHtBzewM9vL1PJOsuU5cT87z0xr3MjbNWa5fG6a/kk=@vger.kernel.org
X-Gm-Message-State: AFuF++mRjMBsnAP410nWrdA4amoJchV2juF/5hp/ycGtrYHNKgzh7GDT
	2khWEmlzY91/MsmYRwNRpIInnwjgZ8wChHE+cngXbUmAjuWXAEQ/QDl1iTvcWtzo
X-Gm-Gg: AYBFou2LRTMUW76Iw2726GCdYaeI2/Sbz5wdBQwrLzg9GQofuzf8KzsPQKjkEy82/xS
	DCRtaL0M1NtE7bpwIWPshDiBvI+Ysa1fQUMPEnD4+hk5xgRBFKhxImkAaF0AHYYJSR7F7joWhN8
	61Cvdp0k+uMqWJSvegQ1ZOff+d3WgAXc+ATuKKBxKMwWTPbE/++5axvJ/FbV2/gYvP+ki0H43YD
	hfmvbx2vorrMRjVsNPtC98WvAiCxekHoLajuLV0k7PdLsJM0LGEiOQd8KpRPr/aFFVQy2K1B30E
	N1JQe3H3vdaEOWT+fRtC8/QEgwN77rxYIOGIQUwchetvuT+2ZuxR6R19svxEcCqlaOligFpXrRb
	6d+sVvCSA7SZkgau4Dc7egl8cbKgAZGs6NKzymNlozFoe2lSL+imaRx5n4FahrPXO0fK9aX4vQ6
	XmRQ7qFXqBTr/zKzK3+2LxcnByg5LLklv4DWGa9xI6ChnKg4gnBeMegewoiqRNYtUmgffJuFzGI
	JOoUcbqphckcu3e+8cn1HHEfYpMNo9WnFqA5x9KJJTTrytSvlrQfrcC95YdeqZDUg84GyUBPWIT
	VmPuSm9nFyfqIEYr5Q==
X-Received: by 2002:a05:7300:c8c7:b0:33f:3750:4e22 with SMTP id 5a478bee46e88-33f3750519cmr1326580eec.0.1790162451512;
        Wed, 23 Sep 2026 04:20:51 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d46f48sm11925271eec.23.2026.09.23.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:51 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI/PM: Skip the suspend_noirq config save if runtime-suspended
Date: Wed, 23 Sep 2026 16:50:44 +0530
Message-ID: <20260923112044.187266-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arOpj4C67BnrNreM@wunner.de>
References: <20260923022511.24932-1-navonjohnlukose@gmail.com> <arOpj4C67BnrNreM@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 12:27:27PM +0200, Lukas Wunner wrote:
> Hm, pci_pm_suspend_noirq() should bail out earlier because of the
> dev_pm_skip_suspend() check.  That check resolves to:
>
>   dev_pm_smart_suspend(dev) && pm_runtime_status_suspended(dev)
>
> The code comment in device_prepare_smart_suspend() explains that
> smart_suspend is true for devices without PM callbacks.  But only
> if the parent has smart suspend enabled as well.  I guess that's
> the sticking point?  That the port above the card reader doesn't
> have smart suspend enabled?

It is that check, but it fails on the card reader itself, before the
parent is looked at.  no_pm_callbacks is only set when the bus has no
PM ops either, and pci_bus_type always has pci_dev_pm_ops, so no PCI
device ever counts as having no callbacks.  With no driver to set
DPM_FLAG_SMART_SUSPEND, the reader never gets smart_suspend.

pcieport does set the flag for the port, and on this machine the port
stays in D3hot through suspend.

Thanks,
Navon
