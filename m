Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425537;
	b=wY13BcKb+NZq9ZK/SWidr3bEzCymJUbboUng500oetM18FG1YK8Hf/nGm5Arar9VLO0V
	 cA25yzpXmyJ/RwB/3GpaQOErl/LXSf+RudPtAA10+zR0cr7eDrwnICs1tE86UlTA9WvqZ
	 MokircZqMdGb8M/GYcEsZTZQO1jQ+SzZkyQOUzW9liwGzm9vPBKjnmUNepSdjvc+RdJlH
	 Nql8t2N6WubJ5hYl3C8/L499PrvT7rwxDOUcTePYOwfjxqZiiT+Jqh86b7vbQdtoDP7rV
	 izBLCi/9h0aSNttfneeNeMjc6ZVAB8Bg4SSVzZRaYoJTW4L8vYr2IQGKfp20EIYqutg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wd2WluVLwj4r2VIyBQDufDpYxaAOyEu9BCBLHFr84dA=;
	b=I3hg6cGNwsWJBGciTwdvMT2r4pXMDfPmThMG8Sb1RSLvwrGmIYaJTFP6c5lsbs0qcpYr
	 0318HbgMmzz1pYswgImC9yJahdIDKivSvLQLLADkpCeMEAT03NCddLmgN1j90sUD9hAh5
	 v59IlK0nxd9EP4q88q0Ehsc4HsFcaajdGtizn1rOmboTUnMFT12b28hQ2KjFmJyKyZMVR
	 AlGRGVifFnNuTPamhQCrlCUkqlvDp5XzGiinYkp41/vamfPoHjxBQjRKP8P78rM8srt8J
	 sFlW7jIjJRI0WpOqtwnftPreLOHDqkZbWe3RCi9xLEJ5orjq2Y8b8OkMiVYwfc2gV6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GfO64ZFW;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C57606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C57606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GfO64ZFW
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c49c32650adso349554466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794425534; x=1795030334; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd2WluVLwj4r2VIyBQDufDpYxaAOyEu9BCBLHFr84dA=;
        b=GfO64ZFW1BR8XJSmTsKnWVJB0jG52awdHYFKa3KauoDVSpbe5nSa4/K+kXvDARCE1/
         3HKWMlc+Ny6JF+wBFqhYUz1H61iGaGBA64MZUqphYXWIJL1NhcfBm+mNawc3tD7qDI6D
         NjOd1sZzhfsuJT/koVVegWGQtgxPU2LBgkZEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425534; x=1795030334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wd2WluVLwj4r2VIyBQDufDpYxaAOyEu9BCBLHFr84dA=;
        b=kqguAHZ3pQmluBlf4rjnGThwtiupxwdMd8CEaTCcNIrNDdWnMUf0oFkuVCp81GuAmR
         IAvaY/+Rra2dhA6Yd4iJBQ/Bsk2KUNPURnwnGoB0fgQcF6JFGmGiAwPL6kBYJ/UUNIKn
         xEui1LltvzDuo3anpCI/4AS85ejCtlIg8z7eUSpkzzfs1omdFK4b0ofS5sUmW3vTZvAS
         04oA0YIAPxi43Zi2FsFnlxMk7QNEoxc+iM59XdsMAYAojDf+pb2RHUQgyO3nSVHPhZX0
         5ZtMU3kbII7WVFeZdByR9i2AHV1waXQcxgsB4E+2Gq98rZFNRlPerJjVQ2g9nQbCAFjB
         FjdQ==
X-Forwarded-Encrypted: i=1; AL+hErHZknLZNgLc5NWfkfPDk2Xqx9D41JLUEov/RPdXT58gGnQe8ZJeHy4Hw/tOwGHWBVwGM2dxZ/rT2IPpWEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jRsSQ/g+uQdOnHngSEfiJQZ7GRngk0c2gJwEDMEIYHiyZdgyn
	7A3330tSVwHd11RzosW5sgJTWrouZ1XAg9biqKUnwNu+vN8iAorTFjNUhLQrmrAO2DKZgjZ7/hM
	MmKQpYUiEmQ==
