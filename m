Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464C30F526
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021890; cv=none; b=URGD/jnZKmt3udyFfVGg5lWpOYM81CVEUgIjQjyZKjABRSLYlg87edHtxkR/jArKoDGd1jSyXehu3FF0fThlz/vrwc218phCgYMWpRIPR61Ldw5kDGYn04cvqGxGFbPbmUmSQtIbYoC/GpztSyodyMF1BnBGBASIhWjQ+PaVIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021890; c=relaxed/simple;
	bh=ZU7ccYgREQswmbosQ04YGNlHX4hrT2Ol0F6Sxmt+faI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGVtmJbrDPduWLxH0ryO7c7we5onHdSykHCfhDz3+vRZT8/AfPELopjzdnyXfn87bzxON9tpYeKOL4IlW1plc23qH/zSIx0v7xly1iyxusUEIimz4yfeGTrvG9KV44ND5BF9cLxaureZcg5Weq3h2nwIDM+uga6Efu9Cgwr9Nz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=tiSVcuhR; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="tiSVcuhR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZU7ccYgREQswmbosQ04YGNlHX4hrT2Ol0F6Sxmt+faI=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791021885; v=1; x=1791626685;
 b=tiSVcuhRpHobPHmoaxS5sz3+rOtLLYf7PZOLinctlkV3azxYYWns4PYtniCCT1AJL5rwsuQ3
 s1AydUTv+3pUR1pUqGJxjVNp3JA05QFJYk6Titu8Lahym8HER6IbgjRewyAXF3VZoXKWXwo1fBR
 mqbTFEybqGVhmQ7i5hN49OK0eH5RT2g5NuvYJO7oKwsl9QWhKfJhgUcEgGN1CnXx7e5asqRqb6Y
 nkQcE/g3A1UF9tI5TNVaG+1EORyOhK1C6n7UPwkZCsF6gBFk3NEgJsYlLWcfY7wO6HfsLZJazLg
 S4i7q4Tjo2iR9piKNDt8g7hlf/pTHUC/uE5xBhiSJkLGA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a7ee22c7c230aa8;
	Sat, 03 Oct 2026 10:03:03 +0000
X-Mizu-Trace-ID: 9a7ee22c7c230aa8
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 18:02:58 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] docs/zh_TW: move security-bugs to process/
Message-ID: <asDS0rS9Racqp3B6@wyuan.org>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-2-chenyou910331@gmail.com>
 <ar_APS7UG25kXXYH@wyuan.org>
 <CAKspUhKypHhegcJJ1DokVhUqLCBE+VaQkX4cMw+tt2L2p1FgYw@mail.gmail.com>
 <CAKspUh+XM_E0CyrG8Lf-fGNFuQop0+i5_O7b+eRJ_Ghp0x6JZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUh+XM_E0CyrG8Lf-fGNFuQop0+i5_O7b+eRJ_Ghp0x6JZw@mail.gmail.com>

On 2026-10-03 17:56:02 +0800, 葉宸佑 <chenyou910331@gmail.com> wrote:

> On Sat, Oct 03, 2026, Chen-Yu Yeh wrote:
> > The <N> commits since the move, including the new sections you noticed,
> 
> That should read 17 -- I left a placeholder in. Sorry for the noise.
> 
> Chen-Yu
> 
> 葉宸佑 <chenyou910331@gmail.com> 於 2026年10月3日週六 下午5:53寫道：
> >
> > On Fri, Oct 02, 2026 at 10:31:25PM +0800, Weijie Yuan wrote:
> > > > The translation has only had mechanical changes since it was imported in
> > > > 2021, and the English document did not change between that import and
> > > > its move,
> > >
> > > Hmm, is it? What does "mechanical changes" means? Does it mean small
> > > changes like typos, format, and etc.?
> >
> > Yes -- changes that did not touch the translated text itself: the
> > address updates in 2023, the tree-wide character conversion, and the
> > path updates that came with the English move.

Yup.

> >
> > > Maybe I got it wrong, but I noticed that the current version has quite a
> > > few new sections and additional content, though. Am I misunderstanding
> > > something?
> >
> > Those all went in after the move. The window I meant is from the import
> > (July 2021) to the move (March 2023), and the English file has no
> > commits in it:
> >
> >   $ git log --oneline --since=2021-07-29 --until=2023-03-05 -- \
> >         Documentation/admin-guide/security-bugs.rst
> >   $
> >
> > The <N> commits since the move, including the new sections you noticed,
> > are exactly what checktransupdate.py reports against the 44ac5abac86b
> > baseline once this is applied. That is the point of the move: the
> > backlog becomes visible instead of "Cannot find the origin path".
> >
> > I should have written "between the import and the move" more plainly;
> > as it stands it is easy to read as "since the import".

;) Yes, this made me take a closer look.

Thanks for the detailed explanation. So this is just a nitpick which
does not matter much.

Thanks.
