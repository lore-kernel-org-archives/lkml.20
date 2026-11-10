Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276634;
	b=S619MgeIl+MuKBPMGg4Tb1j+ih6ezmarsbjmZQE0UXO2MpdBy9EqH0IWW7xnt/bdC/q/
	 cIr8Q5w+K489O6bQ0eHKVoC85i1rvEopkZ1Dv8QiykvQV6iyeAIBwE+u1Cq0g7jId9Cp2
	 aDM5WzFmcuyEtbQjD8ad5z+NsIWa5QINJjAo62nd4PI0jobUxpM6oYUMlF/bliUkcN69W
	 bi3TXEoFb1mT/BsuNh8z1PfFF7tlZ6j1ONkkFPF43SMK9xh615Z0X+4d0T+l+TuUjL5eY
	 9yE44yXCQe+F+u74CX7EUzZAYU8DSQqXJfiZZ3caE/MUHtVhoxVA8GqVSyxDn+/5VQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GU9EjYSQxV4eVGM8pi1wTcBqlYubWYJf24gfH5mqmRo=;
	b=r2jDz1ahzcZT8r448Aay13gp3+1c5rnYA37rCk7JZ+s06R+75nl2WFNnmu2CCc4OYJvs
	 F1NpiVILs9nPhhCWFu9/2K59grB5oZmy/BEohHetz9EnUoF5pScLB8yN12u6+U3iOyKjB
	 CPn4Xtx7nlpG8MvLjVVhZ7av9pyl8EEyP4Rh3en8NHakNsb5IZVxCPshpPO4oPc36lkck
	 wF+vBusNtayMvl+9x4fmabq3yCP/qJAZYNLSA+Wc/DSkSFOlrLVC8U+GDFdwefa82U4fZ
	 9oGpylvR63dLzja83Ksbc8qg9/Hfj4e9RmrwfVgY9wXu5LtKjYUcQkpEftyZtIORScg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jx6UBesi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jx6UBesi
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so923985b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276633; cv=none;
        d=google.com; s=arc-20260327;
        b=oIccbe9ZKV51zAWfkUwXRyuBLeRI4p0oz1znqz/UHkZIWKHEk+tcQkhwPmq+ufU4/y
         FBKhTi8krj0GIzrfLBaCTSQ1y7Wvgs8r8NbTba107kHVIYuQ3C6cZZCWEgeDWtIfiuKD
         Qg9ieXYsRQhRC/+c/5Ia5x1lCy22kGnPxayipJPtZHh5SvDj2rM2m9jeHaDag091l8cM
         KDplzD5ahcvKWzZH2nH7iQFzCv97Ly31fyphWhP82RoVeCHciUQB3gm5GVOCyIQNNHQ5
         86ye05X0jyW4xYhM/sjq3kFr9ZOydunc1bMgI6qOuHl379cRtfjo4obVxk+0GyMYehqs
         t3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GU9EjYSQxV4eVGM8pi1wTcBqlYubWYJf24gfH5mqmRo=;
        fh=1FimBAVP1dct0evzID9hBMjfuFrUH6kmpSu+WJ6kG4U=;
        b=NC53QPZEnGaRpcYCBEtcowmUkO7/wZVtHrC8xZsEQXsQOlR/lrokLW/6gOcZQF1lo2
         MAZXcK6aAcllkH5mIXKtqTjavnDAmFgyahVx9k6Ml1HeFAVONJZpfceUqawMP5HuhwuZ
         6GGfI6IMh2J/VqdReDB9IkmX0zbqwnuacr1eqkxekMJabl8+CP9GbK8vWA0vFpThXCaL
         OQBw5J8jksjD1G/LX0yTmKzqTWuDe0iJmpu1R7hDoxEXlbEt/4pgP3XY/3ZmE7QtfnPf
         Z1Hcgj0RaebkYCIMhwvjQwSc+y7GGUougmlBlhdJUJzeWWeq9JdFa7XWeeLxhzDWLVzM
         8t2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276633; x=1794881433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GU9EjYSQxV4eVGM8pi1wTcBqlYubWYJf24gfH5mqmRo=;
        b=Jx6UBesibvKmFXUbiN1heQ0gwpowE3/vZ86/WkwBWZjvZ5aRIqEPr5NCXsRZN9FkGq
         /zKHRJaBYarzlNszLkbDm7gBobre8/jK2rb9IaAb3Ip5Gusn+UHQFfXM7x8Mlia+QsZi
         AftAcFbmRg7+SOxFGhXLSxbcBgwWQ+Z8tQsg3n1UjTo90zNKNkWLQAhTUA2mnu4CFDNh
         a9z79bhvI7wmB3JBpmnURO9MvhIrCQ1jT6eiPCfDF1RlL+O2VSVeYn9iizYF2ynDoPYs
         qR1R5FnAorCK2qjBBEuK7/gIaK8DOZJFOWVdHQGSlTYqOFPyALOtlxhNA9ZtnIEPbaDS
         aoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276633; x=1794881433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GU9EjYSQxV4eVGM8pi1wTcBqlYubWYJf24gfH5mqmRo=;
        b=dhQ6MEycUFzGe2hSd2t17juSZHAmAe1eN97qLJiga7s9GWh/ec7aA5cnGLsI66hNgo
         jzwHoZYfQ3OOEBuETAq8jec8nCPnbDuKNp0YoODnRFJP+B422fCEf+GZWsAZWuhY5ifg
         HjoJLp3W4vBiMolS2FHYa18T62M0DX6ZQSj/plkQ0jfYHjNQKWsNPydLPUHoa/hgaWq4
         mOpt0ZJrOGKz5WBMLOrKWUBlNgUQlGdhA3zOaOTXx0XqnUw+6OHGRPR764izy6AgtNzn
         R8FeSgBLEbvAQAB560fgmBXCHxlVq5SlHkosSWYwEOE3Rs6MQAnBlVUfW/fmtiO6ohA9
         qNhg==
