Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96793783C5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238245; cv=pass; b=LVSnZFanh91IOrWkFrf3fXB8U1K/OHCecogs7DZbzufKO6C9nD5s9WH+pNOU/lK9y1nUFyz0ZGxYbTM3SpeTF2ZUmRRI0x83+JO58HrazgX3lukARrM0KjEZR0vxpH+gaeXV49YfL0FayM28pHrmEtje9cGnLLlQ0DbFkCNbVUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238245; c=relaxed/simple;
	bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbgWgNqjQe2SyQgZPFr34wwr2iJEYRXY6yivo4/kCW/xWq3UpZOLqB8NB9gNd5Gev+i4So+iN4ewY1JPRIUf0626YYA8RGBcjZGjff42p9CxuqCUCnb8/1zwzDcsOaQYcQgQs+SAA7yv5aW7nzd/CqPwt0dKIWoEL3FPJsG9Yyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7ePPQfM; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7ePPQfM"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90e8535619bso23657886d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788238243; cv=none;
        d=google.com; s=arc-20260327;
        b=kjJUY7QOxPY5RABUrrbVzfnu2GQb8tTWpdLJn6BVhcaJXhcmj+T173uKeY6Y/xdTvX
         wBZbDFNpMmOQ9JsqDORS5RuaNyVxubhGOxb+LBlB1vgJifv180iRqUZv1rLhqa7AqKrt
         hli0TXQ1YGzJFdiPe1nVENX5Kl6bDgHpX8MI1dmFyz7k661SIdn91WiWdFOOxXz+SCTb
         WaGa57O0fAVEAkd/9utp/9W4la/i/YBLWrKt1yqPCCag6J5qPhPkdMiWRFZf9gQSV3vM
         AY+SSTGV6zy8XS8Sjx7QuMEGJl27gblu21gWcFiWC3Q8bFn1MAv/fBLrQcQ7ZwmicYZh
         DB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        fh=rmK8/zPCGj7YhDC+U411qOk3t/qov/YlT9cb7Ec+v3Y=;
        b=INlrQ0WLxJs0sHQzgcW8bU4AT/fpMWsEZ7OUh9g8Z5+FXIyA3zUBwQ6HuXZvBQGBcL
         DSKTN5MlK9B+/0DMXelz9NWX3uW0//lRyLatgPfukraFGqc2yVr/POKJU3lCHicXIsx9
         eaWM7Q6prdtvQHhlnYYTTZPrX2qbPcRMcndPjcOgqBCdftgyDMlnzjyx0eIJCnfXlXGR
         bLtUcByfRKxYIaGFgWMj+Gp4LS3D1kbhres9ZRDhIhADY8lT8QpoXIU+7wahKskgMtWx
         4KZm59tQGJL2J6qpKQjAAQ6CrwQAhrma0dEqtDs7l8zSZhg5j15hI9OhSugGZ4eTn+L6
         OGCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788238243; x=1788843043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        b=F7ePPQfM27DNGjBFtzsSO2sGrcqC/s5Rwh2QAS0sFHEqiI136geJ356qp1jwLLSQQX
         G1y0qlMxJwDf+0P7jO9G0vW6fBxhe4IULoaZka79Sly+Yro9ls/Z0sD8dHMIrmEqxMlV
         N56cGsTNFVGJzTnX8zXx4Re12hLVtzL/P9XvP1TL/PsKRS6VwyPim5Rx7qYWLUQB/Bpi
         t1gfFqajtqlQy5y4v/ZsVT3vEpkp/Xxh2yD6jBkj6xsQC/Yq3P5j4vWc6UIOnfJIxrsz
         TvlNN1YBuaIbu3QpvExc54igG1gh5+2lWCA7sWjHOO1Tcj89y3TmjKcSCNUxNMY7DtTw
         fAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238243; x=1788843043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        b=eoV6JvXt6vNyS8NFhTkB2SKGd4COvhncN54iYLbLeLmJ5YS75X05mHMC3LTc4s6o2E
         4baxJK5xCAsZ6UcLhSr5dGbcHT0rSVhY4iOpLjYzeXxUASgylpuPNKsxSgZFs8Wno66o
         B0LxlyGCE/YrG2wyBxwHl+nlSINEp+wrEY707zwT6xVhHkVuX9yMyl7gUuxv0jQ+uVTl
         jDhAUZuaWet8WdhVS7pUebL507Xah13lC5HnlebcdlQ8JOYrJ517WxitwpY2FWD9jRjv
         d7jPxRH814/D1o6MeFhzTA52/E+Y26y+8DHbC6jNeAes3QtvcwaIh0q/9Uw2soxXKJOM
         94zg==
