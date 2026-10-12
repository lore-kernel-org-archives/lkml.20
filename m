Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B9497B96
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817641; cv=none; b=AMeFvy2wi59aF80uRShV96r5Cwc0FC005pGNLosuhmcbUHw5SStUqA9tIx2HHAew99pG7Opr/kPPZ/U5ZRpCPd8T3r6iq5uMJW8Iu+YN9ycFR7bt37P4rQXO0FpyFAFOUijtBs5Tla1DI5r3rzOT83dXWQfGsF6PGbVVd0Q9MZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817641; c=relaxed/simple;
	bh=tsVU21nxAD5GAzHrBR7QE3ds3Y9VaK8s6sj4rTQ/imc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qebWM676FN+VP+PDyMcPvmqvdjIrQaylz2LbjGNkuk+2AykUe3+fTe/Srhy/RvY1p/zgpN7XzBu1/Z4OsQyAf6RV1rPbcT6WPDx3U36J6YkSXet6pphD7z+5d9w4y4u0SZBKF09CQhpHSxIcE7RHfUjIwZ/GebNmqIdMu1Lmspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyAGQb79; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyAGQb79"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c411d6615so1372041f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817638; x=1792422438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsVU21nxAD5GAzHrBR7QE3ds3Y9VaK8s6sj4rTQ/imc=;
        b=LyAGQb79u9R7nttKMdtpi1fPGlIprpgO1689zl1kD4q9v/P9aIA9FyvLTNRzqFikU7
         8UfrtJ1F/z64nyCqVP0vEykm1I6IDNUbhx1wn/yIoe1qlAJZPW9am9eb0WhXzBoIelI9
         MSQN3ORBsfYyhEGem0TxoFRCGo+DpjeD8jZky4EUJd2YlQM9fP/ot1eoVbYVgTXbzZAv
         1KD35A+sZ8s7hz3Kp8xCb/QKo1KxZJpqUHvJ7KQh/yyxVN0VPIzmyAp6t/3M1rKnbCIC
         4FKfRV21UWUFXOBiSPlE+P+hrxUgmDQUgKr1tD3j0PtJTepy1r/oRPq/Vx7RhLCy8f0e
         glpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817638; x=1792422438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsVU21nxAD5GAzHrBR7QE3ds3Y9VaK8s6sj4rTQ/imc=;
        b=tPzGB8+iaJY7Fk7BBhTYP9gexvu/W3G45+g8Mt7IUop1hc7INSCnU9/HEQNdFEw2Se
         SATKctPtRyoLQcr0QlAMPs9K5hE/0oUhWGD13bJ4kzsokq+S5qpRPkwOUmZC8r/hoGKz
         z071GuaWiWfMim9GUGRzO90ulPFC+x3oQabDBsrwpXNeiVNSxv2OzE0yF3H9YVhx6sI1
         Fv5HyMhBH28ww/ebxIarM0OmcLjF7vkkV1SbR0hc75BQBsdGfASnpbsfgRefjSNDomjR
         Y0SAaalf3NzQV5UjVsibp9d+D3U6Yztj625mqqu+AQtKmnfO+Q+qdI7cQs1C5ZCi0qce
         1utA==
X-Forwarded-Encrypted: i=1; AKwUvBzkYL+TGockpTnO9g4ebxz7QVSOOMy8FuWWqUJnf0v014Ux8pplX+XKKCwyxBg+XmeOvMbFpzYO56SaLwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYISF3Q6mnaJS/jTzKvK0yJTnWhtaI0A29COAxwPJexW5bcUixLK
	+7lfUVBCWeyIucI9owurClWnwFCngUzYISCpfT5dq87oBWZzqq4W87K9
