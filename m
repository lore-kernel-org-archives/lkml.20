Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887774;
	b=yKdzDO8NR0FXmMpDZAPBPMlCQ2zL1AjiLeGiVpxDEHaXJsQCpiUgIF7978sW2r3Z3N7h
	 GvpyO/YMW0IPdpQOAOfQrZ+XGgFGRaqz5IxiJ04P5hiORkPhyZydiM4EZ5zjsz1Y1nDpc
	 3neO6Lz/RIYEJ+Po6cl9h4vJH3jwtFXkBMcHD9H+/COgsCGeS2BqBbz+JQrnDzlrcFYnd
	 KRSBLL80nqE2udvmaTYiY4wp2RZKOP6ScnSIeuQJvZJmIMN1cH8i/2fsUF91aVkQXkTAr
	 Nx1NaXg9FYVob6x4hsy2lWaxSwzSfHZyFzdTLeYnl/lqeMe7pWOwazysB9X7oy4hpdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=jzTzN1xi3wWq3rkQo05baaXe4YaAa7XUzbwyEbAc0TE=;
	b=b+kZQTEoOVEWBpQ4rSWvJWAwqiwAI3XyKUWR8cmez9eX7TRxFtpgCpO57iQSZ85E+lTg
	 2i6SRItlMgVNNkkmMU6O2WvnlLfmKNT0Lbd8GNOIhNkduCDGYiQ6UTUwOpCY6Aq804v4/
	 qxFn+J1wMMMs/2kLBGtfLB3M4fJ6sFpi85FBPjYvlY0dKoao2EtZi2XQj46Ea1qS92FHl
	 QQ3zPYMJZhFqItPMWEXysKBEFPiOgmR5rPJ+RSJkv7FyW9Fh+nOyHgFXt5ADWFPUDQFtS
	 qgOuNM6JexpPLwMGpsNnaLulv2BkV+tSeonFDk5v7k0IGtbibNchN5b9WetFu5G/wuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cDOXOJ7;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68399606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68399606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cDOXOJ7
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bc4704cbso2308903d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887773; x=1794492573; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jzTzN1xi3wWq3rkQo05baaXe4YaAa7XUzbwyEbAc0TE=;
        b=0cDOXOJ7kU44pN3CSsJC7LBttdhxXbKwXqvZzda7pHXStgvvBzFoKR4rfQ6uRpzano
         LqGpNPg3W+CWu4WnyQkkbdSjRVXu+jvbvdx7LlzpaLxR3UBCncfBpxp7F1bVC1zR+7KP
         tOpqvK21hn3041JvnCXOIHZ1DQ5S6efh+xzD106W6QtWm527wUoE+KbI3Pdx4pboCUeH
         J7c0+EJi+hdBXYKg14ZCJ4Ab8oTgUC5Gw4DUJ4Tani6wz1FCcrxCBb2CybU5Tt8NB3w9
         r7i4x3Fi0TP87AzY+Xgmvr0Itmnv4T5QoEgJdD1/ShixhE8u4yftXQKAkHFGDsmbERx0
         3s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887773; x=1794492573;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzTzN1xi3wWq3rkQo05baaXe4YaAa7XUzbwyEbAc0TE=;
        b=Po/deIRlbY7gUeiR37tDOkGjywCwlWsK75R4m1ji1kwYYmxfXLxA6TPDVRSmf2m+BV
         3jd/AJqKDSuV960HrvNO+e5yAm+UXgz+OPnTJvnOZh7HDq3/4bUwlZMBIFisK8a8Z8iY
         lgB7BPbn9Ii6uE2pXyJUFn9VTWW42h86OLCbwNuF6LvH0VXzgWY95o34gt+ePnpyLxNk
         233M2M8b3qzGdVih51KIV0aV9HKo9lAclrfxns/h56D9/sUMFEJLagNKy2nAYZc8iju7
         RZQ6bpXdySi6ptT13s0ej5h39DeCDYW3iBlb4WrrBwvtaNL1Q+N6lBGe8eHKPcWh5BjR
         uymA==
