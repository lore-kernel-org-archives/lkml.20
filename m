Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792449076;
	b=VasMUfhG7LZpdKtPCiOCgT1gmSXkK1PykadpiRLbe+GbYd74Z/r6AXmkrVFPCHqQYXlo
	 IQTTG88ihtOHUv4DVxGW2gl+XguALxTZ4d1p9aGsSj6AVYvuFZgR/3FNb6ph6jaATNq3o
	 zNmaQsxN5mbuozSLMS90hr/PJBanfQupI9VahHVisAUkHdP9UZLjAbsOlKWCDi2XPLn4s
	 GMH1/KT/HuO+YgZljIkn2UbJqGPqtOreMVd0Ts4ggMd1PYFEXhxR33qmfVGZWt792QAoY
	 PDmlxA32m05x32Cxg1Tj6VePr2137mix2UmQ1COY2582PkHKp4Fd0725H1s31MchmZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7Y7YiwpHnHRTlx4OY6pg4GKzGSuy4/quEwIOKfF9VTA=;
	b=GU6J4RojR3EwUqktkZQ2P0oMIr5+kAhLggxswJ2Csx83GjDJSmUOI6dzYWh2yv4afZFq
	 PQVnQyv3v38BYdoXHAr9kuaJ4WX6iQwh3NoGHSvyU5m7VGKCX5CznGXeGvVubd5McJkj6
	 dR6bes2RFCjHGZ+P+UNez6MATnMXkh22PrI07omtpA91mjmwQ6+gpGvOx1VRTMYm8kYpC
	 PvjBpp9ZT9BZGkRjXZ6QFzqlTjWynbdg+KHzGj8n3q+hQuVqsD2wge4A0paMiX2rYfBKi
	 s6e7O3ZvGu3ZpzGwnJUsBGMsSD2/PcxJaKGte8EDXxOY+Qwuv9G0kWgYK7YVFsyds+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=X3mjpDas;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2EE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F2EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=X3mjpDas
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4765016eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792449075; cv=none;
        d=google.com; s=arc-20260327;
        b=MuW+I5gScIif1uzSoFRxn7lcEM47Px6ZeE/58ruBFkHyM3ok8elNOLbjUgIGx6C58m
         6qfX7nP/qbgN0xAiJ6if05ZvGI05L+ItjTrF6gAKWWozqVgQ8booioTDwOMnX87l735d
         ramIt3NZRH8ySqU89djxIhmz1qt7PFRxwt2snNWGVZ94dqeD1aZVPkAXEFWBmfYvdW0U
         k8KylPXOcDkDUbIvJc+UO7UTUgcxFJdxhHne7OVkFwGvvvqFHfdQe56w1W4KuKJLcbia
         no91gk1vDZE2CRCRpFFlaAatx+EC+5KMSKeF4Dkhme2i8w4WestjbXb+fKOW2wA9XKb+
         qJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Y7YiwpHnHRTlx4OY6pg4GKzGSuy4/quEwIOKfF9VTA=;
        fh=AT4XGMF5OnmFNP+gNBZd7eTwvAesx/ZASl7YOAnIVZo=;
        b=saw7ZLeC7jaDVULHMZ2y5UWLyEkOZilZNTIgKeF8GcIuinYRdudc6iIgdI6ro0Pahy
         BWXHKWuYXgYStMoZKNH6OicTVMsJfnzJ3Ok3A9e+EgNL78BmAIRjf0w3d2rkLdSlD1O0
         lzmAwAg734MwtOykbm2ZezYjkNs/eaJF4FtvXYrIzR6csk2kHZvCDqLAGeCe/zTuKX1o
         0RRYBvq+sxvotCA8PYsZJrmJArI7GOl1AtXhHeZuwnLblEQAhrT31UBDtnC+7EQZkf6u
         NjLPB/aVv4RA75Y7aRU3JyoI1Drffvd1HUriEa3tF6fowsvGqY/2I1ltnx7Z8PElbxUX
         0OeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792449075; x=1793053875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y7YiwpHnHRTlx4OY6pg4GKzGSuy4/quEwIOKfF9VTA=;
        b=X3mjpDasQAnbvTscP8iKS25txgnb2JYwM0tGQojP4D39YTn/DPY8MK20qFyemelnNb
         lFuHp1Am8dyutcx58RNt+EXDeDSSpsTgJbtrKsA3XgovVedhi1zt1221nzSRDbK6sqLP
         fh/B9c5iPMlx6tMjPItPnomzF9sW7AwpgHF3mZPx4I8/y6mWSJS90Ghn4QBOnjtLhsWI
         617HhZz8dnnvaoN1nP80ipvL8HlM7SgiY+2uLc57UWrBE0pw0qGz92/OhWgPuze+/hMF
         YV3f3x8OqkW2thWDRYm02VSAZogwiREQqo1aNo2PhDkiLhjsRsL6YQLf+G65FVS929cN
         pErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792449075; x=1793053875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Y7YiwpHnHRTlx4OY6pg4GKzGSuy4/quEwIOKfF9VTA=;
        b=Pjx/ykO0XTERZD4b9X/jGrGRlsJKqYlYpUkfCoiwcVhQxn8a9DYuIJnYTdE4MZvDjz
         WBA2hpe303nckJZXFPalfCy+o2SgMkJza0TLF02HBc29QbwOdgykCwqmEpwQkZ/hOFWa
         evf2HRfxWraxdm4QEMuSrDw7Xw8wDPqm/5jQmj6iYk1NA/36IyrAOyZUKX/mYl8PuRrF
         aO42w/0oVJX44954mchdooboIVJQqT78VVT7XrVhtN/j0YVArqHGrdSjsY7MIMC8tfHV
         Fms2w7pO9KfNDg0DYktFox5SH9GYSEMMTQFXi5894SjOY7O+X64O8w/zM1l7j0QPQGwr
         T1Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwUuP4YluvYlb+ZEbd0e5A6wA05euR7wa1VnZnDLSq1v8pdyvoSrCN3BFwAczn/dVvnQfd6v9u3bNYdQ10=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuMMjxgqrefjh53G+Fx/0EUcDofLA+ol6qYITmnlm5e/+MRBlV
	PXz/9PhnfPKUOdIjinhtUlStDqD1TetbC4N/86WoCT9jtsG+V1IWAsXQTBCrhIp22rWImN5FgVY
	n4m+2k3ghvnIxpzBD54dz5sXI+MIW1Q5hyyuPs5x0
