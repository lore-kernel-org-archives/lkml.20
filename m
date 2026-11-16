Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853503;
	b=PG6FWZkeI/UMGLriWr7C0FMFN0FHFBZEYoteINOz4uNwiV8ZYMsFAH2J+h5RLU530Ut0
	 oFZvKqUkiCpkR+HLb/PGFnsspFN0DqytOBqSvYgxnfM/Ij9JdtCmS6RzatQybDV/Q1qjy
	 0NPxya/ZQodKDGAZVhafXcAcTDxNe2ETjbHydLJkxXju8+WVrt4TJ5bM40g/50qf+ivMI
	 FzJwaQZ5O4+xRbrXwKIvfCGEDBjMpw60oB6n8YDJFYPjErPM1xu4S9wjVaEcrdbzFUkd8
	 eTbZJa8ZjyiOswRo0b5b4sdyAEGMhxM69ArdWVMtI6YezMwnJJTtDCyVjZn9gemMgfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
	b=LxOSJR65C/v6UkKWnJ45h3LOAHZ9AHPfVJKxGr8JNMCKomFx9VleuO1kU16rWJ2noZ77
	 7OX2IhiiecqM301c3VHHrM0/kAr4rjrDSnF2/OD2Nqrzgov0ofasNWDbAkIKEaZWMPvEH
	 2pBQphtjgL5pBH7Ya4PMt1iGkYZaFVRraJEChnJw7b5G7+F/mYrYBHWCNq0k7CXWJi+wu
	 JsZzFcytwvNcNQs5FEXEPg+KuIWbcuJtgObvGtKBObLC0oYcAyqjHu0mYROLnsh0dZ+vs
	 NViQwiqxd/UlHnO/GC74JCB7FTis8mSewetZMH2oBA+Ipt8zM8sfGDjnHZe9te8H5Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2luHTnB;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D331606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D331606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2luHTnB
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2efc4a84e75so3805ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853502; x=1795458302; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
        b=A2luHTnBzkGSMF2SIgDNxeNTW+bNvFUE0N2jlRcqRczmzdfRdcN9yBTceU4GEI6kAn
         hfRh+Bi3fIaAUEv1QVrJENm5Lqq0t375pPznAk7/OIdgG1YibB+Qs3xumwqfJ8g5nd0k
         6tGPIUAOHCegV3iOa0V9fxGubHoApxuoEM/xrOxhuTpgwO4kS8hLv9/rEbNyLdYr4kiE
         746Q8+8rNxbMY4cUu2/EQeyEGKWNs2kMUNjwXx3+b/QQq+OLETf+jHbn0FbHZVV6KC/A
         SGedSkLiSxOSdLSFaZk4mkqZi5tkVkbnF9iMk5R+t6kAJqe3URHpGr8RZe+HWd/gWgpK
         n6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853502; x=1795458302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
        b=uGBFWCuzkVfRqAq3FBPbkyc1xZM41LKjmtUB44A/TCO7mMaVxMnvNE7nqzMmUcxEsV
         g2hy1FdDZ0LMbFtolmNOelCI5LJdFenSgqL8pt6tgDhRwchC5546+P+nYVLfki806NVE
         TmdRRBN5nUUhYG2fx2sanoENt8HyD8wYsl6ucTFe72DLiH0MEqVXRCRb8FOMU8jN4wyD
         Qw2xpI7OhQjAl7LgXRz/k0ymosv4FNGghhJ8PdAwdrXO658uHbt+6MA4EG0mdHgQbHE3
         K74uaHSqiTqR5NrWlkAnSa1t4KCWaM6dRjS9FgQsFgNbCBhLoqY2z9FYP5nPm/3tjivl
         4sWw==
