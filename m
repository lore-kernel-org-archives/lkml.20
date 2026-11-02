Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586509;
	b=rqKDMN9SFRSbVep67kLvIy84fE2wlRZkd/T3PoegIvbjf4T/1FhyR724t/MGRKjBH9Xi
	 GcU4oLbsXgyABOSlSXb5eBJuDUQhi3lXjuN1eIG15mEhQ7mvFZQobreNnhmFlgejqk2Aj
	 j9ihVpaf3Dn3+bG/BNo34gduWmXsipEd+yTNsaQYrcbdM2uXSJhWuJ+P8TUTSos/0awiF
	 WSecbw87ORxczt5khlzstEUMknYruUAMUmhCsf74gyaTU7/daLFEo06NEpk+HPOvI3/56
	 UaM7qnYlXodpxZNj97/g0od5Q9q29UEv9Ri6qRsn08NoGnaNYaWZ2rZaBf2kQ0EVsLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586509;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8xqGhsVCvffAoX05LdkOUUsnRfHy5UAVhHkGcXbUKuc=;
	b=KZ0kK8eav0+7Bvc6cW10GYofio2eE2vTe2AazbYelHqxLS88fecmzq906l2vSSni8qMN
	 Oeg1Bjl+rUT2oPiGVou9LpUtkL0JIXkKZt55pWOJ9wXdeynrUfwPkU4mVAWOoALL/GKtb
	 Kgh80JJ2+BneLz06kTFL7RRHyjn9wkcVSGDAqivnRVrp6NMqibNX8pRn4lSQr6uxZMNY7
	 csjhiHxf9Hos0w2FAsaWjjqvuVxGXe5h5cpWTk5mekTpQJZmGi7EwRAwS7aIdiXU5W5f3
	 yNqOqstUWSwDbV/mEZuqgABUAXdIlxl4tIneU4juxGkLgx3xC5FA2FQUqh61lrmzotA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=GYzgV1Ds;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0066606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0066606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=GYzgV1Ds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793586500;
	bh=QsICishsXuIwtzPelLuc3UBzgF5SsmBpLAO1bV6Us4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYzgV1Dsip3av3qqW4OtC96yvDtv8Nmewp6v0a6n2ZNUkY51+L0SbzQ4zCunO/m7a
	 EzwmepAXanuKMchPHBDBtW5JKt4Uxq7j/Bo+YN/ECWTw6x+jHvESFPHxDKrZRzKClx
	 8eEHDdYFApRIxkiWNTUxM+Xd8MC8ysWTOQyFZH1c=
Date: Mon, 2 Nov 2026 02:28:14 +0000
From: linux@weissschuh.net
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
Subject: Re: [PATCH v3 0/3] nolibc: Add dirfd()
Message-ID: <61e37c86-00a0-49c9-aa23-05be83eb8e4e@t-8ch.de>
References: <20261031043000.145709-1-daniel@thingy.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031043000.145709-1-daniel@thingy.jp>

On 2026-10-31 13:29:57+0900, Daniel Palmer wrote:
> Add dirfd() to convert a DIR back to an fd for functions like fstatat()
> that take an fd.
> 
> Change log:
> v3 - Split the internal helper into its own commit.
>    - test: just stat one child instead of all of them
>    - According to POSIX (https://man7.org/linux/man-pages/man3/dirfd.3.html) errno
>      should be EINVAL on failure, so closedir() is now untouched as it is setting EBADF.
>      This makes the diff a little cleaner too.
>    - Replace i with fd in some places so isn't confused with -1.
>    - Due to all of the changes I didn't add trailers from v2.
> v2 - Fix the name of the dirfd helper, I debated over removing the helper
>      as suggested by Thomas but it seems right to have the logic in a single
>      place.
>      Add test a basic test to make sure dirfd() actually does convert back
>      to the expected fd and using dirfd() with fstatat().
> 
> Daniel Palmer (3):
>   tools/nolibc: Add internal __nolibc_dirfd() helper
>   tools/nolibc: Add dirfd()
>   selftests/nolibc: Add test for dirfd()

Applied, thanks!

Note: Now I hate that we sometime override readdir_r() for the selftests.
I tried to enable your tests for non-nolibc builds but was running into
EINVAL errors and was wondering where these came from. I'll drop that
local definition and just disable the deprecation warnings.

>  tools/include/nolibc/dirent.h                | 37 ++++++++++++++----
>  tools/testing/selftests/nolibc/nolibc-test.c | 40 ++++++++++++++++++++
>  2 files changed, 70 insertions(+), 7 deletions(-)
> 
> -- 
> 2.53.0
> 
