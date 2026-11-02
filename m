Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606630;
	b=5VIIgYzxg46gX+vAWOTRpQrSx7SCdwLtrz7ZmrL4SvpC48vLR7O/N/aeFq/cUwemUsGL
	 DzRahm7UeInodJlBjY32OmNWRLecNol1VGKkVAD/mX6HcvXrCAKANzkf0JZKHoPnJb6AU
	 nWZvB3RPfBMv+ETS07gxGo/Prvi3k8TJxF9Ao9TRiwzcYtvuPigJCfbdK5kHFFxIDJL5I
	 RqnINKHs1euSwtnIE5S2q0LYkXKyyfEMgg25c0Spb2OakuQR/93I/hiiah/xov4UOe2i+
	 15c4mx3Qz+zdGLFVJf8d0weOPQG4UtUj80JuLYmLKbvcblPTaXig7jje4K1zmZ0LPiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606630;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=O1GVJ1DoCKmCtOLPZnFpGeYW6uKsc/66fCAls6yfrRY=;
	b=WaWCVLhzXveo+g/JL1ULDM0kdekcwujZrl9w1X7It3mqxyMR+42Cicj25utA/8MtPuC+
	 1TxqnnyB7Z7cQavZahPRISaV4QB0cnWE0wtaX+uDhbeu9F/Q9udc/jyGn0lBMZW7siTV3
	 qpvllL727QJmNQkD3p8n/C1M63x+cKsP1ELvd2LISizMU7hWe3WOU47UWEH5SsYUd53dn
	 GptNT/ajKp8pUxMzeOYAC7crXLQFr+cAlQgSeLV+xnd1RRjkdzJGfW4CClirPx4PnKnH4
	 Anss00dBOxnxT664cTKdPPnILvKpBou0JZ1DhKQL/x5bu6XjVWOe3oteeYeAkmzuVxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b="FA/BLeHZ";
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A01E606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A01E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=FA/BLeHZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1793606621; bh=O1GVJ1DoCKmCtOLPZnFpGeYW6uKsc/66fCAls6yfrRY=;
	h=From:Message-ID:From;
	b=FA/BLeHZGKDSdY9Ty3JjKc0vhvcuAuAihxEdDNyhah++u1J85qGcbZ4fWLCUgWCSx
	 cOX1ifZns4P1VcaHyjreKjML70+NX1Pfq1TV5PC47pgGO/RzxQjPbpHFn0bBf8gikv
	 RLD6hUN5147BFUJVqVOX3Al3jXG6d8YathAzErSY=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1DF15C06B9;
	Mon, 02 Nov 2026 09:03:41 +0100 (CET)
Date: Mon, 2 Nov 2026 09:03:40 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: don't download GCC toolchain for
 clang-only architectures
Message-ID: <auhD3A1lacnykjNs@1wt.eu>
References: <20261102-nolibc-gcc-download-v1-1-17704b116c83@weissschuh.net>
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
In-Reply-To: <20261102-nolibc-gcc-download-v1-1-17704b116c83@weissschuh.net>

Hi Thomas!

On Mon, Nov 02, 2026 at 03:19:59AM +0000, Thomas Weiﬂschuh wrote:
> If no GCC toolchain exists the download will fail.
> 
> Fixes: 4b4f56583850 ("selftests/nolibc: prepare for clang-only architectures")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  tools/testing/selftests/nolibc/run-tests.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
> index 2844fed26df1..cc91b8656b20 100755
> --- a/tools/testing/selftests/nolibc/run-tests.sh
> +++ b/tools/testing/selftests/nolibc/run-tests.sh
> @@ -144,6 +144,9 @@ need_gcc() {
>  download_crosstool() {
>  	arch="$(crosstool_arch "$1")"
>  	abi="$(crosstool_abi "$1")"
> +	gcc="$(need_gcc "$1")"
> +
> +	[ -z "$gcc" ] && return

I know I'm picky, but this expression leaves in error in "$?" on success
(i.e.  if we'd ever want to use set -e it would detect a failure when gcc
is set). A cleaner approach is to write it as an assert using "||":

	[ -n "$gcc" ] || return

This one either fails '-n "$gcc"' and triggers the return or suceeds
and leaves a successful return code.

>  	archive_name="${hostarch}-gcc-${crosstool_version}-nolibc-${arch}-${abi}.tar.gz"
>  	url="https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/${hostarch}/${crosstool_version}/${archive_name}"
> 
> ---
> base-commit: 228a318052869ab08f01f53b5cedfae0e930f6dd
> change-id: 20261102-nolibc-gcc-download-7c72df57961a

I'm fine with the change whatever its form anyway.

Reviewed-by: Willy Tarreau <w@1wt.eu>

thanks!
Willy
