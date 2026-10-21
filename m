Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571626;
	b=5byCiHu90IcVRxOxMTCH9bfXpBwcOG7zZGXgh2hOv5K+p0SWe6Kh8WZKRh6wktqtR/cz
	 qcuC9FMk9ETPqR1eJ/HDAWkjlnSGyT7ySfipml658gpZZgwNUqauwAUDjJkU2pM2zLXDE
	 jkvsjsw59N8jvg0pKRL2WkV+SEPoUreTUlfmjgOhuAff6QOYSuSW8PSRR70r03K0YIkxA
	 2B19ghQK+yxugO7mIN9sVTFdeLrKMv5NdP8OxGxDTFP7htsUxUNtcnrqkTyvH57wbzGNN
	 DLAkX64dfwHSn1YlvJ0vaAtHngRW0teFYmGE5DhNg7STh6IILvvz4F/2MFuq7WG2cVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571626;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e4ljQCp1A0lCjXRbB6B/54mgrIa1ydKZO0oOPV1MZWY=;
	b=VwUhnpvoeUcuvw/IGrftlI1Mg+i74i2ZKzBr25bSYrznrutkl+2imEMoYz5tvxeTEx/R
	 dx878+WZvdjPXee0iaxIP5lwg5ooMA15tbMUlHqK07bnVExmzwY0PFyf1rpxzmzIyFtIj
	 lN2bLWGv+6LPBae0F4C+6hoigRR7BOPXgzP9LxNlKD7mit9P9GV2gI25ZKqDLh2prkhdQ
	 GkiflANC1WwzZny6mmHmLm53vkTSVYzz6UrjTo7CJdYxBf6oOBGozL635IcW+yOT4kdKv
	 jJ/RXFQzot5ip2EZSA5mnAflNEFUvcgX64y3wgjeMlBYLCu0H/Ib8AXEOftYgiI5Veg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbvueI6q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8696C606A319;
	Wed, 21 Oct 2026 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbvueI6q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BC61F000CA;
	Wed, 21 Oct 2026 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792571626;
	bh=e4ljQCp1A0lCjXRbB6B/54mgrIa1ydKZO0oOPV1MZWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AbvueI6qVEfSkME0INLRce27g+EAriAu60wPo4YPckmYmXedmMN2m/USjaefxjKav
	 NAg/5Oea+v1Ftc03okgik8zumtVaUUxlmYoOGsmUV28nX4fGaTq6qJkD2s8Ao4skdz
	 SOkQh5Y9uKca/AP4GkBaWfnTKPr2OCqB98qD+QIZKurXzlfbXnLXoR73spi7FFM4z1
	 pbC/PKCQD+8EizBdJvTex5yYDzXqrucPvWs0eztPrCjhSy/PP15ZaNvVApyDBEWSjO
	 tNm5JnmMO7di2MyhKx3+EAKKq9AFxrI3NmGAm4SmBNESW1VnKJaGaOqMP/Hp6C0oxV
	 MJ5bO8uxPxy7Q==
Date: Wed, 21 Oct 2026 09:33:39 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 2/2] docs: submitting-patches: make LKML a list of
 last resort again
Message-ID: <20261021083339.GE1795367@google.com>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>
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
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>

On Tue, 20 Oct 2026, Konstantin Ryabitsev wrote:

> Commit 77167b966b7e ("docs: submitting-patches: clarify the role of
> LKML") changed the documentation to say that all patches should be sent
> to LKML by default, because get_maintainer.pl always suggested it.
> 
> Now that get_maintainer.pl only falls back to THE REST when no other
> matching section provides a mailing list, update the documentation to
> match: send patches to the subsystem-specific list, and use LKML only
> when there isn't one.
> 
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
>  Documentation/process/submitting-patches.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7ae79452e1b4..b4a2750599a7 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -239,9 +239,12 @@ patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
>  maintainer for the subsystem you are working on, Andrew Morton
>  (akpm@linux-foundation.org) serves as a maintainer of last resort.
>  
> -linux-kernel@vger.kernel.org should be used by default for all patches, but the
> -volume on that list has caused a number of developers to tune it out.  Please
> -do not spam unrelated lists and unrelated people, though.
> +You should also normally choose at least one mailing list to receive a copy of
> +your patch set.  Look in the MAINTAINERS file for a subsystem-specific list;
> +your patch will probably get more attention there.
> +linux-kernel@vger.kernel.org functions as a list of last resort for patches
> +that do not have a subsystem-specific list.  Please do not spam unrelated lists
> +and unrelated people, though.
>  
>  Many kernel-related lists are hosted at kernel.org; you can find a list
>  of them at https://subspace.kernel.org.  There are kernel-related lists

Makes sense.  Banning Gmail addresses would be less than ideal.

Reviewed-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones
