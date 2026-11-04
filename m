Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793803900;
	b=A0n64nx+rrtIlql063IRkHmFWGVWAZWahN1wOcSk0+xQu5HRTrefC9iGVnQScAtwoASR
	 +NLAAziKliAp2UfHWSX+u/Kke8M0PHJdo+E68J+oFxD5577JEuN+WzPaJGBAfr5s1PsF6
	 dOytmQ4JYyYHgd0Z7VsYiKE8d/nltjdbOf1V3vb4750vkV8cqb2VoPQINeMaZ3BMDhzoi
	 ejx6VmOZJRMQczWUXkEkP5+HQuGpZWRzpxaZha64Ui/Ri1WBDduod0WuOSNOrNY597SH3
	 tBgyjvE8YwHlMylh74C9cbjSDD9kvYb9EhrvgFujl9HX2llNJPdRajFwYjrfx5+y49w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KlMV/XWOLH5Lp9S17+M0Me/y6BklUFxP6uaDz/8Mgcc=;
	b=Q431grEwi+TTOFM72pZ8I3wtC4t4eRkZN65TmtyAxifTZd/rMPdgeKneMqmPiBaP7oQq
	 XiTym3DdTqVpCp4t0Kef9E2iHegz25LkUcKgdz5PCtOBIWtKoo7lhpzHfuLXXxdGGH7NZ
	 IFEVpa2vV344NK/63V4/pckIJQXs8DzDcKchdcwRrhzXm0+TrGx7n6xWIvg4Ga7B5OftW
	 tCvKfhmWxAcwqyMjIHcCV3sAl4d4dQjOFH33z4xhT0SFEoZh290lXySdLu8SNLWD1/ly+
	 EK+Mv6YLkFxGy2zC8tZpnNEPhseh8AOsYXkP0fiIXNugpDdMUDAsWeE7jnO1xn2yF1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axHDqkHu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9981E606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9981E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axHDqkHu
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b2d14968c9so8744077b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:51:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793803898; cv=none;
        d=google.com; s=arc-20260327;
        b=O9QW2YwKVbqfX3f5Yp7JDZagHy7ZoUl+hrkqR2yQ23DGV2RYIYW/jIXYIgLS76eiiJ
         GoDj1n9usmM3CzlXxLymr42PQjx6sQdMObItT6xJ9PXV5weHHEdBx6hsu761bFL5iFI6
         dV5wqExmBekLycS1Iv1YajLFgZEQEVvdij3vePQMwH71rJw6jpZXkf6n1Dtzv76OYIMo
         MyNq/MqrqC5fo97UJq9RvR7RceVKtlBAp3jpjINcfhY0KTERqQ92vwLcxDlgD+xzjAzp
         dvW2Pbr88omCIy0ph2cY4obUTJoOPki05BxRecR76ZlGApajEaY6gp2EqE0kHe/YSkmz
         bjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KlMV/XWOLH5Lp9S17+M0Me/y6BklUFxP6uaDz/8Mgcc=;
        fh=DCY0urqTCauIzCUzAXK8HNGMqenrs6NbeLw+4c7+A0M=;
        b=gxsnsKaIciDxpiwaR3Qn2Hux3EQSSyr34ymGN63KgVIt+YugT43r79cfhHBWRHf07V
         m+yGW7lOB8JyGWkVCbntu1BAt54e2x1ertTLb1YYDBm/bVAMz5AxVtlbaHm3EKXPRxCG
         niHqekrrKITcRNzoDcAZI90L0dDO3Dx48kWJ4W0m42ryuOI0Hett3sMJ4UmWGhOKj8r2
         SnsQQZ+tWFSK5hEqCi89QDnho+RDSISqZYMSenhKn0zGwdbanOv7mEF25H6N6q5x+KE1
         48U0W+4Y4bVl0DFE6m/EikuVcKQJoCVusNhOtBIko8NWNatOE1GNKaZPeG9YUMDCkC9j
         XWeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793803898; x=1794408698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlMV/XWOLH5Lp9S17+M0Me/y6BklUFxP6uaDz/8Mgcc=;
        b=axHDqkHu8OL3IOSKcPa5pPZ2Z0r/tneF+Ew1dKtGN/TiIIuV0BKCFQHKB43yt13X7+
         cOfaiqppQtfvZJ9y1cgOyZYuP5b2Hp4ihyBkt0W7HUTc6+MpHG6QbM7BDGMqJCtRK5Kh
         j4430YHf0RzItFGW7Q7cEh1vBXZ4JpSx4e8QuGkNbUpV7hv+xJQAgCOb4jLWy6EqL8h6
         IpyxydKW5glmHSGghZPG0rl6k6dqdS+5ZFMKPERUfhq/W2TgSZZiI8UqRF0ubwhEX2re
         ugibYrY3IWiCFcZmStw1fID923csWXSEKEjkeywPZOofjIlyqFyxFyTJJVF9MJeHmW/f
         71Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803898; x=1794408698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlMV/XWOLH5Lp9S17+M0Me/y6BklUFxP6uaDz/8Mgcc=;
        b=YXmvobXaeD6oqCrnHu0Zg4lArDJ5XYSBJsKLAGRj2tHyocqRiGGZe60MgmTlTG1b/6
         PiFrwOEE5mE0qRb44YJI72uJCQ7cyhFlWABF+SEgP+UYprBNdDoW4NZcgqQVz6ZlGvxY
         bzfGOqt0QR/4xFWollrB5VQgXMMfhp26qZxCNlydT6sSRxfmQfq2tUvhGcLNZq4Ba8L2
         r7oeHgnb0xX6tKbKvmv4L9TxHVzi9eNxKl7E3Mo0WGyTJ4pXKGaVow7M9un2GM3AmBX6
         ALVLMUm6IsdMQpqyGP2QkywzEvLcaOlp0j+Sm6iEwv6Fy0w5j8QjE0wsG7xK3RsD5KB2
         X0sw==