X-Gm-Gg: AYBFou27HQdYtl75pQ2vhBI9+2bbnDc3PrZjioDI1Qa812/61XWJDu3iE09mOO8VmxA
	mTAkZ72Yu7knYddsazU4KJdTKHIynGrjFK6fxzwWuudaJWVduxS6c/KLUJgwPUf/BoJ7IL5IU0W
	wFJAJdKBXMIEk+Qkn82NHVGB9oy5x6E7s2sgRM4EkpGb7Z+3OgBZBNtcM4iskbik0L1/2O9hUd4
	Qg+felnz7MDp+tk03PLbflDaq0bsmkShbqWJFADfCqerT78upKuCQb7FhP7pTaY1nDKf9SrQFjb
	CirN0u/Ef5iHfijrg2qIjnzZ1Cozkkf2S6NpMKV/dwKH0CW9vKlOKNR7tht9dAdgxN6tLyNi0+b
	0iJXE2ZojKWuF/cQvjU7zM76COaRyQjkYesGmR8ZVITHZZjbUmMgX1XshCT7T/en06bJT
X-Received: by 2002:a05:701b:42cb:10b0:169:b1b1:1445 with SMTP id
 a92af1059eb24-18512e2515fmr12984330c88.31.1792449074316; Mon, 19 Oct 2026
 15:31:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 00:30:37 +0200
X-Gm-Features: AclHuK-9KfyXQ0m8f9CHsU2jTa1lgiXB2sNpwhyCmDMarQWZL2s0qBm4al6Ih6c
Message-ID: <CANpmjNPPncfo41Hu=TKB8cd1aFm0Lm-9+AT6pXVsYyUgFVx8TQ@mail.gmail.com>
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
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 03:58, Qiliang Yuan <odys.yuan@gmail.com> wrote:
>
> load_unaligned_zeropad() reads a word that may run into an unmapped
> page and recovers through an exception fixup. It does the word loads of
> sized_strscpy() and of the name compare in dentry_string_cmp(), path
> components in hash_name() and hashlen_string(), and the trailing bytes
> in x86's csum_partial().
>
> It is inline assembly on every architecture that implements it, so
> KASAN and KCSAN never see these loads, while read_word_at_a_time() at
> least checks the first byte of each word. A use-after-free or
> out-of-bounds read of a name handed to path lookup goes unreported, and
> so does strscpy() reading from a bad source, which the kasan_strings
> KUnit case expects to be reported. On x86_64 with generic KASAN:
>
>   KASAN and string KUnit suites      failures
>                                   before    after
>   CONFIG_FORTIFY_SOURCE=n              1        0
>   CONFIG_FORTIFY_SOURCE=y              1        0
>
> Check the first byte at the start of load_unaligned_zeropad() on every
> architecture, as read_word_at_a_time() does. All callers only load a
> word whose first byte belongs to the string or buffer they read, so
> the check does not flag their intended reads past the end. Add no-op
> stubs for the powerpc selftest that builds the header in user space.
>
> Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Marco Elver <elver@google.com>

Thanks!

