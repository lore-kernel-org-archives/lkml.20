Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248713;
	b=V1HwIJE8QKpW7WkWusfp1Jcd66cM3StXJL3wNK9ojCErACYI0QF0q0FNjKiWa7q5YeVd
	 QqyGZs91C2K3CkR6YOnURJeK09D+bodjaEJgGEmPyunhprIaI6l6nh5Z3ylx0fWsnvcfo
	 R2KI9TkGCj9YYdWod0l61JoUFSptflp4NvdxXWMc5wF7wNtgxunXnzyLQD9unp1087ZJt
	 4z7Ub7YO6zl93OBjfuw/VudLHx17GsNEPKNPLbv0Y6sZYCLnqhPEM920dIkIaJrc8rJNc
	 BxePZ19PxHonNht7cGKAtm+jcaczkqkNCaQ2mi1IGB96UDQCTtQ+ELRvbXmhHUjaiPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=y4Cmesc6c6L7Z5O7qy6m8HiVqUJHOjQyHRE0+sJjwZY=;
	b=oaikjRCLD/+R8s1TyYfBS7uOaJ+bqGx6xY5oZxcw4PaFvPdtf3IMnFYfI9CWpd7gSx8T
	 BI5MSbi6Iq43LWSsLn1CA9ycHxWm0NZ1rqb9gRRqBcqDRCSP3OGPsp5i1OUO9oY7UZuOZ
	 YnRzaPnlYqdGUdox8G6lC/xTSMxcdw6sq1gmVq7ftG32BQnaP2BYl7jE/vY4epGrUugmr
	 iSJAluTGXfLHRoJeipXBdoYrpbZ0gLTgmfJWZlV4wa3OFVNxq6Hp7ars9nChysjTkFeUe
	 ZJPyS9Yqa3YfezdpQ+yNdTOin/xt9sPu1AnnX8CFlU0A/5BBCp/cp7OSfrR1cqLmMBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy8VJhEL;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3FB606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy8VJhEL
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5efadd183so541076b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248713; x=1794853513; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4Cmesc6c6L7Z5O7qy6m8HiVqUJHOjQyHRE0+sJjwZY=;
        b=cy8VJhELDsAbY6OD8RSOgHDNr5+Izvp1G1izy3CZX55p1Flzc/yCUo6nJUJJMogsCt
         XbSjh5CEFF87B92J8+MZIPiECD+jrDLQEkIBDSgwXOqNH6ItiDsCLPzdQmQ75pbnuLC3
         7NT//xHO4jSN01rhV/HF3+uEZExPAkSjoC1aycC+CgXftd+WVgu+u/ax9CNGe/8Ow/j4
         +pAyioRuEn1PEA/DzG3reQoKEOfv+NSbqhyNfkE6MaOug2UuS8tqRgUfizBkdplHBZ2B
         aQrGeCHB3dmZixuZg7mr7MLYzx379clAowsVE08SDRFop5JRxQx9REIv4ifKgn2aOwD0
         EwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248713; x=1794853513;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4Cmesc6c6L7Z5O7qy6m8HiVqUJHOjQyHRE0+sJjwZY=;
        b=aM24F1wU/1DN5qbZ1WEIxihnwe/Q3bD6Ept5ryhBpi7Eld0ZDfol/oagBWo5DpMqKM
         5pGNeVgQ8qxwQxLCIuQcJRo6aoWkNKMU8yf3A+qukVaLiRfF4Q1mFFutoMjqY2L/sckS
         qF/aaY8igba7/09F9H8+n3lfWpRgPLkdovbT6c3J6fjGNbB7mzIR0Y4px5k95AXn5GUO
         OA007TcXYtl7pGZtVV24F8z5LyqMDj+OczhNrwy6Othht68kIRhj//iEbVa4Zxi7lvWz
         MBnMat8snKMbbx1f1YMKQZXIwy6sCRB2SCnme/x8ASWevqiNpr6L56n6F63M/dNJvOw1
         yzsw==
X-Forwarded-Encrypted: i=1; AL+hErH63Lvrx2uhe5Qhc+ak7znK6khSyc6Y5hRD2vkxKOWskJwYqpQbmvwKmkeAKDM3fz15R9d0u6lrMN3A95w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dDs1wKVPH6UziEPiC8C6R4gCQ8JTYRG+gjA48X7hF7YgcnSeF
	ZQVWfpxUw/LcPIQoENmWlqAnrC4DsnScCCo5Ie8C37gOS6HPUR0NP8AW
X-Gm-Gg: AYBFou0/ifsG6IS/h457zSQSn3N94P4x26eID1Fb1r+xxO173fs3EgHidUevzGfuoAz
	gDziAuc0PEyf+8l0lejOwfAi+bBC9ZVXvD+JTLXUF/X+/woHxhdf3FQoqLKCFaWiiagkmWQBQF6
	EO3rhJZjvfank7xblgNfqvacFhayrWidpGm7mczBsnUDsLHMe+YH7QeJl+GWYQIlW/aQfOU5cih
	FMOf+NjD0cm5mdZ9fMKwzC+FYJBRkpZlHq501zGQC+UbD+vgKwpthHru7rHgUWVwiGqLzTy/mw+
	IgbUpnxBZMBNMmY9HzMTY/PcJdi+8sXHBI4zVyBQ4UZykqqXpsVfQQHv56hAa5nOS0ntZc7ZmNJ
	k3kCUMiuGeaQufvVNRNFiOBcQfdIi1vrYQxkTpfS3//9CAsJ1s5Ftvpa+Pxx22BNsojEP9xbnIz
	EckQhM4rw+mtq0S3bsfmTCHB0iWD+z5gMuLOAEX6x2Ym1yYMuRhG5MUSqQshh1Xl9Ha0xjHuw6I
	golt+xqDUdnnfiP1bUJ5Ni6uSGh5BDywE6jlC6QjdXazpCjx9LQeSjYNhd1Y2PR6zWTEMi4g09Y
	IhZ/9ICFbee1BNKHRqopbAWuyCz/2KpPU5aefa6T4B84aBdQegwQ8VtVMeDdPVOFWkeY/b97bbx
	RvoB/CTljE/8GCgpzWgOcFsCa4/U9RKInZNk=
X-Received: by 2002:a17:90b:4a46:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b167931c23mr197925a91.16.1794248712676;
        Mon, 09 Nov 2026 10:25:12 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d4e49sm436923a91.8.2026.11.09.10.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:25:11 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 18:25:11 +0000
Message-Id: <DMQW32TTNOPX.24GN6Q7VI6QJR@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Harry Yoo" <harry@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Hao Li" <hao.li@linux.dev>, "Christoph
 Lameter" <cl@gentwo.org>, "David Rientjes" <rientjes@google.com>, "Roman
 Gushchin" <roman.gushchin@linux.dev>
Cc: <linux-mm@kvack.org>, <loongarch@lists.linux.dev>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mm/slub: Genericize x86-specific cmpxchg16b comment
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261109035906.10857-1-yangtiezhu@loongson.cn>
References: <20261109035906.10857-1-yangtiezhu@loongson.cn>
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

On Sun, Nov 08, 2026 at 07:59 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> atomic primitive is satisfied by different hardware implementations:
> (1) arm64: satisfies it via LSE atomics ('casp' instruction)
[...]
> Update the comment to "double-width atomic cmpxchg", which provides the
> following advantages:
> (1) Accurately describes the cross-platform hardware invariant.

You ignored Hao's point about shorter commit logs.

I dropped all of your pending patches.

pw-bot: cr
