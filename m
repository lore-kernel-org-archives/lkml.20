Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424756;
	b=zRnRjkaE53ifhJT51vZE/3egSeW0yZ5iyXYK6bouKkVZId9tpdri2MM4fKyXhgE9RRUS
	 KKCkURGIVnEdpt5bpZfKpaKmuj7ZASy0bAPNuEGTfro7zxqa+Jw1CYYFFDxXE8bQl+yZ2
	 CU/EylrtsqCm1SHGz8YvXPeQF+XMZkSyMB8cnS7eSCwdZmnUBw8IHpsI6n97W4FTtbe+N
	 3/itC8hLd5eSedNCOtjjCpol9tzz3FQEfhPs/WrUnsNeA16M7DjQ8KvP/2mCgP+NTb1nw
	 Rce8vJZP5pr98JAFUG7HGP3yYBVgJANMPjKxWNxADD7MojVTEqxFkrNVFVGIavmrc0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NXG55VLQRWz9Ej2hW5tTgWRoryYzAo6LPvqb9XxJLWo=;
	b=GIg3nhco/j+2yl0Wsg7cCZmFXWd5OHNcKkRTFVyO20iMMKE+MzddW7RzzyQoEr0r+DkU
	 ojPaaaDEmeEy8Y5aqAcbQUuoYqWzqPM8Q1zrhDxijo5Uw3TIUtVDIEL027ID2uGf7IrKu
	 3dZ6CVJFQMcAOK0mDyyrjHZED9KEyHblWoDnb9EcRMAsWHE80OzzcsVR+7BUo/vLbpS7k
	 DwPymb5zzhkNob9gdyyaTV1D4lRpaGPaLnGsZ93dRRNcPU+PIoffbRfbsXmGe14JP3Pmg
	 tJpD43aJFka5n2H1RI1IRxU27Desnnw1/rP6KQqjXnshdvWzPZkyOBy7kNMHRRogPPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=STiXiqeY;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D734606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D734606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=STiXiqeY
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so523709966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794424753; x=1795029553; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXG55VLQRWz9Ej2hW5tTgWRoryYzAo6LPvqb9XxJLWo=;
        b=STiXiqeYvcFbTGHUlI4JwJr+rKVsfRQG53PgERRAnSBworOfPR8tgLGKgoPUlG2x23
         cPv49znAnbU0hBAmeX4mbOkE+52AncpMWFmQG4fYJO0qzk6PftJj7+MlFGcSr2YKscH0
         TTtRwcRQEkanb8EaMMgY4+g2BrDEMvjxLP7iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424753; x=1795029553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NXG55VLQRWz9Ej2hW5tTgWRoryYzAo6LPvqb9XxJLWo=;
        b=HtiPm56yy1ALX34BtgiyW3aHertjdl9JLv2sa49AUBr3AKP5x4/tcseE/hm1+gCuiD
         S05mO6Njiwq3ykqyhVU+k9UThxzPCjzKywJ4xax5bXs2aJUbd56ZQYtGsMISKUOvJdhx
         ZZW1BZy5Q+IOd30sJsH6oGtpCAztWnAEi61D5Ly6h+hC1MpwYBLePH59A47CiKI9z8rN
         4xIX+iRWFj0dVNGU/HEFv6lOyth/5ruOecuBBGcQShRR05iCArmZJjYuds8gynjsb1rW
         77K7t8bJSDPnFQ7R5YD7Qv/r8ROeQF9UFPm5tS5OlKnU2L2oFwTFTpjwYxpbyrscMSSP
         QeUA==
X-Forwarded-Encrypted: i=1; AL+hErGrCqit06FZ0sh19Sq3t5Ft4epzLluOAMFpqfVCjJfrghBejMnrJp9uXuUlkGas4qkjaWMno6QiRRhOfvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9inO/cZKHDZpQ5lSdwJYVa101nOu1XtL9M3B4ktDzQD+EgFb5W
	HCCQFOV8AoE6AEEZXjFUeqgf+ayWU2eI76J7HZZE/k9HvE9YklxBNH2+4Kj7Eh+3uYS152liPiQ
	CSS0UkrY=
X-Gm-Gg: AYBFou1eXE3hAGOSqIAGfZdggo3ru6WmgB+3J31t0CJf95v49QfDhnuY5aqh5OkBn8b
	G2WJoIxLpJCQ4rybbWfA1TTzCKWb9obfdZfenZPmTJWKHlSIFBbM7Hbjz2QYCr34oX49vuCruLP
	IAi9WBaF5+4C8kPYryTcAh1J5HEPXlrmNsGtDCLt/kxhL2ps5U3xHMmkmFeCuOUGgSeikW2npaa
	OKuSXjbH8Xx0d33jWc63aT+i4rR4CkOCR4ASxtPQxeaZvVvpgwUxBW0Ko7E7gymbWdlhwQCQg/v
	A0xAZXPa0up//wH6ztys7XDtpYMfYn2K3djQe98n1EpggWKt3yVxAEDH0jo9Xd2w54LI5HqYx0e
	SvxMO8AQAas1WVc+p5IdWccwRBUWSa3sPaA+ZOlwU///3QyngAjP9E8aDYDvoXDRN0+UGj3tMy0
	q6F9d3Sza+A+v7P4yQqqN+x/dgYVZqusrvsSsBg6LkO6acG2cs/1NG6mHD7yAGMvOd2Q0zVqBKT
	+Jo1Kn9hQETyhD+Xzn5WBOzqgHF0fOaMc/5zBUXoV/qxRla8WYgWjxvzIFebSLUX0dfT225DUvz
	Pie14YFuXY6RxMp2SldFU/CKdJsLjBdJSYdv/jFYjeEl6GQyj4cCPAfPvWDpnpGwU2iP/zvKjTN
	izg==
X-Received: by 2002:a17:907:ba01:b0:c4d:4ce1:e2b7 with SMTP id a640c23a62f3a-c506726ee0cmr269722266b.34.1794424753478;
        Wed, 11 Nov 2026 11:19:13 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c505d78581dsm177004366b.80.2026.11.11.11.19.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:19:12 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso513100466b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:19:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFp40buVSCdz/BEb6AjGtt2QWy+mq8bb91nzWYlLhyKUdGhwD67inReD6khT7dE1O2XRSsNM07L8BLJv6w=@vger.kernel.org
X-Received: by 2002:a17:907:a805:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c5066d6ae19mr293546066b.40.1794424752390; Wed, 11 Nov 2026
 11:19:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org> <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
 <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org> <avS5QcRj85yAm9ll@thinkstation>
In-Reply-To: <avS5QcRj85yAm9ll@thinkstation>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 11 Nov 2026 11:18:55 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgA6=_152qr3x6FrD2vmw27moARkQbUjsJoehXW-aAZoQ@mail.gmail.com>
X-Gm-Features: AclHuK9Un7jYzso2-pBVjOWTwZ9BRGN_Ct3oKTQqbfnCyzJAzUmyhZM2iKBUTgE
Message-ID: <CAHk-=wgA6=_152qr3x6FrD2vmw27moARkQbUjsJoehXW-aAZoQ@mail.gmail.com>
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Tal Zussman <tz2294@columbia.edu>, n3rd <18670333770@163.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "ljs@kernel.org" <ljs@kernel.org>, 
	"ziy@nvidia.com" <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "security@kernel.org" <security@kernel.org>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 11:13, Kiryl Shutsemau <kas@kernel.org> wrote:
>
> The report registers RWP alone. That is the only setup where the access
> after collapse goes unreported.

Let's just document that as "don't care" with the reasoning.

               Linus
