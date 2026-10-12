Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9D455637
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795056; cv=none; b=ZBgT2udFspfxt4WBd7MdsnHx6YafNEiCZ1JGimjswm+DW/6MTwRlme9bmKKNJRZs0F/WeCwzCdF878fj445U9iyo8nx7SSjs/7NlZLjikcnCj4lNPUJchX39g67pOr620tfkM3QbmDBlGuppW1ivMsT/gBJCVzdJH9MnpszEVtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795056; c=relaxed/simple;
	bh=IcJKK2Xbe+MifqNSgHnnBJtgk2lSgXJqJa+FoludifE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzSq9O9aziFqPJ096F0nqUxcr6ViVEKKnT6h1GVC/OJyJc2QkeJ4ugBdPZ5VOedqr0r0UVykkpf/fklEke8utr8pNSuibMjLkMcbQ/thp5prkOG0LnNS9ei72mDLMigNZBUwg+3K0Q4CAD3fesPomDjHokDfmNhmzf1nDiEzTRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W8pNyzph; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W8pNyzph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=7p2yZbclHLQHu2eW9vFtLMXS7m5g7KhDBCyX8hpJqg8=;
	b=W8pNyzphSXQU24CAa4ej22qYeCvxgAxiAV/qefTllhNCnEHwUB59zm8yyZCS6T
	hjr/z1WpXWXsap0YqnfjTaGl3LTcTskJ+Vw+ToCTLlvRbnXP4xFy7jub+HqEaKRo
	yi0UZ6ao3v5bwuhJWFxMRmwatjBDmWlEQ1u3tna4HjiJ8=
Received: from [IPV6:2409:8900:1a87:d0a0:cf38:5aca:d24d:b7a4] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3_7pdn8xquxyjEA--.31934S2;
	Mon, 12 Oct 2026 16:50:38 +0800 (CST)
Message-ID: <9659cb42-240a-4c46-9cc1-c0e73ef4b24f@163.com>
Date: Mon, 12 Oct 2026 16:50:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs: enforce the encrypted-file policy on the read
 paths
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3_7pdn8xquxyjEA--.31934S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4fWrW5GFy5KrWrKw45KFg_yoW8Gw17pF
	9xKa4Yqw1vyr9F93Z2vF1aqr1rurWrJay5XFZYyw1fCws5JFyrGry0v3W0ga48CF4rKw45
	ur45tasIvr4DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgyCAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R7Ml2rMn17OggAA3H



在 2026/10/12 14:20, Zhan Xusheng 写道:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> EFS-encrypted attributes are refused with -EOPNOTSUPP in exactly one
> place, ntfs_read_folio(), because decryption is not implemented.  Two
> read paths get there without passing that test and return the raw
> on-disk ciphertext instead, so the same read returns either ciphertext
> or -EOPNOTSUPP depending on which path serves it.
> 
> Patch 1 is readahead, which marks the folios uptodate so ->read_folio
> is never called.  read(), mmap(), splice() and fadvise() all populate
> the page cache this way, so one test closes all four.
> 
> Patch 2 is direct I/O, which bypasses the page cache entirely and has
> no such backstop.
> 
> Both commits are in v7.1.  I have not added Cc: stable; returning
> ciphertext rather than an error is a correctness bug but not a
> privilege boundary crossing, so that call is better made by the
> maintainers.
> 
> Found by reading the code.  I have no EFS-encrypted NTFS volume, so
> there is no reproducer; the paths were traced in the source.
> 
> Zhan Xusheng (2):
>    ntfs: do not read ahead encrypted files
>    ntfs: reject direct I/O reads of encrypted files
> 
>   fs/ntfs/aops.c | 7 ++++---
>   fs/ntfs/file.c | 4 ++--
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> 
> base-commit: d6d3455d8751854e0d1820f14184682e23ac4475

The series looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

