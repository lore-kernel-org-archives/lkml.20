Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE25326D5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906672; cv=pass; b=RCVQ/gWXdGfHHFQ7v84vzVqhwSBOnVy6q06q9vnyRUH2UcN+bXIW0cpDtyO+oHhXUKl4D2SckyZLP6WSy/3DLYxtjftDCwp196Eje2Due6tK1+YpZa00aeyrIJMLFEu+DgYQivf5jGwL/sssxf7rqA1fE0SlJSgtmzo9odgyM8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906672; c=relaxed/simple;
	bh=Q4UBMAGWhhEVRnP3zqrfXfr3Ih1PNjg6Ld/IKdYbwko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0ECGu8CQpZtXUGUU423ORRyQ6mNtrSGnmES3/KtdfKnjimtR8JPHz3PdsUwBsAUWBpVwvf0m0peZ+0psU57Ep2qCywK50Qj1reWTUkIN8/xBeHNNTspWZcFfYT7g/u+a9mk+W2Vsmxp7xzpVEyYb7NIB4m51CG+s3sk2YL5Hk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uzkJ7XoB; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uzkJ7XoB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso3004414a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791906669; cv=none;
        d=google.com; s=arc-20260327;
        b=EYyOS/xXVlnubtFp+Gc0agXK4ptGcn6+OkRTxA9JxIpMoLexDKpzzuG5RmWGP+EQ2f
         HBWHifsQ6kSRG2YTdCizp/ESHEz1B5EHezcCCi39dq9vx+h91z6PAjZQrxbSLytoKZW2
         x3U8Pxw46th3ZBJsdH7UJdMJ2L3BnlD36tV2c7ob3RSeTkCewG9lCyUb9YfcbWipcCVZ
         sR53RgPaoBgAvvZZe56Yn0OhqVu2UM7o9ORhk7dSptSnz6OIid7OJeXXKR8eYhad0di2
         DG5nmQ3df5d/UATL87rzAUPn7cGQjbMbVBeKdwoRM8yo3v/ELOG7jJDawa/kTzqpKgWx
         Odsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hI07ZP6ZXwusJOkVivRK7QwgdEDXZj4ua4bdxFOQrYY=;
        fh=2zqCUHdHhj5Frh0TB5ZPsSIx23d83cc1hkrPjOzML/w=;
        b=qNA2Y5XOZLVzZfnGOmyUPK8G8XZtJ1NZD36YF33gwyyd1YDqubNMvFMHOpeQ9mtceT
         4k4lHQOlM4swKAVBYv8MynEZlu9Xnno8Vj8eBxSri2Y/mBGbo3T1r8ejvBNH0xEw8v83
         eyQQsWTrJJcSBJ9TGBh3rJWhbkhArVAHFoUNsyE5z5uux54jW0Px+Db5uhz1wSErWx3v
         YNx6gF6ffvNdRiPxLWwnVWUZ7YdsG4e60Mzyi9IXc1PAaeqgz3vKkQmBUAGfZNjm9LG3
         jIkjSGdTZI9hPZFFz4vjQbFW64P1dkbtjiExbpb/+yxU09J/CdJpI9egXBj7YhURWGbE
         Cr8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906669; x=1792511469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hI07ZP6ZXwusJOkVivRK7QwgdEDXZj4ua4bdxFOQrYY=;
        b=uzkJ7XoBOk8mK4Lw34W3Wm21a1OTuLZg3nG1WbrI4iWQExn5yFMlNHa2cqkdO2Hfm3
         pidNOtbLZFkNkGX3Aj/DB64skMeZIif38xZiLODo5Rx0CIFNasoFErVh+pzJThYVHpjw
         UYISAs5Wy/EBQfGy0x0TL6w8wxw/FWJtAvz97eXi+br55aJl/Sdl8Kcrs5b6lmHu1NyD
         2fDvJzrrCyZAL0Pd9x0zajRT/iOoRtUF5jhjKq0Ot1JH0VSIdu8sdm9229m9sKcx0ARb
         bH8Lyv9Md0zDO6EsD9aCJWHPsNpKN0EhZTitGoo9ha0QJq4I9y/H4VuyVGWZdGa17IAo
         9W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906669; x=1792511469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hI07ZP6ZXwusJOkVivRK7QwgdEDXZj4ua4bdxFOQrYY=;
        b=2MbNnItbvMFhjb1AB+2HqStQ9HU8KXTQlCBk62YKT3jDZxhgHTAgGjXD/yw1AOq4ZT
         e6FD51BLnxafq40fockutHxbp8jhiNV2XOleu8GFLAUaq7Xutz4n4fU1X3PTbrlqvSbu
         bzJlz3dONZpfGAyLx2j4BMvmac59UMzu557q8o5mW7y08qtyqozV4Jo3XhO2SRNIoWhz
         B0TUD1yAoOz2B55cwmRiXvYtnFhtj2OE/HKq9KjpJ7ugCEkure6yxeSzKxo/EfPBptgy
         kl8ZX4FLPjsqNx29XjG1pYh5S3ay1UIMv9567TyzmjyiyCV8E5AUUtDeWXPPuJXgpI5q
         rhbQ==
