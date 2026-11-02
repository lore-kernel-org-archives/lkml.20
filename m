Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652175;
	b=kA741tBD5GAORJauPm78S6XS4j+gfmt+k1/kUET/aLaMdXLMKYoTA6qpTZKAuKHIKYZL
	 QgP1ywSxOP1SE5MXMra/WB3EZW2DT4o8rnu1EVdXOJd5njNb6GSotZCH83zk/UQ/xbyC7
	 fmrUwGww1Q79zVvLwQSt8eMl80J4B713hoZDeyjWknW+bNzM/aaUGEbTPBytQcJOg/+Ai
	 BxZDx1MXnIxOejIsl1o9LGb6bfEdlIL2uYL8U+crYkieTWhmmvgrD6pJ6bUWk5FcCMS/F
	 T+Ivp8fTgO3r1NluUZX3Ur1LT+q0QKQbyLgipYz9Cg58dFYA2pE0P9jFYD1ru5CrsZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/QLI8mJYFnXRVSxZ2KQLYsglmS3jX9PmCrZKy4kv14w=;
	b=wEp43rTluBqB2ZYPXBTQ+G3t8xoj/8Ei3quHG16YN+TsyhMpWzkfCBKzAq83TLkbdHTf
	 MEdQ+zmFHIk9oxQcgB+SjNW3fjnH4NHhdV1WaUkDVtxl9v2KOV4cp7Uwp9tDzeTgp5+4f
	 3Sy69uDwGzejJCl/LrWDamNwTtdalspQJpu5bA1v++RXc+aiDPuuo2NzUQ9flMyxK9awZ
	 iEmtnLK25GMGiubiFOcs7jWFPsJi4XA0EE72AaQkNxY7HX4FMyjafhUyuOZrT1aSi2+XO
	 Q4axdzu26dVrHN2Id0EDRj9owdObwSq7HvOmXd6WsAYcPZKLwzJJE+9+UbihTvBOIIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tqAWcKvi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADD0606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADD0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tqAWcKvi
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0a28a720aso33710727b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652174; cv=none;
        d=google.com; s=arc-20260327;
        b=RZs4JJAvDcFxk/JoUSKQWNd/GnTbn55QvxBBp2iPOM6IRt9w6Z7xC2+Tc0GZP4LUpj
         0u0cCcqHVNUICA2/zQF85bcDDgyzPLV174gO+bTLsG8tc8kb0aWcDq1yzODKdNZQ2q9u
         LR/8o0GNNE7t+ufUlv/AcmkhGrZOkNtyTqDaMRrLKbMoahSgU/bmCZtEXQlUHmTdb+ly
         qg1bb0ocxVFmEF27RM8olxUa7FIstRGlr+Tx+RUKRsTi/DKH6Sf3tNA9ZLetZMHsd4X3
         yFes28ii4u86LWnC+jhYdv6eJ1jt/UppTTLJtBxAE5DU6CXNZD1Di2HIQ3RIwTpAN3AC
         SO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QLI8mJYFnXRVSxZ2KQLYsglmS3jX9PmCrZKy4kv14w=;
        fh=pIWMOhpXAZpoTUTgfsPk+3W2/syDqTihK9aS3FHjrqg=;
        b=E+jLT8wz5VywfTIpugRbxySw3U4z2lciMQ83sd3DOsQ/zGdDdiu0lE36X9aLTM2XBe
         TQCdkvF6yJFJZOZTmejf6rrFRqfxzfXJWi75udYgqCJzGfrRwc2pSiQ1yz//EcNzRkx3
         SInMYTg06togDf4bUJFNH4/b8Tu/hhuVFwJtB0OFIJK9Q8bMldYZ9mzTqLIGv5VmQBNS
         8iLBxn7Ck7MUgUWduu4gw99Q6iBsSmeWjAb57xwMP5MpsUlQtz8KPY8khm3YTrvwgfGU
         D50ND8rJLeGhQmoD3jOoDGF574gq11FgE6kE053Fbjy5bCO69bDH02pBGgXx9xh2MwYK
         baJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652174; x=1794256974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QLI8mJYFnXRVSxZ2KQLYsglmS3jX9PmCrZKy4kv14w=;
        b=tqAWcKvi01iaz2VcTj1SEyKzhY30jMQVNBKNd91ir6stqSQxqnZGOu9jBrJmff0B4u
         9mfeW4pn623QOXd8MueU52xkfQPx8Jpo2Mt3BMIHjk7YA04lboch9jZKQXOXrsiR5u5s
         xCxXRL+hXLZSIedK22FIVu6wymC33gIw1na03e+pdk85T59gGxc+A5zwdYHukKYquGky
         tUo09uKLyNTaO9DtVqpuF8NlZMchceG1WM8ECeajUUO2kjHPZodmUWc5Kqp+GitqcqR4
         rc6j0xPgfybQMo0csnpGYEJSxmZa6twyBkxL4vJSpggcpqjC4I5HlYlmH5EMchtTH6Ey
         oUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652174; x=1794256974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QLI8mJYFnXRVSxZ2KQLYsglmS3jX9PmCrZKy4kv14w=;
        b=lunuFbNbxhIYblnV3yvCEv4VZcYc8jUgKL+XrFdU+1omyhPYVCPVsTsPnWpCgDMZqD
         J1IbKRbrIJGXAEil3P6ukOWwX7FxZ746EhScQM2FWydy5fYpWmcBQB71LfJHoUmduwKI
         46LuHf01E0pONa3jB2f2WK/4e5BGNXDfvfTd6k7pFQKQkwAfTLMFhr5ZxEa88P4ZtQPX
         Q5Gtb92lqumuU+J7LNwIl7448VvYzpwEewfX73nL9mIWMCHvnBfzAfkHIzXTLyzK0szO
         Zx4s36ihzRrp2KdSsi8cdd13hS2UMgLRad84eLgWRfBFHOhAcv5B5FhaxkGvOEa7Ad3b
         8hcw==
