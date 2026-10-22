Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792679618;
	b=mTcmNQKZA2ujbJULgbly+oIFBywNsZlma9Ow9jv9vngxbLSI+vWsGuQvM3ZKo99a69em
	 wfvYdJr6eBPJzVz0rFtbklWVk3H3kx6LLfy7H28GcNd08sYh287AIgx7rzO5Hx2dq4t3K
	 +P7/6BFU/La9T7pBpSTzigeYY8i/Bxt2UpFj6sLqR2ujhp+eUlAkGklljH+NSCfopBZi1
	 960mplV7MD58tyTXzp0eYtgkK5/yfeeljU8eroflkZ2hMXgSPkla2MIvKL0UXOONe0LNT
	 eRqbmNB1hawA1dW/WtW8vEBYDpAGxngt9ygxcuZ/+zjWA7VEDFHo06+Wr6EMeEIWGnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
	b=GLR4tO8yWIBE1hjyDRPlkgUfSJB+aBjEPTEozzZp6+nlc3ilMLmHQZvKd7hLmMDQOze4
	 ta3H+7mqZn7aTbe2ROgqzPa2Z3WZhEI177XrwGHR8U1eorwA/plju0nZ+wZHZmN6J4SPw
	 GKYjGvt6tj4ZtJ9K+E8HLz/llXpPC4Od6m+a1saXEt3YjqRCHqLjJUrdGW/4pUHBgu8s4
	 0hZyndrl0eNCqNjFSpNyGXrAs3vBQ3zuk9nzoDiHQ0ggs7qSN5icFEehReZ+8t33jcFCJ
	 vGsxZW2YmzcxTyfrLPMP5aOZ09lSNdfScJFV7frwZploi/vYWcDJSyOM0hOwcxxT5zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRAZE+RY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A9606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B10A9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRAZE+RY
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-673504236d7so269990d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792679617; cv=none;
        d=google.com; s=arc-20260327;
        b=pe62fAsrh+IWw/TRQVO6NmU88vzmyytkeqhl89l1icViKXupzBjD6QOh6bInhNycwc
         7PM4U3KREtz4kuvaDGUFs2x/03n9n2xwTwtVnDyk2LCg3kfIcoPMUT+PXvKux7xIG5DC
         b00wfIaLj1849pFIPKADxYuRzIqev67E7F5wCrIAQyhGgrmJn94weS44PsfW8DlhbSac
         W5p+IoPAZ1YPakYD8elUzGa/xgcK+AI5JnytlogJBkZifo2S8eCt0F8QwBsC9Mpe6DiL
         IvKZkNa3KtH6P+jm+bvOcjW1EWhg6oTN8BEJgZis2aKXYKE+EYm6y43gZkQb4hx56s/E
         hfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        fh=KRlnM/PbkPd/aBrTyLQkNw1+pbAIRer2IzWJ6pSWuvU=;
        b=d6BavdgJyPrU8TngXwO9M2qFLbMRjbtqNY/zSCt4CYd6WrtYgBA89Hju4pLc5eINHE
         LA7fwkqH0U4tNQGdi4thgW4Jg9/Rt5cBhw5vaT6bsGdbUb3cMFS+7seAko8Cv1iYehCu
         twY7d9wE2xD3nWDsWSeLqXxueeu2f7isEOHX3GGEEO6xr/L7MIPkdU5NMxJJTDmOsh2I
         vldtLFpDQl32kDI6roKRIIO6Ep0n9hA8vzW2xgxd1KbXoNYYJkn6l1+Ihu3Sy5JDmLvv
         8hmsPVpmOEwAyMQgHqFN34R8bm3DdN37oIIeKfSkzpM5gPdPPpV09P3zudyh6MhiCh/7
         Ai1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679617; x=1793284417; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=PRAZE+RYa/Hi/i7xszdGfO18YYUcERJGPuFa0TwZR0t/KCrkPe/l8S2bcMOAWdZjqn
         hDDsdq5ywxDCW1BdnWmT1Vx22odyBbS51VQ8aTxh7sVxlPj39MtKsFf9kaDZRZt6I+VS
         Awo2q4mT5v2dp3Hr8ECD5NRpuvxWXUlDcw+V0hlIOsJyWgEZj3HdmYJzoUsq1EaOzM3Y
         GnFKT0Gabxv9cGavL7y7NU3KcEKv/Ze//jDMDIzwAsmpPiE0Y8yEZRy4JpdbLEC6egvy
         0OB1FVsaeSIl/Y8D7dEWMAKxf5Thjt+K5PGVV7iuV7wyIYxknzWorZgiLk16hIoN5wAO
         u2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679617; x=1793284417;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=om5nl3Q8ylr6yv7Y4GCeDqCMlL+u8AKgFqNdTWbA/9q4ByZyQs6+2t+HUygbFtOU2P
         Myoq8pihmRXA4ouXSTGDm84qgWEnEmYU7nirqQho6aTm4BNyV9wuJFyYJytImGw9xnnd
         JViAjbygprNbO5EhN3DozAfF8XIKV9+olT/Nfmm5pBGPKyBxAdC2q8G+V/ZUN2grtgi5
         0Uryy5jqHDsjyuHlTqIiY+mEe98F8kvwBUXv05Ha/jjLl2NRQnOiZ/3EbeWLhGs/VHjF
         GvGR985bt2eWL61VmZeIPgHOVEB8311FK6bG20/BvWD2uYLPlQ+vkHf5/Gqiu8CfSoW3
         hVAg==