X-Forwarded-Encrypted: i=1; AL+hErF/LJThWGaiswpMrxy7RgPQ7vTvyxmgRj8rxA7v9TdiEm9St0lW7X2hz5sWqQisuQCvGDKQPNM3ygr/1s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z30wKrEKODIlmcJGGcbkvlnw8+Kspe0G8lzY8HYOhWOETf3zr
	Cnh4ZJ0rClA0JFOSBUqdMu+f0M485hxGU5JTssT2NX69YrZImcxh8ltGnq0b43x5sg==
X-Gm-Gg: AZFdTZdbvTpQoRN/gNB0h2UJC6KLPdbetXGlBJxyMP99Wh+vwQTWzeWJR3mpMvl5y4B
	rOe0ekdOVGZUBbJ4mZpuuGAmdPHa7FXeMQZ5FwPLNQpZU2wTxUDLmwbjoIArZGxnqEbEtRDFJq3
	4oZHFF1mC5F1m9W7PQ7Bb9nH2yUKUswTZmhw1yFMqv3yMJWLSH3pbCkoQRtIwDn+wm+HKIL2H8t
	pPRTyhjfWnH/3WQG5w0djmYNfNn6EsnQKM7xI8PVUGons60EDT8w3sYwFoPFbehgtxhXHkLML6+
	3zzyh5/05VbuFnhxsYDUnxG4gjzYlhPcsPTdM7mBcT77+7zjk+rGm5K9XObRK7CjAI/wvSwGJyc
	/VhilG/FLe756tCurt45xF3qF1aiQsxLpT08CE4Kbw+BdRYc9PZw49qF9ioqzXAsM4Mijo7nk+2
	uJ7N19H6RKBNgFmLrw0Ku9dEBSy6nwqrfPSbeE5sVZ1njJTa8qpU4W10fOUuVpGVgNm3ujJu15K
	EWMGI/N+8THFuIrEDDnbzO0yL3zJW7n6uhozrvdyT17PvdowZvjxZfWwISq1XFZ1bZxFIBuALFP
	dbjhssCYH75HSswMQVwTJs/IvAC8Qq5PvaRlJu5PmveDjuBpnYOU9aasYb6FkUngt5aXwaGCRrD
	ORm28CKSJPFRwMPWQcYV1wg==
X-Received: by 2002:a17:902:f68e:b0:2e9:73e0:2a6e with SMTP id d9443c01a7336-2ee2b19e019mr7765275ad.17.1794853502041;
        Mon, 16 Nov 2026 10:25:02 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm296668a91.17.2026.11.16.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:25:01 -0800 (PST)
Date: Mon, 16 Nov 2026 18:24:57 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, 
	Matt Evans <mattev@meta.com>, Matt Evans <matt@ozlabs.org>, 
	Mina Almasry <almasrymina@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
Message-ID: <avtI--OIZu5E5sma@google.com>
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
 <20261115231946.GB1239159@nvidia.com>
 <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>

On Mon, Nov 16, 2026 at 10:02:56AM -0800, David Matlack wrote:
>On Sun, Nov 15, 2026 at 3:19 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>>
>> On Thu, Nov 12, 2026 at 01:47:03PM -0800, David Matlack wrote:
>> > On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
>> > > Hey David,
>> > >
>> > > On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
>> > >
>> > >>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expected
>> > >>     uAPI behavior?
>>
>> Yes. Even if we wanted to the locking is doesn't allow trying to do it
>> automatically.
>>
>> > The way I designed the P2P selftest support requires 2 things:
>> >
>> >  (A) initiator: A device that has a VFIO selftests driver.
>> >  (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_bar()).
>> >
>> > So far I haven't found a single device that can do both. But you are
>> > right that theoretically a single device could satisfy both
>> > requirements.
>>
>> mlx5 can do both
>
>Looks like GPUs and NVMe can do both as well.

AFAIU the memory BARs for GPUs would need initialization. The internal
VRAM needs to be exposed (mapped) to the BARs.

Do you think we should have a P2P device "setup" step that can be
implemented for various types of devices?

Thanks,
Sami