X-Forwarded-Encrypted: i=1; AKwUvBx/qpTHMAvVeluruGqXZauIHFflzsZggs9grVB2FlL+X1VlMOfFte5NgaM+XZkLCTxSCQHR9GSUfShBNn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z97xMp1RiNqnBHyVjew6mylXFkTfMbiIU3KGNtZ2F+6vWQEZnGo
	vxOM1OSuoOr9/Lji18tUoOuh1/ZRYfOgOI7rbr05ydFnakSbiqF51foo87qQhH+Yij9bHViZA0c
	rs3Y+DRUgpnDtV0luHKZICQ7QptgBrKI=
X-Gm-Gg: AYBFou3lgcAxVELL2xFos1jZh5f+TQI8yFa3qH9f/Cv1gaqyQtzW92iRmNFTHRn8d0x
	cwje76xDB173r0QaiaHRFLWGjle2OkZV0UYlbVi+5R+fuAJojNwz+YnJX9an6MGJdD0RuHY93mA
	2bp1Bt9HZ9GGrvgV1Y1KGzTIatgQRnlBLLUDNb2f2irMUzdHlx64TGoGLEFVCMdMVs+Y8yfSgdE
	fF+bn1ZNMhF7ge8lg9LbokSc0hJAUeENLPgijwNAnFkqfdLDyZ39HGkUG8dHG2irdcgXDJ0mwT3
	adiT59LIrA7+XOtQMmAnlBtj02p/AO/Iaiya9gk4iTKxxMj/1lgERhDWxtTeTFIiETgBZpZUNLW
	MmoxvQ5W2y7JOXMlLSCsMBisTznNbLftJnPyRSxR8VHGF4YyrrdErFkq0FXv0NXL7l/DUV5WmTg
	ok00AatLfSGfLsOlPJZwJPc3z27e6w/sdv7pTmtXhmPEIJQsgRSALnRzZC
X-Received: by 2002:a05:690c:7107:b0:8b2:e86a:8f11 with SMTP id
 00721157ae682-8b2e86a98c7mr53940707b3.47.1793803898497; Wed, 04 Nov 2026
 06:51:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104120138.1165715-1-radek@podgorny.cz>
In-Reply-To: <20261104120138.1165715-1-radek@podgorny.cz>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Nov 2026 09:51:27 -0500
X-Gm-Features: AclHuK-Nn9lQIytK-gDLUH1LcIsaOJHK0BBKUS0y8zeOsq_7IqOseA2aP3DPxQg
Message-ID: <CABBYNZKTROzNKZGRcU+hFu4XfgUZzPtkJ79vOrReUTtkDHrDAQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: find an RPA peer's connection parameters by
 its identity
To: Radek Podgorny <radek@podgorny.cz>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radek,

