Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F1A480356
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528306; cv=none; b=Mo4gi1i4KNJiSPwu8P8ibfjzkHj5pDpRi4MkbqJtZD0YzDP6v5qrCMWvyVxk6YwQTt7jAk/KGG0fJt7+m9Hpoi/JW4d1C0e0brbP99/bixWqq5tGA764Fl03XRPYxPD03vVXpebP14bN+e6klNEY2AT8yNn5mjntS51Ae3iMJ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528306; c=relaxed/simple;
	bh=7IrgWckgLXmOp+bSbt2l3lsAkLznjIprg/+l63INEHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JQdoODJunzgL5L63m5TJ00ak1038NiS2Zd/98WutL+mv6tZP5BnQssd6CGTCSjsoNbGvhq+rp/Bzyu3G+w7VFAIO3PZi9duz1kUlJTYH4EH1QmDzf/vlkwNkGepCqS+Hup5OGFtxPHe3Lj5dxFroh+hVc34s+7MtSvaBkldTGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io5VVGDp; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io5VVGDp"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-86cba60d4f2so8399137b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528301; x=1789133101; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EUxRc34t0qU8FOfG0VqqQu2j6hNUb8g29gyCmIO8xCk=;
        b=Io5VVGDp+CZ4sCDGBJWKIvbBPJiL7wXPujE8eqUiy2X6aLrwI6V0GFNbQXCRooi4W6
         Qv5uZ/hg1BMjSoax92jJEjOcRy92hppD5AEQHcoe/O5Dq7KBu2k9c2pZ8B3Bpld8afcE
         wuM87A8bwdwP1lgwmI1ZktnAli1WGSTI5YNC7TlPLXUc2ymBT0EMQ9jwa9V29vtMZBq5
         wJa7XJTZO8ERQw1jeQYt5PEVEsdK2bRNFCQFlFJSEYDaA4lHUPIEP7y58oqzk1qd1APh
         UWHvjbNVibFz9VdcOa8UaxbWYmof45ePAT9TcR2qwvsIZOnD7LXS48aPU7YLQImIFvXy
         4eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528301; x=1789133101;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUxRc34t0qU8FOfG0VqqQu2j6hNUb8g29gyCmIO8xCk=;
        b=DLNfL6G5jtcqu2hA5KVqRVb9X8M1V9y4c05dYrziKaChPwrRSXn+oCnNr0LsF6Wyht
         wO7BMvLvJN9kcTIcSkDOKSV8Xtxnc18alLww+f4BfbPZb3Jpy58tOcVpiZW6zNHGKwfe
         dNkkG2NxRscp339OYUZGTtoRG4U8QCPaT3k0Ur6Do5zfVa0AkWPzr3oCn+VBEmGuuxcI
         AuP/izrzsfZNIisy9iYhmKu3wU1YxcXhWo0WDP8OrWXtgzM6Xf/rvFfjQQcrbMQQuNFT
         SikXI56WiJrHf5iPxRC+w9c0EBQElync4MU0iM8oB3nCtM6Cr7ITP8TeHFHIzoGWY6yi
         QMGA==
X-Forwarded-Encrypted: i=1; AKwUvBy2HWG6vAKgGML8IqxeLitSOdI+SMjVDSB1JtcugDbkyLtQwR8rRxgZ4LQi2FNr/uyKL8pA7YymXEdygTE=@vger.kernel.org
X-Gm-Message-State: AFuF++lc4FHXYzLWfWHx32ecG4f31cMr8Q1BCYvfjUe+Xj0nQDz0FaKR
	lnqonlliksusI1cjfV/t30CCgqLPDsxqzp8cmN8o4KfkzKR167+clvWt
X-Gm-Gg: AYBFou3Z9yHhq6m1uSXOdx0BEiW4njv/79MCd5BllcpZA3uYrS7gVGhERFUggVLTfz8
	Au4+wrOlJmhFRsFzFBJndxKpimlY1rJkIFrDFN+YONi55yL7e9+CrRRlVX1TQQbVqkDKGGJzYAt
	nEJDXw/1dsTpGBPZ40geSQpWNXcTClAIBQnpVr4+s9QTjDncVPm8h8icqENSAHCAT4YhCsG7RXB
	LVzAKLnbL/O4YAGCc/pCf6HlOIMxA4gXmi+ujnkiv9vEksjhJRaWhj8jmzSB+zIkirzWLbEDdcS
	XaCnTlOiITl3rhON0m5whkK8hV8F/ChoiKQIUw08db7E9FmvPpgt0p8K4Z0oFgD7rL7Q/tSfn3n
	17hq/1xqQEr1xpTLqTzUinf7XaL2O08huekavFIzXI42f+hRWW+xohwJMEz8/aPGABW4MU+L+8l
	oEr82CFrJzEdoGroHYrs2S3mkuWYVnWHRsghgdIIherwLKz6NUn732Qx9HJNGcPRILtA==
