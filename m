Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720669;
	b=uR52fJlKB9hMMptB1i89bpzXHv5hyyZBzAJASQtqb4YnVSAQAMduIF+SBC5OhxsI9a/R
	 toQOZUDpc7vXrI0Pr26PfaX6KD1ciVeE5haJE1i25DvDpg4LVSjyx8/zcyqi3Fu0FfGOv
	 9OuWj6h4AlG3iVkXWTbiRwJqU1RHwKf4xWmjxSMVGXVOLUOS3rN6TPguwBndBlZWoHz5s
	 Ir+4XVqmK9DYn7hkvfUWJiGDt1MuuwfyuA2YbWdcAuacikcvjXvluTglawV4Y6iNhJfjm
	 j+Y7MrHn3fyOYt0goF7uywhmh3zU3xDPk3Rpqoro/RlS28EU+xTegYGOP0VFQKuTqZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=nLhbzQhcrJcE5zHgH9QEWsAoAStLTeamvslZak3IipI=;
	b=LerBR+Bq51NSluFOz6rnXKeBYxo22me7dpQDCHmY9B6JY+Y9muDO1mt7kFWut3LF+Wy5
	 cbJRKNL6J+kQx7aX+wyBKvWZ4kCSrhNlwyIvKa1P1AARfVL6qLAr5xPsGUxWlFG4ydziE
	 aFHd4obIHIZHr1YkNAZDd6+F9B+GJBG5z3Odv4KEShbpJdRxys5CezwVvTia0xpqQZ8Mh
	 FJbj2QAL51cicfwX4OIvbIlxG2/2s7QQEOpOCYqowRtM5hIAkbs2LJFX4MVRI1F1FbMX9
	 dt03LfX0CqDBxFBuzupbVRbJVlDAvlOFUNNNuU0pjMIsZ1JM8N35ll6XeDgfp6SyqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U2sluQDB;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66798606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66798606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U2sluQDB
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-713e6ecf595so826029eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793720667; x=1794325467; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nLhbzQhcrJcE5zHgH9QEWsAoAStLTeamvslZak3IipI=;
        b=U2sluQDB45SVmfoOc5qsQjR9RgmMInyalxugOfxiQwTg4CNO50voTBmbiMbyBrob5i
         UGZo5Tg9e7cgytcq6XmIoO6Ppot0iazwvAeGcdLdoSXCUuzGhlXUuowIrLoyuIYt9hKh
         PA/Ly/oDiLRgehx+21oqo+ss8GOrM5rQgA0dMdp4IDEvKI+bPpKUjwKGBbpY5dMsXTYT
         Gi9U19MQUj3T54TLGA0U6eqD3z6kVEb5v+ZggNzQJLaOlAEltw+NFUrzOkQL00++H2VK
         vwcsRd8AO6GxQA+NQT4iNCNT8e1RjjLz5tfnf0p2afVr7EwJfnDwPeh5gsrQZe//PjS6
         w/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720667; x=1794325467;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLhbzQhcrJcE5zHgH9QEWsAoAStLTeamvslZak3IipI=;
        b=T4G5Qf6ZNAqlrjMKqRZwV+Ku1Txv4ontXCGNrhbyaA2tmiqo1dzbjcslbak+Kuhpod
         FmHNceOCPiAuRc/wI1vY5TrD9fwjvujW2C1FCW05PJ0WqJcchmu5jx2TBl5k9TLv6H4F
         IG3+523Y4bi/GofmhELWItEJdZWqRf6Q2PXq53bpXBdCK39aPOZgK8o39McoXTkvc7Dc
         OJITwwfimGgJcRE+5fUqBqP6hJYYMwoDgqVHMUSkbgfc5MXp9vjLYn5nU5kLB3OrXxVi
         qGdG2BXqxVmzskCpRJh+gqbv7VFtiTda1H1AW/KXFCGIuumKqQDLFWydSf2FgpHS6IuX
         ml7A==
