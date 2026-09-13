Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E678309EE2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789293132; cv=none; b=Kva49Ms3dNJ3OkM1kMT6DJ65VjgZo85bHFKxG2Q8f3ByBYCWxk6jxLFdjURwwINnIvPvNzLNcqRdGSBdg9pj7lGgUEsP6AYY4u8qCb2Zr4Tg149WxlUf6uJ53GChqx9Ncpk/lFtmLdwAeOojvLv1IbF8Vf8mlVQg5phthyWpyfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789293132; c=relaxed/simple;
	bh=+YGX0XdjDiE0elQhgVlF/aVXlUoS+/b9GZ0yBeT34HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUt1a204EfK6o8NkR8FhvFZ4b1rw2ExB90wJE+pZYPHvKglul2GzWKNyWXa+zSoihCn3KLtYoZtyS1vBs7TDfOnBj1elU5ZMVfVHsQUNx4Qwr3OMdH85pC2QXGA+6cuakEPLfYLkX14/2w0Uy3n2ugtV2GCkO5yfposbQBN0jrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=f9vLLxR6; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="f9vLLxR6"
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 5832814C2D6;
	Sun, 13 Sep 2026 11:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1789293129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o7dmRBlyQjnMpbvmecLG1K8z0y+GwO8VR44jdX5pGYU=;
	b=f9vLLxR6xn3y3Nmd6Qq2OpdXAmo8ZXjh+O0Ga1ykaaGC3Fgb/6kkFFWXG3/2e2cXsNRjsj
	vskwXRr7Gxaw5f2GfTuBZPyBlG1/UfLyyKveJt6bVWaTcpkeMzn/80jgKGx/NYigSYUI8C
	qzVE25+teN5B65KHFIdZUDNv/uzA9t91u2NPfPdCPSNS/Oh1ZHMC3CA9ItCLUojI4zyrSn
	4HyGy0RwSWLnPORInKKnvbPAtvAb6tC5KMVXH8Iyya7BSZleCuHfCRmA/oOSCtKlr0S4gH
	jktCQF5BkGjEi7DeyesW9hlBK43omnN8HRoomiVope0re2ZDb5oebgxtnjBZ1w==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 326c0bf4;
	Sun, 13 Sep 2026 09:52:05 +0000 (UTC)
Date: Sun, 13 Sep 2026 18:51:50 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Rosen Penev <rosenp@gmail.com>
Cc: v9fs@lists.linux.dev, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] 9p/xen: Use flexible array for data rings
Message-ID: <aqZyNoWsZp9mvrN9@codewreck.org>
References: <20260519015739.634423-1-rosenp@gmail.com>
 <147ee577-8a72-407c-b332-45dda9f153b3@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <147ee577-8a72-407c-b332-45dda9f153b3@suse.com>

Jürgen Groß wrote on Wed, May 27, 2026 at 07:39:07AM +0200:
> On 19.05.26 03:57, Rosen Penev wrote:
> > Store the fixed set of Xen 9p data rings in the frontend private
> > allocation instead of allocating a separate rings array.
> > 
> > This keeps the data ring storage tied to the frontend lifetime and
> > simplifies the allocation and cleanup paths.
> > 
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   net/9p/trans_xen.c | 68 ++++++++++++++++++++--------------------------
> >   1 file changed, 30 insertions(+), 38 deletions(-)
> > 
> > diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
> > index f9fb2db7a066..5a110d71d18c 100644
> > --- a/net/9p/trans_xen.c
> > +++ b/net/9p/trans_xen.c
> > @@ -55,7 +55,7 @@ struct xen_9pfs_front_priv {
> >   	char *tag;
> >   	struct p9_client *client;
> > -	struct xen_9pfs_dataring *rings;
> > +	struct xen_9pfs_dataring rings[];
> 
> Any reason not to use rings[XEN_9PFS_NUM_RINGS] instead of a flex array?

Rosen, do you intend to resend with this fixed number?

Given that's just a two line diff from your patch (just changing the
type and keeping kzalloc_obj instead of kzalloc_flex) I can do it myself
but I also don't have any direct merit from it, so if I don't hear back
I'll forget about this
(unless Jürgen says he actually read the whole diff and it's worth
taking for simplification, I don't have time...)

Thanks,
-- 
Dominique Martinet | Asmadeus