X-Gm-Gg: AYBFou0and8n5ZvUFv7jWsugplaUOQLQO5SIZaIpg6jbg5nI8ybpUBhv1QBk30FrYZ2
	NAf6VM4ZUQCEoa/+ehqOcLgMS9+aGVB5aGozh2AdTxy6RoGkBkL91e4A1W89waX983bBWlqx7fw
	qjz22ZdY819ih4zPsvw8EsT98VcrRVhZep/pgTGwbHhYrE4V+Opw+YrU/3UE6L0xkQUefQsfmOW
	h3W1JVi92vXL+Rt6QMWrBp2zBALOJmQ+KCtBOUQdo1E8z7jCvmRIvSWqsIbVDHecxWoRKXvoDEr
	ZUqI7uL1Ktu+9F7eUHsPxtKXGqcaVOe7QdUrVGkyqdhBGmURYK0Jh4ig0ENAGH4vZx3kVPkdO4m
	c3XwHC1jiuse98Fl0RENUaoedl8fsLwWPmI8CEP8o2K7kqWHaCby4HUNAf9TXbjcqfIC+C1pBrR
	JRwmCzmnJqpbI/m64t6L7w5Sir7M13Pg+cc/mBq9G9OrND2Yw/if/QfyTnzgtGqJMV5FA4gZ9jt
	QgXZ8KTSon3J+0YX6CCcBrkgFUSgJL+B+Cfur/X6YrdA9VyBI3n3VJPrKS75b1K0LJn+jR+Wr2X
	gsNjL9hRM26S31rDQbEBrxuntL7vHyvcS6EPH0FBroALlZQDwmKQVlJkOGlWgjxkFMhO0gsVs3D
	TMrs=
X-Received: by 2002:a17:907:ea8b:b0:c46:8b9a:39ae with SMTP id a640c23a62f3a-c5066b65a98mr263796566b.28.1794425534395;
        Wed, 11 Nov 2026 11:32:14 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578bed97sm2791330a12.9.2026.11.11.11.32.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:32:14 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2404683f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:32:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEhxvsus/cnIuY1YJinFZES+8gWAew/h3zW5ZyrUVh4KaMHifLpJmVBwTwq2IdXiBg/ZrQkxz8Dc9+j8Xo=@vger.kernel.org
X-Received: by 2002:aa7:d1ca:0:b0:6b5:6478:a9a5 with SMTP id
 4fb4d7f45d1cf-6b7773edf34mr1838418a12.10.1794425186528; Wed, 11 Nov 2026
 11:26:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-2-kas@kernel.org>
 <avNuQqLf9CG9dSsE@casper.infradead.org> <20261111-heimreisen-ungeziefer-empfunden-a892571f2c07@brauner>
 <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner> <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
 <20261111-stumpf-montag-miterleben-c4e2feac8090@brauner>
In-Reply-To: <20261111-stumpf-montag-miterleben-c4e2feac8090@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Nov 2026 11:26:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjGXBnme-N+HvbzHH40ftb7Suc=kZVT5cuintQWyMHJ7Q@mail.gmail.com>
X-Gm-Features: AclHuK8LZq7-9ajWCZDJwTRjmLDnovqaiY30E_XKr8U-iLvj6BsIi-SShy4XPgk
Message-ID: <CAHk-=wjGXBnme-N+HvbzHH40ftb7Suc=kZVT5cuintQWyMHJ7Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio_console: copy pipe buffers in splice_write()
To: Christian Brauner <brauner@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, 
	Jan Kara <jack@suse.cz>, "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 10:53, Christian Brauner <brauner@kernel.org> wrote:
>
> If that's the official new stance than I'm very happy.

I definitely want to remove HIGHMEM entirely in the not too distant
future. And before we remove it, we can most definitely document the
fact that we will not be worried about insane users.

And things like security issues count as "insane user": if you use
HIGHMEM outside of controlled embedded setups or museum pieces you get
to keep both pieces when it breaks.

IOW, it's legacy. We should aim to not introduce *new* bugs to it, but
if there are pre-existing bugs they very much count as "don't care",
this will be removed soon.

I think the only reason it wasn't removed a couple of years ago
already is basically a few old 32-bit ARM platforms that still used
it.

Those platforms still exist, and I predict that they'll still exist
next year, but if those users have to stay at the current LTS kernel,
that's fine.

                  Linus
