Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7537647E
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791752711; cv=none; b=pFoewLVw3kK/FS9A3QtZHGxGDf6X1Ic4/X1ZlAPGhk2idw7pAunaK29d/ZReLLUj85r+fEsM3yhrwxkBhCiD24oggSP9UMV97d8MtaIjLfR2loWEFj0wgTMmcFHC0NDBjt4JwnGRhC46rpcyMrrgItttv8DayOMuUIpmfIG/nEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791752711; c=relaxed/simple;
	bh=XIV3Bw+meEIbEvfPttC3rmUTSBP3umIE78D+SF0fiHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoBbnV9Qx98D8bVHmBKqgXPTWZpIvGFemBmMCtb6QJiXIHzWBeOkbrxuOeM86p4JT3leHXsDKOIt1gBSckoW4HeYDoMjP4zL0xd/TmUj7q3PpMlY24VVmb39ycZ/keIPeZ0AuC+hIEjthJ8wHfSNxtFaT3ca9AwkZVMb3e+tCSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iI1BieKf; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iI1BieKf"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74ab6c88052so296897137.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791752709; x=1792357509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ1qIeqHrec/OIdwqoJkpql1iC1IeshUMzkQNORQJ24=;
        b=iI1BieKf40qd4gbYQ3F/YHbZZqUJUgjb/rXm3R4l96I3NDtuSO66RoFEh32lqKd1US
         JfBlLzZ3wTCljn54ZwhDrcHF+u9f2lnIkIQKXFJilrPc7jKbB2Dj5nJ/khyAuY2wbU81
         SSq2Sb7p8Vrfr/Z+G6tz/98ahsm4aLkhnj1zpbyLaU8nOyi0ZDwzD4ieYo8RgKG+bE+F
         NogMQw+n7OrRVypTTn0Uqih73w5NeJ0CNaMoorowtLdWH+uFtlaORL96UmYKlaH0JUcT
         s4qfhpDjeWBHg57vsIz/MfScswfbgRffOcDRQ2gh63ZnUdvOe5GNlTT8nF+qlFrtnJZe
         7z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791752709; x=1792357509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ1qIeqHrec/OIdwqoJkpql1iC1IeshUMzkQNORQJ24=;
        b=uo4fqAt8PSN6ODdoBVQ+XnvphEIDJu9aW2bisMnfwWJW8XDgAjscCWweA1/M++KpR1
         FGZvsDL0dOA6esHnXimXyIspCbGM7/O/0GrbShHk37w5a5AACulFyNEatZ8XKf5jhTAb
         0pIbeEvcQEpy6Hp+StdFxNnoocEQAobUT8kfF05B04QddJ6BDPMUSk+iiwjQCMKsdQzZ
         uH45VhI97LRo2un9D0HEA2HJegOnH54ZqbfQiLj/daqHAra8L5GueiiWFpgBYa2E2n3y
         9AAj5tmojFCQqczpsHqSiXa0fPnQuQ/6euwCfZP0w5zCVau4TLIcjoxrsUWj8rh2wkD+
         qyDA==
X-Forwarded-Encrypted: i=1; AKwUvBw51qllYng4QH1LUZ4k6QhKQ/plSDbycCZcyhfGa7IsCfB8p0UhmKwaSRGCqd4saOwrnqC20ICE+8PldDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFiI5lJC9+6TMtAuL5sMpaCxTcUjWNpdfw74ITjCqtlz+t6+5n
	KuSAy5PjXuE1GmRXEouPuS7ypUKEOOkbKDVjDmm4QCN/jCzwAnaQsoWBvSpv+Qa2
