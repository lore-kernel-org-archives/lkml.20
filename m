Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482645;
	b=YKzjttWE2ZVgsCp1bUGmJR8V4i5gCE2oHUIVi0O9rXeN9Xs4PbbXL0LeRZWBthKz+byw
	 REg4/lIag7Qj4vFCMh2BCsGal/5SWM/lT58uyEgbT5pQs0pJnl/4JSnq+VMS2OUuXDxBA
	 uD8jMpAX6I9V+f4+Jwik+8sZ9EMATAKQtMzK/Mzbs1lPZbYB49fLWp5bl8h7dTEAGKqGr
	 bLjISYApnqjWxDEhtkjtSPkg0ZmEHcBtyUDEacIbZhH8qqJJrdQR51hs/tdcGxe1KdSc3
	 QAsMt6jA0ex+GaDrtWMf46qGqhKMd3/9Y/AuCkZbtboDISBaDXuFe/7eUO+zLzc/+OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
	b=CZFZJEtjjPGKUtKQNSYWq6adh6DRQSxpGL7xcGLIYQDaRVeDRA47j80t16imZNiTNNO9
	 XBcrzXf3SCsfWhEcZAtZvlu6eSvypSdECrnnooFA0sLpTJBV/YuJ7oVDL4eFtYH+OlDp/
	 FrORRT1E5Ig5DLWOGhZHVuEdVZXSWY2yc2CyXDCKWuCAEbW50kLd+4gIZZAuB9fkOKLLz
	 bamJHmb2UHjU0UxDjy7rHdjSLWxi4Xz1Zk4jNoAXJtK9LQpnY5T4la/ACXMcr/P1C8bw+
	 4b49yh/Di1poV4gtHxOMDWP4nYKXrShaZTnHONajcQRKyZGDECmtSY5cxcJi8sCDYpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aiXVu9Dg;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F6F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aiXVu9Dg
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e10a70540so1182042f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792482643; x=1793087443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
        b=aiXVu9DgI1IWaZ097Irs8TW5eaOOX+ow9tvy/BTRbkD2W5eYHU5ZweFqBfiYaNFuRb
         V4lVV+IAfFHS1qREvpgn5lmM2hBWj6IF8brcwIa+mH48p3xelQqthNhznwMtZdd2jiln
         0Q6nxAecGzGuj7hKV6AZHruz19sew62Qr/cAuPXNIYKzzrKRmxdT0bdAlnRaEdVjvLa+
         TSPcwd+/mcZw8zCTKdqsCUDCBUFE/ygpQ+32MyViWHs2/SUVoI9zTIJPK1NAbNNx+loP
         vnJMc60SLHDYYxR3f0YSv5fm+LiTHaomn1IvK6D4DxESCOj2I8yx/KH/o0LRHR/L8yDS
         RwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482643; x=1793087443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
        b=e2p0QnZUzjY3n/mllrzDFWBkIe7ul7UO4RkfJwbxyY9GnPx6Zvihwad0VP8zna+6oa
         uHw+bv0DsaWfUBf0/YlAm26frSpBxke7CeC3qRQryGNRHzB7LyGN0o4nXsm0YypJY0AH
         ljKgAa6VzyRMiJE64tcOOmQuOED2sitNghFoIur53reQJ53k9x9Ih9t8YnPhcABS2w5h
         yyHOMkybwVnB8IMlsGaffWFX8QY7A/mTpLWnQmFrncJUZa7SqKhFJGVVWC0zQ9VIRCO0
         bJuDF6ID35CkDjt5+WrWh9GA5tuq2So6GWPhFNEQw6CDG3Te4UjK/dptLB07OwCkxffc
         DQKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQX+0+kl3llxTZy/w1Kce9OZthuv3XJLuXRg57pxBvwfI11UAM72roZxDEJG809Uc/HOM0ytwKZhbIybU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0EFYXI0gQseFHlGOAMh9+ySvvg4HlyjgScSGMJ3yP5AramZAT
	akFsY+5ngd349I5NDW5PzMnzXE6G7Ql85IxGZs/9BNB/zCUmjrrUpwOg
X-Gm-Gg: AYBFou2czQnNaIktl8//1ybyv7TmLf67Hq2cNp9lT1oJlD9EPQ+1Rbxwm3dHozReV7z
	jrEDKbefo6GCAtN6IQcapCvkd+Am57pWd+TdAq/uZFxWurNncKyahPVeBTvu+NnBLqRkZfqtKp9
	FTO8rsdakpW0D4WExayVu7WhQ8jy8ixF2AjYdOWGXv9AKX/RUixjkE1nDwlfhvtCXhGud5qLzmT
	5bkS+vZR0fSLCkE2MHodFCrgaNvuhwik/TpNWVGlxAj59oUmYDV7UPhq8X/a+cNHFXxaRaeZ6St
	vSzz5y3wK3rfKWTPATuZzymKboulfcbayhfaGLYAV4Y7va5u2oLT2C7zp2o/nGtOQBB9TwrIqin
	jGWL6BgJK4NwqnxBLJY5XwJSQ2TRkguWKMUda6aPg7bJQc617zvTFMoh7z1ZYFNWb+otnWoeGRq
	RWa8DFcN7VQTAvVdfl/8s8YXPwPj3Y2Uq7D73YSOh2JVnDaU0XIpCxYd+1HGYoFtQxhC05j0K9t
	bM7oQMOmFHXqGU8/stYaoxQWIu79/u7jxiimMXMWb+qS9TKRm0pd0CW2iIY4FMeVPVz4IoVIXzS
	jQlc5G8aHltvW1Hrl244rVTfEPFyk6shXf75FzGWGN9glYq7sEa6Jpy0d6D9WwswSXxZ+ommY+N
	n1QWzVfHOpnVDcwO8X5eOIkML6mcfwVU9QqufR/97EN5HnS31CQ+6sB3OEIxXYyEdlb/oOBENzA
	PsP5lX
X-Received: by 2002:a5d:6391:0:b0:48d:c178:f6e9 with SMTP id ffacd0b85a97d-48e07bbd618mr15587418f8f.20.1792482643365;
        Tue, 20 Oct 2026 00:50:43 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8185d2sm4581409f8f.28.2026.10.20.00.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:50:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:50:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] iio: osf: avoid a large stack frame in osf_core_init
Message-ID: <20261020095039.00004c88@gmail.com>
In-Reply-To: <fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
References: <202610191514.fRYyu0HX-lkp@intel.com>
	<fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 18:58:49 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Clang reports a 1344-byte stack frame in osf_core_init() for
> hexagon-allmodconfig, exceeding CONFIG_FRAME_WARN=1280.
> 
> The aggregate assignment materializes a temporary struct osf_device on
> the stack and copies it to the destination. With the mutex and caches
> added by the IIO support, this structure is 1328 bytes in the reported
> configuration.
> 
> Clear the destination directly, then set dev and initialize latest_lock
> as before. This preserves zero initialization of all other fields,
> including when the core is reinitialized for a new session, without the
> large temporary object.
> 
> With the reported Clang 24.0.0git compiler and Hexagon configuration, the
> frame decreases from 1344 to 8 bytes and the warning disappears.
> 
> Fixes: 7329986669f2 ("iio: osf: add IIO devices from capability reports")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610191514.fRYyu0HX-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
