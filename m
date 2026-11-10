Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337338;
	b=p9ze9ANLLfXdsx2ud5GcGVod8AH7DV9n1lFCeaoJEPxYgbE9PyLG995IDNP8xDMAUvCt
	 woTfxyOFAk3sA3q0Vks54i5q1KYyNQCKZns1OeLICRH9pws2wCOAP6qvAnZabgyINM0Dl
	 ZVgRE72Fbl5R6xKW/H7aR17svGh7vrsdxzO9LRQEUZdredQ7JFqx2VCLq6fpYRnxFDXNe
	 rrFgbK8rri0VXAba8PFkqP2x4wCeA/0gPUrAnHsbAhahoBU5so4Hgq1GG0YKCx+0zYNkN
	 59zdvx6Pc+Cnfc1YgVCvXKKkjGQEkMjwA7eefOVMDEwjDDuAd0jVSTHtmHz3ttEuDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
	b=ERa91VJETrJpDB/pzMkWUdz8Rw1pqjnLKyZj+00tzy16RfE+5WOJDQq6ustStjoZve9i
	 kuGgO3GXVOuUiRiqIDDiqdfrobSne1xd0MbhZHRXJvl/yZBH6bUxa3HryNIqXFZuCSSwm
	 1dYoHnKAfrinpYPwMxO1GZlC+z5jzbFUGg8qaf5Zns/Q5xj17X+0RMbmXP9H1zfhtR8+W
	 KssgoG2Xe3oIcZvSjQNr6RwpL+dZHEuXiPiIjpGo8HH1I7CBPZzSWZBXHBVuUyj0eyAlz
	 siIhcMcdr26E7Ky+H4KUd9GWzPRlwkW2f16j44xv0p5wlGYNRMsMEQ+VM/hRmO6lkJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qO+JZOY4;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDA606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBDA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qO+JZOY4
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9f6a16afcso5725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337338; x=1794942138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
        b=qO+JZOY4XThqw7+Njn/UYcPIm7ZmOo3MiW+t20KLHVibC+4UuvF6oB0AUlTA5C+Kz5
         8bfjmyokmdpWkvtsirhnzw3yZxnpal6DZh4ctcbQuikaRqogrXN0Fg5MkiFa8k3d0ZdV
         6yHbQWhuX6VDHoqmvKkSeQVgoE06RF1Rh46qLj1+0lLUGq1fvXjYSdZ/wzPg2gJdk5mk
         ri70ob/7Sp1bFE8dTCuvgv7LeNHaYdC667uwY7mMMz+afixjYSayD4a69OskUXzmcrNu
         AXpWknVWVYiL/bjDdQg7mYlZxD1abxJRY2WRtUvcVfj93a3zD+lUsfOsoLuWUOnWKoUl
         Z+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337338; x=1794942138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
        b=kkwkOiteQxvma7XWd3vlpyN2bqd68xXKsTmTu1ja7wqhlNSqR2SXy+7ZOllZ3wSeTE
         RHMgnIc+0jG5cSz+Ud4ZqBZAkLfB5WnkjyygORGKMl4euNzakr1lfBOtaI8hS1ZqmGXN
         9+n+VWLDb7NItl7DHq2N/278iHZZHOcMY3qHkmniudHRd94zAxubZ3+BKJiwpWh4x4/p
         iU+EbSd6b7q4LOPzDO/6WX2j+B85z1J88hSDmjzE2zXm8aYmuih2GathV1y3rdDoq2Mi
         62dGOTGErqHFTsj7cn3l14EJiKG9ERjzGg2RNY0SGqzxvWc7OubPRI4ZJsl3o3UmxTSe
         nZcg==
X-Forwarded-Encrypted: i=1; AL+hErE5ZmWvLyhiyPwWEj/gVoAjo/NbLllj4Kn5m0BbN6jd6tBp69BXXlMwa7eIpGc8kJIMgy01TgqqLfMeRCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LbshoLBNKA9p77CAdq2npr0BBg5PL3QK7AnTQZxyOmAZc++SO
	rYVkhkLCxJwdOXCYu7gr6ZlzdhLK7lGioXnILkBWLgs9h9WJeXxbGiccVg1UPuEpYA==
