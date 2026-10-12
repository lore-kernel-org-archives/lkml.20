Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142113C76A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842589; cv=pass; b=smZpZtsWXVNpwHJeo+20u5RprkMFcesGCGo9w8h/KJzqT7/FmwRrunPbWN3R0NbzBHIBHybNpFQfdyBe5Icd5KGUEQYceA7564r/EgqTslaj5XB8avTv+N8sViPWsPiNWQoyHzuQD3eHdkv1F7pUI+yuw3GOxeqAGSif+0Xb9cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842589; c=relaxed/simple;
	bh=T4Efjw5hlfkZX7m576ZubxO/IMEA9cVBgA7Jcs485wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQwYwUn3QL6jUhwcEKyvugYd1/8BcVPP4Oqb/EgeYUnxgCfXQhRZx4gHDMtsoFWa6u6Q6U4McLal3WppJdR42jIni9V0qo29ySMLZVj4O6qwfAPAxKJrWF/HMMK+wPcn3isuuku/FZJVjmuBV7NXmdEKSTDDztJDCAFu52GNP2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eSbLdazR; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eSbLdazR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ac551be4d3so17215937b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791842587; cv=none;
        d=google.com; s=arc-20260327;
        b=PLRRSTGbF8VJJ9yKNRIgYDZ2lrBCA8WUH1J2O+qfzo32f9o6eSkXnqMZQA5EiriIxs
         pStkHfSvmc9aOSUS3JuXyHO1QrRbvguaqihhuZ/0TtHO8byTFooBg3a1isASKj6pQ3Jx
         U7tF2x341IvoougOkgX2ke+I+9o+A25mdBP7umODgiHbzTbsbQC5sGPGMblooaCLkrpi
         T28r/jooQ0ztzJRy56+7c7af87d/tGud/Jx3vhEvd1NI2WYJhEddVOjhh11g4RNbX6dx
         TxN2vQgN89c+aXqMJaTwDEa1+fg9X5dEp6cznncf3gzSVti/bwWp5UoMbZp5b0+Cy++t
         +j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vzyboqz3gdzKLZQtJtdBkHZxkGcpVNHjaJ87oe6XI4I=;
        fh=5epe3x1yRhd7SQ4Z3N3e6WQurtP1NX0AQ9Olr5bp4OU=;
        b=e1yBgTT/Ue9Top5VeWofan/klGU7P4bLom5Lqd3xdZVON5O1exw8oDiZBtpHHId6k7
         sSmujrIjnbnH+cG9qfh+o6NEeSgRrucZKOrGESep02DGKt6tMfoNOOnelA2Lo9CQFn0E
         ZYxYlI/umUTVOpkS5LIGeWRmfBIRZrQumgOnPCOHw7pPN6I1pYx0yNNls7vaxIELV0Ps
         q0b+8g/j2Kj0FP9+uGKBMKuzu8y7+jYdbI7rQkEBniuXLAAt3V9zm8GvuYnMDV5gyyBW
         bRd7EJqgInV3hIPwmvzoONkRNaydrE//VvG/DzTU7lyUMYnP2ZsxOHu77H1i4enjI2dP
         nrQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791842587; x=1792447387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzyboqz3gdzKLZQtJtdBkHZxkGcpVNHjaJ87oe6XI4I=;
        b=eSbLdazRfm1AfpDt/Qht0dPYRxdMkBJDPmxpQ+b3i/CqNILj0CwWtyN9LQ8bdb0YI0
         4pCXOK2s3KK1SExmudotRUO/c1kf1I3jjgMW4fLZfDUcxCEagKrcxLky3/6LxwMBOBC5
         jzzBnDT9zGGqKbpqFKaN7r6NAc7mHs07fJsIfwq7UxQ6L9lOrPN89SNXMEFuTBkN66Gh
         d5Y7mebNC3SvdosAUSmdn9NjNceQnpfofT9e/u78u3c6N/cj0hFtNgroOoxeILm+ss5Q
         Ix1kdv5mwCgo2wcNRNVSU5H6b96AgAtM4LGn/TccrKurMWG0+46KMeLpp2vqvPGmDW97
         1LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842587; x=1792447387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vzyboqz3gdzKLZQtJtdBkHZxkGcpVNHjaJ87oe6XI4I=;
        b=jEdGf6YUas8mafecyj1VC0ysUkVjRevCTY39fowo98xQspwChMnmiA0Tea0Bzmv5dm
         D8zDBseVNPNjsqUl5yHTuQlLLNkN7vT/Z61LoZovU7LlphwWcgpHwd5/BtLn8FkZBrgN
         RcbhjRxK8wcuBjrFuJJgK9r3T6Rupe8aKhN6uhCBJ/bgTd4t4+Ev09p1C8VH/u81PSPX
         ArVfOzFBEgz5dS+fwQbOC/Tx8nCzQWnfDKqm7qa7fKgK6z+rHROFodyHTKBuCbq7kYAX
         tzYxlf5VemArjDwyP3iN6LBVjDNkO9vfbHzd0eliKkvzXYdE022Ga1kTDCT4rza7dBSD
         ApYg==
