Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306615;
	b=CM54BO9lra8LMOiIHtUJ90J6z39TlzDY2yrIfO4dcOAcnveAlk8wTbiI9+7h/KLodilZ
	 MTJm9kILU8auVzXieRstuB1NKCXEj7dpDyoqgzsQ1blEJs5y+XDM/Uc0u9vToHdQ4QseH
	 qRK++ik/bg9oVuM4J1i2BJRoiimWa2NDmk7JQqJsHBj9gKcLJ3m6x902EIDLug50b6+Dh
	 GB9pYahnrYGGqYeLPTQBYYC19w3g3E5Cd6ZgmvEqx9NzlKvqZoaTdOyIT9eHJaCTcI5ov
	 dU4FGpqLxmvTjel04mxiKqYvxFz2EfCcU2JlaNcR5cMQd3giJPtSptO2QiWQZnrCBLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=zi+Zsq/PpxVfP2QTeVnAcqL73Etz3B0CnzQ12J/UIHw=;
	b=MdPGCaSbJVKDdsgWYssm3UgcJclaveeBNsNFcz80qcsgnLWaEgy4Ay5zs5b3448f7kes
	 HGU8uC+a5Su5FkXEv2xCC161O0hXC7iz8xG03gNzMi2c2Ykn0fd+LrOvSAyTyzOjBZ0pb
	 mLjVQleI2u0GDN1bBlwGb3ny2VVy9fsjhw0vD6hTEBHDmH3POPRVPnYxgkF3uO2nU2PiW
	 Vwjr1vnWUIJEBQQwzB/p4GHLUXgXX3baz6Q7hKe1JU6lQHCP+CYnuoUswR6bFXm/+lY3m
	 m9l69BSB72kKnf5m2NpRv/bNL/5SqfPqK+uLtk1YCZcxQUEcsejKGbnCD/5pTfKRElg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kwvx5BjZ;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE3606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57AE3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kwvx5BjZ
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f3c89594cso142069285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794306613; x=1794911413; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zi+Zsq/PpxVfP2QTeVnAcqL73Etz3B0CnzQ12J/UIHw=;
        b=Kwvx5BjZ2evAT3Q9Yj2Ow+4dEP2dZiu3wvCKtvQz+Ysi1tT7TwtQBuZIZ3Y0/mi3Ds
         aedjON8EDZmp4KkhzGKqaUOe1fsVA5cSLBQAkOsvzw5o6pXQu3oRhOqbpw+hg9afEbY/
         pQvPgUcILsLmHMNunvW4cOzTchoaoZ2e0mrTsymAmUt5s3bf429IDtO3e/mPmY1iN0ar
         /tKkVO6T8rdJZ8wPERNAKH4ajWLt+dE87yoAoz3IL7y+ZWshNMycy+SeJusY0nfQiqin
         Z1ePlSRrmEt67Fd9Ci98ZG+6zBno9H/ZJVJ679jCeI8fkQts5wFSiqqVOfFP24Ac9HvW
         tNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306613; x=1794911413;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zi+Zsq/PpxVfP2QTeVnAcqL73Etz3B0CnzQ12J/UIHw=;
        b=e/p9JmD+GiTP4PmPPPWrIh4WvhOYEGF85UmDHMEGvlOffnnmjrwUjkbxgf1v5BDO4w
         zJQ28aOPldMZPdnAcxlE6Kvpb0FUMov8CWgQpxNxkiqzXsUKUFvNn0mvBAfKM7X5w8OT
         7IRWXIL6DiWumcmJSlNn88+j2sScMH1O7TpPEWoQk3X8POjWhHjkdBOpazD+dmp9prVy
         CpsuPgESytBT0feeajUfurMb5bZo/d0n2tBFCuHYGEnRdmTjM5azTm12Vi4kepmwnc9b
         2qyLzpqVIzLghacODyUIdPSAv85tklAKimCLJbMj/uRvpCU+wAqqsxyjBcbHy0rxsckm
         QLRA==
X-Forwarded-Encrypted: i=1; AL+hErFiRQIWvoBLLPR3XWsG8T5eiQh+0nC7RnrsHeJvBCEJpm5N+BP4TX+F75skNvDvs4fvPoddk3nd4tHnUdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NesAy8ae6YBZM9y4544JAoYTjBVkhv7xPE9qLBz9aKv2XRBcU
	jr7R72WwuJXD0XyIcAh4uqHW7h48PmV0Ehr0la+B3X42tlHg9UdLacAL
X-Gm-Gg: AYBFou34jmxElJsO/z6N0prZFDoBjZ6k7H8nuaydMsTDyXK/U0K6+5+vQDAzIScb50T
	JxTtuBZcAAwGAK2F2DvNi0sQ5aJ3sqQ8LMFknrM0ygZ5ZwVaX2LqjoUvUiB7tkEHEmp4W5cxA/K
	0lhN3/qAqfowgLjpPkHH0z5rLkd+7DImB9MYSz3WkNtwwy66IJOODlbY1H+ozAaP5eFmSPD7uUk
	HFIPO8N7ikwf2D9nqEA0WlcNeGEIuSxavoQYS3kCDCvX0U+KZy27TPMZJbbxakPZN2f9LaXTT13
	Dm3gJYqKMmJX56zbWf2g26X1QuvsE0yKKoSAK+7OcsCrPI+MxZcKkcVSCXeU4TV+iP3eYhGjZdl
	oghftcMrj/FCwHMidhNuxf/Al7oZTTRiovdCJrurKEJQfyfZYqV2DQUj+ezmcdeVDyXnJYoqUP0
	7ZAE+Lk5ZZL2KUVK8QllZw4QWtJIz/OUZIqPCZipM7/+/Ns3/WuZ1xJ2BuHxryZuyO4lh4n/2an
	WRxhjfjOeqmNuOydVhQqr39h3r5Uxqx6ubhg4/dlPmC4wD1gQu+8jgIndmuDqaFiyL/5FXjR1VC
	9qF/CGOF3V3bE1M50rSQNiNjKg3WZYno9A==
