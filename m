Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514685;
	b=mcYBHvC5shLHJR6zuaHZyRyNvS5Y2g7eJa0fUZzkDsqbMAV2hhG7/8EmAgQMhDfndVqH
	 ZcnGPwWJwqvxHsKazEtjLsIbVtAjlMGdt6OlRI3Ka/HI/Oaa23vT2R9u8MnXv/YXRW4su
	 U028Uml2l1TRMVM2QIRh48NSJw3TfRzrslK/QgCBLFswcwIHlUMa0rKQuLn23Y+hr2npc
	 /MC+OguYKr7dmP/zynS1Jd7OhGjIJ+F866Q/GhQzbK4TfEtDag5Q1bK4AzTG/OvfkB6H6
	 qumhQZ44bSaGBJmBn02J/WThYM+/waL+t6jF4MCkhJDi+BuiVv9pHTBxRsNZIxvEeUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514685;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aTmACZ/+QtvgkXkB87/Q1326A2lmn3wrW3YNYzLyp4k=;
	b=JdWtgaHZQwNbITGgAhvH8CNunwqGu3vZm3IP61OYaJhLKDVnpz3sghkS3Z3YYd3qEPCT
	 X/oPNUHJOmCQqpb+yxhn/JlmDqKTiN1nYyLM325RRZwS+zve8rSOGpp8LRH5op2Ry91qG
	 dOc9c4fTIiLpPVIFSGN0nBs33JlfmYwgz9IcimEM+mseVliTfi+NZMJR2JAWbdF8ehaq4
	 +ogwKO4XpmbEb2NposQpZfL4msJBjkBNf6sgWRNXoLpOWd9FQD7Gm1dlAfxHKzw9E85dW
	 XjjN5BV2ItlRXf8X+P3RP+dsIvflWpgjGnC1tq+Tlc2dYwn8hb+V0WNasQHDzBlsNgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.83
Received: from mta1.migadu.com (out-83.mta1.migadu.com [95.215.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12716606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12716606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XjqcV9ZvR7h/4pI77pPXVunNE25bWrZE4kzLXH0JbYw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792514682; v=1; x=1793119482;
 b=si/2oLkZmD6SnimNJ+tZuKJtRdyDt48CmadO9NqYzqhwXYQlHTvmiIQ1owzOqCHbt2baDEQC
 qozgwb1UHftuHj50CgzAZijG6ySqffmCQpk+m2MFSrP+5CFUZwHePKfRUgIx9XgxZ979W14SJdX
 8Fc2BDOoO0GRD0IJuQNlmLtEUWTQ7mAkSVQu5QXazwyTpS/Mdw679p0YQVnnSRosFGRB0Z1sNBb
 nJFaBiF0lXfFNdOimrRfxG1QPPavt+y0LVZ31M6Aa/lr1Fk9Cu+uV2yvb4+WBJ07xT0cm0xIS/e
 YNzqs3y9qAxS1Eb+3g+Xmpm4GPw4F12p8cT3WMMNOH4UQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e91a7bb92a9dc53;
	Tue, 20 Oct 2026 16:44:41 +0000
X-Mizu-Trace-ID: 3e91a7bb92a9dc53
X-Migadu-Flow: FLOW_OUT
Date: Wed, 21 Oct 2026 00:44:37 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <ateadbflRqzgIVSh@wyuan.org>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
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
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>

On 2026-10-20 11:35:24 -0400, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:

> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:
> 
>   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>     sent to at least one other list;
>   - with ~2,100 subscribers, that is about 29 million deliveries per
>     week for LKML alone.
> 
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
> 
> This series makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list that get_maintainer.pl would actually output for it.
> Patch 2 updates submitting-patches.rst, which currently tells submitters
> to send every patch to LKML.
> 
> Several v1 reviewers asked for a catch-all list that would keep carrying
> every patch for those who want to follow all kernel development. That
> is a worthwhile discussion, but it is separate from this series, which
> only restores THE REST to its original role.
> 
> Translation maintainers are Cc'd because the it_IT, ja_JP, sp_SP, zh_CN
> and zh_TW versions of submitting-patches.rst carry the same "send every
> patch to LKML" advice and will need a follow-up update once the English
> text is settled.

Thanks. Added to the todo list.

