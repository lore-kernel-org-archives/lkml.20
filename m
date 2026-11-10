Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328774;
	b=eRBoOaaRUYDMeihYRe41V26eSUuu1SntokTq7f2oR8qtsSoOgesIjAxGNW9KTiXUYaZN
	 ycbsDC3MJmfH1790PYfqk4Fx6XKezJpUdFg1UKf9HWEf4iRb3OL37kFZvo5Kwirm6VBrZ
	 C0wuswcqt7n8MsgdDbBg3mpjn+QfRKOEiS+f5finRt4QiSi31uX49aJb41jFCm2Fc3Zj6
	 ijUCWbRfX52DqHvOoyFjYYfxWDJwXeMjIKg/8eM/5sbvh8vMz6pVTi6vgXDQEl3sHxcRN
	 IliIPaAsYvenrrMKIW4g4hDVaBEVToDfxar8buIeANfL6yZisV6EslmVPavVRoCRZOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KprtAoIZUPQy03e7SCEXrO4BhVdW6Lml6VdK8wkVG2w=;
	b=4n2bvxlt2Zg6dif1nCAgIVZP8a+ndEp9A032AE4BKLfhJfyX4k1zlRnW5rgQ/hLWP9rQ
	 ajooynCYF5l+lEcZE5OrOvnJJxEiyr29dfnT8T8auHvbCzAftmQbdEVRD1qBTWdP+r80C
	 FN+NEpfTdHmfkbvrbJQDyAGlPjcCKNACO8P0EdAPcYS4rrne/HzEkOHV743bLxZBFPO+s
	 W8HVevQnb4BhZF4MrsdYphjz15vTq9Tzj9dKiDvw4ezuzFVMjtPPEMaLNHmfwLe5TmqIA
	 B+pF7Uk9tPnFqHKXsglOtIGAiZ11uhAd2g3W4wyiHpcr6t/6n3ZzV6USkw3sA2hjwUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Af3onASr;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822EE60A2639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822EE60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Af3onASr
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1424823a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794328774; x=1794933574; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KprtAoIZUPQy03e7SCEXrO4BhVdW6Lml6VdK8wkVG2w=;
        b=Af3onASrXSp7ZkNpgiwe/Q2+oXpI2XjcCAiLbtB+390MxJDRDjSFaW1jd9q05Yg8tN
         JlwAwdyX7S+G/Tn5f64UiFDiRZlle3R5xR0Jw9PSv3k3c3Mh6pWQZ1CGzhvf+hw38y5X
         dU8RoU0RUVyNKFjWhU9rF0Vf1Z6e73VWXTGSSlYsDn9yMfJsKqoBa9utqC0AN7pUvUvn
         iHzNcnQeTol0BMW07/jYQ/6NveZ+1XR51qNPvL0SG7sBtMz0KYYFVBgzvWx1EUDw7Jym
         huQ7iDW1WlGdR43JlVdcrlnpjIjyp5m2PtmwMdYy5JhTpS5krOGamd/BQhmEp5dJQ1Oi
         hSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328774; x=1794933574;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KprtAoIZUPQy03e7SCEXrO4BhVdW6Lml6VdK8wkVG2w=;
        b=rEywkD49hCEM4OPSfD06zxflgnbUDwAt4WM1KApNKfjzLM9zwM8EUiBNMvfSDRPiG2
         LvsY16Xc2jlwS8/qPRouYCp6OqniEMViaMvayBl96lBFETq5eYHLwk7H9LSj+law5ELP
         8MvgGPio9ekXFcPmtxdxATMA+8uQs8E5Rs6RaEIRtXGqwncXNw+cRKGN1I4110j6Bi/4
         PjjRX5Ol9UnWSU564+5qMi7zwG+OHr6ZzboTa1NrOblb0Ayso3GVQxyvJJGStYQ+OpAh
         7ABVmuPIJqqGax6M07tA2wNEQdrapeXgRwpvZrAzzEzS458k/BRMBH1ROIg+t0uKOtai
         VmHw==
X-Forwarded-Encrypted: i=1; AL+hErGqlT92SVVWr71xe9J2zGWV8GJeW9TYY1V9XKoSeayho2oRRNwn+2+U3642sHbz5fnxNc7aEcmrgrxgyTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1SUDaa8egCfkP7atQ/ysHVc09xS7Db2hDmGM+zH/fLKLDgWNm
	rssZmeRcf0uCVx1ochgvGtJcwHpIQQ9toaM4IAOn25/0OwCk5UuRLNVFo13dk3v8eg==
