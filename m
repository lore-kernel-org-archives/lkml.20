Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57796368D5E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944854; cv=none; b=FnkQaXVvjmcLDSZHyoIHhxvsiB5zZgZsj9EDZwDg0McayxxjWIrW1/V+y1ssDYD9vmY1pmXHr2hdvk8yMJnzLw1JGuVXyDMHeopBUJsSU95WusPHz070xZLixRXJDt788aoyxtuXT4vVmgFqBMiatg0tgwbd1AzBI8zF1uscpYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944854; c=relaxed/simple;
	bh=qp0e9jukquw4BCOPfoaqFwsruB4sZhIFY+Jv7zRgTcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBiQMyZkYoVD7m0SmnY2p3rO07s3oA0C36nBrzg243wMmAJrBqwTA0BIIi4e08rFNXvo1LJm17/v7GVoXtbtpXXrujRvPzYRyv2tppjeAI9mgX7JfliaYaq6jQCQvuVupePb7hPxLOwl83RN9OPoLoc5DVMHRRJy/inSXeM1a+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=JVFS6ePx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YkYcJBbY; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="JVFS6ePx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YkYcJBbY"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 8B2B31D000C4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:27:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 13 Oct 2026 22:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791944846; x=
	1792031246; bh=mQSVeJ25fnZbuqHyHRooDn5QHTeglxDX2X/QddZ/Fuw=; b=J
	VFS6ePxY1wVeWG3aiGhBfMJQAEoqEaF2mxl7rMKdhvzF11STb63PrpBawCWkJMTy
	XJZ76GzptnIXDH86aVrucQWzbvuhsSrw2j5a2KNoBLXvUjlptWYUlMzPyDe81tXf
	zdkhBXNur0m0xlMjcg4utQsxHvK03IKm2xaBkT7+JgVTZktYUaEejgDrjU69/WNk
	wXaRau2tc9Kh9c+0jS69M8XhfZkJ/30qTetG3iDSaXL3vcIWQlRr0krsE0dHAJ1R
	QKyRx0rdzW0B9CBuiZddH9/IY9JwgpYmCnxRcz36FF2R7Fq/ajVbgg1GGSw363ZK
	rF9ajjPVtL6/t1ES16law==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791944846; x=1792031246; bh=mQSVeJ25fnZbuqHyHRooDn5QHTeglxDX2X/
	QddZ/Fuw=; b=YkYcJBbYNQ5hjA8X9W8PlV+a3LPZl1YOZkT3iQvkWzvHYKffj1x
	bMANKXglPbrp2Qy5kn5b6GFS9OH7q1s75Y9/SMwEIPNCPsA2pOC+pkGTCApV79Eh
	PjbY5Jb74PKu6Ktfg1zfEOfhwYzzb2ey+Yntp8bOOEhVN7+UHnQESLSAZrWMYLAE
	8gazs9dhM84zC4DgoYpFd6LN+GDbUvu632mWvKs5yexnzkTbyZF2C4VdhCqo6HZj
	H6b0QRdEDP1kuuVoOBLa6XTw2luWpb2m/6pfx5lWZOr26jq3hDR4Y5BVUR5Wi5fY
	EM2ZM9OUKsyXJeFoHuyl0bQStXqPCvJFEFA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791944846; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Y4u0/oFaQneiAkH2SQgX/5a6Al0APtWBIzkSg8r9ehUqVC7
	4FdPzouHlZ1/v63IbUAbX7PCKCRMV4mmG3mhAQR1AA/Wg9yj4yWgoCZf9yCqbK8J
	5+Nj9dBgwogHfVdXPRkrKETYRs6L4attqmIVbRcblSW5lsN17ieJzXtVRHAmaKBD
	p0KMVhFSdewXhd3HkOs7Ed1XEL6Ybt6sRhTRmA6AQGL97bayfqE7FIVsmSKl6Qfx
	A3FnqPA5pk7AgsLet8c74WUgad5BD5fnZ/yEA/su/CCB79M7debQbtE4BI9wBR2W
	b4YZz6F+sa4FEQgEswqFFvRakDQDQDroauJ8AJA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:74LRhJZaaxn4HqWFbA30H/owZrXQNHrXHg8CpqoL7Fs=:qp0e9jukquw4BCOPfoaqFwsruB4sZhIFY+Jv7zRgTcg=;
