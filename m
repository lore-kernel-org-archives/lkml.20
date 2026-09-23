Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4E353B34A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177938; cv=pass; b=INZo1jjZs06z6i5X//yInZVIXhQZUxeLxVcVMfFdXUAHZs0+g6vs9OA5zwTPayir3ueJOuFHPTiuB4m0NnRZw0C7mxZ6z4wXOIt6Wn0ubEYtlxijxvlh0n0PrBvvWtWaXFaBKSPdDQdf/zY3eBv9S7u2KyoR4kw1AN8En9JW6F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177938; c=relaxed/simple;
	bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlLx+IkU6yoHlspt9m9eCWOMAj0PEHMrrHLRP7t1QwnjqgUM3faZhGmO8j6rSSob6Yb6T8o+G2Hs0FZMMICPynLi+nPrtgLGRkCqQ99mb1gg8XWgY4Daoo8I8vncaXWeUJsGNpFAPbkGrfNdvaqzUh5piG1Mh3cdEDlS0G04jwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgc6ZLjx; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgc6ZLjx"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c556f35e70so167987b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177935; cv=none;
        d=google.com; s=arc-20260327;
        b=eZ7b4rBckH/9DR1f0sBKVaQnhnEo/BCLHAycab7ROcJCtLKvJYEVRBF7+GbwmtOjpR
         UOew4cYb4G6oGQD5/fh8ylstURIEKmBejL+BAm2MnuF0876dejbVkubp2iB4z5Opxl3H
         LMptpaCVY1jyXlWdEdolCsJjLdHwPTger02HQk/ehtyzzeuwUQou58/YpCJsoN+Cp/iK
         eLweas/6ilKOkhpCT87/Yny5mRy5u5QoSZGtHyjS7ihKtdueYcswQZLQx8hMXnYD1BIr
         7Vy4t8Y2FvtBX3m0mVCgQix1fEPghefuLP4ak9tlUhF+mpjRf9YAiyzl9QZOLnGmffr5
         IKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        fh=JsUkn1v9jJwp48a8dHO3qnmaBhi+UtKQKNbFsvnIg48=;
        b=ClF+M+84vWoqt8Iex01LJkXkC0IUEbWARchNq1TZ7G4Cy0V9KvaxL2PMv8W4LpDpcA
         nzbs+7LcsVehDMTla59pTvauT7cwXvX5J0hBZT2RuolDde50/ruiaxojnVdJJrjI6AB0
         dSR3EsXv+YbebH30yeIVPpp61Ttj87O/9jL4zhFNtmCh0OSMmYuYvCnp6OZ7dbSD+CpA
         E+gb8oIMXS7HSD4waFUeyKiEjKwiOMs7GS6sx0SvTEDXhJ/+8ESV1rvFUMUruwo3Hpha
         WUtAm72lLRUVnLzJ/YdUEnsMtn+9ECuyOC7hXlWzEA0ODZQhE8tRdfjRpMvX7vAenh/g
         1bMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177935; x=1790782735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        b=Lgc6ZLjxJeusXyd3EEeus6/sE1JDLDujyZs57woMUdQtc2Kjio2LZn53PlqdWY8WXT
         PtgkzzQP0ToxpHa1URnU5QbndZxyzO+oZnEWwQiIH7zzmPej8xSjBY5aySX0ud77uqtt
         k9rmz/ElydeS5nBSjOulsFVjWPNvLgjX1Cpj4tv5z5AvUTjibJznUimFF6bGEt/JYnND
         b01MckU/15AP/p7Ymcf/t4FYQM12Q30GgWluxCKw1MRqCAsPtHZfc8WLKpFviDNUoyWO
         QacCIOol8e1qIYJ7gxQyiOX1TsL3hqvUcuzvxk+OPAhBo+QpHXjDLjn6JRZO+PlIBCsR
         vWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177935; x=1790782735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        b=QE4IdBl6cWC888FPfAnGhv/oi4U1N7PRou5Ly5aXVxG2hnhxzsmUaR4FFZRR4dbG5f
         ylt5GHMYwSouGvBLhSCKOMDuXhdn+DaMpbh+WUVN6/eUT9NDVbpLPnUyPZYhqzPOJIQs
         jEcPrfj77C3J8fmaV3x5suRNu48UYwIjIBmKxt5QxhXkICGjf3Kh88/NwPyZj68DwQVj
         PBENS23IyJ5KmDjKT/zbfoU8Wa/lwedMBgw/1Uzd+x2IxMadW/Wv9NqQOc/9nkKNc/XI
         yZ4koTWEtuWaJrzRhTyYCc0cDqmRUzftGZrsamzWyGT2erkRqN8FuNhigq1YFIcYK/Zm
         U/qw==
