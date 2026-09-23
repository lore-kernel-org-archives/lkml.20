Received: from mail-oo2-f26.google.com (mail-oo2-f26.google.com [74.125.231.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC254854A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178019; cv=pass; b=BfInBq0GMQkj1i0h3aaC4m5SWECqk3Ew4olv6FbT5wf3r0Aze1SvEbt6Y2TFaucKWPV019kn0GrApjzLIH/ynBb6uu8CK3TRWKBAcmpM/aDoEDqdp9qOFtzg6w0tbLZA3d0gew9juHPEfD8+uDUxfLN1OGfCgpYK3qVcow8D4pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178019; c=relaxed/simple;
	bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0WlAnxu+hZkxQJqXHGkd9TNeQKAp043Y0kwGNghvO40QWLkCWWY6zgebHbj7M0BtKzGXTJqvvsAMI/PdWYb4+IhiuKsgp+A9I50fKOMTh4LmFwhuKKoyEW1DmJYpQ7oBeHD6t2NJxlycYBqDRYW70LY16tTRtZdahjo5wJj+wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm2INPB/; arc=pass smtp.client-ip=74.125.231.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm2INPB/"
Received: by mail-oo2-f26.google.com with SMTP id 006d021491bc7-6ca62176ecdso38487eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178016; cv=none;
        d=google.com; s=arc-20260327;
        b=DbMv7PFxvj/tdSZT4eus9h6g65NdZK1ubLcqp0ZtmYrdG2DRhqh0dOkf6yeztWLI+z
         vMvKnEME7+Z6AQHzzmDCzsfTRx/XQQ4QjCFY8nBRik2SJvqSuEUyJCy195r+hPXWQpiR
         EU6C+CLyhITO74nj91fUUd95IBhTuhkJVe5wJ80OtWhVSrCgbNeB0R8rEKqzqOeKXlLu
         QKtZ+W9Xw/g2PvzjqRjthePXr44/CACEiORclucax6jhFnEGL09gyde4USDTqKuZNjGi
         vNunDhbuacP5dT8tYyE1wjaU1rx5suvHrpdXq0p14qFmTACfZKA/EpIccPpH8fDZuJJz
         lRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        fh=3DxklzoEY+cTV0JoDHrM2pgOYZInimX/JPqAryDj6+Y=;
        b=XrJNmz6QNMDKfcKI06fzT+qkE+9Lv/zQMhedYj8+AtWYR2JX2jVzoISyQ65fQM4s9H
         7FVPld2u/HHxgyBfbu8pAh39wTxz/Ur8FL7qVmLuAWugur75aPtgkdYn4683trBK56iz
         +W+P8yysM+zYHvkDo27aGXubiY46EkieQDveNxhDSayAJ2yC/wHk5GvJ8Wy/t+M83aZi
         ZE/NAJC7XmdxV3o+H6a1n6PQ8Xa2By1VZm4Vfd1bJV8hgxNIiuJIrj2itlvVqW815z3/
         YC4vj224xSJVABHH2qK4NVu3Lzn16aNdir2x2vaVPLLg0aRWKBJ1i1BjwjE6oGN6Dp9Z
         NZZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178016; x=1790782816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        b=cm2INPB/9rCqjGjznTx5zKWjrWfIWpnXs1FvzTdYqkVb88o7r5PsQtPn0uiuVPmnXC
         MX+tQKC46Md0kIf/xSfql3JI8jk8bZGaudWm+a8OI+3n0x80ECOAUxLnbh7p4BymQ+1z
         gGDM8DX+WamDE9uhQ13GCKBtV37b5dIVJh68fA7G1hIyak8/GH30PUmpcg8N8qzSuaJF
         Hlsw4VRBcntF8kMTGrBbWpCl+d4UbAkmLzRdn3qJUIDIqH/nulpMI2ezM8OoUKZ4540a
         w0l36sjehhvgGfijL8ne78bQImuJ3/DR1UVURKu1a0NYNGWDsySW8zpg1XkCX7ZPohuY
         X0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178016; x=1790782816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        b=M2bC0XZoYcR9b/ilZgZKv+fZjZjXXnXPriCGK+QoSNaAdvrqMXigi81kKDQF0Rp2GH
         I2Bj8+bys5e9xJWHFXIBRmrfYu2zv5msLL5cJyR9YSdWYyM9kJgdgJGZzCgmBkaNoX3C
         EcwRFrNdQoDil+XBDwC3fNQvUMxCEp/mDIvCttRtFZLLeS4IvWu8DNJ70GxYxxZmOXi8
         cNmRIcIPRUI9wYWFG7tbxdabFcwm9POSM4SSOp7w8fDql1ONKb+TAK6Ua5w3oRb+VTIC
         ILRRB6kqLyEu9Pn9/ncNGELr/VUzGneCLB2ds+bThu3yaM762wsfvjcNpJoIshOp4IKf
         nYMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxruwSo/TdjZoWA/opYgpaq5g2+pQvX7WZyFVy7gCczzK+l1mc2T6ifiShEtYVnOiHtudvbWMJnfSVf0+8=@vger.kernel.org
X-Gm-Message-State: AFuF++nwGkLW/5c7y1pcwzS9ua5x96E6tNAYGdF4kGz5lDS53y8wDjaW
	xDsmm4vX3f9CBL1m4QfzpW6XyTKCevW8NACYC9P5o88kUna3+fWWkZH2QzBatg3eLDsWu6cwyF5
	zMjCpf+GhXxh7KpISfxyyPE3SSFWl8zE=
X-Gm-Gg: AYBFou1atS1nvxi5sP5tyHH/TSTVusIQghHCq0daQhI17uYWHCtGHNK/i1wVbChM6qQ
	jfSTjENZhZbnd7532unb7t/cndrgrKxQWNk3WUf4RHA24E6JiLsgPH6sVKSPQCv5YzGRptIeiO8
	MYjxBtgn7ZBMGia4FBOP0qs9UGx4nIxkefuVk05MNMzpyhFFcu+OWDysbieNnkRccywdM51YMq6
	fyJqeJKTY4vjfJuWlXnT9Uhe85ESyJF3Hj2ZOBl9emiznkAkdFpWnjMBy61n2bd+sHdC3lguqVz
	c58cAcpOd3VQNJjWzLRqdBaVuIC8xUGPxsZf2JZaGa609Ksil+ZbM64ctioNd4dFo60s11vBzb+
	1Iayg1g==
X-Received: by 2002:a05:6808:1a1b:b0:4c3:ef94:830e with SMTP id
 5614622812f47-4d5b9f9412bmr3726243b6e.3.1790178016141; Wed, 23 Sep 2026
 08:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-5-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-5-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:40:02 +0100
X-Gm-Features: AclHuK-eiR2fNKubYazj5gcFmudoFI1w_j91DvZRl7oxVpCmicGBPNhjY_7h0xQ
Message-ID: <CAGSyskW+HsE6Bp=95EMF5rWqKtoUAFp6CjH8sAFs0gYywuALvA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] docs: netconsole: document rate limit feature
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

On Mon, Sep 14, 2026 at 1:11=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Describe the per-target token bucket and the two configfs files that
> drive it: ratelimit_interval_ms and ratelimit_burst.
>
> Spell out the two properties that are not obvious from the file names.
> The limit is accounted per message rather than per packet, so a message
> split into several ncfrag packets is never truncated by the bucket
> running dry halfway through.
>
> List both files in the target parameter table too, and qualify the rule
> underneath it. Only a disabled target can have its parameters updated,
> these two aside.
>
> Note in the message ID section that a message the bucket discards never
> reaches the counter, so those drops leave no gap in the IDs.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
