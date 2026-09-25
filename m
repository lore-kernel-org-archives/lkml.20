Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA982765DF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297848; cv=pass; b=cm+NJsOSBtcPEynZdN14Qqkuvfkf+rSYKNoD2o86nn8aoxNdE4tsowojlaTIdOSg/G/ZZ4R9KmAnPo53V4jb9pAYLIydiE+3CKog0pRNtbXUy9Llbr9Wgw0xeawidH4TnaqtFEeKtlCvHIGIG9xoPMCnaLSSY5XQABXksjc5wDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297848; c=relaxed/simple;
	bh=lBKA7hzH9pjhlzdMFfbHz9SVC1DDES4LjTgOQh6PfRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWLdtRBZjjYHrp/hdubN1+c2wlcxY4SZj2jIKvkJTvVePHFT8Tfejry8AfKaCgY09cAJ8+Asfij1gyBU7cJhsPjtpkQkZhSZ2NzyEE6aLwoZtQC8lTDfloGN9fBgap6svxqpu2bAoLxpRVdRmmu0ruYuLDl3VAfj7wiFxSPVGZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tl5pBI9m; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tl5pBI9m"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ec395so3640741cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790297841; cv=none;
        d=google.com; s=arc-20260327;
        b=OHWtkQV3p/tZ9OczYnJRUwsJgboFSFPZVfS7rz8ili4q/JLl89ipkF9QyMNlJ+eWzk
         V9OHbIcFj4m8xnF/0UBD0UC8wJWePTNCgyfCwSHLvFjx0TGp18OAHhqxgQNDK1Uq3htO
         mm2UzFhYSqxUEzy33Rd4Z1ydJ33b6s22pqMGeVBqnlfytjA29vpdCIYPGU7DDcuRJ+x1
         lTuNtEswAWlD7zQA2Qs6uiaTcfaJmZW1etrHF8puaF9P8D51kIAVX4f1JWxuJ7oWf1EJ
         47/iaL/3PuEXoL7b63TszeVOB5cpID1TftfUt/sdndsHNwzzWEtd84bf3pePYpJ8U4hy
         n8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pyGHIFbtinRqwaj+Qg/alPqYKdXRt+R/3/nBOW/8Ig=;
        fh=BdS/nTL1hsKwWti/O+o/3Ljq8Tk5kHXqnEI2AQiBLJI=;
        b=ZcYsJ3Gebh4he2DsEfA1+vDEoLXtiZrx90I8eGjnhg/uyDfvndgsihsUugx/1x6LwO
         WBZnzSKNNG70qjpbAeURS0UxNJ8lpEHWhq64Ib9QWBCCcaPMmFbdClIzxYNZNypNQGb0
         EYbuaNsYiX8XrAVrkbrUpH2D/r29b8NhuObQV2JJiRLzi5q//wMPyQUrdYZlqpuVXKYH
         7/J2eZxObELKNnROdpi6hADYkeECsIj+OvZhO/T1K2Zx1JWx4ne5LGBQL1bELGfUbKBR
         7RWZrK3jpSLNom7I2ocUSgFL8iIQ9837Hj+woL0tOLDLzLDMpWr/KO0pkzMP1xE2+E44
         vGow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790297841; x=1790902641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pyGHIFbtinRqwaj+Qg/alPqYKdXRt+R/3/nBOW/8Ig=;
        b=tl5pBI9myxJmXgJ3UpcupUmaHIvZ+JCD46NF0/GP/PkdSPuIx9h7SYiTJitKQtj6d/
         vB6vCUVUmj4E6RljHfN5x44zbL+y1Gyn9138uvrK0yW5Rs7rDcZIOtK10CXKh7wdwmvl
         GxGH5hLoPRk6PkecEj203vMAxFWIG5WV/RLoyVcDvPjRSEBl/Eiv2aCKrU0e+WBOWxlg
         c71kx4LsHyRPm+a3RE/RY3WHtXk5gRQPEyEEKH6mF+sQVGkesdZ0hm9R22wF+g7zcymp
         YQyyiS4m+BRyq09anP0UG2y0+1/eiYzxj/tDjOw8KgjR4/eISGMIJGxPv6BFtD3qUVaV
         Q65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790297841; x=1790902641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pyGHIFbtinRqwaj+Qg/alPqYKdXRt+R/3/nBOW/8Ig=;
        b=D8olPwxQQoklwu61PT7sse39Lpx99EfmgDIVmTNIiIZtN9KBdMFiOpAM1WLEHIs+UK
         UQjHWCdnCDkkW0kBgKjj0EWvenkxWSh8vy4PVf8wNR/Ivg6dpbsO2rXTcon14yyOrxjq
         MSS/rMaU/affAN9qkeCkz2ODUHh/0RXdvg3omGcMbmb6YMGUs71NXRY9UErLBNEQH1PN
         9ceci5kx8WcvF3ruFN67eq3oL2yz3t79UPNQI+Vvk7WrS/ZNH7QbTfjbnSXETxBgpEvJ
         pwwYcTJyXR8ulSVDuYZza+mqx7Vp2FSlanNlHToIKlbTxjUi91dbySTsCMJ6m3M8+nBI
         WScw==
