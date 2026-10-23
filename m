Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777343;
	b=o8xtSAtjSxY0EViOuKKg7iURfTkC87mmbNKoxzln431juTpeCLZd3hIpTBJS/nmnBUbq
	 TAOn2VXtNQXhjsicfDhnKniwr2kyW9PhLmE2QcJSSJYc+F8xYnF8RutlNULkJmjhafLq8
	 MuoXAMx9xBX+8S27GjvKXntOBtktZQrsN26tBxAvaVX2/NTPEP6hAhfPYvMUTtoQPDsLN
	 xmtvGbEotX63YMPMaKQB+5DnYCwAMyOLUGmm1h4mYQLOO99dSLvvq02ZJpvKMloccyZhe
	 sct//LG0tyZFE2gGQBqzlPOzFiAozmwg6x0zgbLuQ3g9z3i9V0H3xzLy8g+j9ZYO0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
	b=qqhxx6dRkZHMwU0Gsz2odspNlql8Bkg2/zGsAQTwb0TdOE9HsGU0Az9FaCoe6ax8mFjo
	 MgTLOHuX45UltTN/nVA9+rW6e8f9LvJdQVy93BsiaGT/d456lAG9E8gnteCgnZ3mDrYtj
	 FBcAi4ysvcgQtVkWREnwu/mdUfKmNJWjL13KHUvuIt5lDyIWzEzD8kbGSyrpncoHGD+0N
	 ywjvLClvJVnnuXdiVlLdN8GcgdmnEZQx7ZNJWENu7e9pJN3pM8CtTcUWTsXnTcfQv8ikI
	 DdgFwSlPcExrTsb4ELv2CeCzLi/P0UdUqsq+LPxOosegNU8nHYIGYuk4jq32nx1TC4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qE15pYgN;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE10C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qE15pYgN
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso809135f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777341; x=1793382141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=qE15pYgNtOgyK2wp9uhHmPW3lpnIrQjWDDouCy3JYbd1IPAGnpkiQ1sFjBCfeqsgVk
         11lRWEucebETVSgkVRwe4eQ7IHe8OlPrizWnzae5mEN51Lz7LmMQAvfowgfp7pp9VjSY
         8ojMFcQ8Y/cMXl9Vl5ClHIKs8MbSDwSpdyrxKk5eONs/+iNwEGuTjszhx81xmGle2j3u
         5SttvDKVdVVC6L1H6oJIFjikyY5gkiye6rcli8bFHH5Otyy3QtD+qvimrzBlONJNZ6SJ
         X5NX0lfRgpuebTW3dXrYQ6ah5QMTrTT9+wd/GIR0AgncOrzQqe42eAZ9koOBhOXDH0X3
         DVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777341; x=1793382141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=BVA5IhGm38BqNUZozTadqbV81m6udwxZRvQpg1xqFH6bMZpIcJOZ96gBOvqE/h//Hx
         p6iMcMWpV3vBTccOx3pYjtNhBKgaOoW+gq3QwDJKlw1ILQ/Vo7oNubE3y0At9tsR4Pmp
         JiMeHIJiSqgxfsVNiz/NzLHSjPG54GQyjh713Hsfd4zJ09985UA+QwUHcJwc7qPlG2iu
         tBw0oqOECiVi8HHWLivtgm6nKDsLCfPtmXzDig3g8vXUvE45nka83mfzvyFt6dlulGIn
         SnLeqwRimG0X6zijDibM9XEwKA0mZIiPsZC295B7qF62FuLCQSOZ8/0B3v64I26DcUVY
         pXsA==
X-Forwarded-Encrypted: i=1; AKwUvBwcFAn/2TEi5c+BIkyDrb537TkOVKvYCbgyGbDOs6+5RmfuipJZMZkuT+gLhPd9bGE6amNBaMChxanb2D8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6xyXihJoIbMU5LHmMpreqe6VZ7ZkU4cIz3fA6vU9BHYI0MpN7
	tGEdyIUs/KahgKVkAro1TxQRGqm+GkIfHYWFh38qu7o5hObYlDa7Tz/j
X-Gm-Gg: AYBFou1vHA0lMQWGnm9ROXl8Ru93C3GroNSFvmImMdKqWCgIzTdoSgepeUnBPZZSWOA
	UhxhWakZehZ7ADrjT+BnjeUmxwOJlSnQ5sW2NCNcVWYxNdUUdk34vPATuoOs+iBDE8IXZg+lEvu
	2N1V7uK0PgYZjxTOBLv+z4nAkpSin58GSuxiy5BKQWaT6R0ps+sf08/zxSuMTGy9eVaN47kyFKb
	zMm2u0PxfjQss8Bvp/+RsshPVsoDPUPxhJI9WyzCpFn5kfc9+gXkqP9/MX7qHzHEndVJ3jE3t0t
	Y0+SDhfU683iP5gFC9YMmZFCALIbK0GD8ZQ8CwV+RHKFs7j1IQkO4zcaBjj+3pv+5Brk9NrUf18
	xFFHLtS94ce25bBPV6eA0UlycLFM3YkF0WmaABKhWjjKRC93MBVoyOumCkaPEMl7pNQMG2I8u00
	3XT2UQtZTE4/LuISTajMqz8dN14smktuNq4nPOWJgbp0phcCs2V0oiMT9Mw3p7Ws9Z0hKeMF0yV
	SCkRK0LViQop0iXE0XtkZyNwjCYfBvXfLJjs2mu9Wog16pAhA14EHCfbpDA9e+50bnKaWY/R3ml
	upDrMDdEjUQcdI4DKx47skhz8DZP314ff+16qACk886IE37FC7+tb13oyfl45twBHxi5xhy/TWW
	rpvshIX1t7gz4HEo+
X-Received: by 2002:a05:6000:98e:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48e385af0d1mr4196895f8f.53.1792777340908;
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d40c182sm1118217f8f.34.2026.10.23.10.42.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for stage 2 from providers
Date: Fri, 23 Oct 2026 17:42:18 +0000
Message-ID: <20261023174218.54790-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	if (kvm_gmem_is_pfn_mode(gi)) {
> +		r = gmem_provider_get_pfn(gi, index, pfn, max_order);
> +		if (r)
> +			return ERR_PTR(r);
> +		return NULL;
> +	}

The order goes from the provider to the fault handler unchecked. MPS
reports 0, but a provider with contiguous memory won't, and then a
fault can map a block that the gfn and pfn aren't aligned to, one that
mixes shared and private pages, or one that covers a page being revoked
or converted at the same time: only that page's gfn is marked as being
invalidated, so the fault doesn't retry.

Clamping the order in kvm_gmem_get_pfn() to an aligned block of uniform
attributes, and widening invalidations to the surrounding blocks, would
cover it.

Fred
