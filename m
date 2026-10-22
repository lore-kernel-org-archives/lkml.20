Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635520;
	b=mr9UVy4i/pqfYiDeEObTR/m6QwRvcrTTyEjmF/gC35AiV1SCq4K9KpQv3J+2UMEEKBmB
	 wEDrtAaaLTHL26QAk3vRhZMiYj3UKilQrukq+lYedk/+2qL+PCLfjqGB50J60hwc6b27W
	 teZAxQ/nAgoXUBKV3XZ/UHeOEjmT26xUMEN2R9Zen0P7p6CFb1ar+D6vSYgN5IFdta0Lj
	 BoxnFfPb8W5PwR1DIIDXrECxTyii/f6Ngda2yVV8JWTlOTmsMEOp/4TM6l5Efpk4PQ4u+
	 UVmhjlfz7PE7cZ5Nc2xEpaylSEC7NpBYNR3zPxi8ngRCoD6ndZ56GceaEIP9kL196qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
	b=X3FbOUcYICYwYQC4VANwpw8BPrILsWsN2OJP76swmopHgx15/F78dpheZGcBZj6d+Bl3
	 5rIef5BcOhQXsAAXHL09wlFuSIUd6saW3/DxNYwaaTvrAJI21ND4dT4oMCQuABUalos7o
	 ydLz9OfnyMAk9P8tUJuPA9mnqjRuvpCTM5mgLeU/ODLmvY24/nBBlUBU64czv8aFKHnbP
	 mTLFORXolZL6JxspoTBr0bwiWpaWEf8OnpILgFtOqbG4NtSB8G6O3f9Cr860qpubfD3dh
	 Lyi5eDK1coIGhumzRyqCrWHoGlF3Q4z2D5rGZ6d4nN3Xc2hWSfrcUXPw3HIUZl/t56g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H+eszt1v;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7242606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7242606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H+eszt1v
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so3733927eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635519; x=1793240319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=H+eszt1vKQtCU3/KB7Qzaij69qenfu0lG2XuIF4ZWISg5dYrkmC9asbrjtgR4CXkce
         TBXb4GKHG/wsSGQ+UrZ8+zEcA1NQgtYK91w+B80ULkg3ASikYfCo9UWfYmfwpvEte4XE
         jTTxbKPQVXpeU8ktIhq/YTivJtLdLSAXqmVf38FDGxukqYkaW7iUTpvQyxAALnq6XXGD
         ci38T/qydDnsRZLVQQuKo0hUWVY5R+df+t/heaKrcLMGs9Hz98Sz5r75F5L7LBqWlFQI
         egjfA+nNUHRlxwEXpwXcYyyWcLr+UjLA/NnupQKuiAMqRo8yIe4c9Dms37/DiCtx6ifF
         hfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635519; x=1793240319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=JVZ1rGIAGLlE2bJAwi+I2YJ63KZMwvXEjo0OHg66/Mru8DqqS6uEtBCLBFpjf6tAUb
         OucgmBIRJ9EwU0fFH3VGssfejryHARcHdEqXWHNDautbkRYg1ttiL/CzFB4VsGF/Wpzy
         u4moAt1AoXPxltAuK+LUowEaDS8AZxy/8K0wDn/Or4z8hUVCYk2J8OLut2fvN5BLM+AF
         Htmn3F7g99APZ4gfYMTLTr0WGlHAIPAlnCX1VtUyocXXbXVD5mJwt0FcgWdOsajfodPk
         hMf7vi8NCmE/ZWuPRtsNTuYgSQpPsnZA9nMaZZIJKZF3yL7ADWLD0abUMv19hjD45o1Q
         vvWw==
X-Forwarded-Encrypted: i=1; AKwUvBxZn99eBY554haIJZ/pdkDLlXPT+OcrLV4m1UtI1oYjF3WW5puwLgUidY8Wolo2cnuPjsTo06MW3C2qajI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB/vByHiS2LioywJuNlAjNrjGsA/m/Ac1pgMDuNrSrRBPyuErW
	GeH0nhA4YgRGD4incm2yqqKRj0j62Zif8CcHydQQOWzM0qrd93/fN7oY
X-Gm-Gg: AYBFou0q8FjvJFUls5UHvV1j+hHwbVnbw9h0W81m+wD6WAyQX/tWf1CJJyYdllOK2uL
	GbbSILlrjAVBjxQ0xE5usMkAgqnJFd3xRFMMIxkqnWAjNCPDwVxDraSO4h7dlIYv0qpz1YfzMMz
	tvkunh/3WXYYQw0OqJsORWAjpgLu1aGgY+O8xTAuG/qO3asWHDW9L955jZjOmqduX0A3sfm+nOR
	HbuD4MlG70UT7EhAQ21A6MmkdY5Y8SLdzkrlnPcLp6Frtqx2O6wRLQnc8oFGgyHL23UNdiLzSQI
	W9q1ASW+awQpdUqyIyjVhEnAecpsN4DC1/Q6FD04YeZmLq6nG6eTpPVivPfFkHfBGAFkJLlf0xo
	9PlR4gF1SKItMzVWsNSH9fveCG39LR52JhIKFV4e1O82OW0NW+4TO+5m/bavdT6mAWuMu5GYFj7
	pt/CUPBTU8qL5SjNYCldEt2rN+xkQCWPPzbRjOvL9AL0e8yvuNgFJIx+qC/TAfcsM69O1vWbOW4
	F9+a0g2YhMwLkywtlzW3+uZKhjuAoXV0zDnawrD+xlhs04=
X-Received: by 2002:a05:7301:618e:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3674c63d579mr5523810eec.10.1792635518735;
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368b4b8e9c6sm3556805eec.1.2026.10.21.19.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
Date: Thu, 22 Oct 2026 10:18:20 +0800
Message-ID: <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com> <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com> <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>
> Why it's open-coded ?

For the same reason as read_word_at_a_time(): commit ece69af2ede1
("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
it "to avoid having to pull the entire instrumented.h header into
rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
instrumented.h with linux/bug.h and kmsan-checks.h.

Thanks,
Qiliang
