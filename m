Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD84D0CF6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579558; cv=none; b=cZctatD5wBoNzR2r4ccfYqHlp6BIQidvnRX2+Qn7cLDFGf7LXQXR4uZLDhRfpVt8MjwuKv1ctpwfF/iMPo9sPv1VNy3eOETVpMpB7OgsodN9j50H355/lK+SlGOIsP7qrDcmwvua/jPhUcoeWggLwMiPTaztMLuZw8dJSXZmmfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579558; c=relaxed/simple;
	bh=oIs6fzy+l+1Pv5fYJ/81fnDfgGbi5VGvlBD2/CZN9ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNPz8ykcShSs6h+PRBWGsTB9UEdm9r8f+wgNkVvI32hA9+1+JTryV7dIascxOU0tj+ep+4KQ2IaAs2Q4UY38eUzuMOZBbRHvLd214EHo8ZKhkpb6cDL9wBsQMlLK5Z9R9PnyvalrqHIpZpKq/i1TDSvvUccSBgveVXAiyhgZP5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBetjFx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBetjFx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD941F00899
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579554;
	bh=oIs6fzy+l+1Pv5fYJ/81fnDfgGbi5VGvlBD2/CZN9ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eBetjFx4k3JtGQO7sy5AQjaqkBY0p70iFo6+boeVoENF0Aq/orTvbXnhFAh6ZmUOq
	 8cbGxphcP9hIG/8VcEry9YmJ8JiyUNJpCjKCbIW7JZHhUOL9OFtj8N3P/ZLSwqzXRE
	 pWVK4+KZ5gOE7eQkpHJ9oWTnVrb/Utor8j/ulyrsPJWL+L8gpM0o5oxZcIBStefH8R
	 dKv88D2I1OsbxxH3aCX7y6k9rm8pB+rEV4+6yg2Oo67zIqPrN67IUEQG6F4Ck4gz6w
	 5h2NmGZ9ELWwxM+bKafcwGYj1sVocgg6SeO+wm1OtxqrLl4KRGLQ52s7aaqPUBwNw9
	 u3YWOYK0MoX+w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so1866582e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZG70yQ5Z05n0OUCUNLz3jl8AleHxWJMLXnMDLPzIFel4Na47ZHmKWq7iN8t6lV6MwcABDTLqEJWh/7P0=@vger.kernel.org
X-Gm-Message-State: AFuF++kwcZzgWHqHd4pTVHhqoaj9TStPMRL/XFC8KKFQQMsYlGdHg9i3
	Zl50TAFMzPfDGVEGalMQ6HdS/42ASkCZL8vj92KkO8tYL1Iff9ygdtAq/ZKaYlu1kY/AeG0R/e0
	DjfRADz9vgUGT0jHKOzfYnZCE7W5GTLw=
X-Received: by 2002:a19:5518:0:b0:5b1:4c14:9b3d with SMTP id
 2adb3069b0e04-5b8ba5de63amr78323e87.11.1789579553533; Wed, 16 Sep 2026
 10:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
In-Reply-To: <20260915070103.1733176-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:25:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
X-Gm-Features: AcwNN1U5p1jQNWfJDBDBcokXqdBha7CDbxJEl7eNgY0-Nuq3oH3fx3OcCRj68Ks
Message-ID: <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: bmasney@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:01=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> of_get_parent() takes a reference on the syscon parent node. The
> reference is intentionally kept on the success path, but the error paths
> return without dropping it, leaking the node reference. Release the
> reference before returning on the error paths.
>
> Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
> Cc: stable@vger.kernel.org

Stable? Really? It's no big deal.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
