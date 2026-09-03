Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102D3FF8B9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422960; cv=pass; b=M9gr5fL9wWuqR5jSg1HgVJU8fRWfjSFeJpnO0zwIEA9dZurnCNeewknUDisBZCpDzKoL31bADk8njoG+ZGfo6PHhF7GTKj/2zOWXkebmjnBIznprMaSRX1eGeeLcbN1k6ey8XoG9QWlurLNu6IMQaAsDIDFa45yHi5ndlcPnpAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422960; c=relaxed/simple;
	bh=dWEo3mp7frOFVKITzORF+6HHk5U6mbYoC8XrjT44of8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVubYV+oYBGbsnL1HsfcpsPTcsXMqHJn6juoXcyKNbCAOyd8YxFqVn9ywtDfS9HCgE2kLJpPSau9VZUzIWEpof+rtQc19YRwOz8iMSBMhUICK7uOLFebai34DV11y8/75vpiciG5pLV7dkbOs7sxEUFFZLeN1U+YiOfC1nXDbn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=k+HhOoMk; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="k+HhOoMk"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39faf9e2c62so14089381fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788422956; cv=none;
        d=google.com; s=arc-20260327;
        b=EIA7RrecXFlPfAmAIMlMHnhFyzwLFGkhynx2JY0OnLTW/jzlBSxJcC3R3L/6352/tW
         +HBbsA7PYnqFgbWK2AGhj7UnZBhuoAJuUQo0dc4geS1sU9uw5fQ4mo2Cubc3PD+JkzmC
         uB7viGI1V19XW7YGTqGDmO4S83SmyYl5pnMqO51vrS3mfkKcnz3gOPrBrQ3yINkf9PVb
         Am/m9woksCEU9F8lzUrX5qxTE9CsYpWKG/rYyQbEX28gpfZ62HQVZDvZh9cK1Q0AjNDK
         n1WLkPrGADgUNTdinBSoj/b/4vv95u0bL22lN6R2gvtOyr7Td50OL7SBEMHNLw3BOC9t
         HDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTfy45raSGSmQ3CPJ+k8R7TpaweRcKOSHtZadmJbOaM=;
        fh=73y8uOkyYZ1Ymlh5DSheddl0xFOLMH/J5CI9q39WaYU=;
        b=EACZxVuFaQidmYzCBhEPY2abS9PfANjhHoytEBAAW1L9WZCCaV187KxTVkaoxGxNYH
         T1VE10A1qgNLPR/HSZ5nDQ0Mplgp7ByzYhYLbkeUTVgWtX1JA90qnATUTlRXP0Z53eMk
         U9DvzJMq2CzOrUvt9d5UiGvvUgvFayXCjw1sHMlh/pfcSYvAXoIt7+5viTtOfk2cCbZD
         7S7nHKTx8XHznT6iEmGOWltrQ6qs3lQuB5pzNuF+FbWmkjOjzPZDah6/8yYI0Wpo6yBW
         tnf9bxxajlgJ68xHCyNVNbT+lKsAw24hHUvqasjQS+9NLHpH4j4akX/hEZJPT/2xoO8X
         DBoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788422956; x=1789027756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTfy45raSGSmQ3CPJ+k8R7TpaweRcKOSHtZadmJbOaM=;
        b=k+HhOoMk6tLRoMus9fcYwhdY69VwLNTc+4p+IDImaI4AoiK3BLP67bD4OJY3x17luV
         tZDTqDifOEFMu4J4vHkZwLZMr+HsyumkVqzkU6ZI3pMB9g8U0ltgFtrlxD2e2/OxHa0+
         iO6VWeVs5t2Yg9zM0mVufn79jPdTNOC/ffoVl0tSVHCYcm+oEHePv4JGolDmo7ARLW7s
         eDNd/OkC703ZRdRC0/T7I+OwjmecjtMnyHyvq6E2rbRLgW9o3YmVn654PbY1CDt+8NTB
         WMItEVfAcnlyzJkdSY6t2/9TlgxJtmbjfOXDXgRHiSAe4U3nJf0XZjZgTkFQqC2nsnJw
         0jkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422956; x=1789027756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTfy45raSGSmQ3CPJ+k8R7TpaweRcKOSHtZadmJbOaM=;
        b=s/hthHhZA5SSirCwPdWmfwmcn64XHOyteX1nBsl1SRABvweHzu4LeyjWFt1ENMEK3z
         MC3iigV83HDDSIA+LAKAUPYDeUf+LEYWIWppbdYW0gW+or9Ga+MWjpRwVsSGX9h74YyC
         ZwK4uR7LVfeTUFBWj0Nw60THhUxkQslfrHkml9mALN7XdrayMoDfvg7OMheVEOUxrt2F
         iD3TKyhWE7YvheCUt2LZOGu4k/h9y0THl+dVfU78CNROa7ddu3mgI0+/gZO8fit44SlS
         6+B8LjYlE6rbawjhQcq9HFKDRS7PLbdJ90zn21ZZiARIeQ3nHzkHSweP231pJBSigJfF
         UDtA==
