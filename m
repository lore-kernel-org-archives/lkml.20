Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601464;
	b=d5UWh9ZF4ROTNEHTDRNXnBXx6aY0WlYo7/+NIldT8R+hDm8LNE5A08dcjqQ8L43Gjb23
	 Q1fjiS9jlpSlUo35Uy34mazqG30moGopv9wr6sHPonTZ9cuK43yEowvtellTVcnqSXatq
	 0yIGivV61sK78veTyfdL4V0ahcwhOlsY0uCcjqhwvq1NW19dNiTS4vbutKh4m43cbMmYW
	 XbCM7HDUCC20nXqQ1cY1wimZoKxIZ28CWBLg3tDRmPF1y9GtbUyC0NPtHoCa98aaOzCbV
	 Tqq3ujX7dIdfk0IyQvboh/XI1idWC0VD0u3OEOT0stR99oJxKbAf8jj34vA3gA1te4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=iL5JVRjlD1j58Hb7M9pwob0a5n+pyjZoFDG4rdFHll4=;
	b=spJ57t5HVCq9dkho6E9zkXSDg1+2AD1uKGTDDGqWLF0bSR2iL9DBBfcNRwOcX37h3G/7
	 0lN3m8YtudtuYmLAcvj+dGNL4Ayz6RU4PIDkmJUm0PWkZWIf2z5r+x1/PI+RCYX2vqSOp
	 DchX6YppeQOHphaOnlGEN9/Un4NNrNhV9d/MHtoxA/ymXVgzQ3TTQnEauODoW7wyIADh6
	 vYLZZsBr//FSsrKbvtksSRsHJm6rIC8o1uRWA3Ms4tZr2Lv//0nJIYGFmPkqnVLpAQVsJ
	 +mP1eFb+f/43o9l3V+NOmwwZPKa4YEDSmdBln5z6sx0AuxlkBH4Lx/eckEpX76CEjQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QY9gqmy1;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64869606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64869606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QY9gqmy1
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso593790a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601464; x=1793206264; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iL5JVRjlD1j58Hb7M9pwob0a5n+pyjZoFDG4rdFHll4=;
        b=QY9gqmy1u7YSvXLC72aO0Oca14+6EOwVT2NDLhK997vpb/IGOheyfhyQEBGY6sctQ6
         YB9USZS8MlO0nE6t3WC4yGhqkg4P5v0LL6DAhXfRa07IdUAF9KUzzfRjkWH5T/MHiX7i
         M+nSWMYMAopH2EtIJeO1WdT7/UfjUhQig/bIfb1mOsOZNbnqZ1D5W3OIvJcYI4HUOHiT
         FZ7KcBd9Tbi1zfQM9bo0zVtqkrxi2qb90Q/mYtSqUqWPVRyAvzqZ/cDcVXvNcptquei1
         dtOKrRBjDDKfqMFXmIOckWeTsjlC0hFgst695sb9H4+jPAy4Q5LxTwiks3tiYHBzECXi
         UjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601464; x=1793206264;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iL5JVRjlD1j58Hb7M9pwob0a5n+pyjZoFDG4rdFHll4=;
        b=L0I70oArTdZfpnuGo0oC+zAtaNx+F7U3N0SURt/ZNCcQe+0wvAFcnsHzmUbmOM0Rc4
         BPE66jXMwK5Tif3kr1NA3mNnda13pgrYiDDKOKIQPnsEbRB5Txkac1z+EdbE2RkHNjQL
         1P53adiWeka/WVjKCG/Cex087GvHx4PzZ9sPMDTgNuGGlyWtmUN7NIxt5EaUXEFmz9RT
         kdxm1fTRXA/3+IwowHD8/EOG/rrTDc+DKeBZoIH+E3mkSayVnr01NMPwnxYWuy2/Ifcp
         f7+/11zL/mlFcoufrnpC/IWH77FVvsfVsigP2Q4dfwav0zLqlnAB974Z0JkXI+0i4WJ4
         tT+w==
