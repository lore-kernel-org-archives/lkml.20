Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109537;
	b=5sFKXVw1Su3Ym+VTmvLpZ8B8h3q+YFjstlrJSPsIw8cfe+M08OWYtK8oNkdCZsgWfJF1
	 SmynnfwblSQ7wuVLi1p3Ed/GcqI/KNzfWp54joQTk+IbVc+Db7pYoU20ntQ3Km3XDRNx8
	 Q+zJO09I9HC1CoiE7NYXzzJa8DQwKDgKAFFBgnpukPfHRQnsNj6kXRLxpVroKtOq7C12Z
	 V5kSKUSUWicRILZMQz79giCGnybt8Tl9OX58wrgcDfqUGUatN+4b1vp4NtJbPifiPQLz3
	 V1TRrFKvGNAk1sDuvf9vTVdmhawJ+BR5ZP66gQ6y047MYB8vsu6amoP4dEgFuOmUGaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109537;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=w/asevmWz3EGzQUELUfjPY42F+0RqEQ7+Wm/whP+n14=;
	b=xuzrtQmncjaztaLujw9QbXYwV7qSG5dUmJIvWiXdmo8hJ7uBTfPA+LJdej6xjoz/68bq
	 N+s2AaOXlHfGJCGUqT7Xk/hPV7yci7R0GfJCxp8cQzAK6Pw4r+KbLkWfJDVT3iL1DoEK9
	 qSzr+yMWhI7W1qPID+LmxIlDD2GT7w4iLNYlj/oyDMhja/lJTzRMFR1FjJOE4+/ZasgRf
	 m6PkfyJvUjhhRHYAjBGEuVpoEjoqi8kl10xPduZTWh9JQM+/r0erxI9s2PzLXoKVLr7+2
	 XD75GeS4BYCbPaNWxDkRg3yFVUwO8hK0H+8ogYloLgHORb8c9OmE3DgKnQoDLzRaU8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hr9dn7Ia;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A57606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hr9dn7Ia
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793109535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w/asevmWz3EGzQUELUfjPY42F+0RqEQ7+Wm/whP+n14=;
	b=Hr9dn7IaLp1TwOh16RO75w0P+V0eav55BVtrHtqOfRXiksLX22O51pdRqeASAhAy3V/Gi9
	QBpXWmO+Fmrd47brvJadSziWjUvuS91s6wSYX4Qa54h8ocTM0pO32mpVaHaFm9LH799y+T
	U8FCPssFsauKomXO+asmCwTWgmKvRQM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-PFnqHEF7PWGdMxt6ARAxlA-1; Tue,
 27 Oct 2026 09:58:52 -0400
X-MC-Unique: PFnqHEF7PWGdMxt6ARAxlA-1
X-Mimecast-MFC-AGG-ID: PFnqHEF7PWGdMxt6ARAxlA_1793109531
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E29FD1955EB5;
	Tue, 27 Oct 2026 13:58:50 +0000 (UTC)
Received: from pabeni-thinkpadp1gen8.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABC981800495;
	Tue, 27 Oct 2026 13:58:47 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: theodorlarionov@gmail.com
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	nicoyip.dev@gmail.com,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] fou: reserve headroom before pushing the encap header
Date: Tue, 27 Oct 2026 14:58:33 +0100
Message-ID: <20261027135833.87953-1-pabeni@redhat.com>
In-Reply-To: <20261021065517.198322-1-theodorlarionov@gmail.com>
References: <20261021065517.198322-1-theodorlarionov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
> diff --git a/net/ipv4/fou_core.c b/net/ipv4/fou_core.c
> --- a/net/ipv4/fou_core.c
> +++ b/net/ipv4/fou_core.c
> @@ -1071,16 +1074,20 @@ static int fou_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
>  static int gue_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
>  			    u8 *protocol, struct flowi4 *fl4)
>  {
> -	int type = e->flags & TUNNEL_ENCAP_FLAG_CSUM ? SKB_GSO_UDP_TUNNEL_CSUM :
> -						       SKB_GSO_UDP_TUNNEL;
> +	struct ip_tunnel_encap encap = READ_ONCE(*e);
> +	int type = encap.flags & TUNNEL_ENCAP_FLAG_CSUM ?
> +		   SKB_GSO_UDP_TUNNEL_CSUM : SKB_GSO_UDP_TUNNEL;
>  	__be16 sport;
>  	int err;
>  
> -	err = __gue_build_header(skb, e, protocol, &sport, type);
> +	if (skb_cow_head(skb, gue_encap_hlen(&encap)))
> +		return -ENOMEM;
> +
> +	err = __gue_build_header(skb, &encap, protocol, &sport, type);
>  	if (err)
>  		return err;
>  
> -	fou_build_udp(skb, e, fl4, protocol, sport);
> +	fou_build_udp(skb, &encap, fl4, protocol, sport);
>  
>  	return 0;
>  }

[Severity: High]
[Finding: sashiko-gemini-db46d5c5]
[Sources: sashiko-gemini]
struct ip_tunnel_encap is four 16-bit fields. It is 8 bytes in size
but only 2-byte aligned. Inside struct ip_tunnel the encap member
follows parms and three ints (mlink, encap_hlen, hlen). That places
&tunnel->encap on a 4-byte boundary, not an 8-byte one, on 64-bit.

READ_ONCE(*e) on an 8-byte object passes
compiletime_assert_rwonce_type() and is done as a single 64-bit
access. On arm64 with CONFIG_LTO, the 8-byte case of __READ_ONCE()
emits ldar/ldapr, which requires natural alignment. Every GUE
transmit that reaches gue_build_header() with &tunnel->encap, from
ip_tunnel_xmit() or ipip6_tunnel_xmit(), can then take an alignment
fault on the hot path. CONFIG_UBSAN_ALIGNMENT will also flag the
misaligned 64-bit access elsewhere.

The whole-struct READ_ONCE() also does not give the atomicity it
suggests. ip_tunnel_encap_setup() fills tunnel->encap with separate
stores, so the copy can still be torn between fields.

What must stay consistent here is flags, between gue_encap_hlen() and
__gue_build_header(). Could the local copy be built field by field,
with READ_ONCE() on flags, sport and dport, instead of one READ_ONCE()
of the whole struct? Or is there a reason you need a single 8-byte
load?
-- 
This is an AI-generated review.