X-Forwarded-Encrypted: i=1; AKwUvBxdzwf1aPPB344vh6lAltsQCgS/EctbOZ2wRZJ1wEIrA91/h85WdDeO8CmqwfzzjCd+Ycpfq+dQm1WHsE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEEZmlYh68FckjD8oWEQOoT1Kp+V5SDK7+LtVOi/s9t4XNGOXm
	vnEHNIwTE5zmEEnIz+0w1v70wixAAdNOzvKYERDnJLd9qFhl9Uw2Hv13M3B8p0/OkWxfxBmJEsc
	AUhu5FqgQ26H9iWK57oz4mT4qNWAP6Yw=
X-Gm-Gg: AYBFou0t0VJxFTFbdF2WKztkFlMDhsFm1AIGAWoFzHKBH31E1p+pT5+Xgji2kxlxEv/
	O73fxswOnqUnaKIyPqZmUYVEZon07CwkynxxcmpF3Hn7crE9F6+3+6lM9RPBCF8mKHk9aognwi8
	Qkzhze2wys9x94JIlU38+z5W9sfkCYRKp3wMsS+5zwTQKghpVFEu6doxiRFUQ/xvuC9v4TEk3HS
	cARCFc8asMRCElZBGa3i2vItDebrtMbUpRu4/KWyhOIsiGRsf+ToqbrQG6RsIZITlZOTLTuWE1Z
	lAMB9LCTMN3hfDc1yPyaqopyX69PPBZt8aG9wLLNJxTs8pGaykNv+VRy39DdFi5XC43tZ/oXifJ
	XLCpxfgBZph24mH6Ol68JKFcoATDPlNYCHEQ=
X-Received: by 2002:a05:690e:4504:20b0:679:9e25:316c with SMTP id
 956f58d0204a3-67a0e4f7118mr3858513d50.5.1792679616649; Thu, 22 Oct 2026
 07:33:36 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261022021820.1789083-1-odys.yuan@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
 <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com> <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 07:33:35 -0700
X-Gm-Features: AclHuK9KZnLcDmcb3UzjebEw_JXnOgl4qhgoWZHIOId6L7KU5VJDln5TqsxLBMU
Message-ID: <CAPAsAGyA=WG=z6a==N3O6oan6WVmZS-VrxEA7SrxRQs5d+Dsfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>>
>> Why it's open-coded ?
>
> For the same reason as read_word_at_a_time(): commit ece69af2ede1
> ("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
> it "to avoid having to pull the entire instrumented.h header into
> rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
> small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
> instrumented.h with linux/bug.h and kmsan-checks.h.
>

That concern is specific to rwonce.h being included from very low-level header
like compiler.h It doesn't cary over to word-at-a-time.h

> Thanks,
> Qiliang
