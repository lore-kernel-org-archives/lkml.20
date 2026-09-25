Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C72343899
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790314341; cv=none; b=CUybMLF6lLiDP+GrkKqqQ7aeAo6UCGq8rM/4KSYm7eAKNeHfsrKmtRAHkyNfy9+LSmdphYsvitX7GKYCBb2XUndL/W5Ut6MQL2/nuxtl4YYGCGT0KyspOu+x3d+UhKc2aPF1VqOM2PfqVvk62TQrsSxoIli/bypeqlae0ZEFAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790314341; c=relaxed/simple;
	bh=OA6Puq8GEsEgmszu2sBjmctnxLzOG12itnYfXkTQdZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKvvDtxed3G8YT45uB9Gs+UdbsqTGb8+uOyEnnpvZ+EHAaNJAuIy+IRXHWoTaru6qacjmLiLj3Rl1vkdLtZiVFkZjHgR0avI8/9YVkSR/mYIDamDGjbk0gFYzjWGusCLMavNrpvW0ABtw7OB1eqsERYNH7K0UGo/KpzQNtpKlb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=modal.com; spf=pass smtp.mailfrom=modal.com; dkim=pass (2048-bit key) header.d=modal.com header.i=@modal.com header.b=JLHsXPRh; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=modal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=modal.com header.i=@modal.com header.b="JLHsXPRh"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so166362a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=modal.com; s=google; t=1790314339; x=1790919139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ehv35jM2xSxwjjV6xaS7dv57/W9hK0TedPz2NPct384=;
        b=JLHsXPRhRUDzpWZQ33K+O85NAnnMuj4hj9xhQPmP20pFllbTQBsI4gRnfQrQfkx0C0
         uCJyPpOkBQxCy2/h2sdrr7Zbkr/oJezByooYjSzid5ICG792Qm3vUcBTj62e5spaiD0D
         0M5UtHRkzdoEzbw8i6pl06zlrryg8FLoJCkGyMNTO4VQp8WzVEUNbub56iju+90/5dH1
         JFzSvejDjAd8BtbfVoHY7u/Oag0n5+wh6HIkFypeU5Sg3xRH28nKckc/cW5C+xTGsnRK
         1v/Ry6UUbV20sVPo9nm0klvBxmu5vbsqY05boRfZrcpvRGBRnbXR/GWTMBlpi5ahShhc
         aSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790314339; x=1790919139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ehv35jM2xSxwjjV6xaS7dv57/W9hK0TedPz2NPct384=;
        b=r2K8m54oDPzgR+V3KP3h6nkyhD7YSGxxmAZPPZc9dCmTZ4ACpE58vSp0SgZBsINzH2
         0gErmH7bgMgu8L0FpuuyFuChxAfOpT+jkyTdEoFmTvZ/W8GitfhnqY+Ai9CCX2ejkNHF
         vKZMVoIfOCO7yzVVfOBbjW95OEMC+9bim3ileV5c43cMhf+ufNS1WHsW3+JcCi0X4LC5
         KwGEjyZC9s9XLerGdn0FQqCkm+uKdqLkNTsjFu7mBxS/w7aDnd4xSxPy3UftTBZeFmRF
         TItQ/j+REPUmNeJ1Y17aeQosGFBEBTZTgl/TwlRe52ViXUCSeuPzCABQhE0fnmHxOWWG
         OS1Q==
X-Forwarded-Encrypted: i=1; AKwUvByfNMB24sG6w3Dsk4GR/Qgc+rqqY90n1QjVhM6M7ZkIVnYiSOk+Wz4HQKgs9FiHtg6K6suvWOe/wnRQIJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++lvqpURnb8ETDxhyBEGP6ArS2EQ7KMCwlnYgYCv3KH2TW0AFGsw
	1aOtMEY9ZNBoihx5VFgMvmU6BfpXFEYW8fHet1FiIHqduDkNlxN5Zo/uQBYD9cAYIf4=
