Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466193;
	b=KklWi8/OySfgNuUQOQtiKVzj+RBCjSr7I3L/ESlynhZcyvk8plXLskOezulB7V9YjyAs
	 3L4jcAeCTQp6w68/rBnWBdbAGTssCdWjDTwnF9HxnrI+l+Lp7pGiLJK78t7J7obMLVzz6
	 NlpQcF1uOC9E6PhDCnsJA1Me9pusFSXJUrbICsCfY0gQrRhqNXMKA9xoRKVkoQSOym1fa
	 F73F9iQHbVe3em+mmFhWbZmfYCULW0tpJ+EvDRGno3/1ybIlzlAjlMB+OGq66PWpoIpWp
	 Cv1ehCcKNPLSCCtvnKurEdl6GEImwc/MiQRp0nzRXlUvEhboFZu1LT3hsFty/00MWnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
	b=lCfH9C3s8Ffh/fxdQJwthpBp/UsEZLwQ8r48IMOPTJ87zVZW5MSieNI+2yXpUZwdAi41
	 A/vzYM5gIzAb4KOuZEFJvfitNuZwb+QgLPiYYSczSrIArJMNFIdil8OPJdryE5bpImEtr
	 CUiZgfKQCwgd1jXK/xSI7iH4WRBmXZK7EwDFuz601V/hkMPr3/IFvSnM74QN49r8iYZ5O
	 hI3jKjFGZNlm306+dMV3VT5dmxpCP+P2Lr0ZvMKa+AB2fKKmXjANIVCCEMr97hOLFYYBe
	 Q2BPv/c6Fpubx2xDKnvPHmki+YoKS3uuRBZ+p2sxKAlyX6iJjlQrnDi41Xc44xWL09w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8E3v5cp;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0478606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0478606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8E3v5cp
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a070755c8cso777949b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466187; x=1794070987; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
        b=i8E3v5cpMSfAi1mqqro21Q/8Raqh769HEWZJL46CwnM2v9wK2OLVzJsAuCSE9qf3zq
         tQY50fNwQDpf+SJSRQlAgqkCXH0WUUKhP57b7/iP77Uf3WNogA/laZGasAKdFWEz783R
         toarBNdQRNtB75h9qwyX3N4XLDJa/7DPVsqKt+7a6In8nxnIlpSFdU2WiAXEmjKaF5ks
         XnZGp+AauqkTqlVVZmUVXtl4Ag0HgI6GlxH75NYUPYnvp305gsOHdLStmb2NDkg/ihGG
         sRkldpqZ/xsViTVAvbYKqxtnovFp7bSCwKkO/qhbTEhCAOOAoI1dYAM/lSLdEuekL6SG
         SZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466187; x=1794070987;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
        b=1AFGJO649ku7Njmd1Z6nKZvTFDpfqvOPCVfFYMxHxckpEvGD5R/w7BK96pQDKY0YL3
         iI+JBe3rvz2GN/31oRGoJX/ZhS7FIJ2rY731KlY2go2bLbQtRKzQBfRxLtOW7ebzCmzD
         ltuaEAeuuCIKcQh3nLb4HhJbKQZ8cmiAgiczacwEQxfZe+TtJkal+Q4jQkuC5iescPk2
         YFqT/ED9aVxS/L1lJ5DHbeZ11I3myuFCpmPn791UoQEO7y/oN58CdMq/BHuyiPDHX+jy
         5R05dt/1Z2qiMBvRFfDYXNLPmFN5x0CmV3o3BTalQhww2bT37u+aA6ITsKcsCFCVQDJy
         AUeQ==
X-Forwarded-Encrypted: i=1; AKwUvByyB/pbpEyjofiejTMTdgt5nB7LnpOpZAnCNBXXqt3He2fSRwjNf6r2L9nhQ8vseEK63kAUML2ZQHlpn+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYITes01ssdt39/JqmIxaF9bQ2ASDRmTIgKkr4N00Q4dd9qq4OkE
	8PCRyP7D+nZDhbV4qkeGPcNar5sNbDa7/6iDrjIyggoyhCdLWAhY/FHX
