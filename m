Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F046B30BB8A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816279; cv=none; b=lshy2KkDBnAGxAj3s/XQUh02aTn6NAtvUPCZxLjYau8tcJEbG6CPFQnaXU1nltZCNQ0E1lBYNMFFO1ZISf7+uh/59XXi973dzOuXb8CU0spW0BSSvO1KM+jqbKKMuy4MGchFx9NV8rIjzs/DPkYaK4jCuidOSGE1RTp6y7k/x1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816279; c=relaxed/simple;
	bh=kcfEKE7rt/Pg9IfggMqdyKnd9tu2Y2Sa7qCBo/H57wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZm8SYjXtWVUWF6Qq9Wn9528YkdTAFscg5X68QcZ8Sf4oRudgAKPa3G31Sv1/RdSLZDh26qpVR7Yd8LaCMNsItBEQ/ZsFoNbqjIJNirhcVVBg4n8oPCxxilx21uZG+v/Vslpj9XTDohHXvZuPwEy0TU/dxGM9LXZAHyHlZE1aG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtN1N0ZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtN1N0ZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E741F000E9;
	Thu, 27 Aug 2026 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787816277;
	bh=kcfEKE7rt/Pg9IfggMqdyKnd9tu2Y2Sa7qCBo/H57wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtN1N0ZKpTNC+ACk+Iim+r89M0aXEkdOIv/V1hRB1ZzZX4DQjEPTjRrK12LXL8AVu
	 BWh21RAalkuYyMyY6HXDdHspEGKriCUY9qUR7JvMcfPYoieO/SaJe/0VVtt1HSJG85
	 GbZyMEorAwP0cV0HBrvvAxL9wUZND8pqA0ZPFqZMnTeZdXi3982xSYgxakZPurEFH1
	 U/qtYvQ1+JrGKEPZ707BtWNcRekosA4UdjHKws3rEcSf8VZXs35q20qDy/esBzoJQR
	 VowMX87d7KsS4t7IwLTJmVywP2+8Ry0+TLZ2JJpkTXwXu28Vfq7OCxm2jt5brNjTwp
	 ymUQ36p5OTETw==
Date: Thu, 27 Aug 2026 08:37:52 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <ao_o-y3tbs-Ccoyu@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <CAGsJ_4wH_-2NPV2j6wxN_EfAeXvDe_eUnkj0KVUu0nn+ANfohQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4wH_-2NPV2j6wxN_EfAeXvDe_eUnkj0KVUu0nn+ANfohQ@mail.gmail.com>

On Thu, Aug 27, 2026 at 05:02:50AM +0800, Barry Song wrote:
> On Wed, Aug 26, 2026 at 5:56 PM Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > Unfortunately my workload is such that I simply no longer have the time to
> > give THP the focus that it deserves.
> >
> > So, at least temporarily, step down from the role.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
>
> Thanks very much for all your hard work, Lorenzo. I can really appreciate
> how busy you are, especially while you’re still developing so many things
> at the same time as doing reviews.

Thanks :)

>
> Personally, I also feel a bit bad that I haven't been able to contribute
> anywhere near as much as you have. I still have a lot of catching up to do.

You shouldn't, I often feel bad about how I haven't done X kind of work, or
Y kind of work, etc. I think feeling this way is just a product of working
on kernel stuff.

The scope is so broad that it's hard not to feel like you're accomplishing
everything you could, no matter what!

>
> Right now, as David probably knows well, my colleagues and I are working
> on both FS large folios[1] and mTHP[2]. I really feel that I’ll be able
> to spend more time on THP-related work and reviews.

Great review and contributions are always welcome :)

>
> Lorenzo, you have my deepest respect.

Thank you very much Barry, that's very kind of you :) likewise!

>
> [1] https://lore.kernel.org/lkml/20260826082641.2007658-1-zhaonanzhe@xiaomi.com/
> [2] https://lore.kernel.org/lkml/20260825043833.2659350-1-zhangbo56@xiaomi.com/
>
> Best Regards
> Barry

--
Cheers, Lorenzo
