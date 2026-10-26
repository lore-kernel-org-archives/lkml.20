Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793059076;
	b=JJtqTv8cDTu/Abp0RbUGvt7pZvdtZzcsJPTryT+42E801YymJ2k5iOXDCrkYzEi37RoN
	 VT86VhMGxfuX14s5FAVDdSKdnQoIbEkIMWaYLNA74KySxBzQMQQwW13gYW57plvCjMdhz
	 T2qbOmtWmGXfIjGiu3W+H3cvLjPy9BuvoEzo3qTH+EISZFnar2sJS4WM/GQgnwLO1AmR5
	 YUEYapymUdTeweM+bfdShwHmvABjuTROjfX55FHiUcSuNJuG9E2LcfnUGwIkf8rDEtj7i
	 NqO2cQwJ/rfBVJQvKZ2/74/QBGI6JYAX9tmN76vH5hJ9mPyXuIvwHPY1IpgL4mFxSmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793059076;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
	b=3vS1l4OZgVNyeyc6aGDOWZbO/8K962PSeZom+mkkmJh9/cRyHUQrfjOezQyXTsK8olx8
	 9eEaFmr2nB/zQ8VChl8CHzEN1W/dZimgJUpaeIaqD0YBHIvaHCecpEJb5W5NU2xTx3Lik
	 Le3eW1QQYVAXO5vB9Ms0frEBH46q57aDpZKCV+Z3eS3L0coHf7DMN9q+87E3Ktq0wA5Hi
	 DNjLYzts2onDbBEkOYgfRkclQhwMcjE5aeQUjH+07gUjgUtUgJKxmRS4MWEfqPq8ABYrw
	 s2RpYc5HkCv3jQNDlNd448km+MD1O/h6GZ+/BURaCDkCeUkjXpFm/CXnsKH/SUdwyrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WR7GTEFm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZK4DmyvM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90B606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F90B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WR7GTEFm;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZK4DmyvM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793059075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
	b=WR7GTEFmg81+XIXK5tSX8qWlACX11FGS7Z+szRQz4L6zfEA8Thnte1VEtZ1a7vk62mdFI2
	fmeLqwzUCo5mRAm4sr32layWhoUHY0hAgt74M3XB78ANQZH6beYDwAMPsdyEqUoHjZRbc5
	fR5XBnv6Mi30Rv8aw29u0ZwVRz7R7gA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-AxX0J2qONq2o1eT_vIZljQ-1; Mon, 26 Oct 2026 19:57:53 -0400
X-MC-Unique: AxX0J2qONq2o1eT_vIZljQ-1
X-Mimecast-MFC-AGG-ID: AxX0J2qONq2o1eT_vIZljQ_1793059073
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c25edb54d22so391510966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793059072; cv=none;
        d=google.com; s=arc-20260327;
        b=ggiuC1PpyVPTdJ1T7MxdvN0xWQl+NI8cnl36YErKzDm1mqmhsu3nIRD62Up5UYkdCP
         y6uqJaCoIKet3hAqB+X8Cu5mPJgBPzoHg24F0O3hkG7eu9a6SvrVQHmYHvmN9sBH9g41
         nq7ZRFHf73cUi2O+zdi/qVBBqXoI0R/geY4IPRWzTPzt314S0XtDn86ImH1JigZXu3FR
         3DLht0QZVQ/KD1r8qAnNsS54SwUaogyqUdkCeqr+C7J5cn4jkGqI34BUXCdZ1tB5TDcX
         jLuHisgM+ifFJVTCG+q7bmJtnHSBwrGXWz4m6JMxWPgQgtgxCCoP7SaNFpJMcnmwiANi
         Tr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
        fh=8vXHRek4e8sGv1bldMD1ljviKA0zJW5DAUmFQMk0p0E=;
        b=VQKK8ef5TaJWR7lBoNE3pOAwNzGftoWTgz5U4+EX/Gi/e8O/2fl+wU8bJjzi4xJ2+y
         Tn5eXdbKd9KYve7K9q7MzUpLm0bxdp7JfxYYkF9PVM1KsSxr8/5tCj0YUoRIPbyPSjrP
         sGPlYxhG+rGuTlfrv35MNdA9fPJ7UFCnP0d2RnWWg04aOxrkC2wg4+nbXy7F7yv0UZJZ
         MEc5nL2DyHpR1ab42dhOc5lFLdI3gRDQ89Foknuc47Vz+ecRl40MeZXJvUdbiqdKcuKS
         QpSeRs2u7BNV56UbjDlbba/r3S55NbPkXJgoMM2a5P1n/Kk2vdejUnTyHQT04CBi5Lgv
         6YLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793059072; x=1793663872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
        b=ZK4DmyvMD/8lJzjBQf2A5evasCf+fxkCYI02NpCw8kzvrXiatjwZk0zAVcnI2gumlZ
         2E4uepEOJL72Wuee+L03ah04BQR85T1r1T4dVtt8B0Gn7TIEDqive/dlm8F5qhUkgKoj
         AtRGvU+B+D4gzh4dWNJq99HHfFpmoUNcJ71nvy3rRg8QSNIeiNDLRs5yJ6mopGfhPJON
         SBqjBMkokFqeG17sCUMgWVU3okEAq3nu5W8bbuwH6dyLt+aUml4ze9VqrMZbtE38yBE5
         pWZ8UKAS1MVtIDVDf/sGlC1XODgwiFGCTFCJaluj5qLNhg1//AJCCSVQc0vgein9EhnS
         LJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793059072; x=1793663872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
        b=lC5QAJell+y590qFGpvGWkErFmjuM0b1O0dDKWX7jJiiKKVe1TuQiIYmEHiYXeckAI
         auuIdIRLwzgn3s0+5tPrB+jvm+HRLyBm8LCoppBI9gNouS1Jyzc3AHDUlTIATYqxtPlI
         vvL8zAW6rgmS/nWeMZkPeGriQ2/FKiOXsWBfpanyxsL9+51RphzL5Qx6YdIa0BGwqUvp
         DhIAh9zkeDWL7GW0tsHzg3SwxpcXDhFQLcQwd9WuPp1Q9iScp6nDWsDqPeC4O8b/Z2Bz
         TjDt1QeEbEGuh9i5uzMLaUtZ2iyqtEVgLe4kQ3YccLKfIGm814TkrwjMwLKOUW0nOehh
         tpyw==