X-Forwarded-Encrypted: i=1; AKwUvBxZsdxzXHllNquN8s/s5I81CzWHlNwVO5XJEI5DMhSICZkoMmA0QMKH7Kelm4F3OZXosnhiVY9agsCJQrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ibBwHy3NwjfLTtAYBzJ6/l7AvjeuxVem6hnIcIUZJRbm+Btje
	jwez3be2u460Ju1FSUKS+61xc8wr1VrJW5DD5mHrIoJTMYtQbpqouubAn+5+sz3NdMMOwQoVXgd
	dt1s6OhWWRYC5WmTW3ERO8TuTKMIpvps=
X-Gm-Gg: AYBFou3KLmhFng81wMGpaMwGEOq95Tl9OceDzeaEsW9BPD5aOk/KNHjNrlvLlCugCS+
	zgUBVj3e60ZOMQGJzvcgw9D4RVutzu/5ynU1cdhlTn4AJynRrmlNOc4Epvm8LCED67y3NvQ3ZH0
	knloF1xzw2ukZtviyx8N5fJQXroOJUIQztLZ0Db9zf6j9oicYtTfZSw+Yj6uwPpiY5oIDfqGteK
	Neqg9uZI6EMR+r+q9uku9HASzZaRr8WlQh4CljgnIaHtBUxMXKbqL9FkmgUcwKGuaNNwdyO/en9
	x6Iuw9kZ6ycUpHodtvek7pgsKSyF55hQ3RQtkCdvCa+/zFQC1t2+NXKbaNNuF7pi6zZIkNQjFo6
	7hCiTciuc1zCyj0RhRb2R3iPdRElEea/+Jc9F43qtxP7df+wO4zw8GHjlVlAn6GMzqcJbUhw6Vf
	3uRINOa4b+N9or1rCI+bUVKFU4KUPFy0ayR4Ok/E881KJSXLnwkGgX1gSD
X-Received: by 2002:a05:690c:6602:b0:8ae:dfee:cd30 with SMTP id
 00721157ae682-8b2b6798d15mr84579077b3.56.1793652173493; Mon, 02 Nov 2026
 12:42:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-for-upstream-le-conn-params-rpa-v1-1-988629a09bc9@podgorny.cz>
In-Reply-To: <20261101-for-upstream-le-conn-params-rpa-v1-1-988629a09bc9@podgorny.cz>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 2 Nov 2026 15:42:41 -0500
X-Gm-Features: AclHuK-CPNGDsNR-b_xddiTj6w8veiNPQv8o9T2cZKCI2JUnLIv-tAla1SNVBM0
Message-ID: <CABBYNZL4Ab4CYiQg7ZKnn0WZR8B63GqnazqGoUz9nRFQTwJvjg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: find an RPA peer's connection parameters by
 its identity
