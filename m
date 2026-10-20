Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507682;
	b=4c1GVkDMFbBh6LtrLuR0P5VOriNpwByN2l0EUI5pSLMSv1fP1fPMpdyNgf8soduo72mY
	 nglBSGb7L6gvRtHgRV5PArOrWOEIJwdpc4aC0TNw0OAlCFcB9WJR8oCmjkJHUcq8a6GUj
	 +Wms5NoJkszo1t39ZIKPuN3oUOkcLKQGO2S+TWqW+GLwispbFd5yZ/9eHjd5FHvO0+3Bf
	 82DMmM7uMSgqju8fYB28pxkHajM7eRcFWIccQxd/mS7eauMuFQ9+r87bqZZ9Ynu7/mcj2
	 FZIHyWtsycLuwFh8xD1FT1n9g93joNHBS0KNsZF+aw++qbDn7myGCP61fW+6vS9f/1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=wbrg7teiEaZnv5DkKLxUF7WwT/nqBKWUsCVToNR2pF0=;
	b=nakEuKlK6YJjSmYv2lLwluMHC6LDr7I3ayfMFTq7vlKkN8R5IdtAojsdj6biYF2NvFP9
	 /LNWLoj5fi6hS7skSoJAucvrLR1M2FsEGG7IT7vCt0WOud81yRg4hHrnwwHgLyV8XPiuP
	 r/qn8wpbQi1+Zwin1k2oxIa3bYzceUZkpaoqw+uabToA54mdAP+gp1G6MubOS0wH7KqFW
	 jGmcOvxuCfAb/RwpT76PRhqpx4WTBKd2xfvIaQZz1IFgHNd4ZKNvyHc5LKULZceTZAIWW
	 cSwfTibCNxwvyqSnCRXC433K+SMhxkAT6vrhyS5r2u4xJrV+7+5339hukzI1Vqp7Uzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K023x4vI;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4E7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K023x4vI
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8b20a899fso16450725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792507681; x=1793112481; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wbrg7teiEaZnv5DkKLxUF7WwT/nqBKWUsCVToNR2pF0=;
        b=K023x4vIK+0AWHVLLYF0HDcHMEpd+ZXCelWlr7RM2y9pM+XDsljVqpvx1IsA6zrOC4
         TLBiw3bpPi3cIN4R2oThVdHLLlRK2seUDrmpgoj5iJWLxpEqjPNVmNiviRJnOhrcQKR1
         l0f1WRP2tU+bxfV14jB2KP2kJKI6k7RL8ucSy6N8Gysko4QxUXqSj0sGSH+soYD733Qz
         dPm/73d5KlOFddqlxk/a/7vWXtchP+ENdKT8MjECJbnsbuOnMzD34nIir9BieopYWrzD
         y6QhmHaZcJMAtJ+iDfPGguJdFOoISykHQovUvWAwjLGRU3+jz4wo0eFXH6hWWw+CKtDu
         p6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507681; x=1793112481;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbrg7teiEaZnv5DkKLxUF7WwT/nqBKWUsCVToNR2pF0=;
        b=Gqpuo7kX5ylNZGRWI/DGInHFhGyw5GSff1QGRQ3c/1DZD4oe8MyRPfN3wXoSs87x2l
         9D40tPqJ2fXwELtmEthspY7KCiThphYYx9lUys68VfCdaz3WRdBR0nDz2I/oZo8Owx6R
         Xzvvs4QjYt5uXPlkAbXOOqeiAEsw7/ocV83ZoG9Ev7cfrhX1iMY1j0a6nW1iATIrmtms
         A7PFJR6U5rSsgHmjWU0xXpqCkioR9D/1rmJej9C8E8bWtSe32vON5ZLwZ76G8gVW5meN
         0B33hYhZyerFPBHLiOFyu8XjBuSvFbE37C5DVPnnkT4iBHGzKiMIEWGGW7Lv2aKKyUWc
         f46w==
X-Forwarded-Encrypted: i=1; AKwUvByocBN9jEh0pMDp8XTxugex94/Z4og14KhQ4fWlDHUff43zEOTq0Eww8KQdTZZOiSGg1TxnBEWhKRNNk9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiHQ+pNdvSEISF2jlYqa8csnSI1SvRYiGFHD6e9sBRQ1J/CNmX
	gVP2kSvKbOO49c0CzPxwaQBY9xPskKlyaGj1G54pgnP2qf5xiq3cPt1v
