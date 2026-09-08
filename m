Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85999513552
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858739; cv=pass; b=TCuSes8GeFX81Nqief3gmmCVTlpAz3oCkMjeEofRm69rO9jWlXee94VP71rZ0TbD1BVxRTF8jqrhYjlq6zm5k+8Rx9tzZlc5H+n1hdDv6Uz0co97NJk5Zp0sBmXX3opvKbKfQ+hiDspIOwVkBUr1X8+QHnOzbtGY9CWe30ZkKHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858739; c=relaxed/simple;
	bh=Ln5N6LgmXlAc04GlN1hKzCJC1CG0QgHSWv228EdYC0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4jP1wa39INy+eQnEdHvCqc9VylBIqXioz6H98q6QsaRo+Rd14LsPbjimJqAtJQMbKLTdpcQYjfgLFN7AkMq2/D+NoysBnb8P4RoGleLyKRnV9Aqp4NzrzeCfEn6lQChaJe8mPnJt/WpzX3KcMXAvZB/PyUt16HLPwAgHQan4z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=XWHIuzgW; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="XWHIuzgW"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a34f7ebcedso36992361fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788858735; cv=none;
        d=google.com; s=arc-20260327;
        b=AyzfNvaQoRKbVYV3AtpnEaS3jqiCBAmiWfT2ct3p9VDSnprv0ZzU3OcddPHfc/3SSU
         rLWduJ1rlqC9Xv/JBoZXlbvPHw+TyuUWD83BOBOcWq8+A60VfVHKuAgR6K8jdL8hZ3pz
         FSbNsYNHyRp0hpedJKOOi8Apm6PV4l7z5QY8oZ5sn761yiRyvjFIVM6QwBSrahvTmu9Z
         9WJ4A7PjrlFhTx737UiUzCdsdh83V5meqZCZbgMGCHu1uge286e+t/p4sEkhCIO1W3Al
         jPdV+DGfL//FTJxNcYVfLP8bX78jg11M+dKhdL8mQ4UnqOctA1OegHa1jEiYcljEhCVf
         Mbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zp60sdfO4ardVW9ZmRnEnuo3Pw/0xpFjf52DftQhuI4=;
        fh=W5Gu2UGAm5EGzXaaMbSiYVTWrEYgDy2m5+Ll9GA5WVM=;
        b=DDyaeWBrw9SBMrghn7TU183rCdHcC3ul1IfIdDhIVGAaOvtUZR8z1RFJ/R7XxneaJ8
         W/LYVmcxWZx+AB6pqslvHmcyxgmK4jcp478TsOM0whOKtvObhquWtnJoJFnMsLVBJjeD
         mHLlEmYAYNenDdbcFc1zZ+ILxLRtMuemXh7F+c9eqk+Czty9pxQ9fbLmOfk5QZv3y+pr
         Mv2oIUAs8+uY6JSckUSrgZDQ14tD8W22jNVibzls2jUmW+tfO84rjFCX2xCVnZmgmi5M
         edrpa6Rv+qTS0azz0+imO26bP7hLG+TyLAqfGB/1f6HXWkafxPjAgNfxtJHqPzuKTXrL
         +CAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788858735; x=1789463535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zp60sdfO4ardVW9ZmRnEnuo3Pw/0xpFjf52DftQhuI4=;
        b=XWHIuzgWV40PFZ8HPljurhBn5rj4tX5+v4D1AAgPD9oF5RjjX7cGD6VoIM7sUJCYxl
         tapys12u9HlnRNugcNJxHtcaznVRbb2P20a1gUtKD1HxdrYUbfGdscSYNzNCF2pZDiWh
         VzxgqkG4FJsgRK1Py2Rjw77ZKO5xc3XPluYMeH2BmGqFSWx7UFG3XihONWmR2TZYFZhV
         8Ral2z1fkcz6QYhFQTlD6Z9xizHPgRO8j7wAacyjTiheQumt8AdEigf/ni1T0p5gjavL
         MpUn8X/UayPl5CMEvrXDOvmpaY9KomOxEuzi74PHJUROjyhnT01CNBgDIA2UuCuQl0Ks
         3xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858735; x=1789463535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zp60sdfO4ardVW9ZmRnEnuo3Pw/0xpFjf52DftQhuI4=;
        b=MjjNKQ7MV2+wtunzQ39Yy8jl5XVvE1b+O1ob9/0yHkf9HY1vuPz475RwsxzSWscD2d
         4vNghPD9D58eRmk5eDTlzJ/t5BN7JK9js6b8zV/Ivl7fg8hIo9rNcqWErEXCT+e9EanY
         4fei+xJis6rXnS3pjvGYdIpCuvYoT//Tc4CjdsAcu+g8gs9+t3FFsB/qlijDpI65oUg1
         drlSq57bK6R5EnmTHTUJvI/c5IPU/KwN3pMbZq4nN5Tb0HcXeXqBg6bGmcRWdrtNAw5z
         4wQYSX6gFhww4Vyli3vJneFYQrW2MgtouHKNhgTpsl9SHlAI8FGIMYC1/2o9JJ+rda7A
         RvzA==
