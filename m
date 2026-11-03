Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715766;
	b=cH+sa+LyNsrDOoDop96SVfn6ob+j2f2A/1g/B+XX6afzsBysaEr4XqqJ4S4uxtJ73EtU
	 4DsR2vo0/qjsfAO04ucGrHKM4AqIc4vK/90NzyjbtzeEX9sExK4vYF6FUw2qNEQe4+64Z
	 GyZrDVJkhOfWW6j1uY+wZKanHtD5IhKS2TlBZ1Ac8IheRlizENWQO0EzqomO8quFBbM+g
	 4aVYyw2uXtrnubHpM6SOfLpPQ9NyE4Tr7GC7Bp+rEp3ttjIBMw0LpWO8donwT7Pe7tfsm
	 RGOE4z/LXrysqxb0EhjYGQ/Yyv2HS5c1fv11x6MwY/Hifcq059mthviLYae3Y4dAzKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=goUEmUyHzHRn/JAgbYWl2i7yvd0k17zq6RZVq6dJndA=;
	b=DHNMJKM+Jm8RTXcGqqYYFzFXT7deXyi9mtKQ1Fo8LOkCmE2f/7VsG0GvuHLsg1X6yQ08
	 p4KREJ787bB52hYSdyYxFtqyluX9+ZcJA07WmwXgNQiCJWVTYyo/fBJhJOzho9wfJJTpR
	 IkppTjvpYL28pphZXtpSbJv2oNEgWJC54o5YvpoB45yiHiuNvM/XzUYXC7coea8x1BWwe
	 IDyAGjYZMhu9RqfQK5her6xNfAZH0a5PXGEWkZuzzprUE1kw0wFtQQHw4egXYReBZYBEd
	 E4Tr9mZziWxcG1Cnu5gtxx2DjBIHFyWkO/iFbyIEN2aaTh4sqPBswRNmDGo0cgcA7SA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jhkisa2S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFCD606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFCD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jhkisa2S
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1585111b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:22:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715765; cv=none;
        d=google.com; s=arc-20260327;
        b=kDMC6aFPtKjGhR4O9MSmzTqlmgwzzWMm3spCC+7CB5W3tZaRz6TzKOMdE51agfduAj
         MJHNAZYx9oRcbSQ1G3HotIOqY8Sed1OP2TmnGaPsmuRJV5Ls+Dt7WrQ0Wf/BT/A/zWFq
         ohBzM2FY7KA8jiqY/Hj5udBPVn1Q3Gv7C78/VRUlztYhAKn9O+gCBjeyFhEIrxjNBHUb
         jUX8lRFCKN+7yzZz05EHO9Fas8vhVhI47SXB8s93U7IcgCXUDiBfPqoLLn3yDE6wdxKo
         RIlu6FNwzV44b/AeACo80xQte58x99REYZK+S2j7J9Z7XMXTPt8fbE2r+C6XMHDDy8yx
         MZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=goUEmUyHzHRn/JAgbYWl2i7yvd0k17zq6RZVq6dJndA=;
        fh=sPg28ZjeuaaCx6HwqU0jhOkSQF4jxsNP2ztPT0iZTic=;
        b=Ld8NdpWpeI513IrQk4/tT7ALYMJxxk2mVmS01fkUHm3smpGwN8+91Qdr/55NjifnH1
         3D1niULWGNbG2rLjnKSGctzqrme/WomAi2quYpzMo1Pc2WAOGtVIJ83Tzqx3fhtHgF90
         mHtVFwbDruK9wj4ivQsSK2IKieLY/pcdXS4L1Lt0tpHCEutY39kXMxsN81Zz+oIW1Sn/
         g4nmENodxKDglRYkPvHLWbysDuTXgnVFXaR2INdqVzzk5RMMRMIiW7kIH1om79iUBqou
         gyLqIKyhL+BW4J2wm5puXw2DGXMtet8ayn8mbbAb8lGE7FWMKS3+05pJtR0GtZp+kLvO
         GLbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715765; x=1794320565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=goUEmUyHzHRn/JAgbYWl2i7yvd0k17zq6RZVq6dJndA=;
        b=Jhkisa2S2vXFBSNqqCyZnrR6JpuM5BBpw/U1ykOmBCVbHHAGBHiG59udh4q4ocSZzT
         B+VLP21mZOHIS1JiMcrm4hn1l7sTaZeW36g+3nwf+SorUXmrDWEMCYf+9/iaAtGkWP2Z
         jvIaLLuZeQ4HOU+rRp31Qy0Y1c0Y++wgaT0ywmdFgHf/MWUk0f+ANbMLe19dXKYipBm3
         DqkuIdu20GgR3QdxoXR+SnZkJh1tFg0zTOIXILFVjTGAuUeaaF6fXdUsYCZwgoWvaGzk
         AFufwdIM3Ds11CGHgak7opO6f4y9wacjoIffPeNer/sXD3iDcQGEv82oJ75qb5JfHozX
         bmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715765; x=1794320565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goUEmUyHzHRn/JAgbYWl2i7yvd0k17zq6RZVq6dJndA=;
        b=PexPd4bcPljcaBFVi1WAB6Sw+qrUX0zA9LYDPQrjrdEa0PAZFY/YEv8xbPy8H0ljwq
         LZyfgyMI98bUwnNBVVwD5M4XU3E6Pv921f1xhGZnIly3czZ/P9z5XHXXx7LqZTXOXUng
         RCI+qownt4LVn5rldrjLZS+LFozXhmnBEjmZaeYF6bQ+yyszYC79oHTA/RnZq2ppAYVb
         0riEp41sV8zm/Wh8lb81aH8Mk+gmRnsrc/Yi9FNqMdR03x+LqUH+9FmS5meB2/AlVXpy
         7MhkCIKxQ0leHox86OBXal9nO9gy8r2tCd/Lr+wZqW4bhBbNEwLiGyLq2SgmQd9kZEuA
         IeJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjEdqoqls42+C9qwEGw90XhmzaxdPvJHznxld6VGo69GA7GCxNvnGLjtuN28/gDRdOzR2T8R9dlTs2aMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eBi29nib1jpPXMzf0X+cXdbKBWpDDhlTup/+kl2iqH5zTO6D4
	Iv76ZW9ieaD6oNfK3WQnZjJvz/Q5cPZy1tyBgJnQTAB0wR09lCKOB5tJvSFWvnHYJW+gG4BLQfg
	8o18m6l1d0sQiI0DOjhhe9HCriB/sHQU=
