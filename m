Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515536;
	b=k15yafycgjpYHrthbLwYthHxj1EoM3TsVcF4DhQtPmkRd8ScuvQ8hzN3rsd73QiU5fI6
	 3kQSzKCFXzzHsGntXZO0c8QvRtd88Ij98iH8AVWAeKU2aO80eRM/Asm9lilwCHmS21649
	 sf6vSy45kakZc67asZ1ZISlwDneG/GBQKckNisEpcnyP08nGuz6L+pF/mrJUJnebu/+MF
	 wiHt5rcaSEX6ogZuxod+Awj2+WDNxpnTooqhA6f/0wUjpnBIdAS/zQIFfbLjF0iwyQ14n
	 UMadH7GbJ8Fy1b6zySf0cFcJxVorQPKiPo8eVY77vUHtz2hN4jUf3CGUy5XELwcraAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
	b=3Z6m50G2N/n/9FeQF+po8RXtGrdnjcoPYRX2Ze3IGAVj83mpInt/Dhr+OcIgN4NIrLQM
	 sv/5sRwjMDqZc55QBYNGz2pFf2PjO08EP43orfLAPkYNEm3A9AuH4HzmhJc5l0OuBc5w9
	 V1zO3nCUUxgOaGE7L/azwbqXNHNR/8d68RyF5AQQyrIVMK6BfShuuux2MTnU7J4CKHJ+9
	 ts6tLwYTPbFG+v768g/jXPBmlg1lkMPhgE/pWL+VrkFGZgZyO4PNOheCpV51Eq9+cC0ES
	 gG0jCROYbZ8CHvVj8q5e/VeKX0vAuwhQHjHWbJ/CZJvLmLg17IViR6snrEKJiiEg6/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJA16jB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064AA606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064AA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJA16jB7
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66fc7e0ab25so503194d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515535; cv=none;
        d=google.com; s=arc-20260327;
        b=b1n3KDh8m05zb0BthR7JOIaZ73PtZhAy67zJbVk2SJ0yc+1IF4wKHxhz5RCjo47zpt
         xe012mz4Y9/DBHBcf050QcFU8TRSISWaUa0ODua7opnwcjPyZovWE+bPuzCWNfYcU34q
         ZNKkBGKHq/6t+68Y6XxG+wpXCNja/aJ4YBu6tZMIRPlarPnsvq3A/87xlABW0T6uvBuA
         c1Fb6swUXLmjrVHu+/DpfNUTOi3pWELZ165bqKxvgEef3QRfre4NR31cltz/CI0xPeag
         ZoEudHQKHMvv4cOu8J/z//6S6qAugbTokw/sftVIvqr4h+hmJNnbjivpLM4EEnkd665T
         pTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        fh=2DrLgzb5QgJqO08hfEYw2nSnRMBI9eF1bwzsA9bNICA=;
        b=Mepq/8xAwPTORyyc8rHLVV+YWfZFL0YPqPdbIAop8+B02fe8FxQHuo/nKxUqU8Q0bo
         dFUXQq9MMu+l4DuaiCkQzHeYWN5dVlCSoKgzZgjmlg4Mn+Na3LKoMqf/4CmYMxSp+VfZ
         w1YTax192302jPdKFMK8Jwg9R/kHSl0p4Hp9bsW9eGAxm0fk17DchhMEj0qwI9nv6Ei+
         3/zNP0+9qiA8hrtHG3zE64kvwptBplEYp4m8QUfMtQrXfbH5UGK31MZZYRXlHFI3k5RT
         Emwev/+g2qJeVx8SRaE42eFqrnxDDr06xmKb6lj1RFZN2ubdlkD5gDwA2fY43zVHHYeR
         yJLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515535; x=1793120335; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=CJA16jB7gWCpEr8AZzawOzxdJb4z/YFbC4DXOKSP80dkmRfx9QH9UfwmDDMEnx6xrY
         ytWQXNUpYR16zu6JxHLJT920ExBMXHtB22zguBiRyWPN5R/seJsI2ALDFelxA3RynBnk
         k6SaPDm2PQdU8eyNp2gGkRKCMQyWXvj5KMKc+T/kzKmDhI71TQ91IFPyIi48S1AlBFtP
         pUjYL29NSRsLrDoc6mMsS3vPR0p537pzITgbBc7WHOZrxaeMGGfzpqx+5A0fwKsXo4l6
         vGu4aZ/5UhxApp19j+gWVxlx/pBPcFlASON9y7t2DhHQt4/qBBperU87oPXQvmT53Rfr
         nKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515535; x=1793120335;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=JhnkBI+iHCpBsAktZW8EMQfkibsaNy0qaxar6U6Xxn8S5RowBuPuSQlByVCutXEqZ9
         wiq/4Hax3FBiGzouh7Zoci/8RPQuAQ7vUiBNUR769grv5SD2dNNylI6G5Xv3CHlzUcWr
         3Xx7tH/BDC4pLfC1HK58jkoQcmIdVvFLURyyliBnJPYUoDJpjgGSUwrPQ0EhPcYVaU9l
         SHLixoTs5soKLZn4Iaz8c3l2xc9E7IeYS7zXtGayFW2JEenfD/AdsfLmkunHZ8MD8fP/
         JGoAf93tpY30i8S4QmZ9VwrqNCh+GbNRVi+kfaTouNbZDuSUOxPCLBkDcjuDs3T8Pble
         PDdg==
X-Forwarded-Encrypted: i=1; AKwUvBy/86NvklIBXmM1WWFesEiAjlxLRvlixe8hU2wo97oZN0DFaDghXBy25XqWSRB2HLFCOPC9/tWtMYXk75M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4pwWSeBE5mblxgDWn++8+teWj0Nhn4NZ+XSzZyFmgAnqnG5jH
	Pj/OSvmMTDMbwV5pB6yScDYIvl1q8ObRS8hcWv8XPRHD7CabDP0BE0d0suTsTMnH77tpBlx1tPs
	t6xfvJDES27aKmEbnpmuHMpSWshhhJAQ=
X-Gm-Gg: AYBFou20S0XTOXf4K5WvTixzWKOnTgCXkjhsaRxvfdQaAX8Y/34Owi4By1NRawh07se
	ycQQ2Ap+DhUwrS6MLeqdW4hazXssj58AbXRyKO3/pdQoIJ6mudlDJX89vIKrfSzYydvzUXrFq6w
	J7SElDqoGdSGW2EEw1tLMaVO5PzqE2ybt2jq78QxmlxHniCny9vqA+n/dob17zpgrHjDlhSrhhl
	nn9TiHBzT7M145CzPVn5IhB4fOju6j/jegrG5m+BJKmElBcJ2egcaQmO3yTHq1W2Isz4ksVaVok
	acwPN43xEwT8HlBpbuv5B3AR7GSNKcHexUdxrYI29TulCns0T5p3xg==
X-Received: by 2002:a05:690e:138a:b0:679:b8df:29c with SMTP id
 956f58d0204a3-679ca54432bmr6769731d50.2.1792515534972; Tue, 20 Oct 2026
 09:58:54 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 12:58:54 -0400
X-Gm-Features: AclHuK_J27k-o8Ui6g8e3q8L_DReW_3vhUszXOZ3Ua6MjDZ1MkwzX1wkuw839aA
Message-ID: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

>
> diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
> index 5023f98d8293d..f672aad2e30e6 100644
> --- a/arch/arm/include/asm/word-at-a-time.h
> +++ b/arch/arm/include/asm/word-at-a-time.h
> @@ -56,6 +56,9 @@ static inline unsigned long find_zero(unsigned long mask)
>  #include <asm-generic/word-at-a-time.h>
>  #endif
>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
> +
>  #ifdef CONFIG_DCACHE_WORD_ACCESS
>
>  /*
> @@ -69,6 +72,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>  	unsigned long ret, tmp;
>
> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */

Why it's open-coded ?

> +	kasan_check_read(addr, 1);
> +	kcsan_check_read(addr, 1);
> +
>  	/* Load word from unaligned pointer addr */
>  	asm(
>  	"1:	ldr	%0, [%2]\n"
