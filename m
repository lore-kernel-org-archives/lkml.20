Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0443E09D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792319414; cv=none; b=F2cLVZm5bZKcgEEVv2LWBEFc5KV/WC5RpT4C+ln5jiQRuaWHNQmHNnJl5zQfseVjYzoRnZEVh7kF+FKEHXgUrV8wIHXIuf9PIOBvWgVwW1MRai1GJLXEOXxZdQDn/GhlEf31LduLOk7cTCgbi651WZcN7mzdWidHrrowOvDNL3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792319414; c=relaxed/simple;
	bh=X6D8YH5wrJ1UCL9skgr4KEX8y/W19Kk0SLn93Mi21qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J745W9mhJSRSFSFSSKGoUVj8qVDLOoxRRWJHH+FYL24Z6it+RrwKQDMyhSURni0WaD9Jc7t+8/QT+hwLLLzGlpJi5Cuc/BQT1rAwG36z9ugdNaY61c52e4XEWy+WQi8dzFSXrpmdWCI3U9fzml4eL/aiAL0Wthq0/U4Nh4eUJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=p8GCAYub; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kGvBp1Wn; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="p8GCAYub";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kGvBp1Wn"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 88F8C7A0140
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:30:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 18 Oct 2026 06:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792319409; x=
	1792405809; bh=jaIaY79G/xE5tgwGbN/mN4IklMz67mK9Li6NZ5V5crc=; b=p
	8GCAYubLp0yclY5mu7ATMuT6/Kq1yTdmvTcczCVoe9qhtF62qPMccrifAzpwJI8G
	f9TIJ+yl2bmuDi5tRdaaKM3Mu7OMIAc5d3JZilfQR/zc0KBd02EUobfo0DWXhKG4
	+YQIBGCif/WJ1NgtgdMjQphwFyYNvQw/yCXvp3NmAyqZfves4rb+CKAcfXnM7Ypu
	05+vMLIx2qzRxjXJTP7VXLLUHyl/ouBOTKLsWd03GsQLkdpXyVvhHByG1ul/2ajJ
	taIqu/eUgYN2PqCgiehRS0f5j+PnDzznMKFv9qayEo1wBW+/Tu4TsSrb0f5FM2no
	2DK0wJRUzjjKe3/KkGZFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792319409; x=1792405809; bh=jaIaY79G/xE5tgwGbN/mN4IklMz67mK9Li6
	NZ5V5crc=; b=kGvBp1WnpHZdGoIBuzb7sZob/kh5llCrmeR8pt/SY3PwUHgDx+o
	IbPhCk+Q5l2yVslOsn9jJA0fvp7bDs/F+oEnWgNXhZ0GFkAtcbQwxpxxY4Dnvo8r
	5dkFiigcoG5fGlO3V2R5BXR4fzrWR5oz6g1BrBbiQdcV7De1CXAyTyr8XQGo6ru0
	ExDkfhtezJUYEcYJUixvrC9eAEGEEZjgyEpVn/b5xUkDOCUTosfffAnSBYQXzozN
	p72OczWSMFqT5mT/Er5WUth/CHSQkZJEp126tcHgPnh4B7HZrgOoW0mz7bce7KlJ
	/f0/Nqvpgdfg9BIuAnCLGtoPJaKUJtRN+Hw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792319409; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:DW9MPygebtLbpPYf7sPgbsAWoTaHozuCoVri166W8q0clYq
	qSclB7a83OYpLhYTQaglkCmtEBmWyARHzM/U93beU2TFHxFOgIM3yPOmcL0CAH21
	o/jKDOfioJiwvg8A8vwcqt2bu1Sh+sQiw8NKCp7SVSMqFndToIBsAUrubC6LWx3P
	79+aFAWilLqt0ydc/IxbOElq/yJziZ7HqiY6GTU1lSe1Kuwn6/Q0ISB076/EjBBq
	JKL2tbxVFitB2Gjm+fd0YqVNF+pIzpsElhhv6LiHirCa0WJQ38rreK2MM5T2HVKW
	fxZkKfvGmI2YW+nlst8Vzj9yWjtpwGlBgLpqY+w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:DkjHpoQkYyXnIFj6AGo5y5vmuApe6DbynrdZBaLh1dI=:X6D8YH5wrJ1UCL9skgr4KEX8y/W19Kk0SLn93Mi21qQ=;
