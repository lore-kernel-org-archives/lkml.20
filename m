Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952790;
	b=Tfo8rXKkwDO6AMG8/SLklOBGUFewvqQodKLMU8wkXYeCiJO2WXuDqhXddtv4ykHfio+R
	 5gNJrFcKBV8Az9bMBqJ4WmSD2XlL9vLdcEo7HI0izeYujzZ59TbceySfLrVsyJqjdHwB6
	 GlT46A/msknJ74xhuQnlN2wQpPiARQ4HjdEpsaMG8GV0ya2VRCF6+gyk3T9avbeVLZ/SU
	 2NR51uMOWCqZtDIHacHcYWLtt4/8aeM0l6e1ai/25Rai6n02X9w/LtYK0UTAvuWNPS1w5
	 08aVtXauc78hFqcm0aYkNxi33x7ycUGLoGsLkMV4FuELW+QQbaXbGNeNxEF5DAFRz+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952790;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=TvdClj1KIQwUU825tWn3kJuTzoTBYXNhoWOdc76RTms=;
	b=vWqutRtkTyQw2zHYg57M6xtFjhIbmSn2LahoE59WT1IvdNPd7ihYFD+uIClxpmG9CmCn
	 xa+uT5ETpr6pbDCmWtEjW2uhdlI0L1ZgCtk32sGyccga4jO9Isxnf0CkRsaoDUvqVZgR7
	 oJVR6jdwYlddzSswjdr5krkLXYcaIDAHXJDZbPTJEU2JMZrGHxpcGosAr6wjl8nrFm9CZ
	 tO6ak+xXrAuzpHTLoewI6DYPUwtcqMOUQ6sEL4cyG+Pl18t6FrivP9rbv6VH3eMh5dBeI
	 66aHza99IoVz1Np1W6b+dx8zCbmcGSVYuWrvXJ0HPlRDgrHJavVG9MNlg0ZjJn9MW/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4557E606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4557E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so275062e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952789; x=1794557589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TvdClj1KIQwUU825tWn3kJuTzoTBYXNhoWOdc76RTms=;
        b=uC+up8JOwHN+MTCM3Lang+Oh75U6fpyiPgFfqIdl9zQvHfLMPSOTmqM1OwGFUuiJCu
         fA4Lm0t9Zwrw3vigNftpMNSsMzacjm1rMfv/cj9zrK5w182FGtGS7WntxH5035yDOT/r
         t8QR91Du3zsdLayQJ7ipa4XlUHrI2gLNiH5UWDVMvw+c+P/yCR2nbWOKFU63y806tZW/
         b8xQKtgQX31c6cfqi0LhuHgPriKjpWu8uFxlonHafTqWplV/34YRoYz+b7q+nxiR3+l6
         LrVKpWSrdW/fn6K3e/gJH6QNa9EcSBXw/JnCk775f14F4ydT7i+CECVS+g/THg0le8/w
         43Ug==
X-Gm-Message-State: APuU4Z/ztgCg71sulRIr4iOef/vy58JMxBD9dnIEppEfGmyUUub2L0DT
	D84d/X5AARRwKiALvYXwaZG34C5OxUfNnuVU4mjXJS1n+PEvwxB4C0J2gaFG9yTZc98=
X-Gm-Gg: AYBFou0dx3NS9376aOkDyJYWp2DABmfyDJAS6Y5Z1EnByLbSMilOGvBbbxuC4Z2YcaP
	OSgoja9xyesJoOyMioYnWKh2B2FwzQFdRgzEUivEbEfR4IPtnMLF+SH0m9etPfZBZXOPg4irPB4
	aQn5HQoR6r5c6O4jmBvpSsOe+gsnheFHABJyX9GLdaHligq1IWjljkzcdDivWZPhp26w2yWF4NP
	qg+PR80cqgKCMNFZEtPzHZwT0D0551JpuiQdPwgjFmyvZx+VMoYVr3i4b81YPqfbhQNkHEvW6Gx
	7o0gTX++uC0GQRGsSAqNsapwqDhUxWLAzIRFzCcVv9itMMK3rv+E49d5oKhVlxwAr8emsXwRL6i
	xXLM3A8gl4eCXJ0zQ3A6lIh0u1J0MTdxkk8Vve4DAtq4FD3rxT2vcI5ULRRm+sMVEKJNqa7AohQ
	dGtSoqgqfh75weIJ6xCYQ0j+T93Jj+dD25/wNi80CYfJzLEQ97qUL0kHLNxO+Ce3bhCrlsqFfEx
	8ssrc10O0PPzRfTFRoZbghEDb69ATh4ImyiCTrXQet/VM72iSK6LgmQjsm2tjV1+BABqJSKSMfX
	6hoAUDs+O4aGK2OIC5qbUlnf+aIuGVt8fhFnqbV9s8OgjSPukeJYkRLJsIvFY31Uaw==
X-Received: by 2002:a05:6123:2c7:b0:5ec:c186:d22b with SMTP id 71dfb90a1353d-5ecc44506a3mr824541e0c.22.1793952789184;
        Fri, 06 Nov 2026 00:13:09 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64ccb58sm869712e0c.9.2026.11.06.00.13.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:13:08 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7bec5112765so283181137.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:13:08 -0800 (PST)
X-Received: by 2002:a05:6102:5691:b0:7c1:62d2:e18a with SMTP id
 ada2fe7eead31-7d2a15b12d1mr1181751137.16.1793952788019; Fri, 06 Nov 2026
 00:13:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-plist-kunit-v2-1-yuehongwu@cmss.chinamobile.com>