X-Forwarded-Encrypted: i=1; AKwUvByDZ9fSXIKlymQ5P67cMxX5yg2JHXqAg5Gd7/0DJphRYIrX2HGFeeyoI8aQp38j4hb0vfjN+0SOCG9ia5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+7kyu6xUhQJnUu2SJDSoCIAmgtHDvx8KxoaHpNqSfUoYFvgCn
	XM3QFCGCRa7+gSx+GNkZTM4g5teaoUeBDPU7O47sHS+lAgs5+yD5Ox04Mau9tYohGu2m1ilKRbK
	f7se9b8XLsfCfZ/05Y7VZWsvuvNaPJ8iFQVo4NteDA7sgSWOYtPNY
X-Gm-Gg: AYBFou3Fv8FZZm0oFjN2BJMwUp19b74SCS57QDg+acMUPvg+V1cRIQKmj3TsYKImakt
	uwTyjsuXwFuryLAwyVzFqa5mO7mMPb+9qX/gTfwhScN9GmJt6iwKUdnwK0bQFvnDlAFXovkLIUT
	VqNxPHFioNgNMXPxImjBu7RUjY4nkq7PU9mDN4ZIHtTO2r8qJcoO3eoKwDQ069T/0OBc4sjRlCv
	pn11vzF9+E1NdIHYZ65hGWUFBlybOpabrJ2NQeXOhGmtqun+VW4HhdnLiPuCPEUSM90t8xXZTOb
	KqSNHU+d13GGLA+unQIOGm2m8fSRUKf6AIivQHpRsiaMRqXOfmSAfVz7fmth/DSVrPdxTJxrxLR
	v15gjoI00jJWueA==
X-Received: by 2002:a05:6402:a0d6:b0:6ac:94cf:9f2e with SMTP id
 4fb4d7f45d1cf-6b17c237c33mr9912940a12.13.1791906666943; Tue, 13 Oct 2026
 08:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927172428.110718-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260927172428.110718-1-saileshnandanavanam@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Oct 2026 09:50:55 -0600
X-Gm-Features: AclHuK_YwVU186w8Jrj9q5z-jVTTxDtnLd64spTZ-oYlvApDkqCGECWJiLiypDQ
Message-ID: <CANLsYkwDMdsoxNcYPH7TS=AQV4a=R6HN=Vmx7WOWyh9GTrsQVg@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: core: add KUnit tests for rproc_check_carveout_da()
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 11:24, Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> Add a KUnit test suite covering rproc_check_carveout_da(), the
> internal helper that validates a resource-table-requested (da, len)
> pair against an already-allocated carveout's bounds.
>
> The test is #include'd directly into remoteproc_core.c (a pattern
> already used by mm/damon/) rather than built as a separate module,
> since rproc_check_carveout_da() is static and this avoids adding an
> exported symbol purely for test visibility.
>
> Six cases are included, exercising every branch of the function:
> requested length exceeding the carveout, a specific da requested
> against a carveout with none set, a da before the carveout's start,
> a (da + len) past the carveout's end, an exact boundary fit, and the
> FW_RSC_ADDR_ANY skip-check path.
>

I will look at this patch when I have reviewed other patches in my backlog.

Thanks,
Mathieu