X-Forwarded-Encrypted: i=1; AKwUvBwGRUtRpwaBoHGS1vQFfVxKEHQ9OCe7vKRQpfkoOZwUwAJ8DuE34UD3KZcfA2PRVEAWtqfLmAO18xuWfZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lYQWIKZpgK7I3C4gqISH7vJ/Nvyt+tdJFI5GUr1+mU+lKvUtn+
	budZ4SWVoKIZcDns3uoMmHrMlX2ZTeIQUfhrI2Fqg6ERxjGzQyx9TcOm3q1tSuWHN4QoK/1vH/B
	9D5L0VdXEpQUVXPv22RIcde6v6D40HyT5TKN1rqw6u+w=
X-Gm-Gg: AYBFou3ZeGyUvJgim7ltVlS6j5/COFcpHbzMlprgjZFWiN4iJ2rhtPAKzPoLponccbl
	TycUqEKQKDMRYKc9hMhzoQR89xXKuPrPhbKj+ClbmD+a+hE/00ReUPUq3DE/bRk18T4lPGXcK6T
	gEXCXIgLodIVxks0/WgxIC7jZqgom98dEz9Ul+e4rYOhHrCVTXtZn/hHddjzgOOL3iAYOMwL7zj
	BtDggIjJE4jon7PTaZztN1SZe/Jw6jk9fTIUu2QfOmhgwqjmk+5RpJ+sqws36PcUeoFra1c2yt4
	XGkjD6aIluzk8ya/sxjwRwrW4MvQBRYKuVbYIWDOhObOBbOhcLY+KCqZm9XjnHGhIJlNGr1CKTE
	=
X-Received: by 2002:a05:651c:4ca:b0:3a3:115d:daf0 with SMTP id
 38308e7fff4ca-3a35008931dmr18616021fa.6.1788422955902; Thu, 03 Sep 2026
 01:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787903722.git.zihanx@nebusec.ai> <8e45ea5d0cf764267a90d959fa40f0f831aabf08.1787903722.git.zihanx@nebusec.ai>
 <apKl65BbdyWCtre7@strlen.de> <CAANe3eT8ycDkomgpzZmni7hMrUX1fr2dE4QvQOcKCPEcw=J=2A@mail.gmail.com>
 <apkahwSdQhuE6gRV@strlen.de>
In-Reply-To: <apkahwSdQhuE6gRV@strlen.de>
From: zihan xi <zihanx@nebusec.ai>
Date: Thu, 3 Sep 2026 16:09:03 +0800
X-Gm-Features: AcwNN1Wd0FgsqLjcXjqWHA6w1DrMXZKkBLBFaJpau8ih4FBDSOgZEW2Xg9zNQoQ
Message-ID: <CAANe3eS22cFoqz1DWAkLXkskZqO3istpX6ARSKvBKBBVKKKdtQ@mail.gmail.com>
Subject: Re: [PATCH nf 1/1] netfilter: nf_dup: prevent asynchronous duplicate recursion
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Phil Sutter <phil@nwl.cc>, Simon Horman <horms@kernel.org>, netfilter-devel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, coreteam@netfilter.org, 
	stable@vger.kernel.org, Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 2:58=E2=80=AFPM Florian Westphal <fw@strlen.de> wrot=
e:
>
> zihan xi <zihanx@nebusec.ai> wrote:
> > If you do prefer to keep a small nf_dup-only change, I can prepare eith=
er:
> >
> > 1. disable IPv4/IPv6 dup in network namespaces owned by a non-initial u=
ser
> >    namespace; or
>
> I think this is the better option, someone would have to explain
> the use-case for DUP in a user netns.

Thanks. I will take this option and send a v2 that skips IPv4/IPv6
duplication when the network namespace is owned by a non-initial user
namespace.

Best regards,
Zihan Xi