X-Gm-Gg: AYBFou2QIhBhapv2tDwvkogq2323z8yyxhWeCq29m+iHR0pkcuxSI0SB74/ZHhuMgIz
	sZzJTY0HriXs927cg+5Iem74smQWS81dV9X+fcjIwdjE6hUSWdfgpPOKQReAG4Gn73QVWelnhS0
	KaSEi8kWrHXSyp21AvuwG1F/FZwQWMBXFpyjGvhYlkl4kYskO6RuxzPciwILPiMkp3psP3WLxsU
	hFqHut9fqNLppmOE3mOgg2/TlvuKgQMY9cO5GbSvhjXziYBmMOZezsKgINlr6G2sjRZzi9drkGI
	UIdB7Urw/av1OIZb301FWEj3umW4sBzUGni2Up9dp7QU7eKXaOS9uLv2OfwQD45pFwMjewfBk5I
	pcNfCN/Kx6Ni9KR6fy4Eng/OFtyMKSjk9/nwgnDleI9wCK/n2hqDkAwPfxcnK7e7N6dm1azXOS7
	kmOElfwUsufdcNgGTgUO02K/4KL0o4zK6Zqa9cJQ==
X-Received: by 2002:a05:6a21:3f90:b0:3e1:d119:ee35 with SMTP id
 adf61e73a8af0-3e928d40e11mr9916793637.12.1793715764802; Tue, 03 Nov 2026
 06:22:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030042321.74407-1-kylebot@openai.com>
