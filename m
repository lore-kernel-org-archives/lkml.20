Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAA538239C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001374; cv=none; b=XSVbl6vOBnvhzaLSEsNIOv0YcApua4T5Iw3sBWOgQxQPFTPZX3TxtE4Hw2C77WyiDaj4tEt90JSRMUrwf1yQ4wkW0/BLj3MIqBfTv6qSoz5fLHb4ESm6L8WlvXAiiLfwNNDhAhsNjubjXq/4GfSUmxIBy5LtRRuz2q7LUTaVY90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001374; c=relaxed/simple;
	bh=5j7W3UEDDcpxB30MobziH1Q9LnlUIk8bxHlV21IS/9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzWneJjrFwikLBDckqz7+VUCi8LebrzJsdIouDKptO9QhtkZfYyu6Fr28LQHj1x+M8IDbNMcrUMaQjn3lijbzK1MKxY8covxhD4KXFmqK2iT/yYMeu7OC3Qefhhs6LZE4GC3l0R/O0Dc/xmItOHSz++flPhUSIvvqNvbkc7ROwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=engQDNWC; arc=none smtp.client-ip=91.218.175.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="engQDNWC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5j7W3UEDDcpxB30MobziH1Q9LnlUIk8bxHlV21IS/9g=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791001370; v=1; x=1791606170;
 b=engQDNWCy2DiGme+WHIXM5TT/HRceMgr2DThCLvVoat9RQnBEGL5JPlnJvap8TAn5eYcrRYE
 AKD6POqt0g/rI+f6LVzvsJRyQTAetFbmMOdLhj0D7L9/7MsY+BeRIu0DOFtzU0g0nClmD2iI6D+
 xRGQUBXJs762M9vaQaXu7MW0RSMmtinlqoE1Om+M/1mCOcQnHRXIgAFlN8cYLplZPNLRLu3SblN
 49ZnuSWAvfwRaSjBGyfsBfwSLuMSUdimCWvOfZ51ALEwZHJF8ia8uJE4pDw+WnRy1DOmzkpTPvZ
 TgppoC2UwUg2ldPb0qjJNbjNVfQAWCPmJz2Vs27kjb/qQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 96e7dc6f7d29fc3a;
	Sat, 03 Oct 2026 04:22:50 +0000
X-Mizu-Trace-ID: 96e7dc6f7d29fc3a
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:22:47 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
Message-ID: <asCDF69rCybdguo-@wyuan.org>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-5-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929131020.266120-5-chenyou910331@gmail.com>

On 2026-09-29 21:10:18 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> Every zh_TW translation names the English document it mirrors in an
> :Original: field, except these four.  Add one to each, in the plain path
> form that automarkup turns into a link.
> 
> dev-tools/sparse.rst still carries the old plain-text header rather than
> the disclaimer include, so its field goes at the top of the file.
> 
> With this, the only .rst files without the field are index.rst,
> disclaimer-zh_TW.rst and glossary.rst, none of which translates an
> English document.
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

So let's follow the usual practice for now, until we make a decision in
the future.

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../translations/zh_TW/admin-guide/clearing-warn-once.rst     | 2 ++
>  Documentation/translations/zh_TW/admin-guide/cpu-load.rst     | 2 ++
>  Documentation/translations/zh_TW/arch/index.rst               | 2 ++
>  Documentation/translations/zh_TW/dev-tools/sparse.rst         | 4 +++-
>  4 files changed, 9 insertions(+), 1 deletion(-)
