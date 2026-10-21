Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792563329;
	b=Y1QMRAb6gPzq9cpFqs3Lb9V/7Gli/B7VAWj31FCttu9G9+xkOUqRAfkG9gCX/qtPVMsr
	 z3KGVsS45HGx7dcRfUtlETC1qECF2A4nF7DA4byKqotU/jujpGdUKxxnyxpGzY0mfhxhT
	 Cj1vbT9llZ4/5r8YqTeoyJfALRWBdbd6BtHbkDJf73VeDLH49Tj0pEPs2cBEB4DLnA9qT
	 aae14F9JKKdUS9SNWP6VC0naNQk5Hr/TkGcH5QWjqicfmEQpKBcPSH54qnEG58B3f7tPL
	 jnfbXZ70Ljraos7uIfOQAsX4DjEfjtSHTFTpu+eBxE9iHrKXWlHVb5o1PLNjlf+eD5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=;
	b=PCxG7gFwXZvR33YbYIjTtWexgobo17yMO1Zz70HT86lrjait/oiwtj2VFr7feaC1mwbB
	 r5MoXy/EB+IxERpD0UMdSCFLf+lFxN/y4ooFZhI4lzgQ7KsfjCffQCEoR5E7trrN/j2zN
	 tQfOUCrv+BLuFkBeHUfxKczhJxhL9b1rcoWa9Jqe2Y8NMRrGZTrMINIxdOfA4S5Tt6sd0
	 GyVQlPFi5SWw/gomaAquTgHWIxIf0+7sO1y0/NUNyDbvueuKmmD8QqhvA8RvcctmsajiB
	 Fiq8CN4x0yA7TWr7OyDPXbbXxH2CjYzJKb8hO1dImsCmriU2/FIuP4THb2hOoX7xwXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OFV2WDWa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B53606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B53606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OFV2WDWa
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679aeeddc6bso387467d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792563328; cv=none;
        d=google.com; s=arc-20260327;
        b=Efuy/XhyoLH36M1fS5aZI4JdeKTbS1YbL6HZYfanXWswWW459mL6rJa3oUJzOUFFp/
         TF/g7teY2t4PuAN5Z23v72Q3DkoZrFY3lPEfqtl/7G8qTlDyiGcwMY6Yodx6iN0tBQ45
         sjlKj/AgRFwC4wENcVHR788m02iQObpkWrlaruNsPYZedpFPrDSe8nHpAGNDyypbSR5E
         seOSGN3WSsdyy4iutyjSGN2MdahRteQU1PthVUUx16uiHh6YGb8JnDo+xYV/BuOce1DY
         Zx0d8EKTyyPdEoqOSIQq63qeIAwbbelogiEUxjHgp+2QRDWLXFfNVxlC/VpqF9PM//Ji
         5DNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=;
        fh=PV1nQss6PScIK4KSeHitrHJW5TriI4sdUy2BuQkiupA=;
        b=UuNuUyMdVYualdNIGp9T6A9gEAW9NYrFdRXxhJ8NS0Fq0KGFfmxqboQraONZj7vZvC
         80DotgQlFrQUZjXv/BBh83BCENmbXsGe7OSmbhg9PQrBMTZlTwZaPOhmTTLZbzpCRJ4D
         zcRhX04sIN2o1Hghd0Hxhm9Tx6o9JJWjgWVCpfNGs5VWamE6/aWT8dACsOVRSP4j/oOa
         EE6uzK9OjkXutEroRCtDmRIiQxaPVtRf5ph/AOP3ZPHuTOcw8bGgw0mkwUqIftYRjzSi
         5vJp5KM6UFslUmRh9/A76/vmSQSmEAiikyC9f1eZ/KS6wQVnYknincqGkxGPUrmc4ULX
         Q/nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563328; x=1793168128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=;
        b=OFV2WDWal7okguttPyD6u/gnNRBEBDGGN23ajd4BMHwiSMotvbKAnydynXHX7iKpff
         pKgDZetNTL1hB9CiibEUx4CgrDHpY03wbhHUKxNJXUUoBH4uhAJ2m10Py3uMpVD38KB0
         +UcWfTu7rnZXw06A15AvaVLzN2/4gLjuWgn1AMUMtT+o6sjIy9fKKa+PQIKkcr9d3QuO
         pQpq9RLpEoOgyuEXNCPKqegICZENI5Ymr+k7CCsYC1fvnU0MexnSuQ3x0b18GRl1bwuU
         iWfNaPoftyx83nI/3YRfdoXfNTnu6Uu/WqEv3e0ps1ljAwnUJSwVuQgvrj4hFnnti/Yg
         QWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563328; x=1793168128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=;
        b=i/DZQan0l1gyfuk2kx5llmbSJMfUO4wclVPKNwZR7s91zQkwYMWjkhq3sQWIFd/2aJ
         I4XdkhJ51igogvSN/+MkPjXGLEAv8FhKmM06wcy3WmiN4Y9Ut/vXGyjLiGrM02kN0oQu
         a3HtNbuMNPUUsr5IBiU/HwvfLXVf7EpxVU3RYS5/t6Y8woxSsK8H4oat3nlfM8h04u5P
         nLPsBKRlXOK8dAXI39kZ4KK6fgVW8akBJXDyCTnSnZUxqADQs1f8mAAUgqet7anvgeRf
         QiL5JbP7D4WRcyGoDUuB9vH/z6OO45r7hgGAEMFYtA/6KAi+KJXGqyqcmQUNl50T9CGk
         nTuA==
