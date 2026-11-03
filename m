Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793735023;
	b=zXdDCCxfgEAq/35bhi2x00JZPciiwfST5SjLpTwfuUUP3m952FQyUM1ManpXplYY8BT8
	 5/0OHzLmZhe9wsxklpVxlCZOnYccdVedCQHIDSbDezIdZD0ZU5uK3R38/O3uYGP5xktCE
	 GQy64TCYbgQmVfJogbrcSH0Ng1cTXw7gI1YJzvw0D07Qz09LUwNOm9xckOyeof8J46z3G
	 IqXC40GqLNdxulOTFRa822TobAexFNCY1M/x9iHRhpN7lHhcymXGcLztMQyi6hzJUoUF+
	 XHm3paweYC2Yf876eiPe1ZU9NweGPozfrJXSVvvMwqBzE259rtCOP6EsQiNVQd0oG/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HXiF5Hkq0HzdjVstuqtN1MMqL7UJCviIzr82cLK6HWc=;
	b=GbOnf9sEOJ+nbbYMukh5H26oqTsU4ImKBcHU+FWRa2kAQUt/826aI7VmsCWSJSxDhh9B
	 JmguFX4iftQZn/iKIXFGS7c5u82KXSB6H/okq693N7dHsT2AcONnOf3SAz5OyxINN3KfL
	 VsD0GBQTtpfEPs5QDmClHxqOujS8kYvo2AOcVyLmBV5/KLWt7N4QJCDdfwuvmdV2JYjBr
	 NRsvGqt9PCzQ1I3ltfAO8T9lDARaQslNeNC/y/7TA9kPnrO3gMBE3j1QxewjAKdPSQsXa
	 VTtkjkxkud9sB21EwdUNwzXyX+do0ExZnhKEybZesqGP3gzA6tk3etGNp3FYuAtQ1Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BxKVG8Jo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6D606D804
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB6D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BxKVG8Jo
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so647692a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793735022; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMMWYIbKWgUsV+XyWOY/nE2jguqjjNsc3wq0MtlzkPMWjKeYIGMLNu/DKR6UoQTn6M
         6jBbgFzLHqePi/nr8lPzjc9JvfiCRqkut5gzMWp9L0YvMbFNMBjPmTFpq28eL3D7VuUB
         mCP4zoySLgpPTcDAfnAayH+5GdKi8dLmoOEva2cgIJVtOGF7PahLyJV1sduy+FdOriMZ
         dW4xS6cZh3Vw5KSLc8upvhEjuvlWQ2Ea1zawhBC+GDUcTLAXdeTpOPNqTfy98kYvzoZq
         /WilY0WF3UTHP8IENzvFRVv6w2X3VE9ORea2w/mMze5ITjd+H2zzl1vUNnQVu7RGb/Er
         3mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HXiF5Hkq0HzdjVstuqtN1MMqL7UJCviIzr82cLK6HWc=;
        fh=SkNGZ9BQ9bC3gNUw/mOHBymUilmHaUpPFIlV5K6Cuxw=;
        b=a7NszGL+P9t7i8pnFd3HQ5gwmnpkVPLniJlcm7RItM2R9vH/sbwGJcpHL5cEqCXs0D
         b85q80RtUuScVtKLim9JJT58ePWiRUiKMHhaU6Kvt1ineKfyjFi9myo2CLx/ifbETol1
         qmpqBvsnyDnnSDospJukgmojKgvUyBp4M3aRGHYXKISvMPfIvnnBGISb+AjlfICfvo6F
         sy7cXK7kkK3U7u51V0g0HBtrWyla3/ysKJzmaki7+G42Va0CMWP/Ts+iOB1MfV3aip2k
         u+6e2TiMoh8LcLrHNVT2031nNtxYUAw6y8G+UvfYMloFnFm5674tJkCI9V9cUhPjqct1
         jeHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735022; x=1794339822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HXiF5Hkq0HzdjVstuqtN1MMqL7UJCviIzr82cLK6HWc=;
        b=BxKVG8JoCv/iLQwtckK7tTHB16bZFUqtRztlGqJbBM/qwXqrVU8gxVckUULIHgtRwe
         eAVu1569YSe66F2TCCr8LjC4QzC3JhASOec0GtGkb5ebpm1Qo2E++YCHjminyHPTdK5X
         wBE5RwowM8xsbD56ydU7k8LxUZ2B8rHVPg8n5t+3wYFEyXrdY9qGu52DT1t41PnSPXvE
         Uc9gCXRa1ZtUGFzNSbajQgIHcrbpYASURIPtYKhmtssCGSbc9ZpOio6dC0e88MKez5kF
         2DjxVghz+PDpBd2UmSRKvYzOfk/PP197DE87udZ5Sd087x6FyCvp30CyaxCbFsLLcBZP
         CeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735022; x=1794339822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXiF5Hkq0HzdjVstuqtN1MMqL7UJCviIzr82cLK6HWc=;
        b=hfr7tggYHkONk8OsXhtZ8JQJcTisp5hon2rKhcwqY1LKvtQLCp6w9I833RfXKW0MG3
         xkdr74I2plUNXglS4RNpeMggDuOljYuAO6OFHRFdxwY22jsGpk82z90IN1IfszCn7iEc
         fo5M5pZXypKuIh5RxzlwZaYszlL/ubF97NmxkJEc8dyuVtCrKt0w8Jutpsp1mB4Oe5y8
         tHQg56o9WltSrMwpwrEToZB13652evaskpF7NOdznJNJemD6/HnX7/2HbRofCjiqjQDG
         WpHtwOjii5SNg5clu6bqQA8sXPTYhCYCxGxyxo8sQ73v4bUBZzv6uNT2mF7KnQvrD/xc
         YBVg==
