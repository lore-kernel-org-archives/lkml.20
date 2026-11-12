Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453912;
	b=NEhyQMpJO6RG4k0ktBL7cFXnYACvaD94JEEztufrMcuWybMrgSkAwYfnkK3AhfnG4zt8
	 uEf80yE6t31Nu8fDGmVnItiyguJnqvXUmvmhChRffSifFN6nEITHqqUjMnwdiEEExM/kZ
	 G2fGFTb3v+y3zwWdMoxNA6iJdAcZgjhOItOsXS1cDNpf89wFlUfsCXd2qrHjglnAlqSCJ
	 DnIVt60E0+kdMGZiF0Fd8W+9NIQTFJrFm4mQnQB6fCsqxxgbHrw2htAZKmp5YZ+9YXHOy
	 lRC6//HmVCtespmFTNLfq+tEDyLk9XeC+Ar3CtRXOYvI5uVXEH3q237KPZaOgVrUKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453912;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=aSZC4kEoEyuUkUaX3CMkALuKhmGWqIihhc7PPVMPEZM=;
	b=2sFvHNDggXIy9bgtdAdcVZanws+HWW5KkgSNf6PlNRpV8/O6VzyezpgKemUlpq+ObL9G
	 8oD7qCFVL3byHp5pW+a6VUvB6oBhhXG6mwgb7r/5qe5PBsDrVu8mvBvlsCQ5STZ7/MEWc
	 adGifQzMMEeqQfSGjpI6LmCkO7WPvvszG1xyA7H5qxBueIF7q/aMKxAxWpApmqHKs0koi
	 pnTMls0JKBtmx2QcnZYwbpvtnoqTXODA9jZqmotaC8kTY3whRkS1uLTDEz4YPRZqHsa0V
	 BvBXcZJ3ZxZKn4H3M1ViMGEtefk3v0tzy3uBFZ8CZmh6E2nly0eBjWHHBeBixKPR2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OjKAlZCF;
	arc=none smtp.remote-ip=91.218.175.182
Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OjKAlZCF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HvooxPlyjQcGS58VJz94P7HNxCR6qXLyjr3CAFFCPA4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794453909; v=1; x=1795058709;
 b=OjKAlZCFa4pK98lAZEWT8h10zOr7gSee7lK2ocPKo9XnF19B5Tzf7sRisdcvO6YNRCDz4DtW
 4jdfrGanrCBFPl930sIHxwilW8cPP1qQmT4YyzxCmkQEyU8/638sbr0GA3quz0rQAIw+HOSVjrf
 kZ9LpvJejf4ISYrNJ5F3Ys51U/DuZ1YITNe2NfGcM5FpIN/CM7kIKmLxIPgIObi0ow+FlTfuQrq
 6fgfACGRX4NayeuTtfXR28o3jkyeDvw/H7gtXmoNLesAadPQeN5yDG6ayRIAB5NXznXF5ud3W6e
 L/ETJV0qyBTW+9fBn55bIA8Hzt7TCrSYmD/MHUSSo5CwQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86332a4202345b87;
	Thu, 12 Nov 2026 03:25:08 +0000
X-Mizu-Trace-ID: 86332a4202345b87
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 11:25:04 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the
 English original
Message-ID: <avUxkMii_xlAdUZu@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-4-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106113142.706783-4-chenyou910331@gmail.com>

On Fri, Nov 06, 2026 at 07:31:18PM +0800, Chen-Yu Yeh wrote:
> The translation carried no "update to commit" marker and was still the
> converted zh_CN text.  A section-by-section comparison against the
> current English text shows it never picked up several changes and
> mistranslated a number of sentences.  Bring it in line with the full
> current original:
> 
> - add the missing paragraph on EditorConfig
> - add the missing "There are, of course, some catches." sentence in
>   the internal API section
> - replace the Coccinelle :ref: that pointed a URL at the coccinelle.rst
>   label with the plain project URL, as in the original
> - fix the sparse and LWN URLs, and the coding-style.rst reference that
>   displayed a zh_CN path
> - keep Linus's quote verbatim in its literal block and add the
>   translation after it
> - retranslate sentences whose meaning had drifted (the always-zero
>   argument, driver abstraction layers, multiple evaluation of macro
>   arguments, the inline function temptation, Devicescape being offered
>   for inclusion, failure recovery paths, fault injection percentages,
>   distributors, compiler warnings that should not appear, documentation
>   being the exception, rare deadlocks)
> - spell Devicescape and Coccinelle correctly, and fix the *why*
>   emphasis that was not rendered
> - replace mainland terms with Taiwanese usage (內核, 代碼, 內存, 線程,
>   函數, 接口, 文檔, 信息, ...) and the 爲/着/啓 conversion artifacts
> - expand tabs in the literal block
> 
> update to commit 5adb3698bbe8 ("coccinelle: update Coccinelle website URL")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../translations/zh_TW/process/4.Coding.rst   | 414 +++++++++---------
>  1 file changed, 216 insertions(+), 198 deletions(-)
