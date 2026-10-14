Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C537DE9B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944891; cv=none; b=ahMFYWYrBH07Rxz/WxVJ+c/RPYE0GnzYmJp5QfMdVmEOL37Nm3A09dkjOlG/OIvLpkRsV1JJRM6IB+wqlBgE0tcOaRnxXLRKtj5tpDoDdlWsU86wUe+IWngV5Igxw6MljX7qu4DA/px0GzyfrhTTnl11b7EtOA1ruiGP0ayXWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944891; c=relaxed/simple;
	bh=/JzIOIoY6ql4e99wwunYHtoYFPNW108YH7FSzUMRX4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Atl7wrst4OELcSFUIqUwweNJlmGUM7r+sBPeOCxBzuJVScydcsxg9mkIoV3IKneXLTiGEd7YWVTWSzQAzUqLPTN1CLNiG8B8u1CfMcO+j0+x8QUrx5ARg4gSDroQFNdBS8JjZg2nN52FRIWCLU7g7yi+moTICLTbagcif57Zrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=p0dAwQyc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lohr+AiR; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="p0dAwQyc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lohr+AiR"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 903347A01DA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:28:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 13 Oct 2026 22:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791944887; x=
	1792031287; bh=RnpRCbbCuAcPA0KOUU4DZQ9ooCwmFhFYXWfZYv+02yU=; b=p
	0dAwQyck3PBsdhnvOAbQhjYyNubFZs0A2pDGboSmRmWye8YZwOISj7U0RyHd7JW1
	XYiJTw4dGf2QP5bu+RFI7LIP1BB4Crh62H76AX+tD3Gsy8ZTE72eFQ7NWardQgEp
	Hz0JzKkzrS+ok+ADWB2ZekgJ60fM9xGB1qsL5kgzCq1RX6Ge3DNYhvgZIhb6lRFV
	1uIggJn2kibCIZYYv2u+OzfL6a7dcDLSqwDZ4WSD/JvcbToADsYEDQvyK/S/OAQJ
	QBugtDLB47nzJRg9VULHgN639ZHHP2XVB9CtMkqHJs/X5D+SqeOx1TlqvMGKj4pN
	qFiiA9LF/ClmFNhfLwsoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791944887; x=1792031287; bh=RnpRCbbCuAcPA0KOUU4DZQ9ooCwmFhFYXWf
	ZYv+02yU=; b=Lohr+AiRaKdYlBBu6iPeR9RM3Uyr3NMwj3NRQY2f46sOwBlhJSA
	anbNdKdeamo5uZgbyA8j8nsi0aqegOmUAQmGEoqmJRXulFLSHDFfwP6W4HeopOLN
	KbcQwM+o4iZhzRLNE5lWcOyHWi+FVEt0rQQn0zQSGL+fpsD4FrnHww1SLFGlOFwF
	YtayTX6VIy/6sJtTagAoUNR8dX7SUvxwe63PYZ0iaArWsZGn9vuo+vT5Uv8jLfeK
	MV5kwhHKfxhFihnI6rNATRmTT6HTqYr8xd8tyAHQnEwFlx569PM8mDKC2vlvFW6u
	bkh/YE7wBCZT+fzoLzBtPxAAFxVrxN0rnqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791944887; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Xi4hUZ+kC4jlBHlWvusgBli877r+HToWrRt0NCq0VGGUfEK
	Dy0QIxPHkvKHa+oudeacgpnsZOVJGgNkIOG3lVYLFiEH1wMjxpWvT/mW4lHNQsqm
	AF6lq0L2KR3kZUQcyqr1J0sI/dJxxZNOn0DDblrLgKe3mp/I1Hugvfcx8ThZUwR+
	nGgYkGCPt/o+QHaX6bu3e1NEmA1m4U0+h74gp4rYwFPNrXuaoaxIL3j0AMCODvQM
	JX3MCqle5Utk/AloOS0IfIrgjeL73GMPcJaJuERIg6OZ7aXgosO3xQxkBtAZJkAo
	GkX508SN8ksp63hqWXJjxHkd/KBKxvWHePtTtsQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:unryBnBjpR4fnTajHI35M3YtSVuDoGZIE+Cxr7RuBGc=:/JzIOIoY6ql4e99wwunYHtoYFPNW108YH7FSzUMRX4g=;
