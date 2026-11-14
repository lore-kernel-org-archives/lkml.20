Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686222;
	b=E9qPPHsbBM3VP/Ex8VQrGdrIdvEU7Ekb+OjSdiO51pQA3Pd2ir30L/20hjjvZLNYsZE6
	 DkE7ibFlgf5AGTn6+QUKNlfmbVNJTK/VJMcwQHTWI1NZhAMP3p4OxZfIfMQXiTDzytkiV
	 t5l7xtxWGdGOhNFnD1ylqhEx94C+m7JM9rRU0ehKT5OvY3X2uo7uJ96vgE1KSgGRCV7YQ
	 9sANUxyLxlKuR6gu1kfoR6LjtxLGTzsIAYcuSjh4mMiPNY32CdSSuSzxOszWvD0oIwbBC
	 F17+4Gn8hTFtk9f2fXoAtwQNU4Q1zx0qcb4lw9IQCte6wQOx0XkQ7qWjWcOA3YLX8AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=ZCi4ttrWWQASeF1sPChkoEBldIkxl44ii+iYdI68IA8=;
	b=adR29EpndJUbQ5Hm7y4wuhaOxBfqbBwLwCjJkkWq+RKLekPR9lcvcSoXA5RD4X0zXaOu
	 lAyTjk1RZcWQEgJcoVQzyoaiEABXcuoXAt3s3jiEw46ZNYiXbQavYjMrwhaby5PjzlssC
	 gnoT4fv5bzhCUYuIi26Ax8Y3QjhkveD3vnTpPIsS9CaJpqtD39dY3Rh6TwbSwVP0vsPkx
	 nyentpqaCMXriDMjQ29Y2atiI9fHZa10ZQSg/6iFA7bwTkNNpXYfLO4unj4p0kF2G7hwv
	 tgO2LNmlMxyQWR89QAgU6h1/vr/vI+Dn9KkpnxE37fc5jTH+bpuOztdTxXngEsDU57g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=M5pSj2rL;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0F606A8A7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD0F606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=M5pSj2rL
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1124565a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686222; x=1795291022; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZCi4ttrWWQASeF1sPChkoEBldIkxl44ii+iYdI68IA8=;
        b=M5pSj2rL7/XmHVxGodQIkRrkhyJGom7e+lrSa8Tc4r65/JOyvj2hfEOUFEVsxY2zkR
         y3Bm64q+qYfbc1jkOgXAN5XLm4oTPYuS/f8qLvwJ28JiuN4OvREKsD4VRCBE9X+SQMWT
         EDC676u3b689aBT9Gyyg239YFPDYLCEsgeU1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686222; x=1795291022;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCi4ttrWWQASeF1sPChkoEBldIkxl44ii+iYdI68IA8=;
        b=p0uko2eZU1YDCHRDpkqbfVT1l89qdBSUhwYvRILX7Wj4lRT67SDtvlqfmKqNdUHmar
         06G8mRON2w9El5wJV448zpH1QK/Kx250AAWSgfy6kH4CPCzyMUtvYe3OOUGb+ottueAw
         xvi3F2592SQKKesOWuMKisz4m7w0KrMK+0+2ERZs4KGS17tlCUl9dEhsukbSvBjaBPef
         tMjlwCjAmkTABcqeXyieykKMzrnrRR3dFGM4hbnJy+CQAketbzCTrK+bNRwJy1Z/du6E
         r21L2qFaPZOGmFEuw5xplOOgDvU+SPi9ho2fRwSQSYcZL6NaoE2svkpPRyVtNLRrr+RG
         YyXQ==
X-Forwarded-Encrypted: i=1; AL+hErG7Ez34A/OunC6NtfDNsj6iQEdzbMXO6rhIKrjfBnZiQmWgBkqpqGAVm/4++j9UxwmECLVcPJA9p0yL8lI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yr7Lz+1dn6eCe7MHONZ5zT7mwcQ5MDFgHd0Rxt58JBsu7Hofh
	6zM9eV1W1DQRmdvum5KdWm6rjp5w+/4o2Y2vwrCbZopcVFk9Z0fuiGGBrUkhQ62XYhw=
X-Gm-Gg: AYBFou2YI5/m+qtK/ByWrZDbi4LaT5Qp1CaNyIo3DTsJ1Wyk1GdJdWCLGUCJA0o3+LM
	YtUwdPjNiT8D+ILu3mKz0HoQBFHOlSKfQEytylFSUt4g6sX2ZnSHE7YcoWpejZIFM6C3ubEdaBw
	Dp2x2CN6nXKe/1MgSUrzo2JZE4jbN07hcSIuuHjAU6ulsBl/2G7vDzze3Rpl2EN4SL/TfpZovX/
	6D2IKpq01MK/I3Uq9k8UVlUOBs+kLhJD14EADLnooABowiEMaxBODD4PL4yAywaK2Q/AE/wPJvS
	/nOBHITmrtaG9eOaRhOusafcJmZcK6WF31pnxWV1Jq25SNOjF/0STfrJTDnZzbkP+aY8XYiyDYf
	MAmfCTIx5W0SqGVFyeE7hNa4/ytJ0TJVG8I5lfRjQQTkmMz7kij7znJ/LUoH6bmdFjRGH+ZFCGi
	KbP6+RkJa5/9fHxvEXvsts3HGDYiWJqo91TJbzVEyyAJ+Uo4ikUVFKPZTJ2s2Wc66xDbNgGWAGe
	OcUsOcRAk8U+qzL0FiY6OAhwfvEdzXkaI/DUVlAaSo8qaeWekAq1DNhakVxtWUpdDZAsB3OOb+p
	B0JDfDel/WZ6FKIAtatKaaByNcAY3A6o4MYokXO14FHSN2QESq6e+YfoDZLLxs1ggy88jwXnJz1
	++QQ7t4vqC4DtAMw2ck1WIoSS2HPInQFqdLcMY7w0nsTCoWrDsXN78zmC3zJkpTfbOrEYh3a03+
	f4hjdT/lqFOjn7Gh/DglC5AwutiDX/P1Iu4MwPT3B6WCVct3Hrp0tkwQ==
X-Received: by 2002:a17:90b:2642:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b1b0b9cb54mr5682263a91.65.1794686221931;
        Sat, 14 Nov 2026 11:57:01 -0800 (PST)
Received: from [172.22.0.2] ([4.16.0.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce460csm14709280a91.5.2026.11.14.11.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:57:00 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:57 -0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
	=?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 08/13] mm/migrate_device: fix ksmd oops on a migrated
	KSM page
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-8-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-8-50a2ed382b61@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114115657.f63de4714929f7af@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Lorenzo Stoakes (ARM) writes:
>[ ljs: tweak commit message, comment, also refuse device coherent ]

Alistair's Reviewed-by on v1 came with the argument that KSM pages should
still be able to go to device coherent memory [1], which is the opposite of
what this does now, so it's probably worth checking that he's happy for it
to be carried over. Going by what ksmd does with zone device pages, the
change itself looks right to me.

I've tested the device private case. Without this the process hangs the
next time it touches one of the pages, and with it the migration is
refused and the pages stay merged.

[1] https://lore.kernel.org/r/avTu3LmscsttRVRp@nvdebian.thelocal

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
