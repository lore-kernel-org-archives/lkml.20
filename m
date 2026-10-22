Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691840;
	b=sYaFH5KEZUTaPrtlTU/1eO1bIS27hz/8BsFRKhQlVRqKwKErYtRkRvx8z+cGxCFOu8aJ
	 IuWoGdqTZDg4sJKUhdMvO6C+WTuTRHScN+BJqmZeFWTvAIf10vsFNHL+UrOVBCsPVcP0b
	 FpEFZZ3avXGjSLTnSH8l5hPVCVB2s6MuoG+QDQhw350k7hy1z3eIFXo8jdKFPyvX5epLf
	 K5Ga91kw2/D/bS3OsjFeWLl+3zB02aWyHnf/ixoADVfTed6cbO12tpfQoMvK7gKiEZgWj
	 KPOMf+mcEt0Lr0nrJcDbyN3NDw+UMe+LzQEuQecwhNzu1nspb/O6Zy0Jn3Kwlcso2Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=8EgRcbuDfKORZQpY0utOTTMffHlpWo5to8q3utLizKM=;
	b=4tH6Y0MhQdPH1D2MfeIxyfpp6Mw0Lnn/dF6GK9IBk1GLLOkvtQezESNtyNlwlBx2aaEm
	 vwLKQChBZTBS0Eg+cesT0DFpwz4IwKopeCfP1GuuZTxWP2ZJ/AQxzCePnMRDNSrqjuKGg
	 8miZQjYLFcmGyi2tUwl2QDbzDmsME6/WH6VJ7OyQWQMcbF5bgX+qsr7tUiRFZWfUGaYGQ
	 t7ffxbjx+3FbElheta9HkeQFKkA4v8g0kdGPFcm6+wJNkj6GVk3pS5XD2WNjUvgZnv0xQ
	 jzO6CDHg6Obd6VIsD5pQhe5ZmQxrYyoUQiXlkqBOkIBoD74WhJTBG8VpwusecKi6Syg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WA9JyD3j;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA1606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AA1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WA9JyD3j
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8b20a899fso85795ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691840; x=1793296640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8EgRcbuDfKORZQpY0utOTTMffHlpWo5to8q3utLizKM=;
        b=WA9JyD3j3itUY4lpXFpySPuRa1vB0WMDbXDWzbH5meWjpkiKz8M2ORcecVCQMPW6On
         NZxrCd95AGwvVXGo2wNHowz20f3Y7syCumDLBaj0DE3bwViDTT5DHqk7RRBBguxfrEFC
         goGLj86653STW4eXuGeTo93EvGmQDdLRRJIEzZ16lfAHDcKM8/HI5+n6W4OPJ/4tLkbs
         NwLWZ9Qgya3s6H0s1NOzrjasSmSWIHbWZXPuqlCgHOHYQ7kqcFHB+hBd3GCAARAx7j/8
         p/NAIP6KlLywer4KnwCnIGba7fMS3myOBLfQuC0IKs7/P6nGO+1XrYWZk2zLW4/TS25E
         pqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691840; x=1793296640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8EgRcbuDfKORZQpY0utOTTMffHlpWo5to8q3utLizKM=;
        b=rNU+qUeAi0qupRDzh/Sn4Wrwy2ZWK/1QLm21XDMFyEgaQkauBCbMq6HdNXUwl3RABU
         ianHRxYDyseiF/+nakNEbFU0EGLh2JHT35HV8nbwQ0Ks9QatpId0GcDobIzHT982cTJF
         atYJNJLjqQhAP2zZ9PCYdPaNNqJ5GRnkXsI80HxEdWbG5bCMSlOBaOvezEUHMsxYURN5
         dzz5nXubcQ+SKYPywnBCesyxr7MMGf2hisWRWzfZ1O9eXlwik5rGMyHgDxGAqmhkQ9On
         wOKp4/9jc2/lUA7nC/LoBd88U4CIUQvAyQoBiQK8Yen3JazDwobXt8jeTns9r91kD1R0
         HZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfcewzbiA4ytn13lEFRnzGMxufRR6kibSoSg4PeyqI1zY8bWZ+PKYUb1mYJQN1PqzoQRVNY7rPnueagm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDSyw40G3besggIZ6CTGRarySQ2h7s9Xwr+Gg19DMD3Am6na//
	HZZnBNriawiuPzb2Q60OLkQPSsOjNd45XXPsrPPn1KBfKcFjjvwQwgWL1fABdfVf2Q==
X-Gm-Gg: AYBFou2GIlUJtPQoF2vadAerkVqAu8AobCQgo82vnSoFDPyaSFF5jllj4AliGZ3Gykq
	TfDtKsyPeyxMu6ytj4X/IAe+cwEhJTtjL+9+Rf9nNxBWvwOLGu/jk0ydt5zkGhsD9WsHeqaUhJs
	+UaBblEY0g+vYcp1bSPEV/dc6YNhyA0Zt/EAW1ke0ZhonSEMnSRGGuTcnx8CI9RJuCvlxnkbr0/
	9Sw+/8Tq/ylOwI8HAJtVeFFUExziY2VNl7cBXwMmiAcZDc812AReVAPXhxNNxpsnEzzFi0uvfdx
	sxUWOly2/ARiR3a9Ji8yGvwjVuMzOKccWlTzozrV+pIrIPXIbIn3xBL6AhubGqzQ6AZJw/3tRUS
	4EpqGg0H04Xx7slKoNi28b83/Us/9HqoL94oldQTUE8d2NeKpexlrqSEV8SWzaFahSlXIol4NXj
	DpGZxV4etXq/2ZqEpekHHXJo0nfNPjtn8PSQUlJsTyF94wWkBBygMQR/4/kMANae9RiJEcITssV
	4KvUML4/LlE/+QYFG6I+FZiJBxhI8nUVf6mZKHdEQXB8/TeV2+v1LiYhNtTaTXXEL5GCF3vRkRY
	889LoXz9esySJARvF6ss7Q==