X-Gm-Gg: AYBFou2mDs9Z5R6Ek1j9bFDR+j+dqRKfG7hAgn73zWg04GL7tNTuSltbvuefnsgxYec
	53lOCQ7hsOrXgzlvbEQi/ysQlkQ6Uym3jhB+bpCncynZDVDVxx67c/Z+4H6K0EtOrL/RaDw1lO8
	IOmfuHwqGPhBJ2yNC39YrNOQXyXWk6uZWbd30mWcnOTGyOjBmpZezgw1ai0MMJleHlnddN8i9bl
	H3jxHN3NxGD4OHIpl8fhYRzeMTb940ctTnGZZM2wG1S9r9O8J12TVRJlUo5MRZPieTUldEBdntZ
	lyTjI9jkXwyE7UwS90mcOSA8W1hfU/ItCycYn0CXA+2LAGG+j434E7j4/2bMfSOeQoWHQPT4XEK
	v5tEqBkGVkZIhj+Ze7lVT2SoxWykK6l3jiIgYa3uL+Bm+EmJJl4jQkYD6j8iUQ02sz4iZ/VJIAK
	BhVjORpDTCWaH3MVXucjw7MSJcLLeWz0LA7yd0pzPSR9e/+/y4kRBRgcA/beGf0hRDXsYdSYv6m
	fpCjHPPda81FZgua/33zNzjokgj4HgqCSMzxy+L28ruPKLedu7o3uStZVIrAdX8w9uYI9mwN6h/
	WrzuQnF9TeVe0EEp3HgHU8s18uNmp45FSLN/LLkx1q0ZC4KgcGuR7rMvXgRhwV3F
X-Received: by 2002:a17:903:1b44:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2edba3e2a10mr5113665ad.15.1794337336971;
        Tue, 10 Nov 2026 11:02:16 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db31cafsm914394a91.3.2026.11.10.11.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:02:15 -0800 (PST)
Date: Tue, 10 Nov 2026 11:02:11 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 04/27] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <20261110185305.GC519525.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-5-vipinsh@google.com>
 <au5T7qouVfxJSDmr@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au5T7qouVfxJSDmr@google.com>

On Fri, Nov 06, 2026 at 10:29:06PM +0000, Samiullah Khawaja wrote:
> On Mon, Nov 02, 2026 at 07:36:33AM -0800, Vipin Sharma wrote:
> > Register a live update file handler for vfio-pci device files. Add stub
> > implementations of all required callbacks so that registration does not
> > fail. Register it with both live update framework and PCI subsystem.
> > 
> > This file handler will be extended in subsequent commits to enable a
> > device bound to vfio-pci to run without interruption while the host is
> > going through a kexec Live Update.
> > 
> > Put this support behind a new Kconfig VFIO_PCI_LIVEUPDATE. Initial
> > support is added for no-iommu model vfio-pci devices.
> > 
> > Co-developed-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > ---
> > MAINTAINERS                            |  1 +
> > drivers/vfio/pci/Kconfig               | 11 ++++
> > drivers/vfio/pci/Makefile              |  1 +
> > drivers/vfio/pci/vfio_pci.c            | 11 +++-
> > drivers/vfio/pci/vfio_pci_liveupdate.c | 75 ++++++++++++++++++++++++++
> > drivers/vfio/pci/vfio_pci_priv.h       | 14 +++++
> > include/linux/kho/abi/vfio_pci.h       | 28 ++++++++++
> > 7 files changed, 140 insertions(+), 1 deletion(-)
> > create mode 100644 drivers/vfio/pci/vfio_pci_liveupdate.c
> > create mode 100644 include/linux/kho/abi/vfio_pci.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5d1b58271989..167aa9d66ce8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28662,6 +28662,7 @@ F:	Documentation/ABI/testing/debugfs-vfio
> > F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
> > F:	Documentation/driver-api/vfio.rst
> > F:	drivers/vfio/
> > +F:	include/linux/kho/abi/vfio_pci.h
> > F:	include/linux/vfio.h
> > F:	include/linux/vfio_pci_core.h
> > F:	include/uapi/linux/vfio.h
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index 296bf01e185e..e8285ad93a69 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -42,6 +42,17 @@ config VFIO_PCI_IGD
> > 	  and LPC bridge config space.
> > 
> > 	  To enable Intel IGD assignment through vfio-pci, say Y.
> > +
> > +config VFIO_PCI_LIVEUPDATE
> > +	bool "VFIO PCI support for Live Update in no-iommu mode"
> > +	depends on PCI_LIVEUPDATE && VFIO_NOIOMMU
> 
> Can we handle this dependency in code instead of doing through
> configs? Are there any build dependencies on noiommu?

I can remove it but then by itself VFIO series will enable LIVEUPDATE
irrespective of VFIO_NOIOMMU and it will just fail when someone tries to
enable it. So, kconfig looks cleaner to me.

Can your series modify this kconfig and add (VFIO_NOIOMMU ||
IOMMU_LIVEUPDATE)? Will that work for you?