X-Forwarded-Encrypted: i=1; AL+hErGvrp8iaCu0snqYboa2r19/cCFfxBW52l9+lmb+DViqUVIbXWuAR0cFvuz2ZFLXuNkMRv/qUGwIj+4bcN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lJQzJTj5BgLq81sEzeAPBg/e61Ym8QFZQiUa/aO055T04n4DE
	NJhNbAa5uLywj+9YHnmfuCwE6iJf6fnn+nXmZtORIv2rbuqAGQXIs/8l7EDjoPSLUzx9eQY/X+v
	lxuPie56LhpqfcveR7r7s/Zfc+4N+S90=
X-Gm-Gg: AYBFou1S0uy5X4MVWUZNRDyQyd4Pu+A714kXbZv2Jw0I30AGGv3AmND3mwEsiS7xkCt
	9/wWghi68e0D/nmNDCQbDHVWUdbWFKmQYq0X76i5cBHU1A1rfhalRYJ4sUsk2g5kxe+5ajSE7SU
	PM4jUyu0MgOaNTYq5Lz4mLoQ8KDkLI9ixBofB6cqVZ+FDMOaTapFSbLTQllV7EbB8AD1icRrsJK
	EWktYEgDM+21yE8bZt0iQwp9QjarjJgxAJsPCWEeK+SmxPbZF4q4eV5wfeS4uPWW/DxPoEe2+jI
	01SDg3gcseR+mWACdtiE4iMZBg2x/dIhKiNS6yKTLktq5r4iC4ZKqKco5sTBPBbv2GQCCxccHY7
	LRjH74KGyNtjkq+655CcPZQLswof333rudEyY5QK1kcXmpPuIVxKKgGes1M5HysngcOCvNmL5ly
	mUPS2sHEO/ZDM8CGy7Q/gpyoy2mcBedvtgGA==
X-Received: by 2002:a05:6a00:391a:b0:8b4:b88a:c2d4 with SMTP id
 d2e1a72fcca58-8ba881e8931mr1491983b3a.59.1794276632703; Mon, 09 Nov 2026
 18:10:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106195126.1563231-1-andrey.misyrov@gmail.com>
