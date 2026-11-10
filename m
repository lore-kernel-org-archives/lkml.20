Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330232;
	b=vEryZMqnnRqfZE8xtrraA4SALrP1d1O2LWuyR1nsI+F2wul3prHSZr91TcY26wvfgi+L
	 /J6KUgiTzfITBEWPOCGD3n9vBEcs4MD53k2oUfhP/iB6HZtQ697m/NiPbwDnbrUHf3W7q
	 oYOvSILSALRU7nPObuvq6dGYw6Uret+2NoEEFQIfDChlOrlHI4Gum0vRaRv7QtB/W+haC
	 5t8GwGGh6kjzKlW7Zkelh4SKX3Uyam5dQBB+cpsBfbxLWKLJu54NBVZ5SEkeJbL4IM3EC
	 +WlWcg7WBXsfHZMoSp59fqtHMAAKC21OWAoIJthU2I8rYWnrUGLbyZFQWHnmEGmJh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vqBeli1UK7UsB0colEXax3/fZJsEEio4CkgX2Fv7UF4=;
	b=S+8A3hSbAt3mic51bqm/ZfaB3jXZHtZy1Mypq80uMVwR+5nAka6x1Sjlb1A9ZcDPwb3Z
	 tF40IHe3NITd2y3Tkvntzngg+b6QwaNqPgFNVLk/on2aOZpKCTTFJVYErZqRzPu0cdqc1
	 5nn7npG9mQWaINzJn0z/Uu3FBGB2Qb0p8VacDR2grhmC5cR+278S7v2jn8RmZjgkJ/u5+
	 zN9WpsTBeNdGXP3CvOBm5Eqmf6yNzFAi5752947NGcXgzaNLApNbqOQXv+YqY5A/SPeN4
	 f729bxgX7U/8010pRAsiXuI0256gdWj9GBe3nptSD2muUiM4AOiqjMstn8Ab5B9YD0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CqqEuFk0;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A2606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 951A2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CqqEuFk0
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso1708138a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794330231; x=1794935031; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vqBeli1UK7UsB0colEXax3/fZJsEEio4CkgX2Fv7UF4=;
        b=CqqEuFk0AQlgr0+Pai0aviiooV27t9niWrHV+H8eRhc+6PHDFeXh1X96vJxa/Dt36f
         f5Yiz3snbFS8BnY1j43shKrs+nTnOuO5TOpWAK7YB+Leh5xsUkN2q5DbPCq8EWLyDMiy
         SzPOWc1tlmmFvklAq6qlbkiOasGwfDLouqOFbi0kweOwsAx2q/xRkmpeKCHL1pjwIiGj
         wwWVGLFDXcV06SGp6Uhov/nBULclJ3h1Qlve99omyE4gY7ugTdgLPim71rZ86HGq12iZ
         6lYJrUjctnrF2QxlZ+pOeh5J+gK8+JpQT7MfqqujhOFhX/ZmgaHszxt7/F3aM+6Ikrlq
         SbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330231; x=1794935031;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqBeli1UK7UsB0colEXax3/fZJsEEio4CkgX2Fv7UF4=;
        b=r+o1Bpxf0grV/7CpjsKlQD9WmQPWqMbiKZOR1RDpL0+OwLvkYzXDxAui+3FBuZbvtd
         ekMsczNJ30rhD5BhLNZOyqjk663h+pLl05Vk/lhScffKfTSUITUgT2Y+/Q4cTUIs/NQl
         4TQCriNSo9TDr17qZgtYmCt4dhak0yjFD07aJtKHiDJaWrslHbdYD0KbmeaVSj+/SNlf
         /0+NQ29N4JW9KdJeC9M0mHQa0UaY42BXMQqiWf+jKobncOZpl3zePwvTgKDdgxAoLFbd
         0fwli/p2Gphm211LlM3+u8RV+lzOXW9la8wz3wBrOTf19+TqOAqHvseH7fd4adkYBThc
         LtkA==
X-Forwarded-Encrypted: i=1; AL+hErHXiINVady2hmB2U34uUxt3PkeGY5+BM2RviUXaQibBbIYrIFg4cT0Ttackc1OXnxnnkil0+23alNppYS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z826En0vbcEgYMHF+fs/CEUJ2mNrUlg1S4oQ/wAuIYnzFBwp91a
	87MYxFNQYPJa6wO6NzMcOCWVBA6x2OGGPa5hRD6uxQhdVxabL12x+jMFKg0r0ZCdlA==
