Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06274119E3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790529051; cv=pass; b=hH424GiRwr9v33/eEZpIOB815Z032Z9fA5FEbeo/ilfLVNc9Zh0OSehH8SkshiuEQbqXqnmP9GqVLAbtKvsgWc+3oREV438falRCgM0BSkFPXgwoG7dJjuZCXJjPPRQH+N04Hsm5XWQrXQT3yAO9CSwVlwkC0Gxpb/XASzL5x2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790529051; c=relaxed/simple;
	bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeDprkUkXNxdAt0kJERdakcJINXL1iA//UMS9l8+vjkbcX0BTFaFOlK3NN1b5vSvm2ViumjRaMe/M8xwuVAHDiSiaSzRB+ruUjnHm3otzokyRu5iilGR2QJxotaRlEuLEvKqJevcB7LcPA5HmeHWIRqMaSKj+YVsMa6DsvFPBNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjYrV562; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjYrV562"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb769ca17so21210251cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790529049; cv=none;
        d=google.com; s=arc-20260327;
        b=bU1jy0xq85En+k9hYFtMAwbBXHIj4lUBm7aR7b58GA0MBjOkJFl4wIO9exZ4GuSN9z
         BqfjbcKrCzbPNXxXKJwTTmFDFRxS2Vgk0SZMfprtG//OA9LKtWk3pYAc25bWHF/uVRcA
         rbwVoKKsNrxSNRplSFW7bE1B0SEecdndZ4DtGESD/8vD7iAnjXXyN5PFsz7yq+7YVJIP
         giJ8q8Z16RaDRFUFvv2PRGWqmLbp4ivd61OAajWcVt81HCwPlKhiF3WbQPQ6/St1y6du
         fKyZ3283z5fbyMWf9n7Bpt97Bmtvl6V/VuY89YL8lLA/SPYJ9hIZcsSA4j7jQqUigXtK
         0swg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
        fh=laDzAhizmfu6KHLOBOM3GrTlXtqZhKwZJzH1yh60PGg=;
        b=Mrtieze8TYrqlD9blcI9+ZoyBL1/XaFIj9utkMHiuyIWkljCyHHbwq7Yd4JMbOk/mG
         9+PBQM/ApRHuUkZSBFQkEaN6eJpxpCGzbTaUQa/3t9EyCBJCm6lyG1mvTBTyoUof0ZLV
         yjurW9tAkOZckXtavUxFLlNsgtfZMUJq0OwUjsuxpbppxcSYtroJ+FIittzCHJwJ+Ssi
         y5UTl7KEIJNa26KWfYJ5ZiSNJIjdSNchdJXZ+1aop49ETTf5iq9ae2p3E93Nxayx8Rnv
         kSuBrMBZh7M+4DC5N7T/Wo29L8Lw1/PaweLW+YL6uY/A4uCtDpzPJZU9fhFgMv9qjxiW
         /0TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790529049; x=1791133849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
        b=mjYrV562TasJbRzRBYNqKC29SivwNhKDbxhj8AoHA2aSdNv6ISMmbfirO2kXhJKL7W
         aGEwcRZjVs2DINpoalIM15LpsqiJUzRmZpd6ulR4TYWF0/i1Q/ORxuHe9aSGrmGq2y6j
         +eznTl45kUfeKbiDC77TCXGz4rMAPmPj7a1aiFdteZQusu7fDZzskU1UBTr9CX2446P5
         emkugc5TJRPHYB7VDj7sKxybbe5+pivYaeWaH8VRPXd5VGI1+E2OxFaQs9ocsEwGVee9
         sw63SsjTbrp2VvrKiHftS7AofETr1d+kE9yWGCQhF73wbvnc9g14Q3T8D6KLATNqIovy
         DbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790529049; x=1791133849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
        b=DQ8FjkdocHKj5CPL1lbyQXQmmL5yABQvOONHGkUR/zIKJ4mT07vbJ7fwLcc2m3JsN4
         IkKloDwGDKlre6eLvul2qX+Cj2V7Dy0YTTte0ZUj6+7CK3eONAXQufNQZ+C2txtnDzcv
         YYRUw1ewkAd3BCASx8WBvJ1mLIHdzVOwSPExfc8MvuPi212EBXaWKDNNCuUslBh3IeVf
         Ae9kkQPf9s1JYGgwDBIJIj6wkqx+JGlt4b/pPbo69vs3WL2a9LymbL3Rsuoeib3QCbBh
         u0XWsFaFKt/aPiZjjk4s8pPMkb/pCUPkIqrx0bGGjY1VwNSjMdmI0lB80LQfy8d/7R7+
         1Qvw==
