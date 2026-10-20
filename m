Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532832;
	b=FEz9sFZM9YFSzzQcJRXvVrVN2CXy+o6wKrwr4LX0NGOpOT4z6RVHlRUUe62kxOoipJez
	 sooBMpIER3BhymhKwgmrnwimm8C/P4CtaiLUnd3JKYBDU1ebz9K/N7zlophxHPjmVyMAS
	 i2tIxx6WB8vwa/FLiPROqbprOViXR+TzmlOtXVBOnElcJLOHZdsT3m8HejXcVEYm+s9G9
	 OofIxpd/SZ0JWHbHUGCEORSEidMuPrsDkHdStB+Xm5pN9lYfEqgVPttwH3N6B3tFVakOJ
	 FFJjTVxye50SjmAHFNhqiYIXd2kdXvOK+CV/BZASHZOg5n1Eaqel5Spdlro6FYvhIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=PvIPEfkdtZUqofHUAuuyqlxSRMhwpGZiFkVH0+y5Y1c=;
	b=r5Gamluk3f3XsPj0TaWUI8KUasl1ACGb1xf+OUlqc9nefNPUlG0GbJ2b4cj7GoW+3GxF
	 R+z/5aSzli2iksNskDtWfNJpfkKgr6war8uC7FaldiRk46QfjipsXLoVOn/b2reAb5fZO
	 krUzwLM15axKUFFdozEowOwPIQbO+jGPbToygvJcBxISs2wuOEWqKKIWLN4BYmOCWwCI/
	 4QsAeE1Wk+xPnm+EmhPnPm+aEWpujoDDsNyhKREcMWAVLkkiiknx1FqAKiC+PsaDDGUWD
	 FeZ5pKeti5kmme9QFegxWxT7jZQI4A4LklhdOR8PwKp4U9daq0ubf8ylnOeRjexLuEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="bzGQBu/X";
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98171606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98171606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=bzGQBu/X
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93ece7a73b9so12341885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792532830; x=1793137630; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PvIPEfkdtZUqofHUAuuyqlxSRMhwpGZiFkVH0+y5Y1c=;
        b=bzGQBu/XirkovwO4btF+4VRDEbukUzB2MyeqAryrgq6z0Ot9GRluHKAdWmd5fgqg9t
         ZDu1Ktz+4UNXtHT8IC+siP6Ocf6rz6GRd7VEDVjyYhhc80gWFNNErqfCtS122HNP5Gc8
         Yal0So4C7N3M1J8V/qhZvVZ7b5BLxhon839NHBSmWkHKQIyfact/MXyN/ZAEema4adzb
         SUU7/h8oZ0u1JgSGeXJ16nYCwQszRCgzO90AGkiTqyvJUiA3mP2bmXCGhJM9w9d1CxQS
         8sB/rsSzNPtvRBIrbTgNFANrxD88h9a5euiEsg+ea243W67K/SX1bgUo9i0UjEZc4A10
         XlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532830; x=1793137630;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvIPEfkdtZUqofHUAuuyqlxSRMhwpGZiFkVH0+y5Y1c=;
        b=1Fh+iQMJbwbr6kpkIoPHer5q3WLCC9c6aSZwmngiRxWRStUJCd3NQPEcvLK2GrFW5T
         IA+xg/dPSYCmVbOasfdPmE9zE1H6uFQBEGAKFaVKEeasacprOWWS374A1P4wpMep3Wvl
         CMW8lcjj0r2EcDT+tczXJhIsuC1socg4K1wGGPW6e/3WfWo+PfXD2D7+J92sVPkJ8ren
         X5sp31p4r2UwCJDJcAqqDzmTLsPUh0J6NztP1UsoiHzwPrhVDvtev0wxGOzoNZxkfyW6
         nOTLjQg3+W7wfC8uNB82zG9XfkQ8b5gcORZ2qQlvOjY6aG2t4PK+UQU07k4xOKVKiXdk
         MIfg==
