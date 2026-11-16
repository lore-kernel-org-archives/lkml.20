Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850828;
	b=QEI50zgZySC6/8uO7i9HSpivP7sJCdf48mw3PDdmB18yDfEyzNT708C3+3CBA/NNiKA4
	 bGWcwb+2os7XiXH+U2l+cTvtzueoncfjRmMCGVogUYdtCQvyOthPoGpzgJAFBzSPNszyz
	 yha0s2yA/72b5Lkva1cCC40DH6VwSqeMW5YpHkt7ht3egUD82ex357urU3CYwa3EQf/Qh
	 X9jzyXHbi34ay9c4+VCKESUfN6l/D436CjLts36d6cUWxTq/GyWxfRKq/TcTAlx9YcxIf
	 uY7TdeERMAeyjZpXFMwZOII4Ee5ZdK8rIZLfd+ykN/ut4rfM0fGO1IbR0bKXQ+j61Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=YjLseNf2hnBu+sCpNnb8CVwZ4cVJDuEl0f+BAYdwnZg=;
	b=I7ctCgjS8CnvEJjVHVRQ92B47A7qmFRTPcSvqRshZ+hgxayy0wY+0RC2LO5nMW2Y2aca
	 /kYtyYcpx9EePO3gTQ6B4ZtX5k4kSd670CkhzQ7qcsP2LrsZf/2ktDKHXE9ZGIJm5cuka
	 i1cUBijnkm6QL+sqLxVMGQFfYGuvcmTJz+fKRDrJLLoB1Q8iHWDUuNtXoi5eqwByOzrtZ
	 YRGZimBFXAh+F0DGi0UeRxlWY+QLgexMM0z0L4YPfVDcLxzD4Y6Rvxp/1Su87diC6xIK4
	 T1swJ5Qbqa13spbXHZCh9z7h7MVtmF8lNOLYu/VHd4jA3z54uRCf+7CesrbN/sOFN0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NKmhI62o;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72648606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72648606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NKmhI62o
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so43117816d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794850826; x=1795455626; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YjLseNf2hnBu+sCpNnb8CVwZ4cVJDuEl0f+BAYdwnZg=;
        b=NKmhI62oWAb/qvj/gB+l64VYwiQsWDILUIMQgSSTq/z2zZxK8trDs32EdNKvapU4kJ
         /k89W4cMt9/hEvQKAUWIRpsSwZgtairjn3wqNg2mTdgzJ5tEQjU0JkBDqhWuV5WVEtVN
         z0CUx16shpdXMDDnwWNsaOT79rIAUCCUbbeEgxYFdNkH+mOGvhBx6ERrC55RfLaOX4Fl
         BCTW7VXySTVKX2cRNDRgUS3KOXhsY2SOeVeJlPiC/jf3WudKnsQVU4JelHS6Lb3+fwfS
         M7x7YMuI8PktatMoWWn9kCbWyvkh9sNv2fRXZu2bhfTN9/gJxapJShdYOdTZC8yhMhDj
         ZXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850826; x=1795455626;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjLseNf2hnBu+sCpNnb8CVwZ4cVJDuEl0f+BAYdwnZg=;
        b=h2GgOSOoLFixgvioa4GE9FomSoDXAgwJ+d2HOdWmsPuLbjXVwDg9UPLTSO5VChj3Fb
         dhC+fD8B/86p+9HeeuIrcDqCnuh80qyjEedaOQui6FVXca/kYTGOHhIBZOjkqHYHnVmW
         ZoQ1H84lttuwzJv4rirxNusM49gYObkFdcZCyUFW3EPI/soKPdCkmLtD8SVRHkvaMxRT
         G4M1sF+6KEvcUYNGbL5gGnsv8IcORoHfqN8vsF2U80O65OM0e1kN92dKJpUyOERIxbI4
         la4/b/LMZbURLUUn6jX6GtzDnclP5cYhrc6Lnm4jUXLCX5zUc39zLtT4b6r+9VrKPSBU
         EV5A==
X-Forwarded-Encrypted: i=1; AL+hErGjIr9UktOXDACfalRcsONJ1Xc2aHhNBeQ9qB1RzRneScDgO5b1mhtspFsJCQ9hxYSB6fWbeqw3dh+wu3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rwXabh/Fyf73PyAg5raK69V5hwZhXRSns/orm4+pQHSb0az4f
	2XM4KGgQ8bc8QiXPDopZfFsxxebNfCErzXw7g2pxtGPW9wGUpslZBv8b3D3l69bCtcI=
