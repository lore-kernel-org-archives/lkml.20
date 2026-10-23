Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776312;
	b=ZarzZjrNwbCjyqn/FkN8maALMA7+uwIki/veedK8/vGL8flZpR8iHvEinfF1227fLSjQ
	 6dGaBX3GqL+Negkw7JstW9ZEori8Qw8X5rmqcp6apdcHGnwyqGAM1OPrKw/Ve3/z3yJxJ
	 FrxfFuGplskJbmEk7H+zDE1+08SvkZLmJellWotE6h8B4HO/PsvhpLcxhrAfEpgW8JJ9w
	 vj+wgKDc+x3w2N13Asn7XF2Dj6SnHvajobXS0/WDYsYox6ue1BD2Rcw9xlImOsWNW07nL
	 gQAvPMJteSQGWKpOEFofqRaq32HdCyIbfKAjSNmTHtXGO+OlXCCVUuovneadDpnCF/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RO+LOoJIbW5iZ7RHeBPtINL9e1shP4vPoVIK7G9kRv0=;
	b=ln6e+cCbLEWzqHl/WrsNxo/KZmoNuRM16bh/gcfcHdv9cuspdTdWzOYp7sMqu+JiZC+n
	 6VzA0HdMxiWOvkpdwPuvTXRIkt10AGpUroTOvtfOVmfjo0K1M+1olm5eztRkQmEB+x4g6
	 +96KHCRQZjdxfDcMBA3VWugbWUl5oNfdgu0dxOxLiXsPBpd6Cn2ltv9nuvh52fE3W4fhS
	 DmXpQO6GDECosP36gn8A2iNu6dGy3tFc/NVWQed3w8M3QFr4lp7I4kvCM6IgPPz0Cn6dk
	 qBM6SVUML2qDbZd8ffn9ufdMye9OExAzwQyDPhKpZEeEmF0gnjH+jrKojaHbmbIM6Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b507oPp7;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA33606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b507oPp7
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1931ff67a29so1281641c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776311; x=1793381111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RO+LOoJIbW5iZ7RHeBPtINL9e1shP4vPoVIK7G9kRv0=;
        b=b507oPp7BjD12Cx61wLhHzE4HYiqaCahDTlK8lggOak4CZ0TZD15XVKQxMsZV1Y8tK
         B/mVX2FQBUN4ayc9+zK/KqSN4RGXGg4EEPbiCZKRv3SirYQrEUcKnL6BmQ7kPfsRuizr
         OicIQVBO9o+4b8aCohW9q8CIoEnh63igc/9IdTRpL8ocW/3zgXnUs3KMpadd9csMUyy2
         ICYbY3uIzpjzF/FAI+jNOPCsR/j8k4HL8TanQWvVYtFUKQAyz2K22XZMnCp8msfpdbb4
         HhINlgzy5op+nL7Jx3Lh1d1bl8QRq/41NYCehwzaqQSMRksOF+PTaWKms6pkIooiCkbq
         S/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776311; x=1793381111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RO+LOoJIbW5iZ7RHeBPtINL9e1shP4vPoVIK7G9kRv0=;
        b=wQ87Zd49hgLTTSMG3fgEe04FI8+Ckj+yn+gYuV7HGOSMQohxw9IkBeVqe4ay5XJo/U
         h1BQcG+SCcQHpblpkUCajCqjLVNBd9crPNJSdWcr6K55CWZUwao1wVo6gKCJHUyAVqu1
         F01ad18CQXW2dZYlPep4IF9hEk6o8/Gt/QqVRuubjGJcM9miu/jipmn+OQLb6diXaYnU
         fG5xjE3MsbG+YW5J4s7/mdOIqEMwpImQx4Kaq6lHsDNfqfCmxZrjewZopu3QVZaKNp0O
         JAyoAsuxRdset/yt5wy7fiWLB8EfF0t8LI7XamRJ1kPp8NM9wiM//JPageDlqFL/zk57
         LRtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzelXOUVPvwbSE5Si8VK2tx1Ik43b2PtM4f2YAGM/z6Aw9JuJoVj5AlAczH5WI6i+amkidKkhDi5Qajw9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKB/AH090dZTEc5Rld6+uUSTwt4+ZOzXg/F1L7r996XCit/LWt
	lxhi1Y340XW0XGkxm5Yv5yGef4coDzEfrqr+a9c8snU4WmoGWOa/Zo3X
X-Gm-Gg: AYBFou17zQwv9Z3e8kM6AxkJ8ysilNM0KgOhVECUqaR7Uunq9M8A08UtAJDdNSw1b52
	2X7BrX4wxv/jrS2sKENXXS4xGGns90IVycxgJnwK7MnUWTkxOoT9TEOJWP3wTWSQADpUZ7F7dC8
	nTFBXCyOqmIZv6IWBLWWw9DTHBLIDUxtzaN2Qxi5IM2W+6tiuwP+VHfQDem+J02HEFupher7+v9
	zfqU7wjTD5r/vcgyDBRgh2ejj/auTPLYGUbpAaLD0DHqY3jrR+jO4QC3/fkN0MRI0fI7ud+FeEv
	xuzDxcMewbsMJDAR7XJtwkPN0ZfU2EQmazXaYm7toEhHXXaAoIXwev4Do9elgKljAqeuLGmDcL7
	xoZqNw5Ed5FXwl6b+P9QCXqopRoaxpkcyf54GIVhz5omN/wi905HsUF+2KMhycd/v9aXsIUiz4e
	ruDLZe0mqaE/7qSzlYWfwrC8jL1XJkFvMO3G3PtmxXtBewWTjZ3Xf7K4F+Sd2hCNdYuo0Aaw+xr
	dNhfvjlponokTU6lwBR4uFrEyH1xDSaHQhPGx+vC6hWoneva6veBsX0UZI7Xg==
