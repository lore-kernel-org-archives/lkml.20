Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676129;
	b=bYOs2mwedlzoirmhd8YloVES47322vZWivOtqgoD5HKukEQj4wMFfzS1WOOb2joOxr9n
	 rBzPyuw9RGOpRFCM6xjoDbLQsi0j5zroj+5AYuIzWg5O03RY4s8YqVsMfyiNYL8K1Q8Xo
	 1FoJshaxrxOOzjUox50s9ts3k2c5uZbNdRPnfDZFtqy1+kRTXD/END31D8iAEJKBhh+UO
	 TZkZRu0AJONJh0SsvayW5h9OBT4MXq14GySm80MjNY/RVCeiEQcQVG9wWKUUqUlYGhfiX
	 vpOiPiHHTnHcLI+KUD0/iWzikHx6yNjoSVdIL/KwFIDWCRhuusKeOJJZyAiHYnnSRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676129;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=b+enJ4/aTvt+mAJ0vWs0JTWM5U1pomDLS1TrQR3CHRI=;
	b=wz3S0HJUM1RL8HTFSbfegAs/Xnh393Phc66xM+cXguFIt6+qbueT+Yxn2AlF/WTEF42a
	 r2gRknyB2+M1IfKwcD1O7rtFORCRHjZuJsQJQzHV1/D/Ny+HbI2jlXBYxa/dSnOWc1muW
	 JUOqS+FIRp0tSP4DjmSOluAxDGlf/67ai2u1DT6goisNWywUtovsCu+/At74wKfYzEOGj
	 QRcq984R9f2ky3vo7q3FxlclJLLTw7qROy0Yp/hY8qGOvNu5Q65CQmuQ+nj4raMeiLk0b
	 7s5ufRPELe6q53bXVdBAoivfE3+vcAkR0vbeZ7PveXjZYuXbld1vTbKEYT7PkA8vmZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=iffJxoHF;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6E606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=iffJxoHF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=b+enJ4/aTvt+mAJ0vWs0JTWM5U1pomDLS1TrQR3CHRI=;
  b=iffJxoHFxGvZuWZN6vwT4LR4zpOSZhu2/heHml/4tNZAyprN+mK4NyzV
   SlvmNvy6GWDxKefeaXvFzT6Nmocj8Zko+EiCxqTkoJcd8KfOeq47nKSup
   X/ly9rw3u8Tl6tVnPLY8mK7AvBZ7z1KsqyGbkXc8TwHF9LTWYFb4grFX7
   Q=;
X-CSE-ConnectionGUID: HcacyPO+T0uagYMzpd4VAw==
X-CSE-MsgGUID: aiW8raj1ROOd7cMTYQJdGg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,172,1787004000"; 
   d="scan'208";a="301890556"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 15:35:17 +0200
Date: Thu, 22 Oct 2026 09:35:16 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alex Elder <elder@ieee.org>
cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, vaibhav.sr@gmail.com, 
    mgreer@animalcreek.com, vireshk@kernel.org, rmfrfs@gmail.com, 
    dtwlin@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
In-Reply-To: <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
Message-ID: <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com> <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Does anyone on the greybus list know anything about this person:

Bryan O'Donoghue <pure.logic@nexus-software.ie>

The email address is not valid, which is somewhat tiresome...

julia



On Thu, 22 Oct 2026, Alex Elder wrote:

> On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Unsigned variables are printed using %d.
> > Replace them with %u to match their types.
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> I have reviewed every one of these and they look good.  Quite a few
> of them--because the size of the value being formatted is less than
> 32 bits--would print correctly no matter what their value.  But I
> think it at least does no harm to convert the format specifier to
> unsigned in all of these cases.
>
> I have highlighted below an existing bug that should be fixed.  It
> gives an example of something to look for when you do this sort of
> activity.  Please arrange to get that bug fixed.
>
> I also pointed out one other observation for you to think about.
>
> Thanks for sending this.  I didn't check to find any other instances
> you might have missed, but you seem to have found quite a few.
>
> Reviewed-by: Alex Elder <elder@riscstar.com>
>
> > ---
> >   drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
> >   drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
> >   drivers/staging/greybus/bootrom.c        |  2 +-
> >   drivers/staging/greybus/fw-download.c    |  2 +-
> >   drivers/staging/greybus/fw-management.c  |  2 +-
> >   drivers/staging/greybus/gpio.c           |  2 +-
> >   drivers/staging/greybus/light.c          |  2 +-
> >   drivers/staging/greybus/log.c            |  4 ++--
> >   drivers/staging/greybus/loopback.c       |  4 ++--
> >   drivers/staging/greybus/power_supply.c   |  2 +-
> >   drivers/staging/greybus/raw.c            |  2 +-
> >   drivers/staging/greybus/sdio.c           |  4 ++--
> >   drivers/staging/greybus/spilib.c         |  2 +-
> >   drivers/staging/greybus/uart.c           |  4 ++--
> >   14 files changed, 41 insertions(+), 41 deletions(-)
> >
>
> . . .
>
> > diff --git a/drivers/staging/greybus/bootrom.c
> > b/drivers/staging/greybus/bootrom.c
> > index 83921d90c322..fb1fbd3f7b99 100644
> > --- a/drivers/staging/greybus/bootrom.c
> > +++ b/drivers/staging/greybus/bootrom.c
> > @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct
> > gb_operation *op)
> >   	size_response = op->response->payload;
> >   	size_response->size = cpu_to_le32(bootrom->fw->size);
> >   -	dev_dbg(dev, "%s: firmware size %d bytes\n",
> > +	dev_dbg(dev, "%s: firmware size %u bytes\n",
> >   		__func__, size_response->size);
>
> This line actually contains an error (and it was there before).
>
> The type of gb_bootrom_firmware_size_response->size is __le32.
> So the value being formatted needs to be converted into CPU
> byte order before being used.  That could be done this way:
> 	le32_to_cpu(size_response->size)
> or just use this, which is known from a few lines above to
> have the proper value and byte order:
> 	bootrom->fw->size
>
> Please add this to your list of things to fix, and submit it
> as a separate patch.  This would be a bug fix, which would
> also give you a little bit of a new experience.
>
> >     unlock:
>
> . . .
>
> > diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> > index 4f1b3f4db404..2314496a858a 100644
> > --- a/drivers/staging/greybus/raw.c
> > +++ b/drivers/staging/greybus/raw.c
> > @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation
> > *op)
> >   	receive = op->request->payload;
> >   	len = le32_to_cpu(receive->len);
> >   	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
> > -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
> > +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
> >   			(int)(op->request->payload_size - sizeof(__le32)));
>
> The above size calculation was done somewhere else without the
> (int) cast, and the format specifier was %zu in that case.
> I don't think this needs to be changed necessarily, but it's
> something inconsistent across the Greybus code.  Consistency
> helps readability and maintainability.
>  >   		return -EINVAL;
> >   	}
>
> . . .
>
>