X-Gm-Gg: AZFdTZeXop8SlbAPZoS98IajuAAKIIuTycSKOPR9ZN1Ss6fsARe1Pd8F5HOCVGmVbTk
	XjAHoCiBkTYqbfkpsCWZIGC8+zeToz9MMUuZ1svW8yRDrNYQbS0GwEuYi0vF1RIlKEdAznbDwSA
	/j7UQD97tFO+8LyyzT0FG+WqU6U5wjt7HOnbmBXlRtMLuZsrHai15JpcaCxpBluXzoC/G15bsnD
	uCGzEB6Ddchwn4fUb5rloTBXQ2r5DgL5tfhDv9ge/FKXde7VJz0SvR+gKAukUIGBTnhJ1T/tI/d
	EKrQRMG1IJRzxtS58A7DGSTIGEo0+uiznGuDeW9Zdhg82ylFefuwpFSMrGwQKsGFqN/kPcK/AUU
	chXZbv+z7CpB2oaKPm1tcH1voZWiJNhOiM9bcw5+Kbp3pcNySPCtxTviYJrFPKm81fQZ/kQ9MB8
	i7GHF3dO/z42ayZ0vk6xMgr7XHLjBUu3BDYTw0tLsW6fqUT1otCseKR8UcpamfIMTgLFziPsK9u
	nliCfxk5GDMVpQd1H5aZlaBJj5egbvVX5n9cQNqdOt3Xm3jVV3r13Y2yokGydQT7Tj4cC2H9EIl
	tEVWoDNUf/ntj7vJopWV88PzT8enGuLbmORot9NZLobS5G4dDecuLrlFUUYo8NJitsgB6VINn48
	Z61Efheo=
X-Received: by 2002:a05:6214:2246:b0:914:53ca:99e0 with SMTP id 6a1803df08f44-91f241102aemr180003636d6.11.1794850826464;
        Mon, 16 Nov 2026 09:40:26 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7b607sm91534216d6.26.2026.11.16.09.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:40:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] mm/memory: remove racy huge PMD assertion from
 walk_to_pmd()
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>, 
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>, 
 Roman Kisel <romank@linux.microsoft.com>, 
 Saurabh Sengar <ssengar@linux.microsoft.com>, 
 Naman Jain <namjain@linux.microsoft.com>, 
 Michael Kelley <mhklinux@outlook.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Eliav Farber <farbere@amazon.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261115-huge-pfnmap-fault-races-v1-1-537605643f6f@kernel.org>
References: <20261115-huge-pfnmap-fault-races-v1-0-537605643f6f@kernel.org>
 <20261115-huge-pfnmap-fault-races-v1-1-537605643f6f@kernel.org>
Date: Mon, 16 Nov 2026 12:40:25 -0500
Message-Id: <179485082513.482102.6134237207669235151.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-15 20:58 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Eliav Farber <farbere@amazon.com>
> 
> walk_to_pmd() asserts that the PMD entry it returns is not huge, but does
> so without holding the PMD lock, so the assertion is only valid if nothing
> can concurrently install a huge PMD entry in the range.
> 
> This is not the case for a VMA whose driver implements both ->fault and
> ->huge_fault and which invokes vmf_insert_pfn() from the former.
> 
> The existence of prctl(PR_SET_THP_DISABLE) is problematic here, as it only
> takes the mmap write lock and faults taken under the VMA lock are
> unaffected by this.
> 
> This can result in two concurrent threads faulting the same thing
> disagreeing as to whether to attempt a huge fault and thus ->fault and
> ->huge_fault running at the same time and triggering this assertion.
> 
> So just remove the assert.
> 
> Target the commit which introduced the first driver able to do this for the
> fix - vfio-pci. DAX also mixes fault orders within a VMA, but serialises
> them using its own mapping entry lock.
> 
> Link: https://lore.kernel.org/all/20261112051440.16140-2-farbere@amazon.com/
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> [ ljs: rewrote commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reproduced by racing faults different mappings against THP-policy
changes. Change looks reasonable.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