In-Reply-To: <20261030042321.74407-1-kylebot@openai.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 3 Nov 2026 09:22:33 -0500
X-Gm-Features: AclHuK9rygcKHlFq8M3zeAsoFHUWP0OF3Dg8S91AWQVg--msS91soOe9ITJpZK0
Message-ID: <CADvbK_fwt6s14a0yJjRa5whAT-H+7RtaDXi4cR0-XmrvoJkeQg@mail.gmail.com>
Subject: Re: [PATCH] sctp: avoid requeueing pending control chunks
To: Kyle Zeng <kylebot@openai.com>
Cc: linux-sctp@vger.kernel.org, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, outbounddisclosures@openai.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:23=E2=80=AFAM Kyle Zeng <kylebot@openai.com> wro=
te:
>
> The T4 and RE-CONFIG timeout handlers take a reference to their cached
> control chunk and submit it through SCTP_CMD_REPLY. A previous transmissi=
on
> can still be on the control outqueue when output is corked or suppressed,
> or when sctp_packet_transmit_chunk() could not append the chunk.
>
> sctp_outq_tail() then adds the same list node a second time. In particula=
r,
> re-adding a non-tail entry can corrupt the list without being caught by
> the insertion-time list checks. A subsequent flush or association teardow=
n
> can walk the corrupted list and access an already freed chunk. The T4 pat=
h
> is reproducible by an unprivileged SCTP socket owner in a user/network
> namespace, with KASAN reporting a use-after-free in __sctp_outq_teardown(=
).
>
> Check sctp_chunk_pending() before adding a control chunk to the outqueue.
> If it is already linked, release the extra reference supplied for this
> enqueue and leave the existing queue entry in place. Continue to the usua=
l
> flush so that the pending transmission can be retried.
>
> This also covers RE-CONFIG retransmission after sctp_assoc_rm_peer() move=
s
> the request to another transport and starts its timer. Keep the existing
> timer handling, corking rules and data-chunk path unchanged.
>
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

Please add a "Fixes: " tag for this patch.

> ---
> I have a reproducer for this issue and can share via DM
>
>  net/sctp/outqueue.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/sctp/outqueue.c b/net/sctp/outqueue.c
> index e92fb9da4647..a5f9f0fcf5fd 100644
> --- a/net/sctp/outqueue.c
> +++ b/net/sctp/outqueue.c
> @@ -304,6 +304,11 @@ void sctp_outq_tail(struct sctp_outq *q, struct sctp=
_chunk *chunk, gfp_t gfp)
>                         SCTP_INC_STATS(net, SCTP_MIB_OUTUNORDERCHUNKS);
>                 else
>                         SCTP_INC_STATS(net, SCTP_MIB_OUTORDERCHUNKS);
> +       } else if (sctp_chunk_pending(chunk)) {
> +               /* A retransmitted control chunk may still be queued.
> +                * Drop the extra reference and retry the flush below.
> +                */
> +               sctp_chunk_free(chunk);
>         } else {
>                 list_add_tail(&chunk->list, &q->control_chunk_list);
>                 SCTP_INC_STATS(net, SCTP_MIB_OUTCTRLCHUNKS);
>
Can you try to fix it by not sending it in sctp_sf_t4_timer_expire() and
sctp_sf_send_reconf(), instead of touching the common path? like:

diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
index 8dc65498763c..7671bb0ce946 100644
--- a/net/sctp/sm_statefuns.c
+++ b/net/sctp/sm_statefuns.c
@@ -1122,9 +1122,11 @@ enum sctp_disposition
sctp_sf_send_reconf(struct net *net,
                return SCTP_DISPOSITION_DELETE_TCB;
        }

-       sctp_chunk_hold(asoc->strreset_chunk);
-       sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
-                       SCTP_CHUNK(asoc->strreset_chunk));
+       if (!sctp_chunk_pending(asoc->strreset_chunk)) {
+               sctp_chunk_hold(asoc->strreset_chunk);
+               sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
+                               SCTP_CHUNK(asoc->strreset_chunk));
+       }
        sctp_add_cmd_sf(commands, SCTP_CMD_STRIKE, SCTP_TRANSPORT(transport=
));

        return SCTP_DISPOSITION_CONSUME;
@@ -6197,9 +6199,11 @@ enum sctp_disposition sctp_sf_t4_timer_expire(
         * chunk, it MUST be the same (including its serial number) as the =
last
         * ASCONF sent.
         */
-       sctp_chunk_hold(asoc->addip_last_asconf);
-       sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
-                       SCTP_CHUNK(asoc->addip_last_asconf));
+       if (!sctp_chunk_pending(asoc->addip_last_asconf)) {
+               sctp_chunk_hold(asoc->addip_last_asconf);
+               sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
+                               SCTP_CHUNK(asoc->addip_last_asconf));
+       }

Thanks.
