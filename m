Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E247A3C0A0C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813538; cv=none; b=mmGaAZyVdk8HiqWMdjP02gwDl5KPOYiRsywg552EtkYwME12feHbD59p2ZYs/JSGq1yygsdsE+cI6M+n5yALEm8dNxNrqY13kW/d2Ie8Z/TXToAnRO10Vgd6aCzdStLucZ+LIWE6VV9iRswPOCDefOpJB9tx1DB1N71DFDi+8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813538; c=relaxed/simple;
	bh=B8fYPQsF3fjjjyxm4tLPdgSy0mdz8Y2/OEmL8RLtKQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H13EEmWOtIiqLqgdNQ4+9Cy6NGpH+mp69tIL4rUF65cfBCbmPXfiATuEDxbzRdpYSvzkZ1xOSBJhHlhDNr9DJciXeiWUGMHAwUkiBR4zr4MSkI/n7OUv7rcSPSiavoD2KpEK3ilt5f0qyFGcwistHbmX3igU7yAv8cpzsBEcRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oz0MUfSP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oz0MUfSP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a01933b584so16836345e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813535; x=1792418335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkfYRiKWPJSEEeybOhY/J1Dk0z/38ebHl0Wzyd5gW/I=;
        b=oz0MUfSPP3M0yLey3mtfCp0OO8wwoujC1at5Y0AmOCkKRJnkYevY4mF3LYzULmOWMY
         870gTf0GTs+8texXXFubibHcK76epk/GR5Y5mOrF0ubW0U0h4rZrcuifK56BTPfFcw6W
         jpuhPgaFOEZmHgUL72XO09pBNp6RozZkCpNlfv+VWmlOk9RJODe4nG86n26mffpmF57O
         mHDA2z4KE7eeyRN53QUeUXML2fCB2PsciFL6dK2PGvS4eF2t92DibcAXfqbLLHKJ2Lou
         WxhHqzGbPw/o2ODQ/Gv3khmpdtnNGxqsWf2ntobbuPbeE08uHcVzAcrkl2K/02toixOa
         Hw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813535; x=1792418335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkfYRiKWPJSEEeybOhY/J1Dk0z/38ebHl0Wzyd5gW/I=;
        b=ymDiNZnaVkHM23Wh499ZqJ0J36BoT/QIBKPwwz88Bt2q50KQxFf5yOaqFXTC3pzzjN
         hEbJKV+eeoiMpUdEhQ1GiO7C41tt6yUBJ45w3k7UpUc+QC92bWS54eV+VSj/iVnL/EXF
         klbKTqWkVyRc+yY6CXiiTeVWk8600ea65Z8822DhAWKuwCnDNK8u71SX8pZHdKQmlWuw
         u9LJ6gkrzD0W3maLGsggOru58/Skwc62GbERxjrNvY8Zq5+K1PpnlanFmatVMUAItVhL
         A/bUKP8hv6JpJlJy4cZVISuAhtKY2KG7tCly2hinvIBJcmcwuTCOJhnW9KPq/+3KbF2v
         wCnA==
X-Forwarded-Encrypted: i=1; AKwUvBwSC6vUX2X0Caf0iHaulzAEk5HU/42vqXYjQ0enys9LI1I8L5PO9eGSlP+Ik6kRMgmlUCAVGKkCNKG2hx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWnv7zMNialIC8gNtgHr1f25ZxfD9nJ9DWWm5ykWMgpppKWd+V
	XUu45QEMpNZwEJpul7upOXQ1Nkxgg2DUJeaATr2wEtEf4KJt0wqH5Fgz
X-Gm-Gg: AYBFou2aoN8NWkQSGzwfHsAOoDOBGfD2Fjs5l5j0fsuxE5YOBiC8HshV7hVJC6+7M80
	93bGZhxjjYn8/ul+wi9L0+xS89QIvyyXzHDpnG5bavIa/lZW2UAj2c4wBf1fPfq4zNEH2EG/L/R
	qefv+p/EpcKlVJ9lsoRh9i5NuQ7luZ21CqNZWdm8KVufQKpxI1PdGE0cCEOMCVMug7MGJD+1HgK
	gMeRHmSGgOO3WBVGwRCE0WNQDYzcd64nE73EotEppImARTz39QMM6HHEOM9pOmJyYdUkFmCJ9pc
	L+X/ESCGbRqoLj/pegI0CDomTEhD3rijOlw6Pp9W1Iq0V16nuBcd1s8PrjKWUs+E8Q83nclwAs8
	+MKM31qA8JWTflvsxsUmlB6NSH468yMz6RrmSboTZmmxp2+jNvkzEpxZPJq5kUf9kh2SmEMQc+t
	DV4QzvuAqUCOrfvjXo0K1KncuQt39duNO20rjHVZQliFaAILgQH9D9rFHyTfMgqQbVV5xY8EyVe
	LByOge6oUbrPs8IiJcdZDcC4qgracjVHecqUPbbn69I
X-Received: by 2002:a05:600c:4e55:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a18e49c008mr167950485e9.12.1791813534960;
        Mon, 12 Oct 2026 06:58:54 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.59.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm281072835e9.14.2026.10.12.06.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:58:54 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jiaqi Yan <jiaqiyan@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/nvgrace-gpu: Skip PFN registration for empty memory regions
Date: Mon, 12 Oct 2026 15:58:41 +0200
Message-ID: <20261012135842.152928-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009135203.33f3806d@shazbot.org>
References: <20260925161024.189771-1-parri.andrea@gmail.com> <20261009135203.33f3806d@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 09, 2026 at 01:52:03PM -0600, Alex Williamson wrote:
> It seems to me though that the reason this bug exists is because
> nvgrace_gpu_pci_core_ops.open_device is trying to handle both real
> nvgrace devices, where usemem.memlength cannot be zero, alongside
> non-nvgrace devices where that can easily be forgotten.
>
> The above patches the failure of that model, but maybe the better
> approach is to split them such that the failures like this cannot
> occur, ie. a core-only wrapper that just calls vfio_pci_core_enable()
> and vfio_pci_core_finish_enable(), or some other refactor such that the
> core-only path never handles the nvdev.  Thanks,

Agreed, that's a better fix.  For v2 I have:

  1/2 gives nvgrace_gpu_pci_core_ops its own open_device, which only
      calls vfio_pci_core_enable() and vfio_pci_core_finish_enable(),
      to pair with vfio_pci_core_close_device().  The usemem.memlength
      guards from v1 are gone.

  2/2 drops the remaining usemem.memlength check in
      nvgrace_gpu_open_device(), since only devices with the ACPI
      memory properties reach it now.  Not for stable.

One visible change in fallback mode: open no longer fails when BAR0
cannot be mapped, the same as vfio-pci.  BAR0 was only mapped there for
the readiness check, which fallback mode never runs.  Ankit, please
shout if the fallback path relies on anything else from
nvgrace_gpu_open_device().

With 1/2 the reproducer from v1 (QEMU cxl-type3, fallback mode) no
longer hits the -EBUSY on reopen or the KASAN use-after-free after
unbind.

I'll wait a few days for Ankit's comments before posting v2.

Thanks,
  Andrea
