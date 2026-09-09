Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75F342523
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922816; cv=pass; b=C1rL5it3kRgmuxglgx3ov53ufL0aC0He3Ajd1iRKshESiX80C7+uLew1R5CtVXdBPUdJ5XRu5lQQNuZaEQb+cDxKBYicPuw65hfG+PbEopzycUWRELFPawfvKdgrjGKvq0b1trHreRitz74MeEx9OKF1TDP7ZfRdpYp0Mh4GGzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922816; c=relaxed/simple;
	bh=XdTIc4oZ+lLZ+9rfLfVE8M/CDDUoEJMVePTOn9JPzfY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFygu1IKHFQmuSe3iF16uQ7d8++yTv8SKjKEWSMTFz4GFqBvf1MVzyfrRboul8Cbb5hYigtQJejWlactQgUUPAnhei6xYhrKhUyg6CAw8Wuxkt3qHCkT4U9KqTRY1w88SevPS2BlpbAeIa8UC708T5Nmc97OTzD7uBYHbi/lFXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWyInKnp; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWyInKnp"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb0so60689885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788922813; cv=none;
        d=google.com; s=arc-20260327;
        b=cL2J80l7X8k8qWr0UTc7O+MCNzR0rGAtgFpIzdjMsdAJ9otMPv7DZDH+kYgrY4UOtC
         EwUB3vOKwMMNWyiuQpVrNV4R0x31l9BySG24+U4Uw379ET82zrBXW5RS6b+Ps8xTtn8e
         Yx40qwyOKm2jh8W04YygW+7YYZ09WuLg3EJEgSE1CeSFbT5EBV6IA9HlBBgSBPCF42bv
         e43gZNFkrBZXzfEt5dcKMaCxZb69qHYOYCY8V/VvTDVFcn8TDhWwdbN76z9PleJ76rCp
         RKeovd/r9wo/zikcbYMmQdtZfri7eTY8woC0WXn+6R/D4LBKniyOkYvh93OGp3vPHKv2
         5rWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=XdTIc4oZ+lLZ+9rfLfVE8M/CDDUoEJMVePTOn9JPzfY=;
        fh=rleIMPfv/8HJUqMI42Iw/lWPlD+bj84/TUjTk4wY4l4=;
        b=safbJYGDwLYAACTePo1e2BDxRRxa/wes10QS6gevy2pYQ0rNNBEKYZdYev28sFpwrM
         j7DYOsJid3f4ufmtfrvxML9VqMRHF9UWEW3lDsMGit8zvNvLgZcSCWOAVGF+jwjJvOMh
         qC8e2gie5DyDhc04ftXsSRTemH1NhtqqaCSJKM6I1mZTVBYSB4ywp1VD9BVQUQyGpT/G
         b7wSSYPtbJE6IIGfrEpND/3k8rNfafAhrtdTDaz1D/0purMDz92fatd2akBjnNNN2V5J
         7PGdog6EKt11HTBLnop1qJwE6kRT3CTFTQ80E0czldAuzskaQJ8jrYx4gM+OjxsuY6m5
         19og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922813; x=1789527613; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XdTIc4oZ+lLZ+9rfLfVE8M/CDDUoEJMVePTOn9JPzfY=;
        b=aWyInKnpkLs8TZyBsz3jS8shsE+rTjgSIllXsZBAvsxrAY5XHbi0RZzFiZekKlNnWH
         o7mJeTF5S5YYpmHdSTaWVw/5po9DXGBnScQuut0sfIQH6/jcy3JZJgDnYPcUKod2bDZW
         dbVTicf9d+1nl/j+oKtlCOjZ2Sgh2dV8X/57ToO+liC3QRcks5f2qEDnAggxGxqpSVsE
         RraBc9zkXR7DCORXg51UrQKfJ60NJxulkj+Il3bIsQ07zovVnidSlZ32v9tVkwX+Cbr3
         9rgHymcSui9B7QXt4TEdp2Jqdu0HuJXIYJW7tNshWTLDHX9tOm64fCGynmx8GkH/eSFp
         SayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922813; x=1789527613;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XdTIc4oZ+lLZ+9rfLfVE8M/CDDUoEJMVePTOn9JPzfY=;
        b=EA+cMjmnBanAjxxvkstAp4BevEcYoMXQuUZClDxPDXkRT9T36kUgReu84Wv8hgZ9Cs
         ktAcvof4Z8pqqOKadmTz2Mf9AvmWXEuF1BucCNua23RTFy01DDNLBLYI+wezZNl2GzQk
         uwH5kAacTmGOHdrcqpjfQ6iJPlaA+sfartfdustwz/vVS0D20mijXOyriK5Src1PaVVL
         wnFM7HwENiMZLOGsX12oOekru749lu0Cwu1A3gRuej8SaPy+wNj8kG38rEbjEkCTuQEU
         CE1/Op8vC7/XahAzLLQ0HvJByftFinTI1M4R81Yqvxtej7yl5ELZyeacRX9rFlZF9nct
         fWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrrk9PpeJoSyCMB+B6bGQL5XfqK9RkF+CIRQBrToZ0XifIVvqLtPRDHmteKURYe45uROW6X2voBYrbBgo=@vger.kernel.org
