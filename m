Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4611B3957
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297938; cv=pass; b=Fld7L7yYc2YObTJHHrGO/YzTsi7mrL2Zri2fjGzpiNPOdDkZsNoCx/OOMNkHXKG8OCfALNpIqzNs3Osxox+gipGCLuXCDQMCAB9BPUE5HCm7AXFQEfC5vcz056cEivxeSId8Ye5SrmQ6myzShiCF24CnhtkFWLJObVQe/uv8yDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297938; c=relaxed/simple;
	bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsPTD+xsS9s9CmVEE7or6b3R44tLp2ACwYCRZuPI6NTSDGFLDCySmOY6EtUJ00rgpmI8RibhM3Gt0JoNn8BTMxxoaittmXAYYzzT3pc7TeQkhZnqXVD4J+qjp9vvSemcUJRCnNW6hMGkGh1pF9CbrlWCAlpHj82iH38SFElL+3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MezY1qMb; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MezY1qMb"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767d286so3791301cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790297936; cv=none;
        d=google.com; s=arc-20260327;
        b=i/E/UHFhmuu6LzwLN+Gclu9PkIoCdW3oH+Jl0lEo6kZvd2jMJyH9f5aPJcRy4qRtiK
         s/lXbWeOjrcrVH+eCEw/BXAVs0oOndKgLkLoim5HeVuFnxDwqWt6yetTR7b2vLnX4gMs
         WoHTVEpsKIX68O17nUZ3dXcb16YSgkf4B4igHbmIFYYLbWEdyDHthW8LiSm3Bg9h+J8i
         ix++NPpFqkLwZOQTVcp1LO4wugNQUwKeN5RA0wvTfMjXbf7QRPWQP3GKc+Bl8ciqXSUT
         TYq08tjD4KkIPr5yQxQTVHK2bdpBQqAqxu5zMcYFLrEoa5ppRYrcNCQYWdmVhE5DeC55
         LHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
        fh=25FyRiT2GF+afESGqjNtnovrwfhTzpIuv3QgndEEcZs=;
        b=hoONTM95+ZuA5RjQkct27QM7Nw/T2nbtewHF2Sml17ixRcGn5SwGDm4if3m/Jh3PO+
         lJ7qPzqCcBeTJpgiuDv/+YaULGrzfYDEmnFVtWKS8DqV2+9bjzf65wa2/smtUHDPXDkK
         Z6b5aAj5U4W6USMBSfga6l8pSvW2L9536715Hw6W/8lT35l2nYOMj4nJplWrfyHaJ1Kk
         ypMkFfyRfb7fGzjwg36kClqZeDotGnFj29CKJ/s0zdkQvc+CxXtbT/3NjtOzyxsJOsbX
         g6R4ZFTLekXrdYo3XLtCqwko//tHZ6qWAPHtJIb26yKaZapo0eqPLofIQIb/JHNgYK7R
         nwOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790297936; x=1790902736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
        b=MezY1qMbvEI7v31/hFS2NYGgdGoMKE9LPO27An0Mmy+vH0VGgaBGfUGCccceGuQ8cJ
         s3KZUEU4lqO3U5pgLTa1EprjzJFEg07sKnGep1+TaMbOgDC5dwnnFS7t4nrAK63/lU3n
         Tb5rgQ+hbKfJQH6plZaAEUFjn7yajHRvArYipEkTkX3GuWMx1rehJr6L33TzNiKPcAj6
         2kqhFaMCYMBBe/ZPW0d5kdOmikTJTdzveBfq0Z+Lki5qnb5bJt/y4kHwykbMQ3Trkihf
         mSRAecWWbWTc7EVa9EgtsFJSCMhZSuFlAQlMt7veidDsW7Lib/Tm3v+wkFYHHZNp09HQ
         gdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790297936; x=1790902736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
        b=hNF7b6QDYn2xND6fFXoJ8SywktxvpsGUPSVs+KqcBcLPPZT+j5mRrq62qxXpR281Jy
         jjYDJBfub56eTC61IrAu60Zsj3dKoA1t2WBDw7wqBXNdtokQPK2/eCCtReJ63oz0ujP8
         zvaXkmvCJqCGrr1nckIYkfYq7UAMBkdlWn9fCvc6CxwOSdsoW96Xzg46F7fOcd83Eq/5
         476dFeBQIhwqa6jVDDHgS+Uj9FHNeG7sXU1m0Ft3AXtIwqkgAmZvHYixzF/bLg+29jVi
         Rzh+WReYbMqPkGCBJO3O8ADmSZkAxoiuVF/18aVZpiFLKuCh4r84yL7leKAy+wnOeWQZ
         hcqA==
