Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9049B1E2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415865; cv=pass; b=kuXyF3dxIlbPNX7WQ45JGYOgRxQ+VzBS0CEEGbn6UUDk1AuSgtPo8ydrZmoM8Cf3RlFjSlzXyPsKj0Nst31ZkOa+bJSe63SpG980tfeGoo2QPbIkemwb1KbXS0vUrdhEb9VDKfWaz1Lz1H7/w+zwbGbVNUn4puBvOOxr57bu34w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415865; c=relaxed/simple;
	bh=rm+zdLu0LlzNfMP/vZrBYvi966p9ISS8d4XEb3JQ094=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzc0udI8PYlHnEX04yz+yl0sXonY4TustVZ/PmnE78hLi1oRAIMRilE5E08XKJO5dBuAMGNZLju8j3WARAlV3N0oC4Mw87JhAg8okNajIdG6ucux4ECvORKj/Zvg/E1mnMXkdDmJxa12OxItirZIaXGTgJlqip+4zNsmGp/SqOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VBYIS+ru; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VBYIS+ru"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so1944915b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789415862; cv=none;
        d=google.com; s=arc-20260327;
        b=G9MxdGJNWnfX5NAQxzDjKcOZgb8mazN28WowBNpNzKTEFlRcbNEID5QVnpIqTUzGPC
         Q4LSyuep7mnCNpkwWqKNHpIsEylG3CrN4DwKaeD0B3Hudwj2QQbLPVJdls9rDZRFR4yK
         uj1uW8wr2bM2sW7DtfHr3S9mmR4ub5PBfQohGNSZCmqa55DcthclW6oXHhx4I6uWHyPk
         t3mmBM0Rc63RL21mgD61Zo3UIKohOj7BrxMSYu7UtuhhFHIGmICJNgcTjcHfl58+pRPb
         7geQ+3IfY/suK2ZfSDNefdzUXrBUkneqSRU1T5nVRPSSCznvTUx7YhCRVnpg7c+Jr2m/
         KQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        fh=WKHQDNbCF3z3Eep1f9+ZIMmk3kHeGahgm60hIcLYu/0=;
        b=DBTjc99L8EW5PCxW7qN5bN1CIVavm87GAZ0NA703FyB3zlz3ibdq9bOiwtNYg4lj/c
         AWMeg8Aw1muFERML3kGwO1NcuKNP1NHDJ1mFlhWfb0d/NliGulMXfF/5Dfd5/S6pm502
         ClGTqMx43DoCuA+OF4sGPE9wlX5+JRp4Og90m+/6YoShvGnIDLD1PtjwbAbdLmWAEG1T
         rkN7DSRQCeYNtm77XJxNoVQ9NNW1e2L7P7xmFEcD724J5gTnTfyvxP4w2PKPkozVn4jm
         cvP0ZTUTKi4swMZvdCdKLt9ZP0dCh2W1/s5bTZdsjvvKcZA4myZuexT5UtcQ14VfEgcv
         EKxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789415862; x=1790020662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=VBYIS+ruvec/YQ7NPDSavrBqZkup3jtMUSf2x9fg2vR4Q/ZYGnptCqM7UF9GBEk6Kb
         pwYbAK2sJEZFDjRFht2ALhGnWfzEgxLd1W4Nqjf3iOyc3C9CQVwNzR9p52/m8eg00t3y
         i3INHp65zySvAJlrkN0SKQiamBOPK/2OeoXHbM/ieIzmZObIDK9PzOChSRrcM8YAyS56
         Wpk2JsgEsfietAppzsrHDi7c7Qi8vepD85wgaha++Drvrzfs42k7ryFVO4ohzIir1SFu
         Dz5Af79neP1/ODat12UTHwq79Ug1vrjKu97+aj6V0fudJlIrOVtfB5xkOELTreMhvqOw
         VVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415862; x=1790020662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=w+Y/e0394XkH6l3xmZrDnRKQGwzpVfFBvKVJFKURKgVGwfbkD4nBOrlzndnRsKrn4Y
         t11wUWBF8APr1YvZSy/J3NZlokYfR0g7KNqSNY0oH2pkz7At8XB2YHhpZi5HYt9f6yEb
         SXQ7dUuxB5Df/sN207jtvramBS4ENazno2CPsaZA3SWjSOrwWqHquab/ZbazrAo92Zbm
         tmSTV38VkkyFggQIuPHiJnCluGt7Igt8+8M9bbLW9QHlQ0kk9eU6gT6yE9OxkFNxqaIJ
         3FN+HMEc9JSrYtWYTaVqp6FmuMKsLdEWRlIE/JsTE/wtUBmq0Z3MqLxjjEQXutUI1UjS
         XCBg==
