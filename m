Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771157;
	b=26K7RcA0SusKSK/U3eATEfFW886iNFjVz9KWRG6q7HN5shpY968is6P1oUk9UF5HZZYF
	 /YGzCQTT5cc+XIrQZQXiXXXGYSr4rPbmIRM6YKssj4ggWYV8ti0myi6eTLB3HLTQlLDXR
	 VH5jMSGxG1OrobtnELX+J10OjNCEp13cHX4GHJ36CRC4MU+ZMS1tWRWkwPGEjy97kwMsh
	 F7t3HGpXYTkzC9Hg4f7+RjN2u58mau6q9Y76MVCKgBKMvSsy2hwijq81p8CHnqF6thLX1
	 8QwJGxLSoOW8DWfJvjyI1f+dcHlu5rfdLahQe8jdEnj9I/awe33e/yIoTc5youeUxBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qfip9nPMyQ6NKHGpF7rQvQFL04olz8IZl5yoz+w1jok=;
	b=h9W3rZ+nxLzYZ7i7okictwclriTIc/k8N7nUz2DNnTOcrr7nhNYnHQyvnQmzfDpogwwZ
	 AFOcNN012+HKq6d/F4zoN2r1ph7KGj6umc7mKZq/VZNXDzFe2jKVTMeR8PEwMr6E5jYWO
	 fTi8C1VT/IHCX/Z2nu9/bx4y9qc8fwTu2rcsaeb0XCYI4lRH+wI8F5ZcHOJXdnrjjBZR7
	 T8vTOg3I4FdLxOoCa+8WMAJ3gEcyqRbt11j8uvKIffQDorROA5Q6K/5VbQs5khB0Q4NCY
	 TsKiVhvvOuqQBtwCqDaSB53OBYUApGdS/riIYPuEDx1+8HFcIfylFbCURUUxJ96QRaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pOV9sna9;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76989606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76989606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pOV9sna9
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53644b28706so13933741cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792771155; x=1793375955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfip9nPMyQ6NKHGpF7rQvQFL04olz8IZl5yoz+w1jok=;
        b=pOV9sna9TZaCqywtdDI8h+mSGdu3kY7TvcG6DQSaz/wzZ4RWxvzzkBqqhU+wauIVz0
         y7gqDg4Pv98+G/EoG0dUf5Bpk4Cl0e0UZ7LUISdotu9Tsw4EOlJNa9g21e1C+Zf9KMZH
         gYHQI9+v1MeGOmU6kjTdceiCLbZqOiGD/vZZ2gPbf7Lfpg+R46vh7tpjBVmQ5GGunmYC
         VtuXQ6ZEps4zStuYQLp7cEl/vePQpZ5aYQvoiujxoHTHp/fCRUKvmNk27XK19PLiHYCI
         JYluupC4j0EMlwXjgXHC4TBCzVFNeQ1eRj7qeCWp0ln6/w6oJwD1gZkKqq5ddT+khVyu
         ejmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771155; x=1793375955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfip9nPMyQ6NKHGpF7rQvQFL04olz8IZl5yoz+w1jok=;
        b=zV40Ni3Q8Vf1sJpUVzUOnvSpTeEYur5+50ttA/yBH0hgMDJNQ2wcR5HFOQR8/iJQQx
         /2r5XEbA22RqUM+N0PXQkVTSRlo4zwi4qWoIhMMKvGN2r5sVQ+abxjwycE6H6kZqbCFA
         0DxUKT6iMmUPNC3pdah/Np8sxnXKFjgJwjMqEss43UO9RLsAjJMrA7QwV7eqFETFs3wj
         Boaa/roAUua184fli3Rh/zRjj4OHnAxh0EI5dldp1piJ5DJdDbHG6nzEFQYfHLtqeHG7
         7ZLcK+6Ag2RjvEBceaTlcLEdblW6QJi42QBouVjPug3OJhNQYFIwKYyy+6CmmRo2HiZw
         1BYA==
X-Forwarded-Encrypted: i=1; AKwUvBw/GoNxgiyNHHblcXGXTSDYAJiyA7UzQMIDxvX3no8bHmT7r2s7bgDg3b3JjMZCHp7dSZr8k+2fhbFYZeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAJNtpAlpqCeGCpbWXQ8fHgEmvfUDt/9ShBgU936zINAH1FcmF
	nycn/5lRHxK9peOXu7ys6wo7A3rdzkYf8eLlD2pH7QSipFttHENjwSJa4k/6mt7YX4Y=
