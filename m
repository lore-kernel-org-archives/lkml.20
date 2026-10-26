Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036076;
	b=pwkG+xPNcDoh2LOWO/2BqPrfD6a2+fiqQjqHziZvmmE2JKB/8JlyLGGoT1HfTvMduBI8
	 7E/xQy3mX1+augBaWyeaX2hpQKo/jM1m9EIdaT5wM4XYcRHuiNCEjApTCjS1aQatrPjOG
	 2a/pzyMzkyQwHEvKb3hADybGloJPnw3EBL2LIN7QLvIICB87idmRdovS4/oz8DwDHQcv1
	 RzBFQ3oR728SlIj6a9FQSqKV3RJ1nweFk0tiG+/nItab29KjuR5KbfyijIUs6f7Cytf++
	 6EZXb7XnxcyOPgiIONiHaA0V9w3fzHyd+U91i7TBEGQS8ctJYiYoaDArWs9N0bxFIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Dx/DuFDwajeljunningJPz7hr9DVGjiaRiOEtdUsdMI=;
	b=MKXCSIUHPPhfvXhS9iwbgOediGFcXAzQUvovpIXnL/FLqd9DRhF0K/5yP8M81hvoft3N
	 keiyEyrQSDDUk05gDrYcIN8+0J9ux8AYuJP4CLLJnkwanPekW0DOarf8+l+sNAzC6ZulS
	 FQEtRy8+dnKm29p8D6xIkYm8sP3z2+HCAzrKI1qwFKfbkkX1/tFh6uCF0E6S1jeC64/YC
	 ocwo92PJZngm1ihX7yzad93NPzlDlrzO2CU5ZtCtO1j7zUgDVvBvLdcDhIEBPrR6yY4Bw
	 ZosaUkyw4rJXnKlyN62d3MtNLspL5LH3PxpQWR3sl6UzETfFuqkLw0JlQrFutBIKgSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="LL/4K6hG";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD493606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD493606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LL/4K6hG
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso497536266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793036073; x=1793640873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dx/DuFDwajeljunningJPz7hr9DVGjiaRiOEtdUsdMI=;
        b=LL/4K6hG2ppD/7onDR9EsIr/yRcHauGUllNjczgxmKUmxkZxA7xxVLkQNWj6Ax5Xjv
         yioD02ru1aOzpt6OGB6Jh1jfUZQBBt2CJ5/IM6UEd9HFrlnb675dSf2vmmbPzIkO2XiA
         1/jfsZVJwwFcdh6UBv2rBgKbShChF6Q1sh5K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036073; x=1793640873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dx/DuFDwajeljunningJPz7hr9DVGjiaRiOEtdUsdMI=;
        b=HS41U1PEZJFENkJpxABVniyjMbJ87kTzqRAg7tTI5pHP/7cjKChNpk8QoGDt6l3Ph1
         hK50lRAncXCd4oTjv2v9A7FNHdexgRW/bFo9r9rXBT43IdQuNQMsCFQfsT/pDCeGcwKl
         DZpPVuJlV/UJQPhgbZ8vJub8s3lWidoFJXdo3176aNLGqDZk/6DsKayCfiNtVIDTvmhv
         cuzStlknY8ORBlALslNmqlzXsmLAiR6pq1cCfjdYfj6a+xTcTRoF6qG2i8aa7UximIg/
         uMRqvbQDxwdbJc0absIABFrTmBOI7/YDZa0Lp3U/ejUsVJbaq80YTgDdEpDhZVtC6TU8
         X07Q==
X-Forwarded-Encrypted: i=1; AKwUvByGLPV7CajmKZpbE1eL66/9kmgz0t11ZDML7DJlG8LL5RVwCPI7aW4rhT2UXAoVzqQGt1u6mdv+kDH6SWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzK9bhLdDBDP8EnViTGHNFJMSFlIbkiw0NSGjOrv+ItXYu7WGT
	8e4fKv+EoT4bNRLhc31yg1EXUc7UoxbRDKVm9CQSYmWBywzIbN00edtBpie63CHBhGpCe7inA7S
	jWvtbp/I=
X-Gm-Gg: AYBFou3Hmbu2HrfsoyDdiI3l3/8oo4GfCuRNSFt6kAyj5dF6f/rIVp/T9sXHW/O/N/p
	qlb4WQx+y3cj157LnzdLowMBTvxA4As96Wt02moEDl+CH6JJk79XNl+P2zChORb9gbiXFxK2s6A
	iVh0pzr7gq5nKZXDw08zdOVu+J1ZmyBxNV/K8rB2AM/0ihY7N9eh0D6Z1c72p36RnQaAgOEt1M7
	46yOkL2dRSnQmA2Czf/+xk/DE26D4Fh5CkV0QZTtR/gTfr7VqhkTEIQenxoQcYhF0dKcTqyNypH
	hsY8gJImk95PWv7V+44S91l5zgKMqHn7byPO9tB0dxsIlO/4dH/cLhYblwl1DQ+CeT/acCKIAkn
	WyUaRNut8ohpSqduo1evUzpI3gt94/l8OBKr75jpGYa9Nq3V3TG26m6Ey+Eo76Y9QQIb7DHS74m
	IrcpcKbQW29BTeHtS6LmIG8g6IBfyCgsJ1pCc31vEnpikQlqnAjt2xOurdncjOXEdJneEzJkdUC
	Ym5IUZIl4oXu2Z0NfvqNslgnJ8lK6nWLmmemuVGjoI5U3ZuwPSqcUlM7vydIJpj64dj9a9qdB9T
	VoWzdAoPUQfIPfdi7RiKljPT1WVxsD7QgcRnmLH+OndxVB+jmJo=
X-Received: by 2002:a17:907:3ea3:b0:c42:4750:8d33 with SMTP id a640c23a62f3a-c46bdc5a852mr858949766b.28.1793036073121;
        Mon, 26 Oct 2026 10:34:33 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm336938566b.19.2026.10.26.10.34.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:34:32 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso497531466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:34:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhFNjKq1lPgbAjKptGdcMtAhKj20C++fMu0DtkNTpIwWUps9RvtWnPjdeTzLSLZSE/Cf6MOXcuPXp+K+c=@vger.kernel.org
X-Received: by 2002:a17:907:1609:b0:c41:6de7:7dde with SMTP id
 a640c23a62f3a-c46bda5704bmr880973566b.4.1793036071209; Mon, 26 Oct 2026
 10:34:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan>
In-Reply-To: <20261024185058.20410953@foz.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 07:34:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
X-Gm-Features: AclHuK-9LtsQ8uoYEEPBmRs-daPP1qy-BHJiAjrb8wWeRnIp0Yu9EwVzE_I1k4M
Message-ID: <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Oct 2026 at 06:51, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Sakari Ailus (60):
>       media: Don't hide I=C2=B2C or SPI drivers by default

This needs to be fixed some way.

The kernel config is asking about ridiculous things that no sane user
can know the answer to. And that change has made it worse.

Asking a user for random media drivers by chip ID is *NOT* ok. It
needs to be hidden some way. If the old way didn't work, some new way
needs to happen.

Guys, the kernel config phase is already *the* most annoying thing for
people trying to build their own kernel. Don't make it worse by asking
questions that make no sense to a normal user.

      Linus
