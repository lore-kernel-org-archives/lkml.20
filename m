Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C52DF126
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876607; cv=none; b=M6d+ZQnAYFD+gQiHj1tjCIB6p/Ct/zGF/4JDBJQbKqLQMoVk6PvlWX9aDpcbohz/2Y/o1WGkGf0xyI3HBZs38wwTWCkLmemglEuVMlekfYeYpz9rsAtSBpw7bIUt7UkbSxhA4DDPsu0SXuuk/Rr4Ab3UWY00Afw+Txfz/H3NXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876607; c=relaxed/simple;
	bh=hBr1Ex5WG4KD1qxkihLF7b04nm5PW/Gqt6ASQmZ2E6c=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=s13PWZAwWjwl89DEnwWsXPOmyxn4ciPhCWfoSfhhCLTv1iI8YTF33xJc1+hNzx1fM6LV+GRXo82bMui8k3UkYPsCgF5yPN28p/NKAXYOQCos8QekS29acFrCdim4XLoz47FueYwViypSvTgjXWRk49gMnTcJzC84erIastIfzfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIHGNh5I; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIHGNh5I"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c0c45c580so51023431cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788876598; x=1789481398; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CLCLoCidgzVEv+BNHGydwTqpjWHKqka2lrozB/v4Tac=;
        b=qIHGNh5Ik6+m9PA7Iw6X9eOdMvSaEqLB/r090uo84DWjkOTke2CCPgwClIad/vxJKE
         VSwQ5oT1CfBRGDu9hZLA9c85paXh9So3yJfcC3+c15m34YedT0PBzOnkWbok0mIWRa3v
         L4t1VkRrUViDAG51nv2WV5rcanFP7qEeYmG/bjUyzTTIH/I9UdUSom136iiF8J5OYxgW
         Yq5FeiK7rHjRLCOIuhRft5QTIJyTz2UC7hwm3Ai+n8ZVwbRsydjGNUTySnGbOMmwaTY3
         YkYNCFcrsSZTG/+OjTaCwtASeZkeqXryL78Fo9edMXiCeIVG/kyJLQwhJ0XK3NL8Fa3+
         X0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876598; x=1789481398;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLCLoCidgzVEv+BNHGydwTqpjWHKqka2lrozB/v4Tac=;
        b=gS5z2/4/KWXOHUDt6O/Th/yiHRpCkYya4Gfvg6/YqWrCB4+FqGac/9ioQPDl8OZ10u
         zygk/9uSLoY/0L6LjR0XRds0v232oy3Nwz9feim0stLogQcdPJlxW5jWWWGVAsgnnhlg
         792qgr8qCY5rEJoNhYcwhbKtajBVNnh1UG89wEjBNym2uypuP6GwyO1ULE6NznrhgcEk
         2PETnuVxSeKs8/F7BRFO1kSN/reK7zG9N6o3sCYkALafrub2O7EgjcosG/whO4xQlDvL
         b6Dq75TpiXV6WVuBy7Uylznfwp/cfV25Lh7dgjBtPcJd5rEQAHM4E5LImsdoogC6dXO5
         L1Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxnBjGmdvXtFs2ZezHe1WLLj2HiWh7r6dAGgthllOewkWXHwq3gXYEXnQtNTXqFWGmAvBk/XVA5Zk2zY+4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJaJ0Jv5rpfKMeuzbLhOkPOOTT3klkLYdbFU2SdfGZenWtCJdX
	7MTi09pCnXzAUUjWiZV2URe2uhtqJ2+uvA3E8UEANj9Fb3IU8gyUCdup
