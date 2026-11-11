Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434387;
	b=qQPgPbQrArzHO6K3l6jDG+Tn35jyTXunWyYtLWXMN4c2JvtXk5UqHhnZAsXyYcAJhrW7
	 /9tgG+O8qoHMgIbIy4j/GaB1VrsyAeTqkCVxQ8bm+3OGZIJCQFOWTgYNJyVukImVt3p/r
	 jZl9h0gQdwRX+cERISdyhApVzwnK2u2DGYQOMfuS+I5xC3eWq3Kk+NcSfk1oBcFJt1BmH
	 jp5Vi9n7hCJBJSbvSPtEmRXvyxPCHXrQFLTYxOZl0MO+T21fBifZp7spQJpCGCGmCM4t9
	 kTXJnJVWCPYcqweMmVJF6oBwqyHzmauV0qW2EYWL9us7zucgJlVxgeZlBvhi+FowTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BaTRt15ApUolDeSrcLBJmuIxxr7ecXkh8ZK/IMhuYFw=;
	b=B13SDLhndCX92usMB9dJdJ6xenpa7ZbkqSpps1AqxC+dStMDCh+FNWOQLWlPR1e/gZVv
	 TiVJHyGWCK8l3RboIJzbqiWKM1LEHcZI5Ue4fngDRHlI0yhkSHF+FJ6zmb9w2comteEhP
	 gzmV1Q9/YZyxQEsprUrKipqPSrF2C+F9lnNeQYfNCN+Pu0AjSFK2hHeSWQYxyD0daPtln
	 Azyqo47ge5Mjwyn1NJBhfAoJKu5GzY6kpkc7tYBZSwWltLFse3jEiPT2aVmUKy9NPlc7q
	 ItvDUw6iNty5uIoDZGXp42hqUOP1DMZSAuP+khMkeENAKfIu+vDgy0sDJSqschY1BcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fuzguPad;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD3606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FD3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fuzguPad
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d58c50743so346395066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794434384; x=1795039184; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaTRt15ApUolDeSrcLBJmuIxxr7ecXkh8ZK/IMhuYFw=;
        b=fuzguPad0YR2Wlc/2qkdh8ljovUpOTduzVPdtk10yuOOWE9jteHfaof9RaD32JEo6T
         zn7l7EMToXhr2e0w/iQWxxxCztnSVB5sgeVKTSLkF+8LxJLS6RIIE8srMK9fTVdw4mrR
         hrnsKjx4vVV1fRj0Ipbhxr5naPzESk4veJjHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434384; x=1795039184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BaTRt15ApUolDeSrcLBJmuIxxr7ecXkh8ZK/IMhuYFw=;
        b=K9LBoGQacFA9J0tYdQjBLjTfmZ1T4UwIlW8UUq/i0tlw3ke7HRgEaMNAgRlNbNNelr
         EkkJib98KMYIofQ1xbFEmDAnRwm3HQ+B+TpvyQGtlwbKocDQeYF/EKsUKnC5MiM5ijfU
         OXKij1QxFXZwotJrz9ve7ZY9VCZ1UQ5a1Kpe7f+nfG2JCBWiYVLke/gGDjpMHqZFa+RG
         CngYfgNwhbmn292aG/ihZHfQUghNALaRGmCeuwjz8PTrhnr9/JOUU8GHHAqrkSppQXwC
         W2GLuuZzDlwAseCMw+syw0HNpYyJpkRfqeivLx8YCKEjATYUk7OIlEmkZWIBDQfJLx1b
         YNqQ==
X-Forwarded-Encrypted: i=1; AL+hErFIEt9El3ZS/YEgB7+RR49KoobI64f8Vx62Ng53uHeH/0uTblQ+tBx+VHzky3hLuPkXjTkTw3cd2CwQpME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v+udLw3Cf66gChwEKi6ER96/I/W38Rn/qQnkrMG+qaZSGAdcZ
	ukzVPoZDgteQmJDx/UzV4J9te6VA46DTGCCJvys6MrecRVlF08p9LoLuBsDQv4aBC6MnDvJIV8x
	xcNI/lH4IQg==
