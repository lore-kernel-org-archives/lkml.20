Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626416;
	b=iiCnVdj9vLUDFe2IgzmdFjEhd6EZaFAulYXEXlWpc9woOs9KXx7hV3XI82dv0HaLtpwj
	 Vf4hZdXWZtJ2YC8HLiNchKphzYhvWGIM8XhUsS752WQEB8bljW0xIs8l+Ey5k0otv8/oa
	 auXU0/3g1uW7NTfP1SUQFwqEScU6StSJEJzIcAyKrUfHCyna+NaeCS+Cc5Wx3iLMPw79Q
	 OxEkoErDi/uYmtxVwwy1RYw2/4hlOkmoYt0w5XZku9r/yw6jhMA7yUb4QRZZTpLoZUc7v
	 CnYGlI/KtLrLK6qjgHqJtaPnOYRwGILQKF+WBF8ma34PMFLCJil/MCoWU3tlcev2snQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
	b=CY9GPk0XiuCHjnKPLo5g2wq4LlfDuL7jU2Kf3Zy9o8S3neAK9rQH7JFLJ0RcwpdJIx2+
	 B2PBmKEiiExtY4NWZrHdRh2Sje08ZTExId5bugPbZy7xGtEnaK9RCfWoyiQnq2BmnVgmB
	 iJotLkihbB649uDk+223b5P1liuSyo1crjxfWoI26bGz3E+zAjUuUG2ykyDbNsk8ynFbr
	 89MJUR9fRAuXafT60AklhQ4rW2uEJKFZY5w2B5LX0YelZSZgvZpIYRW+z/knWcB1staIs
	 9lBwG3nhAmeSJSyJV8LwXYmxyvYaJMiGl4CG/vxoI0ndj7LCeKfJcPBeLcH8CuvxpYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84355606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84355606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e4c00d71aso139993285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792626409; x=1793231209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=RWEqARLNhr7kM3UoylUxt0c18uD7BW+nnkV6qlrI9YT9zsHGYUDmS0p2u/OOJbEXRO
         SgtdrfJPP8qwXew2mkzTL5kBpez8YAljokMt8HUv0ST5gnPGdO65tJGybD3uqk3DHnFQ
         VEfyFNtRpndd2xu3NGiNoG2k4NxrYb1vsCefZIqb45l7I9z62Aci6eddaiDR77WnIZoy
         eWMUHuI+2+oIZ9KbTn2PavphoEY3W05B528MicbkGhBUCoiwiAwUvz+JZs0AWZblHyFz
         J4NMmzr4UzXCJ11N9e51QR5awZqclvbU5xHpjVK9003y/gTpC40ys8/YEtw5gSAxngqs
         Ulog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626409; x=1793231209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=gaMO6+U4Wo9hDEmzzbI4nPC+weEK9FuGaiBDACH0Phjvm2Q0x8oUD38P/01yE/qrWV
         QRQ2eAj6cXJSjLQKtX75ZlQgG2suGIJBaan+0Dgx/LLIbG3Dh5v/JUc8hCNMVftOGvpB
         gAQqXNzOQIfgoNT/0UHPfU2j9DdAoqDPP9oF1hjNrNm4x1PzHZIaP/T+p/UTx68MT49t
         rOaySuMmpGCjSjgsZfy5Lj7plfDfKf/26YL+Ccrc0fYCMVk9VCn1hiFwve4S7UYgkKTt
         0JulwXBDdPnyUiX+GrPQxPTDnQhICUrwwbTprfvm2y5y68ohv5axbSS8aFbQwQrChxA9
         qLyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKobeicKw8lrXWWAciVIMK2TN3FYptH0/Dv0yd7y1W2Ksg3Ldi0hdSZNDaSm3QPPzgn0R9r3KaRQDTJEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYILiWy2keg4jL+QrcxbS5ZvCI9+ZXlPSqS42B4PmvXY3sk0M3TL
	zAS3z3VZ5RkfypQ0xpmNxqhobl81HDTWB8+MgFv7GGHeaGWe7HDKgnwpw7mwr8Oisqw=
X-Gm-Gg: AYBFou1wsglQIIF3r0tY7trSMqP9pGax7VUyBeUPmhTToZO9CR0/tjm0bAt1coJXV7V
	DSa0ZSqVrhx1VN5TlHzAZKPsjvjD1O1vWA3t8k0AelR4EcbAh26mmqJ5+D8NKOsJoS68NbjVEa/
	aUlWt++G1xrUNuwibOVSpVI/aTgnICm8CTWcksAB+ITHYy3gaoHEKctXM6EekB+wZjD0L6YuaBR
	Q6tqLJpggE57Dv8Mgm2t/59QgWAZVRUELIATSAMZN4mNufbfdcuGxpAbWUJ/yvdOV5NhdHDqaSa
	auU6kjGO4vcmX/OGPMpiw1gWYyVDPtk0Hz0nSN7Q7+WHxYu5ncr33OWcDVP4K60xnbXcc7Yngyu
	1y/xK1n3OyCwioSrzu3HB3npVNU7EtB/Ho7t+yxf+BSBO50F98huZRci47e9podRhg/1BsDZb3i
	EJSr1zCo0rxlnn5IgbVwmYNDqhR3/1VjUbOD7s0IlHk0PU2K7HJeoucWrcMXddovNHCvA1io/GP
	heVFDoakxxFzSKRzluJayEwRKBfahMxyKsXT0UWnEs6b4Vj79EhU+iPg0FcijAT6xOE6Dg9oqyt
	CuHM+wFkGloDpa5szhxlzx3spiCOClisAV5/gC8iyu4/KKXo1/VpM/2y3Ww=
X-Received: by 2002:a05:620a:17a1:b0:93f:22f1:97be with SMTP id af79cd13be357-93f5800e406mr694136885a.72.1792626409239;
        Wed, 21 Oct 2026 16:46:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e2bee2sm373858385a.42.2026.10.21.16.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:46:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJg19-0000000EWG8-3cjA;
	Wed, 21 Oct 2026 20:46:47 -0300
Date: Wed, 21 Oct 2026 20:46:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/11] iommufd: Map memory provider files
Message-ID: <20261021234647.GA3381610@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-7-griffoul@gmail.com>
 <atkO08eCJzLX6R58@google.com>
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
In-Reply-To: <atkO08eCJzLX6R58@google.com>

On Wed, Oct 21, 2026 at 08:17:05PM +0000, Samiullah Khawaja wrote:

> With this approach, silently skipping holes during IOAS_MAP_FILE means
> iommufd has no tracking of which IOVA ranges in the area are actually
> mapped, which complicates unmap and could also hide a bug if a hole in
> the range was not expected?

I think if we are going to do this it should only work with iommupt
and iommupt should provide an unmap that is compatible with the holes.

There are other places that would like such an operation, IIRC.

This will have to block an access reaching into a guest memfd mapping
as well, so that should be OK.

Jason