X-Forwarded-Encrypted: i=1; AKwUvBxhjqQACiTumF0eiasvA9h/sJA6bhkxrdlHze1FxRX95MEYmJl14+h3GD6e/Ze+psThLm0ApH0s722rIpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vi96ys/JoaLjDbgBkGcVvefppxdgewusl0O9rZHrUxvtks/Ym
	ksOg9hUueQzR5YyADTYc86od+Ks6gQjwaOY118EvP5PIw1ZgPzh9UrUC
X-Gm-Gg: AYBFou2UcKUaU4BERGdvViVOWEhaCQ892KIBqhY8uSEh4brrO1wC2P3jbcGDvmF4Ka/
	2J2/ZLTPh70+LXRStZRwnuGtf6Xg9cuvmhJR8rxOpuNLRZ9eV+vM4V5Gq9H7wRVlC/6IKYQT+Z7
	bLLnQs/KCeE9jP3wa63KZSBEkfomjzdjVL31uqzfzHe3LpASarfPyKLeHR9DexvubaEMo9BBs0w
	U0yvyWia2RZDclkgLwYRHvUUZKkpsfabBTVZFnj3xWvRLCipLU0X9RWoyMetGdU/r09zvLSM9/g
	8XplY39/1oicq93NOdoyGas8W/tO8+fTaZEY92l5qq+SojvrjVt+uD3Qw6SWNJIsJy1V6w0AsMS
	pOXicIHDNi6/n/1AwXk7HCGwalpOHMy/gszIvK6tI9hjl5OquqTXxkJDH6zrUDjteHZ9VKQnBSw
	wuoZgL6FpUzmIJdC1+T7UEBKUVRyHzeNoVt7b+Vv2y5tvbxzXf/oR7rH1HGiOgFt/jYDgE8nzAN
	YHPoonrI3Z6CjwCARszeWyjmNHXSp3i+xYRjw9eD0nnCLohTIJULDA5vX4fs7gJRyjOE8lCct4Y
	uLo1t00WhTt3yvdMP07TrvSoV9iAMSEy3Q==
X-Received: by 2002:a05:690e:1444:b0:679:b98d:9b7f with SMTP id 956f58d0204a3-67ba4c82e34mr11758102d50.11.1793887773314;
        Thu, 05 Nov 2026 06:09:33 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309712e33sm40372397b3.4.2026.11.05.06.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:09:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 09:09:26 -0500
Message-Id: <DMNC538FF7AS.2JZQJXNEZG6P6@gmail.com>
Cc: "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de
 Bruijn" <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net v2 1/2] net: Make PSP skb extension survive packet
 scrubbing
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Wei Wang" <weiwan@google.com>, "David S . Miller"
 <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261030043145.2185700-1-weiwan@google.com>
 <20261030043145.2185700-2-weiwan@google.com>
In-Reply-To: <20261030043145.2185700-2-weiwan@google.com>