X-Forwarded-Encrypted: i=1; AKwUvBwvyFsI+vPNQ+9qL0r5W0+7oOnM3x80VNyh6bY0g/utSbaw9PVJuW413zB94frnSKTK7b2ZEB0ZehzSitI=@vger.kernel.org
X-Gm-Message-State: AFuF++nIADDQee6F4LeR7KeF/ds8VMMgqP/lIC98xqUOIR67oiszBhbv
	2rgp32nQNPpc5PT1IuImxqVgBKUI9wL0OZLmJj3G3JatIGELYT9VxRwfmJOKfFegluxdKUPzNgY
	MRzMLZMhEM0GXdNxXKhlQrTCAGRjtM4S6kn2XGNHeKfFAk3foRd7UB/fVB+E=
X-Gm-Gg: AYBFou2ieTyhDqhChw1nUBq3imbu3kUvK7xuT49XcvWmmnVhsnpHpoTo57eKT+jz/l6
	2nwiPJD4v8ulKhwKoR3xcQw/Xb5vyv8ZQ54hq4hePfJ0+oqwLIdfLSMtzC1+uLs6d+vKv0f+kZ+
	HvaI1ETxZEOeXNzhAtzHrY9Gv1OYICIIWoKw+hSgIbbrWYG/HTC8yZW6aOhglZmaSmgUlWgVMnK
	H9KMUnz3+pGpFDiWLyR+kEd9SCjGYfab4ooykA2VS2eiZy5VwMEKJxcOphnid2SjMOs3zrTG6Ci
	on165zRLk393OqXhxpUFj5Gflkl/aCuGFLU/G+9e4mOvlUkXof5+eNpELgvKq7Sch65/hikfQfK
	KOo6Y1SU9aeiYqbWwoX+Q2RFRKUEGggz9TqrM1EUHPwnlUbtW93m/GlQlVI6rj7Je5vY6
X-Received: by 2002:a05:622a:6f16:20b0:533:3868:1f6d with SMTP id
 d75a77b69052e-53338682227mr27382171cf.59.1790529048151; Sun, 27 Sep 2026
 10:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927163117.746432-2-bestswngs@gmail.com>
In-Reply-To: <20260927163117.746432-2-bestswngs@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 27 Sep 2026 19:10:36 +0200
X-Gm-Features: AclHuK-wtOUaURDTxb0s4NuF5eW9fAjvgRkV0CtGV9tL1ejWVBuFWcDjyUMkjB4
Message-ID: <CANn89i+monpTo=bjqnHRhuGaCkfHe9BJNhJncjK+vUq0YKAAag@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: gso: validate TCP headers before segment length checks
To: Weiming Shi <bestswngs@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiang Mei <xmei5@asu.edu>, co+1fe9b56e2c61be5e@bugs.sh, 
	stable@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 6:31=E2=80=AFPM Weiming Shi <bestswngs@gmail.com> w=
rote:
>
> skb_gso_transport_seglen() derives the TCP header length with
> tcp_hdrlen() or inner_tcp_hdrlen(). Both helpers dereference transport
> header metadata without validating it first.
>
> A TUN user can supply a TCP GSO packet without NEEDS_CSUM and with an
> invalid IP header. The skb remains GSO while transport_header keeps the
> unset sentinel. TBF and police can then reach the length validator and
> read tcp->doff outside the skb head.

Do you realize this leaves non-TCP GSO broken with unset transport_header ?

Please fix tun instead of adding numerous workarounds in our fast paths.

__virtio_net_hdr_to_skb() needs hardening instead.

virtio_net/tun/af_packet MUST not feed 'gso' packets without transport
header being set,
among other things.

pw-bot: rejected