X-Gm-Gg: AYBFou1Qb8psdMz+/dp+Sn4ijR9nkjw2fIIkJfJRiyK10xMMn6qNX5M/0lP66fY95m4
	damU9qWH1c6kVeX0fgAdMhwgbNQKVe2DZ9LYazYRzwFUEipLkgVLgW45L0C2AQmXTz0SmKYIrUT
	ZauXkUlP4Y6cApb8YS7VIFSWupEwTyUQiI7BJovDZFzkSEScagz8LmtXcTjoCIgGg+CDMJvbQAH
	05qkx1YVU6KwXKD5Bo3uIr7ou4bm/vs6yPkdBTYfI/NiSm5v+YuPjONVpQvl1aM39Cq1J6ObCGp
	t/3dAN/s1Q7QT7DADIH/wBIi4EAS+CB3WKXyyGQBkA/B99LYP9i6rPfu5VZflzQoHTRM1nDvhUa
	Hp0nM2NzpG6W64/z9csVhlC041EHBHEv/fgbAKQ/mqK9Js/FsOXgjXcgJnOnDDMIbpJ6bG52mFV
	uIQtZ2twPh3WXd4JECmgbgC5ACqJWZWsxg0TnnlsCTmIvRks7U6IALxFvgH6AA0EI5iuM=
X-Received: by 2002:a05:622a:28f:b0:52f:9f8d:915 with SMTP id d75a77b69052e-5305498b8c7mr365209911cf.26.1788876597860;
        Tue, 08 Sep 2026 07:09:57 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a8d3sm114527681cf.2.2026.09.08.07.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 07:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 10:09:56 -0400
Message-Id: <DL9ZTV87UI2A.2QIEPTDS2ROKA@gmail.com>
To: <patchwork-bot+netdevbpf@kernel.org>, "Daniel Zahka"
 <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <horms@kernel.org>, <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 0/4] psp: make tx key ops optional for drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
 <178882561539.3212362.10949911837502586488.git-patchwork-notify@kernel.org>
In-Reply-To: <178882561539.3212362.10949911837502586488.git-patchwork-notify@kernel.org>

On Mon Sep 7, 2026 at 8:00 PM EDT, patchwork-bot+netdevbpf wrote:
> Hello:
>
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
>
> On Thu, 03 Sep 2026 18:33:58 -0700 you wrote:
>> This is the first of two series which together implement rekeying PSP
>> protected tcp connections. Here are both series together on github:
>> https://github.com/danieldzahka/linux/commits/psp-rekey-split/
>>=20
>> This first series is mostly non-functional changes, except for the minor
>> difference that netdevsim driver implements tx key ops. Its tx key ops
>> were basically NOPs, and in the future PSP core can subsume the assoc
>> counting that it was doing.
>>=20
>> [...]
>
> Here is the summary with links:
>   - [net-next,1/4] psp: refactor psp_dev_tx_key_del()
>     https://git.kernel.org/netdev/net-next/c/7b26ff200739
>   - [net-next,2/4] psp: move code from psp_sock_assoc_set_tx() into helpe=
r functions
>     https://git.kernel.org/netdev/net-next/c/4d3a7d1104eb
>   - [net-next,3/4] psp: allow drivers to omit tx key add/del ops
>     https://git.kernel.org/netdev/net-next/c/1e16b303109f
>   - [net-next,4/4] netdevsim: psp: drop tx key ops
>     https://git.kernel.org/netdev/net-next/c/da630d1da2b1
>
> You are awesome, thank you!

Thanks. I think applying was the right move, but I would like to
highlight something that sashiko flagged on patch 4, as I think it will
need to be addressed with its own series. The hazard is preexisting and
much broader than the way sashiko talks about it.=20

The high level idea is that netdev core should probably take extra care
to make sure users of sk_validate_xmit_skb (psp and ktls) cannot clobber
what each other has set for that callback. In the case of psp vs. ktls,
there are probably fundamental reasons why these should be kept mutually
exclusive and their uapis should reject attempts to transition between
them.

More generally however, any offloads wishing to claim
sk_validate_xmit_skb should be considered mutually exclusive, and netdev
core may benefit from a generic system to enforce ownership. That would
help in case another user of sk_validate_xmit_skb comes along later.