X-Forwarded-Encrypted: i=1; AKwUvBzFBUxSxzsmPpaZHXvKCPEC3/hQKV+ADJGAaiLQsEPMB5N5t0X1WoerIuWEC6AirMVj5fdQfK3g8wbaSf0=@vger.kernel.org
X-Gm-Message-State: AFuF++n0xhkSmCdajXC6jyW2tGxJzBK/nwRZCu6onyaMaA+qMWD1Cvas
	DOGunKtaxaNVaTN9yldo1NABfuwa6TK7pu0jbe2lU4azDXUyE7kNQ/k05pGttWQbF2SutbP3WHd
	U0x5X+v+oZbFN0K8iPuvzy6VjXEjzWno=
X-Gm-Gg: AYBFou35m3Ba0JvxLjnCHK/VOVTFSALx8OzlZ4+ErFHtMOHt/OJUSJA9agX6Bg0KjJB
	zEoYim/h18sDG9cKhFQZTwqrh6jMsuMralYzmH0+W6mVP2pKMhiCmqW6MrXHrA73/B5pUy8JI8F
	EufZi2SvgQc6TtVxSlqO/90JriO++wGY1rtXvTzn04A06sNOr4G79/BvH5kYshae6UiyGP8iv4m
	qncNPvkkLv0POMSZiG0jWUc5l6kNQUZswPf/IURLDhVhAo+Ol3nJnaiYNP+ZsDKmycQ9IdCb0n+
	R5CjrkjdrcGyOc9h9/WwQ+3uW3gvsW7xPpM/q9dCbWzrt/0nWmGOUC2b/GNRc/uNgatXmpWq3FL
	xBIEhtshnSPyAEF/ShKw5HF/8z66MXw==
X-Received: by 2002:ad4:596e:0:b0:90c:c53c:a032 with SMTP id
 6a1803df08f44-90e9299d230mr66652406d6.25.1788238242750; Mon, 31 Aug 2026
 21:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org> <apZCTUYiN5FHCkCm@nvdebian.thelocal>
In-Reply-To: <apZCTUYiN5FHCkCm@nvdebian.thelocal>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Sep 2026 14:50:30 +1000
X-Gm-Features: AcwNN1XIuYNBe-g3Y3LazWrOuydw4Epc379VZwO4H3KcbFvHD9yFkSuEhDJtL5I
Message-ID: <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >
> > We should make the NovaCoreApi just provide an accessor for &Spec and make every
> > subsequent method we need public. Otherwise we end up with endless forwarding
> > methods. We can also add as_raw() methods to the specific types as needed.
>
> Ok. This is where I don't have a good instinct for what we think should be an
> accessor/forwarding method vs. where we should just expose the underlying data
> structure and required methods to API users.
>
> In the past it seems there's been some resistance to exposing nova-core or gsp
> data structures like this which is why I added the forwarding methods. In future
> we're going to have other data-structures that NovaCoreApi will need to access
> so it would be good to understand what we should do here so we can keep things
> somewhat consistent.

We can expose structure defined in nova-core, we cannot expose
structures defined in gsp bindings or firmware.

In theory we can internally between core/drm but I'd really really
like to keep that boundary as the limits of GSP for auditability
purposes.

Dave.
