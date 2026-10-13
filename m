Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B47442902E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888217; cv=pass; b=W3YsJpXQMB5um/Tqpk5hma1VjTRg2aaeMsVtHq6HzpSROMYeirGn3QxC+tIdlzrbQ6xkTxdMBfiOTbnivj862TZP3WBkdCdbw1R0gdy8Ch5rS6+Jb1MzqDBaqEbNbz/wO1aOWntnJpLkJ2CP0IOA4HWh0hnPe3nDAbyH/1ufY3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888217; c=relaxed/simple;
	bh=rUqmGo5gmll+GCaALoJRbfek86ESyi36pidayRfvfM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWlwyGdxNaBWFBha9kh2vXATftFzqatusOO/p9Z7vOgludIax9eBBzlOTjGyfM7mVl6H42YEDINDUMPjA0IbGKrdNjP3rgvt6U9gmOOFDrkrlMJ7fi22EFNj3nuMOu8+Sm3pJc+A8fTGym6dLX1mVVYd3VaVRbxRk4ojfQhQnj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9JKuDu0; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9JKuDu0"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e38b61974so47315566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791888213; cv=none;
        d=google.com; s=arc-20260327;
        b=iM/5AEwZilCIsCKIaS4jpo9aITEPXUQaeWUvVFZB04SqRUgfaCzZI8SguQcBGGuc6V
         PZVRpCLuhssaQblbLnjMX1AedJigBFVALwW615eavi10PovmmHI32HyPKEDNA5zvPFsS
         SrcemYMPzzSuxTi2kaqg2dD4VO7GW5mHtDxSghOrvTtiUrUD2aL/KWcNlgURSASmK6NB
         Hrt7L8MTu3iDlsFUR9fvA1+6NnN9PMUicVeDqWYymUXmN0UkEo1gCakndNczbmfboU9l
         pgxg6WRZcBJNZbuQrdk3/ozws8S6jmbVaQPOQT3qfi+UoYVdU3QExRpNfWGubzLpQGVJ
         qFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUqmGo5gmll+GCaALoJRbfek86ESyi36pidayRfvfM4=;
        fh=iteBiVeMCRFDdJz9nLl28dAajeLPFD9Fe4hBsmCuytc=;
        b=UePLtSTrCkYF80s2yE7Rautmi9DpTRDwsUz/iazE26UPMkhc3WB4IOOb08jB7Dv3/e
         nQEhghMsZq1XR3niIPTqVDGiB0tfYUGvG//UucnomscvyMVDmQUfDKylR30MOmsVrsAE
         MfIlqcuKY9E5KDWtduoSSyQlaDLL//CQxGv+zs7jE09IhYNKHG8HYOCCGguR47t+hAyJ
         q6UeK8r4A5LmUSFqMU+L198SIo3XLWUEMsYJzL0mYQudsnKtNVWH54hPyy5pGmRZ0Hhv
         05Ywc16GJ48RT8UoYZx0ssi0vbyxpy1XflyzrmKxmESZ28/sAGWLfs9OtS/lq85ZsmHc
         KmgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888213; x=1792493013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUqmGo5gmll+GCaALoJRbfek86ESyi36pidayRfvfM4=;
        b=a9JKuDu0SiivLt+mLksbpd/cL0Ix5TymRLUpuuGfUMEF53taMb/ZGXnzUGm3EPCzLh
         3ZcgW1dw21t+Yur5pA/4H1mOqZNN9Q+rO7gM1DHbah6Upn7tfQeMfFnGVAjbcml4yDDx
         4m2lcvDwoc1VSxlu9/Us/xe/9Dt9ayL6T73pjFOLpnhkDj54DRiODTl0Eu4CPJi01jmj
         GpKp/VM9PNc/7l7cNhPau8fK2oaM7/D6DlEF4wfcSyaymbklitcuzhtw1/poKktPEMgZ
         AswDf97ldxvngcq5kcwMHe500hhGvnP9Q0pVS1NbKQETfE6Ox+dnXinZth16C1WtCJoX
         MelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888213; x=1792493013;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUqmGo5gmll+GCaALoJRbfek86ESyi36pidayRfvfM4=;
        b=jKUqtsaJbpYUBs/8l0o1pdC4ziqSCQ4FJVXpNIO+3dw7A7Y7798CCx7EIkaYHFMrPa
         +r56lIy3zbxjd4FqKDuGCTwT81Wg6F5alMgpLJrtUxbZxG8qAiAM3M1SQHWAu7iwjc4Z
         L1+lH4khaPpGfPX8KlyUVwiVNWs0h9FBKJLtXEc7SM6kGQatojHBUO1trgHq1mxmG2GM
         6l9y7MAxZythwlGHd1qvUdFgXfii4TbvPqbtUNo8ngXU7C8cdmM4oGEh8Zw1lrlzyxVX
         4T7T2MwsbHw+w/dN/F7TMWlJhKpXscdwPzX2Qr2eXnTa+CSfqO0eNXP5FUh7FdVgqHac
         g+bw==
