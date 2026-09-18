Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10D3DCDBB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745553; cv=pass; b=V7TsKpQJ21P2I/4cfNfY7faghFEnkKdd9bjwiPlNIELtlaERVrtYajthELFaDGpLAmMGYWq1gsGZ6BIPMFpO1cIcErcuHtvoXquTL7tqDxFr66GgAXah6PHZSx96Quk2I/pb6ghQNgyNIMXhrjafgeYbRRNY9hVVhQ5v4hNSO78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745553; c=relaxed/simple;
	bh=ymSNiHBv0rxNjhBEBzAQ3e5pEXSbhOPJPBVgbAV4qGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ctd/Yn1elLSf2gmoeC+Q4gaZo6E49g3LTwUszLTP1ZhfIeyOF5o2oP221kO2gFDXLV5nfme04M+kS2uNd96M1jPXp29J/k5l78BxdGlLKJTzKpUuOHsf3bW3li/jQwfwJquM2IHJ/4to+0M2S45kf82IWeCSc4YpmkKjsmAi67o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6O1VpwI; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6O1VpwI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c5so765454b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789745549; cv=none;
        d=google.com; s=arc-20260327;
        b=GLovwwgg/dy3h21iLqyzvY0S7mBuBsc+VVrP0u3Aix6Xiir9ercPTaGpA/5laEwwC+
         UoW02gMxGsYsqrDFx1dVgxV2rOGVJqaTU7aq2y6GZzmEUQyaZnwNx5zp435jmPNl6lgB
         99ymo5wInUOunIQwcDGqtfZSmiwONb1l9Yy0BZgkE5ddMoqBM0jpIHKhgQGujAIiddgN
         bQ+O+TRId4p97Y948Z/Js8OmfzTZ6UbLJGKr26Z2pbG7M22D/TqLK/S9lWsHYwn+6ZoK
         2SP7urGYQWa1KfRwlXSH0TRet2qpUQQi1rqMxsyOEYj7VGDNNx9laV87e5aksPVZUbJ1
         ItSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W1ylXOncdQ/xqG+G6xMvP7qzdxs98+NQiLMh31Gq++0=;
        fh=kgJohp+V5zH8sxMerEAAVA5RrjQC8V7COIYVL2ruPyU=;
        b=i5E/yEIqMObsN/4orqVkO7I8/4kmaYqAzjW+tHhgsHaZzSuHhDsWymiMVVtQ2D5HJY
         l89rgwpm/Tq4J/VMaxx3eVSu1eh222G4q87aHnj4QGSOfV2XxIzSUI91nDUupulAa5bx
         IHWUMIy6DbMJjDWkDF7/ULG29EHT57kmZfsve3GuWdxjXj1tTt2n/1duRyKOr68wdU/r
         aHU+O8qICXBs83DEEp4TmCcgTkqTeEfDUKQxlnYOZrFwNTt1cUJidzMVlGkkOpM/r/Rh
         2J9ArZxlGntUcUXVAcGysKZsed8PQrEzPvMfeqXWVKkOTbCPjePQMToB4168trYGy0J8
         jvqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789745549; x=1790350349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1ylXOncdQ/xqG+G6xMvP7qzdxs98+NQiLMh31Gq++0=;
        b=Y6O1VpwI3Meq1JdZzi31TXfQpcpanZ4wlV9iuXpd5sjIig7phQgfCU47aWyfR6vo5k
         fF5qI7YbZKJqfy+x8XAZFltiJon4GuQN8WBUzqUeSKaguTIN3WWM42KofwVy992IGB3D
         A/KwLB5orHlmqbo35PsAsbVq8pWeMtHNIK0XxYEMlpSTBYYH6K1HR6U62pwvfxU6uZZJ
         QX9pHkygNT6TFTQDXgl7UFGsE89L7ug/iJ1SDQBdIjMEx4okR95NWxfMUcFzo2x7Tnf3
         0vdbG2BYhFcpGWJ8wwNFfDRQ8xHV1NJxG+crmfcpyiZ5BtlOGzbEKTHAhPTV/xTWj6Tu
         LwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745549; x=1790350349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1ylXOncdQ/xqG+G6xMvP7qzdxs98+NQiLMh31Gq++0=;
        b=cXkqoUDiSt+XWjWPVHZeBFMAI+nUodJzWKKFVA7itwf2cXfJeWN17rNwVoY8iUdXHk
         R6GpzUOK595ml1CEwei1V8zfNqKLwMz1+jaoJCVRtMC8lbGQqCHsxbni2dJaPjSFj+Il
         uNxGuiiMTnjqaibjL/hBU1G/RDh/zlkvV8wfkNGty8R7+U45iRR4N2PPjup75pMcfmFI
         vgAR+ns4fSIqHV5MkyB4PAYgwKgCWd769eQeqrSTCRF08ylb12DsxU0U/I5Ac8tsKDZO
         bhzZj8yvlMOtQ0F7mlP6J7NWYMuoOMpwP0GDUKLhSelA6BQFM4p1wm3II+UFRt+pwBBj
         oYYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKcWBIyt6L1vWjcBj6+EmqA5Uijhv1Y7vWzW9XHQtb329+36Gf9fBK0H4xiQ8Tfwyk0rikf+YmPyvdD3s=@vger.kernel.org