X-Forwarded-Encrypted: i=1; AKwUvBzQN7qdcP4dCOn0ior30JliYTRI72dEiTJXzwXZSZ0/f9wm6sIhLGQLrCx2VvDEpMo/M9I0qz7xCctPai4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T8LS6jmwnJl1w+NgXkhgm8rusCNXY4nyImHtbfpHHOaQa9M7E
	rf1HgHtaMCrHKbhzMAmDVRJV00JHxKWBZ165+yYoJvxfIcIV4zuWX+FrwMMY6a1DviI=
X-Gm-Gg: AYBFou0XqV22+q1P0M/EnOppaUesQrXebJ15s4iguTagObr4+JiduyIG9h+5uZxHRPa
	tGn87PdZsVVBEGh5CYqGXiI/Cu+MRfAS0ge55CQf2I79ZpQdCZRnyvovdHhN/0tznMPxl28XzYj
	rl7CV/K5lhpjZbG3phaTwIUul9PtE5j7hJ8+UwcaRfMKkk/lfV+ufTf8lUQFy5+6iH8R9Z/p8fp
	ymk9kOvmgDKsKX/nkrbpbboWwRyWqhcWNWB7xBDNsIvwfRkPp95phcC8vRtfRCl+nmZzjenPmXm
	tTgMUX307bM3Q/smIMl0EwTp5/UDCtK0ZDCTK86KIDMr+jAWDRzCCX0yCItHSr9cj99jMnNzXLX
	4RjX359tKc7/EINhObCGNuUi9b6q4M3hD2oQOK4/0dVxGGGlqHvtQ9cI5FPvV9i2fPROpTt/12j
	y+nm/zljVVP2cq0npLPWTfVGYlBONiOVE9EaLmrNrQFMLajPgoMHb4dwj3qpe1qpguaco3hGRlY
	/tzJ/D/jXraKjwgT8GI26hK1PQ+QfXYSUG/Ev4KJ1IHXdW4sVh2W4Lb3o6AO4wUtBcM4yR3r2ub
	z7sRl0VpTSDHaOGQZbQwvBVJ75fg8SwShUBjTw9VGjkQGrCLJZZG4h4=
X-Received: by 2002:a05:6820:1396:b0:715:21d1:b87 with SMTP id 006d021491bc7-71521d11e77mr2519618eaf.0.1793720667310;
        Tue, 03 Nov 2026 07:44:27 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a84854sm11673087eaf.2.2026.11.03.07.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:44:26 -0800 (PST)
Message-ID: <116d7e6546741c73235006a0d3515d313a12c275.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-vcodec: vdec_vp8_if: guard list_first_entry
 on empty fb node pool
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Li Ximo <lixicaicai@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Haoran
	 <haoranwangsec@gmail.com>
Date: Tue, 03 Nov 2026 10:44:24 -0500
In-Reply-To: <20261023075633.3662574-1-lixicaicai@gmail.com>
References: <20261023075633.3662574-1-lixicaicai@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uJ4gl++ULVroAHyp7KGb"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-uJ4gl++ULVroAHyp7KGb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 23 octobre 2026 =C3=A0 15:56 +0800, Li Ximo a =C3=A9crit=C2=A0:
> From: Wang Haoran <haoranwangsec@gmail.com>

Concistency comment, use "media: mediatek: vcodec:" subject prefix.