X-Forwarded-Encrypted: i=1; AKwUvBz847Y7UGqakRhTmj0vrbeWgQNghYECuk/CwYn8Z5ggYGzR5nGR48pSJNwlvOyTMjGpj2CEPGhk3OWQYFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWyL7hvTwhHILL6d2EqlQx1zAX5KsfBow2DCKduqMuK5B18q1v
	DpYen40qq8gjf+PBZh3Xh9pE+X19lPQvaVKY2bKkMeaMsW0ZTt3bnnQ7ONDVaLZK32Q=
X-Gm-Gg: AYBFou0D9SJh353C/VcjFz1RCEXx3H/K8Me6dOAkQCTPHREKOzSZ7JNM/6ICL5dTRVQ
	ug6fwfHAf2bjwIVLRtWkuVKuiixN7KeEJru9M2PzzJM/+zVQny6wdypihuBFrf2CQ2U3eWU4tMP
	L5RTOKx+s/w5+xN9K0jGVsmmBY3ngyHhSo8r8zwSAdbfdBZkRKBPE2qsIYbhO/3RglZZxdS5U1s
	ZLhSZeMYB8BGR5WPCm+9pZ6XKoL53dyTWIEVwc2r5jkucEeTHgqHd/WDltrgAtvDC1VxqcP0mg7
	7RoERr5QhggZUg1qjyIBhLrWFS3CU1LOSmgrtPsLlVQiRN24xpWXHbwsFYo+J8leG56blxMEFQ9
	b/9ZrChm1nt8p/SEUfjylOx0o/VmvsvY5fxCiSbNtbMZCG+ZSdnU/s0arAOD4K0jVaZ7QlTYg3g
	Y6MeGsiPcMAAFG1Q1p63kJRkhg/LCkSypRoay23+ipqCAULplv+PP3dcOgRZvmZC4qBErBrhxav
	MiLx91qdAmrl4zXE6RQsa/P9Zy+tO5E5ypPEvR2N8NkiqDaaGm75lI/f0oBnA9f+KEAl+uY9RQm
	XXLCpNSVt0FbSHYtAQh6SE/Miro=
X-Received: by 2002:a05:620a:198a:b0:93f:3391:d5a1 with SMTP id af79cd13be357-93f57f65930mr93498685a.75.1792532830268;
        Tue, 20 Oct 2026 14:47:10 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98978sm86912785a.10.2026.10.20.14.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:47:09 -0700 (PDT)
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
Subject: Re: [PATCH v6 01/39] mm/vma: fix mmap_prepare file handling,
 remove file_doesnt_need_get
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, 
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
 Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-rdma@vger.kernel.org, selinux@vger.kernel.org, 
 linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
 fuse-devel@lists.linux.dev, Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Bert Karwatzki <spasswolf@web.de>
In-Reply-To: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-1-1aa3c9b139f9@kernel.org>
References: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-0-1aa3c9b139f9@kernel.org>
 <20261013-b4-mmap-prepare-vma-flag-sanify-v6-1-1aa3c9b139f9@kernel.org>
Date: Tue, 20 Oct 2026 17:47:04 -0400
Message-Id: <179253282492.1207257.6426479952081115792.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-13 16:04 +0100, Lorenzo Stoakes (ARM) wrote:
> The map->file_doesnt_need_get flag is confusing and the existing
> implementation has holes.
> 
> Drivers are permitted to change the owning file of a mapping. If they do
> so, they are required to take a reference on that file.
> 
> The mmap() operation which ultimately invokes __mmap_region() is guaranteed
> to drop the refcount for the original file the mapping was made under, but
> this is not true for the replaced file.
> 
...
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Have a nit below, but otherwise

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> +static bool map_same_file(struct mmap_state *map)
> +{
> +	return map->vm_file == map->file;
> +}
>  

Terrible function name :]

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
