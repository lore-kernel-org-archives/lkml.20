Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855972;
	b=ziJWB4qPspMQtn7rM9bFthqWFpF/FipdDmTVfvjiaGW7XeXz2AY/SHy4gD4IQx0heu9P
	 y4wKGzP7WM8Cfr0Dx0Bwi/L9lTSNEnt3iY1a/f90xGBn/rRbVLb05+tKVUyrMWMIuiRGO
	 L8b/tTmoLgK1X1DObJ3X+6IeGZjIboK9l8FFUm2Vwhom6xQj/iAaYGMcrKHd3J95Uf081
	 XuNhLkCFa5iEceUa4BRI6SpTXCnackv4qnODaku6Ef1mNckLQZ108qoWFkQT+huz0iDK6
	 WKHyXGucP4jIRj0NBIy5zC1JgMkdYfz4z3MkNphiahalq4DW54ARGk8R0QUb2A3eW9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
	b=z8G4NODn/SLiV79+YNrpi1aWC2CG2PUfzA8nsxP+3394Hk9sWw/XHb9UG9mDrJwisXFP
	 UsaWJUPEuw1AhvJSD652FPX/RcHcwdSVxMu1AWwH/X2fAwJyXbDTA3jzHS/lhzMvMZTNy
	 CMx8qXM6fwRvWDyDa11CiR0jDBAdvUEspM7ac0SYUkxD+yWJXQIlghv7wevG0CT0ENUeK
	 7h+VHp1e2mRjoqKZxfj024n74osUBfjobs8KwJdCbCzJo76RWwzIKrtfP4NJ0fhHE1Ibo
	 aVT8W9ZOKJOY8IQkLSkl3WkNWtBwwueut2zfgfcmIuVHx9/+opg7iFK1gt0hXJSpT5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=Jm2Gk8kj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BAF606BA32
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3BAF606BA32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=Jm2Gk8kj
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so1359147e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855970; cv=none;
        d=google.com; s=arc-20260327;
        b=YIgOGFG4KSKDwefEhau1n+adhI1fkQQXOeN0yw34JtKvGf1LuyNinTadz0y0xDs4jf
         eYEbiEvfxI0U91N5LQ7YRH+eqz3zXUNC8l2/cROcIEF3NQkI4PtJF4T5yzpZ/FWg54ie
         7TgyorqxmPp/do+3v/c/3y3odBbTe11CHqFQqX4zQv++c4ais8XK/knjTt/2KaJH/h1t
         6WfEJuDEmCf/OOW88eUEeEFcagcB8YL52bZMFpNX4uxERHH/LD23cNMJiTbnBji6vsj7
         F/e3zMqRmrbxxXG6pPtbTQ95NnzmCnWwKcPGLqkLgj8ZGiiiIUqSvcOJOef+V8521B+V
         vU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        fh=4cKQF0TyLvcUqEj+wkVwF1W90pyfbMQO9l4X3WchGNw=;
        b=amR95WSY0wm6j+B4MhugMKYvV/a7ucUB8tiiF2y3kl6n+QSAY1ag2BbBCg53pbYK8K
         VD6uACI85AlVdgTuGrZEagc1+TTeCngaysCGAie3ozgrFzdfJbDrVBqPOM8swXNyoH9z
         Pnw0cfPVlzg6suu+zmCsDNipNR9YPoT4vAWQt9y8yjbrXg3QOegkJM71SewaFiz+Ifbc
         FtpglTu4/FFLaXyZiQGflZVnSJEUTHLzQyNsAIP10cjuCWI8Fb5qMthHktLnBDZTyX1V
         fOkDgsjYthhoXWMbXOKJxsvqJIWOE5BHsiXbDNi+hLbsTWSwWJpL7cORlHPdDmXJK//B
         Jd3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794855970; x=1795460770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        b=Jm2Gk8kjWWwRV2Oi1KDcMVKvvo2dKssVrRlht1w65ARIvAvJHtaRkh5gALMeNGFexR
         j2tS4wtXZv6yXg83D423lAlXUdUogfBCNoql26Ht2pY9lBro3u2idDSeOaZkduUKxiwt
         g8cTxqxbDTTTOvMQZYgK5qFPiJ0jZJY9+JwRFURRFaoYKECLPDoGE9lTtLEC5ClMw6zQ
         W41sm8KufFyLvIFlC7ApPY7fL4TIZGIgN6ckkuKJV1IWh9KX4VRJ9wg60OI2QVITa/7B
         h6XBilkVxUviYZ0x1faQAS+D45VQIabR3Pm3OxpAR6OX1tFpiMiSDb/O757nTsQGAq9T
         DLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855970; x=1795460770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        b=whRi4NYCaWfTX15gx0nr9xkkWB5IJbp2TSDf+pK4Q31dyDAEAc0WVnkU21qnVPMmLo
         okJNlSmIM4uA7Ryk2T5jV87O3tqDrZtYqqym6D/UrawwAzOSkS09LBeKfrve/343s/ep
         3Cm9OHg5nGcJBKUd7roFDnqr+uS7LMvgtu/zHGMeu88/f1qolvorTG2TWHUqJ29//3C4
         xYk24xKA0sNHapoXILuG9D6+8Aau7EgUIS606lFJUa0Hm/uPpS7DbsgDCPh3ntCmPsTc
         EV8Q3L4WdzRFWrh4h+yjaaC7CUodKXFFJWUrEVmDqAWLM6FQhU8FjIONCPjmWhS3Rr5o
         Yr2Q==