X-Received: by 2002:a05:690c:dd3:b0:873:5c6b:a2ff with SMTP id 00721157ae682-8735c6ba63bmr2923997b3.45.1788528301340;
        Fri, 04 Sep 2026 06:25:01 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406bbb79sm20079006d6.47.2026.09.04.06.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 09:24:58 -0400
Message-Id: <DL6KD9FKLYQ8.1HD909WP9YA21@gmail.com>
Cc: "Aleksandr Loktionov" <aleksandr.loktionov@intel.com>, "Alexei Lazar"
 <alazar@nvidia.com>, "Alexei Starovoitov" <ast@kernel.org>, "Allison
 Henderson" <allison.henderson@oracle.com>, "Antonio Quartulli"
 <antonio@openvpn.net>, "Anubhav Singh" <anubhavsinggh@google.com>, "Bobby
 Eshleman" <bobbyeshleman@meta.com>, "Boris Pismenny" <borisp@nvidia.com>,
 <bpf@vger.kernel.org>, "Carolina Jubran" <cjubran@nvidia.com>, "Chris Mi"
 <cmi@nvidia.com>, "Cosmin Ratiu" <cratiu@nvidia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "David
 Wei" <dw@davidwei.uk>, "Doruk Tan Ozturk" <doruk@0sec.ai>, "Dragos Tatulea"
 <dtatulea@nvidia.com>, "Gal Pressman" <gal@nvidia.com>, "Jacob Keller"
 <Jacob.e.keller@intel.com>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "Jianbo Liu" <jianbol@nvidia.com>, "John Fastabend"
 <john.fastabend@gmail.com>, "Kees Cook" <kees@kernel.org>, "Lama Kayal"
 <lkayal@nvidia.com>, "Leon Romanovsky" <leon@kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Mark Bloch" <mbloch@nvidia.com>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>, "Patrisious Haddad"
 <phaddad@nvidia.com>, "Petr Machata" <petrm@nvidia.com>, "Raed Salem"
 <raeds@nvidia.com>, "Rahul Rameshbabu" <rrameshbabu@nvidia.com>, "Richard
 Gobert" <richardbgobert@gmail.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Shuah Khan" <shuah@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simon Horman" <horms@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>,
 "Stanislav Fomichev" <sdf.kernel@gmail.com>, "Willem de Bruijn"
 <willemb@google.com>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next V3 01/15] net/mlx5e: Generalize TC <-> IPsec
 mutual exclusion
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Tariq Toukan" <tariqt@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sabrina
 Dubroca" <sd@queasysnail.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260903085215.3691657-1-tariqt@nvidia.com>
 <20260903085215.3691657-2-tariqt@nvidia.com>
In-Reply-To: <20260903085215.3691657-2-tariqt@nvidia.com>

On Thu Sep 3, 2026 at 4:52 AM EDT, Tariq Toukan wrote:
> -#ifdef CONFIG_MLX5_ESWITCH
> -static int mlx5e_ipsec_block_tc_offload(struct mlx5_core_dev *mdev)
> -{
> -	struct mlx5_eswitch *esw =3D mdev->priv.eswitch;
> -	int err =3D 0;
> -
> -	if (esw) {
> -		err =3D mlx5_esw_lock(esw);

This appears to the last caller of mlx5_esw_lock(), so the function will
be dead code after this patch.

> -		if (err)
> -			return err;
> -	}
> -
> -	if (mdev->num_block_ipsec) {
> -		err =3D -EBUSY;
> -		goto unlock;
> -	}
> -
> -	mdev->num_block_tc++;
> -
> -unlock:
> -	if (esw)
> -		mlx5_esw_unlock(esw);
> -
> -	return err;
> -}