X-Gm-Gg: AYBFou2LK06ozB+DK1HCs6mrmzMd247ggBelu+7TWvxzR40AL5QuemXbK7vP++80rRI
	qBCdeUD8RuOy122ruq0xqVXaSer1UpVVKsCwzEFeAjx1dOZf7TQr3CFzAAqcg9fyQMXs7ukJz4L
	f2bNrwZHwR4aSyAnaB7vbwzr09nzfcIrxi5Zsi+gMpi7FIgjc1CuNfkYv7YZAfekroPCDeg4x68
	etdrYTs9Hhjt5Gb5wMzHvx9IfzbpYKzFVcd6Bii3v+yiNhpfxmaAYcDrT4KJ63bB4DUu85EzwlB
	xCJJL2sDXdwcTy3Um92+rnj2IfO8IybkUDIBvSKWLb5AQpsJ36rW1Y1LYu4PPQR5qiTzdufw6O2
	34igT9wCLPZE+/FnqMP8BdrR+q4zSYbBFB6gQI1Mm/aAKEtlc15Xzx2/FHBsE8ey6KGclTzqTGE
	TgAKyttbrOqih68dzK/MKViSgacNaaG5x/hCs6KfCUHSoTUvgb9bdS+zhV/oeI936YpTuZ6R1vn
	eZYOAq0TVnwzYx3L6qcZQzYwICSICIl+ndIzYfoabqnjneV7SEP5A4LpGJMW3qJMkgHA0Dsw5f2
	lYYKFb3ZzLKwmKWpKzcOEJ4+HA1eC4YVRsrU7xqIu6hCwA==
X-Received: by 2002:a05:6000:29ce:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-48dbaadb050mr12203015f8f.12.1791817637606;
        Mon, 12 Oct 2026 08:07:17 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ddaefa06esm3451088f8f.20.2026.10.12.08.07.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:07:16 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] mm: Memory providers for guest_memfd and iommufd
Date: Mon, 12 Oct 2026 15:07:15 +0000
Message-ID: <20261012150715.25132-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAEvNRgF1hMz+4ivH6WhsEOLTJGOegYO9AYK6OByYysPp_nVJ=g@mail.gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org> <20261006183235.16576-1-griffoul@gmail.com> <yq5ald8680t2.fsf@kernel.org> <20261012095800.50250-1-griffoul@gmail.com> <CAEvNRgF1hMz+4ivH6WhsEOLTJGOegYO9AYK6OByYysPp_nVJ=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ackerley Tng <ackerleytng@google.com> writes:

> Wait, is there some magic done to make struct pages represent different
> frames, as in PFNs? In your model, the struct page <=> PFN mapping
> doesn't stay constant?

No, our memory has no struct page: it is a carve-out hidden from the
host with memmap=. I meant the mapping from guest_memfd file offset to
PFN. The PFNs never change, only which file and offset they back.

> Do multiple VMs map the same physical memory at the same time, or is it
> a move like below?

Mostly moves: a page has one owner at a time. There is also a share,
where a parent keeps a range and gives a child a view of it, so two VMs
can map the same frames for a while.

> I'm thinking that if guest_memfd wraps your provider, then your provider
> can issue a revocation to guest_memfd (ctrl-f for
> kvm_gmem_provider_revoke in [1]) on the move source guest_memfd inode,
> then wait for an allocation request from the move target guest_memfd
> inode.

For the guest, this series works the same way: the provider revokes the
range on the source, and the target's next guest fault asks the provider
for the frame. Devices are different, because a device may not support
faults. So the provider also revokes the range on the target once it
owns the frames, and iommufd maps them right away. In other words, a
revoke means that the frames behind a range changed, whether they went
away or arrived.

> guest_memfd is going to support preservation [2]. Tarun's series just
> preserves memory from guest_memfd's default provider (buddy allocator)
> now. For your provider, I imagine the preservation flow would preserve
> whatever metadata in guest_memfd (like the attributes in the maple tree)
> and then go on to notify the provider to preserve some range of PFNs (or
> folios). Your provider would then basically do nothing, since those PFNs
> already survive a live update.

Yes, that would work for us, as long as guest_memfd does not also have
to save the offset to PFN layout: the provider keeps it across the
update, and guest_memfd can ask again afterwards.

Thanks,
Fred