X-Forwarded-Encrypted: i=1; AKwUvBzvmw0ERKJQE2xx8oAPpjHkbmUs7zZXNWSFqs7hbGh/iQKbGExkf3t7g2+RhCr+L6IL1Xs+Eo6Uf5hwb0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBj7iCzavEIUneJSebNPUJmqMHSZ+mEUgEqDtzx94huPAgiVH1
	fCzFgwfGx4PNa45I3fJCAuLuh4n1PKzMunbP1Uu5IE9Yltuv7UN+y2mx2fo/Pg==
X-Gm-Gg: AYBFou33Fsfgqqtq+jtvfh+qxJ+ChTPuOBDthgIy5H1VsHV+RTIiyupJ7fDDnCaC+fb
	44SmQbS4DmPx+8lbP1EEA2e4TqXKgDsgubeJayt0jKopdTuPlmb0FN/NLSDyumeAJzdkeCJwkzG
	ClZei40LtCFp8ShK54aUKl7daBBook0rB2MLkcqcBL5dlvyImSBkBn7j/QQ4noYJAv4EbK7Jn7e
	89Mqd6uwXqllMJSbUnQzlnNle/kfjOenPlw7tyeyMVafQbT73+WNQ0XFHlZLmvtkitGQ0CwD8fF
	bw8Cku9C6Av/c1eA2eodBLC6Ub3CiFwebQ5Xh7pN4lTNWB43xWPQgQcWdpBWzmX4gk08qAnW330
	6ogDRd5fm6hbgGWzVXtpD5zKgw+YmbmarU0bh997JrfA9Zoct/4KDxgwcBRUHL5i8nNrjyIB8+J
	kmJvzk3dnnKa0SwV4eFs8tkxuLFGn7J1fbNInIbMD0jFFCdHhunNLpG4oeyJ2y5xtgefszBKco6
	izFyvygLAIb82e//4SM+c0yiiegqMEXape+m1wjEdX9JkrLkflHawz/CCtgIQXp2DYlY9Kg8TiQ
	StlBq+4dyrlGKQ0I2n3KCnSa+Pt5fJS+Ty40sNCHVaeBVm4FhMH58GyzBFMO
X-Received: by 2002:a17:90a:c107:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3ad86cc6b98mr2131764a91.61.1792601463629;
        Wed, 21 Oct 2026 09:51:03 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm263916a91.1.2026.10.21.09.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:51:02 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 16:51:01 +0000
Message-Id: <DMAO6MR4SCMF.2EQPVBE2JH740@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Yonghong Song" <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next 00/16] Add percpu variable support for bpf
 arena
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <3f5446dc-7e7a-4f12-89b8-6e590b2ee1b1@huaweicloud.com>
References: <cover.1792503001.git.xukuohai@huawei.com> <DM9QXVWZXOHM.21TW53TSXHZ9F@gmail.com> <3f5446dc-7e7a-4f12-89b8-6e590b2ee1b1@huaweicloud.com>
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

On Wed, Oct 21, 2026 at 06:53 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> 1. The table wastes a pointer (8 bytes) for each non-exist CPUs, as the
>     global data is populated at load time by libbpf. On my debian machine,
>     the CONFIG_NR_CPUS is 8192, while the machine has just a dozen CPUs, so
>     the 64 KB bytes per variable are almost all wasted. An alternative way
>     is to allocate the pointers at load time.

Right. It shouldn't be per variable.
'type' can be a struct with all percpu variables of the prog. Then it's
one table per prog, like the kernel has a single
__per_cpu_offset[NR_CPUS].
Allocating the table from the prog at init works too. nr_cpu_ids can
come from user space via rodata.

> 2. For small variables, the page rounding is a big cost as this series. A
>     better way is to make percpu copies on the same NUMA node share the same
>     page.

With the struct it's one page per cpu for all variables.
I think it's better to share a page between variables of one cpu than
between cpus. Copies of different cpus in one page need cache line
padding to avoid false sharing. The kernel percpu units are page
aligned too.