On Fri Oct 30, 2026 at 12:31 AM EDT, Wei Wang wrote:
> skb_scrub_packet() drops all skb extensions unconditionally via
> skb_ext_reset(). It runs on tunnel encap/decap (ip_tunnel_rcv, vxlan_rcv,
> etc.) and virtual device forwarding/redirection (dev_forward_skb,
> netkit_xmit, skb_do_redirect).
>
> When a virtual device such as netkit is associated with a PSP device in
> another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
> decapsulated by psp_dev_rcv() lose their SKB_EXT_PSP extension when
> scrubbed during redirection into the peer netns. Without SKB_EXT_PSP,
> __psp_sk_rx_policy_check() rejects incoming TCP data segments at the
> socket layer with SKB_DROP_REASON_PSP_INPUT.
>
> Introduce a static skb_ext_scrub() helper in net/core/skbuff.c to
> preserve SKB_EXT_PSP across skb_scrub_packet() while dropping all other
> extensions. If SKB_EXT_PSP is not active, skb_ext_scrub() simply calls
> skb_ext_reset(). If SKB_EXT_PSP is the only extension in the skb_ext
> buffer, nothing needs to be scrubbed. Otherwise, save the PSP metadata,
> reset the extension block, and re-add a fresh SKB_EXT_PSP extension (or
> clear skb->decrypted if the allocation fails).
>
> Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disa=
ssoc")
> Link: https://lore.kernel.org/r/20260910-bpf-meta-inside-skb-ext-v2-3-0b2=
1e42180b0@cloudflare.com
> Reported-by: Daniel Zahka <daniel.zahka@gmail.com>
> Closes: https://lore.kernel.org/netdev/DLODSKPY6ON6.1G6SP3CFFLCPJ@gmail.c=
om/
> Co-developed-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Wei Wang <weiwan@google.com>
> ---
>  net/core/skbuff.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 93c2f440b9ec..5c4a2e982ebc 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -6369,6 +6369,32 @@ bool skb_try_coalesce(struct sk_buff *to, struct s=
k_buff *from,
>  }
>  EXPORT_SYMBOL(skb_try_coalesce);
> =20
> +static void skb_ext_scrub(struct sk_buff *skb)
> +{
> +#if IS_ENABLED(CONFIG_INET_PSP)
> +	struct psp_skb_ext *pse =3D skb_ext_find(skb, SKB_EXT_PSP);
> +
> +	if (pse) {
> +		struct skb_ext *ext =3D skb->extensions;
> +		struct psp_skb_ext tmp =3D *pse;

I would move the copy just before skb_ext_reset(skb), but it probably
won't make a difference in the generated code.

> +
> +		/* Nothing else to scrub if PSP is the only extension in ext. */
> +		if (ext->chunks =3D=3D SKB_EXT_CHUNKSIZEOF(*ext) +
> +				   skb_ext_type_len[SKB_EXT_PSP])
> +			return;
> +
> +		skb_ext_reset(skb);
> +		pse =3D skb_ext_add(skb, SKB_EXT_PSP);
> +		if (pse)
> +			memcpy(pse, &tmp, sizeof(*pse));
> +		else
> +			skb->decrypted =3D 0;

Agree with sashiko not to clear decrypted. It would at least prevent the
skb from being forwarded cleartext back onto the network.

> +		return;
> +	}
> +#endif
> +	skb_ext_reset(skb);
> +}
> +
>  /**
>   * skb_scrub_packet - scrub an skb
>   *
> @@ -6380,7 +6406,8 @@ EXPORT_SYMBOL(skb_try_coalesce);
>   * operations.
>   * skb_scrub_packet can also be used to clean a skb before injecting it =
in
>   * another namespace (@xnet =3D=3D true). We have to clear all informati=
on in the
> - * skb that could impact namespace isolation.
> + * skb that could impact namespace isolation. Note that PSP skb extensio=
n is
> + * preserved across packet scrubbing by design.
>   */
>  void skb_scrub_packet(struct sk_buff *skb, bool xnet)
>  {
> @@ -6388,7 +6415,7 @@ void skb_scrub_packet(struct sk_buff *skb, bool xne=
t)
>  	skb->skb_iif =3D 0;
>  	skb->ignore_df =3D 0;
>  	skb_dst_drop(skb);
> -	skb_ext_reset(skb);
> +	skb_ext_scrub(skb);
>  	nf_reset_ct(skb);
>  	nf_reset_trace(skb);
> =20

The only thing I would say is that skb_ext_scrub() won't scale if a
second extension comes along and wants the same treatment as PSP. In
that case, either we could make a bitmap of "no scrub" extensions and
then use the same approach of allocating a new ext block and copying
them over, or the original approach of skb_ext_del() could be used after
changing the reference counting scheme for the special extensions in the
release path of __skb_ext_put(), but that is a more intrusive change.

I'm ok with the approach from a PSP perspective:

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