X-Gm-Gg: AYBFou086VaU1Cq6VlJFxKEylUceO/+jhJfbhgtUcndrqnxRkDDrlUP3mIwX4ctazw4
	lo6B+gw3vPrFAT9PTRDomoyosn6INz1y/KRq501HXN4oymXOyIfIE/zAZj7QloEazO5A1ge9VFH
	Ow3wtqa2cDWLPRsOEGCvC1Kh3mkFGOX7Lxo3wMUw4w9eHb7JY29iSwW41YpVALeKcPHLwU32iK1
	iKcm1Jw9iTVuWfmWqH7T76YGRnSUQP83O0k4aNFH6yX+AJ7/UHhkGGNoJU2WE8wOR+ZKNx2RSLz
	hhpLQPkZsl3udZ+NnioPcsWjq3ugOuBnFqg5sBNZWJ29oL5otSJvQSOZmnbf/AlrO5fL7Imo1co
	99uZn7r0GmG/AAvyoPJuJ8dTBMXBSjKcP6PV1gMJnymYlzuZy+BNDCIo5czQw0PJHA/6w8gQOAr
	wihhGDXMSXNLNghEhxhPKQDUzQJQpGEc91h4aY2GHL7VaB1fvKWpci+2wKrdVT31TdyYB+AZmEe
	MXx63i0JpwdrBLDNRD9ALR2ZKvegcpRAFmZHjwyRIdSKpfx3ULwG56sQiVNCRZttPdiXENLmFNy
	SsFyAO26n0sFd5dHawO/ThSbJvY9n7zPUpZQWI6ImekK5C90n65u4/nD1e9foKUMwJu3BArUP7K
	+wTM=
X-Received: by 2002:a17:907:3d90:b0:c46:645f:cedc with SMTP id a640c23a62f3a-c5066d9855fmr321962466b.46.1794434384590;
        Wed, 11 Nov 2026 13:59:44 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5704aasm271658266b.25.2026.11.11.13.59.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:59:43 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso3353709a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:59:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGl5EFP1kKJbHcyhujQfaJKRmyYji1ejVSgm7Tf26Rk1EhGHL56qsiftrddGB4B5O1bynulqOiERQzG0E8=@vger.kernel.org
X-Received: by 2002:a05:6402:22d9:b0:6b5:962e:e017 with SMTP id
 4fb4d7f45d1cf-6b777702145mr2015975a12.23.1794434383079; Wed, 11 Nov 2026
 13:59:43 -0800 (PST)
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
 <71e24630-4c71-4518-a9b7-68cf3597ce80@kernel.org> <CAHk-=wh=cVrn+xs3fZiPW=kJbFQLwf_C+c-YBCR2K9s9aNE_1Q@mail.gmail.com>
 <72f286d5-3f1d-4350-b463-09f7b320cacf@kernel.org>
In-Reply-To: <72f286d5-3f1d-4350-b463-09f7b320cacf@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 11 Nov 2026 13:59:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wirmEK8a9M+pGP=zdQFkw8zfZuswnZnC9zF6tjVSnqNLg@mail.gmail.com>
X-Gm-Features: AclHuK_wv_2wxvj6t-2tq88pSMUsjoVj5lgIf450fMFrxt9uf1-VCJJrV8dZfLw
Message-ID: <CAHk-=wirmEK8a9M+pGP=zdQFkw8zfZuswnZnC9zF6tjVSnqNLg@mail.gmail.com>
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Tal Zussman <tz2294@columbia.edu>, n3rd <18670333770@163.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "ljs@kernel.org" <ljs@kernel.org>, 
	"ziy@nvidia.com" <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "security@kernel.org" <security@kernel.org>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 13:35, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> So yes, no new uffd features.

The one uffd feature I'd actually like is "no kernel faults".

Because damn it, that has been useful mostly yo people who want to
open up arbitrary kernel timing channels across user accesses.

            Linus