X-Forwarded-Encrypted: i=1; AKwUvBzfFCXWo/SR9eB6r52tKPkq2NQG2o9dVF4Zbe/YjlpusWJ7iyANSt3K+tY7covyGrvqXUiFT3U/brBiL3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZZAr4ZJlzihrPOP3Wvn6bc4mimh8EitQUpuCkQMug3+K5/Pz2
	PAukSKyRI3UaQwuG9YB4xiXuz67/j72E2XOwiqR/lIeIQHmezeEyQY9EYvz2p8zNr1Tz22uxVWi
	R1B2cO8iImqcBAdopenV/BFxSam33I7I=
X-Gm-Gg: AYBFou2Vw9y9aKkyTalTt3NeMFrPES00ZafQODrFekcM+64pZK/EKAHbcqC+cOup/Vv
	REk6Lv9VyF0DSIu0tBRFhrTd3QrbAsYemhjBf/Qr/0RVj+fSRseQEmtoGOx3qiv2edYj4zZc1E6
	viAcOonWG2fiADf2MrLSu8vqkNkqBE5P9a+5phfauEccO0hv8NjT/KGavhEWDszSOAs5jumE5rO
	JecsV4Byam9Uv/hdI1U1RZYPSOa1OgpL1xA+3BGkigWB/qJ3LxHxMteX41Ynrgv6qTV9Ub2S80k
	YPpJQISNYBzO21Anh4SunsUcksG6sGCfwJmWDzAj+aOzLAQ6HWDiy1WN3EEdQYHIkSYm8gOVD31
	hZihikEam
X-Received: by 2002:a17:907:3cc4:b0:c25:2ded:ad36 with SMTP id
 a640c23a62f3a-c31a96e7a46mr1286808066b.0.1791888213256; Tue, 13 Oct 2026
 03:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824152331.216494-1-nicoyip.dev@gmail.com>
 <f3a9dd1f-43a7-4644-bf1a-45dcd422abcb@redhat.com> <CAAo+4rUG_Y_d28bLbQdcmHY5-vtBrhV+D6rzbd3Mb6B3iTSuHQ@mail.gmail.com>
In-Reply-To: <CAAo+4rUG_Y_d28bLbQdcmHY5-vtBrhV+D6rzbd3Mb6B3iTSuHQ@mail.gmail.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Tue, 13 Oct 2026 18:43:21 +0800
X-Gm-Features: AclHuK9kgucNW_X-CmFkUz3aZTCU9FnPnXOeZBb7AYpPKDF7GSiLOX-F6v5amrQ
Message-ID: <CAAo+4rV1zx_U6Er8eDE0JW2f6jBXY6gmhnncXKvycn98ZjXG9Q@mail.gmail.com>
Subject: Re: [PATCH net] net: pktgen: keep device lookup under RCU protection
To: Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Qi Zhang <marsy12010123@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Alice Mikityanska <alice.kernel@fastmail.im>, Florian Westphal <fw@strlen.de>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 2:55=E2=80=AFAM Chengfeng Ye <nicoyip.dev@gmail.com=
> wrote:
>
> On Tue, Aug 25, 2026 at 6:45=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> > Side note: returning the RCU protected ptr outside the RCU read lock
> > safe, as the caller never deference it, but quite confusing.
> >
> > It would be nice to follow-up on net-next replacing the return type her=
e
> > with a bool.
> >
> > /P
> >
>
> No problem, the follow-up patch is just sent.
>
> Best Regards,
> Chengfeng

Hi Paolo and Eric,

A gentle ping on this fix, which is still marked Deferred.

The requested bool follow-up has been applied to net-next as
2a5043c8b7d0 (https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-ne=
xt.git/commit/?id=3D2a5043c8b7d09f2fc76c19270fd687b774c5a68b),
but the RCU lifetime fix remains outstanding.

I rechecked this original patch against net/main at 8bf659bd54e1: it
still applies cleanly.

Best regards,
Chengfeng