X-Forwarded-Encrypted: i=1; AKwUvBznVPHDtTYfnJYYdX5c3qASgr4kdDc8vz+3Ym4RnlR0Ia2DPe5E2qkpKBQpb+TDdIxDID+I+qo2kxoPfBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN9+33JmpnZdW1iTcN/5G7MJCLmoXdkJtJCwdD63nY8+63XIiK
	0kN4Fs54JdxvHDxM2KVAQWpuq0mem53JaYUfbGynwZTz3p79dnN6xlmAbO00GLaKYKIeHy3GqUa
	D22b4/Mpi7k7SpU87PV7f8bhFMpTNJYcMdzH8PmIwvJTrdgT4HhTvv8OnGZNOFCx0WUdNSABiX1
	kaND3I114jJcuTpmbDKYpE3kMz54kSTBr5RcIaO45j
X-Gm-Gg: AYBFou18PDZFNbqwF1/4I0grxjYNnVnK9d6xR5xdCI4IYrWferi8xJiaIfVdGU0eTJ1
	88MJhgKilcu3nCYHLpt+I9VcTJ/0Y71gZGNH1mfvzybFE00b84pA4q/cGJEHVv0qeh+BIRS+mK+
	XIy7bQQj0b26gBvJVNCRnICMzUlty9zVK+3w9uxCt1raq7q5S+TjwltTTLI5lvnoe/jVEvs2V3e
	FNAvsA2qnV0TD8=
X-Received: by 2002:a17:906:f59c:b0:c46:7ec3:fde7 with SMTP id a640c23a62f3a-c46bde62669mr982025166b.31.1793059072584;
        Mon, 26 Oct 2026 16:57:52 -0700 (PDT)
X-Received: by 2002:a17:906:f59c:b0:c46:7ec3:fde7 with SMTP id
 a640c23a62f3a-c46bde62669mr982023566b.31.1793059072194; Mon, 26 Oct 2026
 16:57:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ar_0GFOb5hZfhHHx@sirena.co.uk> <asOdxWlcjSP0DrB0@sirena.co.uk>
 <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk> <atZqw7pdZjMwahdf@sirena.co.uk>
 <at9drMPrv1IvPovj@sirena.co.uk> <CABx5tqKQs2LFNEW7ZTwFqD66Mzv7EM+fSbqWkZ8chaWfXhheOA@mail.gmail.com>
 <at-YqCa-RGEv7IJ4@sirena.org.uk>
In-Reply-To: <at-YqCa-RGEv7IJ4@sirena.org.uk>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 26 Oct 2026 19:57:40 -0400
X-Gm-Features: AclHuK9rafwiT5sMTFWEhdKWjRobeMh9DoBW_vUnJtaI7_tfFhl_74ljQgjwZg0
Message-ID: <CABx5tqJnZi9KT67RU47PLqR8tQWV-TL3Y4SrUyzWvF0B7AE68g@mail.gmail.com>
Subject: Re: Missing signoff in the clk tree
To: Mark Brown <broonie@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Mark,

On Mon, Oct 26, 2026 at 2:15=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Mon, Oct 26, 2026 at 11:08:35AM -0400, Brian Masney wrote:
> > On Mon, Oct 26, 2026 at 10:03=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > And today.  I see the commits were actually done by Brian (CCed), who
> > > also appears to be a new maintainer for the clock tree - I guess the
> > > contacts for the tree need updating to include him?
>
> > I will fix that this evening. Sorry about that.
>
> > Jerome and I were added as the new co-maintainers and we are listed in
> > the MAINTAINERS file. Is there somewhere else that we should be added
> > for linux-clk?
>
> Yes, you need to tell me about it - there's a separate list of contacts
> for the various trees in -next since there isn't a 1:1 correspondance
> between them.

I fixed the clk-next tree (via clk-pile). Sorry about that and I
definitely see now why not to rebase the tree, especially with two
co-maintainers!

Let me know if there's anything else you need to do regarding the
contacts for next, or if this is enough. Also just a heads up that
Mike stepped down so you can remove him. It's now me, Jerome and
Stephen.

Brian

