Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794489807;
	b=qA0FWcho+zCwwTTOpCRFt2yefpS0mPyFhgB1FHO2SqihIOYqpIzlNfVgYQb51fhgjZCZ
	 jlKv4nqoDJHsI4BiZmjDd/2F2JYiryBNyR5wWfE+P+HHFfAmDEEvcEZaO9taVLL+WR/sz
	 6xT9UXn+CnSPW6OjyluGZkV7d5ub6crOAXwIzrcjwjkJ3hGIA104JaUwBlsrcb29sHuXU
	 Czth87gbXOD+NY4Ma5EQE3SPIRnHQB78OjaLzgFy2sUqFufzINKTdHHvPBSk7v6rjT4mJ
	 kCUD/7i4Y+CQOnud0knIN4kTOFAdhubKcAZP7EJqpNdvIdv/rU7TXeRKx8PJU550f2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ghFbVMi6rgXawixTzgsSQ5cbDCjPINeM9K/QV7YYUEs=;
	b=MFO1WB65drN4SO8D7nflqdFw7IncBSO5+KI4kHa9IIHTUMeExjnW3DgcTUsS+SCX6h3v
	 kVszBunscMGoSu/kOEZGudkLyPUQO3Slc27wUqmZ0otJGgOVeHzWwKz9hv0kzyGqTyDPc
	 HVL9YS5IZFW2i4l5iecIwHq+gVJmOQeECzA18Klf+XZjDRrLKlUTW6cq+Cj6Cr+UXUPkq
	 dZo1T3PPBKC9woxhhhI8NlVan87SxZRrjxlXDh7mTHKaHndhFD0viAS0GpfjGD3LPmdnP
	 5xjaSeohVZi9lRNZBCEb6erTSEJSIvi4UlUcPU8NC+BglD41i2MWT5Y4bufoOn+GBdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7CNYouD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD1E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7CNYouD
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso167627166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489805; cv=none;
        d=google.com; s=arc-20260327;
        b=oAChGggV3q5gdBTE9taWVIBW43XozAgwQohUuak3TW7BCJ9l1wTts8eFpqjmKQCgLm
         yzxEcf34RyZiD+CyTIOfldiK/O+JICkus96JWeJOhKp9pmFPhFNSSL/pzotxawrLNWPS
         Rkm72LzL8v1yavklSSAOlsqwOmhkqpN0ppDlyENtGrwzInJIh+mZHynquFZ0QOnBFbI+
         9iNXXbc5xh+ZtC7rh4eNWvFvj8XS6pOMUsg3STPSenguYoBzsnrlvgt8Of8NSVW+2L7s
         hPxyjBUuI6r/Nt9YvLkXlzMy/SXnL+Sf91YXOro98sLSJYLoIH6gVNof8qDD8X3QQPOd
         N3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ghFbVMi6rgXawixTzgsSQ5cbDCjPINeM9K/QV7YYUEs=;
        fh=PWKqAZJbF4wVGwc3qYk2BcreXmljU+bupCXLh6yDziA=;
        b=O/UZVik9YjMOUwIC+++PMTqIiU7wXJHZsCbcvyjon3G2ryCy/LA9UjEg6qw7BEWUit
         IzQdB/C/ezkwEwxR7RCgN5K2KnsvSpegI8cmgbugWupO5Kq2yA24pchNky975TGfHRXV
         YzXDiA9yBm6a5YwPysI/ZmohdsQOfS0/C2hLjsYDfKVJfA/PqjA2k7jyLYvtMY2XUBz3
         K6zz7G+RDht4JKEwoy3S27+H34IYZ4j7QosTFy08yYR3iMq7ONJrmuBKzuZ3XTm+0scP
         s/XmWHb/DA0mcOSORx1FOgiFaVFc/4M9AeaP4oJLoWW9JCCvjMqpow64mQ/0DEJ3tWKa
         mXDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489805; x=1795094605; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghFbVMi6rgXawixTzgsSQ5cbDCjPINeM9K/QV7YYUEs=;
        b=u7CNYouDxtmkklFnZqQCQAU5YV0At+t5CI4iCxPZMku96NHqtVKf11c9d3bi4TNt3C
         cAgC5zPRGsKtCwvJAS0jhidMMM7illgLiiUs+X2zQQzo0K99wKHBOTYPdeHkHxC+/u4b
         xbUkSbhnTm7heHz0ZDuZPz/hiYyeeKyiB16aSm5KM+WRNQE/EGsEBGBqsyKgh09kgFZl
         8OHsMs2fZ1auB7hHUv8pXFAyekFfoeAKhVGx/TVFAocR8T5BY4q3ICnPifaEuaT7rd/L
         AR7IrBopgsUFEfs8T0vpPiVSTKibtVW+i44YdEraYXF0rWEuema7/YmtLWrCVM84Wjn8
         hH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489805; x=1795094605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ghFbVMi6rgXawixTzgsSQ5cbDCjPINeM9K/QV7YYUEs=;
        b=cpc28vTy/nHMi/IHy4zX27CWzIb4UiyXf6okRIin5kOaaciNtItQVF1+siu70mbzYJ
         WWLj3/oI2Epgy1vwLEExh9XexoLCCV8XHFQUyDZ/chAgNUK1XSW0WmNhYWx1XF/8lHOZ
         GxiOLqY3Sm+YLbbOFzjUDWqdvxaazzxV4kNmpgP6gb/9FGdsrKmKH5Fj71W5mVw+ImLJ
         1oAqBLj0zxPIm4pmZqV9HU6ycYYKLopynq9jzMTK7sXfAU/6w/00QeC8Bkgg05A73g9j
         OyRR6v1/ZKEZJtqJrHJYwC7F95gdCAjk8ZQrBWc0VX6YtGWsqRBswyDUu8mUBM3DgMfo
         FYnA==