X-Forwarded-Encrypted: i=1; AKwUvBxzTeTgaL7rBydmmuP6L4/jGjln4IqholjKbMOSk186F2O3SzpWefCC6grY2qKFiQ9jGpYyabdr87F8O0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJwVk894KrRjKBPnP8zl/I8n6WCZkfdJv/KZnD+sroK7C6OHRe
	TFf+blQio1PvwTzaBudqsswaJHJrM0VLiBbXZ5haTpWyv3lAhoFkCST8FU7bXcjgMzYt5RghnAJ
	uchdbqSwD704wLXY02BpsfXllJYOfUFI=
X-Gm-Gg: AYBFou3v1DkyNZsgoe5+1gWJh7bFIU5dfYiL1UES56xvLCZq9t6Gx4+oTRYQSytg5KT
	EBIEr3M1B+eI4vgf6SlfZtn5omfX5+r5YJKxk8eep8bTvIfSPA/EFA1C8RePGyjlFjxhMS4fgXf
	4HRHyUfxc/ar09mOp1ukUyPrUdbMiJ/bmw7ZzPNEESDp40QDIiBnOxiD9gEmKfL5rm45hcQyk83
	fRoWAtbWYlDVbgtDAGSTpSwBkKZJ+bNFCkAW70LAGoNW2C06DDISW7ZX1dFP3vMZ1VHT4hHN9RI
	xJX74HM+UFelB/brTbcN6bbtCXFHg/ny2pya048GuqQQJ8x3HNsUGNLMMyZw0c3VA9219PgZx5y
	nmcG2C5T7XxZ8vpal0h7T4iPUeXzNSUwAub/Ffg==
X-Received: by 2002:a53:d046:0:20b0:675:3ec2:25e3 with SMTP id
 956f58d0204a3-67a0e4ad344mr360129d50.50.1792563327812; Tue, 20 Oct 2026
 23:15:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com> <20261016125229.1798791-2-thi.zirnstein@gmail.com>
In-Reply-To: <20261016125229.1798791-2-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 21 Oct 2026 11:45:16 +0530
X-Gm-Features: AclHuK-ugPzahDAmlROiGz1RBDDjU0-2VRqDCBg2WtlQUTxJejI8BYEhLT9FIjg
Message-ID: <CAKfKVtHXPmFw_x_rzNQeunyudaaw_AQMYgcmvFVzM_tRfp_+=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] i2c: i2c-xiic: fix clearing of bnb irq
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:27=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmai=
l.com> wrote:
>
> Add a function for clearing the bnb bit,
> It waits for all preconditions before clearing the bnb bit or times out.
>
> Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
