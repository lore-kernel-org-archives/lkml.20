Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394DA51CF56
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913401; cv=pass; b=Lp9GFyJZ8GJgYA5PC1psCj4r6U0+1Tr6qt+7tNjhHRLGcLlajsNzZDikN/8iD7ht55mzZMwvc9lLzsHiVKU3jS9jmG4EfLGLEerqeyBKRpJLopihaRk/WCx5A8m/q7xCTPx/8WmE16KcxCqVfaFvJ33E9hUHCYKY35LylIsxMQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913401; c=relaxed/simple;
	bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHd/rvSfmwBF2epSKDlS1hOkz6+QAp3Tc+wrsFa1wt4VP2ruhTIfGTgBfTokS20kMXSD0rbz3cmyYlLxYu185oVeLM969RhqCAqu56IKJHnbwrvfM8/QkPRN2dc69EXbuDiCv+7VVxH06Cksk8lEVqlbjbu7LOUao99gIkD4SmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pt2qO701; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt2qO701"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91b83459526so24305076d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791913399; cv=none;
        d=google.com; s=arc-20260327;
        b=LI7m8f9SmU10fEJwgpoFhwhpyeQ/h19AeGOPmENq5M99qh+PR/kZoaqNWW5M3zCWWa
         bxYO5NZb1y7OAtgOt8mBvoRTNMbRDGupjnHFJXadgPe8ao8XSrb2H4QbhKKqPlMp3moI
         STL9UR3dsIE98pGkqFxlu7iYuJdlv89pajWNjW63XFqcHUkauU/LHrFILW48T9hKwIwX
         HV3/pZicfsivEHuga94VQLAprSppWjRK7J2QVd9s/uDmCCRPiNz0xzNbPwEDNCD6q259
         uT8WGCBSFUJQEK5x3KR+MtvLyrHGek6A+o+x3sPGV3IMmh32E5T5wxjWWHs3ZqezKmmh
         XUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        fh=r6uDznvq0S5fiXqk1HrvhRmoRy35gEihw1xQHix80Yg=;
        b=es8a9uhsKs4g9jbDCxElKOO3ap3XKM3zAjD0hh++Y2UM1/q/jLe2EwhLLj9BhDWpzE
         KU6Q21X0l4J8vc1y5I1QIFToMN77RhVkStX96AHC0poEnrWZvzm3Ubc+JVt3E90QodQC
         EwdCtjNDzCg69CT1nEY8ConvZA3hZkVSVGVocCBBEpDLS+4e6s9IWeDpVtRZZf3+fipc
         60xMkoE6eTvAr4R7cQJ0rVSVAKn9ZGbtIqSlvX2tos+z30W55RBDfz5EDMu6BZ+xpnVO
         nemMoZuV23iI4lRLnHWd1DT5QnYoaUZby9Dh8O0SsvYErfrGNDK9cFJYbEMgK3ha+Etz
         oEYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791913399; x=1792518199; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        b=pt2qO701mKTqdATmqkckOEX1DQSSVRROGlxomXS0xQzXlfnrhNJRA6vDqZ8YxToXpY
         fRtk/E/WKyUSdDKzAZ6gWijHD5NgD+jJ8YfIoUL7VBTEmpq/cB6bUyC4cpZLHemUbG+8
         yth+Pd3tcy1IAgQi0ExrzWGNwVito9cHElFMzkDHVvAaYJKEjt10V9js56EwZzw89nhZ
         ebpSoOUzbDG5DTchNq/FYHQKcHtAypTWIfmu1QA2NUVsWnIEfYGlD3TGdhTuwPN9QQ4u
         lFAuEgNTH7JMtdjJQKXgI0VlqmGHERQv58vLlMb8bzYGnjYeinhqOBLwwt6CAMd7OB2P
         m0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913399; x=1792518199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        b=NgLKwkbq13CJynO46k8qQ2wMXeDvwaxiOIsenI5ReML7xhJ3xvIrDpB+aib13scjvJ
         FWaLRKzYoy+tvv7ywF+UK5FoPazeJzleTQ4j+o+Eyjuvut16HUqmTtfk/kV4sVrLz4UP
         VvL1j8tLnMQM0NX9i6nt9VAGXkyddYheVI8Xfha0LUv7kC3FoWjWgnmzHpAytrwLNVXa
         mXGELnUt4hTCMxzTkhmgeuYcx7xyq1hr6fz/zbgJU0BgFpwFKZPuXgieyp4RXBPTEgMI
         t6jRolixhW/CITrfZXVvsBH2RHBpzMXzToyevIzvb8UVYICvddvabVsVgLku1Ax2r7Hu
         Ls5g==