> Verified via:
>  - QEMU (x86_64), booting a kernel with CONFIG_REMOTEPROC_KUNIT_TEST=y
>  - tools/testing/kunit/kunit.py under UML
>
> All 6 cases pass in both environments:
>
>     # remoteproc_core: pass:6 fail:0 skip:0 total:6
>
> This is posted as an RFC to check whether this structure (test
> headers embedded per-file, DAMON-style) is the preferred approach for
> remoteproc before expanding coverage to other files in the driver
> (remoteproc_virtio.c, remoteproc_sysfs.c, etc.).
>
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/Kconfig                    |  10 ++
>  drivers/remoteproc/remoteproc_core.c          |   4 +
>  .../remoteproc/tests/remoteproc_core-kunit.h  | 130 ++++++++++++++++++
>  3 files changed, 144 insertions(+)
>  create mode 100644 drivers/remoteproc/tests/remoteproc_core-kunit.h
>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5b56b2dcc725..dc5a8f483693 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -390,6 +390,16 @@ config XLNX_R5_REMOTEPROC
>
>           It's safe to say N if not interested in using RPU r5f cores.
>
> +config REMOTEPROC_KUNIT_TEST
> +       bool "KUnit tests for remoteproc core" if !KUNIT_ALL_TESTS
> +       depends on REMOTEPROC && KUNIT=y
> +       default KUNIT_ALL_TESTS
> +       help
> +         Enable KUnit tests for the remoteproc core, covering internal
> +         helpers such as carveout/address-translation logic.
> +
> +         If unsure, say N.
> +
>  endif # REMOTEPROC
>
>  endmenu
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1ed406714849..4f0ad28305d2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2839,3 +2839,7 @@ static void __exit remoteproc_exit(void)
>  module_exit(remoteproc_exit);
>
>  MODULE_DESCRIPTION("Generic Remote Processor Framework");
> +
> +#if IS_ENABLED(CONFIG_REMOTEPROC_KUNIT_TEST)
> +#include "tests/remoteproc_core-kunit.h"
> +#endif
> diff --git a/drivers/remoteproc/tests/remoteproc_core-kunit.h b/drivers/remoteproc/tests/remoteproc_core-kunit.h
> new file mode 100644
> index 000000000000..615a854fffbf
> --- /dev/null
> +++ b/drivers/remoteproc/tests/remoteproc_core-kunit.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _REMOTEPROC_CORE_KUNIT_H
> +#define _REMOTEPROC_CORE_KUNIT_H
> +
> +#include <kunit/test.h>
> +
> +/*
> + * Tests for rproc_check_carveout_da().
> + *
> + * The function is static, so this header is #include'd directly at the
> + * bottom of remoteproc_core.c (see CONFIG_REMOTEPROC_KUNIT_TEST), giving
> + * it access to the symbol despite the lack of external linkage.
> + *
> + * rproc_check_carveout_da() only touches &rproc->dev for dev_err() on
> + * its failure paths, so a zeroed struct rproc is sufficient here -- no
> + * device registration needed. dev_err()'s formatting chain
> + * (dev_driver_string() -> "" on NULL driver/bus/class, dev_name() ->
> + * NULL on an unregistered device, and the kernel's own %s NULL guard
> + * in lib/vsprintf.c) is safe end-to-end against a bare zeroed device.
> + */
> +
> +static void rproc_test_check_carveout_len_exceeds(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* mem->len = 0x100; request len 0x200 with no da constraint */
> +       mem.da = FW_RSC_ADDR_ANY;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, FW_RSC_ADDR_ANY, 0x200);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_any_mismatch(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* caller wants a specific da, but the carveout itself has none set */
> +       mem.da = FW_RSC_ADDR_ANY;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x1000, 0x50);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_negative_delta(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* requested da (0x1000) lies before the carveout's da (0x2000) */
> +       mem.da = 0x2000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x1000, 0x10);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_exceeds_end(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* delta (0x80) + len (0x100) = 0x180, one byte over mem->len (0x100) -> 0x180 > 0x100 */
> +       mem.da = 0x1000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x1080, 0x100);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_exact_fit(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /*
> +        * Boundary case: delta (0xf0) + len (0x10) == mem->len (0x100)
> +        * exactly. The check is "> mem->len", so this must pass -- this
> +        * is exactly the kind of edge an off-by-one would break.
> +        */
> +       mem.da = 0x1000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x10f0, 0x10);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static void rproc_test_check_carveout_da_any_skip_check(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /*
> +        * da == FW_RSC_ADDR_ANY -> address check is skipped entirely,
> +        * only len is validated against mem->len.
> +        */
> +       mem.da = 0x1000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, FW_RSC_ADDR_ANY, 0x50);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static struct kunit_case rproc_core_test_cases[] = {
> +       KUNIT_CASE(rproc_test_check_carveout_len_exceeds),
> +       KUNIT_CASE(rproc_test_check_carveout_da_any_mismatch),
> +       KUNIT_CASE(rproc_test_check_carveout_da_negative_delta),
> +       KUNIT_CASE(rproc_test_check_carveout_da_exceeds_end),
> +       KUNIT_CASE(rproc_test_check_carveout_da_exact_fit),
> +       KUNIT_CASE(rproc_test_check_carveout_da_any_skip_check),
> +       {}
> +};
> +
> +static struct kunit_suite rproc_core_test_suite = {
> +       .name = "remoteproc_core",
> +       .test_cases = rproc_core_test_cases,
> +};
> +
> +kunit_test_suite(rproc_core_test_suite);
> +
> +#endif /* _REMOTEPROC_CORE_KUNIT_H */
> --
> 2.34.1
>
