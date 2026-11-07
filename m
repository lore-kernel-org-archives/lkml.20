Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794016995;
	b=tZgdCno4Px8H4deWQwrCB0eIDxvHbXwMPNoiHVewuTs3Jbx3PAHlMPCHQ+qi+gp/d8BE
	 dJuQiZmCWtmZRevvAWLX4YnP/lTfEF/LnBzLg+5Vek+YrUlGZ7zZ0F2OjFWxfQ1NRL+Qk
	 IPhM0woZJ0A3+KImL/y789pvVHoZS55ubWS9joD0TOt4k2LdJXi9wFZDAisdAT83/4wJR
	 ZYAzqGA38I/IYY4t9oChp8ONWCYRk2ChIjWCDUVhl6vLoBLuQnCBfvx5QKliqnshN5WfH
	 KEJJH+9fzzjAVEO1dEm7zeH1mJj/aZ2z23xhTY2T/a034/4HVdlTGCp1GeRWQs78lig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uBvVdSJFRMwmcimjlEgQVos7C2jTDNbNYsRZ09W0EWg=;
	b=JVniJCAEHqWxAmPEtr63YHmoxiQQQVf+0t3OiJBRtXN/vOG8XIYJwYx6P8WaEEBnk9lk
	 jeDquduBjg4idj7wIJsF9sMGel/qcWMMH0kNhrWspIT93Jlzac6Cp//bcHP2LJiVe7F1O
	 F5K9JLOdiMMDkcXTWFb+jIiu4WWt14/L2/u7s6iGdRB6x0M9l2S+1WmAEGfHUJaNfjclp
	 ZLImwj81o8lTdgBKdJPqBlj12oiz97NxDevbxFccc3wueTJFXwP76yOrdiEi+qRGKho7J
	 g2DzlyrDNsSqQ9zkG7G28BAyLN7NwXxd3UtlmCNg+236LdOhitaw5CXbMaqcl9jayJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYmNNCZ5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27EE606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27EE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYmNNCZ5
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-567cb8f983bso602891b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794016994; cv=none;
        d=google.com; s=arc-20260327;
        b=e+fTbmYMLSSvPcndJ0S5OdPQbG7/yJwGwA1e7k3jMJ6N2RoXNWKCu5/JAyjRTbyHsN
         lmPYezNTyHyvgNJZrN0ghE4NIyHYA/5mtfK6OWhVTMLowQvdKY4oH+hX4/Tvv9EAHwxv
         ZM7DVHERZgveBa0Vy0PjaUtcGKnWNSzc+e1YcuTVbeHt6NZppBzaqkpH0pNqKpy8VAST
         6wzFsbYEPDGRoSau2DTB4tg5nFpLIQQFPwEa+HXcAF5O/MjqADYUJM6dZC1Wk+RvbDgA
         ZkCq4cQc18Um8ULoMXnteW0aZXjj67mEXB2lQCSF/6AAewGvTfP4bu4x3jrBc3uiEHzo
         Y5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uBvVdSJFRMwmcimjlEgQVos7C2jTDNbNYsRZ09W0EWg=;
        fh=WDpJZ1qxLa0o/7qoABkT5be2zepSGqj1XM0MsVyPj1A=;
        b=k5uqNm7dZkTg7MzY6eqFZXuyC4Rdw27JZDXdYts4K/ZA0210LAa9AuzHI3hhRH+LXK
         z/nZXCwUUWqyW5X3OWrzaX4jAa63ZqsfupyKFfwy81w2TBmx1EnivPBbw6mokci9muU0
         boleSdw1oO64OXM5G5Qa65xJDbbYzwTEbaoI+oLjcYy8z/166n/MrDAeKveFeTEFl3FS
         HpWzu9kZfdv0n6ZabWLh8xlimi9xyTOp/Gim4ZssWQPQqtC7aO48A8FgBH/wj8u019Qr
         ziO1YZIibap3PL5H1jZbBnqQrmul0jS/vDGIfVD08m9aCxX6r4EOSGVFVhMMlQS+5saS
         cXJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794016994; x=1794621794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uBvVdSJFRMwmcimjlEgQVos7C2jTDNbNYsRZ09W0EWg=;
        b=qYmNNCZ5NqWdPMJP4+WM7EmgiouVGnh02yTLr0djfb8MbKlCc0yCiEYt51b8f4frXZ
         BmBfsn+8/kP6jX9RM2fvk3nyVEoYQ8F5stUxHs4+OEFeiOUZUOv/qCGymZV5QFadXaag
         96if04qj5BaEEd8QoUpl8lFXGLaYfC87Zv9mh9iP1jW3pG+ZewEjbxgMlDd0mqPFnnLx
         O6Z52+NXdR/QD4Rx1e7YyUwP1PDOySI9XLX2BPx6jZE7AINSs3oRyDsCwiyO5+Etbmdq
         RHjGhRHlSoCWPDrKo3IfZB8l3CdQQEHnDAbL3KP8bp4pBrdIJMV+GbMGQXAr4Ls6MdMZ
         iEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794016994; x=1794621794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBvVdSJFRMwmcimjlEgQVos7C2jTDNbNYsRZ09W0EWg=;
        b=ajIRlwF7F+ptdGOtnoxge2USC5VYzb+5KukfjFSjJz5EtnN+BH8PprkPozUX378OUb
         JY9DRwxT6dee9VLm8Q4dgNyeSLN6QK2gLBYqZfogSUuj+B7c/qIWaIehSdRUNhTEijYZ
         MXZYJZD2bR+FraS8kSu3wIrJGwLRIMCIWBxB9UFWYhZIqhIAupy09eeSN5Wjp4Oz2Cmh
         ttP+WMqfrICR/+87uRyrawOO5yCiCvw+jBI3flDSN1RBqSTLo1Kvn9tKHSzIOJrvPDcJ
         TSznpnLJzJzD8TvqkETz7pz2rzWciKem2fEyi9wVEZDPH65h7lmmeBiQYaCqzL/zzWbI
         11mw==
