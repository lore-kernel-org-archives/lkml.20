Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331941;
	b=E0ut72rUYLNKdUKc3BID0blHEmsNhn5BMWWDRS25yQPgeq/x/w//HaQsQSqwG9MDIL+z
	 vjmBkuH+JdhiF9ZnWDBIcFqWjRODr+RJuNpb8prk5eYE4vPJGh9hMRzcA98zTWE2I/il7
	 eY7sQ91cehFOp67Osg/ZnLVlu6gWKLLV6NWPPhwiUIh9vGlekycIOqyKq8/RcQLcQ5UMA
	 N+9qXSgCBj/4jrrkJzld3/+pphkz5gljPvUyZmfXg37WDb/0fJHtNvRl/VPPp4/jAgSR8
	 ggGQwuPGTYueR5wh0xKXWJ+zfzDQzMWe3R8NKEFkiF0ygM8QmX1lmgjKJeheUAkrVVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331941;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=O/wNfj9zcVudY5TorfEHZYOP0zrjBm5k7fCeb1ImJL0=;
	b=zsdQMwqomL01ENxkeMrfZVtrDkQz89MZnY+wxczgAEtqzcNmvzEKlcTXmlw/8rGr02+Z
	 aDod5pXvZBujRGOsFQZsbj4NJ9efuObcdOIjGPiSWytaI/bBMvq1N3aim3dddEj86CFb/
	 WnBLWvlC4h998AKA7w4HY4cxwwUvr28zOMmSh4/iLn+qkz/bCQU/5Q33t1ExpRBq7v+xk
	 LRVExAD7upSBDd26g84O+phJj4yeLI1FkMJfRWPLga2y8ENi5fbPqsPiXuFGofCx9hHzy
	 Hw5NHPmYIWW/fnmeSwlUhbMLKZfyibSqiQ+Gsz1wtKWkXiXkygQnfR9W0j6hViQ1ckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VbTc9xnQ;
	arc=none smtp.remote-ip=95.215.58.27
Received: from mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E2C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VbTc9xnQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O/wNfj9zcVudY5TorfEHZYOP0zrjBm5k7fCeb1ImJL0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794331938; v=1; x=1794936738;
 b=VbTc9xnQM9DC9RHCUxtKEZO45jaXKNjVl6mGg/xr240xE8cKAkAyBgjDNIE6F97Pjq5oiuhq
 NxpwH2RY54o5Gxr1nhxz06fszpg0+F1JDz0YY1yGnV56MFJ8vPRYcEq2jA/Hsp91ET9otQceje4
 BsTB8N/147EaxZii2vg/AOOw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 42fb087e3f554939;
	Tue, 10 Nov 2026 17:32:18 +0000
X-Mizu-Trace-ID: 42fb087e3f554939
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12793e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:32:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE6bgVwIwq1/lYqIePnj5a6pmPpCa4Z6K6tNGDIP8HLwUhSMhHKqVfRJoAfej37RLa/qS/zY+PE8T89Rac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gdMA/iQBI/iTR1yERyBcdZGHJCuE4quI8zXF81XGg2G2wwMdK
	QUClT1zGxK1JnDU7sFkE+/yN5yTh2sJfKqNuuknkN7kR8O8cF8WL08NGRJnoZUZ9fk54SMQOqGr
	jDEai/lMW7Q6gKunUYBcFRab/oSRCulkD3Y8gK1zO
X-Received: by 2002:a05:6512:1052:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c157db2ba2mr166549e87.9.1794331937194; Tue, 10 Nov 2026
 09:32:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-3-fuad.tabba@linux.dev> <avMoubwqgXbpflwM@gremlin>
 <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com> <avM9i8xWNZ2fU8_2@gremlin>
In-Reply-To: <avM9i8xWNZ2fU8_2@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 17:31:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw-t85cJcZChnuEcTboe9FbLmvFXi+vn3os5N49R-z33Q@mail.gmail.com>
X-Gm-Features: AclHuK9X3Qq0RyJZlRjr_WD8VHNxqnjWuSAxxr9VQ80XC2fWGGeURk5VvSDZtkI
Message-ID: <CA+EHjTw-t85cJcZChnuEcTboe9FbLmvFXi+vn3os5N49R-z33Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 15:57:37 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> > Yes, the acquire pairs with the smp_wmb() in kvm_dirty_ring_push()
> > ahead of the flag store, and the release with the smp_load_acquire()
> > in kvm_dirty_gfn_harvested(). dirty_log_test does the same.
>
> I know it's test code, but general kernel practice is to add a comment saying
> what memory barriers pair with so it's easier to track, could you add those for
> these?

Sure.

/fuad
