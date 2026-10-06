Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE04A6898
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312168; cv=pass; b=P3AJeaqdv8aRnDdEw2qjJ4FK/nkLhW9yWDCgmOIO+BZ2Rm2jd0Dqrcrg9o8CvXuo1aUdK4mSiAhMLUisFqOaz1yaLkjIOzj2KHpKfBz+Km2BxMa62Bc2eIScDrPSZ+AobTHMJag3E8e7XN7V8COi4uSqskLW/247iqIOcBGdUcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312168; c=relaxed/simple;
	bh=pAxVZXVgniokbrQYjLKLxT5TWxVz1UJKdaaB1MVQK6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aL8fTGp8bol0FTMyimW1WIdE2p5QBzDsxJ8CzOBoZZQyjlWBr7B8eVAbm5b25F5ZU0h3NHwYzhYrt6faIgYWwHYZYMQoc7TLNzp1Ntel6/S1NFKBOuDsIMOVShoFATKS9kPE08YC9Bq7LR3Uq6DKTw0/+2Q5SBcdRz7K1P4E4YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KvNvLn0d; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KvNvLn0d"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d3b445a84fso10965ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791312160; cv=none;
        d=google.com; s=arc-20260327;
        b=XJQf5sfaD1xSpA1QyhqUpaCYOPCw2h26QsHvTDUY2BPdUyogWuDLI1LsfujGnWT53+
         gQTqbN+5r0L3J+6IkJhNj2TI2J03Zh+/1yjGAQLW7gL9LtdPYUWbZrJYa7PSEPxwA1cl
         zj2vmRQ1FEbmkG0QtDAUNmc12/qpGZEYH/dl2C9XX9FND3U57frJa7ZWGzE2C13hKXyK
         EFFOaGcq29mBIW465vWZZmsQ08RoVnvokh4Tbh9seiTZLTqm3a/l9AeV/vCBfxzwv8sr
         HilHtBl0JO5NLNwz83fFX+AjEqk7oGXAIpGfmJWI0t/zOKNr3Aw0PnZw2FX4Vi91461b
         8pHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TNWYX4fWsx1kIjs4XJw2DVzdzROxTXQiFtHEx6AEafI=;
        fh=+W6YcErsf9u1UX6jqHyjkv+WYyFoepoPfSPDmr1aZLA=;
        b=gUM11GjVOeddi35ULLQ3ykQY9KvJ504jivSVOpAqqaFfVUpNspg3JJr0rxJMAVHApm
         UxF6mI8fkCBmnBY1bVFuTMoL2vsMYPAVE5ayjzAP4flRCehagOxzmA3k9bPp0K4OP1Xp
         WUfgMuEHqjivq1O/2nUpXiuS9CxrR0LkjJa1Jderb1Hr7j87YrEHd+7WaUPFZMlbN4pa
         6FC83fxgB/9ab+KDtLFqo9XFiGj1N4e2rdega4be0xINXmuWpRa6BZtLqbwiUgmqccbj
         IGdeOCwYEYTlVU1CG8Gk4hKv0Vf+Lutj46N3tO3035jno56zgEdTP/cVATZHDOQyyKAI
         GmcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791312160; x=1791916960; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNWYX4fWsx1kIjs4XJw2DVzdzROxTXQiFtHEx6AEafI=;
        b=KvNvLn0dgwnA/6B6mNesJt8Rh54RvPxwevPCRFt4fr18Zo1ko5zsG+0H1pfAEiTxM0
         Jw+R6EL4xmyP1RSl7c6JeKFz4YjD0/JPPkBpzCa5dpPbBGxr0J9opEmUWsPl1ErLQ0qJ
         zMAjTRyWf3xxcQxJJ1v10+GjU5+2ys0SzARaKA796zlJCDdXLONlEoz28CQfILPJ9be1
         dJOfxxEvIxYSvlgJM3b6gvUMV+4bau4Bgm1T+jQB1sgE2CFC1AXVXGyiqZsF/EiGt8xA
         pDnbiaZtboFj13mxbxDn8tSR9hA51yn/aEqH1ybNVSMQ6HMu3mb543pPBkIBpOczDDW2
         DV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312160; x=1791916960;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TNWYX4fWsx1kIjs4XJw2DVzdzROxTXQiFtHEx6AEafI=;
        b=xbRrMFUPiGdHii/kL3b8nl4tCrriFPy1AdyyFKYIx6cnncJ9vsCFjmjFqp7MIVP2lQ
         EGJcOUaUnkQR8tV/OUarZPLKyJLeNMKFuQujc//w/3sLG03Qi29pSbguAuD7ugtYvB5M
         Ny3xRfiCkSNXc6bjkJAOEMjuE+ingKDJI0W5l7c5WQfqFEAA3ANshPJ7y/7fRm8SdKxL
         6cWYNWDOsJuOy5RI877voowV/FNZhP/uS6ON9f5PNLo0P5lL/s9HY/M+zVtZlwirzKsP
         FI2woChu1WoLSgcwhDwUFpZx2Eegg7MzVreUOktZom4rX99UlNjpJz3BsaJWMh6XLLSD
         n28A==