X-Forwarded-Encrypted: i=1; AKwUvBxzIk3GEalP07a+O5zCYub63p4sDYTG/4CWmL1vRie01fo/mjS4bu8Wk7SuhK9djKIzVd8Qvc+ZObp7Fp0=@vger.kernel.org
X-Gm-Message-State: AFuF++ncMwRlcxBZJr6/RwtWkrwF03Et3mHxOsKbijU78Hkh9Or+D6/+
	T7hHBICPiLKK9CXvZF4zaK8xm4+RvQhAm6YTJysPEfxgqwPfGXtev7fSeTnMkr47sI5iZfcg/Vm
	Weg9xYIkf/0wdEH4Eks1iJMj6tZlR6Y8=
X-Gm-Gg: AYBFou3VTtQ5C77ECf3252KqqLcmTG6Pe6q6IxNjvVi9ptI++FUoYIFBgVBSjmkCRKY
	1cYSN4urJJot8RVnPBAu2zsl3rqZEQU8zvVXJNFdA6rV4H6fnhSP9oDfmM692YoiQ4fDdq9+j+F
	ItcyI6QElyjAsE35L/9+DIwXH+PXkbljOviJnQeL9ePCPLspneo0VICpqZA/a6f9DZgXxPaaTXt
	auQ/eeMlWrwus2vI2d8QIbUdfXX3NUrcA3MsPssZ4tt+CN5ufipcd9tNcBa1r7l3tniyPEmkT8w
	jCJm0GOR0vMERcaFQ5YarcrEcpyTkLIUzDCPY1DaaISSz+N7oa9LrrX1IGzjLUduhJy3/TY=
X-Received: by 2002:a05:6808:148a:b0:496:9bf:c837 with SMTP id
 5614622812f47-4d5b3bf7584mr4092874b6e.0.1790177934516; Wed, 23 Sep 2026
 08:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-2-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-2-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:38:43 +0100
X-Gm-Features: AclHuK_jZZFxO2Dh2JWJerZTiWPe1oDb0kLQ1Sj5dw4U8L9ub-MiIvvivGhqr7E
Message-ID: <CAGSyskWZFfuCvvg8y+Re3VKhHWZiWrAxRkXXoFp9pgCrqxi=1g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/5] netconsole: add a per-target message rate limit
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Give each target a token bucket and consult it once per message in
> netconsole_write().
>
> The bucket is created with a zero interval, which struct ratelimit_state
> treats as unlimited, and nothing can set a nonzero one yet, so no target
> changes behaviour.
>
> Skip the bucket while the kernel is dying, reusing the helper the
> oops_only fix added, so a limit configured for steady-state logging
> never truncates an oops, BUG() or panic().
>
> The configfs files that expose it come next.
>
> ___ratelimit() only trylocks its own raw spinlock, so it is safe with
> target_list_lock held and interrupts disabled, and safe from NMI. Set
> RATELIMIT_MSG_ON_RELEASE so it does not report the suppressed count
> itself, which would printk() from inside the console being serviced.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
