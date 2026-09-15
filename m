Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B7C4AA57A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515850; cv=pass; b=J7CyBV/hUHH3HVV3EK/JY/BptPz+Ia+3kfQCDH+y2LFXNP3tkb0cOk3h6C4caUP2/nQrOn6U1M9mSttbmggj5b1kii/e8KAhVepew7n/+BlVxgUxNqEv3JS5rq+68IkJd4RH83buZP0M3v9pAtKlNAgS966VjieFpgZvNAV9DgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515850; c=relaxed/simple;
	bh=SGIjU28TwfoxKzBSfbsOu+03oHMa8aeBE3oxpeVz2OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyAVRZQrAlrfwGEVYZea4aro2CIimGGR8jdI2lr7XpL0gVUn8Tsm2Adr2RzTGYtDxY2OrV6VA6nWQKWeAcyBC4/RxU498NTofIONvcGHkppiQ26hp1dibFrYTVtRyMMSwNw53CA+0JUS4UQ6EIihduLJqC1lbGmEms+U9ADYooU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grjZos/c; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grjZos/c"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939e3so2884767b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789515848; cv=none;
        d=google.com; s=arc-20260327;
        b=jnFuVm/pdD/bnoZhU0gnc0QGxjHlURosTt4nNtS+QbkMhJrFAMsK1HvJBh8aQcxZBZ
         J9w1FLUjDeyE3j0XIV3dKM3kHu9H5i7WEoS8O1XzgDcq7UQGv19o+VZ42O6VzPSdavR5
         s9R0rWZNzwip/EwULxq4SQpNnBsADlQj2t/nczm6RyIPm3AC4BUqOytKr5TyGlocHJ82
         17EU9JFw2l0FynX1DZWdiWMIDKdOVCA5zzfCCwA/f01WMGLQu90DeagMBWSjdWM8lN9+
         0w+KZSP2BfUMEN2OH7fgANlLcfiFBU8JGq5wOsE3KKw6S4C7WElObV6pdyqBK/Qsih0Z
         ELsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ESrn/qED2M2tTRTVQuuTadkdChzosu4LGKtajzfHSeU=;
        fh=NlTySFBDfI6NEy//+rZmArhic8X0+UHdvYij2mA+Nms=;
        b=mjhyTvZ1+j4JgFRERTDazsFfIlB4IFPP8XJojHVQegsMhG9hzdsssTHxmS6AWOXGHO
         9VXH4j2RZ8EQr3XtI/k3oV62HFE+b5s9HWukZZ/wTGBaPUhi0aes/37Rlo26kcQ6uoMt
         HFktFnvGhxiEQ5fSAWoP6HJ2FkN7A9SAA9SpqMoIj3+bG4sMJ5ev6UiLUeb0Em+IXxFl
         w2Q4gUmGX10oeT2erM9nEGKSpSG9DCPgmcH9ALHTMIKgJzlHr9xbNQA7trdln73f2uwj
         3MYDfTmtj5Ub8RbIiVvSBGNk+KGprzt7gT6sIERKk6LA7Z1Nyqz3n5HqRhRS1hzi3Jxb
         hvjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789515848; x=1790120648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ESrn/qED2M2tTRTVQuuTadkdChzosu4LGKtajzfHSeU=;
        b=grjZos/cB8daM+wImghtlmehDT+zHXQnu+L79L1W0s0Hqxi9V6I9/MfZCdEnoQQZ8G
         rtQ9e17QfGv+U5W+eKuyKSilSxI9TwHwln0RKgTryqhjKjXFRYrGku6zbtpznk3b60n5
         Og/TrMWP4nccbEGy5joylQAlNfYRAPK8AmaXikzRkFNDoysgMprSmPBTCbv5cA8qdJs+
         ZJx9EjFKvgspDvKI7T82PXDa3L62S7S4RB+a0NbkURuF1U+UfRHaL/T1EyVDoLiODHSd
         cLFzagp5VNolb1DnHF8qd9BryxcuWOePuJKBexnXtrj/YpW2r/ETFFHrKFesvOoLv+mw
         xAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789515848; x=1790120648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESrn/qED2M2tTRTVQuuTadkdChzosu4LGKtajzfHSeU=;
        b=Xc2Zae1s79JbOWlxOhQcXtTr8hVyU+cl/2btyoJiIMmOCw1YukTOC2kkdmMu0NJqPP
         HykbQAFONuVrKCsfNhDtXZ7+Va/6taFz8tQAYxTsnPzFXGX5P82KYYfmyEOTNj7f8bkv
         LKIdWG8J6J8bD2V8bhutEg08VX0AtrngKwwzlKMqQoAV1DDOcI6EaxlW93dWfdILT84j
         TXU1WsxzQqVDyjdiSr8RC4D1o3Oy+6RPnDURf+cl319qvECX8CyQKqjsLcaSxWqtABbY
         cRf5zEEiHu0fNotxOqqj/4SgT9qfeXWOU9pe8VhYTZqrYUa1lZ4BvBpx2up/K2FgkxAa
         sxDA==
X-Forwarded-Encrypted: i=1; AKwUvBxwXFSN/sEgPEo3nsC0amv0qh32B0JTrbVPzZ9R71WGonVAntL/gZ1X5QbDwvOo/KnPLgO/jwp7UElJ2hw=@vger.kernel.org
X-Gm-Message-State: AFuF++maFjsqtDc/hNqoyM/VU/2KXYECp9YFsq+hOhf7MXHB4bwlz1pc
	MkGf4EysIPotgNtRvUjmw7qfQbwhqerSUZRibOfdFLCwIyxlDWRjaeVQyThwCx/WvQWa7o2GTjc
	OCkEf9rxTcqiVCFzRGZcHbOi+qnHGYaFzf4K/mCrL