X-ME-Sender: <xms:sZ_UarR53k09aZfu0otRDTgut8ezcNLJmG07daR0SOTcUguYp-QMtA>
    <xme:sZ_UaqvS23o9KBRLHHh5ndJRUt0g5Hftil3moLsrLlxdXquimC00DwjVx0gHR2G23
    lCgX426FaUbqxQd0bOlZC2AyOIpFWaG7z2zN_GO4AXJIeRxmN2_lck>
X-ME-Received: <xmr:sZ_UaobSSDi2LIlyoqvZgJbvm1SDIcSWPmFpW9NTUbN-5xD_JLBNV5OwExoVfjAaL6Zgp1_t1wlVk08k3SsLAp8VcntD>
X-ME-Proxy-Cause: dmFkZTFs9A1rRl03UOOttoaiJNxtxLXH1TnHmpThZlN9HDT+yvaZne8ITaGBSrv5gqVUGE
    RgMO0Car965N1ENaHpjpldew/SOWwXAOSNzMmgJOxxHtV0rODAUhLhDv2MyKcFy+CKUmvT
    TGoQ7m9eDbuGxiDUg3sMDZjcvKJhzs65/o2mjERFWWQhqsuFRIzGWdRr9n3nhOEXdLO8S3
    JK5AUFnKAUxoaW1CmWO+FHoriUUcmS2xN/LSJfm3oRPVzf7Xc8vh1Twljrxg1XVrgX9Je2
    jHa2SD95xd/O6JnGK5PtXLu+IxnHIlifNCPth4HEUrceAc2jZmIWTuhqnAH+6KuATj9Orx
    KBDya93RUKu3eBcV4fwh6pumKXaLBtdBEhbq1PqjFA8PCORDUwoK3IcPlMvRUbmFs3v2+O
    IQXrLqdV92WaWNLKMycJGnGq8lLc1LC/LSQ6mlocBzgxo+vTQHKRhKK2Aor1LBJpbyLE8L
    YCbG250Zfna8ukiA8uh2AqpOERUuHq4pXMA7vf4PHD+vDAYuLMcvEZVFbMC4qHHaCgKS5j
    /Ot7wBrqpsGWRNC3dQSLg/jddGA9uqnmefzk9Vz08x7rwYTG+c74yXzyVAl6nTUwivDnxr
    ChJGWfqZFRTwxk7UnsWll2/otYPNuzQohgbqUFuEcFQWLaBwfRHPy0LaeYvA
X-ME-Proxy: <xmx:sZ_UanvyRUkFaNMILKNbcZiS3mWC_8bMCGSFOfVQJKDmWUcHirj18A>
    <xmx:sZ_UaiFzmxm5dtCfXzv2KtSzJ4--GuxCXVpvvfPVzwknmPGJbovpZw>
    <xmx:sZ_Uaqyi3QLZ_NO-06dQB3LH7QB0MURrhFqwN8veTN0tRI1ogUrpgQ>
    <xmx:sZ_UapjTkqvPmNvjP-4wlKlTDImCYUo3pC4cyWYWNDud8rKq48FCjw>
    <xmx:sZ_UavHuh9HeXETlNXAW6o6uaEGNsVX-y3gVuE1Llf9Z1zXF54_MdLB8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 06:30:08 -0400 (EDT)
Date: Sun, 18 Oct 2026 19:30:05 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: fix race condition in split transaction
 handling
Message-ID: <20261018103005.GA346159@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261018025504.290598-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018025504.290598-1-o-takashi@sakamocchi.jp>

On Sun, Oct 18, 2026 at 11:55:04AM +0900, Takashi Sakamoto wrote:
> For a split transaction, either fw_core_handle_response() or
> split_transaction_timeout_callback() may manipulate the same transaction
> entry in the pending transaction list. The return value of timer_delete()
> is used to determine which function handles the entry. If the transaction
> is a split transaction and timer_delete() returns zero, the timeout
> callback may already be running. In this case, the response handler must
> leave the entry in the list for the timeout callback to remove.
> 
> A previous code refactoring broke this behavior, introducing a race
> condition in which both functions could process the same transaction.
> This could lead to a use-after-free on the transaction initiator side.
> 
> Fix the regression by ensuring that the response handler does not process
> the transaction when timer_delete() returns zero. The timeout callback is
> responsible for removing the entry from the pending transaction list.
> 
> Fixes: fa2dc2710076 ("firewire: core: code refactoring to find and pop transaction entry")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-transaction.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to for-linus branch.


Regards

Takashi Sakamoto