X-Gm-Gg: AYBFou3wcl59hFSg9r9DsSJhAhQiZLPvh0av/4NAB1b5/fPvMWZcvU/Vw6Sq8wk9gfD
	EqvbVtPsXg+1qTUqT7VlJkXhUIgWDgUhyxJ2gsmNlQheHYjUX9lWW3W5rXrfIARo+JTLzJyDOHy
	KWHQXEfl1NrR3IFRAzEvkNbtV0ydP77dYkGO435UOxy5oCy/PqQ7mP0MKvupeanB/CZ5OSwB7KZ
	tC4EmN0IQDBT0XABWeNsRrtdffmJWv5YJmxOKf5yY98FuLI59vwSU8ivib96IKhR6ndBl78tspa
	RsCSIabczLakCMD0wtlE7Hi1C/eI3p96anvU91OyRFOTbuu3nQSlECyMPieE3N5lJX5Xmn/qkd7
	vY9Qm86VXBJ8QBlGO7vvrsWrd+JwvSUCt07R5zCEW7e2RaAj6+E39U2TacGnPDFv4iANAxK0XIc
	QcfJPTIJzkshmUXKUKjCfj1PkHEsMCSMySw9TAXPNtyzyYcpmMIc92OpjghTGviUjWr1v0xxGIy
	alpqjpWRJ57tlyhGqrsz+3k1Zi5dtFfH14/5YBbG5r7mw8CcQ+KuUoH1BRDNYWslIQt3eTMRRls
	ZGU=
X-Received: by 2002:a17:903:2301:b0:2e5:dce7:5c43 with SMTP id d9443c01a7336-2e9a6841aa4mr97854735ad.6.1792507680918;
        Tue, 20 Oct 2026 07:48:00 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151840c4sm13046815ad.67.2026.10.20.07.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:48:00 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 14:47:59 +0000
Message-Id: <DM9QXVWZXOHM.21TW53TSXHZ9F@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Yonghong Song" <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next 00/16] Add percpu variable support for bpf
 arena
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <cover.1792503001.git.xukuohai@huawei.com>
References: <cover.1792503001.git.xukuohai@huawei.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Oct 20, 2026 at 06:22 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> To use percpu data in a bpf arena today, we need to define an array
> sized to the maximum possible cpu number, like the cpu_ctxs array
> defined in tools/sched_ext/scx_qmap.h. This is not a convenient
> pattern. It lacks performance and scalability, and wastes memory.

It depends on how you use it.
Patches 10 and 11 emit the same thing as
&arr[bpf_get_smp_processor_id()]: load the cpu id, multiply, add.
The x86 verifier and the arm64 JIT inline that helper already.

__u64 hits takes a page per possible cpu with this series and 8 bytes
per cpu in an array.

cpu_ctxs[] is indexed by cid and qmap_dump_cid() reads other cpus'
slots from bpf, so scx_qmap cannot use this.

Keep it in the bpf prog.

Any arena offset is safe to access, so the kernel doesn't need to know
about percpu chunks. bpf_arena_alloc.h does it already with
page_frag_cur_page[NR_CPUS]: a table of pointers and a page that the
cpu allocates on the first use. NUMA_NO_NODE gives the local node and
user space reads the table through its mmap.
Then no need for BPF_PSEUDO_ARENA_PERCPU, the map_create attrs, verifier
and JIT changes, new libbpf APIs and libbpf changing thread affinity
during load. What is lost is plain 'hits++', but kernel C doesn't have
that either. Initial values are left to the prog below.

Something like this:

+/*
+ * One copy of 'type' per cpu. A cpu allocates its copy on the first use,
+ * so it comes from the local NUMA node and cpus that never run the prog
+ * cost nothing. User space reads any cpu's copy through name[cpu].
+ */
+#define DEFINE_ARENA_PER_CPU(type, name)				\
+type __arena * __arena name[NR_CPUS];					\
+									\
+static inline type __arena *this_cpu_##name(void)			\
+{									\
+	__u32 cpu = bpf_get_smp_processor_id();				\
+	type __arena *p = name[cpu];					\
+									\
+	if (!p) {							\
+		p = bpf_arena_alloc_pages(&arena, NULL,			\
+					  round_up(sizeof(type), PAGE_SIZE) / PAGE_SIZE, \
+					  NUMA_NO_NODE, 0);		\
+		name[cpu] = p;						\
+	}								\
+	cast_kern(p);							\
+	return p;							\
+}

Orthogonal to that people are working on slab-quality allocator
for arena. It's also going to be done completely on bpf side.

pw-bot: cr
