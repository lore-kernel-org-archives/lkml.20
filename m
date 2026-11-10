Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332254;
	b=CrLnllP6p0AcHu73fvqv2BEpCfQiqRQaZYbzSl8VD+x2W0l0eKnmwI7Xp8IbLCT9Wfum
	 5vVK8bowIcz+3P9v03Okakz29PwTxBkJoJFjBK+M0XuA+ToIy8B529Uy3WfJhbIs4ZDCD
	 4KlKagT+tn+pXu6iAHYiFNoKAMSf8uT5enLkkMNkian8Jo2pWj+Lt5onTllTOfTKe5P7O
	 FW+I83XMmDnAztAJ40ag+Q4Q6FscS5qq7rgNgaMo8E2z/b7nyIFEpkloLrpR9SL0r/vAD
	 nJC+MWDU2OSS1TIBxCJFGN9ks6cKuBDk6x40JcNGWn/k9yVyazo/HaPs1axdwOYyXXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332254;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1RfyL/TcZ4ZTAYnZqeNVh51xKbXVpc1QnVP/NPBvRh4=;
	b=C3vhh2bphyqYHa7OZQGV4nOtVqN1wNz5US5urBMpn75HNyI5e/8XG+mzDkXFjk67UBFp
	 GimD8+LLJryzVIJvCPBpoQoZWuzeICQ7FSzSim8pbROJxj3BGloyzHEP0MUd5SyJIwrzG
	 +G6zkAEuuAAq0wQCPfvJJUNd2xT2YgHhymU1+8aIBllPGcTL7PiJD8EjE9uxjJXu9xGr5
	 g6KasFvYyLQ7RSwolFQH/xEQafSZbut10WUWLDKltEp7+tspWeQOk5NoLOXCv32S45qWs
	 VLwqPNqba0Sg5e0AcggFlakEy4WMrydBUwDiMoDAVuTvSXdL36OV0VK7FrWSquO3elQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AdR/iIal";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FAF606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AdR/iIal
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E101F0089F;
	Tue, 10 Nov 2026 17:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332254;
	bh=1RfyL/TcZ4ZTAYnZqeNVh51xKbXVpc1QnVP/NPBvRh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AdR/iIal7CJ/v9yej9YNB2M0x4MKHjl8+kbhv5lSQTwpgvTjIm+3VQzyE4AQeTthP
	 kBgsagPvRR6i+pYNoNMLfB8qf7jOtLYQq9j1cAAIaYiM/NDG1ERgrHlDk1Dh0xsetm
	 ClWe4MuQ2pZXy57EhCpHOlOvXxW0yJg/9bHu9aX3jGBdpKOEQ2H0KE3Y4WUCwQ1E9p
	 3YTi6NMP9CC6z6Hq9dr1XiK42WuKUvOVHuimlRH1rgWQJ8utnMttYXuQeaYkUylb8/
	 tKxLG3+wWEJuCQo94ADRIwSibf/dNy/RF/LRft6LfWUq9ls70xAZbdeStvlL/XscxA
	 qk5tFvH7VTnyg==
Date: Tue, 10 Nov 2026 17:37:27 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Seunghyun An <san55@wisc.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Lance Yang <lance.yang@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
Message-ID: <avNVoCWBhVQea7Vq@gremlin>
References: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
 <MN2PR06MB6639D846B30A3357B01BC61DD2722@MN2PR06MB6639.namprd06.prod.outlook.com>
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
In-Reply-To: <MN2PR06MB6639D846B30A3357B01BC61DD2722@MN2PR06MB6639.namprd06.prod.outlook.com>

On Tue, Nov 10, 2026 at 05:32:17PM +0000, Seunghyun An wrote:
> On Tue, Nov 10, 2026 at 03:10:40PM +0000, Lorenzo Stoakes (ARM) wrote:
> > I introduced commit 17fd82c3abe0 ("mm/vma: add and use
> > vma_assert_stabilised()") with the intent of picking up programmatic bugs
>
> Tested on an AMD EPYC 9634 (84 cores, 12 CCDs), CONFIG_DEBUG_VM=n.
> Applied on d48723711bae; base and patched were measured on the same day.
> Throughput figures are in faults/s; JVM pretouch time is in ms.
>
>                               base      patched
>   shared-VMA faults, 7 CCDs   1.776M    1.917M   +7.9%
>   shared-VMA faults, 12 CCDs  2.303M    2.431M   +5.6%
>   pft, 7 CCDs                 1.910M    2.126M  +11.3%
>   pft, 84 cores               4.201M    5.028M  +19.7%
>   JVM G1 pretouch (32G)       1877 ms   1672 ms -10.9%
>
> Tested-by: Seunghyun An <san55@wisc.edu>

Thanks!

>
> As a follow-up, I also checked whether avoiding the __vm_anon_pgoff_hi
> read in __folio_set_anon() provides any further benefit. For comparison,
> I tested my earlier patch 1 on top, which computes the index from
> vm_pgoff for anonymous VMAs and avoids that read:
>
>                               this patch  + patch 1
>   shared-VMA faults, 12 CCDs  2.431M      2.941M   +21%
>   pft, 12 CCDs                2.434M      3.474M   +43%
>
> With pft on 12 CCDs, this patch alone is essentially unchanged from
> base (2.442M faults/s). The additional improvement with patch 1 suggests
> that avoiding the __vm_anon_pgoff_hi read may be worth investigating on
> CPUs with high coherency costs between L3 cache domains.

OK that suggests there are cases other than the one you mentioned that have
an issue.

I'm disinclined to do something like that patch, as it's rather a hack.

Cna you give me the workload you're actually exercising here? Ideally
something that's easy for me to run + analyse locally.

I have a zen 5 with 8 CCDs so can probably exercise some stuff over here.

>
> Happy to run anything you'd like to try.

Thanks!

>
> Thanks,
> Seunghyun

--
Cheers, Lorenzo
