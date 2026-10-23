Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776231;
	b=ATOMVTaqbzcf03I9WbRwaxhYnsdpCHtjgvPmWaeDQg4x5+swHZw4J/DU4/ap8BUijGdu
	 A/7oKWyYz5u74daX81Dc7gs67tkK5j8BggCZLoPoRMeFd2VSszUsb3WkIax1G3u5H4V7P
	 1tHjSRyHBo6J8pgk+OJFlc7b2ZNpn4Q0/8+2z2rjsPiNO37tGKFmKfbZniafH4RhnE7CW
	 cnQWj+SYKxwCqhYfDXk4DAUcsMufkJfDIjGi6Co8R0rgIMR26mM1oKo3PseRrDfTr08ME
	 QnXvzQKFHdExW7idDZIkUdZQSULzCGTNIFcVzaW67wxK+dp2OmV82t+bnXFc4P6zk5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
	b=5J9IXCAIw7AdhuOAUkS0ZBGthDOCddhiWl5fFPDOZCz4eQ1mtq/WjGGYxMW5Gr8Z335l
	 g30MsyYKEWTtHaHk2Hdq/Sjp8VcnRwVsZvQe1bw1ssHc/MQ59+ZI8HaBqCHQ+0jI3NhcN
	 x1l4ZbVN1AQH8GOPI5xK+fKL+S/neQ+uP9mClES0VVqwTWPV7RWeyoVyWUfbRPwTRpNdN
	 q+C3zhyrRMiQlHaISFN8BNGpPyyDfk3OLO5NsnALqbpRNlKHv3wB5WnrW9yBxxXif7vco
	 jRJbTavzUec3iGqvPPQxlaU1vFHmGPhFEmAXABCPL5EKJGLNggTzk6WFpFABPTiKh5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMFbak2L;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1DF606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1DF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMFbak2L
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a218b13c4bso5045815e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776229; x=1793381029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=FMFbak2Lv2lhOGCjKEw71ctCzxUX3t9FkWqUHf/sC4QitZrRCuemkodjqFDbh1yQ8w
         4z15z4rWbF3wPybQwis3PyyUxs2U8Iyw+mFJ4+9V64wFam2di8sCwgyIRMyi5dRZiVzy
         vspiC+CWDlUBn+exNtdA0wkxcrcYfzf5UE1V8TcNtfqEa7dUGw8ZHKu8DeljBe4vWgMW
         +Yi8SZW6EliRrb3z2ZE1pUDFuOorhmb/AfhW0VsZ18YtOh148nPEd4UBXGky9OlizkBF
         mAkIIK1cG5XIXYwFhwBT/ez0PEpG2OC1Ci5yvpsIFoWKf6uYIj0x89qSftEX2s/X/iaR
         NMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776229; x=1793381029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=HY3CQ1ua5SEMJX3yT08Xx6Evm2aH/bbiSUM75CbJJgH4l3Ri0opFlaBb9IS6wUlDng
         sBr+4QkzQTaZMkYzmJlg7rOZXUHt0ZYmWui2W3rUU5BX/rZwBDTiCeBuGKUMrX3PoPpK
         /v+AJxKyIbOyaNZ4PwFK+hs8aOZNiCEnaajn8N6z6VseOb4hE977iw/55BHgiy3A0R6U
         AttZGLOsl6BBL+GQ+LM4iP20IwsKD8heA+lBiFkRJXd9Wg3MOLs/KaUNK/AJXgmoPQcG
         3+85dhv4GZQJrsGRgjxdrXdu2SGpYkJtGUnexLuFOdZlBzK9Iw4IZjnjcC95IPqJ+SBg
         bSeA==
X-Forwarded-Encrypted: i=1; AKwUvBwLlUuT/qLLou8yVKQKXi1b1ApVT00Os/AFv7YEsHpqPyBfVpD95ed+W6yf53SeJWC1Tz3tv0JN6aOBS2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXd2Yn1PUtJsZsofCh6wJyi8sg39m8R/ekX2wXSbiDoesuCRTA
	hBfN4igMp9cXOqyOE8tuEGqk8UrEvlqzB6uENOb30SM2x4fa0PAZ0Qiq
X-Gm-Gg: AYBFou1JaU5qSO3FXeGSBtdPALse1qWpf+bYe8+Uyzri4laWXdM93s2xX9hr1ozNClo
	6OrJcmi1ijsVuRUE+pwNowiGOo+aOiczO4/M16UceqVcLp8YxHYOa8+Y3FQqnoh5lPlKbrQ/oRt
	/70QfL6i5/nLPB0lx4huJT6kBN76tlEQjd7kVBJ8RFM0lIunrNOn2WAGJIURjj7AvsTWdLCeofl
	HAbN5jObvTKsIZT2y3ocFMSYDawS0PkrVKLq5eS/OCzKqN2MXCQFlbyxgvyWan7eJYlQan7nmT4
	QsR6hfaR3o3tMGbbB/L6tPau9PxZJXdiqNG5Q1eVTc7Qkh2aTnM5elJvrpy0atBOeW2pf8DR5tg
	jsCPCQKp9K5RFEJz8BUkKe/E9jeViN/pAVYuHzraCA8/dQEDWG7WbrMKi8+AMqw5czJEdFfotB+
	EEPzK6FJchy8hJoq8tHnMjohKgmJXSj1J7ZTQsbCp/UDe9P29RrVs+Ja6doDjOieD3jxN9EThhn
	ROFaCOH4ycmPoSCs65xF2cE1r/WL8rwUrO01/5jOyLeTXv3tW0hr3bV2vqCxgv4aBADp3Dj68Kl
	LKbLv1aml7W1Sv3/OheZSp+uaD3ou+dM8NprMHIXiT5+Fr77h9xBlqBNTk37VqE34sdPw50rsBP
	SngYSoY+ht3NoZN63
X-Received: by 2002:a05:600c:354c:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4a211cb23f3mr50233895e9.19.1792776229374;
        Fri, 23 Oct 2026 10:23:49 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a30764e9e7sm17932475e9.2.2026.10.23.10.23.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:23:48 -0700 (PDT)
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
Date: Fri, 23 Oct 2026 17:23:47 +0000
Message-ID: <20261023172347.88443-1-griffoul@gmail.com>
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

> +	int (*get_pfn)(void *provider, pgoff_t index, unsigned long *pfn,
> +		       int *max_order);

Should get_pfn() also return attributes of the frame? Only the provider
knows them, and every mapping of the frame has to follow them. Two
examples:

- Read only. A provider may lend a page that the guest can read but not
  write. I know you dropped this from the sample to keep things simple,
  but without it guest_memfd maps every frame writable, and there is no
  other way to make a guest_memfd page read only.

- Aliased. The frame is also reachable somewhere else, e.g. a ring
  shared with a device. Such a frame must not become private; see my
  reply to 34/50.

A u32 of flags, with 0 for today's behaviour, would cover both and
leave room for more later.

Fred
