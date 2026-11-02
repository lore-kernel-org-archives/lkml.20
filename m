Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606751;
	b=pGW8l970Q1AcBYyXzPuFjecKq1rAz40CiLXqxGeXvzqsW/Zq7aeLlFwT1gEb3qrdCvhQ
	 lA5EKfIjOB9PzcwY8JEGgsCebTlVYza3sPnXu0zUAFXG1GAGDYDlaEh9kb4JRl9tpPS0B
	 iqDYdR8tGYr2Xiex6KqG3crUgYjt48fwMVYRtwD3erfVO2CtqdfIgyN4aX9G1W980A6n9
	 bNxRTqQvDb6VhZuOBUNisvabNed3OZ/bq8FG6X45jmGO/UqnRoKJHjcElBb+C2dcrqLi3
	 7H1kNqjENgOyFM//k0mxtYnMj1hW8x7QR2ooETKpPRnyMYxd8bYrR+DbRhVcqk+AEew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606751;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=hnPzEBlbfALOVfgiCaCYUKj4V2ux/K3gdALbZ/Npi54=;
	b=dKAgKZSW1tD12S1X4n5RnfG6n+XySmbJ/Nshb7t2RyIff7ZhK6o3PziXWBcPjMIRPp38
	 ZSKR/1DI0vcTQF8uLx3oy4V/+rQqGPYpMWSu+fMgnHWDI58t3C8ibrY6PhjFWTnQvCq/t
	 BwDpyQjy9tg7WOaGKmDi0z4swbx5COO4mOCfKwP9knRj7Xsgo7sVgwWZjPHSpjSEGWaNS
	 ovL50Z/7z9e/B/dRkPat67f8KBGXMWMBiZ4o4qD10nHGv4+WK7zPIv4EzSx1QVq40rTlM
	 fkcYIZD8iq5AriznS8pQxeq3tv33Gf9CMroVodo0HbS8LkLFgaKPxxGjV3eqcatDryQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=io6cX5MB;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C3606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E53C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=io6cX5MB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1793606748; bh=hnPzEBlbfALOVfgiCaCYUKj4V2ux/K3gdALbZ/Npi54=;
	h=From:Message-ID:From;
	b=io6cX5MBmf1Hwy3RoAFENj18yyAqVM+muZtJbd3eK93OWG1nE+bWGpSRk9iRw9Hb7
	 bBUG6DIFZUHOdVdR7wHp6gH8ZrjvF6kYFEnfo3rGEqzTO+JHdUPPtLBkRTTNeLDZzl
	 qZRqOMt8iDErlVl6qGY3n26hic0GrWuR+rNDT+GI=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id A35CFC06B9;
	Mon, 02 Nov 2026 09:05:48 +0100 (CET)
Date: Mon, 2 Nov 2026 09:05:48 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: drop readdir_r() override
Message-ID: <auhEXIPuSZknxJQQ@1wt.eu>
References: <20261102-nolibc-selftests-readdir_r-v1-1-58fd2205f1c6@weissschuh.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102-nolibc-selftests-readdir_r-v1-1-58fd2205f1c6@weissschuh.net>

On Mon, Nov 02, 2026 at 03:27:35AM +0000, Thomas Weiﬂschuh wrote:
> Running the testcases using readdir_r() on regular libcs is useful to
> detect mismatching behavior of nolibc. The deprecation warnings can be
> avoided with a compiler pragma instead.
> 
> Drop the override and enable the testcases relying on the function for
> regular libcs.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 048c2d2850a9..1157b521e65b 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -50,6 +50,7 @@
>  #include <alloca.h>
>  
>  #pragma GCC diagnostic ignored "-Wmissing-prototypes"
> +#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>  
>  #include "nolibc-test-linkage.h"
>  
> @@ -99,10 +100,6 @@ static const int is_glibc =
>  #define strlcat(d, s, l) 0
>  #define strlcpy(d, s, l) 0
>  
> -/* readdir_r() is likely to be marked deprecated */
> -#undef readdir_r
> -#define readdir_r(dir, dirent, result) ((errno = EINVAL), -1)
> -
>  #define _syscall(...) 0
>  #endif
>  
> @@ -1802,8 +1799,8 @@ int run_syscall(int min, int max)
>  		CASE_TEST(ftruncate);         EXPECT_SYSZR(1, test_ftruncate()); break;
>  		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
>  		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
> -		CASE_TEST(directories);       EXPECT_SYSZR(is_nolibc && proc, test_dirent()); break;
> -		CASE_TEST(dirfd);             EXPECT_SYSZR(is_nolibc && has_working_64bit_syscall_arg, test_dirfd()); break;
> +		CASE_TEST(directories);       EXPECT_SYSZR(proc, test_dirent()); break;
> +		CASE_TEST(dirfd);             EXPECT_SYSZR(has_working_64bit_syscall_arg, test_dirfd()); break;
>  		CASE_TEST(getrandom);         EXPECT_SYSZR(1, test_getrandom()); break;
>  		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
>  		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
> 
> ---
> base-commit: 228a318052869ab08f01f53b5cedfae0e930f6dd
> change-id: 20261102-nolibc-selftests-readdir_r-1dab2edffb12

Oh nice, I wasn't aware this one was possible. Nice to learn something
in the morning ;-)

Reviewed-by: Willy Tarreau <w@1wt.eu>

thanks,
Willy
