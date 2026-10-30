Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368087;
	b=NlFDN1t68Hv+WPChcFwvCsZyBNoM+ljYB6XdB9NDiLixNh5ghVI7LZbvt++BWgDKGnRp
	 5o78fIlePEhKNY8E9uwP+w4rmmh5Q6kgtupLO08ZTF0nvuu0dmsNjSr1FVj31ZCB1KwOY
	 h0IARhoFTDAexhHg8Vj/z3gfOLdwnxAVvMwivMa2oWK0AO1F0LANmbRaorEhR8l7UJa1c
	 VDuixgFhojNglAdDRE5D6FWm1w8MGzX5sVWzaTpp5st5Q8AKx7BJSA/iZPXK/IPTIL0qs
	 q56Ie4wZykgcAH19CpJpiRHI6KTPLwKjBQrPbP/pvinCtBZhiw7C+XjN6haGAxpA56A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rmX4JEwV7qAmy43PkgvX967p02rESGhBBxr09gc4cBg=;
	b=AD3Xnd5NFLmvLX9leedOOHu3mJU4IFrH3RgTrrPuYH3vPY1BqyEaEvzfGdCDWmp92bbm
	 4kPWa4v8oA62Li0oLgIlygi9vLRItJeHNdOYc26ukoMEKHuo1BCC2wjEEplBi1Zjs6Dxf
	 FyqIj4BXExlYvKaiChtIiG/W3U9icedcWuUl9H13B/fxcWMM0nvDX7MrUlX1zV8HXMCdJ
	 zyhqC9YPqVTpDAEMJNYp1j7Cz3y/TRD247yZlhYgbRY039sl0z1EJhmNUUa1MN4yLJ/8i
	 VUyGssGWYGG+i4OYprpPGM+ABfv6VLpRt+pj72uSnCJ7HNNDYKx1++MyIlcowcxkRhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0o7zm7K;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04686606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04686606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0o7zm7K
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6734345e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368085; x=1793972885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmX4JEwV7qAmy43PkgvX967p02rESGhBBxr09gc4cBg=;
        b=P0o7zm7KEPIXltx3NlgMQzHQT99NsbdanhX5hUYiA8mqcXpAtEl9r+/7vE4Ggfb6xQ
         AjDmKEsJCN3A9nhHSHYQq86Tx9QzgKkEoL+MNKiu90Y6d/c6qq8wEeWDbGqZ4zOp73t2
         V+jiEVsBNp3JryoT0gq/L7+LKDEBausQ7tqgfI+sigyrm1PvM7UpDQc9g0naBiUQsKsm
         txn6SCcpysT3ZLStg89zxyyBWbPd9BONg/H56ElBDxvktEsTFh0x/DFDQ8EoFwz5gpkM
         +r9npc2iAjvhv6WuZ+vHLzVgZO3yPFE7oA+XMRoLdTuvTODgouxb21kNS1YSNNzhhvRI
         MLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368085; x=1793972885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmX4JEwV7qAmy43PkgvX967p02rESGhBBxr09gc4cBg=;
        b=AxBdrUc/Remsu/D0NNpKXf4IW8sErkBlUBvhii0kHP75ufurPLt898p1FHF5hOyNB9
         yMalA0uiGeb8bTp8MkygXr1HWgl8iWPOeT+diIE3w8eUprpp6SCSuC1UXsooOXbUWNrx
         qowzV7fGhRLcZxnJU2fwQUW0IWCR40HGg4J7V72a2kJkXd2S4BAJOqS4v8JNwTduegFQ
         9uLnDZu+y6WEsCp1N8gWorL/yIFCQVNLloXUizp9XLbhWQO3wibi0Aqb8Cme7dCCL9sf
         nLNb6JJ92YSwEKvAoEj8KPIYnswyztGsScxUNOhHqayGzziFRE/hMUwsEqhgnSOhHx/J
         PY4g==
X-Forwarded-Encrypted: i=1; AKwUvBxn+QVpOKgcEDBACpVo2jRG/PqAF7AZYEn3WSWsUDdkomRHyYygYe5ZP9d/8w41fzM09BpY69MS9h9bASU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPcena2DJh4stD7S0HuPqZzslPEYRjHcn9+1kT1xiEMiuvCKLt
	CdIBWVd5LAXTcuOoOchL5UjBW3H+zv2eIZyDLoqFaChCoou5fwWhQfVx
X-Gm-Gg: AYBFou0++cjMODHZpFnMufoIoDiEOK6eLip1WVS+uIt6inJtN22EtVHKsQWNaHJi+zU
	Cf6grz8o2l0OmH1BdCmmlKNR9udxGMN00v8jKJnpySks7pnQpWybKYL1u2KNSYo62cP4fnavaY8
	YLvseVAw97lUiIsjiTRDZ5yy1mjaYvvWba79iY3vFsY7MLGaPaa/7Aps5+p4/l+JHu/glvkVJNa
	5YehosOLZnGpSdjrpX57dykEYku9Onfx59f3OR+kE4gu3lJTnZ9ZbOEEKMbT3C1glf+4e9amsae
	kQI5yYhIs+zrb8+a79BmBC5fQWYmIfWfFLc9AFUuZ7ZVV+DErtJW+dkdAY+/VctcLNL4dokzlAP
	zwtgV/COUQmee9lm5/L7/Px3r4Ow7Zy+xHKekXMTy6uK2elZ78MTykFtHuX33Xe8pQ+H2GRgjat
	84S/slrxkvZBL0cj55KvltVnH3tzqVvgjWkHJAXYJ/VWURWVlY/fUrCceeS2uedfoUWxjItjVwR
	xGks2e6LpnMod+atgBOkxlH5t9IU3ez7a/9LzDikiVmBXv6qS9b1whhvQeGdmbeYFgem3vSjjqF
	HyhlTqFZvFLO2WtdcTfQG+cBaCB8RLBg11shbyAiSrTz43kI54vcf1Sr3XAWt1N9neOfAfdPPhr
	Zj48FIJ8G6EOcxw==
X-Received: by 2002:a05:600c:34d1:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4ac1793fb5emr50752935e9.15.1793368085145;
        Fri, 30 Oct 2026 06:48:05 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([130.43.154.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm172048905e9.15.2026.10.30.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:48:04 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:48:02 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alistair Popple <apopple@nvidia.com>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH 0/2] mm: Remove pagetable_dtor_free()
Message-ID: <auSgElFWW4n3sJLb@C422HJQPQG-Fractile>
References: <20261030083800.599152-1-songmuchun@bytedance.com>
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
In-Reply-To: <20261030083800.599152-1-songmuchun@bytedance.com>

On Fri, Oct 30, 2026 at 04:37:58PM +0800, Muchun Song wrote:
> This is a follow-up cleanup to the page-table teardown fixes [1].
> 
> pagetable_free() now invokes pagetable_dtor() for constructed page tables.
> This makes pagetable_dtor_free() redundant and leaves explicit destructor
> calls immediately before pagetable_free() duplicating lifecycle handling.
> 
> Remove pagetable_dtor_free() and convert its callers to pagetable_free(),
> then remove the remaining redundant pagetable_dtor() calls. This keeps the
> destructor decision in the common free path. No functional change is
> intended.
> 
> [1] https://lore.kernel.org/r/20261023063428.3658761-1-songmuchun@bytedance.com
> 
> Muchun Song (2):
>   mm: remove pagetable_dtor_free()
>   mm: remove redundant pagetable_dtor() calls

For the series:

Acked-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