X-Received: by 2002:a17:903:19ef:b0:2e9:61bf:6591 with SMTP id d9443c01a7336-2ea7c33be70mr1491705ad.45.1792691839016;
        Thu, 22 Oct 2026 10:57:19 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b34dadbsm1687675ad.26.2026.10.22.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:57:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:57:15 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Tarun Sahu <tarunsahu@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] liveupdate: Select file handler by name in
 the preserve ioctl
Message-ID: <atpOe-blcgW-uDd4@google.com>
References: <20261021152527.375070-1-tarunsahu@google.com>
 <20261021152527.375070-3-tarunsahu@google.com>
 <CA+CK2bCnS8wcVDbOymBGeJB6pDUkknOpF22EynbwSV=D5=J4ow@mail.gmail.com>
 <atlEdhPjlyTPDWmG@google.com>
 <CA+CK2bAxgtx2gZ-UE2HqwAU8=h9K5RE3xozBs1njgLo1-CaPvA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bAxgtx2gZ-UE2HqwAU8=h9K5RE3xozBs1njgLo1-CaPvA@mail.gmail.com>

On 2026-10-21 09:14 PM, Pasha Tatashin wrote:
> On Wed, Oct 21, 2026 at 7:02 PM David Matlack <dmatlack@google.com> wrote:
> >
> > On 2026-10-21 01:17 PM, Pasha Tatashin wrote:
> > > On Wed, Oct 21, 2026 at 11:25 AM Tarun Sahu <tarunsahu@google.com> wrote:
> > > >
> > > > Currently luo_preserve_file() iterates over luo_file_handler_list and
> > > > picks the first registered handler whose .can_preserve() callback
> > > > returns true. When a subsystem introduces a new, backwards-incompatible
> > > > file handler alongside an existing one for the same file type, userspace
> > > > has no way to choose which handler preserves a file descriptor, nor can
> > > > the kernel keep the existing rollback-safe handler as the default while
> > > > allowing callers to opt into the new handler.
> > >
> > > That is not how it will work. If we are in the .can_preserve() call,
> > > it means the user has already decided which file handlers to use. We
> > > need to do that before any preservation happens; otherwise, we could
> > > run into conflicts on FLBs i.e. FH of different version require
> > > different FLBs.
> > >
> > > Therefore, there should be a luoctl call (i.e via a new ioctl to set
> > > compatability) that provides the kernel with the specs file of the
> > > target kernel we are updating to, allowing the kernel to select the
> > > compatible file handlers. Since .can_preserve() is called when the
> > > user is already preserving files, the specification must have already
> > > been supplied, or the kernel should fall back to using the default
> > > (i.e., latest) file handlers.
> >
> > I don't think that is the right direction. IMO the kernel should not be
> > choosing which file handler to use, userspace should be. If userspace
> > gets it wrong and chooses a file handler the next kernel does not
> > support, that's on them.
> >
> > The problem with the kernel making a decision about file handlers is
> > then userspace does not know what arguments to pass in. We are adding
> > custom per-file handler arguments to PRESERVE_FD and RETRIEVE_FD. If the
> > kernel is picking which file handler to use, say for a memfd, then
> > userspace doesn't know which arguments to pass in.
> 
> It is not the kernel deciding on its own which handler to use; it is
> the system admin (or host orchestrator) that configures LUO before the
> LU process starts, because the sysadmin knows what kernel we are
> rebooting into and the LUO specs of that target kernel. Meanwhile, the
> process calling PRESERVE_FD (e.g., a VMM) only knows about its own FDs
> and should not have to track target kernel serialization versions.
> 
> Also, the PRESERVE_FD and RETRIEVE_FD arguments are uABI tied to the
> FD type, not to a specific internal handler version. They are stable,
> and we can expand them the same way any ioctl argument is expanded
> (via size and flags), without ever shrinking or breaking them. We
> should not play the game of providing completely different uABI
> argument structs for different versions of a file handler. If a caller
> passes a new feature in the uABI args that the currently configured
> file handler version does not support, PRESERVE_FD simply returns
> -EOPNOTSUPP, just like any other extensible ioctl.

If we require that PRESERVE_FD and RETRIEVE_FD uAPI is stable across
different file handlers for the same file type, then my concern is
resolved.

> More generally, we are rebooting the host into a single target kernel,
> so compatibility is a session-level property, not a per-FD property.
> If we need an upfront global ioctl anyway, configuring the target
> compatibility upfront in one place is much cleaner than exposing FLBs
> to userspace and splitting version selection between a global ioctl
> and per-FD PRESERVE_FD calls.

That's a good point. Ok let's not do per-FD FH selection.
