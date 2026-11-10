Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794324164;
	b=EgFEr8NMfOQIl5JhwvdXEITxurydSnFXCnF2sThd/IJs5Uq6BcNeHnzEtYZMO3hy9X1S
	 t+QCVatPtl8TRj+zfPiyq0Oc4x0UcwFGJTGHVCKelgAEf719RJLcqljJ+A2qqSksqOtNT
	 zc0AyM7HXSZkEmFKC1rL0toqP2YnFDKIcHEtNAFKohEkCPyzJNmmP9EBCgIFFfz9VWTZr
	 CoPtMxOidF5gpOVXrKGe4CUTRt31+lnaDTdN2TeHJANqzT5Sok5t7EcjAfXAKTcTfq9W3
	 aZTYZxxpqq7rKHOBZlsYhMSvGFh4iQ0fsSstAcIjvqaTsfQKyPHvUjkdOBtiX/7B7rQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CJiQL5sKqyZVeUNg8rOn7a2I+JT7y6AYk1VYUPMSMjA=;
	b=y4U8yLxxFDEXPrX7QOfcSjlTcbQLQqLvTHID07uALVIKBl0/jsKj2E2mP/yrilB8W21+
	 D5p/8toGH8R6zX0uymUSuAR5FxrYU8ZqCU7Ypwmt98jIRVpmdfQJimKmgHK2ssD1sVlFS
	 TfmJYU63m02EjPA3rCznv6G3XzcdvWMc4Gdp8VD6uKqhAK2RdqKoj4RuF6LxZ74thBcXQ
	 x7Dq1acTFsmcv4u73l06zAASGWmR6Yyn0wIziLJf7PMjpslp7PVwBVHmcAe/tpKQ4J/4D
	 UK/Q9c03d9XpA/d+ujRDhw0/k9+KtuGYhgl4zsIm51QKK9PsIOc91FSzHgmE8mQ7hHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpPk5dhh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D81606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D81606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpPk5dhh
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so568736241.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794324163; cv=none;
        d=google.com; s=arc-20260327;
        b=T70Qbc7TFxji8STYVrSZ/uvZOZmgNPjwUdxvZomEZhEXO+WdJr20jp8JO43vWH/KFh
         Vqi/BexoLvDODUMcROS6kHQf9MS4fFs5OfT6YZ/j29DET4J4tBFaW5qSu3IZzKHqn6L4
         bvMRPW6/sVO+Oa6Te/SOw8UuA18h+GUPTzW1Jgt6yt1/TtU0o3XFlHjYEJ7MxDTwzo/M
         GBejIEFGI69xenQmiy4lCyqv8QE7BYTuyTywQQ/HyH+mpHLMkWj1PhBV/vdhfD/vHnFF
         WBVqOyxXs7fShg6n2wzPSpoTpxIDZLAk5erwxKYhc/meLqH79806AWcwwy7whTy6TRvb
         tgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CJiQL5sKqyZVeUNg8rOn7a2I+JT7y6AYk1VYUPMSMjA=;
        fh=ouF8IFnFxYldN6Xjp/FqrbRi5tnH7UpIDhc88CByLJo=;
        b=RRM31vnndNipJcnBubwOfsfnY/MY9Im4BPPWPXRQCZHnuWeyINUgNPyuiJbPqgiQRB
         w6JHb00PBjQhyWfnKaYFDjXzWLz5ojY9rOFRbSXohTRsoIbEmbtU8FSUHp57kuFqitQU
         /07SFuspVDm3I0Dps4v3gp39GSgvUWyTpZB6papg+H8CSNIkytJSI/7M5xi7J9c8DjY1
         Tq5H24WogpX4sKAoKBlxeQVJgfylEYGgQEADvoUzrpMjaeK6J5xP9TcXYxp/Scaxc4+X
         kLeQzY8Z52pHUpHhjIMaX2ap6T3kYpPpZhHNH0FzzfqqPLj4jfwHKMXrbSDxGyeN/CWB
         16Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794324163; x=1794928963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CJiQL5sKqyZVeUNg8rOn7a2I+JT7y6AYk1VYUPMSMjA=;
        b=vpPk5dhhI/RU6k/kmNTxujQ8ynYzj/ulpvfjhDI8C4HfIDgv9TpbrH9qB2B6IhOLhb
         XnJC6w49DVW62pNYEsgW+CICmDNSLQ89K7ocLHaXQIcQzxN1VuNR61e/wfH+r47HD72j
         9fNs4c80+R+6KUQ6lIaIRzSsljX9OoaRPiH883FIRRx9gNJBx6X3oOLDGIuvEd0U7eYr
         Lx5ztZC7X31XPNfaVZMaUTc5gtFrUhu4cotfxnYYjbutuy1VOnRacmaslrgMI87MSrZ7
         2XxwoFiZn3HHv1AED277aqYeuIFlkEX/tI3JV3g81UDiqIDlmo/b9wXlbqAvCiqjgm3b
         VXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324163; x=1794928963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJiQL5sKqyZVeUNg8rOn7a2I+JT7y6AYk1VYUPMSMjA=;
        b=WjwTpfeA0ymNR2FRZOWVzU0ovzxMF+nT0zYOK6Y/DRhlSP8T7/tlsxGm7R4ygsYHpr
         L26KzKKMNnvb9q+3uuDVWj9a/Cflfr/5bmDKX3awfnQvQ6sUSsAkc25g+liGUg9Spli9
         R+SfZe6js4KFuQ2OOrTNVJLmzvb0gFajb4phIU9l5SeogK9NEI2N0vFxll1d/Tlqm/fB
         NF+eRpgfxn7UImOibomGrcalMOkJG/TWgbOu4WlcuD+gUiIRmjXJp6BgN4vp78671tSt
         ZipWSgIzIAY82MbT3Ii5cLdr+2ZMzvYIms7601xNs2LUO6iGwGrx58FoaXP0sqgtzqzs
         a6jg==