X-Gm-Gg: AYBFou2B3O3pZO3YacnopyWNo9E903Oq6F9xh7FBgqDkLtZRmWLS/r1YibPwjjjWAOt
	SU8wQYgmds1mNrxUQR29L+jZnUlZZ9XELp7SfPexL9N76bBr/RsNpaBAgv98EdGISKgZgoueklO
	npG7OlCSWUz1lUlzK3vO1bC5fXcIlewbe8HnCRxuORE+39mQv/pmlju/uUz8578zEWSzF3w0lj1
	LdqZvxTRw4DIMsbkU9S1HgwwtPcE3oqvlnTC50V/FAY1HRQNPR0X77SHUpY3gkV8Y7CvBP1zAgG
	Pq0GbOaciffHY7JOgFovLytLu0/mMal/HQqPEH+ibu1oaLa623tljiAewqtyM89XknLRyDJz9Dh
	bf1hTWlk3pi//D4vYP10R2smsvcFOI7cw2cbihpf+LRz9WZy0Jv3HSe3ZdG4ORRmT+2WUTYs86k
	BAt/UutgDiTCn4TubslUfL3bOHcRb6N+cOGZKQBIIDSnbM8DSJjYeAUtV+ZV3I4r1QsXhHGhIHS
	nMJ9wPk
X-Received: by 2002:a05:6102:6ce:b0:7c8:268:ecd7 with SMTP id ada2fe7eead31-7cb373a73f3mr1672500137.23.1791752708660;
        Sun, 11 Oct 2026 14:05:08 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb35391722sm5636766137.4.2026.10.11.14.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 14:05:08 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: helgaas@kernel.org
Cc: bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	alifm@linux.ibm.com,
	andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [PATCH v2 2/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Sun, 11 Oct 2026 18:04:51 -0300
Message-ID: <20261011210451.12129-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <7ed02ff5-d7f8-42e4-bca9-b3d3ce7b6795@linux.ibm.com>
References: <7ed02ff5-d7f8-42e4-bca9-b3d3ce7b6795@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Thanks, Farhan, for the pointer to the earlier discussion.  I hadn't
seen it.

On Fri, Oct 09, 2026 at 10:08:15AM -0700, Farhan Ali wrote:
> When I had initially looked into this, I had proposed adding the
> accessibility check in pci_save_state() as well [1]. Though Lukas had
> some valid concerns around the additional overhead from adding it in
> pci_save_state(). But maybe its worth re-visiting again?

After reading that thread I went through the callers of
pci_save_state().  When a device is already inaccessible while its
driver's suspend callback runs, for example because it dropped off the
bus and hasn't been removed yet, returning -EIO from pci_save_state()
changes what some drivers do:

- Some return the error from their suspend callback, so system suspend
  is aborted: stmmac_pci_plat_suspend() (used by stmmac_pci,
  dwmac-loongson and dwmac-motorcomm), intel_eth_pci_suspend(),
  atl1e_suspend(), atl2_suspend() and amd_mp2_pci_suspend().  Today
  pci_save_state() returns 0 in that case, and these drivers go on.

- Many more ignore the return value and then put the device into D3hot,
  for example ata_pci_device_do_suspend(), which most libata PCI drivers
  use.  On an inaccessible device that marks it D3cold, and since
  state_saved is now false, pci_legacy_suspend() or pci_pm_suspend()
  warns once that the state was not saved.  This is the same warning
  that patch 1 avoids for the USB HCD in suspend_noirq.

I found all of this by reading the code; I can't test these drivers.
I think this is what Lukas meant about callers that don't need the
check.

The underlying problem is that pci_save_state() doesn't check that the
device answered: for an inaccessible device it fills the saved header
with all ones, marks the state saved and returns 0, and
pci_restore_state() later writes those values back.  What I have
prepared for v3 fixes it in pci_save_state() itself, with the changes
you suggested: it checks once that the device is accessible and returns
-EIO if it isn't, and pci_dev_save_and_disable() uses the return value.
v2 2/3 returns -EIO in the same way.  The drivers above are the side
effect of that: they now see a failure where they never saw one before.

I found this only recently, so I'd rather not send v3, and I'd ask you
not to apply v2 2/3 as it is, until you've had a chance to look at
this.  Patch 3 doesn't depend on it.  How would you like these drivers
to be handled?

Thanks again,
Francisco

[1] https://lore.kernel.org/all/aOQX6ZTMvekd6gWy@wunner.de/
