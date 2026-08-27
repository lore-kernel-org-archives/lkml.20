Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA24C490BF0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851112; cv=pass; b=XZXDLybPVQ2WMaaz8YmA1DqjlmXjxQP7+wX2w7rp0cT9NJ+PAwnsBJtKvWwjH9P8uYuyJP1lQTw3nB8Nol2qu55P9kIugkfLPPAfAEDLV/wjNN86hRr7UTg+1TefL1I2QS4A8n5CKdmubJoY3yqTPGuvYQ0AKsGv7tV20j0PK7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851112; c=relaxed/simple;
	bh=dBUBPexRlyMLsVoGjr+3rtevSBmSG8Ic9FKpcxX/rGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1qq0y2lOKyR08KU7Ggii60SLDaZc2YUw5TucREJbynT+On1TtjQoFKqv6Wn6dMVlVMrgjt1sPyaTViVPj9iWgeOMW9CJadmfK9iaZkR9f2BL1CmNW4bg+lA4a0NGLNWTtuvKkvGrf3XTln/DWzCaDgLuW+Bc3JbWbm8JC57lK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sn4TZopR; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sn4TZopR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-853c947bfefso49389b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851110; cv=none;
        d=google.com; s=arc-20260327;
        b=Q7r0YzABOBoCivkyWddAFNdMY5a+vUXnZdVTyuygoyTIYnhhWJ4Msel+KP/c55FmSs
         Ng8rV5Ts18Gjrv/Im+ZpOoTxtUf1YK6vP1HSdAk62CvroQ/MldsbVkcYGBdFC4JYsWjL
         qNpQLCwyFsaS614NQXu4Gq+JwDx7mo0zO298BelRVQJmbyX4ljhZkdA+dN/LmO1u4yr5
         M8R9XZ+cqVvQcj9E+p3ptB1DbZVQkWyX96CAMdeFhgphd1tIfll0TKbp4GqNQTdT2xbp
         05BGjxgvCpy8bS/7r5hWyM73Llc4IAPlLZM6ghFYoza7r1it6OiC3UnfENa/3N1AH1sO
         O/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEtozXouVWJGqO6lpvX2FbcKxusT+Eqsv3MS9X7Ic+0=;
        fh=VYlv91EIKg0nPB78KPUzhzILQoIb889MAmHHkRAbkzc=;
        b=YWoPjpS41v1559ZAwrXwYD7Mg5YvNTkhU1dacO9PsvjaN+WbZ+w2pSKysjnPfXU0+H
         aSe/zly1SLAn+R6mHX/5nwZsRChgTip7FCjRVvOV1TMqsUDi3nKjIWIOiFcYcps1C+dL
         BCS5Zv5+Ruz8Bdm2cafWBPVL7JJ6r/+vqFseCYd9mbTVSyy/QY7gVE6OPmsV6NyXht1k
         UYWCTxCyNpB5w0VdrHPhWf0Ne7D7uCtdcpyVwjkpu2qjVT0lWqoyapV/crN8cat3aOIK
         a9Je+JgKlzj0qCXgsb9ONuCLGAYH0b7th1D+n6mlm3ZrjyOhHsVRcRs3Z60qmok9Awqu
         KNww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851110; x=1788455910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEtozXouVWJGqO6lpvX2FbcKxusT+Eqsv3MS9X7Ic+0=;
        b=Sn4TZopRyCYsnz8ga/aG3HyirHTm6zbi5Gy8J8e+Zw/OLjgMbxi2LgutE5yv4r8uQW
         D+RxU+hsIgDPFC+UCm0z8hJo7vw0wY8brvOTay40wqAovwKzaeGb3UCvRW6vwvTy1fgv
         70Ymzt5j7t07ZvEnvfWr5qO8adsU9V3hSXxaOfKe54DEapdHyXc5x+ApgxdZCJTKv92D
         912OjktLIOsl0zljMbxUbPqV4ivQ5RHe/8iymoNQZbkW+vJaftme+viFFqgTu2sWlpRP
         OIC4Fa3q6nFmsWb/gyY+nibwlfFSdDIJA9kyrlkVJSU06imQ78/5kiymAOr7PAEDAk0f
         SpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851110; x=1788455910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEtozXouVWJGqO6lpvX2FbcKxusT+Eqsv3MS9X7Ic+0=;
        b=gPdT2hk/o7M89vXx3Ff5P6660DKcipPvF7sog1vBJfgaevUlxBXzMhWRF4CiuAZQFZ
         +PMcFKjhRmfuPIsEdL7RtzzS7XOJ6Vi9XSwCHq7ca8GJ8EXoa09NcK7Hwf9m2qoDf/IO
         itFl/xbdJvRML9DH3IaxBdVIcr4mobU0OwWdPuis7H5H36sAo8+6bSyWHlVpPUz/CY7o
         M2r0lWtK0v8ASzNnE+AQwsKk6/ea+Wt4HUuHCqxrEsxSGJ/Hy9wLFjKr5SqXBMSrEgMP
         k2TvYf/TXYBuwjzj8/Hy/g9Vb8cPqp2wfnRqxyfMpbhvwYcfl2D8X3eWY1tzW8DiqKZU
         A0xQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro63UXeSIZQXjZGssoqIoGC57zFDsU+deU8hGWaZNNzP8kyGJcEYWpkrN5/6zozPx3Zy4mk4Ycu5keAxqU=@vger.kernel.org
