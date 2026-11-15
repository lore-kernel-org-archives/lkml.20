Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794724654;
	b=MgMBjd/ON6mx+8sInDos8AXIKtVYBOv2LDdjsU59zfs/oZWUAeba+xiLdqna8gnTQGjC
	 qvoi7l3fiilFSTCv9AACpolPBXwxxjNW/vrJlQ/Pfd/pqLkfs5bYwLCtrUtnseSDNYdQs
	 xBa9xAAe2NOkWP/BV+KRU0ZLmrizZvcGSFXVEETfDtfnXQrqshUMMXEP6fqcBLRQScL9R
	 PACMAhuMf9Fk/S8vKqQz+YrZp0EkOD2T7aaY2Xe7tS9zOE1eo6szHdCLy9huDNZDr08O/
	 0Brq3qTm1h3+9ZlHX3RVWi1aaJ0zBzZlcYlxFXhikL4JcCoSiKGrh/IF/VAzHHgyCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794724654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=aE92BuA/q+u7mWs8kchTDkcjs1m/i8lsv1ezZ7OruqU=;
	b=z/g19GIS+1Q8d8VikFFaAGj78ofDiiiQbsOy7OQpymAfFVXEMDfmYDPvlUdepVgJBFtF
	 fDsUnJzea5AcuedB+D6eypAZLiwoDQ0a/+r8RHBfHtwELZ8RcYlM+GJlqAyp3uFNIpaoY
	 itfQ2Nhu6WbnXpb6Jkp0sYdfJL9r8Qna1LBCe6OvsMauz4jgChcjIwM57tkb/Pxah3wKi
	 gtyDlGVZiFT7Za07upb235wZtRPf3+v0RR3C9YveEW8ayocvJfxPk/IEE+4+r4GpG9/35
	 d2/O9VDsjR61nf9CK9BR9PrEW9NJNGgXp9N8yDNo8fFdnmlAgzLgtbCxNFm/eagzdjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XLzHgoV3;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197FC606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XLzHgoV3
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c42888c50c4so127614166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794724652; x=1795329452; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aE92BuA/q+u7mWs8kchTDkcjs1m/i8lsv1ezZ7OruqU=;
        b=XLzHgoV30EX3XK+IKPAkxf1NIb5iub/1+QP9OZESQPBT/nbZSwd+vhxPRSYjPTjEy8
         6pNOTjUDI9xA9TM6UgpXg+rhOfPSJIgkglyhPEkwUDvSB9xqbwLBseo1rMmEJjTL2oUV
         bMsRramqEqNAkvIFvyiaR5Dn1APgaZwx9nL9Tcoo0MdGVE4UZMCOPNcI/R6Fbh66hBnt
         aK995BtGsljPmGs66zYNWiPNrNOhigAehP1DM+QN96lq0GSJ2OkQWmODo/4PTzveGJAW
         7ufVF+ADmBv3OtDogn8ht793IGrIrf0wleGy5TY80sCBku0zeWx8+NOzMJ4DEq/wspYV
         UCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794724652; x=1795329452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE92BuA/q+u7mWs8kchTDkcjs1m/i8lsv1ezZ7OruqU=;
        b=bkP7l6y39W9z7rMYhUKWPa7K4jRJg8tvSBVVH/eBjlnlqePxqoESIJmLEUwHivrqRV
         CsIVMmeGRgPK7Qxn/35LGqHxWEvg9TcAJ9zVushqshIL5YZ/K1hYxyUqXYwD1fn/mQhw
         84G+vDcEIrSSS9FWft6qDI28BCgNvxKxR+/AnFjDgcjIWQLQd4HDg8RffM553qj6PnbM
         HcpLoV+WCE9LKUqSr6f8jlWRxktDo79o1oBNPt4qkayQmJ5pZvqOPSo0AS/eYxCDCFZI
         hA0JKY1F4Fn3hFE9mxxsPpVVRrpElyjxqeF1T5VaXxR+Topfbv6ckK4V0L4XGuBYS+xy
         xmug==