X-Forwarded-Encrypted: i=1; AKwUvBzxWTPI3EKc0g/jLXkNSukNSb6iqtQHiyUg0oqTnGBQS0wSzxDafgmuLJe9YAnTsc+lcXhWJ9spOALCEIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrul2Yw0wev3yQ+T2j6elfAEIHy9dc5ySFMuUkzKbYLTwySwai
	WT5mxCk8Gbp98MMRib4H6eVDnVUq0NETSry7eNMsVR7iVc62Gg22/fwxPQ064SwrwT9vP9xHpxQ
	QllH/Ih6D/taFRB5HqVUerrZkOQFC6gIFuPIo2Hnb
X-Gm-Gg: AYBFou2s+LJN5s9vejBG6Erqf/aKz/Ag2/gXQ7mic3u7NjglIJ826mgRyF7RxrLRYLF
	XkMotCsKHCvY3qq5R+Kue99wPZcCxopXfILv4i+Wqsx6blqsoqYuCKg6LEligTQGbI5lQyBgcYz
	klF7GmfqH1TVDR6RpuRtLgBh9DA4h9pV7JRHgD1NCSa2PpJpJLHi9JKGyyuqWc86EWexh6yTrWC
	hkra/gaFfFW0FePofkGzUyOD6BleuASLjMyA5o+xnunsjESdP/KBZGIqgic9RDaGk2ismqh11b6
	TK5J3ci5LVxPpn+Ew7pbOZegSXWKyn+J2HN+/PTJ+Rquy9wkd5zl5toZ3ykfH9IdmOXpb3twvfO
	4R0oqH1N2wxm/ycx3cleo
X-Received: by 2002:a05:690c:38a:b0:8a9:4dfa:491b with SMTP id
 00721157ae682-8b07edbf34emr30660547b3.21.1791842586148; Mon, 12 Oct 2026
 15:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-5-samagazaryan@google.com> <araVh6bbUTGcOf0a@lizhi-Precision-Tower-5810>
In-Reply-To: <araVh6bbUTGcOf0a@lizhi-Precision-Tower-5810>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 12 Oct 2026 15:02:55 -0700
X-Gm-Features: AclHuK-4LYE2f0BdadiEK8K0xDLDyM1BsWxpVUWgmwiScvTkyVvHA5N3qTqlemc
Message-ID: <CAHreonGqzUjXGhotEia=k8pQtGodfOH0jiPpVZ-5Nsf=RDzh5g@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> cleanup.h prefer declear tmp here
>
>         char *tmp __free(kfree) = kzalloc(count, GFP_KERNEL);
>
> check others
>

Declared all __free(kfree) vars inline when they are allocated
(i3cdev_read(), i3cdev_write(), i3cdev_do_xfer(), i3cdev_ioc_xfer())

> Can we share the above information include MODE* with i3c system to avoid
> duplicate it?
>


For v6 the i3c_xfer_mode enum will live in include/uapi/linux/i3c/i3cdev.h and
be included by include/linux/i3c/device.h.

Thanks,
Sam
