Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776556;
	b=eqdkA+V4IXT0b0dwcGX9b9+knMKSci3j0iyALbeLQJDxZjBJC0ls4keaIGKzyf1mfH3L
	 6rbKanVDh8g/oof6pvQxRCUN2ABQg/g436QoaCs7Jjv1RMD8tABv48oxUe2r/afWNp7q6
	 GtFm2vYX7X1RYS/6D2jUPnbNb30sjvcJcooRWAxzb10JZVZvMOT6PlDwWQ4IxwgiRR1m+
	 lUozoHBVYH8KUIicbHQKVyGemKeSug7bl0y9dvmnMw8pb20akjF+JfFju5jDYpKoLIZMJ
	 2VE7R7NpeB3HWhJIeOoN/4Ud3zqRjDU6C7C8FNFQ8E7AkvsTGWVyqP+edN6U6q0FUNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
	b=v1Uej/9ifSLrQX6bEOWieuUt2/16bc23SvBtztDAuL0V9XeRazHDRoPdv8vYuu2FPclO
	 JLK/uRG4X38VA1/tOekEIVWUFPNgsARiqERo4SufxVuuoLn2TcGUkfXy1kMiA0cTY8aEv
	 GZlapdiZIjoWZ9UeoLYCdaiuhb6C/ADVkNbKtxo/LXNM+5Uw0zcyeBnBqDz9HumJzwCxB
	 m+6UFoxkrqxffz8uSu34NUytjoYtHzY9xOQWjLGdanAyLBdZJcPk64i37y+WgV4lnFzcB
	 kHlC2Xd7rAaZCkvjoLb8mgWgHXoXJ2RGNfbcJ99HvP5Vznllvq5kpUIR0qzzFnX41+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FsXey+P0;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41124606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41124606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FsXey+P0
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so698181f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776554; x=1793381354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
        b=FsXey+P0eeIEmJhBgBeUCGTebbSsxCz3o6QZLKul+LrAXxI5Iq6haR8I+mfQ26X3rv
         jdictCITfezDnQnCYZ7j4HTg/tTcyUC/Drgp3vmWKgBrr8QxD8Lc9OWWfgyy8NXh/aVp
         FU1i0kULfGHjxWSDkzzHhNYPQMA22NfAV96rytMgupGsdGonuZFqafUHqB4ni9qYpDM0
         pMnX6nPNZmJtDzCa3r+7pjhGX+9lIH4WS1e9IAJRnvCXCHaSmtntU37q/aLnIzJzsrgt
         wez8tRl8q/zWBYrqF7uksh+EHPqd6RxIvPagUfBww3wDRIPgVXt5ZOLUSwxJKgSTrUuS
         E6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776554; x=1793381354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
        b=LcJVuTpY2GgwL1dlsqLqmgu7ezQmcRC1ZtVujgIERO+bTVNB6jC6yITBadNL44WHuI
         /7eOsHf7Vs2ezm/YIJebucFnwOTEta1M4dA3EaD0xMPyosmB5Tn4DmXgxIj5bZ/qe/x3
         1GSU3CnMhk3jRjcXMbv0+RDKFqag4HLIKVVtYb/clejviewPPKNgzV0Ihrk0tLEwHhTo
         cQ6i8ad8QF+UnNMlh/icoaIfsUSZ3E8X4i7N8vrP3fA5lsdxXRGpZBvZI4yFF1KiPajp
         42B33KykldDnXjysJhUlHVezywilLLdENup4eE0+Oa39LjyjQFvWYYSUoryyCJU7C2yA
         qdNA==
X-Forwarded-Encrypted: i=1; AKwUvBxFq1syu9HmBiiGSgdyRmhELM30xFxSj0q5QA7fle6z0QvtWiFB7xv4CTb+IlL3ucgF2kdE4I971iX2zxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYImpxkl5NaUs/swILxDneSWMBhPgBMmvK3M8u/DKfEjq4YU+aSf
	pzMTRgLk7v9OuDD4PH0JAFJwAgtPzWaG+BQlu9/eQsVgbuCXb0314TI5
X-Gm-Gg: AYBFou2flDt1/9dCnChJNCS6+TQnX6ti9mSRGdG31DRZ2SecWQ17O+Yn2YAUkdPyx5I
	CcfoaWTZsBaFLX8AjX3o0t9G/0rWV8uUvrfwQERMJEy1nGiUaFchjkoaYj5ZpvgyQJ7MJ8WnSU6
	JoizhPNaA3P13LhxUKm/zBRi6ripG6cvRb1Okdeg79bx8P8t5+0sBBmJtVctaqOl55AvQ6sfX4k
	P4z/o5mLkOkfTeOyAOORYY0vA7+pnp9CAaEqNMsU1TBmW2+7P86YKinvW2dioM918X9/qyMmCBi
	Ib6BEHebWfc68s44KUNs+imK8A/RmCRveW5PPRvz3Hf/Xm+aOEA4FaLu69sVVWIU/py7lnGXU0n
	5oBFP5iP5FCq7OB6r6PxP7lF0BWdCpKJw4tjVzGz8ZW/i9csLLsime1viWfcVcPlI8v1btrLJ39
	AVYOdilfNKh+7mq+dbWXaWUOKNqkL/l5QjdgbicanVtLYUUEd8PXfv9B/74Ab+iCQW8sMAzOQXx
	2Y5HUQQXEIp4MlpdWdEM6iIXa/WbHYGLf0GJeDKiKB6/+RV+8z5mxtU/5hOFd7jYJDPN5S3xgeI
	TcdOVleElaFNrjCPbQ7CWFd2spjlFgBQ8pWyoHWzwtCT+6mPsUczvHtUdvcqZqO9Gxpcz+HP7Xg
	werHWioxeryJQtYmx
X-Received: by 2002:a05:6000:2004:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e387d65ddmr4932292f8f.41.1792776554351;
        Fri, 23 Oct 2026 10:29:14 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4144f8sm1120262f8f.41.2026.10.23.10.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:29:13 -0700 (PDT)
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
Subject: Re: [PATCH RFC v2 34/50] KVM: guest_memfd: Skip checking outstanding references in PFN mode
Date: Fri, 23 Oct 2026 17:29:11 +0000
Message-ID: <20261023172911.17557-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-34-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-34-5dd1dc6c660a@google.com>
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

> +		if (!kvm_gmem_is_pfn_mode(gi) &&
> +		    kvm_gmem_has_outstanding_references(inode, start, nr_pages,
> 							err_index)) {

In folio mode this check is also what guarantees that a private page
belongs to the guest alone. In PFN mode there is nothing like it: if
the provider also exposes the frame somewhere else, say a ring shared
with a device, the VMM can still make it private.

And it is not only this guest that suffers then. Whoever else uses the
frame breaks: an RMP fault on SEV-SNP, a poisoned page or a machine
check on TDX, a granule protection fault on CCA, or, with
SW_PROTECTED, silent access to "private" memory.

Only the provider knows about such frames. With an attributes output
from get_pfn() (see my reply to 31/50), it could flag them as aliased,
and guest_memfd would keep them shared: refuse the conversion, treat a
private fault as a hole, and refuse populate.

Fred