To: Radek Podgorny <radek@podgorny.cz>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radek,

On Sun, Nov 1, 2026 at 12:20=E2=80=AFPM Radek Podgorny <radek@podgorny.cz> =
wrote:
>
> hci_le_create_conn_sync() looks up the peer's connection parameters by
> conn->dst. Those parameters are stored under the identity address, but
> hci_connect_le() puts the peer's cached RPA in conn->dst, and
> __hci_conn_add() no longer converts it back when the controller cannot
> translate an identity address.
>
> The lookup then misses, and the connection is created with the
> controller-wide defaults in hdev instead of the peer's interval, latency
> and supervision timeout.
>
> Resolve an RPA to its identity before the lookup, as
> hci_connect_le_scan_cleanup() does. The other lookups by conn->dst run
> after le_conn_complete_evt() has resolved it, so they are not affected.
>
> Measured with btmon on a BCM4345C0 against a bonded peer that rotates
> RPAs, with stored parameters of interval 12, latency 0 and timeout 600,
> over six forced reconnects each way on v7.3.1:
>
>                        before          after
>   requested interval   30.00-50.00 ms  15.00-15.00 ms
>   requested timeout    420 ms          6000 ms
>   link interval        48.75 ms        15.00 ms
>   link timeout         420 ms          6000 ms
>
> Fixes: 4914c4998961 ("Bluetooth: put the peer's on-air address on air whe=
n we cannot resolve")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Radek Podgorny <radek@podgorny.cz>
> ---
> This is the follow-up to the on-air address patch that Luiz said could
> be done on top:
> https://lore.kernel.org/linux-bluetooth/CABBYNZ+5zV8xzhHZKTUQYT4tLHaZAO7i=
iKOEsKuT8aA+YNLjPQ@mail.gmail.com/
>
> What this does not establish:
>  - tested on v7.3.1, not on bluetooth-next; the patch applies to both
>    and bluetooth-next was only build-tested
>  - it shows the stored parameters now reach the controller. It does not
>    show that links are more reliable: all twelve reconnects succeeded,
>    with or without the patch
>
> Per Documentation/process/generated-content.rst: the patch, this message
> and the btmon test runs were done with the Claude coding assistant
> (model as in the Assisted-by trailer). The prompts asked it to fix the
> lookup miss named in the on-air address review, then to measure the
> result on the author's van, with and without the patch. The author
> directed the work and reviewed the result.
> ---
>  net/bluetooth/hci_sync.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 9d829c20c31604..810d6f5143342a 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -7018,6 +7018,7 @@ static int hci_le_create_conn_sync(struct hci_dev *=
hdev, void *data)
>  {
>         struct hci_cp_le_create_conn cp;
>         struct hci_conn_params *params;
> +       struct smp_irk *irk;
>         u8 own_addr_type;
>         int err;
>         struct hci_conn *conn =3D data;
> @@ -7057,7 +7058,16 @@ static int hci_le_create_conn_sync(struct hci_dev =
*hdev, void *data)
>
>         hci_dev_lock(hdev);
>
> -       params =3D hci_conn_params_lookup(hdev, &conn->dst, conn->dst_typ=
e);
> +       /* conn->dst may hold the peer's RPA, but connection parameters a=
re
> +        * stored under its identity address.
> +        */
> +       irk =3D hci_get_irk(hdev, &conn->dst, conn->dst_type);
> +       if (irk)
> +               params =3D hci_conn_params_lookup(hdev, &irk->bdaddr,
> +                                               irk->addr_type);
> +       else
> +               params =3D hci_conn_params_lookup(hdev, &conn->dst,
> +                                               conn->dst_type);

I guess this could be incorporated to hci_conn_params_lookup
internally, so we don't risk other part of the code missing the params
and any address used, RPA or not, should resolve to the same entry.

>         if (params) {
>                 conn->le_conn_min_interval =3D params->conn_min_interval;
>                 conn->le_conn_max_interval =3D params->conn_max_interval;
>
> ---
> base-commit: 42b8c2d729268a65a2d98064e8dc59ff53646b14
> change-id: 20261101-for-upstream-le-conn-params-rpa-f2334fb5dda7
>
> --
> Radek Podgorny <radek@podgorny.cz>
>


--=20
Luiz Augusto von Dentz