X-Forwarded-Encrypted: i=1; AL+hErFiDYLr474itQwReWv+y9Yi7geyBw1x719pa4ZZDHOhygst6rvrhOmJXgdTqd/mV4f6h1q1sYn3ZeBTrlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/usOUapNxqrNdzJ3Xj8nDjgCX3u6DgdHTxWWpcr2OVGIfWJDK4
	e1wwjW3CWWgrUtxr+gFrGgMR+PA1RJ5esFXw3Kc8ay4HcSeKZm9UtH4wexNIeufeaUcVaY+qFYC
	FaO9/EGYXlfapwu2yZNzKN3U8I5PmnbE=
X-Gm-Gg: AYBFou1va2+OCEbYq6VFc5NBGbOVh/b361J0Xooz/TpaOM7Udg9pmGsEON3aC63+LJV
	XbjbAmpUkYwvzoxIDue+GiMQwGcwzodGV+q5Uqc+8VOwM8Zvojod88XqVmjTEDwJMG9ji0/sDMo
	XsL4xvXQtykAzwXAKc4VaH5a+Z0+dL+uH8QoEyl9gIGtYYNpM9TxwIl8yLAKZl2p+lohDYUozj6
	C/nuU1Dt2rO0u7ROQBdge9311xSSGKHWbmOcF1ATR3ry9mVM8B8fOZ1MQRlfmJ0xic4jltrQaMI
	/JaLvOzD1zuMghhcMUkG7c+2KZSyiZvRyDQfEedRCnGw0fPh0yOTw2P1M8+cLJxO2qDZyhknivo
	cO+7m0HtaUmh1ng1vENenlpwG1v+GFez1cJCqI6Of3flV8ED3a9NqrwJKnVk3/8JKV9NGHR8=
X-Received: by 2002:a05:6808:1506:b0:4b9:e65b:8c30 with SMTP id
 5614622812f47-567e154aeecmr3107364b6e.30.1794016993742; Fri, 06 Nov 2026
 18:03:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107015447.335056-1-mmyangfl@gmail.com> <179401683893.488859.14756679871319417849@kernel.org>
In-Reply-To: <179401683893.488859.14756679871319417849@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 7 Nov 2026 10:02:36 +0800
X-Gm-Features: AclHuK8qmYKV9rGbhU5WORYEBGRTBaOnxnVUQ4immJpreIZflrHaqZuZv3O6ShA
Message-ID: <CAAXyoMPY8QEdrpKEdvB4ceZQkikDHoJdERd1eWcO6E+8bVfS3g@mail.gmail.com>
Subject: Re: [PATCH net v3] net: dsa: motorcomm: Prevent rx_bytes/tx_bytes underflow
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 10:00=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

code inspection only
