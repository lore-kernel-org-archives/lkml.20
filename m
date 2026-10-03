Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA7368D7E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003076; cv=none; b=MW02FJvylkFN16Y2TXWRgVsnKjTiQTqz1s49GKgHWqeD1/LoN5WBKyvySh2jQTcJTcgGCVjIdGeKtfboEtpW64OmOI9DTjjfffQQxmJRXo3kybZWX8AI9PnbuuUWadVTXg20ujNK7r22dJHorFlUbtnjngZoJCA/I8IOVLASg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003076; c=relaxed/simple;
	bh=KStmg3oUIs79dLjDmEcrn67rRHE9TtqILVt3qo4t9Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAUM5FtlvCXMds3TY3ygsgybohaCpZuBdnNySIXSfSZ+1aTOiQNDpYRGXTFOBFBdRydeYzxVNufQc7H1o/7jjrTUCsdKC5GaMr31H1qfifDVDC3ck92+8Sl/sk0vod6/FisDSt14VfjVD9EMoRrmPQ+E57n+IZerEEEBubQSSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Vwh6B4zA; arc=none smtp.client-ip=95.215.58.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Vwh6B4zA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KStmg3oUIs79dLjDmEcrn67rRHE9TtqILVt3qo4t9Ho=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791003071; v=1; x=1791607871;
 b=Vwh6B4zAkHYtBgWy7fI10xtxELwdWNl6YdO2SwdLISnHsUnkWsWA2o/BARAgBDKGST0J/sF2
 qSfsaMC1ajS9ES8NE/xy37e2F/7HAuNaD7jcS8TnWeYcAUbejQzZQoMdOo/0e7cKR10LQpgWiQb
 zq28kk1oMstxHQbXhvHylR5eteDRl2a2rO6u/PLnIBxJydzzwS+U/M4eSbPERpLUZiw795H3iPQ
 ILjEAh7iK2PJ4KYw2UBLox5JdiFgFc0ZsUc2q/Al1vAR87ctPGFDRQJ8OJ12D2SM/HI4MrFpXGr
 Y98UMBTi5M/e7KH6T2MyuWJdkNQ9Kxiv33PWO6pim2qnw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1e664f4bf254e273;
	Sat, 03 Oct 2026 04:51:11 +0000
X-Mizu-Trace-ID: 1e664f4bf254e273
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:51:06 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] docs/zh_TW: mark translations outside the maintained
 set
Message-ID: <asCJurHmDhvDG_Gj@wyuan.org>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
 <20260929131142.266819-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929131142.266819-3-chenyou910331@gmail.com>

On 2026-09-29 21:11:39 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> As agreed in the zh_TW scope discussion, include the notice added in the
> previous patch in every translation that nobody keeps in sync.
> 
> The rule is per file rather than per directory: a translation carries
> the notice unless it is looked after.  Today the looked-after set is
> process/, which the recent process series brought up to date, less the
> two files that have moved into process/ since and are already
> marked.  Everything else is marked, index pages included: they carry
> translated prose and fall behind like any other page, and a notice on an
> area's index tells readers what to expect of the whole area.  A file
> drops the notice once someone brings it up to date and takes it on.
> 
> Left alone are index.rst, disclaimer-zh_TW.rst and glossary.rst, which
> do not translate an English document, and the notice itself.
> 
> arch/index.rst and dev-tools/sparse.rst have no disclaimer include to
> sit next to -- the former never had one, the latter still uses the old
> plain-text header -- so the notice goes at the top of those two files.
> filesystems/sysfs.txt is not touched: Sphinx does not read .txt sources,
> so an include there would never be processed.

Well explained!

> Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
> Link: https://lore.kernel.org/linux-doc/aqFPBQxq5asHzvtn@wyuan.org/
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Acked-by: Weijie Yuan <wy@wyuan.org>
or
Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.
