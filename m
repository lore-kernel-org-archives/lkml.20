Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874911;
	b=eAl3HCowJCfsGaqG4ZJxgJw+wjKaGvgY1nKEqvcqNhl1ui+Vx1pn/o9K22gT8WqtfimM
	 sM6L6drAoW1UqbIIModB1bw//Fkxw0OJ0/CgDssSEaR0ijmPurtuMt0CGoxEaa912WP3Q
	 H7McfImcFE7/N+YizC/S6qe7jvAT8Ad997DIN210TQ3buhn40YuyTpGh4qFvYpzPrLne2
	 wzIWLrN62QcQPGfpn4Ak4eyP9PgCSut0tQRH+a3WXUDxOUPfvD45iBNh5qbiWLo8Jj4pH
	 mbZ7IgtRkhPauhImdo4WFIgej3vC4hKRZsLSNL1w/sskbTAhLGInR8k/bsVyqTTz/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=BuPJgnsG0Ng1Dae+yMYUghn3Dz0uN6VmqtORQTrWN9o=;
	b=eh1UqtZcQVWJWgFvvQot9zpUrYIiJItp9t3dC9o9iQbvjsZS5XkXXOrB4fkUCekQbOYZ
	 x/ajVCn2byXLRGeU62odWk/noJ6EhcFH7KRaO2P718Zs396GGlbhtaLZbVbio2KRbN9mi
	 81jf5637teU3moxWjdmF6hs8xNxE+9zQaWbjT1iZ9spJvtNEeUv5AJwGAU8RvKm+Zt9Ck
	 hfn9DwoJIg66LBd5zSMFVW3AU03Gn2NAmsQbTmG3tbfDZxiDGHgP9FD9QfNkobHULMrMc
	 IJU7BR4zq5A1JKejvwoUwtnmFYIXMsUwTc9Icz6bytC1kKzS/2jYcTSvzSo5QSEA55g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=N8V6EIzF;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B6606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA5B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=N8V6EIzF
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917a707f37eso19929406d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792874905; x=1793479705; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BuPJgnsG0Ng1Dae+yMYUghn3Dz0uN6VmqtORQTrWN9o=;
        b=N8V6EIzFsfngUUiSHlqZ1m2daMfL/rg419LomABkwSxzbcs1D5/Nsk7zhezLDULqs7
         EeeKmor8mjzpP+jF2Eq/Jgt7819VQMOwx+L/G7Me6G56+yMPSJXwkOn4VGVjpC7pmkmx
         hFqtptPuu6KpkC51AQyW+SMj9+cBfEf851ShXi6nxSlUV63+3Fh16wIyDL34MIBbOldz
         zjqOMTH/kWaclXaKGBhsjrq5f4NAv4jnvfQcLveu4r/CsejNa7ZovPHwrEEjexmAWzjW
         KYthvDIXysA4LgN8Y2UdB/nq8B2n51cSlOuVcsXCfrtZLx+NU5rmigp9vcRxx1sAC7jl
         aqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874905; x=1793479705;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuPJgnsG0Ng1Dae+yMYUghn3Dz0uN6VmqtORQTrWN9o=;
        b=pvCvr2cVoYsTLU9IhIUfc9huhvhEEgpnyqdMu8RCb1kagS1kQPUNlWMv44lvWinWBv
         s6HC9ctopgREeR7LMvo5Kjmx4ZIKJNQG2ya5eoGDqISJke+KJdeQngsB4UMbIBXfk2Pw
         YeDPh4hKbVamYNPrHXtgnJmWC/4Y4DPRlOPFxTFKmJIC7r8ZSowzFRNOqMimzS6GDUCE
         eW47X674g7GdipuZRt9/iEwJrXy7kULGyCkspUI8P6rlFndMjKAc9CjqW9pg/CHNNX9i
         lJW2hnnogbbf34zynnDvwfZbKYmHc5w0uptnY1OC2Op1J8QpbWowLYJcOsFD5cGafAXF
         /6Ew==
X-Forwarded-Encrypted: i=1; AKwUvBz8FJd9L8OBYduLSniJn+RVArKWFqnjDEYQ4RfExsE5s9iq2qmVvYd+x9Jf1rifeGBsjPXtpSgtcAM2FB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6uvRubj4HCsrrSUdgoy7bu6/6Yiuu7RqVPEqX0+QZcyVMyQFe
	Rdc81ZgLZ7DX3e8arJ5tka+fA6zFYmpJeTvdrVVW41zkmS6gGXLqvTb2Q+R7kuOktqM=
