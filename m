Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680826;
	b=BbidaNj7WJrziK+Nn5Y6BSR7GEcHLJB7EsxxVnwlW2x1saZKUDCi4eul/xfAb1jKo5zE
	 JW1ggCWos48z/eU6pmrOT4lWykHkBeBXhaRsIuajhLQ/jpT/NBcEXM1ngDhxtu1PVpfuF
	 MdbYy4ml2/YMijWUxaMV7Qvi2PVquO7bSgZOie48rzASnJqzQeXYx5jaA6n20pgqYlxkp
	 QdBoNZjN0oLNMMpDeKS3pSTYb3cWCNzmttNofew7GOqqitehwEJwsF/22dmo42d3nD5Tb
	 lz+Oy4sMppH22o+Ur1fU5gfDE46VTBp3CLjaHc53sbNpCcfSbYXVvpOF7WKHZeHwYqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y4zzv3EaOx69qMDO5E16Sp31hDskZy6eI4m6bgalJJ4=;
	b=PdgZ3csBMx8p1IKpPnXK5RfoCrI/+VWQSCH75AOgz+2cUfAlkSKPx+oWpEpWa+t26fuM
	 FC7diJ7FxFnGiBDSPQX/Iwxxaboo3ZRJVJXR2b1SlRKHoWYG2quUPCKidMqjlrZmUd4cs
	 K0+BojEVVU6IObG4ZSAv4aqwN3Ea34mA6A1J0x1VCewZWkN5+khO4f1Xyw3FDWmm4wDqi
	 9TpvsZbUVFJ+CzX3oRQ9nR/WVJLdM+x62SuWAJ2aLI0sv+J+v9FaJIiZAzVDq6NbISABZ
	 zlFH3jxOf/3d3FBz80Rh6b3l5SXzzSn4cvrHo6RdIClXOGlxPDTP0IVmt+0xY6MUHng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TrpiUiVx;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D2606A88F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6D2606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TrpiUiVx
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4697404c2bso316002466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680825; x=1795285625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4zzv3EaOx69qMDO5E16Sp31hDskZy6eI4m6bgalJJ4=;
        b=TrpiUiVxN727qqbJfLLvzsS7egQqIC9E7Az5hYKGdx4auQawMDNHRMd6DmEiHXaXV0
         O3kV/T4Qc9I3WLuDSIib9shXXLLf0twJIkeBkKMDLbfkas8hT2EDm1v9S75p98Nyfd4m
         ME1Or2ICgWCLTCWtVIkjGk73WrQiKv3Q4g34gUkMTTHgJ3GKhEsNZa0eI4dZzJc/f7h0
         C/05SZb4nZMckpNLog3ERB1UpAOagidl95W77PiwsMZ7g5grY1TJSt7ZUOlYVoJL4g96
         z+WjutymPnGXfP2T0qPZOE8XXaFF0Tv3sn1x11OyoWvz5pCzgpMiJ2dTFHGDnhVVLq6x
         UCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680825; x=1795285625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4zzv3EaOx69qMDO5E16Sp31hDskZy6eI4m6bgalJJ4=;
        b=UKD3XVAvHJ+ieWmvTZ9b4aTkUvMq6drPv+CTHD3xLLxDSFC4revtGlSDg5Kp2sSksA
         O0uVuKoKS9qjxEgbOw9H1uRjLIXhOmMsaTvzQyTnkJYwjDGqiUeM/csODj8n4Mrjvnif
         gfrCc21QD79wYMwGqUTnbTqfo2UU2BTiig1UXmQZDvKx6tJdz7vAOn46CgxAuMxBVOLe
         JA/pA4alFSFPKZj2ekUWoVp484tM3YQhpoI9NuqMWcZGmwv8KGPnE621JFa36/vCdyM5
         QQZqFFMjBHPMH7TbEE8lpyDnFfk54RA3uqVYua070SbEBeqYnoZ+HqgsWKT8Cbi7tt0E
         T3eQ==
