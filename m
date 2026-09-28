Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974D37187F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615811; cv=none; b=SW11OETeGqpa80Kdha92ZysQi9vKUMZ+mQcF42ZOAByzGvn+cDjJnFRS8x3pa59+5/o16OzLLutwKz6UVQRwLHkE1u2A18lM95aMJk6ioUpiU104iej7IsNdoecIQ9vEAK9kKYjS0EaIKC7kLYwnVpPTQxAD8jqqaA3rxkPMGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615811; c=relaxed/simple;
	bh=aHAhZatWrqN63rqopsuzMRMmrjRl1erVOZnCz/D9ERs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aU2EuzuwsXiO43tTSSYw7ufCnZjnY2UhOO8UqfwChwN6McZ2wLB+WteJIgkMvNVIPSMOXXAGWiN9BZkKYZlSbexC1ipgWoH1ib5GB/eklN5HlVVyKuomKayXOgEhSGf5iz1OrVltu36tpGZpEBk+4ZfAWMgnmJpWfmHZrnC/0FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yapk7RoF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yapk7RoF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d3b445a84fso2895ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790615807; x=1791220607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nVlRP8UBi3QSgtgc/PjPsjRl9sO+VgQnXuH3S8lXm6s=;
        b=Yapk7RoFBmsEjX5eE+RtnFda3ODPFWKCkJovSMY9EBJS8V/i+JQSYEJwPMiuPj8nSA
         KUI7f7+HawJv0h6JvmLUh/Cx5j2JiqteEAYoQ/sj7ltW2Y1unMI8ex7tTW5cQCRyXbY7
         3ZPAD36xrTbFYt8PQFH02Tcm0Z3wxfN7WMDu3IvlSv3tSrPnJsZK2QzBNPLav+tDIyDv
         aKN2GCtr9CWObSA2mbWrX+JyIq9zYMxBWm2+rn6B0zwuB2uRcJDqCzaYuoYDp/a7cOYS
         g/wefy2wbNBCGe4UQkMQ9ZRZp4klETxNT4saGoA2oISdVpxZpg6Y2qTI6/BbSeDt/XdH
         T1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615807; x=1791220607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVlRP8UBi3QSgtgc/PjPsjRl9sO+VgQnXuH3S8lXm6s=;
        b=l923zvBSn6tgnWDXb41ttUj7AcNVE7XZWb2O1nZRFiQ4xG/z3IT85W9KR9ptj+gszW
         N3XY47NQTYBbbrP7MtmkYsNRIVV+Wz7m4qU2q2dGa1SqHgMJ0V+n2o9rraD60hKUVqzr
         Ppp5GSXqR9FnT25H13n5jDPhVi446Oh41KD/vhXtM67qfzjNEgi+9UWRASJ/Se/Vye1L
         J4Mk8KBSoU9LdTjNAT9M3PIkC29XRIJeMPC4P6kVGMTYfKDKpyykbfmLLOcmX3kH6ito
         yTSObpfSm03mqn/fa107fJV6mAK0nqfu9xP/qn6WPKlm30GnHrO+VctSO0jH8692fIPI
         r59g==
X-Forwarded-Encrypted: i=1; AKwUvByaTQRCD5nFel73SLrNFkhHrnwzVglyOEPmuSv4wWMGNH/J+mJrSc/ON+FFsAJt7l0W9ob/We3xb3e3CxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCuWmFYAe+JX6lj2zFMGeZaAyLd+97kxwvXSWpBhbol4aMMrq5
	V4Cls1xaTOmgdYAfeq2jeIkGMlAjRqzFxnP+HOr5hekvDVp3yuXBKfnSynk10NongQ==
X-Gm-Gg: AYBFou1w1+IA5FkfsGH3G1Kg0wMcInuBzpWudsAgiK9MLwWQAtpbSWJ4UPL+DovMhW8
	uHb4Tr0gjVp1ib3tmx8Dkob+1dZUl5k2qVM6AXd8XXGuXX97Y3lenZm5jmI5dLphpYG2kAAvTJl
	R4tW/klvDrePLJBQbCAGDL2IlwffdTw/jlFOJYwV9VvmE8OeOx4tX/kJW0vcxqI2t/8iwHlXMyf
	qyVNS2AO+Z600PWNXwGmG+ewJymsMjSYAoW5gbaDUEyIKFd6AGzxoxKgyklSuZO6ke6KMS+bOEy
	HQNA6XPQXEHGLQMQ8oz1CDwZlOJmAE/7J8zlWPQN1QguR/2qBkJugQT8pKaTliRfDZkkQemXtDD
	Duswsfly6+DcAgdFeKu4O40p8A8hWycrdj0MQEHt9L+yc/Pbg8+fORG6X84BJXqiIOSz63aK1OX
	VIBdPB96s57N2sXcOqSXnNjmCG/UMyQm3XnUD9k0AXEoqxJ9A4rF9pGZx0yOXSloYqv3rUy+bcR
	zXV6jQXE+D/eXWjndi+CQJis34P7WvJQDjK
X-Received: by 2002:a17:903:b48:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2dfa6194d00mr7813665ad.2.1790615806244;
        Mon, 28 Sep 2026 10:16:46 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm520284a91.7.2026.09.28.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:16:45 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:16:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v9 06/13] PCI: liveupdate: Preserve bus numbers during
 Live Update
Message-ID: <arqg9G8pXKPX8WCe@google.com>
References: <20260918200640.887030-1-dmatlack@google.com>
 <20260918200640.887030-7-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918200640.887030-7-dmatlack@google.com>

On Fri, Sep 18, 2026 at 08:06:32PM +0000, David Matlack wrote:
> Keep the secondary and subordinate bus numbers that the previous kernel
> programmed into bridges, rather than assigning new ones, if the previous
> kernel preserved any device across a Live Update. Do this even on
> architectures that would otherwise always assign bus numbers themselves,
> e.g. when pci=assign-busses is passed.
> 
> Preserved devices must be allowed to continue performing memory
> transactions across a Live Update, so the kernel cannot change the
> fabric topology. Changing the bus numbers of a bridge changes the
> RequesterIDs of the devices below it, which would require disabling and
> flushing any in-flight memory transactions first.
> 
> Apply the policy globally rather than only to the paths that contain
> preserved devices. Bus numbers have to be preserved above a preserved
> device anyway, since an upstream bridge cannot expand its window. A
> global policy matches the scope of pcibios_assign_all_busses(), and
> gives an answer that cannot change part way through the two passes of a
> bridge scan.
> 
> Bridges that do not have bus numbers are still assigned new ones, so
> hot-adding a bridge keeps working, both during and after a Live Update.
> The two-pass bridge scan guarantees such bridges are only assigned bus
> numbers above those already claimed by preserved bridges.
> 
> The exception is a bridge that was preserved but comes up without a
> valid bus number configuration, e.g. because it was reset during kexec.
> Refuse to assign it new bus numbers, since that would silently change
> the BDF of every preserved device in its hierarchy. Also refuse to
> assign bus numbers to the other bridges on the same bus, since the bus
> numbers of the failed bridge can no longer be read from hardware and
> handing them out would let an unrelated device inherit the BDF of a
> preserved device.
> 
> Require that CONFIG_CARDBUS is not enabled to enable
> CONFIG_PCI_LIVEUPDATE since preserving bus numbers on PCI-to-CardBus
> bridges requires additional work but is not a priority at the moment.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
