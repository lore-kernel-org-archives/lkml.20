Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648517;
	b=ez9bdw66yhwvR6Q8EXAfk0lHUjPeKj1SMzdtz9Ek+VpguqcV85hnXLtPyn+Fw6nSTkZ/
	 gD6MN2na3I69LhXs1TK5OQ95SQosxXoQu9wIavGLjootXUwOBjKZWV2FPIIrt2tMOb+HD
	 ZQWopDFsCMTas/c+Hp5Igiyy2j38v6mZP/O9mjLS5QK/r5LZ3lI+w7OyyWokH7LIF6TI7
	 /eV+s0HhmtAotmJsKZdU7IesJVS9bxHMERhlvEsnjk1aQZQFKIkgCE6OuQupoAqak633r
	 YiCtvGB5pYvgHUu7E2ykmnEXRnK8/6dt7+UDc/bgrCB97mqIQ0G/11Y8dJ/1mfowYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648517;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=AJyd14pHI1BrRBcFnTM35qAErkg4x2UsTQx4b3jf9+s=;
	b=2vgsnEK6/nT9TxFVmj/KzwX7gGYCJMIfA6eXh9jbbuBTPSlzf6BNCh8KnrJUKvYjkdTd
	 IYhPlhuxe00r3PefWGNgCzkq9fa6aECo6YQYYQJ2vbfgZPNYf2VZyPzxThcmQZ9VLcdsb
	 HxE7fA51H8eZaKpiyyKTrudJ4+ZLIIvceNVTYbcvJK5mZoGe6ulziANOCuthY4xc7fw9L
	 +Ku4w3dqUZGnrBlKMl6j2niqxmOZSJYV124oh6mXkuz6+czbSTdKTsvm/ym52vF9QnU26
	 7KqAgTkcD4FtN55JyEa+KLvae1q8qAkTrS0GCPgRviHZOHcNfmwew7FMIIVAqK6Ow7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=sSF3OFNk;
	arc=none smtp.remote-ip=195.10.208.40
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA6606A8BC;
	Sat, 14 Nov 2026 09:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AA6606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=sSF3OFNk
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4jRTMN3cwLzFqBS;
	Sat, 14 Nov 2026 10:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794648512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJyd14pHI1BrRBcFnTM35qAErkg4x2UsTQx4b3jf9+s=;
	b=sSF3OFNkagxz7H1ydfmRFrqiWaaXcOi0hy0+s+rz9IIOlOfYXTuj5z4F8CIS9tkcIJ7fQq
	uplZFfEqrhlazzgT/E5cYLaj98Vt1CddVJYvcMrJxMIAwaKE+veonPzV5Tuq8oF2p0qnm0
	QD0Hqbu4mUWzSszC28/yDOufH/AzPlQ1GqnzoES7KN/GJi5xMw3tqNK7XTrhHvXw8VYhVL
	w/+3kNQAGkSvo2X3KCXxHzmTvZyQHX0TKvLWbSH9caZPcq4nzMCQ0MtEJ0iBsa7Vrm8M7k
	ENu54aKMlEJMZLVXuig+oGPAyXvEAGVwWCDnGHM0wNFUzsuX/P+VCexbvHZnvA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Xavier HSINYUAN <XavierHsinyuan@outlook.com>
Cc: antonio@mandelbit.com,
	davem@davemloft.net,
	dxld@darkboxed.org,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [RFC net-next v2 11/18] net: ipxlat: add IPv4/IPv6 header and transport translation
Date: Sat, 14 Nov 2026 10:28:23 +0100
Message-ID: <20261114092824.89857-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <TYCPR01MB1100852BD6000EFAFDF14A418CA762@TYCPR01MB11008.jpnprd01.prod.outlook.com>
References: <TYCPR01MB1100852BD6000EFAFDF14A418CA762@TYCPR01MB11008.jpnprd01.prod.outlook.com>
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
X-Rspamd-Queue-Id: 4jRTMN3cwLzFqBS

On Fri, 06 Nov 2026 21:37:52 +0800, Xavier HSINYUAN <XavierHsinyuan@outlook.com> wrote:
> Hi Ralf,
>
> > +static int ipxlat_46_translate_tcp_csum(struct sk_buff *skb,
> > +					const struct iphdr *in4)
> > +{
> > +	const struct ipxlat_cb *cb = ipxlat_skb_cb(skb);
> > +	const struct ipv6hdr *out6 = ipv6_hdr(skb);
> > +	struct tcphdr *tcp = tcp_hdr(skb);
> > +
> > +	/* CHECKSUM_PARTIAL contains a pseudo-header seed rather than a final
> > +	 * checksum. Replace it with the translated IPv6 pseudo-header and
> > +	 * leave completion to the later output path.
> > +	 */
> > +	if (skb->ip_summed == CHECKSUM_PARTIAL) {
> > +		tcp->check = ~tcp_v6_check(ipxlat_skb_l4_seg_len(skb, cb),
> > +					   &out6->saddr, &out6->daddr, 0);
> > +		return ipxlat_set_partial_csum(skb,
> > +					       offsetof(struct tcphdr, check));
> > +	}
> > +
> > +	tcp->check = ipxlat_46_update_l4_csum(tcp->check, in4, out6);
> > +	skb->ip_summed = CHECKSUM_NONE;
> > +	return 0;
> > +}
> > +
> > +static int ipxlat_46_translate_udp_csum(struct sk_buff *skb,
> > +					const struct iphdr *in4)
> > +{
> > +	const struct ipxlat_cb *cb = ipxlat_skb_cb(skb);
> > +	const struct ipv6hdr *out6 = ipv6_hdr(skb);
> > +	struct udphdr *udp = udp_hdr(skb);
> > +
> > +	if (skb->ip_summed == CHECKSUM_PARTIAL) {
> > +		udp->check = ~udp_v6_check(ipxlat_skb_l4_seg_len(skb, cb),
> > +					   &out6->saddr, &out6->daddr, 0);
> > +		return ipxlat_set_partial_csum(skb,
> > +					       offsetof(struct udphdr, check));
> > +	}
> > +
> > +	udp->check = ipxlat_46_update_l4_csum(udp->check, in4, out6);
> > +	if (unlikely(!udp->check))
> > +		udp->check = CSUM_MANGLED_0;
> > +	skb->ip_summed = CHECKSUM_NONE;
> > +	return 0;
> > +}
>
> Pseudo-header seed in CHECKSUM_PARTIAL uses per-segment length instead
> of the aggregate length, resulting in bad checksums for almost every
> segments.
>

You're right, just reproduced this locally. I confused the eventual
segment length with the length represented by the CHECKSUM_PARTIAL seed
on a GSO skb (the 6->4 path has the same bug). The current tests didn't
catch the bug because veth passes CHECKSUM_PARTIAL packets through, so
nothing ever computes or verifies the checksum.

> How about updating {tcp,udp}->check with a pseudo-header diff like
> inet_proto_csum_replace_by_diff() to preserve the existing seed?
>

Yes, the next revision will preserve the existing seed in both
directions by applying only the address delta, as the non-PARTIAL path
already does.

Thanks for catching this!

-- 
Ralf Lici
Mandelbit Srl
