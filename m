Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330446;
	b=qF66qkgMjbZ1q3RuV4D9vluUa0zJ8atOLY0v9RxEl/EtFhvRnjZ+4zUrMNVdtqFar6Lj
	 RcGaOomRs2vgleKy00FLdvIUvc9sHBrsslvrrXqlU8s10d5FgYaOtHKssGor2O+ryMmF/
	 ZGLkYOibg8Re1O4TREBPjbUUXZ9rz8TO/tDH+eXJxGVbN0hIVERO32qtIB+asBDtN/+Bv
	 PTTYvC21AOEMVr/DMG/MmlNTa9Zu2Fgo+wtRiJzsrVm6KjI/iNdExAYX2uOdPwSHAAUyM
	 ZCu6ML5K991e1rHvO2LVVRaiAdA2ZVnrpH5+lE3Q8o1Qe7pVj6v370x1Dm6dEnbZnqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=FNcC9m18UoMJxRcJEPoSUxoKZdU2fxVY/XU8PXnrjcA=;
	b=bS3gjb1wtssnKAKPzAqFsvHfI+xQ/hQyifT4/9+qcb7IuI1PZje7xcXTjtHOElit9jB+
	 /ATzu2JBWb6JHXO5anUHKZ+RgF6h+COUYskBs4fW3OzoQlG8Trd1PemxfYJ7bx2UEdHBB
	 2gOTw6Y6GQ7zyxn91j1bGq/HW9N7ksoNk4iKofF3tvvkP/Hs0pTUGWfUD3K9jM9ptVIiR
	 XRkNggDxx673faNJSJv4TACeOxKIw37hiKcdt1cceywCo5s6dn86ld2MDGNug/hZnKQ/V
	 2C8rvMYDzSQsONmNTrnQ6p8aKJI7TbF7d4xjSVfAeX3g+cnJ1IsxreZYsHnjLx/chsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UVKcRwO3;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228DB606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UVKcRwO3
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1198932a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794330445; x=1794935245; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNcC9m18UoMJxRcJEPoSUxoKZdU2fxVY/XU8PXnrjcA=;
        b=UVKcRwO3ejBDMk8klGa0pwyOX8V3E2o9Z5FDLbNmULmLkseoQWo3Lqy0OuNTv0i92Q
         ZjjYVo9KXE2zdYV53r0tp3tj121+8xjU74d8CsPd7T/ezb0GS32Oj0pnMKjoXKzmgYz1
         O+RYemVJ0UhckajWqJT6SbFntkibstlz/QpbrXg/A4Q20wwQ7hX+udbRjaT+kVWhERei
         LVTIfg/qTgjrELa088mLnh8eLDqBIePCWGGCjuCCKFA4k1sI0K7OyO7Ju718M6mBSoNU
         6TYqsOoIMH6yBuYtZwE0TFkjVgzg3JMY1p5vlkSwdwLpdJ4u9Z3VALtaIzkru9F3/ruI
         xrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330445; x=1794935245;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNcC9m18UoMJxRcJEPoSUxoKZdU2fxVY/XU8PXnrjcA=;
        b=ciPdLKqNKbPZDgN6UiBPNM8bWMN1n0bCIpqSSpJAVT2f3aVpqmcIrghI/pfR1jbt3G
         blq7pEaMUpVgOL5UjjnyIRBc9wYl3D0IZHsrQfAEO18CfHUZTZnNjyM+O0fTISwwztzi
         67YF2JsDO44VLzYYBf/wUL78i3r4pb8zqpwuWj7ptALXp6Ib20LllOqyVS3cSv5Vze6R
         iuWB+7z//4g66CpjT/MJBPCxZOIDVaTWPSiu8T9FP1yFASvKfFx745rJVbtBvrqdPMKm
         gMDndN8Rel6lOMW0IqtKteTUMR6aV4Acb5l933TOGTQSIC+bBp+vlt5JdcYsXJQ8jirm
         bQRw==
