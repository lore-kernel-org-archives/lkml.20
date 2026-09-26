Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AF3655EC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440435; cv=pass; b=QvvjYeSao5ThX97zD9CZdj6knmByvGST+CKIVelxZUOWXv2Itd4fB4svf1dU7NVmCb6fUWKjeKbWT4SHT8PwCjpvGa0ltoKljFC42/jt7qAPvnrdQAF9GlAnzbePI7nw63Ttbv+cqpZSe92f9L0H/Upl3RQNhCvu/KxjxgyvSzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440435; c=relaxed/simple;
	bh=mNlUAAZiyqHhMbfKXIM3eKrgGv5T4wRNAuIE6r+zS1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ved2eJPRTuh3uzUML//V6rTOXWWSKfY/gfX4HN8S2pv7izSINQ2y2ur+a4b0oqT7aP/oJr5BbIf9gmnEOtGG6/sGs5TdzcV6J1ADFEWc4X3j+5Pcwp0unXaDnb5g4gTYRo1k2soWIiLglvo8hxczqM7zYq+woK44TBiTLWzLKr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wXwXPxq8; arc=pass smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wXwXPxq8"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso1571770c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790440432; cv=none;
        d=google.com; s=arc-20260327;
        b=XwBT63R93UrlielduUJ2drguw1TGawzp561rQDG1VsJ5Mn6mkugq0PL5U3MVOBog9G
         KNhAR4jBuMPqKPUniQtfuJVczuIXHltKtmqLG6Asnd5WzFk0+1Y8U7wieQrMZKc4qzRA
         1imQOr4KiQICkQw7/F++pCw3AO9H5Yu+ZlLKvIu0WvWbHaIXIg3y+heDU5mi+FcyylVk
         cc+NvCro2p6V3TDFQYwbbsu0E68wkq8gk1ENgMKxWlx4pKx1MeraWHz82git/ZjY7zXX
         zVYqxpzF45AUmwd1AENYM7nP2mmd5Xng3R+nfUDqiPdu/N2QbTg1ScftJiqVa1TJfIrx
         YcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b0XpmOFe6/DninkPsX9rJe4jnQrFNvNUbe3nYts01Nk=;
        fh=UDbGlqKTDFEfT+Hlf83d15py2vuD5H3JB+hBqtorySk=;
        b=WTZ6o9BsfugcQPl+CW67ZI3kRnnAyv8C7SW1c/An2APEEcmE+53ttBtJ7vxRtFOT8S
         7ot9pwR/iBfUwXSp/r3Xi90HvV0spP2W9YlKTiloe6Gsph7VxNwrm7ioFXuD0VzlOmUc
         AvB3Lt3m/IEUpAK7eJarPsmTrWN6R+XL4MDmXXOJmt3pPsrTdUSFFqwXDlX4DsMqEVxD
         a0fv3x12G9Jv/Xe1px2XM3YXUt8gZxRYIdgMex51ZK+r2vzSs2CeW5eJxoj4ILJB6mt/
         COr0VFJiGXma90Kqisqf0Z4pKu2tOOZc8DfqTAQTwImTBM1f+tuFhtGUxWRdKemhyps8
         JfEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790440432; x=1791045232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0XpmOFe6/DninkPsX9rJe4jnQrFNvNUbe3nYts01Nk=;
        b=wXwXPxq8kw3v0WfK0KAYkVqyGo7gqysBW/T2oakDTUkS9EAm89NlI3GL4Vvl176wJN
         I6xFpx72SbptgMIg16hVYNNJEwZNV8cdumDU5MDm7Et9c92osgblXjI45TtvL91fi4fG
         IcG/TQzvoFc3f9YpTIsUAKk2acikZPpq1fOSNAweVjtkQOPsaEX8oHIgm8RQCQUAg9IT
         R06L/5q3iofiK6m/FifnfcN1uPqZjD8SOhbDBanctF9znwWkEwWAIxii5EfSNh3VJPVU
         XiTc9elj5IGoKGixmTSjklnKKd6KdjtWtw+/iJPgVKBs2qB0s2BwmXe1qKv2BTpV2TTQ
         phIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440432; x=1791045232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0XpmOFe6/DninkPsX9rJe4jnQrFNvNUbe3nYts01Nk=;
        b=NqAAik31TI1G7tjAQcOmtWAMn0MQblsN2YsEC/4lAyucXO/6twoxuEWiFoFwGHAC1w
         v7ayS7+v6v6HVuleKFUUx4bQTD8yAK89sj4HCIndHDzCMFWwedygjxtCGaKa63nTIA0a
         txuQEJw5JWIjwwnoR+fGhUq4BJkPDNtQfZwXYMNRqby2SzhmDP/lTjg0l36QuS4MDJ2R
         y2nBucrT5CNbnkOXuxtLwqkn8UQ0DbXv9xn6v7K+Ctcw2ixlpAfmqR+BP1wpi1RtTvQl
         VckDcblf2P7aidlxulrog4mXOeoJbSzAIS0lnVDtKNtt+2YDijDR87qUolMm7s4R7xXa
         CcDw==
