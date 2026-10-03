Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC4322D4E9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002295; cv=none; b=PC3cbSHdf/5P2GHRnPwn53eq+vomWcESfDSdAxzEWYhLteMDiKUZc8Mdy7aqKjye5jk/oMDnL/HNVl/geXfdJM/xGm9QlFBqXLfhAeWcff/eHTl01AqygvUv/XGaKsTHpfzTEy0tBVoIjqR9CEupiWZ1Ruowk5AZpSbXCX8ysTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002295; c=relaxed/simple;
	bh=OddsCyB1+NlHOb+iAMix+w+nZ2FgLtttMfKfX5HO2bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp8U9fKvI0c9kgBlY+RUbY4G0yQTGEnSN1L3qfVLz2fDF3KlhfP5va+DzPhhbiEUgX8+63J/DYW5xq0zDeFY/QXVDUzJHCOyRX0sv7CCI93JLfGf7T9npDJYX6hpVGotZCEw0ao0YR+lX+PhjdIWK49w1hzsJPCYP67GIL6mm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=CrOkhJTc; arc=none smtp.client-ip=91.218.175.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="CrOkhJTc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OddsCyB1+NlHOb+iAMix+w+nZ2FgLtttMfKfX5HO2bw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791002290; v=1; x=1791607090;
 b=CrOkhJTcmvb2tBMaykScvBp2lvUiJNrQdDrCkwwARgHox8UNY7mTkIbHp/6tqhJFh2M3Z2iD
 iyHvwW/ZPdHv+KvV/Dc4U84YVplKkIhhCOUiiIQ6jjr1owLb2xiQbCq0doPTzAqh8tpVec6Vq6t
 +cO4HE5x1kcA9SNysvFgoAjMV7c9XILeVjRvOgHRdqIGA/Wv49yNKA5yk5nelsvaOo/pq3aPo2j
 LwUAzxFAaskOzu6F2qR4beSU5GTQjYqN5sANJWIe5CDrnTNV2axS2DuL+UZ0HMPBR+hlv6Sz876
 WqeiYBI/xLXTWX2Xq/442ybvBJseMCqlSXGBV6DCjVP1Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 91a53acc4ac8f721;
	Sat, 03 Oct 2026 04:37:59 +0000
X-Mizu-Trace-ID: 91a53acc4ac8f721
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:37:49 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] docs/zh_TW: mark translations that are not kept in
 sync
Message-ID: <asCGnSMAh_XFnWMD@wyuan.org>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929131142.266819-1-chenyou910331@gmail.com>

On 2026-09-29 21:11:37 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> As agreed in the zh_TW scope discussion [1], process/ is the part of
> zh_TW that is kept current; everything else now says in the file
> itself that nobody keeps it in sync, and points readers at the English
> original.  The rule is per file: the two documents that moved into
> process/ with the relocation series are marked until someone updates
> them.
> 
>   1/3 adds the notice and applies it to those two files
>   2/3 applies it to the other 58 translations (one line each)
>   3/3 links filesystems/ and cpu-freq/, which nothing linked before, via
>       a translated subsystem-apis.rst, as the English tree does
> 
> The notice deliberately has no :orphan: marker: included after
> disclaimer-zh_TW.rst, a second one renders as an empty "orphan" field.
> (Two existing pages already show that field, because something precedes
> the disclaimer include: a stray byte-order mark in
> process/kernel-enforcement-statement.rst and a highlight directive in
> gdb-kernel-debugging.rst.  Not fixed here.)
> 
> One consequence worth knowing: checktransupdate.py reads the "update to
> commit" line of a translation's latest commit only, so any tree-wide
> patch like 2/3 makes it report every touched file as current.  The
> contact-block cleanup already had that effect on most of the tree.
> Fixing it belongs in the tool, not in the translations.

Agreed.

> This applies on top of the relocation series sent alongside it,
> "[PATCH 0/4] docs/zh_TW: relocate translations to follow the English
> layout".

I figured out the applying sequence by myself and then came across this
sentence... :-| ;-)

Thanks.