X-Forwarded-Encrypted: i=1; AKwUvBwLrAJCU2uqX3nFjmfmXvS7KlUQ5cTC+3YMY6LgGZg5L74nyvy9yckNOyV9dvMwcCZ6xjfTMJ9VpeqvWDk=@vger.kernel.org
X-Gm-Message-State: AFuF++lxkApDsCcDKgTllePuhuIcKHflSYYtcWQDKvuJS3MziBYwAfwT
	43oJg4jsyhzbaFTEHEimGMYjpBGOCL1MZH0BQcXZC9Zw7Ke1+sOHtf5evJXHZ12GST8C6lTG2Ys
	/ukg/j8zbBn35tVNBMW+M4EqCPLdKJxwZhbrc5oFN
X-Gm-Gg: AYBFou0qMqL+aFU1aTXIYzmydmfWFsfLlbLyZS4puTHOsc/JZVTxGi1rxsWJJTPoBfR
	I0RZnUfLQ9fpF5yiyWjVDmDmPP+O1CvpxVomWl3jcZonCbKH0Q4XHKBQTq3G99ter4h37QCxivL
	GPGgu11rLNBJVwE28V1yZUSQTsX0EFU0Xzv/ENqqZzq1e0cUp2LdYzR+L0Hnk6y1dxaAUMdOW1J
	/E3m60/aV/GkjGwFFPexMCYAiYYBXsDfPaxJBSqTp2udIaxdV8BKokHEuKGQTryoZdVMRkdKiOR
	F23ZbCHAAjTunJgLgy1QqE9aEho7paa1zYzcbzS9YMfdLxZpZZumWqwywsFUGpGW1/4zsXWQO/l
	tOPBIykIMOeI=
X-Received: by 2002:a05:6a00:18a9:b0:858:b809:6ec0 with SMTP id
 d2e1a72fcca58-86f869a920dmr8896742b3a.23.1789415862342; Mon, 14 Sep 2026
 12:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
In-Reply-To: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Sep 2026 15:57:29 -0400
X-Gm-Features: AcwNN1XaLRK0KaZAmfcRvdaBSkZOdh14LF1fb-xWULoFVhBfqyRklsdKoWBmLag
Message-ID: <CAHC9VhQ3TwdGGH6YtVyMqJX4avJwsadcRvRhAoUhCvJEHk=i=g@mail.gmail.com>
Subject: Re: [PATCH v2 12/40] selinux: reject writable opens of policy file,
 drop mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, 
	selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:05=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> The policy file has no write method and is exposed read-only (S_IRUGO in
> selinux_files[]), yet sel_open_policy() performs no open mode check, so a
> CAP_DAC_OVERRIDE caller can open it O_RDWR. Reject FMODE_WRITE at open, a=
s
> kernfs does.
>
> The file can then never be mapped with FMODE_WRITE, so do_mmap() always
> clears VM_MAYWRITE and VM_SHARED for MAP_SHARED mappings and the VM_SHARE=
D
> check in sel_mmap_policy() cannot be reached. Remove it.
>
> This also stops sel_mmap_policy() clearing VM_MAYWRITE on a mapping that =
is
> neither a PFN map nor a mixed map, ahead of the core enforcing that only
> such mappings may do so.
>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Reviewed-by: Jann Horn <jannh@google.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  security/selinux/selinuxfs.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