X-Gm-Gg: AYBFou2pw5lQcq8kdb6L/9WGNuD4NqpSDG+pfN8cfoQbstdHxO3vetS+TR3RdBrUkpn
	E7OCGQ2ScH1vqgpM1cprKkL/wVSFkQXFBMMVzdAH5mf0tH1HTXmC2pcnzgGwBAG2jcLkgXv6CyT
	hv/sw0cPTTUh4B9aMkIaG20ytx41OAGflsx4v2bojJ2ECLhdgY2LQWQcAWFIacrH0Fw593Qu15b
	QQQxeMIG1QlpRJGYQZD6IMy28yUt0bJM0Whv4XWMm5s+GfseVlOaReYxWFjupSmJp0eMCsitT5w
	OFy3GXfPFx5nQ6AjqtkIZoIy+nbTkEqjIZMgcRJz8xiioDI3qaI2+7CMuEkStJOEcPYQrz6a83o
	gUUcCBrZhWBSu6uJYvFPaJv1GuQFOG9exekdGhDv0k3UsPyOhBdKRPF8OCit74vmJRS+OXYt/ci
	la0uzTzRrYHowvOekcGKv2RZ6TWKSjKB0BFtueF2AzbzXeDsz3gUAGV8yUYEEmdaOK1i5tZ4Z2v
	7DjY2HWCY3ulBcZ1dnMSny2VDg4Hr6RmSHw5dnvgpaSwkf3nnZoYUlTEDiJ7PAOQcGEuFZAsYkG
	eEZbO7e6pmRfphUWXkzDcmk7PC4=
X-Received: by 2002:a05:620a:4001:b0:93e:9292:1b9e with SMTP id af79cd13be357-940ef7ad8b6mr372744585a.1.1792874904799;
        Sat, 24 Oct 2026 13:48:24 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a94a5csm258574885a.41.2026.10.24.13.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:48:24 -0700 (PDT)
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
Content-Transfer-Encoding: 8bit
Subject: Re: Path forward for Virtualized Swap?
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Rik van Riel <riel@surriel.com>
Cc: Kairui Song <ryncsn@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
 Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
 Chengming Zhou <chengming.zhou@linux.dev>, 
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, 
 =?utf-8?q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
 Meta kernel team <kernel-team@meta.com>, 
 Linux Memory Management List <linux-mm@kvack.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-doc@vger.kernel.org, 
 "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>
In-Reply-To: <12081d266e4846f23faacfc65c7be7da4ed013a9.camel@surriel.com>
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org>
 <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora>
 <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
 <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org>
 <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
 <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
 <CAMgjq7CN7qTes+OXvCfsgPOnbtyY7YPytTEP3zZJTBxrGZ5JnA@mail.gmail.com>
 <12081d266e4846f23faacfc65c7be7da4ed013a9.camel@surriel.com>
Date: Sat, 24 Oct 2026 16:48:22 -0400
Message-Id: <179287490291.4123581.5790613647977714588.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-24 14:16 -0400, Rik van Riel wrote:
> On Sat, 2026-10-24 at 23:50 +0800, Kairui Song wrote:
> > On Sat, Oct 24, 2026 at 4:03 AM Rik van Riel <riel@surriel.com>
> > I also hope there is a way to release swap metadata completely too.
> > e.g. for fs, you at least have umount, and can rmmod the fs itself
> > afterwards. We also have many ways to bypass the page cache. In cases
> > where a virtual layer is just a burden, we want raw physical swap,
> > and
> > the ability to swap off that too.
> 
> The VM cannot operate without the swap cache, though.
> 
> That is very much built into core parts of the VM.
> 
> However, having swapoff remove all data from the swap
> cache, after mapping the memory back into userspace
> page tables, seems like it would be fairly easy to do.
> 
> Does that meet the needs of your use case?
> 

It may be good to talk about this in terms of discrete workflows and
interfaces, rather than in the abstract.  Just describing effects
creates a confusing situation without including the cause.

Isn't this as simple as having something like:

echo 1 > /sys/kernel/mm/swap/drop_cache

('simple' is doing a lot of work here)

-- 
~Gregory