> ---
>  arch/arm/include/asm/word-at-a-time.h                           | 7 +++++++
>  arch/arm64/include/asm/word-at-a-time.h                         | 7 +++++++
>  arch/powerpc/include/asm/word-at-a-time.h                       | 6 ++++++
>  arch/riscv/include/asm/word-at-a-time.h                         | 6 ++++++
>  arch/s390/include/asm/word-at-a-time.h                          | 6 ++++++
>  arch/x86/include/asm/word-at-a-time.h                           | 6 ++++++
>  tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h | 3 +++
>  tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h | 3 +++
>  8 files changed, 44 insertions(+)
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
>         unsigned long ret, tmp;
>
> +       /* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
> +       kasan_check_read(addr, 1);
> +       kcsan_check_read(addr, 1);
> +
>         /* Load word from unaligned pointer addr */
>         asm(
>         "1:     ldr     %0, [%2]\n"
> diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
> index 824ca6987a516..11ecca99057aa 100644
> --- a/arch/arm64/include/asm/word-at-a-time.h
> +++ b/arch/arm64/include/asm/word-at-a-time.h
> @@ -40,6 +40,9 @@ static inline unsigned long zero_bytemask(unsigned long bits)
>  #include <asm-generic/word-at-a-time.h>
>  #endif
>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
> +
>  /*
>   * Load an unaligned word from kernel space.
>   *
> @@ -51,6 +54,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>         unsigned long ret;
>
> +       /* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
> +       kasan_check_read(addr, 1);
> +       kcsan_check_read(addr, 1);
> +
>         __mte_enable_tco_async();
>
>         /* Load word from unaligned pointer addr */
> diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
> index 54653a8634149..49c6a1f65c493 100644
> --- a/arch/powerpc/include/asm/word-at-a-time.h
> +++ b/arch/powerpc/include/asm/word-at-a-time.h
> @@ -5,6 +5,8 @@
>   * Word-at-a-time interfaces for PowerPC.
>   */
>  #include <linux/bitops.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
>  #include <linux/wordpart.h>
>  #include <asm/asm-compat.h>
>  #include <asm/extable.h>
> @@ -168,6 +170,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>         unsigned long ret, offset, tmp;
>
> +       /* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
> +       kasan_check_read(addr, 1);
> +       kcsan_check_read(addr, 1);
> +
>         asm(
>         "1:     " PPC_LL "%[ret], 0(%[addr])\n"
>         "2:\n"
> diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
> index 3802cda71ab7e..fb7e2904dd7fd 100644
> --- a/arch/riscv/include/asm/word-at-a-time.h
> +++ b/arch/riscv/include/asm/word-at-a-time.h
> @@ -11,6 +11,8 @@
>
>  #include <asm/asm-extable.h>
>  #include <linux/bitops.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
>  #include <linux/wordpart.h>
>
>  struct word_at_a_time {
> @@ -60,6 +62,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>         unsigned long ret;
>
> +       /* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
> +       kasan_check_read(addr, 1);
> +       kcsan_check_read(addr, 1);
> +
>         /* Load word from unaligned pointer addr */
>         asm(
>         "1:     " REG_L " %0, %2\n"
> diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
> index eaa19dee76994..59393cf065964 100644
> --- a/arch/s390/include/asm/word-at-a-time.h
> +++ b/arch/s390/include/asm/word-at-a-time.h
> @@ -3,6 +3,8 @@
>  #define _ASM_WORD_AT_A_TIME_H
>
>  #include <linux/bitops.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
>  #include <linux/wordpart.h>
>  #include <asm/asm-extable.h>
>  #include <asm/bitsperlong.h>
> @@ -52,6 +54,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>         unsigned long data;
>
> +       /* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
> +       kasan_check_read(addr, 1);
> +       kcsan_check_read(addr, 1);
> +
>         asm_inline volatile(
>                 "0:     lg      %[data],0(%[addr])\n"
>                 "1:     nopr    %%r7\n"
> diff --git a/arch/x86/include/asm/word-at-a-time.h b/arch/x86/include/asm/word-at-a-time.h
> index 422a47746657a..1319e1d87a9c4 100644
> --- a/arch/x86/include/asm/word-at-a-time.h
> +++ b/arch/x86/include/asm/word-at-a-time.h
> @@ -3,6 +3,8 @@
>  #define _ASM_WORD_AT_A_TIME_H
>
>  #include <linux/bitops.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
>  #include <linux/wordpart.h>
>
>  struct word_at_a_time {
> @@ -71,6 +73,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>         unsigned long ret;
>
> +       /* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
> +       kasan_check_read(addr, 1);
> +       kcsan_check_read(addr, 1);
> +
>         asm volatile(
>                 "1:     mov %[mem], %[ret]\n"
>                 "2:\n"
> diff --git a/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h b/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h
> new file mode 100644
> index 0000000000000..000c92de6baf2
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* There is nothing for KASAN to check in user space. */
> +#define kasan_check_read(p, size)      ((void)(p), (void)(size))
> diff --git a/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h b/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h
> new file mode 100644
> index 0000000000000..39c97bc15531e
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* There is nothing for KCSAN to check in user space. */
> +#define kcsan_check_read(p, size)      ((void)(p), (void)(size))
>
> --
> 2.43.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477%40gmail.com.
