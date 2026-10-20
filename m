Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511591;
	b=NBpQsxfGBJ/mKT6ToZPm9Lvr3B17x3MFqTDxdmu7/lQpoWe6f9GHLrYa7DdToLjvTooi
	 MyMshK3n7rpZcW3HVXtDL51mnmdlIxWJ7Hybk3DgtzvrJ67Xl2c3+qAwzHiMDXDVF2WVy
	 pPaXxP0JTU5esfqZOXyulNmjYJQW4OR0feT7owxPOB4j102gTn4P6jsz97LKonHp7Uh7L
	 0lyxbf0E+smKEXgBwkVx0LB0HCCmvljcypPWaAajcnzyUiubpZVKU3cQ652/No7l4PVji
	 ffyzgzH2ZieHGEsY8C5atZU19OXSAxDO8lY6b1ECIhGPzeZIOTQS1D4f0CBqhbqepHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511591;
	h=DMARC-Filter:Received:Received:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=WBeM+RRfJBDWsLDzUHRibe0EMKqyQuZjJllD1Oecmo4=;
	b=zWeorF6NUTyiFKkFxnWEiiUK3CeXWn9BRHWvGs9o0xV5MpswY6Ei+egrZSPDFHo6/EB9
	 lLbW9e2fs5r6uHpt+Er580SF9lBIuy8e9ZkDdy3zwaNiS1G510po37QfLzrizKzLuMD9J
	 82heuNwr0jPoAqxTNuW99ERTL0X/gyet75FshBduVPd6anaeFfO8KuB5GyRR35kejQRAE
	 Z5X9iQkP8KJqSh+mM672YEBM/OZij50tpdtm+wzVhMUefInW0/9baaD9ShYu7Rnh4r20S
	 INovMUADKt/k9iR/TFKEBdtpyazTbXCzwrJ6K59txCYQ8jmxzBnbQukzWCI3w9d5A0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CC606A323;
	Tue, 20 Oct 2026 15:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 3782B80249;
	Tue, 20 Oct 2026 15:53:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 38CB62000E;
	Tue, 20 Oct 2026 15:53:05 +0000 (UTC)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 08:53:04 -0700
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao
 <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu
 <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
Message-ID: <0605a3c99b55124d1be71c9939f636e2@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 38CB62000E
X-Stat-Signature: nm58q1jqzfpj8488pof9huhpymuwd5fu
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18QG5lVyX5MxC/RKKUymBzbOlQ9yz2yzZM=
X-HE-Tag: 1792511585-118373
X-HE-Meta: U2FsdGVkX19ugfTT/zoJi5JEcD1Cug4kdNh+tK9lsl6L2sIhvX+Pxa4xiK0n3mFEVztzaLKRWLpTE6mkSUXSjgpF9MNNDen8J86O4h8+CChScKDFHH4ZXF0obh8W/2Z5iwgs5KBtBRClovGo1GHtVfSaNgylt67DVqhQnqy8ZHcQU5I04O46fB/gppP4sYek+yb7sNeytgdYdAY5UnmAiOV4/TkXJ8r7FNLxaUHoPDLTEDYlb2mUcCgAOR8aD1YHUQJ7pUGvqeu4Pk5msIqqXhJ74CEqQawTM3S7RDEfV3w=

On 2026-10-20 08:35, Konstantin Ryabitsev wrote:
> LKML has become mostly a firehose of patches that are already going to 
> a
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

That's not actually true.

Lkml was the default mailing list and other lists were specific to their 
interests.

> This series makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list that get_maintainer.pl would actually output for it.

> Patch 2 updates submitting-patches.rst, which currently tells 
> submitters
> to send every patch to LKML.

Which was the documented and then desired behavior.

No worries, things change.

I too stopped subscribing to lkml a long while ago.