X-Forwarded-Encrypted: i=1; AKwUvBz97UXaVxOaUIZdry8GAifFzmDvNFegFqzNFQFZWXdC3cgt5HZwGDNr5ci7F8T9EoWHREAAd+SsXgxna6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u5E7Yd8jfizlJ/Z0F2lyJhTMDxJbigZsejegMbw9NBFhXJMIq
	4I14HAWgInrQZ/nbK5mqc1+ZRnrZn/tjFzqC9zE4t6qEJN27S/4uNgR7ZxfP2Heom6fsVAh1Mgo
	Ek07QSHa9ldJ4L/dcqEKePkj2N+2MNqudEenY
X-Gm-Gg: AYBFou3uFxHEWyaQ7M7Fe2gYCoqcm3HhX11pBV96uvubQhgek8DJ8hCCSgmGSqKyQs/
	9/kCdZS0EOv1dBWQwJXceIonOb4lGRKSG1iCfHvth2zeCNtC35AHukeOS/8H+yw08ZDvAGsVLLH
	J1jJF8+UF3RkX/plS/+iODwdT5i2EoG26j7AWIKpnV3ZbTaWbxaTdMNSaRSjDlCeDRLrDlAmxo2
	6ZsfI4WDaj7jTukUp9Fjj7d/kwCu56VAJSuIqslUq8RX0YcvxrlEzK0zyjQKLkou6CIfCWzNHa0
	TNsRuzGW/zscVQV5CMEsyOixGBAYbPIN+7jLBmcGbGuj5kc/FbePO64/kIZUUANrN2Djln+dAw6
	9GIMJWihHrwd3gyzYXjlX2ZjCl/V29B+hbCDqnXdxgWOKlGUNW02Ta14hTSKRtJXLVi2EcEbvUw
	GumujxIwwDr8zSG7gluoMohHU+JKfYKOyQvm6/g4SPwAWve4eD34S1XSydzw==
X-Received: by 2002:a05:6a21:9105:b0:3e2:2459:b774 with SMTP id
 adf61e73a8af0-3e928914359mr7729030637.16.1793735022129; Tue, 03 Nov 2026
 11:43:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103192606.92502-1-kylebot@openai.com>