X-Forwarded-Encrypted: i=1; AKwUvBxFCLRXSSO3FHTGyrEkuk6nwtQWFvYbrd+2CALeM0v1dD/zxCBmxxRCKnkB4uRo4jQ3hpfx0dXsjfcgosM=@vger.kernel.org
X-Gm-Message-State: AFuF++m/vi5vr1AGVaXQUGgyckGr2yUGRuWGEYqMl/nHzBaLJ2MjwBNP
	9OhKVsPuDSeCt75lMYmiBi3MgQNurN7TPd88sEgG+d0dJEC90ozinEbggbx1kG4WU5xp9btlodt
	CuzpRjR3dmRfp18qWeEFQmT0UJkTuSXaiPjPD8+AX
X-Gm-Gg: AYBFou3AHymSNLzNpLDsJ7XvfhjYq6sO9aJfelXPWhqgDypVw6qR+dEQyWMBlT2QfS2
	tZG4b3AackMdWsPLUELIoUChaSg/ngKTMqoSWPixgju0y7SZokFztdQa62pPd59OZSLQ37c0ZDm
	e31QF1D8wV9hTpac/AhTmhaOwpoBc38UfxqYuL/+xwjmyhG9U9jqYibXUZMb//+DJily9agKnIL
	u11wEwUCIGYxHB7XB2763hLaD05hTwDlzpJXH9L7zVQlOdV/BM7C5WsJzWx2g+1dV+KTbdyIImV
	9NUkHsInFNPoflClfGC5UFW1yfJAIgd24keNsdb0ICIOPRUS9RYWyJT/kET9MaST5dWefSC0h59
	Q8qTo1myI2ap+Gc8957wjQaM8xlCtdW2c1GaXZBIlRiPbgMKkpZ6Pxuh/j3l6T8kekUp1
X-Received: by 2002:a05:622a:e318:20b0:533:1038:ad5c with SMTP id
 d75a77b69052e-5331038af84mr2905601cf.40.1790297840359; Thu, 24 Sep 2026
 17:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924224456.55690-4-jeffjo@openai.com> <20260924224456.55690-5-jeffjo@openai.com>
In-Reply-To: <20260924224456.55690-5-jeffjo@openai.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 25 Sep 2026 02:57:09 +0200
X-Gm-Features: AclHuK9i6M-UlXku212en58JsCz_7tBwqq3_4M6DEUdxB18bU5VlwiunFiLOeFk
Message-ID: <CANn89iKF+MD9TDBGb7oXjR5Nk9HgwXF3kB6KV8_3Li=qLKZ5WA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: refresh TS.Recent for accepted old ACKs
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:45=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> A TCP packet can carry new data while acknowledging traffic in the
> opposite direction. With overlapping traffic in both directions, a
> delayed packet's acknowledgment can be older than one Linux has already
> accepted, even when that packet fills a gap in the received data.
>
> Linux accepts the data, but tcp_ack() takes the old_ack path and skips
> updating TS.Recent, the timestamp saved for outgoing acknowledgments.
> The reply therefore echoes an older timestamp. If the sender uses this
> echo to measure round-trip time after a long idle period, its estimate
> includes the idle time and can reduce its sending rate.
>
> Update TS.Recent in old_ack using tcp_replace_ts_recent(), before SACK
> processing can trigger a transmission. This reuses the existing timestamp
> and sequence checks, including PAWS protection against old duplicate
> packets. ACK validation already rejects old ACKs in SYN_RECV before this
> path, so no additional state check is needed.
>
> Echoing the timestamp of the packet that fills the receive gap follows
> RFC 7323 section 4.3. In a socket reproduction with 300 seconds idle,
> controlled reordering and retransmission to exercise timestamp-based RTT
> sampling, the sender's smoothed round-trip time was 37.5 seconds without
> the fix and 15.5 ms with it.
>
> Fixes: 12fb3dd9dc3c ("tcp: call tcp_replace_ts_recent() from tcp_ack()")
> Assisted-by: LLM sparse
> Signed-off-by: Jeff Jo <jeffjo@openai.com>
> ---
>  net/ipv4/tcp_input.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 92bc60716f33..99baf14afdfd 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4465,6 +4465,12 @@ static int tcp_ack(struct sock *sk, const struct s=
k_buff *skb, int flag)
>         return 1;
>
>  old_ack:
> +       /* An old ACK can carry new data. Update TS.Recent before SACK
> +        * processing can trigger a retransmission.
> +        */
> +       if (flag & FLAG_UPDATE_TS_RECENT)
> +               tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq);
> +

Reviewed-by: Eric Dumazet <edumazet@google.com>
