Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.199
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793390439;
	b=ZHM3bISXcMtLtTjix+iuW+2OxkE56H3iRyHJWRMFsiFMYHK9JWk0mSFeHtJ4PlBieWX3
	 jTO3YJb50UHSIUQH2PiiKROt3v6lf2lyJdRHkeyQ/a6/9asKjfneDxbwIHS8GTNcgtMaY
	 CsVNF9wxi6KaXQGyak1Az4yoZENp3UVisslQAg1fHLj/tfzQ2wmT/ItfTvHDqTpXUeQBB
	 1SwdGZ/HvP3uIt4oCeU5dgMgYEN3oSNbB8QSxKTX5Q5ssYg81zunyI+IiGlX774lsTi3Y
	 wGstwfMZp+Q7phTKkKhqAZd9zKkz0HUxUzenh3BC3sQ+eskMDYTsEc93ls8s9HTsB8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=koi6Ef2+m/47DO3oWpvXEzAALU7rcqt7MfMFCA4IVN4=;
	b=RJ6C9pPhidBZVvWv5lq0Udlrux/cn+CH/29HW3HGq99W1ERH46t1acdhjO/BgkxVVmus
	 L9Pp/hScgHmZK+BfebwAoZOkNBYkG6xGo0ZXVJqa9oQLIIY36dH5WU3+MUdrAipweyiIR
	 MOTRowB7IDZU3alHdt3nRL53myGnjLxZltZ/EC+wv/frdp3n4zVFEmji3Pnl69sx6nk1N
	 rh6jdz6Cb0tkOIUJdP4/lzZoBXhJhRiCbeZfIkggDLIgS/3X5XHiAaxByeSYEHLj9yoMv
	 wmNszrUWV7ReWaS/02vYAe+mihbOSsDq0h/+K+QRO7OOPZ7eyQ+TKve9Ii4pEl9VViQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eizHqomZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.199
Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF82606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF82606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eizHqomZ
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b39374fab5so448260b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793390437; cv=none;
        d=google.com; s=arc-20260327;
        b=pbPSjCCrRawH8LCspqMqFPNRaFhjzdDdgWZBbzoa1s1SNV0iBPtthTHu1Bp5Xs9dq+
         NjG7Xre4uauEPpdp/vzPmLPwT9bKbxHLGoaznr2Uhot+kgMaYFv4idavyyzPs1CAXHtg
         WTigoUAlN8gyUWfF6d+q64PLSw+I6NnvyrO+3onyG19mHVzycko9sKcdbNiCgK+tyk88
         bgPjkux3v1AiebAGAT9O9rtWfcIWpwEcijzy2Xmo75sj4jnwd3FqtkraU3xsFHE3oTwy
         kxRlUJSzBzDfhLJxfEyy8N/pRfuD3ZlXabXxNkFdWvgv7xKY3YaQ10eklvrMYLf77JuI
         zWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=koi6Ef2+m/47DO3oWpvXEzAALU7rcqt7MfMFCA4IVN4=;
        fh=ZIcu1aDm6Ja4JIQav47M0AvLezJF3YLNAGCWcR8H8HM=;
        b=EwXRpsu2evIC+atNkJbMiYbQvYVO/iC95l1VTMx2KpR+HqII0/YgZRgWIyZd9E9PeZ
         fnd9raDgB7vWb4cyBQo+Mw3g2IgVCr+LbHBRa1mDFDnMv5V/yyx0u1qq5jx4Fy7lYyJK
         VlLMYqmR5X8xVVvZZOgdWtWlWkza6VzKi7wfPWxCtr8G7DG76aMn8hAd7fdUV1MbSlWB
         JWrfMLxiVqp6tQWlW+D2EE6Z3+YtHeyRW3nSrScFQtTQD+fWHyu6aua31BtC/3lc7O3H
         A0j0YN6pi4FhXZpQVjgaDIWPRew+FfiMFXk4M3aOTzApl3oEBI9X0TUS7foz5kqwFosO
         YeAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793390437; x=1793995237; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koi6Ef2+m/47DO3oWpvXEzAALU7rcqt7MfMFCA4IVN4=;
        b=eizHqomZcPAk+VJuKiB7sMfMyl9Cv599GUw4km9fAhGHa7nV5NmsJak0QtYqTKo/RG
         VTvlHSn/48q5QXNf+Zv+acbIwWbTX6UO6WE9h6nb31TJpUUxXjRW1R9OjZsWfDfH2nZp
         njOHAGvmnHb7uYC7QGiIDuSrKYsdEqIGFA7XeKo7uNonSEVpiN9qQtAf8LAUZqI822U2
         1+Mey+LnC2IYEpitCjdjdWp7a978wialJyKWm+/R5eBD5yfAYpfx2xbyfpCSG2kGU4sW
         mUMA7Uv4aU3wM2p3QJ52SbqUyFSZvgbdZEvNInNezZXv9BolWPsckQzn4cxVdXU8bm8G
         I3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390437; x=1793995237;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=koi6Ef2+m/47DO3oWpvXEzAALU7rcqt7MfMFCA4IVN4=;
        b=ghNFreLrnWEf/mxPskn+lCuQzyQkpypgbnaa1hO11bBMSkyivLNXIGTG+2LBqhlr63
         1kgu7Iw7v66ao4SUsQSPRhZ+NUhvOrpxqiedf/3bOfDAULkpIAYahsNiqhYae89bGoYm
         m0b1kp+VF+W2ebJxrLlrmCir8fPMR/9sZqHfPneQTzRAEvJUgbhxxGp/lt5hbmluzOUW
         PrQMQ21Du6P3sOolu1xzec/yj3YS48ya+YQNNzdLVoRyLdBYOsfT38acOOlWZjiAyYXU
         tLNLaygoqaDo9SW8DJtlIiZucsxcfqgbhfRHtabuhW4WrFeRRISp8LZTjnkNOapJ3M3k
         GhHA==
