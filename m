Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207033;
	b=FaXrqTf/HMSsOc2jsrAbaE6ek+kJ8k5EdLA/353akh6fgb4cZOG1rprCMKZcJuwGBCSa
	 AFs2RWyY8CG0PT6GaFhyMHbCcPntSigVyxc3BZE53MCXD1WeGCOXuci8P6ZbRqsdIbcbY
	 Ky+IdiHZUSJnTfDwxlYL6vnDzRoafze/fZLTRF8RZ3gUVX8PaNIGN+u6tsr9UEl/1XNII
	 MWuLuEl+HAdptcUiBDfIr888GEp3c5HJMlo2std5VSnTpQLUbkZlLSMqo3Qk++AtmCL4L
	 CI1/udoNoDrQbphoZSqM8B+HzhCQ4tkH+62HvWIoMHIRthIxj3vJa4u78gL5qO1B1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=h+YDFIcoYa8WhHiPI5vwzPAhBMAspg9LSUNE5xsSIjU=;
	b=0mUqPpJBuhgOfklWRNqzR3fbkyrQGHQDANl+Rm5sNYBK9CgYPCRPPbMwlqS92wk33oTb
	 cFNAIXoGcodrOO+kWgVI1OdWgVRCOu1Y6olSQQG/kNgFGxWnthhgkYRc4/x7Vmzke2+HK
	 U68EBPTdQwI0c7WNSYevMubKThSSJwuAm5hBKEuNi1Ab4WSffeK6nFAFWj24oQgZQIIhP
	 owCZfhYAZPrqcH7xGyN58CeDOUBIMk3XN5aosZqpx8mwy2fnBBn5jxwy9FNFXa1MoROEt
	 armKFsYA83oa0GZGxj2MVjhNfy7MTsL827beLPHXb5aeNfMUYZMVoUvDWNfvNzpWGqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HJEmqlAa;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBAA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HJEmqlAa
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso3884198a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793207031; x=1793811831; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+YDFIcoYa8WhHiPI5vwzPAhBMAspg9LSUNE5xsSIjU=;
        b=HJEmqlAaHjkokdckwBFUA42WhJIcz9eYNRImMUCKybu47xeRiO9kKcQsYJKOdBO5Zh
         LKzh9JrwNzC+nj1WvuMNqlkEwBgxKoDqp0EgV3cQXUGIFu01XbIUNBpJC6xxv0ra2F7a
         /y2VZ74ySU5NGD4KpUqDA7Vm3WYshLPdJ0PRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207031; x=1793811831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h+YDFIcoYa8WhHiPI5vwzPAhBMAspg9LSUNE5xsSIjU=;
        b=lr3xNqUKV3bjgIvJYM1gzRjvKcyfX63I12JkOyqJxgtc3Op6AnO7r/JdwIPl6FhV66
         CQu8iFNtE/genTGONOMKpArl0AxkFs9SiKgqLUR5iERI7oLRKHFpdWe6YPnmJyyGa4zQ
         +6S3xGXYqY3Y8ktxUaGyQjYG00Pnp1CC5iGhNJL+UAyBXvGr7C3oSvBNKhnBLj4AmbhW
         6nBkaskzMwqPq/ZOI9jL54Oevbnd/dQuBYBd3o1iNlnYUfrNFIC/v3ykp+zu7foBehxO
         OcymbWXdQgFbQrzZBL8PVrZVOye5NT3y/pY2Wpw2TnsaWHOILYBqalJsC6KtF7efwhce
         CbbA==
X-Forwarded-Encrypted: i=1; AKwUvBxm1DulRImWJPSPzNf0VNf2pTcp5C2ktZTZZHo3nGfgpa0ipxVYN2P5btSCR4pfoX2xwFjOFFCIUWwEFOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYItlm9V1WUVROZgsPOOZNncYlJpsWNN1jTU3En5sTm0W9FnVWgZ
	7FfCr/Li2BgQl91c+tU04QjNM3hqU+oFAOO4jiESK1GkxrGrfN3vcVO9nrEIbfcncBrC/HUSpBI
	lIMm9I+E=