X-Forwarded-Encrypted: i=1; AL+hErEonSMFSjp8qiueFkoenSJ9+T0buQ9CT0KTyShiENkYo5sUiu4+HYGoguZwjpyiMPMUtYE8CfaOnG33PVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tSz0Bhy2Nb0F1aQXQ0vWTLdKF2G+/xz5Rzi75pj3Pe6fvCCY+
	eQbsozQDWHS1DSZiQojU6sjSVXGvNqjaso1/KyRqLwIsqVn9VIUBA5PKAoe6MUyAmVjwqrUl5A+
	ReW9cb9CdelH1yLjiZZMqtm3+tcSiU/w=
X-Gm-Gg: AYBFou2QWAZHPqyVmZck87dyPir9tQ4ETwg7vzdVbNl2zyE98ZrdgxaV+ddEoznvm3V
	WRHrm1Id3ROPDcWZ+ejNB5IH4mg7LoPM5DApzyHB/Ev2oCeX90nv/uMynP+XnwM+WG+i0lD5M0S
	zUrJy6y0PbFqEPX4U/Vw0tMpMaNXQmSqUkGwRjox0K4w8JsXy6j2Pyf/9xXOUGgD+LBUuz1NagG
	/wcZby6bhdGPtfC8RSYhoE+873ObuJgd+Qvt3q5QBX2wT477bpeo7l7ADVph2zDlzPRFVsfT+Np
	XVuMKeNvnetQHmVXuspYmsjcSCG2DqibFAF4ryMXWM9v7nHpwbyJvDqZ3xr8vMjTfNK6yNecqYD
	70MdloWtEBfjWhtljqNybsMsML9wzqR6/Y+7LEbbYDYx+EPpMv/cgKioxryDEuWzMSKtOHPiFKu
	RASLG+whV9oKfByxbCaiHbunLZzqbzQ6Bx4k7tPA==
X-Received: by 2002:a05:6102:5087:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d301bc9d82mr797847137.14.1794324163139; Tue, 10 Nov 2026
 07:22:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107030532.32310-1-kylebot@openai.com>
In-Reply-To: <20261107030532.32310-1-kylebot@openai.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 10 Nov 2026 10:22:30 -0500
X-Gm-Features: AclHuK_as0CyVKCysZAXlMmcRhg8HgWxQZlIW2p68ZFwPAUogqt6LAxG2x9OdwQ
Message-ID: <CADvbK_eK=sgA5Yvm9fpFjmREg61Aof5ci6J_zFNp0wbQHJiLzA@mail.gmail.com>
Subject: Re: [PATCH net v3] sctp: avoid requeueing pending control chunks
To: Kyle Zeng <kylebot@openai.com>
Cc: linux-sctp@vger.kernel.org, marcelo.leitner@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:05=E2=80=AFPM Kyle Zeng <kylebot@openai.com> wrot=
e:
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
> extra reference and issuing SCTP_CMD_REPLY. If the chunk is already
> linked, leave the existing entry for normal output processing. Keep
> the remaining timer and error-handling commands unchanged. This also
> covers RE-CONFIG retransmission after sctp_assoc_rm_peer() moves the
> request to another transport and starts its timer.
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
> v2: Move the pending checks into the T4 and RE-CONFIG timeout handlers.
> v3: Drop OUTQ_FLUSH and use the two pending checks as suggested. Leave
> already-queued chunks for normal output processing.
>
> I have a reproducer for this issue and can share by DM.
>
>  net/sctp/sm_statefuns.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
> index b2f609f177fb..64519fd8f943 100644
> --- a/net/sctp/sm_statefuns.c
> +++ b/net/sctp/sm_statefuns.c
> @@ -1122,9 +1122,11 @@ enum sctp_disposition sctp_sf_send_reconf(struct n=
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
> +       }
>         sctp_add_cmd_sf(commands, SCTP_CMD_STRIKE, SCTP_TRANSPORT(transpo=
rt));
>
>         return SCTP_DISPOSITION_CONSUME;
> @@ -6197,9 +6199,11 @@ enum sctp_disposition sctp_sf_t4_timer_expire(
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
> +       }
>
>         /* ADDIP 4.1 B5) Restart the T-4 RTO timer. Note that if a differ=
ent
>          * destination is selected, then the RTO used will be that of the=
 new
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> --
> 2.55.0.openai.911.g06873a30d2f3
>

Acked-by: Xin Long <lucien.xin@gmail.com>
