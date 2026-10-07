Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F1395AEA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360580; cv=none; b=HtdeNjL5mC2GntSqzlrkTdf6bCX7LyQkr8+V/KQ3h2QFbVTBxOM94dq8yvrtdwphcp9CLtBGBEL8gUhJa5jKHyWHt4kv20EY6YKvxPDFrX9pCA2GKbJ0mWjY6t+A90ZZFKaWmPZuWzBf7Lx2DlhFDERo7Rcg56oxtOQnCv3BUCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360580; c=relaxed/simple;
	bh=NJk6Ksjwj6eqPkpFJKoAqnZ0manceWzRdWwGtK9pKFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqjnTk1kz612ER6EAnnVb5lS5N7F7UZbTUbe767QYQKFsf9DhBxLfrx5OqC6E0mfLBbbA4Q6eKYYrOrdVdp4JGWmkOahxKimIl3icTchz5gdO04zs81Ub5r6ouLVVsOcYyWOgTUHUbdAsBVYK0lHn9MtcHfdXpSrWKYRcmMd13A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=q5iuE5LZ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="q5iuE5LZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1791360569;
	bh=NJk6Ksjwj6eqPkpFJKoAqnZ0manceWzRdWwGtK9pKFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5iuE5LZ0U8z1b46tgFnzLhNfH8zhB3iLujWdu5i4oyqw+I8ni6oZkmuzHNFAbfVT
	 7s7yxvUDjL6Vjez2R70h5EwmVS1BGHJHyQAmjCDywGkAxvqRHFzXs36o7cPT6FK9DT
	 vUaJrSuDiiwUK1/1nH7By6zzb6ExwXYWyH+swdRc=
Date: Wed, 7 Oct 2026 10:09:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/nolibc: Add test for dirfd()
Message-ID: <0d1cbffe-812f-4882-a315-7ad41a3fe1a7@t-8ch.de>
References: <20261007052914.888956-1-daniel@thingy.jp>
 <20261007052914.888956-3-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007052914.888956-3-daniel@thingy.jp>

Hi Daniel,

On 2026-10-07 14:29:13+0900, Daniel Palmer wrote:
> Test that open() and dirfd() use the same fd and then use
> dirfd() with fstatat() to stat each of its children.

In general the series looks good. I have some minor requests,
but can also implement these myself if you prefer.
Also I'd like to push the patches into the next development cycles.

> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index ed860b0a15a1..82616f2c1ba4 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -858,6 +858,52 @@ static int test_dirent(void)
>  	return 0;
>  }
>  
> +static int test_dirfd(void)
> +{
> +	struct dirent dirent, *result;
> +	int ret = 0, fd;
> +	struct stat st;
> +	DIR *dir;
> +
> +	fd = open("/", O_RDONLY | O_DIRECTORY);
> +	if (fd < 0)
> +		return __LINE__;
> +
> +	dir = fdopendir(fd);
> +	if (!dir) {
> +		close(fd);
> +		return __LINE__;
> +	}
> +
> +	/* Check that dirfd() gives the same fd as open() */
> +	if (dirfd(dir) != fd) {
> +		ret = __LINE__;
> +		goto out;
> +	}
> +
> +	/* Loop through the children of the directory calling fstatat() on each */

What is the advantage of reading all entries here?
We already do something similar in test_dirent().
Reading a single entry should be enough.

> +	while (1) {
> +		if (readdir_r(dir, &dirent, &result) != 0) {
> +			ret = __LINE__;
> +			goto out;
> +		}
> +
> +		if (!result)
> +			break;
> +
> +		if (fstatat(dirfd(dir), dirent.d_name, &st, AT_SYMLINK_NOFOLLOW) != 0) {
> +			ret = __LINE__;
> +			goto out;
> +
> +		}
> +	}
> +
> +out:
> +	closedir(dir);
> +
> +	return ret;
> +}
> +
>  int test_getcwd(void)
>  {
>  	char cwd_syscall[PATH_MAX];
> @@ -1651,6 +1697,7 @@ int run_syscall(int min, int max)
>  		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
>  		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
>  		CASE_TEST(directories);       EXPECT_SYSZR(is_nolibc && proc, test_dirent()); break;
> +		CASE_TEST(dirfd);             EXPECT_SYSZR(is_nolibc, test_dirfd()); break;

Could you mention in the commit message why this is specific to nolibc?

>  		CASE_TEST(getrandom);         EXPECT_SYSZR(1, test_getrandom()); break;
>  		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
>  		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
> -- 
> 2.53.0
> 