X-Gm-Message-State: AFuF++kNlw7cuoLdqRbo5ARxb9ym2BD3DNtkDPkhCPWIGNm9rLiiW/tT
	/5fGeiBtxtgctG8B/Z9YtX/JCms+a5vqpvXOM7Z9g8DkomgnV6s3Si5MvkWS3miOfGlGHeVZSkl
	3Yoursk6PjiMI8NiVxDtykeX1XHTeMl0=
X-Gm-Gg: AYBFou1D2RlIfkLW57KdWsUg9ExYI8ezd5j+TlA86QWaLm3YfbT8HdwLR2Zc7ZIVkMT
	QnUyUgrCst8gsekUwaI9cKf55QZyTv98gM9Q2XcHc8Hcpb1mXoG1oyTQxrzaTJU2SWLkdf7YqfA
	jVL+pPq12PUyUKTAikmO+XtGQwlw+CwBjzMsnGud1sQIroxlgOVOaKi38yxGMHpGS++z0QXl864
	4arBF7fAhPg/mSziCAzjQY5fOA89BZTpTSiwdIM8YeyfMLwBXE/iY/pM7cfPO4Qctq8zqWwN8NW
	ezqTus1YxPaeXJOpElQ4RvyIIIswFJIWrTyXWMhQy0udRR2FRcAr64mmpyazYh/Eg0bg97J1IQG
	F/P4nwJ8RTf47gEB12RCUQRuHyEnf9JljmxABKT5JUc/6FGeYp4y1/jiD
X-Received: by 2002:a05:6a00:300c:b0:86f:394c:5c68 with SMTP id
 d2e1a72fcca58-874dc0f8b8amr5619824b3a.13.1789745549406; Fri, 18 Sep 2026
 08:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918033942.85061-1-ndaugoing@gmail.com> <20260918033942.85061-2-ndaugoing@gmail.com>
In-Reply-To: <20260918033942.85061-2-ndaugoing@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 18 Sep 2026 11:32:18 -0400
X-Gm-Features: AcwNN1WmYHIGdIjR33SQlazp2k78HvrE9WOuXYfeYWpG_Q_w2uIVAZW-9f1-pjs
Message-ID: <CADvbK_dQdro_x-=ma2=bRgosYf2cZfEaqrbpeg-8odoBHnzqVA@mail.gmail.com>
Subject: Re: [PATCH 1/1] sctp: check return value of sctp_get_af_specific in sctp_process_init
To: Yuchao Zhang <ndaugoing@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:39=E2=80=AFPM Yuchao Zhang <ndaugoing@gmail.com>=
 wrote:
>
> In sctp_process_init(), when matching the source address of a COOKIE
> ECHO against the embedded address parameters of the INIT chunk carried
> in the cookie, the address family handler is dereferenced without a
> NULL check:
>
>         af =3D sctp_get_af_specific(param_type2af(param.p->type));
>         if (!af->from_addr_param(&addr, param.addr,
>                                  chunk->sctp_hdr->source, 0))
>                 continue;
>
> On kernels built without IPv6 (CONFIG_IPV6=3Dn) sctp_af_v6_specific is
> never registered and sctp_get_af_specific(AF_INET6) returns NULL.  A
> remote peer can reach this path by completing a regular INIT/INIT ACK
> exchange over IPv4 with an SCTP_PARAM_IPV6_ADDRESS parameter embedded
> in its INIT (ignored at INIT time by the address family gate in
> sctp_process_param(), but the cookie embeds the whole INIT chunk), and
> then sending the COOKIE ECHO from a different source address, e.g. a
> second interface of a multihomed peer.  sctp_unpack_cookie() does not
> compare the packet source address against the peer address stored in
> the cookie, so src_match is 0 and the walk dereferences the NULL af.
>
> This crashes the kernel with a NULL pointer dereference in softirq
> context, remotely and without authentication.
>
> The other from_addr_param call sites of the same family already check
> af (__sctp_rcv_init_lookup() and the ASCONF path in
> sctp_process_param(), fixed by commit e40607cbe270 ("net: sctp: fix
> NULL pointer dereference in af->from_addr_param on malformed packet")),
> which missed this one.
>
> Fixes: 0c5dc070ff3d ("sctp: validate from_addr_param return")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
> ---
>  net/sctp/sm_make_chunk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> index 84a4c97d0f75..ff1c013e2575 100644
> --- a/net/sctp/sm_make_chunk.c
> +++ b/net/sctp/sm_make_chunk.c
> @@ -2381,6 +2381,8 @@ int sctp_process_init(struct sctp_association *asoc=
, struct sctp_chunk *chunk,
>                     (param.p->type =3D=3D SCTP_PARAM_IPV4_ADDRESS ||
>                      param.p->type =3D=3D SCTP_PARAM_IPV6_ADDRESS)) {
>                         af =3D sctp_get_af_specific(param_type2af(param.p=
->type));
> +                       if (!af)
> +                               continue;
>                         if (!af->from_addr_param(&addr, param.addr,
>                                                  chunk->sctp_hdr->source,=
 0))
>                                 continue;
> --
> 2.53.0
>

I think this is a dup of
https://lore.kernel.org/netdev/20260917030505.4176635-1-hdthky0@gmail.com/

Thanks.