X-Gm-Message-State: AFuF++ltBYija2PFTlmBkkgQfU+GTqCl+mOAiCoycHFeFgq9zvpzDrD9
	L6k60vl6NljDRZBZVYO5TtAHC8qKLRSpm2k/Kmo4T8EZ6h8nyAzaW56qhe7i3Si6eygPXRUWtzN
	sZJgipKd4PoJ2LyXWGsFDVQ9UzRlp2kg=
X-Gm-Gg: AYBFou2YmjI1T9mKnlJFSkFzLw/RtyqO1QsRJuJa6W6A5oqf0D096NgiXNNYwvpxtHk
	8n7gqW50Ej8TTLIBa9Yut/IBzVjiYmT0ShdHB7I/S4QFXZYqBs2vvdJ4R5yK/nuUmWx+RueoXEm
	aryxScvzm8M0d/MNsWvlsI5OMaN9cwHc5TTvJkd7XCrrlAYALCFccHuYUPrrfz7H739OEq7SuE4
	71U/Dle7fjYIWgnEsfKThGn4hz4SzIHPeC9U2XL/Eho5r6JmcMCY+WkcjGBOSEasGdLTHxByWU9
	dL6swkCDMCg37ICuQcLKW6a8vHs21KRu07G/gRBpos+2mvHp0/bFbxxXnANgR4azGMCjD/UDIdb
	nMyI1we8=
X-Received: by 2002:a05:620a:25cd:b0:939:6d2a:6e38 with SMTP id
 af79cd13be357-939c94a60ccmr496550285a.33.1788922808660; Tue, 08 Sep 2026
 20:00:08 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 20:00:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 20:00:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aqC8FSpnNxxitHtA@kbusch-mbp>
References: <20260825043220.9047-1-subtexel@gmail.com> <aqC8FSpnNxxitHtA@kbusch-mbp>
From: Rickey Bartlett <subtexel@gmail.com>
Date: Tue, 8 Sep 2026 20:00:07 -0700
X-Gm-Features: AcwNN1URJeEI6vN5n3SLQUw3o4dUjE0Z8AbsVwapea8qPKaPu8ioQRo6rmD2po0
Message-ID: <CAAqcVzwV2z9Oi02Mgj4at7Gvy6qdqV=iLBgqTg9J6O7i0KZrDw@mail.gmail.com>
Subject: Re: [PATCH] PCI: vmd: Flush initiator posted writes before demuxing
 interrupts on Meteor Lake
To: Keith Busch <kbusch@kernel.org>
Cc: Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 08, 2026 at 07:53:25PM -0600, Keith Busch wrote:
> I am just not sure if reading config space is necessary vs memory space
> (maybe it doesn't matter), or if this errata requires reading from every
> potential interrupting device to flush preceeding transactions vs just a
> single posted transaction to anything in the domain.

Thanks for the ack.

I don't think config vs memory matters for ordering either; I only
tested config. It has a register that is safe to read on any child
without knowing what the device is, which is why I used it.

The only negative result I have is the VMD's own BAR, which is above
the domain rather than in it, so that does not answer whether one read
to any child would cover the others. With a single NVMe on this
machine I could not test one sharer flushing another. The erratum text
names the MSI initiator, so I kept it per-initiator rather than assume
the wider case. If someone with two drives behind the same VMD vector
can show one read is enough, dropping to one read per vmd_irq is a
small change on top.