X-Forwarded-Encrypted: i=1; AKwUvBxDy5fKaQP/5nCET0k2EtaDK2TqiN0Faoas+X5XaqY3OYdo+7/HfVOnWKno+ZV6pdrxWkH9UjL3RtiUyIs=@vger.kernel.org
X-Gm-Message-State: AFuF++n0UQVhjtP04xyagHxabuVizZivmnmRZtDpN3+My4743fk9snZ4
	0MmzNUkNn4fwQu4RcUjMHn3DyOSzOVR7iO+SQ2i6LXODAUeTw/iA2mdQmg9kYjHEycSGeFMcBxU
	7TkmerpZVXb8y2cM3kmMtYCg8JyaAIdgBMHetyl7Xb6Lr5EaoxXZJzG945TMa0A==
X-Gm-Gg: AYBFou1iZCRBrjsiftEL5aG0d9jWKFw9URCmMVWqR6IX5GEwpo+F2BGaIli4DliWQXp
	MgXWTRlURS6/NEkmmGT1WZeQPfrb3FOYq91IsqAuP3Id/reVjg+R0muawWR4BXQa0v+tZzhkGj6
	7ZaFBMDhohkpId3WYl+oTds4rOhqcL3uwNofHn4eyxZQCOTxJp/93c4ocVcWrtoTsDbTtG03U0L
	DdtXH2qWhCEAigdVeVETfqk+DDOhQnbEOk+QNPo9AIN3wMOgvNZYRJiemtoVrlzYqGd5ItWUL36
	vL6UbBsfeWrCN85S5Y1dkELg7v8MsBZxJHOVJFOKc6WXOK3Huydg0YdgunqUOW6bTwOzxQBBhkM
	=
X-Received: by 2002:a05:651c:2214:b0:39b:2ff8:64ae with SMTP id
 38308e7fff4ca-3a371baa751mr31491061fa.9.1788858735444; Tue, 08 Sep 2026
 02:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788539302.git.zihanx@nebusec.ai> <a2bd6f3ed29919a7328363b548299ae583f052b0.1788539302.git.zihanx@nebusec.ai>
 <1502561.1788855907@warthog.procyon.org.uk>
In-Reply-To: <1502561.1788855907@warthog.procyon.org.uk>
From: zihan xi <zihanx@nebusec.ai>
Date: Tue, 8 Sep 2026 17:12:02 +0800
X-Gm-Features: AcwNN1VjbRsYQi4-L2RFvdf4MtUlRnpbC25DyHdWsl-aWFY71LW8z7GWMLBUSh0
Message-ID: <CAANe3eRBFAMdZaUEL_ds0xc2N7jC8gOT1NTEynY2oCQimiv6Qg@mail.gmail.com>
Subject: Re: [PATCH net v3 1/1] rxrpc: fix encap_rcv skb accounting exhaustion
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:25=E2=80=AFPM David Howells <dhowells@redhat.com> =
wrote:
>
> Zihan Xi <zihanx@nebusec.ai> wrote:
>
> > Reaccount encapsulated packets against the UDP socket before queueing
> > them on the RxRPC local queue and drop packets once the socket rcvbuf
> > limit is reached.
>
> This seems reasonable.  I do really need to add separate accounting for
> buffered incoming DATA packets and for all other incoming packets (especi=
ally
> ACKs), but I think that can be done after the skb_orphan() point you add.

Yes.  Once the skb is orphaned, that split can sit after that point
without the UDP rmem charge following the packet onto call/conn queues.
>
> > Clear sk_user_data under RCU protection and release the socket only aft=
er
> > the local queues are purged.
>
> Is this actually a fix for a separate issue?

No - it's required by the skb_set_owner_r() change itself.

skb_set_owner_r() sets the destructor to sock_rfree() and does not take
a ref on the UDP socket.  The old rxrpc_destroy_local() released the
socket before purging the local queues, which would be unsafe once those
skbs are charged to the socket.  rcu_assign_sk_user_data() plus
synchronize_rcu() is only there so a concurrent encap_rcv() cannot
attach more socket-owned skbs after teardown has started; sock_release()
then waits until those queues have been purged.
>
> Anyway:
>
> Acked-by: David Howells <dhowells@redhat.com>
>
Thanks for the ack.

Best regards,
Zihan Xi
