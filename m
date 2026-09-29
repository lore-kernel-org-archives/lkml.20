Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B945C4EFFBA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699348; cv=none; b=nV0gxI0a3UdT5aCstnMJz2EQ25N+ZNfIibFkjEWUhQZKNbX/WBGorrnQhL8XgCuxiFeuvaZzGWi52P0fz7h2RFq5qV9g7I0McGfH/knzF6UUeNVg3d0ymfbRW8RYEcLdn7nqIfiA47wmaJRWOk/GXndpFbB3q+ZIoJbMnRV01DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699348; c=relaxed/simple;
	bh=gczGrvEptEHhycke4/gymHjEMbqsLy4UXX26l0bR3OM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=VPDfWIaZaHf+ATk/cXtl0TEd+YMs9D3m2OC+2Sti+HGGUSPb79rON6k5AMJgvzhMfH6bA1RRqMEOvpKLcEYLMQ+ZK0cbHT4PJEGwQxZjAcpm/rjVhfK0wAeig4QU8eY8YLUpTXMJpyNImUPVFaoJV4Dr7r2giehBNjtorAMrUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgRxOj1b; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgRxOj1b"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2118819a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699346; x=1791304146; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gczGrvEptEHhycke4/gymHjEMbqsLy4UXX26l0bR3OM=;
        b=AgRxOj1beqZDDRcpCeFm4YCvRZ/D0EyNXpFlbqUQpCcwaEIxnQqD1SwbMJmrwLkoIK
         ascxJrwbKxqb30rhCgn9dj8nIVrqBMQ01+rIe1mp60NvUfll79VEgmvxVAVV3ZXYVd54
         4ZXuKJWBB1DF5DRNnRN9VrqU2CVk+KC5s0y3TkDXc9M48LvFKYCWdScHl9ttjmNY2Whr
         G/dWFh8S8Ia/ln9VhfkBPY8/Uj5NslXeAywlHj49tiKeFKU1f1fLdrlFLMS9zXtXrmFh
         apWsEnAbOdar4pw8DngGJ74Z10V0D68m/WQ4ecy3ByxrnD2ViPwQWLoJNyam0qTBG8Z1
         aFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699346; x=1791304146;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gczGrvEptEHhycke4/gymHjEMbqsLy4UXX26l0bR3OM=;
        b=zh5+4bxukrzFVPVtfn0bZ+ezIGGJjbYXIigU7RvyuSVU30TvJqRcMvwnLYkN0RVaxA
         Ix4YMuyAGWWwmjMMg4tXFwmEatJLPg2jaBJYDC/VI+bluPJVBgsbP06csEmGEPME8xRs
         FOdiZpEhyGeqxtsDr48dOjWiggbim1EEUEDrRmF4QnXiIDuKrdx7Sxi8F3lHEXjEhvYs
         F/wklhLoYCrrsgVap2RfZHtduAUm38rwwhMh4p4uf+Bd419j4zjov/YgFr9vNdA8nQi2
         qs8eu+vCYivlC4Y4eoKq6ByyoESyf1u27EA7iKcMnRlfXZpbmtAyGKs0zzntrB4UUMD2
         pY1w==
X-Forwarded-Encrypted: i=1; AKwUvBwTg/7COgn0dur8ERXllZ1aOOq/vCSqyirxu9qgsWwXOtxT2BhswuweANZqFOt0CECe2Zaoh6d8JwKOMIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1HDVMPPOrI93CPbhnQVcz1m7EPeDzq1KiJf9gtAkH3WLYEWmd
	ZUekQhjnugaz1unx+bCe+kURe7HqxB6+jjdWqc34pwnv8UFjnGiesPKD
X-Gm-Gg: AYBFou3jf61kxEaqltnWzih+SqqIwoO3l35wXtU+Rk6pWvQ/Xeu7LUWCyhYZooe1bbM
	ftaYeyDXmkKDF4PzIKKYh84UwqYoa2EqTyAlJatUg2lXzKBv5EAd6IWa+jAuQeX7M05IHF1Flei
	HtiOPqsKcHXUk0548cNamSgjre5Li044Nm3jyxZK6EEI1Vf8Ztcj8vlzd/1VfhXczb4cjxDKhnT
	Ttqp0mG/ls3MH1FPduL0eTAOeF0tLoz30sxSxLAzqdDDRzbPoaY7DgypVrvx4gzM1lTtl66roJu
	idvzaHJdtcGTe5kkSQct7zbrJZWcYE1d0GsIqgA1QLZUxlIVg2VxKwGkAi36BmwAkOoWPh6QCI9
	mt77togDX/sQFrf8C6qNUiZSOU3fdSlmj3XOOHfgk/Q0wIvVmTZoHCgr/X24VidAs6F98efGnwP
	vELQ9zZrtV/2M2RrqovO3LE9ikDuwby6WjyDuy38mPe5Mammif4B8qZ1KUc63xwl2h6XQD53soL
	rnjA5937F8MT60ZI+v1cFOE4vO/7qI0YrFuZ+I7p8uMZ66h0B+/c6X9/UCXCmH8ioivmRybV1tG
	KEea
X-Received: by 2002:a17:90b:582c:b0:3a2:b70b:9cd4 with SMTP id 98e67ed59e1d1-3a2b70bb0a5mr3996708a91.12.1790699345913;
        Tue, 29 Sep 2026 09:29:05 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49803d745sm6413747a91.11.2026.09.29.09.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:29:05 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 16:29:04 +0000
Message-Id: <DLRXXU68JZ5F.2FG7G4UY1DX7F@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] selftests/bpf: Set CONFIG_HZ_100 for
 riscv64
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20260929083924.1851840-3-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-3-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
> Let's set CONFIG_HZ_100=y in config.riscv64 to align with other archs
> and fix this issue.

x86 has HZ_1000 and config.ppc64el doesn't set HZ at all.
The test fails with HZ=250 on any arch.
Change 30000 to 40000 in progs/setget_sockopt.c instead ?
It converts without loss with HZ=100, 250 and 1000.