X-Gm-Gg: AYBFou3yRC27elj6Jg2R0UAZozzsfD5Ib08MHZTqW5OaXv5EwTYiEUqIM4n2KoiKBi3
	GNPu9Y4WnWuAdckM6TrPg3EpTgnFIJeR7OA8oSHihYLIL4U2yMjqvbK9/IXxr4BebX09n748iNk
	99kE0jiaFZ/lTuYIiqwoBUUYjvjqS7p7KWJV+ClR0ct7fKuGjGRT9gXyAyq695KmRp4Ld4H+scZ
	tS9neIfcZjq7CrlPIwaFiZD2R8bHDIaGsQPEVsM5NSSd8V3zLWBVBTkjeBMEQblUzUKOWHTVg3o
	IhFcFZM1urbA7tDqbDd9PYXVHeED7M5y0xhxq66t1iGQ59XQco4uV2CbSRWV81W5YeCHAaj29mK
	LG8Ot+jHwYBdlhudplyRJ7mpFpkb5+hZvBzBwuM5m9q7Dx6PFkYGQ7HuhTgObHjhyDmVGaNCCg2
	9pbvce5QeiWLnCJ+KBU8uSON6POCQCJgU=
X-Received: by 2002:a05:690c:c045:b0:873:5bb2:6c1b with SMTP id
 00721157ae682-89226db4172mr1528937b3.69.1789515847086; Tue, 15 Sep 2026
 16:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908060410.3982-1-nashuiliang@gmail.com> <20260908133636.2ea807d9@kernel.org>
 <CACueBy4BvJ6E0RuUDsQmwPq_zt9Xh6T19DOAkA5MW-uU1yNpKQ@mail.gmail.com>
 <CANn89iKYQMPm_LyYY4v48QmoFc0MwkkKQwggd_BLGDJL78=8qA@mail.gmail.com> <CACueBy4u-2yHHysZvs_a=VQLe4PtY9-qjkdZ3gFn_eVKmyspOA@mail.gmail.com>
In-Reply-To: <CACueBy4u-2yHHysZvs_a=VQLe4PtY9-qjkdZ3gFn_eVKmyspOA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 15 Sep 2026 16:43:55 -0700
X-Gm-Features: AcwNN1XvjZOB1E1lMNws61UgnRr4-SLHJpFjowvX10dxrWry6rWUlTn5Utv135Y
Message-ID: <CANn89iJkPPXruitnot9D28Xe5LWnD-irtgCUEOpmFfVkG4M=-g@mail.gmail.com>
Subject: Re: [PATCH net-next v9] net: reduce RFS/ARFS flow updates by checking
 LLC affinity
To: chuang <nashuiliang@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 5:01=E2=80=AFAM chuang <nashuiliang@gmail.com> wrot=
e:
>
> Although there is a slight semantic difference compared to
> net_hotdata.rps_sock_flow_table, meaning the CPU recorded in
> `sock_flow_table[flow_id].ent` might not perfectly align with the one
> used in `set_rps_cpu`. It is still the least intrusive approach.
>
> How about the following simple change?
>
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 3a0dd1f98084..7c513bf14221 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -5236,7 +5236,7 @@ static int get_rps_cpu(struct net_device *dev,
> struct sk_buff *skb,
>                  *     have been dequeued, thus preserving in order deliv=
ery.
>                  */
>                 if (unlikely(tcpu !=3D next_cpu) &&
> -                   (tcpu >=3D nr_cpu_ids || !cpu_online(tcpu) ||
> +                   (tcpu >=3D nr_cpu_ids || !cpu_online(tcpu) ||
> !rps_check_llc_affinity(tcpu, next_cpu) ||
>                      ((int)(READ_ONCE(per_cpu(softnet_data,
> tcpu).input_queue_head) -
>                       rflow->last_qtail)) >=3D 0)) {
>                         tcpu =3D next_cpu;

This diff in get_rps_cpu() has two issues:

Boolean logic / packet reordering bug:
Adding || !rps_check_llc_affinity(tcpu, next_cpu) inside the || list
does not prevent calling set_rps_cpu() when the queue is drained
(because false || queue_drained still evaluates to true). Worse, when
!rps_check_llc_affinity() is true, it short-circuits the || expression
and bypasses the input_queue_head - rflow->last_qtail >=3D 0 check,
switching CPUs before the backlog drains and causing packet
reordering.

Per-packet slow path:
Even if gated with &&, skipping set_rps_cpu() leaves rflow->cpu (tcpu)
unchanged while sock_flow_table holds next_cpu.
This causes unlikely(tcpu !=3D next_cpu) to evaluate to true on every
subsequent packet for that flow instead of once per migration.

Instead, place the check in set_rps_cpu() under #ifdef CONFIG_RFS_ACCEL:

diff --git a/net/core/dev.c b/net/core/dev.c
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5113,6 +5113,10 @@ set_rps_cpu(struct net_device *dev, struct sk_buff *=
skb,
  if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
     !(rxqueue =3D dev->_rx))
  goto out;
+
+ if (static_branch_unlikely(&rps_feat_llc_affinity) &&
+    cpus_share_cache(raw_smp_processor_id(), next_cpu))
+ goto out;

  rxq_index =3D cpu_rmap_lookup_index(dev->rx_cpu_rmap, next_cpu);
  if (rxq_index =3D=3D skb_get_rx_queue(skb))

This skips ndo_rx_flow_steer() when the CPU servicing the current RX
queue already shares an LLC with next_cpu,
while still reaching WRITE_ONCE(rflow->cpu, next_cpu) at out:
so subsequent packets take the fast path (tcpu =3D=3D next_cpu).
