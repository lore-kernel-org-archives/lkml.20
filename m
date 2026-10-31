Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410135;
	b=xcZ5TzgNq86bnDDAoXqFN3jj7jI9AAhH2Dw/pTS03JN9ZwB0Wz2MTHTxDlDFQwkpjOMi
	 sP2iJPmYEsuXua/4JI9Tizsv3C6f0/j9pyuDQQZNiJx+X+kvp7s4DVIiVBNY/a5KuAEdq
	 isJ2QX2Ul9p/vjlsssUSSwSXRYu/+qSAQWfDvpTkuLmE0oIE4yh2r8tdyOxm6dl1WdZJD
	 I2/7GemxbfnKrYpCpqCZ7vHu5r3UYuxeaRGAhK72eJQL6djz1eqBYE4pogyCZOqunkPd0
	 83jnH2yEIzGvWWvOFfWBA5bjj9WYa4ZHzZ52ouw6EJKey51JQewBFGgbnmwRaTMvj4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BV1EuO9aVqSWMCLmaE799g2faQ7td/sexJDYNT2mXKQ=;
	b=NyIFhAFa5VL2pL08W6/ZzQ26Nv5hG3RyupkFKgGqfFf87ybUrCDdBPQ+Mg4ArEDC6bzN
	 pWGNl8ho/+GR1er6kxvOpg55CFVg3++lMTswHLq3Y2EXTbS8/c821Mco8rSnhDUpWMjwf
	 PWNF1R4wVcG2EZv0Qun+uUpaeVvodIGzJSWqebsXCePATNlLyfzA1Wh2EbrczHhVJ33ld
	 dTL6re3TcCDKhNuVZ1H6JE9J/1nYid65n1+W4SWKQbqrYmvg/S9sC+o56lITQLEgJn3lh
	 VddZSEZ+QuzbpX3AC4zZUonjJEugU8yLWqvp1dLKr0HzmtrWh1lvW86tIHfAYKJQy2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=A9XupMkI;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D715606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D715606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=A9XupMkI
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so1707688a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793410127; x=1794014927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BV1EuO9aVqSWMCLmaE799g2faQ7td/sexJDYNT2mXKQ=;
        b=A9XupMkIazH8/z7k76jOmcLugjTp5DBZvmMrqxX/2Lhe+Wy4RIV+tmj4LUgqU7lJ4j
         nzUAgX/C1VYZoNf6VEM1SDnaiduSz20LoudYapZFon8YyIWi+uswoucwZrKkI/ZZIbFO
         gYW/5xHdjnzujiTEfKUJ8wLuk+nCD6y3L9gTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793410127; x=1794014927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BV1EuO9aVqSWMCLmaE799g2faQ7td/sexJDYNT2mXKQ=;
        b=J51fy8PqiZ6ep9CAjuUwtmlxal3j6Iy9e7a7ouxD+Usl6ZV2eAgGAMLb9gbzXkm9Op
         y0kLI6QAMxTAqZT8dE+kgDIIpmMkajCnnSed3+I6wFMr4eFIuPc3AOtDEv1LoLDdgSGb
         x2aEj4I62iKkZP2EhW1DVU96YEwW8/a/8zc4wfTCQKbgiVPDOH1CJWCUQM2qOsyyOACJ
         T0k3Zj+iFpFgjmujmIKu9BdNTjHHNGnbhSCkY56sfQPc8OZ1q5vYshV00PAKAxgzyeI7
         JDfick8ttEaWyCXgQgn++gnHmF0SFf4XkA2jPfo4ibBmvFkyK5/Sca3HboCThL/nR7dh
         6/CA==
X-Gm-Message-State: AFq9FYLGGgXA1ebiPC2J1PeWCwlhDJb/uouikA3Ds4TU8lSU3/tLhDje
	2bhnx2Bl1quVhzMNUIFYfTUcT4bmq+0vmV6+/rAJfjWe1NDb3IryreFUiMh+1YgkUUZ1zswqh1j
	Mo8J6Y5Y=
X-Gm-Gg: AYBFou09W6Hmg72RDpHfVEoDZ4to0YVBEtV1IpxwxLCNZRH6c4Lt4w8eqeWj7zsuAlp
	I3qcwm/RDjV4qFjt0nW3tTwEX2pA1IAmVtEs6w95dLBUfdbK+/MViwt074bvoms7+VVkn3e0WAn
	CZ3to5LwJTlUUwJxQsWPmVafeyOuiOzgrZ/0CpHN++cs4N8mofX+KoMf4CSWal9f5mvjN6OphF6
	pJ8MqNdOVJFpH0olyXjcad8goGZYiafT9QPk/1/ghSYyTy2XdV47XEc/wpX5evjm1nxzbxtPQay
	qUyb1w99mCXRyQ7uxRUN/sziZPlV4Za1h1GnnLWbztbbgzATwV3Z8aACymSJY3KHjC/9dxtHCZ9
	zSKmSmchOjtkqpyM6Q4UFGWNFkQy23vf9fxO9Ap/JVmXj7AXhq7de5gUs2tEToTfK1YNMmvzJ/k
	ZKXS5jqXw/eVTqJgZpzUp8rCzLauFWyFXkdLSBa12Kx+RHDyCu4Xnh1qyH6xT5PTK2KQbKfphg2
	3EwuNWzOkcWrxquDmGFfHcyunRJl2zUi5j5wYq29HT1CIOPhM/1jS3byb6tmm8OHTACFaWrc34d
	zFTG/ZfGTBb5EkKSR5ghnuDLiiMpQPf5vlkE9Per3tG3tSjFbRx2eyj1Pr8PmbWmqiq3BwBGz6D
	2eUpF1d8la8majLMfVrc6VKqT
X-Received: by 2002:a05:6402:5179:b0:6b3:af2b:7b34 with SMTP id 4fb4d7f45d1cf-6b4d4384579mr2239502a12.11.1793410126888;
        Fri, 30 Oct 2026 18:28:46 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0fbd6sm507775a12.24.2026.10.30.18.28.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:28:46 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so1301618a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:28:46 -0700 (PDT)
X-Received: by 2002:a17:907:6d0a:b0:c49:1bb4:4cc0 with SMTP id
 a640c23a62f3a-c4ca7aef250mr362396666b.14.1793410125839; Fri, 30 Oct 2026
 18:28:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atoUqhA4O6NAoZ7T@kroah.com>
In-Reply-To: <atoUqhA4O6NAoZ7T@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2026 15:28:29 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
X-Gm-Features: AclHuK_g7GOfHDoSD5vxxQigoKOR8EUt0Il1gVq72Xq-fqVjQqnjSsB4JYmNx14
Message-ID: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 7.4-rc1
To: Greg KH <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jacob Riff <jacob@riff.dk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 03:53, Greg KH <gregkh@linuxfoundation.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc1

This commit (254261381538: "usb: typec: ucsi: retry init when the PPM
answers early commands incorrectly")

> Jacob Riff (1):
>       usb: typec: ucsi: retry init when the PPM answers early commands incorrectly

results in a hundred and one lines of

    ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get usb role switch

for me on every boot on my laptop.

Before that commit, I got a single

    ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get usb role switch
    ucsi_acpi USBC000:00: error -ENODEV: PPM init failed

but now it apparently retries that thing a hundred times before
finally giving up wth

    ucsi_acpi USBC000:00: PPM init failed, stop trying

and honestly, this all seems rather excessive. Retry ten times a
second, for ten seconds? As far as I know, this has never succeeded in
the history of this laptop, and it has no bad effects apart from the
silly messages.

                   Linus
