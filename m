Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520026;
	b=oKMhk0++Q4ZxwTc5kxz0/exBNJp82p22TRkZWUJqwiPVExWZn3BwtjF/mD3Ccd2UuacS
	 f32o/BAI4U15dsSzTWTPxsezrND6kqoIPmnhdpRX7euyDv+vDbqj97cysMd0CPgesgwUs
	 pIJe6vx771ItNqIJ6U8Dcp/Sv/YAh3D027KJY3VgiuxbUwt8cFxaNFeK1fihgQs/9rBKF
	 YX8OtCBW+TplwS88SjZslG2vZuz9qyhLugnkP+4TtPbvZWKGX8W39RmS9gf8uMcqpPBiA
	 fU0HhJNWxezROD4dNkyxTGFdj+t/OcN7r6jYTbHru858ikA18fwXR4N0A1558e8WTXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
	b=FHo747nnvsPF9W6blkyj9x8F+tLmRRHGnGIUbf2fUPS0ukhGPHMS22R8OJOqrm2oUYXN
	 L2UOwMbgXraUeG3k6MPNLp1LS8SEfvt2FqhTswV6JeqT55eSa0xVMEy+avn2ogZGpQ9bB
	 3+AI/a03Nn78ABr7BXu+uUiXZ9FqzB93NgA0YgJ3omEZxCsS8AL6jqOIKqKh170RqAdSg
	 /zD1nFtbmd9aEj4UQFhNNLd9yBGdgzgmuqH81y8drPOnIGO+IXYKyOvfQLjYTecdyS1sy
	 uoQw1zUfShRbgeVaPLW0M0TftSQfRQXJepo35HC0Zn+UXr2mHl5LO2XS/ZXpnCbk83g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IqQicUBc;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFCF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IqQicUBc
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so145756a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794520026; x=1795124826; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
        b=IqQicUBcHFfASsPeC/FaWkK7/Crm2L2UYyn8/PxIFh5d3NQfwGTsj1ea0yYEQ647ZV
         /ccaegp04k9hdkyY2Ail6N4rBeUM3LACMz8nX+7douczOTVskMzZJ6rF5iaIrVQm2heW
         JeAJJRZGwbkWIX4oCdCOf9PAKsBXWkvG0Qf/0hEZ5qTZmjRSXZseI6akOjoL+PPSYmfs
         n/o355gYSqEM305OphinxwQkhxOcncDRdESkE1XHs1UYEEh7UGYPCzuqJ/L28TVUC0U6
         aJlfLAOYc0LEA5khjKc7nJefwozvr0lPgi0RdEjsCmQOzXego5h4dYanuiOcrof8EvZv
         aU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520026; x=1795124826;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
        b=c1Zu7KMIdBLNS2JRr+nCji07rBPSA8e3QZ/kc2k7XDCqi2nEdoo5hTYLh5Ay6mTNeh
         RxOsgOXrcJtbNpSPK3RqZ0hcyrUuVoATjGSPj3NkM1Gqz2pEqZ35mYEbxiHd6xTLUGba
         JQkkUuxRlv9QJCZEuWgvRAeka4AqEUX4Ge57syJS+zyNeh363ZJv3c9NRt7kXhxy6Fhn
         MDf5PGpdXS8P9eHVErHGyetZEd7mydF0xnSZlbG++QTVcCATSA/AgXFZKx/gYeHo5KyM
         fkp7koZ3Om/8kCrzwcTYROpT1UBokFFY/Dp4P9vspIboe2FfziDHKqum8e0h0G70LEck
         rz6g==
X-Forwarded-Encrypted: i=1; AL+hErGXHro8THDh8x8XcR5U7FjCwF99TVxwyUeA6g4w3gVHuklFshSKkYYw6ymWWfN8vmi2I1rJyMqXSSm9gs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B0enLPlDtw9+6fEZr9JjftQSy+Ciw5S3yDsgjKY/maIfDJpnf
	jUsnlyEiGbsOqSTVcUMI+qpkcLwpKd859XyOaM7AS8H3SS5ggeti8vHn1X/EwnI8Dw==