>=20
> list_first_entry() does not return NULL on an empty list; it returns a
> wild pointer computed by container_of() on the list head, and
> dereferencing it corrupts memory. vdec_vp8_if.c has three unguarded
> list_first_entry() calls on inst->available_fb_node_list: two in
> vp8_dec_finish() (one unconditional, one on the show_frame path) and
> one in add_fb_to_free_list(). The pool holds a fixed number of nodes
> (VP8_MAX_FRM_BUF_NODE_NUM =3D 10) prefilled by init_list(), nodes leave
> the pool on every successful decode (two per show_frame decode and via
> the vpu error / resolution-change paths), and they are returned to the
> pool only through the userspace-driven get_disp_fb()/get_free_fb()
> calls -- which themselves use list_first_entry_or_null(), i.e. the
> driver already treats the pool as exhaustible on the return path but
> not on the take paths. If the VPU firmware keeps reporting a stale or
> zero prev_y_dma, or if userspace decodes more frames than it
> reclaims, the pool is exhausted and the next list_first_entry()
> returns a wild pointer into struct vdec_vp8_inst, after which
> node->fb =3D ... and list_move_tail() perform an in-structure
> out-of-bounds write and list corruption. This was found by code
> audit; we do not have a reproducer on real hardware.
>=20
> Fix this by switching the three take sites to
> list_first_entry_or_null() and bailing out when the pool is empty,
> matching the existing style of get_disp_fb()/get_free_fb() in the same
> file. On exhaustion vp8_dec_finish() now logs an error and stops
> tracking the frame instead of corrupting memory, and
> add_fb_to_free_list() simply drops the buffer.

Can you reduce this in your next version. Please start with stating what yo=
u
fix, such as "Fix possible null derefence", drop the "possible" if you can
actually reproduce. And then explain if needed. This iteration is just too =
much
and to hard to parse (in comparison to the actual code change).

>=20
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
>  .../vcodec/decoder/vdec/vdec_vp8_if.c         | 22 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8=
_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> index fd15d462b..ba34c71f7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> @@ -308,15 +308,23 @@ static void vp8_dec_finish(struct vdec_vp8_inst *in=
st)
>  	}
> =20
>  	/* available_fb_node_list -> fb_use_list */
> -	node =3D list_first_entry(&inst->available_fb_node_list,
> -				struct vdec_fb_node, list);
> +	node =3D list_first_entry_or_null(&inst->available_fb_node_list,
> +					struct vdec_fb_node, list);
> +	if (!node) {
> +		mtk_vdec_err(inst->ctx, "no available fb node");
> +		return;
> +	}
>  	node->fb =3D inst->cur_fb;
>  	list_move_tail(&node->list, &inst->fb_use_list);
> =20
>  	/* available_fb_node_list -> fb_disp_list */
>  	if (inst->vsi->dec.show_frame) {
> -		node =3D list_first_entry(&inst->available_fb_node_list,
> -					struct vdec_fb_node, list);
> +		node =3D list_first_entry_or_null(&inst->available_fb_node_list,
> +						struct vdec_fb_node, list);
> +		if (!node) {
> +			mtk_vdec_err(inst->ctx, "no available fb node");
> +			return;
> +		}
>  		node->fb =3D inst->cur_fb;
>  		list_move_tail(&node->list, &inst->fb_disp_list);
>  	}
> @@ -352,8 +360,10 @@ static void add_fb_to_free_list(struct vdec_vp8_inst=
 *inst, void *fb)
>  	struct vdec_fb_node *node;
> =20
>  	if (fb) {
> -		node =3D list_first_entry(&inst->available_fb_node_list,
> -					struct vdec_fb_node, list);
> +		node =3D list_first_entry_or_null(&inst->available_fb_node_list,
> +						struct vdec_fb_node, list);
> +		if (!node)
> +			return;
>  		node->fb =3D fb;
>  		list_move_tail(&node->list, &inst->fb_free_list);
>  	}

--=-uJ4gl++ULVroAHyp7KGb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauoBWAAKCRDZQZRRKWBy
9K1XAP9+wProaPl5Sh+BN2YDmMIpmtLgJeDUNc+Rd5rSiobFQwD/eerhOiLxNmww
zCdHfDHNqNRcRBpUTRv0WffZh2CZIwg=
=n6je
-----END PGP SIGNATURE-----

--=-uJ4gl++ULVroAHyp7KGb--