X-Forwarded-Encrypted: i=1; AKwUvBwJkSXyRucBWytfupgsHUujEi1KtzYCxfQQg+EywkDtH99AcpluhUcdIqEOJwjX+2duUWuV/xHzaHpp2CE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQf57XAI/Va24RIXN8buxWblKYj3LUdVu8Pn9/Zfb+zPOekTxG
	VLS51uZlhFzkFFy5KzwjgaQ/x118Glg0B655OktTQA4jQwkwU6x80kQkbjzdLoJ99DSZT8fdh8M
	qVdhQq/uN1rMu/XM9e6TvYpsQyU3cLoI=
X-Gm-Gg: AYBFou0tZF6Ix59Hpwbd9556So1Sp8VfEMoYGWDDlMTCgC8EyJ+z+hlQFykR8GKRNVw
	b/yubZoLuXRjGf9PZ2pjXPFzklnLvi3BVq3fSv7P057UDu1FFfxfCQcdLMTZqM4EhCzFRo6Mm+0
	x62ela53huJFqSnX8AVXMUuu8Mi0VY2H79p1qIO46zdEBd38lLnPnH2n5pw6aVW0MCfqJMVy9NB
	KaXf0wc3wmuuullPMPseWKbFNkwHQcKgtGCRCZG54tbqBZg3gO6z8VcSOfSr1RneU5IWiBL3ewm
	qHNaDKLaZpJWwrb8MSb8Am0KpFXk3kOqjzKy86TAmuQOYTy2JaC1D2eRBdVaO1z3h5rX5Webb3w
	9aItSgdYydoHegAP3OvYFkeMCAI37FDnbCVa/VApFAZmOv+dRsvY/BVa21SXgftgJibATGPY=
X-Received: by 2002:a05:6808:1825:b0:4cb:f21c:a795 with SMTP id
 5614622812f47-5640df3f277mr2290284b6e.29.1793390436781; Fri, 30 Oct 2026
 13:00:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030090913.76944-1-dennylin0707@gmail.com> <CAEf4BzaMDRa8xD1oR587P82MYKCYR61gyjgvjKySSnnqFb27pw@mail.gmail.com>
In-Reply-To: <CAEf4BzaMDRa8xD1oR587P82MYKCYR61gyjgvjKySSnnqFb27pw@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Fri, 30 Oct 2026 13:00:25 -0700
X-Gm-Features: AclHuK8Xu4GB5CxACievL5wSbOSvDys3jplk1ETr7iDyEDPp7WgT5OmNWiFCt30
Message-ID: <CAGEkeHcq7HeecPyTSYuHWMhCyOAbF7br+UjrFfLiQmgi6kTxhw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next] bpftool: avoid sign extension in unsigned
 enum JSON dumps
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: qmo@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> please drop RFC tag and report with Quentin's ack

Reposted as v2 with the RFC tag removed and Quentin's ack added.

For future bpftool fixes during the merge window, would you prefer
regular bpf-next patches or RFCs?

Thanks,
Hungyu