X-Gm-Gg: AYBFou3GhL+pMFMIU0qTSTwwGI22yfiAYnYERDlsBSFyvGv63mmToblPMCJ43VavkT+
	PHaYl7Y7ANCVBdtE+DIuz420tu5aLAnzkGezCRykiOW3Nk90iDwFwYBvevakvsargm4qp1c0vTZ
	8Lxkg5cQb5fY+IAG7MAsD6F5w6g+9g/s1tX3rGu0pvnFpfZ/z2ibLW1xdu9az3zkybbzi6MBlFV
	maPfeiu1lFRPhhi5qhrBXSvSZJU4K7ILSPwuDc2UvL8ZZKrM1lC+blEchenHrng6hToM9Ff9jl/
	QmN02bSOW06iBMCCX5ApeHgNlRURAHTqicW6JLNNbd9D7YnHFaJsdaQcpONLerWUQsJ+I1U4STE
	zWZXPpiPdODvcXMoMcHpVCf0GUs/C8dz6Cvarop5S5HuQ25cxM5hxVgKOs4TkbGs66+s6zR7e5p
	KXUe/gWq/nJbaosfjL74B24WGPG/rYIg5ig6d8zxFVASQJTzPTXvlJoPJnxnq5GwpB31voVbI/P
	yn1hPoVMYgHFfH0vvfVtzh7W7TQbbpelvnaTDWngcTYj0kWDR+ZEEGnUffQ+VQ+RN6wIiX9q9JN
	syBMoNxEsDBTOlPfLHkKVyglKnlwymoHxg1E5W83tTpo3uUm
X-Received: by 2002:a17:90b:2fc4:b0:39e:6c6a:4b64 with SMTP id 98e67ed59e1d1-3a098dfb087mr4009593a91.46.1790314339197;
        Thu, 24 Sep 2026 22:32:19 -0700 (PDT)
Received: from devbox-ayushr-01ed.tail5292b.ts.net (ec2-44-242-192-44.us-west-2.compute.amazonaws.com. [44.242.192.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b4f5b1aasm936305a91.1.2026.09.24.22.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:32:18 -0700 (PDT)
From: Ayush Ranjan <ayushr@modal.com>
To: Jan Kara <jack@suse.cz>
Cc: Ayush Ranjan <ayushr@modal.com>,
	Hugh Dickins <hughd@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] shmem: FALLOC_FL_PUNCH_HOLE vs fault-around race corrupts page cache / rss counters
Date: Fri, 25 Sep 2026 05:32:10 +0000
Message-ID: <20260925053211.2036445-1-ayushr@modal.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <uf7lys6izqrxjsp3tstqxmdok5yy3w52d3bnpkfzyjm7uiyqzr@ickbg3ocvcji>
References: <20260924061708.1645968-1-ayushr@modal.com> <arTdLsBENhrpOyk-@pedro-suse.tail5790ac.ts.net> <uf7lys6izqrxjsp3tstqxmdok5yy3w52d3bnpkfzyjm7uiyqzr@ickbg3ocvcji>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 09:15 +0000, Jan Kara wrote:
> Can this be perhaps somehow related to the fixes in partial large folio
> truncation Zhang Yi is working on, possibly even the tmpfs bug in handling
> of folio split I've found [1]? It seems large folios are used here so that
> matches, I just don't immediately see how those bugs would lead to the
> errors reported here...

That would fit what I see, for what it's worth:

  - the rss-counter imbalance from the reproducer is always exactly
    one PMD-order folio (+/-512), which looks more like large-folio
    split/accounting going wrong than lost or extra PTEs;

  - the reproducer's punching thread deliberately mixes unaligned
    sub-PMD ranges, so partial truncation of large folios is exercised
    constantly, and the production "still mapped when deleted" splat
    is reported from truncate_inode_partial_folio() (full stack in my
    reply to Pedro).

Thanks,
Ayush
