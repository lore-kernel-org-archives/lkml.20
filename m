Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792423041;
	b=2nYhEqvFJUlxZFM8hQw8wsShTc3PV7KxBeX2qytstyUJAaXNYgzdKDh4HEk3yeMn1M86
	 FCGU/EZeH3uZW9Ghl2g/ksE/zR04NGCvhez2bcw4mxNKY+GKR/Swqi/bx1xpZbaW/wuXt
	 9xaNrDKZzslttU68Y1suFTehiBeEyVJ31phmTh1GMlvY8X7yvAjhK06SavUTBZhi0C75m
	 7NunRvnBydnUxJeqzg9LRPhYlypuEEAjfoU9s3IT1jFXWRTm7ma8rXjCd452sytCeyE3q
	 JSkKxXqJgKA2ArGH+24Di4GKJmD862CYQ/UnPnuahozd6YdDnr/zqqyg8DG1zz/ktsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g80TJgftAYOuY1eEY8Pj3cKxe/RJlcWG/Y9dI5fdM0I=;
	b=S4lD6u5yVeC/LUPZX8HnolB9nV4SmQL9SPO6ESYtrEGwnVWKcnQGLO8eCJpTzIZ1kBHX
	 dW8J9unNkzF62d1ZTjBxjGumiyjz0JVD5OVCLBB5dBb/NcL0A+aBZfDkto5CMTIESt6x/
	 0QCkZLmOc4KpOqGQ5y8jNWnzjAviRVPWxttCvESPTAa5hZ16tKBiwZLwQf9/Z1ex32bN0
	 Y1Pzhg7bw0JnudQTVUfmH9MHzOUn98N3n9EZSAo3cQSNj1kl2wQBlcAq1Om/KXBBZu2Id
	 m9HB/Vu9W5whDz3tEZRKf5gCB3y/8NKGgo7FV3nIgxV4AhutoSa4/LJEl+eH9Z57EJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ezLXwHIz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B4A60A2602
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B4A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ezLXwHIz
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so18004a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792423040; cv=none;
        d=google.com; s=arc-20260327;
        b=kiNnZaXFAgFMoUgxuJtxECkOeLN2zPda7bHLQdc8glpxB+2Al94gcJFUkXAvTbuNSI
         Wf0N9Ocq0bkT/SyBOSntvB7L+SlP7OUXzFs2n/o67jiVGdo6UMkgj9CLczyMVke0nYw3
         uq3DZVCVNYzA6xPnugLKibrYlsopRBm1xm1kxr24ol/me260kKDmzCrMUiXYwvLIbyzf
         eQfImehKAppwyHSGItWGDfTRFpW2vNffEYHPOa7NoVZGikFCVnzb4tkEOfw5RIHGBO/6
         5ErlSBPZYsCXRT8u+4jJK4D/EgvYv5gg6xmN0BXR2mRffdd+w1cOtDSkNerXeCxnF9LY
         Yu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g80TJgftAYOuY1eEY8Pj3cKxe/RJlcWG/Y9dI5fdM0I=;
        fh=KNRZLusofPx79UZ8cgk+yc4jxck6EoUpaA1TdaAYUVc=;
        b=fOJJ/oOGGPu6FidMFSjiqc2zPJ3cVrlSucYyXS+wYuMCyBZ0jAY5L5xRXz59WHbBMw
         gTmez70ZoLlaMSoFkkF8qPtuzRZdKBVpMyRBL+nfGKWDREMLp2PwuzVgqjpZ/Ix9Ec4l
         dDvSXRb5t8Ov3zXC6X8DHkxvB4OE5ImKdpRluHTu7ftyL2kZhAW+RbiiNC3hbjxh4C6Y
         Y/J8fSjLvxE8hoO6svnMMSPueFeATKrfNr3eAe0R7m8P5Da+wB8kodgnFJO8vpvb2s/F
         oMtfszcT7BsONSKT75tZ77CokhrKHeOxJP+/APgsd/uoU0U8ODglrJ9t/gHS4Xu4PYlF
         cJSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792423040; x=1793027840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g80TJgftAYOuY1eEY8Pj3cKxe/RJlcWG/Y9dI5fdM0I=;
        b=ezLXwHIzPfS4sEb4a/lZXhXGEhuDtOUs1if1P/9Ak+Qq4maPAojdQ/9u0w1JCobLs6
         X2qdgAH/pLcQQVTxacqSHUYx6U1JRUcIZn4tCqNb3LkXxjpcgVHNqa3WoTOGvqyOills
         BiT2SHvEyuzjoiUDwEqrkKaqqIzh6GuaX4ulvYHeJnHQYLR1ElbgGP4U4xx7Lagi2fO0
         Vynf2ZaV+Wzz0LcbAkKRjY0IP9jZkLPwazVoJg22qEttAj4FtBF1o+o2OJakE541fU8u
         FgKrm31Dik2dQYyZFm8ilfQpMr5pGVDf4JR9znCUx7KiyvzqmlL+y1djjhWdf7HTbGCf
         568A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423040; x=1793027840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g80TJgftAYOuY1eEY8Pj3cKxe/RJlcWG/Y9dI5fdM0I=;
        b=Wu7PjfO1syCqP6E9SVfp3b/nVaGAr48nXeDngHUHPeq5yh+SIvg7RRYa0CWgTQ973C
         rFFZHiwH5oSxuyyhQUlcFKYgRAjkmzNb7Wx9RuTWM12JNPSAp63T7Ph993x8Xgk5SW1n
         51L6FDNZBfRVpQnaMdJUiCSJchMnOfm8T09mf3MxkNx6hIihhiQHINoWYSlSWIAff6Ji
         uqcZP80KUm4peKUbvN2ATTylSNYQPu5N34fgxTXZmEsZVjdcdk3J/7xbq3jLn54kydJW
         D22gra2SjWusWENVhdhxTUAubAlSuF1Zvg5dece+Eg0e92GvPSxoHMB3U5DGVUIGPuyB
         /lBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdq3thwclasD+R3C7NFdPutNyzhq7XfFNLdsWCCVQwu8iFTgSh4PZRGWlUXaCnxgVphHPj74za4gVCJB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3y6R4NVQRpwi1lECW5eWe3wbhNAB7cKsZ+lpmgw3HggdjTBJy
	wa2BkrV3mT20pFZt8ptIq23e0wN1RYqGueEN8SPBfiPPC+H1hA9XJJcDYB2CF+bs7QKlL+SFEL+
	YJ0iSv2IPPN0XJD12/w1BGy0kRLzwchsSGFvWNeBO