On Wed, Nov 4, 2026 at 7:07=E2=80=AFAM Radek Podgorny <radek@podgorny.cz> w=
rote:
>
> A bonded peer's connection parameters are stored under its identity
> address, but hci_conn_params_lookup() matches only the exact address it
> is given, so a caller holding the peer's RPA misses the entry.
>
> hci_le_create_conn_sync() is such a caller: hci_connect_le() puts the
> peer's cached RPA in conn->dst, and __hci_conn_add() no longer converts
> it back when the controller cannot translate an identity address. The
> connection is then created with the controller-wide defaults in hdev
> instead of the peer's interval, latency and supervision timeout.
>
> Resolve the RPA in hci_conn_params_lookup() when the exact match fails,
> so every caller finds the same entry whichever of the peer's addresses
> it holds. The exact match is tried first, so an entry stored under an
> RPA is still found as before.
>
> hci_conn_params_add() and hci_conn_params_del() look up through the
> same function, so given a resolvable RPA they now act on the peer's
> identity entry instead of creating or missing a separate one.
>
> Fixes: 4914c4998961 ("Bluetooth: put the peer's on-air address on air whe=
n we cannot resolve")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Radek Podgorny <radek@podgorny.cz>
> ---
> Changes in v2:
> - Resolve the RPA inside hci_conn_params_lookup() rather than at the
>   hci_le_create_conn_sync() call site, as Luiz suggested, so no other
>   caller can miss the entry
> - Exact match still first, so entries stored under an RPA are unchanged.
>   I weighed inlining this as one pass matching either address, but that
>   lets list order rather than exactness decide between an RPA entry and
>   an identity entry, and resolves the IRK on every RPA lookup; a small
>   helper scanned twice seemed cleaner
> - Rebased on bluetooth-next
> - Link to v1: https://patch.msgid.link/20261101-for-upstream-le-conn-para=
ms-rpa-v1-1-988629a09bc9@podgorny.cz
>
> Tested on the author's van (BCM4345C0 against a bonded peer that
> rotates RPAs): with v2 the peer's stored connection parameters are used
> again. bluetooth-next itself was only build-tested.
>
> Per Documentation/process/generated-content.rst: the patch and this
> message were done with the Claude coding assistant (model as in the
> Assisted-by trailer). The prompts asked it to fix the lookup miss named
> in the on-air address review and, for v2, to move the fix into
> hci_conn_params_lookup() per review. The author directed the work,
> reviewed the result and tested it on the van.
> ---
>  net/bluetooth/hci_core.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index bfc5bdebc71a2..2dc12c01c4dc1 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -2285,9 +2285,8 @@ int hci_bdaddr_list_del_with_irk(struct list_head *=
list, bdaddr_t *bdaddr,
>         return 0;
>  }
>
> -/* This function requires the caller holds hdev->lock */
> -struct hci_conn_params *hci_conn_params_lookup(struct hci_dev *hdev,
> -                                              bdaddr_t *addr, u8 addr_ty=
pe)
> +static struct hci_conn_params *conn_params_find(struct hci_dev *hdev,
> +                                               bdaddr_t *addr, u8 addr_t=
ype)
>  {
>         struct hci_conn_params *params;
>
> @@ -2301,6 +2300,27 @@ struct hci_conn_params *hci_conn_params_lookup(str=
uct hci_dev *hdev,
>         return NULL;
>  }
>
> +/* This function requires the caller holds hdev->lock */
> +struct hci_conn_params *hci_conn_params_lookup(struct hci_dev *hdev,
> +                                              bdaddr_t *addr, u8 addr_ty=
pe)
> +{
> +       struct hci_conn_params *params;
> +       struct smp_irk *irk;
> +
> +       params =3D conn_params_find(hdev, addr, addr_type);
> +       if (params)
> +               return params;
> +
> +       /* A bonded peer's parameters are stored under its identity addre=
ss,
> +        * so an RPA that resolves to it finds the same entry.
> +        */
> +       irk =3D hci_get_irk(hdev, addr, addr_type);
> +       if (!irk)
> +               return NULL;
> +
> +       return conn_params_find(hdev, &irk->bdaddr, irk->addr_type);
> +}
> +
>  /* This function requires the caller holds hdev->lock or rcu_read_lock *=
/
>  struct hci_conn_params *hci_pend_le_action_lookup(struct list_head *list=
,
>                                                   bdaddr_t *addr, u8 addr=
_type)
>
> base-commit: 3f425f95ba3923d605f6a8b382e8fcdc59d479db
> --
> 2.56.0

Sashiko flagged quite a few issues, please have a look and lets
resolve them before merging:
https://sashiko.dev/#/patchset/20261104120138.1165715-1-radek%40podgorny.cz

--=20
Luiz Augusto von Dentz
