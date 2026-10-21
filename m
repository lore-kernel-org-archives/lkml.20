Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569227;
	b=eI6Xwwg/bT2049Xu/sq3HBsAdyQ07XrsRZf7vu2FtKp4AWwGqiXLZ9gjjNVcgphotSMD
	 10JTaB/IQX7DhrHntRAQstTbu3zVKNwz2ZYJKyZQMsJ97tnsMF4SBFmxhV9kSvQadqmnr
	 JHhAwkUU80z25GYZdJOXnAqYv84qg42u4iahVEOI2VOl9eAYtOoQWVAQq5yizvrqz3AGr
	 VJqbJw1g1AgopG63aR0zXvIOuC3431V6s3WYyF/B8j0Nf22Zb6B9wn67nTh4xzVtj1DOy
	 j1mYbuSYwnbCdaPiBDEpsVzMgsDMS6ILkfNn1HryACMuMrtg8oGUpinUQ2FN2O9q6Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569227;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bhy0oyRetX168I3CYw/iHInrZZxLMV6KJR6cfcucIJA=;
	b=fL0fedBs+aoiEOS3wOag8DTLKELG1wmm71Lp2JBsdBBwOZlOxWA74zEavyFYfEjUP3n6
	 22+4gwpuFAT1wTQtXsLkJbPHwxwhHzfiurpnKpvKiXBrcjhd+CtXaK/wpwzBqdg9WBs2p
	 Qt/sv8Kj384dD6sIUJelQqO3i+36VxANy2970wP0VObG9LnwHwkQYw1cOmPGlCJiuWToH
	 zA1AuNwVl0EdZ+vkx7kZ0CGdjGwwdW9HzsLpZdCEWQcTV9NRcHq81OCe6tBj4Y+oeLOhY
	 NSTjeU/+ydPkapF056rgAp1Zvy+MR2sK6hnwE+NxKF15QgOYu9af4og7xZT2fXfSxiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=AaMspNBc;
	arc=none smtp.remote-ip=61.135.153.163
Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F714606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F714606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=AaMspNBc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792569222;
	bh=bhy0oyRetX168I3CYw/iHInrZZxLMV6KJR6cfcucIJA=;
	h=From:Subject:Date:Message-ID;
	b=AaMspNBcAlZYeSyktyDx6+smnysTeA8pUlNL4bDy+pkZ3Tj/sv6bU5pIykUobAdPs
	 UZiEVlhHHx0qoEG9325QJ6kO0YY2e1Yd8X2sVcLx8U/SLJwf34Ye1ZP9r0i8RszLUQ
	 5kZPssj5SjdKxQzyR/WFfun6XD4+kwgiQKk/g9tE=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.3.56])
	by sina.com (10.54.253.32) with ESMTP
	id 6AD86F7A00002678; Wed, 21 Oct 2026 15:53:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5760734456874
X-SMAIL-UIID: A986B4A8D67249C0A2750D2D5F8A8120-20261021-155333-1
From: Hillf Danton <hdanton@sina.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brian Geffon <bgeffon@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Date: Wed, 21 Oct 2026 15:53:21 +0800
Message-ID: <20261021075322.923-1-hdanton@sina.com>
In-Reply-To: <athFf0kXopUKh2-V@google.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 21 Oct 2026 13:56:17 +0900 Sergey Senozhatsky wrote:
>On (26/10/21 12:23), Hillf Danton wrote:
>> On Wed, 21 Oct 2026 11:42:19 +0900 Sergey Senozhatsky wrote:
>> > Split struct zcomp_strm into separate compression (Write zcomp_cstrm)
>> > and decompression (Read zcomp_dstrm) streams, and split zcomp_ops
>> > context creation/destruction into create_cctx/destroy_cctx and
>> > optional create_dctx/destroy_dctx callbacks.
>> > 
>> > This decouples Read (decompression) and Write (compression) paths so
>> > they no longer contend on the same per-CPU stream mutex (Writer vs
>> > Reader priority inversion).  Currently, a (low priority) Writer that
>> > holds the stream mutex can be preempted by a (higher priority) Reader
>> > on the same CPU, which then blocks on that mutex until the Writer gets
>> > to run again and releases it, which can take a long time when there
>> > are other runnable tasks on that CPU.
>> >
>> Given lock like mutex, priority inversion happens from Monday to Friday,
>> but I wonder if you are inventing some wheels in 2026 if proxy excution
>> works for you.
>
> Reader-Writer split is a foundation for further improvements (like
> singleton recompression stream and so on).
>
But that split is not needed at all if PE works, yes?
