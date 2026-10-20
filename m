Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502224;
	b=WlFP8czJPmeuDQBFTSOV2+X/xnUuuhDjDu/C4gYAoOjmW73J+VpLfZkfUgFHDha0fZUN
	 LxmsRvjQhUlnBc7CPiuhFZhRrxq25VQR+UbX6aUgd0ksVF7WWtvmC5YGhBi7D4N/wjb38
	 XoTAzOpOvGuRCr7mQAZKWZmxtnz0as+tUMxUUE+sChbtmgQNPFr9E884fMMzisyy2Yp/6
	 7lgmOvukN028LFJbJqtJqP1uoHXT5aP31Od5EyHR1mdbKyLDbX6Gt7GpP2Qey+4ZTw/PF
	 kgOa9Bgq1UepsdusvF8yWfLMAFKH6WhjY/3E4fzR+LSW2XRQ7lao8j7s+c1Z6DR8P+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=sD6m0KKQF8wj51NTduZuzfl9vCC3ADruqTB7lIN0B1c=;
	b=NHMEkLHD+oucQOgJum26stzK2h9y1oCQAgoppexHBwnGeRM4tROuyPT87QO0/P0I6stc
	 rDpciMBMVFt9Fq8M9/BkhomrCXUXr23S303hNMVCSuNVJvgq14gynynBmBSgimPDPcgBx
	 cZSLNp33neCIEEMFS+sK/4g1IfNlQaek64OxEpEh6hBBDS7JWv0NLcgFlloLoPjSXHxH6
	 xHiTpsVAJSmpkMMQj7jU6h+92egQXMARZ6Cp+nTzt6EPcaLS6QX5L6ZNVs5qPXCJb5caC
	 8/CNwiZ+LiEYI0E4kdcFbUS6sqOQdYnj75PEwKjeyVdnYngnS8NzIvHN7yb8gln1IfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=qp9lMfRy;
	arc=none smtp.remote-ip=45.157.188.15
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407CD606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407CD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=qp9lMfRy
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j8CcS13W9z1GWP;
	Tue, 20 Oct 2026 15:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792502216;
	bh=sD6m0KKQF8wj51NTduZuzfl9vCC3ADruqTB7lIN0B1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qp9lMfRytMTRB6Rxas+4/39haxy3twrMuHisJDMnCO1hULKRQZ9vp9u0qEwWoRcd9
	 8OU+N7RDp02FewJFiIMuFdviBccMV76g/uJPzYSagJGIxdhQ4dTFrKpD/ro6TYdzqw
	 Gl0cpDvbmLy/yKOQw90dQqOkFXGMq3dMvdH/Cczk=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4j8CcR3VLCzQvM;
	Tue, 20 Oct 2026 15:16:55 +0200 (CEST)
Date: Tue, 20 Oct 2026 15:16:51 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <20261020.shai5aMoosai@digikod.net>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
 <20261019.Za1phooV2oom@digikod.net>
 <atc6Vczti_EjFrQq@sirena.co.uk>
 <20261020.ij4euziuYovo@digikod.net>
 <atdmcnGhgZ9U8g_S@sirena.co.uk>
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
In-Reply-To: <atdmcnGhgZ9U8g_S@sirena.co.uk>
X-Infomaniak-Routing: alpha

On Tue, Oct 20, 2026 at 02:02:42PM +0100, Mark Brown wrote:
> On Tue, Oct 20, 2026 at 02:28:48PM +0200, Mickaël Salaün wrote:
> > On Tue, Oct 20, 2026 at 10:54:29AM +0100, Mark Brown wrote:
> 
> > > > I removed these wrong kunit checks Friday so it should be good now, but
> 
> > In fact, I updated mic/next Wednesday with a new patch series addressing
> > these issues.  I only added two (unrelated) commits on top of that
> > Friday.
> 
> What I have today is f349c073889ff7694b470ca34dae9bd94d47b0cc which is
> "landlock: Fix superblock use-after-free in release_inode()" rebased on
> the 16th (I just tried refetching and there was no change).  It seems
> very surprising that there might have been an infrastructure issue
> fetching the tree all of Thursday, Friday and Monday?

Commit 0da3cb3db77e3fe2202ddb637f6d27668dc360f7 appears in the
transparency log:
https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git/commit/?id=0da8a8d3dc37ec9a71b76f9739957297d64d4b73