X-Forwarded-Encrypted: i=1; AL+hErF6RHIgCTPRcycCOK9DZUUVieXZy3j2XvmwEeAc4BbXIHA809UdG2yKIibyIg/P2S3OK1dFBY59ZZGGs3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZADfNpwEZWKDZ3uv2eacZ5ZsZtLF9g9XEH9sQqz57uRDZg4mh
	BE/4gAO+Pfejl2iBPi0glt6olAuPaZWDRhb319SXhogpk+fGrSi25qlaQRQRUGun215p+zZLyRy
	h1CjXrNFq51yoxcqg2Bwf7u+44gckDaY=
X-Gm-Gg: AYBFou2vwGwuam981mgcYyPu6bYZsQiaS5i/Ru10hiofcz1HqZUtmgsCRerpYXWWd2h
	cPX5t9mTGzT8asSlqlFKJPkGvzdbs/kBy21F5Wjp3AkNlPdpEmMj5L6+ksDN/5ZJveCwBp9Cq1i
	roS+A1pv8g4bch02r2+Gbu7pNvCESiyKPlOUSMWyR9UURedSOPKu253a9NfTQgJ25I08yY/I+Du
	DL/2y0ASvzS6M38nbfKaYcjA6r2NUBq93JE1bU9g+9SWMpB+y8E6w27nuqIu8sodJy5TyK7OIXr
	VsPS1IeI8bqejWWBVyeUKTf/rvXDAmZe8Pq8wMr1YN/HWbcRGosh9tstBAxQMhsNlDmo0Xvmqw3
	J9CRmFlaLQIYqGlJAL7nWvxOgZX2xJj1pDEy8p1HawdKmAQL1IzxHKkRFenHbT8H/Q4ndxlTpmA
	H1
X-Received: by 2002:a17:906:478f:b0:c4c:c62a:b9b3 with SMTP id
 a640c23a62f3a-c507bc36f03mr224064866b.22.1794489805492; Thu, 12 Nov 2026
 05:23:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112131056.234801-1-skalpesh942@gmail.com> <179448937301.2168702.18016211527226138253@kernel.org>
In-Reply-To: <179448937301.2168702.18016211527226138253@kernel.org>
From: KALPESH SOLANKI <skalpesh942@gmail.com>
Date: Thu, 12 Nov 2026 18:52:48 +0530
X-Gm-Features: AclHuK8Sqa4kefaWDnU4gXlBaTY8QTlThLLHR4_5ohyhfwkoqXKCWby2azhF0VU
Message-ID: <CADYuhkri8-W86GJeqa9D5yrYk13rAoC0JMV+XGUKUPmUw=GMng@mail.gmail.com>
Subject: Re: [PATCH] tun: disallow setting ARPHRD_MCTP link type via TUNSETLINK
To: netdev-bot+sinfo@kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jason Wang <jasowangio@gmail.com>, 
	Jeremy Kerr <jk@ozlabs.org>, Matt Johnston <matt@codeconstruct.com.au>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

To provide the requested context for reviewers:

1. Discovery:
The issue was identified via code inspection of TUNSETLINK type
transitions and mctp_known() / mctp_pkttype_receive().

2. Triggering / Symptoms:
The issue is triggerable at runtime by an unprivileged user in a user+net
namespace:
1. Open /dev/net/tun and create an IFF_TUN device (registered as ARPHRD_NONE,
   attaching mctp_dev).
2. Call ioctl(fd, TUNSETLINK, ARPHRD_MCTP) while down, then bring link UP.
3. Write a packet with ETH_P_MCTP in tun_pi.
4. On ingress, mctp_pkttype_receive() observes dev->type == ARPHRD_MCTP
   and invokes mctp_cb(skb), tripping WARN_ON(cb->magic != 0x4d435450)
   because the tun-allocated skb has an uninitialized control block.
On systems with panic_on_warn=1, this causes an immediate kernel panic.

Thanks,
Kalpesh

On Thu, 12 Nov 2026 at 18:46, <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