X-Forwarded-Encrypted: i=1; AL+hErGKRAuqvl1cyUn18G46MsccL3rg264fHKdV87jR/iZGSpTfgJg5orrAO8PNXek4SaqwSk8DZqt+6qoG4uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wSo3kmQMoZuWihXuooOhyGLyQ4tyPCpU9bYk0m0OkBNgsgMfn
	RohZh9bRSaL8BgvJ1eRG+i5x30kzC3iDUnIPizWjZWHXC7ySYQFlH9BONrHWOkhGjMkNHv3UPGU
	VXfgzmYubuZ7Zz+UEag==
X-Received: from ejbge24.prod.google.com ([2002:a17:907:9098:b0:c46:7bd3:aa06])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a714:b0:c42:5363:38dc with SMTP id a640c23a62f3a-c509637e20cmr533164966b.25.1794724652053;
 Sat, 14 Nov 2026 22:37:32 -0800 (PST)
Date: Sun, 15 Nov 2026 06:37:31 +0000
In-Reply-To: <DMROZB8DPEWD.W2BFC7JIBVZP@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <20261110050202.529473-3-tarunsahu@google.com>
 <DMROZB8DPEWD.W2BFC7JIBVZP@google.com>
Message-ID: <9huzjymepplg.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 02/19] kho: block: Record the entry size in the block header
From: tarunsahu@google.com
To: David Matlack <dmatlack@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, maz@kernel.org, will@kernel.org, 
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, loganodell@google.com, 
	arnd@arndb.de, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org
Cc: kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"David Matlack" <dmatlack@google.com> writes:

> On Tue Nov 10, 2026 at 5:01 AM UTC, Tarun Sahu wrote:
>> Add an entry_size field to struct kho_block_header_ser. On the outgoing
>> side, record bs->entry_size into every block header during allocation.
>> During restoration, derive the entry stride directly from the block
>> header instead of relying on caller-supplied dimensions. The
>> kho_block_set_init() interface remains unchanged. A zero entry size,
>
> Since the entry size now comes from the block headers, incoming block
> sets should not take an entry size at all. I pointed this out on the
> PCI patch (16/19) as well. As is, every incoming path still calls
> kho_block_set_init() with this kernel's (outgoing) entry size, which
> kho_block_set_restore() then silently overwrites. That makes the
> callers (e.g. pci_flb_retrieve() and the LUO session/file restore
> paths) read as if they iterate incoming entries with the outgoing entry
> size. kho_block_set_restore() should initialize the block set itself
> from the incoming block headers, and the incoming paths should drop the
> kho_block_set_init() call.
>
I agree, responded to the PCI 16/19 patch.

> Please also add an accessor for the entry size, e.g.
> kho_block_set_entry_size(). Users of the block set need it to check that
> incoming entries are large enough for the fields they read, and that
> the fields of a feature are within the entry.

Sure, Will update it.

> [...]
>
>> + * Each block header also records the size of its entries. A newer kernel may
>> + * append fields to an entry, so the kernel that writes a block and the kernel
>> + * that reads it can use different entry sizes. The reader steps through the
>> + * entries with the recorded size, so every entry is found, and it does not read
>> + * beyond the recorded size of an entry.
>
> KHO blocks can't guarantee the last part. The iterator returns a void *
> that the caller casts to its own struct, so it is up to the caller to
> not read fields beyond the entry size. Please document that callers must
> check the entry size before accessing fields that may not be present.

Yes, I meant the same thing. by having a check on entry_size reader must
prevent itself to read beyong the provded entry_size. I update the
correct the documentation.

Also, I realize tha, after checking the base fields using offsetofend,
for any following new feature fields, a entry_size should also be
compared against the readers offsetofend till this feature field for
required fields. Incase reader does not have that field and
kho_ser_validate passes, that means that field certainly is optional.

I can add this also part of the documentation.

~Tarun