X-Gm-Gg: AYBFou14sDygrlFqovhyL548Nj4Npe7efQou2+d9o2IZxF2xLrG9n+GDjpopgRFiyO3
	tZJaNHiY9sVQE+6rS1hO9nELpAiuSm1iQgfvFDcMmxTQzIVfKvLhcZQAB0/qznmJDw5A4ea1RAB
	us+o0ABc5fKjh2mu3PUYprzaXbnhhKQ+rdU4lWk3lGtB4wAEgcJzPrdH87cCW6QFSXMEs6rLPTh
	9bmScOXyIp90hfEAuNhK/x8oThEQ89ZmF/XmqQ7s2soqWV/WNHz5gVMpuipmCHPTOCzCX/tgQOg
	9s8/Efcjo0pKA52ctktpM5gAujG89kA63AoTfMMth98ljQKA3qK8g4HUlE3yvYmvWY/unxYgkHy
	OoGQXkFsHsMhG1pYwmOHM93gkWjWHb4FepK5/hXSHJpxAU1e2Ku6ra+vfiVaI4EGxMfCWW9h4fv
	vPTPr+i/jbVrJd1I7q8QNEaVD1eDFZW5y3NYmfPmFejlorTdu7OsKvIiXTWlriYrDTwek07axXG
	BvM/lmulfDldlaoCeqYhS449yzEWaDWxISI9A5FF1XEqru5KNIrX2F+8gozEjcG3PU2hWkngBcA
	yZ5MqhHvd//fMLf8uLLIBp1IFpUL2iu816Yh0w==
X-Received: by 2002:a05:622a:a0e:b0:535:859c:b6ff with SMTP id d75a77b69052e-536c24e2452mr39136051cf.20.1792771155235;
        Fri, 23 Oct 2026 08:59:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53836c78f67sm656181cf.27.2026.10.23.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:59:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKHfm-0000000Go19-0EMi;
	Fri, 23 Oct 2026 12:59:14 -0300
Date: Fri, 23 Oct 2026 12:59:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v9 02/18] PCI/P2PDMA: Derive routing from directional ACS
 controls
Message-ID: <20261023155914.GK3977851@ziepe.ca>
References: <20261007063227.GC7822@unreal>
 <20261007204045.GA783967@bhelgaas>
 <20261009174301.GC11438@unreal>
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
In-Reply-To: <20261009174301.GC11438@unreal>

On Fri, Oct 09, 2026 at 08:43:01PM +0300, Leon Romanovsky wrote:
> On Wed, Oct 07, 2026 at 03:40:45PM -0500, Bjorn Helgaas wrote:
> > On Wed, Oct 07, 2026 at 09:32:27AM +0300, Leon Romanovsky wrote:
> > > On Tue, Oct 06, 2026 at 03:49:47PM -0500, Bjorn Helgaas wrote:
> > > > On Thu, Oct 01, 2026 at 02:55:10PM +0300, Leon Romanovsky wrote:
> > > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > > 
> > > > > pci_bridge_has_acs_redir() treats Request and Completion Redirect as
> > > > > interchangeable. On asymmetric fabrics, a control for only the reverse TLP
> > > > > direction can unnecessarily force P2PDMA through the host bridge.
> > > > 
> > > > Does "the reverse TLP direction" refer to Completions?
> > > 
> > > In general, the P2P code treats TLPs flowing from device A to device B the
> > > same as TLPs flowing from device B to device A.
> > > 
> > > However, in the context of this commit message, yes: completions flow in the
> > > opposite direction from the device's perspective.
> > 
> > And I guess asymmetric fabrics must mean fabrics where Request
> > Redirect and Completion Redirect are not set the same way?
> 
> Yes, in some of our systems, deviceA to deviceB is going through
> different route than deviceB to deviceA.

It is a little more subtle, I think practical systems try very hard to
avoid that since many host bridges do not like seeing only half of an
exchange.

What we end up with is Relaxed Ordering and Strict Ordering take
different flows in the fabric.

> > But I asked about ordering because it sounds like this patch expects
> > to encounter asymmetric fabrics where Request Redirect and Completion
> > Redirect may not be set the same way, and the spec implies that
> > asymmetry may result in ordering violations.
> 
> My guess is that the hardware and system architects have ensured this
> doesn't happen. At least, I haven't received any complaints about this
> series during internal testing.

Yes, the ACS combination is selected to avoid ordering issues

Jason
