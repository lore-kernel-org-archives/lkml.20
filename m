Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606727;
	b=FAMCgJYvM2mMzu5P3oAXKQv/7JdA/Jc1SUrqRmTNmeVblI75vitOrZqHV1RmWmaZrg6o
	 JHTUoXvcQiqcCCEAlUM+Wuh04rFXhjnulJjVx8onAHTZNmFn+Xqu5Yv1e73G6fUaTsJDL
	 DUfzEmgGT3N2DVNPDyn2QQ/QYQbVe2f88qQhoe11KcSrvbvzP7GS1ymXvGPwiLnnjKqX5
	 seD6FJ5TPOxP4V9nvELX70McAKZB7H+8X0PKV96kdCaEFBAoF9F7CAiul9cIpszdMpxMh
	 OU3Lzcr0fK7BTPJN8Rb9Q62D06jp7JNpN7sXHtC4lGF0U1JImnARKhuCoAfFQ6J5ylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Cg4wsLbR69nGwHugsXyU5V9EP69fDmnYM40DdhsmFgA=;
	b=T7tlJeHYz+iZ0nvTQCfoSx++HWJoXrS8S5Seub76wXqfQpms/jnG0p0Cn5jxLon6Xbbb
	 CWVBWOwvoV365RAOm3grsPJb/gPDqJwT5nznfmLV/EayTvgVJzd1gEDdbdIYVX/68XpBe
	 OQB5ZXBA30rNWR6KLJIyr5F8ogggPVTgTmrD9xpmfwB3ImaL2Nar1XCTZRYHd/trdB0wm
	 1UlSDanLZL6nQ+o/pEJPIU7iHXwGbcwq/N6ZTVk7LVPd23WFJAMKc4ttuq8whoUgwTcTG
	 6nwNeoHeLLm27i2NaHVlu4/NA2jC0BN58VRQrSaTuw27pmur/2I5XVKmR2RfYA8CPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Ck9DaKE8;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF91606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF91606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Ck9DaKE8
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so1742173a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792606724; x=1793211524; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cg4wsLbR69nGwHugsXyU5V9EP69fDmnYM40DdhsmFgA=;
        b=Ck9DaKE8QS0maPdz0F48uDpqTDv7wOEnMIpf0wxJT+7ztS39opbB4x5LjO6kMFoMpO
         LtmruFi09iqH+KBhoctsvao72WeshydIdC5mVwUaD+QvMZhhrjG8gfjf7navHQoYa9VS
         +QQ3XB/cpOfMfPEMPPHnonSSHyCMGC3xTiLXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606724; x=1793211524;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cg4wsLbR69nGwHugsXyU5V9EP69fDmnYM40DdhsmFgA=;
        b=Qf4ws6+xtJ7G9a3jKS37Ml+VqSxPtpU2o8feRKwpPU9IQMdI0I1rkVOk6HGajIkY62
         nCcoG31cmRGnYbiwWGzWJlyzuu6YxqVm0hvpDjc3kmPfOoDuWxcUGzJbZLu79R6S3mnw
         7nl9UuT2KvNZRCeeXPX8wRpl/WUvE2IChsU2YBAEDgW1n6eh8Fe8M4et5t2agDPHXqFu
         vMelLWNyIpKClttJMYD7skYlTyE27JcidqSoNXQZdYMPWvyxkaJ67uaTYecFfL5Em74U
         c7fnDoJMdV9oZQJ5lA68vzoFyAx1nx7EVuw8d8TxWXmqd+Jw0ffqW81Iqp19AkUUt9YX
         Ohaw==
X-Forwarded-Encrypted: i=1; AKwUvBzc8RC4UwN360pfVRFTBb6e0TgNLIVm3GfTjeHcTEWOqVdsZOcuCJGk33TCiSEpTYHHCAsqoNSKNLWOuqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvHVwtihVH3CBv7TA7fvd+hfwMfvykEgv+EaFd/K1uDbPgm555
	6uwInA4/dHHczCvNOSokkqG+5IOJnMwhrLgrhc+dYZteKxSchEQ8ukLJrDZJboQ3t4PVd8FDA0J
	/KMSU9gCCFQ==
X-Gm-Gg: AYBFou309dsLQ6FQoakfYyE4VDbPCX0xl95NuT88s+MAUwZ4fQJulD5pKpkE07rsu/w
	lOzRQ+XJ6Jn8XxFq5KOIfOA+zcg9fl7TKtGfL/Q3z1YXKe627ePBOamiGjcwwjqkQ1C3PWlpbTT
	Etavb9zcDWmZSQQxpCzKGHW88KB1heBPkUHw8hpPqTKeHXajrd6db3mJwCW7hk+LiQsGwAUocel
	VQc7eRlLhQ6veQm+3QssPiEmilyNnx5g0g4h0hJnz2W18HKmuuiTn8SJL7OSjbeknJ9yDAdjw14
	jb5o+ZqMw/xNLS4hM6zSsJebfGpgfJ8un8Jf8eqTAubrKEYjp6mjaX7MKts0fNshsZ1nl4JiYcr
	XigSBlbP0OXTMP3yU/W3McQcjUlLlDuTa9XY/fc9lBZI8m1KXezF1v/g9MCQZEujPTlydLgnvnQ
	yZdbp1H4S119ndjZEzU00wu/OTeVorHB5X1ONubpSblPHo4irAjIiRxzX3E0oOjqiUawHpC1Cna
	Tk8bTcqnXfoO0/RrHNeMhOykGpsqSBPZKgnysHyeRvW/ZQRVLUWXH1lnLoL6dTq/TJwqtmNHNhW
	AMrpw7ws5qHofa8+JLMUA46QYNpJ5w==
X-Received: by 2002:a05:6402:27cd:b0:6b1:c7ae:ec55 with SMTP id 4fb4d7f45d1cf-6b408dcd04dmr2068037a12.1.1792606724253;
        Wed, 21 Oct 2026 11:18:44 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db3e8sm1023073a12.8.2026.10.21.11.18.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 11:18:43 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so1742132a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:18:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxERFz0UpK9bIy5AhKiDE1u6L2ZNGqoWkF4aljLeiBxspeTc6XjPPCdK1PjcZdNLZRM14VZ+33PJp1iOSc=@vger.kernel.org
X-Received: by 2002:a17:907:6d24:b0:c3f:cf2a:76a8 with SMTP id
 a640c23a62f3a-c4679697562mr259234966b.28.1792606723202; Wed, 21 Oct 2026
 11:18:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atCpTMcAALymqADw@thinkstation> <20261017192727.2760919-1-usama.arif@linux.dev>
 <atiKeB-76nOj-ztU@thinkstation>
In-Reply-To: <atiKeB-76nOj-ztU@thinkstation>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Oct 2026 08:18:25 -1000
X-Gmail-Original-Message-ID: <CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
X-Gm-Features: AclHuK_3eGiJlTj40bQC7fcMKqS-qROWWlkQjWWB_87nXa3MkSG_CRTVchaFDlk
Message-ID: <CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, bp@alien8.de, dave.hansen@linux.intel.com, 
	dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 23:55, Kiryl Shutsemau <kas@kernel.org> wrote:
>
> Moving MOVQ inside ALTERNATIVE_2 is ugly...

Yeah, maybe it would make sense to make that function be

        movq %rdi, %rax
        movq %rdx, %rcx
        ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
        RET

instead? No nop instructions at all, and both alternatives are two bytes.

Then do any ERMS logic at the top of memcpy_orig, which now has the
registers ready for string instructions anyway.

Hmm?

                      Linus