X-ME-Sender: <xms:t-jOat6xDkkMUG6B812-z_x1herC_3MieOLyZ-8eiQiH9cJ2CpWUiA>
    <xme:t-jOao14kfMvwNeRXrocUG4XTrmEmWDFiuBmmpZ1wWPnW8lry2hY07nYk5B5o3x3F
    M284RC9JKczAwVtTAnbXp92DPyYUZhR_cWLfi7QXlEC4zct8rpDmyWFEA>
X-ME-Received: <xmr:t-jOasB_Abno20gDrC6mQz6hjH_lUjNZW9_6Un0ieaOC-kyC8OI-sH0g0za8bJ-BkV6SPHb9BMPKn7XP56mhhWUIJV7r2w>
X-ME-Proxy-Cause: dmFkZTEjyepREJCjRn3CLnwDM5MxBJ7ltuQjgq4uiLFT68rthNsg0GJls7AYGBoeg6GtEw
    N1gB+JK5lOFmUTcrbBT/oF0rC2i9e0FS7oGkGpj/H5WwjbkyV3TLZFlgG76PKyHZ52PrgT
    ZtIgJnSb7+TkxYXAMm62JhJUJriTyo9k173tfNR6WKO7JuysReAbJ606GDGUIxpHl2wFGK
    1FjalAel+rnYLBiGjJlGzGAlhZdGvalUX04wBgrKXXy6uU2W3M7PbUP7x8ZO/bl9jq+gfP
    lql5Yp+40itkbJSxhovATwT80d6Qhs5VxMcFnMhQreWI5QhKQ01xvP0VbcyCheSRIQm5Ts
    g0g6Qgn8YSw/as8GRft4d96oQDase4Oy6e3Ctkww7zaf32im1er5O4CIAhbZ+7F2u1Xy6J
    M1zidE4NJgxqQ3lnGU2OnckvWMQCsvufk+sNUqNlGi382gyBMMfDWGDuhKxnBdWRaSWSbB
    r34VJlWPcv1hAodxIiS/G+CZQstP84B68/J6BdhGlpgT6aa8GIRSL980Zjh/lXdTdRUc4Y
    6C8A122CUhd3OfMeWEeKYj/XE233MF07Yqn5uLEvExYonyD58oUi50cW82IArXfYJpRIdL
    r+UNoiGTRHOKCHbiWwhspRPbSx1q2I7MW4jeyI50D+C4iYMPvPHSoB4t0h4A
X-ME-Proxy: <xmx:t-jOai3QAQEPG2cyXMWSpD8KtxZWUHtxJJWvQKz83mqB694MQC0j_g>
    <xmx:t-jOauvD3tkMO74BxjOA1zGcPL9ZQr1cNUrZCW9hWC5oPDMNrSsCNw>
    <xmx:t-jOaq6EVABiUNcHk02rAEAkW8h_m-1QOGQVWiUyHVlT4R8TMzqibA>
    <xmx:t-jOanLaFnxTt-_aEvuq3TatmbL8GUIet_-R0pr0b4dmWqdXhER6Jg>
    <xmx:t-jOauvbIizBJqbtd5Xm1W200p4E3pisjybTyIQt31dhWIxqtXHxINma>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 22:28:06 -0400 (EDT)
Date: Wed, 14 Oct 2026 11:28:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firewire: core: Add kerneldoc for
 transaction-related symbols
Message-ID: <20261014022804.GB627016@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261013111509.612518-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111509.612518-1-o-takashi@sakamocchi.jp>

On Tue, Oct 13, 2026 at 08:15:07PM +0900, Takashi Sakamoto wrote:
> The core provides helper functions and structures for handling outbound
> and inbound asynchronous transactions, but some of the related symbols
> lack sufficient kerneldoc comments.
> 
> Add kerneldoc comments for these symbols and document them in the FireWire
> driver API documentation.
> 
> Takashi Sakamoto (2):
>   firewire: core: add kerneldoc for outbound transaction-related symbols
>   firewire: core: add kerneldoc for inbound transaction-related symbols
> 
>  Documentation/driver-api/firewire.rst |  5 ++
>  drivers/firewire/core-transaction.c   | 39 +++++++-----
>  include/linux/firewire.h              | 89 +++++++++++++++++++++++++--
>  3 files changed, 113 insertions(+), 20 deletions(-)

Applied to for-next branch, with a small fix for __fw_send_request() context.


Regards

Takashi Sakamoto
