Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB44A2A5B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465023; cv=none; b=SyjhkuqcGlUWhFwYr0M7c+yhYtO3u1EnJN4i/OsH/T0xOcmkbxQmp5Oj+Nvclf4+F50vbJseDi5++povBxZ9U4ZlmJ8uQHhFnIms7bT6pvfjvr1o11O5YFMYiHaCpyGT4f8aq1Buu3U1uovjjpFkBFgQMLIoSYobJO9Qe/nnxE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465023; c=relaxed/simple;
	bh=9YDW0GZXdytRbkCzWYCKzBSrZ2I1AKfRGb5MsqNQmHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqPGRt8kd2P8G4tTD8TENprSZF7pV7k5aZ17G3iorkx78Szae37KtkzuCCgH2sIFyj7zjzU5quALXnzwsyIjiaW11glxBTNhQOxO5mvZC/8A7tsknTHxc9H+DYzat8/3+5cGTPgb+alRapX/h8T3eoghTUu0O/Guo7QamxY0eC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JWoe9HF0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JWoe9HF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8995D1F000FF;
	Thu,  8 Oct 2026 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791465022;
	bh=kYbgyoYQ62KeNeVWsHp9IkCq+0YWpE/2NNHnB9iMpSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JWoe9HF0IT66z9l7MB6wP3f5H8phlvXRSEFoebL4EGh1gM4tf3IdZ2TEWkM6S4zu5
	 V0x3SvpOjATlBC2Dva6WLFNXXL6JziH8FVpKrRoyphUnfCZo2aSJro48B/JFwECN+6
	 qTnF1CoP8Phn6UMKEK9ltKWeL7E9OLhXTv26FiCw=
Date: Thu, 8 Oct 2026 09:10:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, 
	users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <20261008-quiet-lucky-ferret-3498cb@lemur>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com>

On Thu, Oct 08, 2026 at 03:03:11PM +0200, Jason A. Donenfeld wrote:
> On Thu, Oct 8, 2026 at 2:56 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > This issue came up during the 2026 Maintainer Summit and the consensus
> > was that "always include linux-kernel for every patch" was never the
> > intent.
> 
> Thanks for communicating this! I had always assumed the opposite,
> based on what I saw happening. Glad it's been settled.

Note, that if we DO want to send all patches to a dedicated mailing list, this
can be accommodated, too -- just not the list with 2100 subscribers (because
it's not working). We have patches@lists.linux.dev, which was originally set
up as an archive-only dumping ground with no subscribers (by design).

If considered useful, I can update this patch to get us both worlds:

- THE REST actually works as a fallback
- patches@lists.linux.dev is included on all patches as an archival list

-K
