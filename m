Received: from mta0.migadu.com (out-147.mta0.migadu.com [91.218.175.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC9128D831
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791000553; cv=none; b=EfK03ozA3Ph1a2hPzFNjyiWjmkiPqfBitT6W7mPUJ2JzK34WM62jvfn46Ds9sgaC5HCIN7+wktl1B6vHfZJW2ubSx38M9M9NbzHhXnIT5nCKESAzGsHaaua9Zc94TvR2J0kcWxJQ4ePmxlRuH+HGvyJqm0jkGgsbgEfGPQv4cFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791000553; c=relaxed/simple;
	bh=imDMpdjRhfzMYggRquormk+wJ7ZhIYD9996w+/U6pE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCVQsAU/1OzGN+gXsPTqvwekSsmzu5Pg3lCRgxANvdJU2MLkONs/EcpECbGTqz72v90uOs0e31lGVsfhd3gHxYQp641P7UQwcgZLJGtrRPqoUzH2nK29BSnKupU27CdAri+QLR+ApWALTQRePEc1c3mhSmFVcL17EposphsEWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dN4f7vKK; arc=none smtp.client-ip=91.218.175.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dN4f7vKK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=imDMpdjRhfzMYggRquormk+wJ7ZhIYD9996w+/U6pE0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791000548; v=1; x=1791605348;
 b=dN4f7vKK6PAyhOf5tCp7o7Sbbe/fjiQNK/al/b2zBQoeSla0KJ8vtj9ILCJ9IaoZjyiY4b8G
 sdoywM2VqarVBziEseW6CFgi13sDdtJGKyGTi1LkVWmdGlHBmmRC+sOoGHjSsXmARut5kV6MCGD
 7d+pZxpRaT8tnoYViBeMVxxQ13/ASk1gdSaHvk2uQ77IrclpQnXX9487cdFtfzi7mppYouXX6pa
 AP0uJlAermurqtaLcNS09PkAp89vjdHg9hKwAN9WveqsudPitgCaLfMnQtWy1HisxHm8BR9DBtI
 z3K7N8KbiSg6XV/db/sqxVr+HsOZ5AQJ6+hjx9p36Wcog==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd35fe1bf2e6af26;
	Sat, 03 Oct 2026 04:08:58 +0000
X-Mizu-Trace-ID: cd35fe1bf2e6af26
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:08:55 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] docs/zh_TW: move magic-number to staging/
Message-ID: <asB_10iFCIEhjYPi@wyuan.org>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929131020.266120-3-chenyou910331@gmail.com>

On 2026-09-29 21:10:16 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> The English original moved from process/ to staging/ in
> commit f9a4f4a0e1f5 ("Docs: Move magic-number from process to staging"),
> but the translation stayed behind.  checktransupdate.py locates the
> English original from the translation's path, so it currently reports:
> 
>   Cannot find the origin path for
>   Documentation/translations/zh_TW/process/magic-number.rst
> 
> Move it to match the English layout.  zh_TW has no staging/ directory
> yet, so add a staging/index.rst that follows the English one, listing
> the documents not translated yet under TODOList as zh_CN does, and link
> it from the top-level index in place of its TODOList entry.  The content
> of magic-number.rst is unchanged.
> 
> Unlike most of the tree, this translation was kept in step for a while
> by the English authors themselves: the 2022 series that removed stale
> magic numbers edited the translations as well, and so did
> commit dd8d4bc28ad7 ("net: remove ax25 and amateur radio (hamradio)
> subsystem").  The one English change it lacks is
> commit cdcfc029482a ("Documentation: Fix incorrect paths/magic in magic
> numbers rst"), which went in after the move.  Use the move commit as the
> baseline so that change is reported; checktransupdate.py will also list
> dd8d4bc28ad7, which is already reflected here.

Thanks for additional info ;-)

> update to commit f9a4f4a0e1f5 ("Docs: Move magic-number from process to
> staging")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> ---
>  Documentation/translations/zh_TW/index.rst    |  5 ++--
>  .../translations/zh_TW/process/index.rst      |  5 ----
>  .../translations/zh_TW/staging/index.rst      | 23 +++++++++++++++++++
>  .../{process => staging}/magic-number.rst     |  0
>  4 files changed, 26 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/translations/zh_TW/staging/index.rst
>  rename Documentation/translations/zh_TW/{process => staging}/magic-number.rst (100%)
> 
> diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
> index fb86de03c423..1dddf5963864 100644
> --- a/Documentation/translations/zh_TW/index.rst
> +++ b/Documentation/translations/zh_TW/index.rst
> @@ -112,9 +112,10 @@ TODOList:
>  有幾份未分類的文檔似乎不適合放在文檔的其他部分，或者可能需要進行一些調整和/或
>  轉換爲reStructureText格式，也有可能太舊。
>  
> -TODOList:
> +.. toctree::
> +   :maxdepth: 2
>  
> -* staging/index
> +   staging/index
>  
>  術語表
>  ------
> diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
> index 18653aa75d7d..de99156324df 100644
> --- a/Documentation/translations/zh_TW/process/index.rst
> +++ b/Documentation/translations/zh_TW/process/index.rst
> @@ -113,11 +113,6 @@ TODOList:
>  
>  這裡是一些大多數開發者會感興趣的其他社群指南：
>  
> -.. toctree::
> -   :maxdepth: 1
> -
> -   magic-number
> -
>  TODOList:
>  
>  * kernel-docs
> diff --git a/Documentation/translations/zh_TW/staging/index.rst b/Documentation/translations/zh_TW/staging/index.rst
> new file mode 100644
> index 000000000000..556c63a17f9c
> --- /dev/null
> +++ b/Documentation/translations/zh_TW/staging/index.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_TW.rst
> +
> +:Original: Documentation/staging/index.rst
> +
> +未分類文件
> +==========
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   magic-number
> +
> +TODOList:
> +
> +* crc32
> +* lzo
> +* remoteproc
> +* rpmsg
> +* speculation
> +* static-keys
> +* xz
> diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/staging/magic-number.rst
> similarity index 100%
> rename from Documentation/translations/zh_TW/process/magic-number.rst
> rename to Documentation/translations/zh_TW/staging/magic-number.rst
> -- 
> 2.43.0
> 