X-Gm-Gg: AYBFou34jtWrzjywlSbz+wnOcmghCR+/tE8JyaM9gfZLY9WCMbxOwGHaLwCtubmF5/q
	YvFSdk57Igg/G4XWioh6YM8nrzCE3G+im9QtY1FAAQsQ9yBtMEtX3e4LVXHF41YDb0qr6LKnLXD
	JZjoATPp8em6Rh+gsBAQ+aCzqYCui5rqM5LtsoXelgApF3zf+sxfg6FASWYlieA5++IOsYpSSLr
	jsIROUzwRfWHlcxYBUWEZd8tbFwnKjRG8XyNfKvHnG1vV5kxynBS6z9M0TEjcayQPNK9ETP9FyA
	DGxAHWXTnc6cqz0p3/+YeMb/Tiv30lbGRmZHCcd0AWHyEOG6DVSv6q5Dq4pOZWZc0hHS/4gHOOf
	o2vEK7kJy7aJqO6aUIuhuoSJmqp9zbC1ngbopi8uXrzZ7XMggAcmOQruZ9+1FG9RImatulxm29m
	Ik4srZKj3Ye7hT1FGML8ZLzRibGc10Tr0I1nXPVKnAJoKeEMmOng6VpW6dkYGSo4e83p+hr8d2v
	SfnG0ZjFidjxy/KHkI0V9+c/W4PAHcnQyCuRu2ha6IEmyTR03bKtUS2eH/nejT16VoWf+2/MuRb
	JHOwWm/E9LBhMuGvseyBBsLR+NlAVNB+3dF3qnxSxGmdpSOYMWPMQFBX+Chs/EeapLvnHNDXMFX
	VLfLVnsYRDfI1jHPu+VgNIJtWiZGTlVFlEN/Yx557QfmrUWmpYqy6vjk=
X-Received: by 2002:a05:6a21:b91:b0:3e8:e974:e45a with SMTP id adf61e73a8af0-3e928e26581mr4547143637.63.1793466186813;
        Sat, 31 Oct 2026 10:03:06 -0700 (PDT)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm817264b3a.55.2026.10.31.10.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:03:05 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:03:04 +0000
Message-Id: <DMJ6PAVGV9ND.29T5161F064JL@gmail.com>
Cc: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alan Maguire"
 <almagui@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hazem Mohamed
 Abuelfotoh" <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>,
 "Martin Pohlack" <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 03/13] bpf: check CAP_SYS_ADMIN before looking
 up bpffs delegation names
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261031130959.23472-4-wanjay@amazon.com>
References: <20261031130959.23472-1-wanjay@amazon.com> <20261031130959.23472-4-wanjay@amazon.com>
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

On Sat, Oct 31, 2026 at 06:09 AM Jay Wang <wanjay@amazon.com> wrote:
> That is free today because the vmlinux BTF is parsed at boot.  Once it
> is parsed on first use (CONFIG_DEBUG_INFO_BTF_LAZY, later in this
> series), it would let any user make the kernel parse it and keep it
> parsed until reboot, which is what the option is meant to avoid on
> systems that do not use BTF.

Any user can do that without this mount.
/sys/kernel/btf/vmlinux is 0444. With patch 9 one read() decompresses
5.5 MB into vmalloc_user() memory that is never freed.
The parse is the other 2 MB.
After the first use the kernel has what every BTF=y kernel has today.
There is nothing to guard.

> Check the capability first.  An unprivileged caller could only ever set
> an empty mask; such a no-op delegate option, and a malformed value,
> now fail with EPERM as well instead of being accepted or failing with
> EINVAL.  Privileged callers are not affected.

That changes what user space sees, with or without the option.
Drop this patch.