X-Gm-Message-State: AFuF++lRH2eT80UhwZ2gu6sxwVLotuYGuXB5vyS2a34PNyXcSr81sevc
	HdOXKLe0nzeBFyx/DTQ7Hk0fR+lvNkbyNwKlqcU6r/U4iAy/X9T7O+ioKToym7gPET34ePuFBxP
	1cymcLYTNlkpoaRL0uUECDtEeJFE/NLE=
X-Gm-Gg: AR+sD13eNRe4Xfm7sFXUZGItHW9/0lQfKWBMogg4pwgOnPxSzAkmOrOemL/Spw8L2tw
	RZGDwd0xz3VPxmfOrycGmIScCA9hjRz9c8nrQFkJswregAjBpD1s1Lje2VhUNfjFllxdj0NiQ7u
	d7MRo/FoU3rVaHhdAjWPil70pk8Vna+4THwZhd3nsRWDYis9Cp/15FKQFRdLwqresJwewTgrij2
	qXOmhsqls2QZUE4jkXqTsgWWPNTBAwXxvzBb/l1jicOBm9DYjd+INUhyRAzsmVRWaTXjoPGroJw
	7vdN+G40bcNDnQ4w3n+eeb093KWn4qcM02JeyUXAU1ykOKGV69GowLMB4ct+kssVYa3uEK83AVV
	YSKgTni0EugWhPiYKRNGKo6krgwtSaNlOJt6T7l8by0g=
X-Received: by 2002:a05:6a00:929e:b0:854:2071:be08 with SMTP id
 d2e1a72fcca58-854c6b7fa20mr9813220b3a.6.1787851110067; Thu, 27 Aug 2026
 10:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827075006.3979566-1-sunyiqixm@gmail.com>