X-Forwarded-Encrypted: i=1; AKwUvBzrEluhsxkGOaT6vXX9zX4Ej/DMZvUg41hyJYt+gftesbHWEb5EBeipFChqeqlzdvy9CWxnRDqWJ0ZfChk=@vger.kernel.org
X-Gm-Message-State: AFuF++kYv0X6hYlEsN8gNK8HpWp7GqltjhWtGRg9SRtGdgF5lPKr3qYR
	lyjYePe2DM+zujfTVUiP5dEcdJaPkXWmDq9QosARvjP4AsdikTEPzihIqHVRqaSGpK1QTGkB5pB
	95b1EHjY2x5DYvAKxNHkffqq7/QFDVqYV5EzqH19a
X-Gm-Gg: AYBFou04ZF8KWkjPmy8AvL8NgbEaZSQMq9Th7mzWG2xQ5HFrAJxJsD9pptfixGlaaBR
	ANz1x47mLAkLdJH+Ow0Izn6U3wFO2/bAbBakbVeQOAdXUMpMRhkv2WYWw+uDtCeNRafbFz8y3gh
	Z91YDVkpJ2QPw3aRf9M85L0dbqYn91ZWiZlB3o/kJ0TpTqaaFQISmcApIef692gFrnKuYi6iBkd
	Wj+w3w9XsWMJOVQQGvZSALXXiqHyLXsgQNGIPB9RpQzenJJdB7ShIdp0iexD29GtCQkrTMV0u//
	GQa5q9hInB1QVSFV1c1n6lIOv201Zp5a383iapVtry1gJ4pAX5tW6uzn1r11EqQbyrN6elPHoJR
	i2SXFxWuznyjHlxw6Pnx11ndbRihnAkSJIbnx+Wj27lENRtXv50wRUOdg2aDAXhinTDA0
X-Received: by 2002:a05:622a:1908:b0:530:f3f7:ca19 with SMTP id
 d75a77b69052e-5330b5dfbd0mr19703701cf.25.1790297935585; Thu, 24 Sep 2026
 17:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924224456.55690-4-jeffjo@openai.com> <20260924224456.55690-6-jeffjo@openai.com>
In-Reply-To: <20260924224456.55690-6-jeffjo@openai.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 25 Sep 2026 02:58:44 +0200
X-Gm-Features: AclHuK9sfmq7kaDYlZhIb51eTI_YTaqPKeo-GWlhfKE_S3RVg2Vy8HH2SQdgf3E
Message-ID: <CANn89iJiOQNrxAOU_OuOZafaH00K6bHM9nS9NCWEpg8yKq8fgg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: check timestamp echo after an
 old ACK
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:45=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> Add a regression test for a gap-filling packet whose acknowledgment has
> become old. Linux first sends data to the peer. Deliver two peer data
> packets out of order: the later packet acknowledges Linux's data, while
> the delayed packet still carries the earlier acknowledgment.
>
> Require the ACK that closes the receive gap to echo the delayed packet's
> timestamp, 301000. Without the fix, Linux accepts the data but still echo=
es
> the previously saved timestamp, 1000. Also check that the application can
> read all 34 bytes.
>
> Use a large jump in peer timestamps to represent the idle interval, with
> no real wait, loss or retransmission. The test directly checks the outgoi=
ng
> timestamp echo. It requires packetdrill's merged TSecr verification fix
> (linked below); older tools incorrectly pass on an unfixed kernel.
>
> Use the existing packetdrill selftest runner for IPv4, IPv6 and
> IPv4-mapped IPv6.
>
> Link: https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d2=
06fe4d7cfab5b6d872
> Assisted-by: LLM
> Signed-off-by: Jeff Jo <jeffjo@openai.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