X-Gm-Gg: AYBFou0GE18iRcD64o9cZVXhKWSuh6gZPlEyQBHBaS/4xCP6vWkVg19R/XsfrXiqnJG
	JmBQLwYr3+g5dnCT/kwDpdLN5Bjnw9ww70XYQmmLhXjBJDyJw/n6h3f6lc7rT/qDyHrhziMfQNU
	C2lnLiNHMd4PaUK6s7GYjw17dF8Inp0Rq5L0QdJ9RXthHA4XUs+d7iC+9AOpw5pCeNA+vAa2GNj
	JAiuhzpJ1exiG6Xtc5aIyOHJCfSE5OO+W0X4UEDU6KOYEgcPmMX5cKC974TLR9XppqDXstsxr2q
	v6Fkh/TC4DrPmrVowq0iSka56Fctypfb550DwV3yxmdtT/1jvt10MEpULlEHIYd2Saf8N2CFT1k
	i/Y75gpH0t2ta7Ght0y/xwE04nvuuopziPLmiUTpi6KGZLEkKU953QzDXxpPuGfSkr+0p4BDdot
	OWAjqy+lnhjNsh/pQ3zMqi4wIMc+qh6OjWFNAbOnAhdpbcD5u5C7VFelobp0+uFr8rhY1HhT2v5
	c3C3T7ny46Ts/kDnaBKu2WYe38BCrd7+GMX1L9+x6drnIrO1RggOv2joj9OzXJm4pRL3vJuGEt2
	rhEvHW2ACX3ySmCPhy/uHZsXdjRfsGZUxkYCJEIWnMk2GAflgFowp2pBrTkEySvQmEJPVH+1am/
	KqOgH1HdylA==
X-Received: by 2002:a17:90b:30e:b0:3b0:97b8:d6bc with SMTP id 98e67ed59e1d1-3b1b0a0e889mr278699a91.16.1794520025137;
        Thu, 12 Nov 2026 13:47:05 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm6493095a91.11.2026.11.12.13.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 13:47:04 -0800 (PST)
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
Date: Thu, 12 Nov 2026 13:47:03 -0800
Message-Id: <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
Cc: <dri-devel@lists.freedesktop.org>, <iommu@lists.linux.dev>,
 <kvm@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>, "Alex
 Williamson" <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Josh Hilke" <jrhilke@google.com>, "Kevin
 Tian" <kevin.tian@intel.com>, "Leon Romanovsky" <leon@kernel.org>, "Logan
 Gunthorpe" <logang@deltatee.com>, "Matt Evans" <mattev@meta.com>, "Matt
 Evans" <matt@ozlabs.org>, "Mina Almasry" <almasrymina@google.com>,
 "Samiullah Khawaja" <skhawaja@google.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, "Vipin Sharma"
 <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
From: "David Matlack" <dmatlack@google.com>
To: "Alex Mastro" <amastro@fb.com>, "David Matlack" <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
In-Reply-To: <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>

On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
> Hey David,
>
> On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
> =20
>>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expected
>>     uAPI behavior? VFIO_DEVICE_RESET (and runtime PM transitions) on the
>>     target device also bracket the reset with
>>     vfio_pci_dma_buf_move(vdev, true) and vfio_pci_dma_buf_move(vdev,
>>     false), tearing down any active IOMMU_IOAS_MAP_FILE mapping of that
>>     device's BAR even though PCI_COMMAND_MEMORY remains enabled when
>>     VFIO_DEVICE_RESET returns.
>
> There was some discussion about this in the thread below. My understandin=
g of
> Jason's point is that the current behavior, and differences between what
> revoking and move-capable importers see in regards to vfio-exported dma-b=
uf is
> somewhat incidental and not necessarily desirable.

Thanks, I will read through that thread. It seemed like a surprising
uAPI.

>
> https://lore.kernel.org/all/arMBqyI4XNfD+q1W@devgpu015.cco6.facebook.com/
>
>>   - Physical target devices and P2P topology checks: mem_bar_descs[]
>>     currently only matches QEMU's pci-testdev, and
>>     vfio_pci_has_p2p_path() does not yet check PCI topology or ACS to
>>     verify that P2P traffic can flow between two physical endpoints.
>>=20
>>     Suggestions on physical target BARs to add to mem_bar_descs[] and on
>>     checking P2P reachability from userspace are welcome.
>
> FWIW, you can also exercise the "P2P" path with just a single device if y=
ou
> IOMMU map a device's BAR into it's own IOAS, and have the device DMA itse=
lf. For
> eventually validating aspects of Live Update, maybe you don't necessarily=
 care
> if an actual peer device is being DMA'd?

The way I designed the P2P selftest support requires 2 things:

 (A) initiator: A device that has a VFIO selftests driver.
 (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_bar(=
)).

So far I haven't found a single device that can do both. But you are
right that theoretically a single device could satisfy both
requirements.

I can relax vfio_pci_has_p2p_path() to allow initiator =3D=3D target.