In-Reply-To: <20260827075006.3979566-1-sunyiqixm@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 27 Aug 2026 13:18:18 -0400
X-Gm-Features: AcwNN1UYlSeUhyVnikOguDNaDeElz5rpDvHHe4_oAp-JS77cqmlR8-ikFEzZv5Y
Message-ID: <CADvbK_dFoagLs1c4b-3aFqsbDueu3VO0t-8S93+6GgevuoRBLQ@mail.gmail.com>
Subject: Re: [PATCH net] sctp: avoid livelock while updating retransmit path
To: Yiqi Sun <sunyiqixm@gmail.com>
Cc: marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:50=E2=80=AFAM Yiqi Sun <sunyiqixm@gmail.com> wrot=
e:
>
> sctp_assoc_update_retran_path() walks the association transport list from
> the current retransmit path's successor and stops once it reaches the
> current retransmit path again. However, the loop skips transports in
> SCTP_UNCONFIRMED state before checking for the wraparound condition.
>
> This makes the loop non-terminating when the association contains only
> UNCONFIRMED transports at that point and asoc->peer.retran_path is also
> UNCONFIRMED. One way to reach that state is through ASCONF wildcard
> DEL-IP processing after an unconfirmed address is selected as the
> primary transport. sctp_assoc_del_nonprimary_peers() then removes the
> other transports one by one; when removing the current retran_path,
> sctp_assoc_rm_peer() calls sctp_assoc_update_retran_path() before
> unlinking it. If the remaining candidate and the current retran_path are
> both UNCONFIRMED, the loop repeatedly continues before it can observe
> that it has completed a full pass.
>
> The same reproducer that exercised the bug fixed by commit 9b2854f86f0b
> ("sctp: don't free the ASCONF's own transport in DEL-IP processing") can
> still trigger this CPU stall after that fix is applied. With the UAF
> prevented, the ASCONF processing no longer dereferences the freed
> transport, but it can still reach the retransmit-path update described
> above and spin in the all-UNCONFIRMED case.
Please share the PoC with maintainers.

>
> Fix this by remembering whether the current transport is the original
> retran_path, still considering it as a candidate when it is not
> UNCONFIRMED, and then breaking after the candidate logic. This preserves
> the existing fallback semantics while making the full-pass termination
> independent of the transport state.
>
> Also restore the NULL guard around the retran_path assignment. In the
> all-UNCONFIRMED case there is no eligible replacement transport, and
> installing NULL would leave later retransmit-path users and the debug
> print with a NULL path.
>
> Fixes: 4c47af4d5eb2 ("net: sctp: rework multihoming retransmission path s=
election to rfc4960")
> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> ---
>  net/sctp/associola.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/net/sctp/associola.c b/net/sctp/associola.c
> index c0512c827d0f..6f19eb0b01e2 100644
> --- a/net/sctp/associola.c
> +++ b/net/sctp/associola.c
> @@ -1272,6 +1272,7 @@ void sctp_assoc_update_retran_path(struct sctp_asso=
ciation *asoc)
>  {
>         struct sctp_transport *trans =3D asoc->peer.retran_path;
>         struct sctp_transport *trans_next =3D NULL;
> +       bool last =3D false;
>
>         /* We're done as we only have the one and only path. */
>         if (asoc->peer.transport_count =3D=3D 1)
> @@ -1289,18 +1290,20 @@ void sctp_assoc_update_retran_path(struct sctp_as=
sociation *asoc)
>                 /* Manually skip the head element. */
>                 if (&trans->transports =3D=3D &asoc->peer.transport_addr_=
list)
>                         continue;
> -               if (trans->state =3D=3D SCTP_UNCONFIRMED)
> -                       continue;
> -               trans_next =3D sctp_trans_elect_best(trans, trans_next);
> -               /* Active is good enough for immediate return. */
> -               if (trans_next->state =3D=3D SCTP_ACTIVE)
> -                       break;
> +               last =3D trans =3D=3D asoc->peer.retran_path;
> +               if (trans->state !=3D SCTP_UNCONFIRMED) {
> +                       trans_next =3D sctp_trans_elect_best(trans, trans=
_next);
> +                       /* Active is good enough for immediate return. */
> +                       if (trans_next->state =3D=3D SCTP_ACTIVE)
> +                               break;
> +               }
>                 /* We've reached the end, time to update path. */
> -               if (trans =3D=3D asoc->peer.retran_path)
> +               if (last)
>                         break;
After removing the continue, I think you can keep using
if (trans =3D=3D asoc->peer.retran_path) here without 'last' needed.

Thanks.

>         }
>
> -       asoc->peer.retran_path =3D trans_next;
> +       if (trans_next)
> +               asoc->peer.retran_path =3D trans_next;
>
>         pr_debug("%s: association:%p updated new path to addr:%pISpc\n",
>                  __func__, asoc, &asoc->peer.retran_path->ipaddr.sa);
> --
> 2.34.1
>