X-Gm-Gg: AYBFou2oLF1HoP35KQhUDR6k84pH4yjZduPdErsDgguHeYPh0fUmddAllqb1xFKvvvY
	Gnjl8CULgl96T8m2LuI/VL6Jo9ukRXWH4rTDrbSxl6VgfuR1XhesIygXDROLL2837p5yrTcL8Wk
	Dx0W34XDIVMHxbhJP3+Zf+ARjxv6JLTmrjPMECsDp2imzDcdAY/Z/E80JmhwTdBCJD5VzaQA0hh
	dfAPxh9TdNlCs4UR5Kl4S4uRo0kBVAGbzvMBpRiQ86eVU+nCcGIkyR6N147o9s5ZZY7IjSjryl1
	EV9XbIdiW7zBxlbXLVD3JbFdQEQj2fIOb/bq2Tx7pAphmttGaDDE0OtmvYPxJKwFlBXDqTQKxf2
	HTFEOOlT6PQwPKN167todKYnIJ4UzdzOdT8Qz6OSEOTU266Th/SqYgdZsrYJ3k3HCBKdZbs93D6
	Q3e2DX7ffJ7gzp5Jr+LpljbpISBvpNKmSUmUrT7wjNsQiUxAB/keoJioQPLPpl3FHHS4eyfCG11
	ftkJ1lw7P174cXE2UcoYQ2iNVOkTSQK2N6uDc9ja48hWHDIBroB1dRgjhJ9W0xEqobsZBLUuAEE
	DUJluvh0ZIlglGZZ9FSnKbHPr6166SBM6ZXFJ8iVA4XQh9rIh0unnkoxMeEmwNfwK0TgJulxhn0
	AY/g=
X-Received: by 2002:aa7:d447:0:b0:6b1:b9b0:dcfd with SMTP id 4fb4d7f45d1cf-6b4b094791cmr152003a12.0.1793207030573;
        Wed, 28 Oct 2026 10:03:50 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496447e8dsm1774945a12.30.2026.10.28.10.03.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:03:49 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c40e30c26a4so380253266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:03:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2yQzomf7AdcVOx04icyYZ3SFnbBPcyMbH5r6kuj9r8MUL78qqVLfMtY77o/suExKbKyeTOmSRnsVRGh8=@vger.kernel.org
X-Received: by 2002:a17:907:60d3:b0:c42:fc8b:6c6a with SMTP id
 a640c23a62f3a-c49d11b4b51mr14802266b.14.1793207028992; Wed, 28 Oct 2026
 10:03:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5df90753-163f-44d3-ae93-c6be6ca8647c@gaisler.com>
In-Reply-To: <5df90753-163f-44d3-ae93-c6be6ca8647c@gaisler.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Oct 2026 07:03:32 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgrPOQTFxy-mV2EaWLj9RvHY151sQTQ8jc7e0FiorhvDA@mail.gmail.com>
X-Gm-Features: AclHuK8-USVJR-1T0Fea4kcfA6l9aoyMDdQza79RH1k9Ebxwlcs6AJdMI4vWZl8
Message-ID: <CAHk-=wgrPOQTFxy-mV2EaWLj9RvHY151sQTQ8jc7e0FiorhvDA@mail.gmail.com>
Subject: Re: [GIT PULL] sparc updates for v7.4
To: Andreas Larsson <andreas@gaisler.com>
Cc: David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 03:44, Andreas Larsson <andreas@gaisler.com> wrote:
>
> This includes the following changes related to sparc for v7.4:

Send them for 7.5

This is the second week, and the commits are all apparently basically
just a couple of hours before your pull request.

The merge window is for things that were ready before the merge
window, not for hurried last-minute updates.

               Linus