X-Gm-Gg: AYBFou2Ne1N2QljkKlKoWn1YN7pDJhbpysRFKNkMnCMU1KKZHt9DTqchCJRA0Adbl5X
	sve4rgzv0YXpK2bcmkf3RZWtKIwzGnp2+hh7UK6kTEIICo1wosjNMO3k77mkPHYBiQUhTBackL4
	a3VOksW87TaBu/Bu+Jc6LdyPqf/9EOxL+XgAbJTE1gSBriQXmcYy2ltAOTOJR2kbXz8dk2HQ2Be
	S+uEtSA9UtIpO7khDh/8xA6p4OEbqCskeEVNZdMbSorgn6FPgYdKOMXFznTRg/em3I3xvtc7Qx6
	r4ZhPcQuH11I6E6/00Hddo5L1F7gUnTD41yzC18vHOdFJviUGZoa8Y1VhG7+g8VZiCksMffbRjV
	i6wRoG8FSQ6wPfv7TYEIdsZBbRhEfGgnVe7KijnJuhnTxegKhkV1BMdLKRtpg/3EWYaAgdPEnFf
	BlPFapNW9qp15qP8jUqUab5leEAzxoRZrkrnnVd+Qh7G/s36h2y1n29nq2CCmnLJtNAtJ8BP9SO
	u3CTRQIIjK706J23MOmI3F3hRgodPxFWtUf1H7jXobTQ2bIGPUZQ6JYQ88i/gPYXFHFtqUYQB5V
	rCkaZd4euTdqkXp5319DsERHRDXzM5vtwTZYnZJW/yuKdMrDGQMPLAJyTjS+p9dB
X-Received: by 2002:a17:90b:524d:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b166cc14bamr3213232a91.15.1794330230055;
        Tue, 10 Nov 2026 09:03:50 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm514293a91.14.2026.11.10.09.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:03:48 -0800 (PST)
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
Date: Tue, 10 Nov 2026 17:03:48 +0000
Message-Id: <DMROZB8DPEWD.W2BFC7JIBVZP@google.com>
Cc: <kvmarm@lists.linux.dev>, <linux-pci@vger.kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <kexec@lists.infradead.org>, <kvm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <skhawaja@google.com>, <sagis@google.com>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/19] kho: block: Record the entry size in the block
 header
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
 <20261110050202.529473-3-tarunsahu@google.com>
In-Reply-To: <20261110050202.529473-3-tarunsahu@google.com>

On Tue Nov 10, 2026 at 5:01 AM UTC, Tarun Sahu wrote:
> Add an entry_size field to struct kho_block_header_ser. On the outgoing
> side, record bs->entry_size into every block header during allocation.
> During restoration, derive the entry stride directly from the block
> header instead of relying on caller-supplied dimensions. The
> kho_block_set_init() interface remains unchanged. A zero entry size,

Since the entry size now comes from the block headers, incoming block
sets should not take an entry size at all. I pointed this out on the
PCI patch (16/19) as well. As is, every incoming path still calls
kho_block_set_init() with this kernel's (outgoing) entry size, which
kho_block_set_restore() then silently overwrites. That makes the
callers (e.g. pci_flb_retrieve() and the LUO session/file restore
paths) read as if they iterate incoming entries with the outgoing entry
size. kho_block_set_restore() should initialize the block set itself
from the incoming block headers, and the incoming paths should drop the
kho_block_set_init() call.

Please also add an accessor for the entry size, e.g.
kho_block_set_entry_size(). Users of the block set need it to check that
incoming entries are large enough for the fields they read, and that
the fields of a feature are within the entry.

[...]

> + * Each block header also records the size of its entries. A newer kerne=
l may
> + * append fields to an entry, so the kernel that writes a block and the =
kernel
> + * that reads it can use different entry sizes. The reader steps through=
 the
> + * entries with the recorded size, so every entry is found, and it does =
not read
> + * beyond the recorded size of an entry.

KHO blocks can't guarantee the last part. The iterator returns a void *
that the caller casts to its own struct, so it is up to the caller to
not read fields beyond the entry size. Please document that callers must
check the entry size before accessing fields that may not be present.

