Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331793;
	b=HtHqCFPXnFq90+554Otuf1Bz+ucnzV82rVvv0kSXj8X7t/8WGhWRKEuzmaGOx9Slib4H
	 Sgp9YCkXdag4JjYU9wJwPZwmnhDYZC2T6NWGpyLDYpSKrCmMKbe8CILpvHEXu5KgCxkAP
	 Jo1a1lusZTzFOJ6N4JF3LMU8/qSwJHW9MQyDOm/fWA3D0ePJOLXN4jy7QcBkJ8P0KZA2r
	 H8PzZY4vWNMU+V4UcGb9NALod2IgTbjxvHNgFGRkeGwJNuaX/JUcI/Qbdy4eR/veKjRHV
	 wcVbXzilEHEJ5VuCyDNcMXJ99iXtOdw7Jyr0QRwa2xDYcyqMk3flCeyzsZHpO6/VB3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331793;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=5wx+HPVDzMK2ZNFwmp4IvNdPd/griQf8bcKEGlkTO38=;
	b=dyl9SND3eRpG7tWl4JUdQPC4YBv8qprJpAqLENxK/jS4U7YxY3RRGiJY5T2sryBo7P4J
	 Wh/ldyW/8cZyoNtX/diYx/MM6v5DxX2wb5FUvnmn1Lq0nzqT+RFE2GDMdNNLLaPvOYBHM
	 3mql0375xQStHo+jUVV4WDbTNjy11uLQXNTQtGXuH/XraNeN8rMamYyOycRzkt2O/m5nc
	 XLFUZB8B0S8+92yCdLqa80WDW3QgNeDZg7CKezacZjG21Wxi7qSyzN1J6ulEGsXiP3/2R
	 5V8Rb+p8FcepbOPKUVdPiKKl/K8jjZOrbZ/xYgR/FmpeULtJOfXtvvbTXtj8b8ZgH9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iNxGoDuC;
	arc=none smtp.remote-ip=95.215.58.205
Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED7606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CED7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iNxGoDuC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xgvHwTGa+PgFPe0I//hfxTTphupF934nrFHnim+v1LA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794331790; v=1; x=1794936590;
 b=iNxGoDuCsXybkFz0tp2BDXmS1BvdGGx6ISeGLecO1a9j0nwKiRnb5lUp0t8/dD1ddjyvkvtE
 ZdufKCh+lnWxkCAX+UK9QBj+d5npTyJmzroQCZ2g0D36b9qvSqbvx6BcxshAthI0YzYAIldN7pv
 bcm2JMFUG7tpXwNIjtG70dxk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ccade0e85d3fa357;
	Tue, 10 Nov 2026 17:29:50 +0000
X-Mizu-Trace-ID: ccade0e85d3fa357
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12733e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEfP/ji292PO5V2Mz9iFpHMj/f0lN8/3S4AGz8MZoKDtjM4heBCM54GgslqnYc8HW4y67B6fcIpdHeFQgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bW1jjZmbTNo8D/2+0Vm7+5db1ndmZZhRS8CDs8p9CCFJ7igGa
	vpi1qQMrZWr7xz0ZtKNjCbhN5hZvO9KOFl/SolI4b7uNVBALcay98rED210Gl+AHj0ZX3IFGItt
	KYN6iTV3r9qcj9e039Nmu627/iZrSLPEluroO37tP
X-Received: by 2002:a05:6512:33cb:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c157dba643mr143671e87.10.1794331787336; Tue, 10 Nov 2026
 09:29:47 -0800 (PST)
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
 <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com> <avM9_7aWUDJSL3Lq@seanjc-mac.roam.internal>
In-Reply-To: <avM9_7aWUDJSL3Lq@seanjc-mac.roam.internal>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 17:29:10 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzS-=5kKVLD2tH7cvHJXK5UrMkHwHt43oGTz-LfgwnzEw@mail.gmail.com>
X-Gm-Features: AclHuK_8onLfxAou1vV3GX8Fp1YuNIw5KxweJ38CdU52leAU_A1H9EYmOqgJEWU
Message-ID: <CA+EHjTzS-=5kKVLD2tH7cvHJXK5UrMkHwHt43oGTz-LfgwnzEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
To: Sean Christopherson <seanjc@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 15:53:35 +0000, Sean Christopherson
<seanjc@google.com> wrote:
[...]
> Before we effectively solidify the behavior, I think we should have an explicit
> discussion about the desired behavior of KVM_PRE_FAULT_MEMORY when dirty logging
> is enabled.  E.g. the only reason I kept the existing behavior in my auto-prefault
> series was because I couldn't think of a good reason to change it.  But we never
> made a concious decision in the first place, i.e. we never considered what would
> happen if prefaulting collided with dirty logging (as evidenced by this bug).

FWIW, I'd lean towards a pre-fault not dirtying the page. arm64 (with
a dirty bitmap) and riscv already map a read fault on a logged page
read-only.

Tried it on x86 by not mapping a prefetch writable in a logged slot,
so that the fast path logs the first write. That also changes async
#PF completion, so I don't think it's a stable fix.

The loop has to stop for as long as x86 logs, so should patch 1 stay
as the stable fix? The test skips when pre-faulting dirties no pages,
so it doesn't pin either behavior.

Cheers,
/fuad