X-Gm-Gg: AYBFou2fNu6t305IpcYQ+5JxoeFMXindyCXerLL34Xe2M+2YpZechI3JNhHpQ5h2re/
	xmPpOTt2X3ka4JY6XRN6SjjC5xm/bSdSpc8ztTa8P/WODZontRCUFRgndS3zi67EgftUts8akFa
	RGXlyv7uFArOAj+4EmHB5buON0IncjjCvQHh+v7lUwrSSVeBFwLmSmf9nKwaRpi7eXyrvturQCs
	HOjXE/kBHeiyQghMyVhQe3oRVcQ3YrlwLjfe1Q8A0z14XPTP3sPveKZrybQW89ZRM+COqZlH0cO
	U0bghfj8q0HpCzbcOtvSZHElzVyEsxHabVb5Y28VuaOdmUnkskzqkFVQ5zFIs7FOR9ugrPvJs4h
	1x++1C3SS6A==
X-Received: by 2002:a05:6402:24ca:10b0:6b1:cee4:8d8e with SMTP id
 4fb4d7f45d1cf-6b3c73e2b3amr54877a12.14.1792423039402; Mon, 19 Oct 2026
 08:17:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014173945.373295-5-almasrymina@google.com> <179209666252.434549.1850964039919625643@kernel.org>
In-Reply-To: <179209666252.434549.1850964039919625643@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 Oct 2026 08:17:07 -0700
X-Gm-Features: AclHuK-S5bmzvfsy_xN2FySxs-CZRN_0ke8ew0HfEdZQ0PJrgt9ujVcZv4HD-hY
Message-ID: <CAHS8izPkWy4mMj+mDyHq8rKfthzj3n7dj7=Phzq2sut79JydkA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/6] net: skbuff: replace __skb_frag_ref()
 with symmetric skb_netmem_ref()
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, ayush.sawal@chelsio.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, tariqt@nvidia.com, horms@kernel.org, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, ebiggers@kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, petrm@nvidia.com, u.kleine-koenig@baylibre.com, 
	j.raczynski@samsung.com, wang.zhan@smartx.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:37=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit fixes reachable page_pool refcount imbalances but
>   has no Fixes: tag, so the fix will not be picked up for stable.

Yes, this series completely cleans up the skb frag refcounting IMO and
makes it all make sense and touches a lot of the skb frag refcounting
call sites. It's a bit too drastic to mark this refactor to net. I'm
suggesting just fixnig this forward for net-next.

--=20
Thanks,
Mina