X-ME-Sender: <xms:jujOak5Q3KfOOJljCnH2IidqYTDYuVrOKutnCzh1C6rcMfgax9ClXg>
    <xme:jujOaj2Otjw_BY93YefhmEGoCHsoznHdz6_bwkCyv9z5lw3B3VKT2t5UlEKQ94NyB
    05Lt_Wu62JSNIAy4cBubRdHGRsKEvSH-O9p5qW6HSiUiNDrNyw3ghbU3Q>
X-ME-Received: <xmr:jujOarDbh81sa4xe2j86JQopRax2yaywxIuzbU3kl2HAbFyudk2-CGdo1Bd59zVdylUy6iEPx8z27id9rtbFgDgoMSAYzA>
X-ME-Proxy-Cause: dmFkZTEjyepREJCjRn3CLnwDM5MxBJ7ltuQjgq4uiLFT68rthNsg0GJls7AYGBoeg6GtEw
    N1gB+JK5lOFmUTcrbBT/oF0rC2i9e0FS7oGkGpj/H5WwjbkyV3TLZFlgG76PKyHZ52PrgT
    ZtIgJnSb7+TkxYXAMm62JhJUJriTyo9k173tfNR6WKO7JuysReAbJ606GDGUIxpHl2wFGK
    1FjalAel+rnYLBiGjJlGzGAlhZdGvalUX04wBgrKXXy6uU2W3M7PbUP7x8ZO/bl9jq+gfP
    lql5Yp+40itkbJSxhovATwT80d6Qhs5VxMcFnMhQreWI5QhKQ01xvP0VbcyCheSRIQm5XI
    ajZbnbhYfCoq6wgu3z1gc4jwf4G65bjlsGpPbDkgMho6XtCDbmP7jmng0p8Atlfc9hl9P5
    dkNcWQrjUwTnSP4hlz4JNBDT1IFPRQNyPJj3HrJkgkDRrDm8f6EdHGGsH7/fC3yvBbLEhu
    WrfsJuz4dbXgr24guc5oMFPoYg+G6bTKUU+EnDCcXaKt8maC+ekgMZXcimd059H47G5ls5
    kQfQ1p6iOk1+KMgZK/rnRl1HZFSFz4Q6q2ZTfVx3BOw58Xz/jt73pJF8cAMjpWvyI5tLn1
    bYZInufg99aUaS3l1agKC9nsKOetMQ9cf/AKWsyKgtUgOnLRcXa7PEhUDYzg
X-ME-Proxy: <xmx:jujOal2VEFZvoTsojkq-g5mssIz21xvTUusE-WTQ2fTYltx60K81YA>
    <xmx:jujOalvZkb76_BNnxh9q2zPeEy6ajwt09zc1TxrwECj0vdkHA6lc-A>
    <xmx:jujOal5FFykmtevKYkJLreUHieklcZFY181RUoV39AKfa_MbXMapRw>
    <xmx:jujOamIFYRLkU6z0sGVZMcIKR-odtFEXsneBs2FfXC2tkLax0V3LNw>
    <xmx:jujOatshzV1V2j4jXEzF6gvQy--jEk25TWwDdlYwUlOGeIuLcSb6q7qc>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 22:27:25 -0400 (EDT)
Date: Wed, 14 Oct 2026 11:27:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firewire: core: add kerneldoc for outbound
 transaction-related symbols
Message-ID: <20261014022722.GA627016@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261013111509.612518-1-o-takashi@sakamocchi.jp>
 <20261013111509.612518-2-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111509.612518-2-o-takashi@sakamocchi.jp>

On Tue, Oct 13, 2026 at 08:15:08PM +0900, Takashi Sakamoto wrote:
> The core provides helper functions and structures for initiating
> asynchronous transactions.
> 
> Add kerneldoc comments for these symbols.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  Documentation/driver-api/firewire.rst |  3 ++
>  drivers/firewire/core-transaction.c   |  2 +
>  include/linux/firewire.h              | 61 +++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+)
> ...
> diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
> index 33c4ea48c6c9..22cddb736289 100644
> --- a/drivers/firewire/core-transaction.c
> +++ b/drivers/firewire/core-transaction.c
> @@ -396,6 +396,8 @@ __must_hold(&card->transactions.lock)
>   * than when the request packet actually hits the wire.  On the other hand,
>   * transaction completion and hence execution of @callback may happen even
>   * before fw_send_request() returns.
> + *
> + * Context: Process context.
>   */
>  void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode,
>  		int destination_id, int generation, int speed, unsigned long long offset,

The above should be "Context: Any context.". Let me correct it when merging.


Regards

Takashi Sakamoto