X-Gm-Gg: AYBFou3PlZodVHhj4/tdR3Azm6Zk1b3oEgglR0fAc4iS0So53g1REQ5zr/iHOAXwwE0
	bpbYXZGBVYdfNJnEBOfSuZJ4OoMxTtG+XEGNWOn9zXmA0g9w4jADx/+1Jb8fItlEY+i/BNYU7Eq
	uxcS3jvUk/N+dgFGmcNlLZ/hf3ePyRoK/GfQA1sNih4ybJ1HO2RGucchnxJAXay2mNMb6AcFcfh
	9kDz3IYsAZSLZQh9VllWYQsUSQ5QpuzqR/iuN0cn+f7BZhOTWyOcnyoSCT2I4T7EswhR8g6UzJJ
	RKWeOfGCj2nQfTeCSl6bvK81O74V81zgYkjMD3R9iLLLXl9+HT1Vd7ic77Gdko4QSY4fpzMGPnh
	QEYf7RY8EzCX4d6e7gL9pSi3xGUzavOJBnT7/cgij6EXQ9MAm9Mcy7ClBqZkWh3u5RSbGyvabnE
	KKDfhNdrG1hruxfz7lTSiOI7dGi0w8qCZXLKlrzxENHJBfdh0EUtT9BzJKoc1/ynzrMVd30a63o
	DrcpcnwEWGOX1qas1lyB3OAv7oN9hQO94Lv2M23WCL8B1IFkmrubxa/h1h5yFFA4p6LHZUOinSY
	aYUEyudTDIZ/o7xR6YAjExy5ZizYy/qmAfBFAPkp8fcxhGMca8wXjYDEB+bPduyQ
X-Received: by 2002:a17:90a:d444:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3b166e3c924mr3152630a91.67.1794328773194;
        Tue, 10 Nov 2026 08:39:33 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168a8de09sm2418499a91.0.2026.11.10.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:39:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 16:39:31 +0000
Message-Id: <DMROGPTP93G4.13PA42UFKZJNJ@google.com>
Cc: <kvmarm@lists.linux.dev>, <linux-pci@vger.kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <kexec@lists.infradead.org>, <kvm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <skhawaja@google.com>, <sagis@google.com>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 15/19] PCI: liveupdate: Add feature header to struct
 pci_ser
From: "David Matlack" <dmatlack@google.com>
To: "Tarun Sahu" <tarunsahu@google.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>,
 <robin.murphy@arm.com>, <maz@kernel.org>, <will@kernel.org>, "David
 Matlack" <dmatlack@google.com>, "Alexander Graf" <graf@amazon.com>,
 <seanjc@google.com>, <jgg@nvidia.com>, <loganodell@google.com>,
 <arnd@arndb.de>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, <oupton@kernel.org>, <alex@shazbot.org>,
 <gle.com@google.com>, <pbonzini@redhat.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <kevin.tian@intel.com>, <joro@8bytes.org>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-16-tarunsahu@google.com>
In-Reply-To: <20261110050202.529473-16-tarunsahu@google.com>

On Tue Nov 10, 2026 at 5:01 AM UTC, Tarun Sahu wrote:
> PCI_SER_REQUIRED_FLAGS_SUPPORTED. Remove dev_ser_size and
> PCI_DEV_SER_MIN_SIZE so restoration derives the struct pci_dev_ser stride
> from the KHO block header entry_size. Drop __packed from struct pci_ser

Taking the stride from the block header is good, but dropping
PCI_DEV_SER_MIN_SIZE removes the only check that incoming entries are
large enough to hold the fields this kernel reads.
kho_block_set_restore() only rejects an entry_size of 0, so
pci_flb_retrieve() will now read past the end of entries smaller than
offsetofend(struct pci_dev_ser, refcount) instead of panicking. Please
keep an equivalent check against the incoming entry size.

> from the KHO block header entry_size. Drop __packed from struct pci_ser
> and struct pci_dev_ser, adding an explicit u32 reserved field to struct
> pci_ser for 8-byte alignment, and bump PCI_LUO_FLB_COMPATIBLE from pci to

Please move this to patch 1, which drops __packed from the other ABI
structs.

> pci_ser for 8-byte alignment, and bump PCI_LUO_FLB_COMPATIBLE from pci to
> pci-v2.

The PCI Live Update ABI hasn't been in a release yet, so maybe we don't
need a version bump?

[...]

> - *  * The size of each struct pci_dev_ser is recorded in
> - *    ``pci_ser.dev_ser_size`` and is never smaller than
> - *    ``PCI_DEV_SER_MIN_SIZE``. The next kernel ignores any fields beyon=
d the
> - *    ones it knows about, and must handle entries that are smaller than=
 its
> - *    own struct pci_dev_ser.
> + * Preserved devices are serialized as struct pci_dev_ser entries stored=
 in
> + * a KHO block set. The block header records the entry size, allowing th=
e
> + * next kernel to step through entries using the source kernel's stride
> + * even if fields are added in later versions.

Please keep the rules for extending struct pci_dev_ser. I'd say
something like: fields appended to struct pci_dev_ser must be gated by
a feature in struct pci_ser's header, entries are never smaller than
PCI_DEV_SER_MIN_SIZE, and the next kernel must not read fields beyond
the incoming entry size.

[...]

>  struct pci_flb_outgoing {
> -	struct pci_ser *ser;
> +	DECLARE_KHO_SER_HDR(pci_ser, *fhdr);
>  	struct kho_block_set block_set;
>  };

I'd keep the ser pointer here (and in struct pci_flb_incoming) and add
the header pointer alongside it. The header is only needed to free the
allocation and for args->data, and keeping ser avoids sprinkling
kho_ser_payload(outgoing->fhdr, pci_ser)-> throughout the file.

Also, please call it header rather than fhdr, here and throughout the
series. fhdr isn't obvious to someone reading this code for the first
time, whereas header is very obvious and clear.

[...]

> + * @reserved: Reserved for alignment.

Please document that this must be zero, so it can be used by a future
feature.