X-Received: by 2002:a05:7022:6606:b0:185:6b47:dcf with SMTP id a92af1059eb24-195a074d885mr4595312c88.36.1792776310587;
        Fri, 23 Oct 2026 10:25:10 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:4145:da00:43b2:a151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6dadb7dsm1039145eec.6.2026.10.23.10.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:25:09 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:54:42 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Alex Elder <elder@ieee.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, vireshk@kernel.org,
	rmfrfs@gmail.com, dtwlin@gmail.com, pure.logic@nexus-software.ie,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
Message-ID: <atuYWuWeqvEG6j4B@user>
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <77adf02-43a9-7621-a94-9da41f8c5a56@inria.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77adf02-43a9-7621-a94-9da41f8c5a56@inria.fr>

On Thu, Oct 22, 2026 at 09:30:26AM -0400, Julia Lawall wrote:
> 
> 
> On Thu, 22 Oct 2026, Alex Elder wrote:
> 
> > On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
> > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > >
> > > Unsigned variables are printed using %d.
> > > Replace them with %u to match their types.
> > >
> > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > I have reviewed every one of these and they look good.  Quite a few
> > of them--because the size of the value being formatted is less than
> > 32 bits--would print correctly no matter what their value.  But I
> > think it at least does no harm to convert the format specifier to
> > unsigned in all of these cases.
> 
> I was suprised the compiler doesn't complain about this.  It seems to
> complain a lot about type-related format specifiers.  Yalagada maybe it
> could be worth adding something clearly invalid in one of the argument
> lists to see if the code is actually getting compiled, or if you need to
> set some config option to make that happen.

The files compiled sucessfully with the normal build settings. I also
enabled -Wformat-signedness to check for format mismatchse, as this check
is not enabled by default. It revealed a few more issues, which i'll look
into as well.

Pavan

> 
> julia
> 
> >
> > I have highlighted below an existing bug that should be fixed.  It
> > gives an example of something to look for when you do this sort of
> > activity.  Please arrange to get that bug fixed.
> >
> > I also pointed out one other observation for you to think about.
> >
> > Thanks for sending this.  I didn't check to find any other instances
> > you might have missed, but you seem to have found quite a few.
> >
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> >
> > > ---
> > >   drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
> > >   drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
> > >   drivers/staging/greybus/bootrom.c        |  2 +-
> > >   drivers/staging/greybus/fw-download.c    |  2 +-
> > >   drivers/staging/greybus/fw-management.c  |  2 +-
> > >   drivers/staging/greybus/gpio.c           |  2 +-
> > >   drivers/staging/greybus/light.c          |  2 +-
> > >   drivers/staging/greybus/log.c            |  4 ++--
> > >   drivers/staging/greybus/loopback.c       |  4 ++--
> > >   drivers/staging/greybus/power_supply.c   |  2 +-
> > >   drivers/staging/greybus/raw.c            |  2 +-
> > >   drivers/staging/greybus/sdio.c           |  4 ++--
> > >   drivers/staging/greybus/spilib.c         |  2 +-
> > >   drivers/staging/greybus/uart.c           |  4 ++--
> > >   14 files changed, 41 insertions(+), 41 deletions(-)
> > >
> >
> > . . .
> >
> > > diff --git a/drivers/staging/greybus/bootrom.c
> > > b/drivers/staging/greybus/bootrom.c
> > > index 83921d90c322..fb1fbd3f7b99 100644
> > > --- a/drivers/staging/greybus/bootrom.c
> > > +++ b/drivers/staging/greybus/bootrom.c
> > > @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct
> > > gb_operation *op)
> > >   	size_response = op->response->payload;
> > >   	size_response->size = cpu_to_le32(bootrom->fw->size);
> > >   -	dev_dbg(dev, "%s: firmware size %d bytes\n",
> > > +	dev_dbg(dev, "%s: firmware size %u bytes\n",
> > >   		__func__, size_response->size);
> >
> > This line actually contains an error (and it was there before).
> >
> > The type of gb_bootrom_firmware_size_response->size is __le32.
> > So the value being formatted needs to be converted into CPU
> > byte order before being used.  That could be done this way:
> > 	le32_to_cpu(size_response->size)
> > or just use this, which is known from a few lines above to
> > have the proper value and byte order:
> > 	bootrom->fw->size
> >
> > Please add this to your list of things to fix, and submit it
> > as a separate patch.  This would be a bug fix, which would
> > also give you a little bit of a new experience.
> >
> > >     unlock:
> >
> > . . .
> >
> > > diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> > > index 4f1b3f4db404..2314496a858a 100644
> > > --- a/drivers/staging/greybus/raw.c
> > > +++ b/drivers/staging/greybus/raw.c
> > > @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation
> > > *op)
> > >   	receive = op->request->payload;
> > >   	len = le32_to_cpu(receive->len);
> > >   	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
> > > -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
> > > +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
> > >   			(int)(op->request->payload_size - sizeof(__le32)));
> >
> > The above size calculation was done somewhere else without the
> > (int) cast, and the format specifier was %zu in that case.
> > I don't think this needs to be changed necessarily, but it's
> > something inconsistent across the Greybus code.  Consistency
> > helps readability and maintainability.
> >  >   		return -EINVAL;
> > >   	}
> >
> > . . .
> >
> >