In-Reply-To: <20261106195126.1563231-1-andrey.misyrov@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 9 Nov 2026 21:10:21 -0500
X-Gm-Features: AclHuK_xDqAXw_TmBik1qZpjy57T3ZinrxmJok9KVaPZUDx9W2Oq2jkZuacmkfM
Message-ID: <CADvbK_dNcVHxMQ4NhqZqVFCcCy0R_ufW=QbXXyVFdhV9B7O43A@mail.gmail.com>
Subject: Re: [PATCH net v3] sctp: fix ASCONF address change on single-homed hosts
To: Andrey Misiurov <andrey.misyrov@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Jun Yang <junvyyang@tencent.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:51=E2=80=AFPM Andrey Misiurov <andrey.misyrov@gmai=
l.com> wrote:
>
> Commit 9b2854f86f0b ("sctp: don't free the ASCONF's own transport in
> DEL-IP processing") refuses a DEL-IP of the transport the ASCONF was
> located by, so that a later wildcard DEL-IP cannot use it after free.
>
> This also breaks the single-homed address change (RFC 5061 5.3.2). The
> host sends [Address Parameter L] [ADD-IP S] [DEL-IP L], the association
> is located by L, and DEL-IP L is now refused. The sender never gets an
> all-success ASCONF-ACK, keeps src_out_of_asoc_ok set and stops sending
> data, so the association stalls.
>
> Fix the wildcard DEL-IP instead: look up the transport of the packet
> source rather than reusing asconf->transport. Both DEL-IP paths can
> now free asconf->transport, and chunks bundled after the ASCONF still
> use it, so point it at a surviving transport: the packet source for the
> wildcard delete, the primary path for a plain one.
>
> Found by manual code inspection while reviewing a backport of commit
> 9b2854f86f0b; reproduced on a two-namespace single-homed renumber.
>
> Fixes: 9b2854f86f0b ("sctp: don't free the ASCONF's own transport in DEL-=
IP processing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
> ---
> v3: a plain DEL-IP of asconf->transport set it to NULL, but chunks
>     bundled after the ASCONF dereference chunk->transport (e.g.
>     sctp_vtag_verify()); point it at asoc->peer.primary_path instead,
>     as suggested by Xin Long. Reported by the netdev Sashiko AI review.
>     v2: https://lore.kernel.org/all/20261029193454.1028626-1-andrey.misyr=
ov@gmail.com/
>
> v2: the reworked wildcard DEL-IP branch could itself free
>     asconf->transport via sctp_assoc_del_nonprimary_peers() and leave it
>     dangling for a bundled DATA chunk (sctp_assoc_bh_rcv() ->
>     peer.last_data_from) and the following SACK; retarget
>     asconf->transport to the surviving peer. The pre-existing wildcard
>     SET_PRIMARY / sctp_source() point is left out of scope.
>     Reported by the netdev Sashiko AI review.
>     v1: https://lore.kernel.org/all/20261022163639.2566945-1-andrey.misyr=
ov@gmail.com/
>
>  net/sctp/sm_make_chunk.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> index ddc31a5..9719464 100644
> --- a/net/sctp/sm_make_chunk.c
> +++ b/net/sctp/sm_make_chunk.c
> @@ -3151,9 +3151,12 @@ static __be16 sctp_process_asconf_param(struct sct=
p_association *asoc,
>                  * packet MUST be deleted.
>                  */
>                 if (af->is_any(&addr)) {
> -                       sctp_assoc_set_primary(asoc, asconf->transport);
> -                       sctp_assoc_del_nonprimary_peers(asoc,
> -                                                       asconf->transport=
);
> +                       peer =3D sctp_assoc_lookup_paddr(asoc, &asconf->s=
ource);
> +                       if (!peer)
> +                               return SCTP_ERROR_REQ_REFUSED;
> +                       sctp_assoc_set_primary(asoc, peer);
> +                       sctp_assoc_del_nonprimary_peers(asoc, peer);
> +                       asconf->transport =3D peer;
>                         return SCTP_ERROR_NO_ERROR;
>                 }
>
> @@ -3166,13 +3169,9 @@ static __be16 sctp_process_asconf_param(struct sct=
p_association *asoc,
>                 if (!peer)
>                         return SCTP_ERROR_DNS_FAILED;
>
> -               /* Don't free asconf->transport; a later wildcard DEL-IP
> -                * parameter reuses it.
> -                */
> -               if (peer =3D=3D asconf->transport)
> -                       return SCTP_ERROR_REQ_REFUSED;
> -
>                 sctp_assoc_rm_peer(asoc, peer);
> +               if (asconf->transport =3D=3D peer)
> +                       asconf->transport =3D asoc->peer.primary_path;
>                 break;
>         case SCTP_PARAM_SET_PRIMARY:
>                 /* ADDIP Section 4.2.4

Acked-by: Xin Long <lucien.xin@gmail.com>
