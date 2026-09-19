Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E237DEB7
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841513; cv=none; b=KU4jzuuOuMZK86hLmIxspuyGp4QIqQVLw6wCGxryiR50fQ6P8NVy6f+ZAq3FZzJR2FRyCUYsIBkNoCuWpj1QfaDof2mrddSRKiV7ZgEIlQBxDa18kILExvVTVzf5NAUss6Y8sR6BHwaX1Xl1AS0CGKg+gW2obmy2krGittWuJVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841513; c=relaxed/simple;
	bh=0PG/SWLYExPZcuxoY1bWfDz5SxtM34z1QYtrvGHDGEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/aT0CdzJ01/F5OWJhntCf1P3jvy3qTO7R1rtrToeFYiST7mHmwRlgX8w0DPE16FkVcvQtMyQMvhyE8vCEI4UYKJYUNIEdNOr+SaAHu/VVTiiKl/HFX7cAtfxoKCb/TTAe+ScpXHp6iZ8p/Q42gsIuSIGx3DgkdfMEtKPbpG2Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzWkn/Pk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzWkn/Pk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so581416a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841508; x=1790446308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iSdi3wdBQsgY36I5hr86R3evxPH8QemSHvp8ROcgqiw=;
        b=VzWkn/PkTfr1VtQ70p2ikUfEPkiohS2twRUCi0mea5XbRRoaqjJFkIgqKw7ceRsCnA
         Lq/+qV/dhGma99RYsmgUMX+fVPjJST8pK1Mjq5703gWtsFq3QchVi+pBMrBituRPohgY
         DziP9u5JjhmTUV+lQk+6H9hXMegK0X/ZpNZo9b8qUqSfu3idi4GayhqGCX/pHvsH2v2Y
         6UQrljvEP/BMhx7YHHKHEzBS5ES5h8xS1PEqm4v/qzRax+kGpg4noiDNmLmH6CSgXz96
         ncgR+RHy0attVpf3QgVPHLGN13F/yjfzw2IPYTgQ9EEl/ILKQk1n0iMmTSfCtnMeuI7T
         whSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841508; x=1790446308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSdi3wdBQsgY36I5hr86R3evxPH8QemSHvp8ROcgqiw=;
        b=2Z1mKa75BA1clJpNkCtBIya7E+Cax9rZ46NC8wMt/WjdJ0pSekYiSbuuXCdxZIlMAh
         MLiEn3KBDRiWY7a6YBYezBMy27E2nOZ+eCEUpSipptpOAfdBBZ5nr3JjVY9JdG87f/fU
         SCUI7Z1+JC2Ljx/+DhWtWKWNLklIoqkW79b7BBEE9pGd4xPs8SP1tw3BhhYYn3j3WpJh
         /tUXi2iI6bDoPeEFGJZY/MZEosuvHeVhJmub+ZPZ67/gpqv1SLjvjFThddfwsffRi6/w
         hkT+RU+2vL1AR1O0vWwdNTnrVT1fsQjNd+FfgZ55CQkfYqtkU2PPBUdQK5nUcytI+NiA
         XiOw==
X-Forwarded-Encrypted: i=1; AKwUvBwzcpvnptwT/bqpiI1+rYZCS7x9FrudL2XaUMy8PjHXLg4nZMSc0DMAoIC6M3E6ocu3AKzMT9hwjlv/obM=@vger.kernel.org
X-Gm-Message-State: AFuF++nfHFyyhR06pSlvgylTa3QP6ws2hUTkR//9MdwvwygRUT4Nq6QG
	gp8JqEo/ZWn9zUHkSFKMm3CFFxNU3nlsl3ZVhnbVlYUQ7DNVpOdMyBlbQ/HVFw==
X-Gm-Gg: AYBFou3i6FR2VxWLRwqQ2wT7OLfg5tmexNEzqvu5T3IiJEPRQRhHaK96F3CUoMdZSMz
	0hnsjwPPEJtgD8BbHXcoSbTJ5YyFuXgAFsCjz8oz7NxaZa06wujKyhRpUVqSyGUCkUJie/DCGJk
	QDWqGFJ3/NBveXMUprbKbw4Wq4WY0tkfnVT5HTpavKCnV8aTgkfVnoPmQ6dsEZNE7TmFTI7Osre
	ydsGn0Lh49UfrTYw2E04D51lpy0XKM7wcYt68HYQXj2iQeWnuii70ZzXcWRMlGTEtBSFKQafZQ4
	BEBrel3XxQsjEwhW1NgGiiykxLRkduFJnbkTE5AjsTuFRfSquhTxHAKl3a4b5PCs30BXWnIz8OB
	wzCl1lajifV3w8czbtWnnp4tNVfQOyBf1CQIBWnjvDLu4/kkMtVrZUIqQ6X0y8EipIm73U3RCHn
	Ekqd5apcnBo2QqJSFX3OK858J4wZcuXuBdqm4bheKRkGwvBANsPuGxvZqRmoZm0FEpKV7clXBct
	BAK66IrSwoHMFZdiqiTp6/6Wg/nMxLnXxTy2g8=
X-Received: by 2002:a17:90b:4a11:b0:39e:6c68:fd93 with SMTP id 98e67ed59e1d1-39e6c68fef4mr3104167a91.40.1789841507612;
        Sat, 19 Sep 2026 11:11:47 -0700 (PDT)
Received: from eggarch ([2409:40c4:1019:17ac:cb7e:823e:6cc7:69fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c8e7sm5468055a91.9.2026.09.19.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:11:47 -0700 (PDT)
Date: Sat, 19 Sep 2026 23:41:38 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <aq5QXMlNQcBNsMfA@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
 <apq4FFSD2QKG-jUu@eggarch>
 <aqrK5PwpJodCmbdM@eggarch>
 <b80ab121-2409-4ea3-9649-3aea4d1e7507@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b80ab121-2409-4ea3-9649-3aea4d1e7507@linux.intel.com>

On Thu, Sep 17, 2026 at 11:16:03AM +0300, Mathias Nyman wrote:
> I don't think there is a need for a new PCI bus specific implementation.
> pm core then probably handles this already in a generic way.
> 
> PCI core probably calls pm core on a PME, which then starts the wakeup,
> pm core very likely keeps track of which device triggered the wakeup
> 
> The wakeup_source structure under power in the device structure (dev->power.wakeup)
> looks promising.
> Maybe we can find what we need from there. Hope its fields aren't cleared at the
> time xhci resume is called.
I looked into that wakeup_source struct and its path, unfortunately it
does not seem to carry this information.

There's no fields that record the cause of the wakeup event. and all PCI
wake paths fold into pci_wakeup_event(), the active flag in
wakeup_source only gets set for 100ms of pm_wakeup_event(&dev->dev, 100) in
pci_wakeup_event(). then pm_request_resume() runs but its async so it
may run after active field is cleared.

So even though PCI core does call PM core, PM core is not tracking the
cause.

I suppose my above proposal could be changed to a pm core flag that
may be a better option? Something like a dev->power.wake_resume,
bus could set it in pci_wakeup_event(), then we add a new resume callback 
something like pm_runtime_resumed_by_wakeup() and PM core could clear it
at the end of runtime PM transition.
But either way only the bus is able to detect PME.

Regards, 
Lovekesh