X-Forwarded-Encrypted: i=1; AKwUvBwZCgqoJpCeS1LW45BJdpq2gTisVVlNFgcfJfLrk7kmWtqQ9ubzHaLCbVLBnMJSHgYWX2omrJaBw1fSJ3o=@vger.kernel.org
X-Gm-Message-State: AFuF++lDriHOt6MPE4HfT7Oy8V0wyNjO8rNihM5U2cjtVspU8Cul3NFK
	3UmYZCgI3LN1v0W5eQBcVjxAPfrdUO1zFsMyMcJV+K/vpWY+0vp4vDlICSqhPkAfMfCCCpT0fXl
	bPab/x6/1BfdZVV6+vpASh0hROY3xQLJ0yaNMzPL53qTUpNXYOX12njomfA==
X-Gm-Gg: AYBFou0Ljh7G8VwSObdW0iU98h6DiKzxebht3kTnENwNNY7F3KscNg+ZQnTP1BFE0cp
	aYIXMCcr0qwridRB55aVt2hQcQSnMvC61OVOoIyo+ElBGRdwCUmnzMQqcrgJXZ35o63v+qDfaCA
	si2Kc1wfZ5AdxiFd9j/d8uyeVIWkiFMiS9KQD+s40QqcWGAhpqueogAI8NzrviAD4nGDKDb0RFK
	Wvmw/tPglwKfHy+x7L3GlkinX2857k5LZAh7lJYIT5ApWOesbmjaVyLZmsE/7yzdQkmIRydGOJG
	MiWGF167W6NUniQYZXqieCy2A8LpXfdXvYKx9cSoWugyfqnO36O/sLxGJcdBWqATJKXrOif3QmJ
	FPy/BgSvx4WV3xhDmAXClP5V0gaNRul03koKG
X-Received: by 2002:a05:701a:c901:b0:124:748c:2ba5 with SMTP id
 a92af1059eb24-15e1297c33dmr34061c88.13.1791312159692; Tue, 06 Oct 2026
 11:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com> <20260924173501.856380-16-dmatlack@google.com>
In-Reply-To: <20260924173501.856380-16-dmatlack@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 6 Oct 2026 11:42:28 -0700
X-Gm-Features: AclHuK-63AoTbyB-3ClbIEIaYMGnGi4ajlf3gZyouGmo8fAAGNgvYduwL3zAm7A
Message-ID: <CAAdrzjsz2hVMLTPJKtuRakHxMi7hGRr8_C2EsCjBX516tKTesg@mail.gmail.com>
Subject: Re: [PATCH 15/15] PCI: Remove the per-capability save buffers
To: David Matlack <dmatlack@google.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 10:35 AM David Matlack <dmatlack@google.com> wrote:
>
> -     /* Buffers for saving PCIe and PCI-X capabilities */
> -     pci_allocate_cap_save_buffers(dev);
> +     /* Room to save PCIe, PCI-X and LTR state */
> +     pci_reserve_saved_caps(dev);

Nit: this should be "Room to save PCIe, PCI-X, LTR and VC state".

- Josh Hilke