X-Forwarded-Encrypted: i=1; AL+hErGQlb5zllvjIU9XaATTTj6UpQMVkS1fXjGR7Rt4mUPw+5BhHkaw7xWbNUdmjnAKrcioANoxC77qSTmkNoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bD8wZhQ6TBz/P8yff3D/6tscFSPenVvgZ2rPnMztbZUMWywTW
	fJJwoZXHEjXssQoK5QRKjLjtF8nMgqSn782V1WvMRw5H+rvQOB1NhXv3t4XiwnrBlQ==
X-Gm-Gg: AYBFou39tQKB7Uls5jbqiNM27HNRzQjnXStF6NjESibahjW7UgJfmanq4e30trAcZ7g
	dn2ystpR0uSo7SmPZPufuFMTqVjK1YxbXEBTL3DD6gDg6uxwEAJnIWD2Rdvxmjr53T65CVaVOc6
	KKRgjfYEvQSRj79AavhaK5CT7UnzeVFiZr/Awn9TtmduPEt5ZgQXX//pj838JrwwpYzz+wg6mpv
	asn/XVNBGJrECUVv9ajGtZzeuyvYKBLiAL2UuAFYHhIGO1PgFV/0HOcwMo+pLj4+fV/D+zvvMsh
	5/u1HBzXjiDWN/zNiinurWaSXTLWL87drxDx89S30IYQMwkCfivSewGK0k0rsbkmjnN8SrFF1h3
	mtBXiyUy4j1pzbTZnCHQyi+IrJIhPVoOc0QgDgy3KZ+/clmyAjtPFCzGF4rn3jiV1II3hAmKJr2
	RaIt5ZejFS7Ws5ZQCPRoJyFyKKxCx6cW6ow8yP8cbZwsXWnPgMCVa5AtwNGrQShAy1hy0pOj2qi
	OGIfDGvKODigkSvcF2iMbMYSHbXioSeHdplckbssA7HfyMaFr/OHLIoBcFck+t0ZqNtonkNKFKR
	gxxUtfjf4z/PwzZaebk4HoLDP1GCuKg3eDPEgCL7Jbnrw4GHPdPeLkJWSRoT3B/doTF980yXYik
	740OdxfObhxVVk9hvW8SrIOxlK5JJEMo/b5r9POQZj/0UeDNw9I5kJPKvfi/ETxuo/MwD4PqTXM
	/dqFS3g4z9nMjIwfDLrFguleKDCArqc8eb04P/chK/saWlX1qob9iog6BxA2YyvZo82Cnag0eHO
	v4NAEPUBc8KM75X9eEAGYpFLE4+gz0iZrNuG+JjsCuEHZjFxTUETkb0RWe0XnYXM6YdtpI2xD1i
	KXA=
X-Received: by 2002:a17:907:2d20:b0:c49:bf6a:28fa with SMTP id a640c23a62f3a-c509642f8dfmr464927866b.28.1794680824836;
        Sat, 14 Nov 2026 10:27:04 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:04 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 2/4] net: gso: count the inner UDP header of encapsulated UDP GSO packets
Date: Sat, 14 Nov 2026 19:26:58 +0100
Message-ID: <e2348827189e5c00ec1bab50aa5e8fe5b8bc3b2a.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
References: <cover.1794151759.git.julius@bairaktaris.de>
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

skb_gso_transport_seglen() adds the inner TCP header length for an
encapsulated GSO packet, but not the inner UDP header for
SKB_GSO_UDP_L4, whose gso_size covers the payload only. Every segment
of a UDP GSO packet in a UDP tunnel, built by UDP GRO behind a tunnel
socket or sent with UDP_SEGMENT over VXLAN, is counted 8 bytes short.
ip_forward() and ip_finish_output_gso() then let DF segments that
exceed the MTU by up to 8 bytes leave unfragmented.

Add the inner UDP header as the unencapsulated branch does.

Fixes: ee80d1ebe5ba ("udp: add udp gso")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/gso.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/gso.c b/net/core/gso.c
index b5bd269e56e4e..eb95c9d2819b1 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -156,6 +156,8 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
 
 		if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)))
 			thlen += inner_tcp_hdrlen(skb);
+		else if (shinfo->gso_type & SKB_GSO_UDP_L4)
+			thlen += sizeof(struct udphdr);
 	} else if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
 		thlen = tcp_hdrlen(skb);
 	} else if (unlikely(skb_is_gso_sctp(skb))) {
-- 
2.53.0