X-Forwarded-Encrypted: i=1; AKwUvBzeZzKbttFWG/lWKa6bVXmO+up6idI4Rp6zTUXQvwiTkdQlZEJ0Gow4fe1GPcVuKBh+IpTN/mZ5so0f+8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFXGCsTqJw71+R55BGfaB5ir8a4QYvQ04PLgEIOsv1ZtmkpYIq
	/QjdhZVM75jlAsLOlGDAglGzdjGBeBZMA+tO3BFOP4kgcP/FPcovXgV5yU2SeO5zZZFD6jxK6Ig
	g2NQ4PUZ5+41uD3HIh52xUhkbs2VB8Ec=
X-Gm-Gg: AYBFou1cKYHj35ZKzkoo+KqWE7SUP9YSqIrqe2IizqEyc2sg/Aa3aB2rtF9dIg8EM5J
	JhgYUy0AJi8e/QT5Hvrh6xr1+vcrwur8SMqrZd/EJehTKE78U8fdOrUrlRE1i2kPshtgkSCB7YU
	L7LHV07TrOxl2rn19TmN4j6bAbXxWSiXpEV41TIY4LrGxsHqByBeFH+76zp0W44kObUsqZgYHYS
	TYWdTFWwcOUegXGW1x+j66BXQ8hDIn/RoKj5ZxYdv/1PKk648UInHhoXOecgbdlflWGjT0DU9Js
	SxULSzma5wQGrCw6SvqjNNG0/GftRaQIRLkL2fkRpfyl3VkG2ncp08cvYxhqRUXNJjGUOZu54tK
	msng+/HoBOke78dFfww8qqBfO5VSfBauKn6d2y78c6MjdKYHPOEOTyblsqajmIzQxjZDk
X-Received: by 2002:a05:6214:5d08:b0:917:a256:c151 with SMTP id
 6a1803df08f44-91b557c63f4mr258062506d6.45.1791913398957; Tue, 13 Oct 2026
 10:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013121501.3738437-1-sashal@kernel.org> <0bd14255-173c-4052-993c-328a399f6c3d@sirena.org.uk>
In-Reply-To: <0bd14255-173c-4052-993c-328a399f6c3d@sirena.org.uk>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 13 Oct 2026 14:43:07 -0300
X-Gm-Features: AclHuK_GimhKIeFhMz-ydK4dBZDHmOtJjiFY_N4CAyxiONG6isgiNYLG7tOfvME
Message-ID: <CAMAsx6e8GhBbnvLUFkFJAm_fiORLZhOcbMnOsHS+RNPJKONx8w@mail.gmail.com>
Subject: Re: [PATCH v2] docs: remove Assisted-by references
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Weijie Yuan <wy@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Jeff Layton <jlayton@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, Brian Foster <bfoster@redhat.com>, 
	Carlos Maiolino <cem@kernel.org>, David Disseldorp <ddiss@suse.de>, Jani Nikula <jani.nikula@intel.com>, 
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 On Tue, Oct 13, 2026 at 08:15:01AM -0400, Sasha Levin wrote:

> > Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
> > contributors to add an Assisted-by tag to patches developed with help from an
> > LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
> > reduced the tag to "Assisted-by: LLM".
>

 Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