X-Received: by 2002:a05:620a:4047:b0:947:826d:15e4 with SMTP id af79cd13be357-9479f4317a3mr342618985a.76.1794306612793;
        Tue, 10 Nov 2026 02:30:12 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef43519a0sm9282416d6.3.2026.11.10.02.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:30:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 05:30:11 -0500
Message-Id: <DMRGLXRN47F0.EPQ8KQQ531FL@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <pabeni@redhat.com>, <dimitri.daskalakis1@gmail.com>,
 <mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 2/6] eth: mpnic: Rx checksum offload
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-mpnic-lso-v1-2-e943ff1493e4@gmail.com>
 <179426706505.994134.14903670095120167303@kernel.org>
In-Reply-To: <179426706505.994134.14903670095120167303@kernel.org>

On Mon Nov 9, 2026 at 6:31 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The CHECKSUM_COMPLETE value in mpnic_rx_csum() is only right
>   on hosts of one byte order.
> - [Low] mpnic_rx_csum() (drivers/net/ethernet/meta/mpnic/mpnic_txrx.c)
>   sets skb->ip_summed =3D CHECKSUM_UNNECESSARY and ignores the full-frame=
=E2=80=A6
>
> --
>
> eth: mpnic: Rx checksum offload
>
> This commit adds Rx checksum offload to the mpnic driver. When the
> completion descriptor's l4_csum_unnecessary bit is set, the driver report=
s
> CHECKSUM_UNNECESSARY; otherwise it reports the l2_csum field as
> CHECKSUM_COMPLETE. It also exports csum none/complete/unnecessary counter=
s
> through the netdev qstats API.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/=
ethernet/meta/mpnic/mpnic_txrx.c
>> index edb087b12a1e2..680625810ec03 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> @@ -655,9 +655,34 @@ static void mpnic_put_pkt_buff(struct mpnic_pkt_ctx=
t *ctxt, bool napi)
>>  	page_pool_put_full_page(page->pp, page, napi);
>>  }
>> =20
>> +static void mpnic_rx_csum(u64 rcd, struct sk_buff *skb,
>> +			  unsigned int *csum_complete,
>> +			  unsigned int *csum_unnecessary,
>> +			  unsigned int *csum_none)
>> +{
>> +	skb_checksum_none_assert(skb);
>> +
>> +	if (!(skb->dev->features & NETIF_F_RXCSUM)) {
>> +		(*csum_none)++;
>> +		return;
>> +	}
>> +
>> +	if (FIELD_GET(MPNIC_RCD_META_L4_CSUM_UNNECESSARY, rcd)) {
>> +		skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>> +		(*csum_unnecessary)++;
>
> [Severity: Low]
> This isn't a bug, but should mpnic_rx_csum() prefer CHECKSUM_COMPLETE her=
e,
> since the same descriptor also carries MPNIC_RCD_META_L2_CSUM?
>
> The commit message says l2_csum is reported for every frame, and
> mpnic_csr.h doesn't define a validity bit for it. The comment in
> include/linux/skbuff.h says:
>
>  *   - Even if device supports only some protocols, but is able to produc=
e
>  *     skb->csum, it MUST use CHECKSUM_COMPLETE, not CHECKSUM_UNNECESSARY=
.
>
> With the current ordering, every TCP/UDP packet that the device validates
> goes up the stack without skb->csum. Anything the hardware L4 engine did
> not check then needs a software checksum. One example is the inner
> payload of a UDP tunnel when the checksum conversion path doesn't apply.
>
> The in-tree fbnic driver uses the same pattern in fbnic_rx_csum(), so
> this may be intentional. It still doesn't match the documented contract.
>
>> +	} else {
>> +		u16 csum =3D FIELD_GET(MPNIC_RCD_META_L2_CSUM, rcd);
>> +
>> +		skb->ip_summed =3D CHECKSUM_COMPLETE;
>> +		skb->csum =3D (__force __wsum)csum;
>
> [Severity: Medium]
> Is this skb->csum value correct on big-endian hosts?
>
> mpnic_clean_rcq() converts the descriptor to host order first:
>
> 	rcd =3D le64_to_cpu(*raw_rcd);
>
> So the u16 that FIELD_GET() extracts from bits 47:32 is the same number o=
n
> every host. A __wsum, however, is computed by csum_partial() using
> host-order 16-bit loads. The correct value therefore differs by a byte
> swap between little-endian and big-endian hosts, and storing the raw
> field can only be right on one of them.
>
> The MPNIC Kconfig entry only has:
>
> 	depends on 64BIT || COMPILE_TEST
> 	depends on !S390
>
> That still allows ppc64 BE, sparc64 and mips64 BE builds with PCI_MSI.
>
> On such a host, would every good packet reported as CHECKSUM_COMPLETE fai=
l
> validation in __skb_checksum_complete()? That would end in
> netdev_rx_csum_fault() and "hw csum failure" messages. Decap paths such a=
s
> skb_postpull_rcsum() and pskb_trim_rcsum() would also adjust from a wrong
> base.
>
> Would a conversion that keeps the device's byte layout help here, for
> example (__force __wsum)(__force u16)cpu_to_le16(csum)? Alternatively, th=
e
> driver could be restricted to little-endian hosts in Kconfig.
>
>> +		(*csum_complete)++;
>> +	}
>> +}
>
> [ ... ]

pw-bot: cr