X-Forwarded-Encrypted: i=1; AL+hErGMimP6/fLwropdTGWpzE57CoPdvxniBSw4B2c8wIMRdlGxzetTueaSk1dxQ4DfszchUddd0x2ANHxJqGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z87X9IFrt5ibhaH/arecVv1iPwLQn3pMzqG1zBqaLdzmFCs8860
	BQ3PrAF7cOxfoWcJyhgdVhPS7/ybyhrCakswGTma2yXKOSA8IHq3TbL4Jl5PMiVKdg==
X-Gm-Gg: AYBFou3uVQAjc/l2489jzCDNAMc93FA1qB2L6w+vubXLNILwAME0KJxDmdsuilfR9p+
	sfWzluIPtVUXk65MmfQ1HqB9SshiEOVGnYSBldsMFQ8nWWzJrkFARjbpKrRAp8fsd2PTzC0Wh5d
	an1Gh3iD6E/zCTvSkjZzwNEOrLlrQOCq1dM8lMVk8tfKFihImKSe6EPvF05vYIScUMMPBm3wEG9
	LT8CRQ7gBtXSS3dqKN5kXlDKwbRxDblZR4KLY2CXUFtQxl0cq/6v46YSkO9FuoIVm26pc9QUiHP
	wUFlXNyR9nZQiXXWROVkA8YQngAOI4EV8Sv8omzIdhc/W2eF5dXlGJ3zEtHpeOge2AvePAtfMBB
	Q5BuHVDco2+lj9zEi8Hki8B8uaUN2Grt+8E05USYiVy0LIrHb1Cd2XHX0gEnKcxTDx31NQ+1NKg
	I1p99jnN8x2CmyrJO7ziGJ5NfGC1pdjc6/dTDN8zB6sBqi2jk5Azzt47dE93Sjl2OvOmdOkfAgS
	Orv21jGkpsgu6GeP9GsgQRDl5DvTG6Pg399Z2iUoAutM8vCxfcZiZnxe89vf7tjlk+LGixnqFGZ
	FW0LLTaqU8rFfTghAighnUZuJRIUqPYT7+4S8ffY1R8OLb2smwSVGCzXxRzJObfT
X-Received: by 2002:a17:90a:e7c1:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3b166cdb54amr3659496a91.46.1794330444574;
        Tue, 10 Nov 2026 09:07:24 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db56c7esm499973a91.8.2026.11.10.09.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:07:22 -0800 (PST)
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
Date: Tue, 10 Nov 2026 17:07:22 +0000
Message-Id: <DMRP21FATCC0.ARAURXWV85JP@google.com>
Cc: <kvmarm@lists.linux.dev>, <linux-pci@vger.kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <kexec@lists.infradead.org>, <kvm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <skhawaja@google.com>, <sagis@google.com>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 08/19] kho: block: Add the feature header to blocks
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
 <20261110050202.529473-9-tarunsahu@google.com>
In-Reply-To: <20261110050202.529473-9-tarunsahu@google.com>

On Tue Nov 10, 2026 at 5:01 AM UTC, Tarun Sahu wrote:
> Precede struct kho_block_header_ser with struct kho_ser_hdr using
> DECLARE_KHO_SER. Each block in a block set starts with struct
> kho_ser_hdr followed by struct kho_block_header_ser. Serialized entries
> start immediately after the header payload at offset fhdr->size.

This adds a feature header to every block in the set, but the layout it
describes is a property of the whole set: all blocks are written by the
same kernel with the same header.

Blocks are only ever added and removed at the tail, so the head block
is stable for the lifetime of the set. I'd put a single set-wide
header in the first block only, e.g. a struct kho_block_set_ser with
its own feature header, and keep the per-block header to next and
count.

entry_size (added in patch 2) is another set-wide property that belongs
there. All blocks in a set have the same entry size, so recording it in
every block is redundant, and restore has to check that the copies
agree.

[...]

>  		entry_size =3D ser->entry_size;
>  		bs->entry_size =3D entry_size;
> -		capacity =3D (KHO_BLOCK_SIZE - sizeof(*ser)) / bs->entry_size;
> +		capacity =3D (KHO_BLOCK_SIZE - fhdr->size) / bs->entry_size;
>  		bs->count_per_block =3D capacity;

Nothing checks that the blocks agree. Each block's entries start at its
own fhdr->size, and count_per_block ends up being whatever the last
block implies. With a single set-wide header this can't happen.
