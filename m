Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DA469820
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050122; cv=none; b=s3qGCtdVEg0o/4Mc3HDpzWUdfvOdXiI/Z1sVySRGqlfku1mzAeQWXfOcGnpooFZDJ2TutDRegF+FNMuiEDEi4VdJEDG0jRFZ2O5sjVhrhVdTgtBUP99XvFnUJx1lAuM6Oalj39QNeLWb9drJGUGYMozTywhK6whWdnMcKjmXxiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050122; c=relaxed/simple;
	bh=7hUOE8btigyGRD2TTmBp6G5vlIKkBzkcr/ByALuXRJY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxAkRCS7M4fpsjfuNwLSkxuSsk+BJ/8L+R8xRGdZ1IwswcBNSSnDGr48AZpDFMi3Z5/A7EWFJXqdlnRwgQj5kjjSN5scvQbQGqwuSj6/POt0p1wBzQnR0TSWTZ9dtSoWGooNX/g/+0vNXLQtdsb2t74rCSwgprNhk3hvxWm7IiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUAwrXUh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUAwrXUh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2943195f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050117; x=1792654917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNQZzmh/L9MH0WQdX7vNuWW0ZjqB6ODxMRs3YkUCNgg=;
        b=dUAwrXUhmEO+OfR1nE7ZwOp5gMRqKu7vGsYJK4EWjHeje8TJMXHTly6FWVxrdhuS9W
         atApGnP2PcG/c24MlM+DjeJA0GnBVU80NwKPSO//zY/anAvAU53y1zH2ZIqX34QX/Wd3
         up+bGO7bnwe1UIpx6qBb4Bg2Cv/vbTqcKuzSrCYbnPgj5poBtyTdxILdBDrtN3FroHF4
         wXGLVsbPbXJKQ4XmFEC19CsmXV7nAPv7qLhvbwPXv1e1dQoLKn9OfSuk1O9vrIwTgFWv
         E6kL4B0g0H7OFmgavvLvUBablGYCfxUbJU9D8rSuy6BFUGLNwQySslamJEiNmVXqsoW4
         mz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050117; x=1792654917;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNQZzmh/L9MH0WQdX7vNuWW0ZjqB6ODxMRs3YkUCNgg=;
        b=U//vB8feOKvm+/EFxtKsmOM8DOKGYPL4h9EDZSA0vbV7MDXsRTj3qxzl4+TBST7zwT
         5ojZ6eZRF4vcRT8Lk8sdLIvSKxmluZpi1kCj/it8a91d7Klr+nocZlZk/j+DnUPDLScc
         3PLPJO2/EpE1csBs9hipv9lN8D8jcDBgjhp+LV0ZQi/2kvmrKnVd+exNkhUR4lJKpO9t
         bQxr88eL2nA3V+GvP7Ea/aipx4qHPDErve8RT5OuwP/SVWOth3uRFZJbtG4Z0HizoNoo
         mTfGqMnLO+Tv/zTQf4IKnIxJ3hxHPQSJLzkmf57yPlHTlCQQDRJLApX+Cd2Rnxv/7P0q
         8bEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWmsvGuIdCiE1jaRgYWMQzeHVHGk1q7WFX9PkkSurmpScEbqc35japrk42R2Xzwmuc73SJ12Pp+CQGEK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUOBgxiAo38mHLAbUIZVNadMim+8odF6/BJqyLQFG3qSRgC8Z6
	nPTeAaniDAjVsf1bo28RGSi9xww0plHTe5eAM7PldZX90iIEVqpCxZoN
X-Gm-Gg: AYBFou0aWO+TcS5nLkyTnAPbTzlRqwLmaV6CdppvbnjaPeDuFGmYvEjAMwzJ+dMh2X3
	3f9jaX8MMHqU/ytbz2QOcn1ZqdV7CNlsUwq7mbHo4+IOU6rdHsLnF4vaW91RieYgD/ikjZ0Ob7S
	570/rX8xuiDldupM0tTMEmXjPvAWN7n9gh8rLMSVL7IafK0dBzEh/u2kYsA2e7kLaYX8+l/ert+
	yTAfYcJ5q6OfCS3JvluUgYfEGH1XC6l81pizVHh7+0JUKL5xJakzWn3uwAEEG0vXrP8BuXKZEf8
	sBFiZ+ls9NHAjYYYQ8CmmwyIgWuNZro+Ld1PNWK9+sv9a2kNwKv36O7XiWGFHNroUvu65f9AjHI
	mYXKd5uLYdTSlFmV3trkUyUFLMZYqTOVohXd0ekKFShnoyKiXFM+KtLABEbEz+UtMxNGjwgvk0c
	6d8BfKYdl9X8rrYMTmtAG2fTr0PTJ+kYxp83dIk4d3M+Juggi9lsE3x+tQll2Sl7XIU5BA+CHcY
	vWrXqlzGboXXLCEGXZo2uVDbAgJ8ABc0UucJTN3AvjYM7ryegz8qIDyYqpEP+LA2/ykMCS1xw6+
	SlPv9Q/+3COS3NidSR/wF3sfjCoAGv00ta3VbApwkRHI1yrFJt+7Amq+soGudArMZ1tRQ59RL2e
	T+HQlYlXzk00QNJKQgSyJloJ3pIR7E2sTczCTBcsJzdFHKGQ+bBqifAboacq6bmYpRomwXKDbiN
	69ZFci
X-Received: by 2002:a05:6000:41cc:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48dbad48cc3mr33849866f8f.50.1792050117131;
        Thu, 15 Oct 2026 00:41:57 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd777fsm15479605f8f.57.2026.10.15.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:41:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:41:54 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shi Hao
 <i.shihao.999@gmail.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: light: add as7343
Message-ID: <20261015094154.0000506c@gmail.com>
In-Reply-To: <as5LCasyTFjTNL0x@zephyrus-g14.localdomain>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
	<20261013115639.167433-2-marcus.yu.56@gmail.com>
	<20261013143639.000017b9@gmail.com>
	<as5LCasyTFjTNL0x@zephyrus-g14.localdomain>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 23:15:21 +0800
Chang Yu <marcus.yu.56@gmail.com> wrote:

> > Should be unevaluatedProperties as you're using $refs in the binding,
> > but Jonathan could tweak that when applying.
> >   
> There was a discussion about this back in v2 in which Conor was suggesting
> keeping additionalProperties: false if I recall. I don't know the exact
> pros vs cons so I'll defer to the experts here.

Fair enough, if dt maintainers say so then it's fine.

-- 
Kind regards,
Joshua Crofts