X-Gm-Message-State: AFuF++mrtUMoNwPhz/Mc+7Zza3FtQKA6sCoBRwY+zZPLRhOEFTPE9g7z
	/5tpfjj6eFfumZ+ZpLURGc/2l+eZos5eV1qflpsgwS/ju4nWinN7cIaGm3nVebSD8PCMP+36eki
	ckSQTy3c+rEu9IMwZzba5XqNeF1WGjja0Lr77NvI5ZKFr6SkbklKmgYy3Gok=
X-Gm-Gg: AYBFou1mj/Rlb7XaMV/rpc+1tEp56OLbX+yinrDIfJftY6EyGeAYsrCXpKE1grFb3WI
	WGI4U1ZBMVLD4uOoh38AOfXkXK6alxBSwRKp7GhTthDcJ/8KZDkT12F0uvX1Fqmejfs9PqtsuHk
	AX3WPQuQP1Dd5WWFo3pjzGXrVQPkIHVso+noxbzqQfsOLoMPX7Xo83PquoNjHZZG7eOOThCamVV
	mfZRAlLEH5+Obeu71fHWe7ZiF2fMbTh9uPv5J0DV7Q96QAuAjiSTeM2SjoDoLDLZazKIExOyzXb
	gZj6cejEOVlFjw2a0yhAo4fhts0UUjNqwdU4ZdLnhPcEs3rfhIbxlo81Aux1tygREd8EjWx7m0v
	No5hlpUziM62YHGbsqk06EkYzAe8RH1LvZNYRHph4N/I=
X-Received: by 2002:a05:701b:4214:20b0:143:2967:c0b0 with SMTP id
 a92af1059eb24-146cfdcf1eemr3458975c88.24.1790440430893; Sat, 26 Sep 2026
 09:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925164801.4047844-4-ardb+git@google.com>
In-Reply-To: <20260925164801.4047844-4-ardb+git@google.com>
From: Ard Biesheuvel <ardb@google.com>
Date: Sat, 26 Sep 2026 18:33:38 +0200
X-Gm-Features: AclHuK9bHL_E2PKXmTyFBP-1bEhs0qwjBsawlCJGMHxdqyjInNCy4nzJypeABQA
Message-ID: <CAGnOC3a74vJXSVsOcsu4VA5PMAzNOwwTbR=nevqb+JNZfKF5mQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PCI: Allow non-prefetchable BARs in prefetchable windows
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 6:48=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The non-prefetchable window of a PCI-to-PCI bridge can only decode
> 32-bit addresses, and so even 64-bit non-prefetchable BARs of devices
> below a bridge compete for the scarce MMIO space below 4 GB.
>
> The PCIe spec notes that marking such a BAR prefetchable still permits
> correct operation as long as the entire path from the host to the device
> is PCIe (PCIe r7.0, sec 7.5.1.2.1). The same applies when the OS places
> a non-prefetchable BAR in a prefetchable bridge window, and so this
> series permits that unless there is a bridge on the path to the root bus
> that is not a PCIe Root Port or Switch Port, allowing 64-bit
> non-prefetchable BARs to be placed above 4 GB.
>
> How a host bridge treats the windows that firmware describes as
> prefetchable is platform specific, however, and so this is only done if
> the host bridge has no prefetchable windows at all, in which case all
> prefetchable bridge windows are carved out of non-prefetchable host
> bridge windows. This also means that devices on a root bus are never
> affected.
>
> Patch #1 is a preparatory refactor of pci_bus_alloc_resource() with no
> functional change, and patch #2 implements the relaxation.
>
> The series is based on pci/for-linus, as patch #2 touches the same
> lines in pci_do_resource_release_and_resize() as commit d58384c22739
> ("PCI: Fix BAR resize for devices on a root bus") queued there for
> v7.3.
>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Link: https://lore.kernel.org/linux-pci/20260910143440.3865663-2-ardb+git=
@google.com/
>
> Ard Biesheuvel (2):
>   PCI: Add __pci_bus_alloc_resource() to allocate with explicit flags
>   PCI: Allow non-prefetchable BARs in prefetchable windows
>

Apologies I appear to have done something wrong when using git
send-email. I failed to
cc linux-pci@ and instead put the patch filename in the to: field.

Please disregard this series for the time being; I will follow up
later this week with an
improved version, and I will try to send it to the correct set of recipient=
s.