In-Reply-To: <20261106-plist-kunit-v2-1-yuehongwu@cmss.chinamobile.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Nov 2026 09:12:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgmTCaSamoDD2ZgEyuOpGN9p1P3cH3wz_ntsVf82qqoA@mail.gmail.com>
X-Gm-Features: AclHuK-2ywPas9wd3WAr45svvsdiI0_5IDnJDTjcPzmJdA0RxKAv-P172SC_luI
Message-ID: <CAMuHMdVgmTCaSamoDD2ZgEyuOpGN9p1P3cH3wz_ntsVf82qqoA@mail.gmail.com>
Subject: Re: [PATCH v2] lib/tests: add KUnit tests for the priority sorted
 list (plist)
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Breno Leitao <leitao@debian.org>, David Gow <david@davidgow.net>, 
	Tejun Heo <tj@kernel.org>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Marco Elver <elver@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Kir Chou <note351@hotmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Borislav Petkov <bp@alien8.de>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Petr Mladek <pmladek@suse.com>, Eric Biggers <ebiggers@kernel.org>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Thomas Maarseveen <maarseveent@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hu Yuehong,

On Fri, 6 Nov 2026 at 03:18, Yuehong Wu <wuyuehong@cmss.chinamobile.com> wrote:
> lib/plist.c has no KUnit coverage; its only test is the in-module
> plist_test() under CONFIG_DEBUG_PLIST, which BUG_ON()s on the first
> violation and does not report results in KTAP format.  The code has seen
> three regression-class changes since mid-2024:
>
>   commit c8dab79f9eef ("lib/plist.c: avoid worst case scenario in
>   plist_add")
>   commit 95d4b3450ebe ("lib/plist.c: add shortcut for plist_requeue()")
>   commit 43c91b152243 ("lib/plist: fix plist_requeue() corrupting order
>   in the last bucket")
>
> The last one has no regression test: plist_kunit_requeue_last_bucket()
> covers exactly that wrap-around, and the other cases pin down the ordering
> invariants the previous two changes rely on.  KUnit coverage makes such
> ordering regressions visible in CI, where CONFIG_DEBUG_PLIST is not
> normally enabled.
>
> Add lib/tests/plist_kunit.c, a KUnit suite that exercises plist_add(),
> plist_del() and plist_requeue() and validates the invariants documented
> in include/linux/plist.h after every operation:
>
>   - node_list stays sorted by ascending numeric priority (descending
>     priority order) with FIFO order inside a priority bucket;
>
>   - exactly the first node of each bucket is linked on prio_list, and
>     the headless prio_list ring visits the bucket heads in node_list
>     order before wrapping back to the first bucket (a single bucket
>     degenerates to a self loop on the first node).
>
> The fixed cases cover bucket head handover on delete (first, middle and
> last bucket), the plist_requeue() shortcut with and without a following
> bucket, requeueing the head of the first and of the last bucket where the
> ring wraps around, the INT_MIN/INT_MAX extremes, and plist_first_entry()/
> plist_last_entry().  A deterministic pseudo-random add/del/requeue churn
> test mirrors the in-module test but draws priorities from a small range
> so that multi-node buckets actually occur, and every requeue in the loop
> moves a node (a requeue without a same-priority successor is a no-op).
>
> The suite is wired up as CONFIG_PLIST_KUNIT_TEST next to the other
> library KUnit tests and is enabled by default with KUNIT_ALL_TESTS.
> lib/plist.c is built into the kernel and exports none of plist_add(),
> plist_del() or plist_requeue(), so the test cannot be built as a module:
> make it built-in only (bool, depends on KUNIT=y), like the other KUnit
> tests that use non-exported symbols.
>
> The tests were built into an x86_64 kernel and run under QEMU/KVM with
> kunit.enable=1 kunit.filter_glob=plist*: 17 of 17 tests pass.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611052109.GqbzRkv1-lkp@intel.com/
> Signed-off-by: Yuehong Wu <wuyuehong@cmss.chinamobile.com>

Thanks for your patch!

> ---
> v2:
> - Make the test built-in only (bool + depends on KUNIT=y): lib/plist.c is
>   built into the kernel and does not export plist_add()/plist_del()/
>   plist_requeue(), so a modular build fails in modpost.  Reported by the
>   kernel test robot.

EXPORT_SYMBOL_IF_KUNIT() can solve that...

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3065,6 +3065,25 @@ config MIN_HEAP_KUNIT_TEST
>
>           If unsure, say N
>
> +config PLIST_KUNIT_TEST
> +       bool "KUnit test for priority sorted list (plist)" if !KUNIT_ALL_TESTS

... so I'd rather keep it tristate.

> +       depends on KUNIT=y
> +       default KUNIT_ALL_TESTS
> +       help
> +         This builds the priority sorted list (plist) KUnit test suite.
> +         It checks that plist_add(), plist_del() and plist_requeue()
> +         maintain the ordering invariants of the two-level list, including
> +         the priority bucket boundary cases.
> +
> +         KUnit tests run during boot and print their results in KTAP format.
> +         Only useful for kernel developers running the KUnit test harness,
> +         not for production builds.
> +
> +         For more information on KUnit and unit tests in general please refer
> +         to the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +         If unsure, say N.
> +
>  config IS_SIGNED_TYPE_KUNIT_TEST
>         tristate "Test is_signed_type() macro" if !KUNIT_ALL_TESTS
>         depends on KUNIT

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
