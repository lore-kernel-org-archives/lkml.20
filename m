Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347764;
	b=ETucNAMljoQoRbkv8DhAEjNiW/1YafhbrJHfQHBko3uUxrjRQbJn+7gXgoNPa8E/u8RU
	 O38FKU28PInd2GPltabFouvvlggSKoaLCp/FMWBqEVYQayt1jUTkkQWbCvAIicvyIx5Rh
	 tO4RG0ryCwQKWomPtZ/NJ/hEpnNoXiODZvIXQjtcv5zMGTGHNSrrKCqWDTiISHQgxLgbh
	 FK77kMo6UejFE2nhUNBERdPsyHj8Ivhu9TRFDgEf6d7XRnUtQUSKwsdbYq7wvF2mCdg8d
	 9Uvs/DogKUTcNy4DiVjwPrv5wFSCpbnO9TET+jwNaQLr1PGiU1ZgdGsseNnmbunGBvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347764;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=TgSyY4/ng5nLiDGto5Kq5ST6lqpDa6TrnCUDb5pZH64=;
	b=xm3WgLa4Jx642rcDGBMkjhIHD1QqYAo0YXBhcmgSSYUSmIpcehqsa3PWj3IkTzbH+03k
	 2wIwPuUI7skViDdCuiPkmNYbM6Y1y1jCywxeEX6x0zi6q43x+KZaI5+s+eQtSHq1kQp5y
	 /7Kf618now2qgZ7lsAtA8PIKrmFKL+KHCSwJLNX3+YIJR3ZHbQRp9acMKe7zcAPqUqsub
	 a3SPjrdZ0uVfqI34ETi5LakhoYyz5lg3+Ow8Bhl1/jYij5V/g+46jOCWugKQWfikrDFp7
	 aNmnl1+jhhDhaOOMVw0lri1vAcDnfFHsroLYtBzQRAfnAa08V7i+WPGsygWR9C6lGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OLMQoM8c;
	arc=none smtp.remote-ip=91.218.175.142
Received: from mta0.migadu.com (out-142.mta0.migadu.com [91.218.175.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5030F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OLMQoM8c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cPlhkNYw3K0eeAGK/JciXdzV5PYFFrSx544N7IS3wzs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793347760; v=1; x=1793952560;
 b=OLMQoM8cWQTSf8dn2fMdyrb8LXcDJWZ9l/wVEl27yU5obVrrZiDW26ZnHeajRHUnsc9gFCqG
 Klz1gWtRwjhIST2eTIEE9gx2DdHsMGiMAvLIs/VChml9dSWsLc1VDR0KN6qvljGZHH5CkbqA0Z2
 8JxmgB7cqI+U+YGqBP5xr0hQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9a815571a40be43;
	Fri, 30 Oct 2026 08:09:20 +0000
X-Mizu-Trace-ID: a9a815571a40be43
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so3976e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByf29BcBmDzEL0xSe/aL+PcmZAOTcIAlJNU+YKAXaWkq+JJlFfesbnbrxwNL3EXw9W24cboD6/sKZmqkLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM8SocpuZ+0UmjJFj+jhuLj75wDF7U0oK2G3VDyYqmm65iGd9V
	t13unilhsn1qsRFO9L4gsmCrwQf9tzorDVIQ2u6y+CA/NUiFrBAVmUE+ynPgzTESV1EtW4uf0J9
	0AbdB/xYiEvmV/da6D+sSkelh7xKPibW/9dJCxAse
X-Received: by 2002:a05:6512:3501:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5bfd18169ffmr245950e87.7.1793347758933; Fri, 30 Oct 2026
 01:09:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021110700.493315-1-fuad.tabba@linux.dev> <20261021110700.493315-3-fuad.tabba@linux.dev>
 <auPCV6VdMEz4uZkK@arm.com>
In-Reply-To: <auPCV6VdMEz4uZkK@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 30 Oct 2026 08:08:42 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxKeTG26Oqt=jdUqnCrzTNTW49xggCWJRJQz_XdV6prhw@mail.gmail.com>
X-Gm-Features: AclHuK8pOIsgHYiMxZhDJpGYznE2BIP_eKzJt7aDibtxQihZUGQcXEve-pG0JDA
Message-ID: <CA+EHjTxKeTG26Oqt=jdUqnCrzTNTW49xggCWJRJQz_XdV6prhw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Price <steven.price@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 22:02, Catalin Marinas <catalin.marinas@arm.com> wrote:
[...]
> > +                      * tags. A hugetlb folio is marked tagged as a whole,
> > +                      * so its first tagging clears every page.
> >                        */
> > -                     if (folio_test_hugetlb(folio))
> > -                             folio_try_hugetlb_mte_tagging(folio);
> > -                     else
> > +                     if (!folio_test_hugetlb(folio))
> >                               try_page_mte_tagging(page);
> > +                     else if (folio_try_hugetlb_mte_tagging(folio))
> > +                             for (i = 0; i < folio_nr_pages(folio); i++)
> > +                                     mte_clear_page_tags(page_address(folio_page(folio, i)));
>
> I guess we could have skipped the actual page we are going to copy into
> but not worth it.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> >                       num_tags = mte_copy_tags_from_user(maddr, tags,
> >                                                       MTE_GRANULES_PER_PAGE);
>
> Something Claude spotted and unrelated to your patch. A malicious VMM
> using memfd (not guest_memfd) and MAP_SHARED could construct some
> mapping so that the VM slot is !PROT_MTE while the same page is mapped
> in the VMM with PROT_MTE. try_page_mte_tagging() (or the folio one)
> above set PG_mte_lock but a subsequent fault on the uaccess to VMM
> memory will attempt to zero the tags and wait (forever) on the page
> lock. Not tested to prove it.
>
> If you get bored and want to fix it, I guess a copy_from_user() into a
> local buffer and then setting the page tags.

Thanks Catalin. I'll look into this and send a fix.

Cheers,
/fuad