In-Reply-To: <20261103192606.92502-1-kylebot@openai.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 3 Nov 2026 14:43:30 -0500
X-Gm-Features: AclHuK-Ntnjfy2V4XSDVEY_hZLHadBX9iYXfJBbZvbiqYzD0aYF-YvCMv_txPg8
Message-ID: <CADvbK_d3k8GsgjdHUZ0a2LDs-Y0jd3mxoFvLSnnz3WqCTbBbHA@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: avoid requeueing pending control chunks
To: Kyle Zeng <kylebot@openai.com>
Cc: linux-sctp@vger.kernel.org, marcelo.leitner@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:26=E2=80=AFPM Kyle Zeng <kylebot@openai.com> wrote=
:
>
> The T4 and RE-CONFIG timeout handlers take a reference to their cached
> control chunk and submit it through SCTP_CMD_REPLY. A previous
> transmission can still be on the control outqueue when output is corked
> or suppressed, or when sctp_packet_transmit_chunk() could not append the
> chunk.
>
> sctp_outq_tail() then adds the same list node a second time. Re-adding a
> non-tail entry can corrupt the list without being caught by the
> insertion-time list checks. A subsequent flush or association teardown
> can access an already freed chunk. The ASCONF path is reproducible by an
> unprivileged SCTP socket owner in a user/network namespace, with KASAN
> reporting a use-after-free in __sctp_outq_teardown().
>
> Check sctp_chunk_pending() in both timeout handlers before taking the
> extra reference and issuing SCTP_CMD_REPLY. When the chunk is already
> linked, request a deferred outqueue flush instead. Simply omitting the
> reply would also omit its uncork at the end of the timeout event. T4
> would no longer retry the queued ASCONF, and a migrated, pending
> RE-CONFIG could lose its timer until unrelated output flushes the queue.
>
> The flush command acquires a local cork only when the caller has not
> already corked the queue. This preserves the existing flush ordering,
> transport/error accounting and timer handling without changing the
> common enqueue path.
>
> The issue was found by an LLM.
>
> Fixes: 2e3216cd54b1 ("sctp: Follow security requirement of responding wit=
h 1 packet")
> Fixes: 7b9438de0cd4 ("sctp: add stream reconf timer")
> Cc: stable@kernel.org
> Suggested-by: Xin Long <lucien.xin@gmail.com>
> Signed-off-by: Kyle Zeng <kylebot@openai.com>
> ---
> v1: https://lore.kernel.org/netdev/20261030042321.74407-1-kylebot@openai.=
com/
> v2: Check pending chunks in the T4 and RE-CONFIG timeout handlers, as
> requested. Preserve their deferred output flush with a state-machine
> command so pending requests can progress without unrelated traffic.
> The common sctp_outq_tail() path is unchanged.
>
> I have a reproducer for this issue and can share by DM.
>
>  include/net/sctp/command.h |  1 +
>  net/sctp/sm_sideeffect.c   |  8 ++++++++
>  net/sctp/sm_statefuns.c    | 20 ++++++++++++++------
>  3 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/include/net/sctp/command.h b/include/net/sctp/command.h
> index 2058fabffbf6..abd6cc509183 100644
> --- a/include/net/sctp/command.h
> +++ b/include/net/sctp/command.h
> @@ -39,6 +39,7 @@ enum sctp_verb {
>         SCTP_CMD_CHUNK_ULP,     /* Send a chunk to the sockets layer.  */
>         SCTP_CMD_EVENT_ULP,     /* Send a notification to the sockets lay=
er. */
>         SCTP_CMD_REPLY,         /* Send a chunk to our peer.  */
> +       SCTP_CMD_OUTQ_FLUSH,    /* Flush pending output when uncorked. */
>         SCTP_CMD_SEND_PKT,      /* Send a full packet to our peer.  */
>         SCTP_CMD_RETRAN,        /* Mark a transport for retransmission.  =
*/
>         SCTP_CMD_ECN_CE,        /* Do delayed CE processing.   */
> diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
> index 35f540fb15fc..6f19ac78749d 100644
> --- a/net/sctp/sm_sideeffect.c
> +++ b/net/sctp/sm_sideeffect.c
> @@ -1498,6 +1498,14 @@ static int sctp_cmd_interpreter(enum sctp_event_ty=
pe event_type,
>                         sctp_outq_tail(&asoc->outqueue, cmd->obj.chunk, g=
fp);
>                         break;
>
> +               case SCTP_CMD_OUTQ_FLUSH:
> +                       /* Request a flush without taking over an outer c=
ork. */
> +                       if (!asoc->outqueue.cork) {
> +                               sctp_outq_cork(&asoc->outqueue);
> +                               local_cork =3D 1;
> +                       }
> +                       break;
> +
>                 case SCTP_CMD_SEND_PKT:
>                         /* Send a full packet to our peer.  */
>                         packet =3D cmd->obj.packet;
> diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
> index b2f609f177fb..8b76b7e28504 100644
> --- a/net/sctp/sm_statefuns.c
> +++ b/net/sctp/sm_statefuns.c
> @@ -1122,9 +1122,13 @@ enum sctp_disposition sctp_sf_send_reconf(struct n=
et *net,
>                 return SCTP_DISPOSITION_DELETE_TCB;
>         }
>
> -       sctp_chunk_hold(asoc->strreset_chunk);
> -       sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
> -                       SCTP_CHUNK(asoc->strreset_chunk));
> +       if (!sctp_chunk_pending(asoc->strreset_chunk)) {
> +               sctp_chunk_hold(asoc->strreset_chunk);
> +               sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
> +                               SCTP_CHUNK(asoc->strreset_chunk));
> +       } else {
> +               sctp_add_cmd_sf(commands, SCTP_CMD_OUTQ_FLUSH, SCTP_NULL(=
));
> +       }
>         sctp_add_cmd_sf(commands, SCTP_CMD_STRIKE, SCTP_TRANSPORT(transpo=
rt));
>
>         return SCTP_DISPOSITION_CONSUME;
> @@ -6197,9 +6201,13 @@ enum sctp_disposition sctp_sf_t4_timer_expire(
>          * chunk, it MUST be the same (including its serial number) as th=
e last
>          * ASCONF sent.
>          */
> -       sctp_chunk_hold(asoc->addip_last_asconf);
> -       sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
> -                       SCTP_CHUNK(asoc->addip_last_asconf));
> +       if (!sctp_chunk_pending(asoc->addip_last_asconf)) {
> +               sctp_chunk_hold(asoc->addip_last_asconf);
> +               sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
> +                               SCTP_CHUNK(asoc->addip_last_asconf));
> +       } else {
> +               sctp_add_cmd_sf(commands, SCTP_CMD_OUTQ_FLUSH, SCTP_NULL(=
));
> +       }
>
>         /* ADDIP 4.1 B5) Restart the T-4 RTO timer. Note that if a differ=
ent
>          * destination is selected, then the RTO used will be that of the=
 new
>
I don't really understand why OUTQ_FLUSH is needed if the chunk
was not enqueued by this timeout.

Can you share the reproducer to help understand what caused the
chunk to not be transmitted on time?

Thanks.