X-Forwarded-Encrypted: i=1; AL+hErHk3f6CU/h8ly/EwDAZw1mnJOqxvRl5eYKyzVtQICHhn6FLuOalY6ldRQUirXVQR94y9jTpp9smD3IJeNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2cHydFwbL3kXvt5Vvlb0sr4+aHNnU49jlT3CBbhZ9UxEqMN2P
	dusfJlMZhIzdYpEVKnhZ+d2W+ZXesk0uKhlXOWvmxYXPeg8nS6RjSfaYBcawoE2SDWmhBZwu9Gl
	cG2Vv+oMVDUBF5i380z2GHqoB+1uTwZo22ejfoDqB8w==
X-Gm-Gg: AYBFou3DF8YTdFfLGB/C+piGq0ZhXrZ1tKRWBumszDUxiM1tZJHtXjBrY5huBWVzZ0K
	Qs6xZWh5qIykxFz853XahJaONpWA9aFRJhZYfhPTt1fNKzHqEaweeizxH06sJnqv+B90Jj8zfDd
	Lv9DtXu9QtbpvlTgCi0MHNWDCyZziscx5qk7X2UqMty2z7H097gtq7qirh3GB+oMADbSsmXkSQ8
	aWPQQ8a7jQFytg4cVfngW3Lg7j4P51xWnDOwYZ9sj6RWT4ykuOczUR3xQuWEOnHhmYHntzod4SA
	KHPh9k+XsVe99EOOP91uiIFlLBJKVQlkWpHeuFN8DKT5RQOBLEqumzpAB/a/kp1FU4g98qIwwW7
	FrU+HASyvsm+bFUPix8rOkhAnrLEGDjh0f/bmiNFdxPJHfwc9nQ0Vp/7lo8cS2GlQwZqOXJwRDP
	24SQ0IcO4E+xAHNyXhkg/B9ZSfduHvCbnJftNjVpHFDgCJpq+tSDdRpasqOmr5qImjsjlVqDLbF
	iKrzIt6qbVFyFmyjNrAlQQBx5BMjYc3BT9f5kCidQJAt4Q=
X-Received: by 2002:a05:6122:1b10:b0:5ec:4a13:8aae with SMTP id
 71dfb90a1353d-5ee34a9298dmr3969191e0c.17.1794855970467; Mon, 16 Nov 2026
 11:06:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116190111.3317976-1-rjethwani@purestorage.com> <179485574283.3291.7349043137994808253@kernel.org>
In-Reply-To: <179485574283.3291.7349043137994808253@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 16 Nov 2026 11:05:59 -0800
X-Gm-Features: Aa3M54o7vX-XpVUCQ5-uuaPc-Fmkae2NyST6GEXFL4X2HiaIMluNfTh_m5Er0I0
Message-ID: <CAKaoeS29P8SukOACusGaO=7z13_eFR5pFWDjbYqurgYd2bVz9w@mail.gmail.com>
Subject: Re: [PATCH net v8] kcm: reject TLS on attached TCP sockets
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, jiayuan.chen@linux.dev, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Dave Watson <davejwatson@fb.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:02=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
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
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Found by code review. The sleep in atomic context was reproduced on an
unmodified kernel with CONFIG_DEBUG_ATOMIC_SLEEP.
