Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4627378D7D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496421; cv=none; b=BXTQWfLoIKTi3Qqwq3dLJPP4DizhtB/izx1+PiEqSVVTs5hD1YYsdGDEZTM+/uMFm62eZxtjotz5Wjm29KvOy9Dh1tX1HfRi1pFBvCBhSkwUIFT9ApSKCgN5TMdGW16iiTuz6njckn+6pCMiVSwJoM8vxgnOVxeCNsU5DF5slDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496421; c=relaxed/simple;
	bh=5O+6D0Ywa2yUSw9h9yzzGd6AMtFRNp/ZWJLV5noHZjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCXY+vYZI/mop+2uy3VQ1+jxUoTSQkt+IcgHYkeO9fNA6BZIEYEUjoWFr/qXavUh0WCu+bGxQWPCcqv32dxIDL1W+fu+j9FTv+8NUlhSzmRmRFyuEzmK0FCWgJv2pLztltuFJRqiOhSDjoCVfO1xrFE+tZMvLJGAuvMVdAfbEu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=xMwJtAim; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xc/zI8E3; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="xMwJtAim";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xc/zI8E3"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 086ED7A010D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:53:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 08 Oct 2026 17:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791496417; x=
	1791582817; bh=ceZahRa5D0hfURWZw+TzINORR1V0P9Hpg68NuNJYlew=; b=x
	MwJtAim9Mypw9pls6Wr0pRb6asnL/0DFRNeRsB01aD6usYSMaTltzj2nEcJd69TM
	+CYncVz6XcPgx2dCfmUBs2XbU4d6KfRdOr8TC1+qTbqugL0THuxrb+4/l/VLAdOY
	B3Q2I6XHKlB3vr1PeqP95Pt/f3dvvHmsSw1MBKZf1K4wdm/igyu85QggE4rhUHWT
	pRfKgkgCtS0sOHYJPkWq4+TC8moif2SRY0iWI4/Xs0l0RdMiehRQyW7bON3gl3WK
	C9cN1SUm9PSS/dox7OUFHly77kt5DgbC7RIf8yKLJTjeTVov31BfaYvH1Zvgjy0u
	E7v68NYtIXvxH7j4ZvZHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791496417; x=1791582817; bh=ceZahRa5D0hfURWZw+TzINORR1V0P9Hpg68
	NuNJYlew=; b=xc/zI8E38JuI3x9H4Jejb0/xUCy76LGNSKUC/IeCUVdPM0iB+48
	WO2D2w4G8b+zGE9YByYB9Kv1JRntdEJK1Vu0CLudVN4syCYgwakuD3/jBDZvhJAb
	8bduIpJAZPZCNd7WLxgciWUfmAVriQolBUie6bgHoVuuReY+d10qNoDbSaMYVba4
	GpuppTezPIzu436EFG6CqL6+VKRcWgcXio9R9RPTgo5VpU9MtAyKDVox1XKmXnlB
	haLA3mwzU12hS1V2VDyDp+edjE0qldq+RFu8W1IUDl6GUUp2TVvS/X9iLrPrccG9
	iIXUYAH52OAFHmafVKBTeZoYPZ7HAtI3xBw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791496417; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:b794S4nNxyI7jctFzDH90Xf16nlfOevR57YypLAQwqj+nwM
	p9AZ0J/iDIZp0bVUqtt4yKWx/P4/+abGGA+5yVxQyFxnK2V/D4zM0s7UZTQBz3Rb
	0K5dVGoL6lUF0xq7r3JRlmrEB4WRcm6ffoxlvMV7sCoBQ59qYOoznniiLCkwDfAZ
	M1HOiWhUSsXDg65zHIF6WFflLnnNKfE2qFfMTqBbUnzSltA3V6Wnp5wEA5hxihf0
	AgTYFBzhyvnE40terb+a0yJdqX9bqarfErX3sCj83ErFnfkdxwvSvMv3bSeuEdFB
	UTG11rE7vorKCywBLN//UL89BO0SF4qAelkNbBA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:5/FIn2mq35rBHrNJUWsccI+7X6IJuaTV7wEhcq5zhA4=:5O+6D0Ywa2yUSw9h9yzzGd6AMtFRNp/ZWJLV5noHZjU=;
X-ME-Sender: <xms:4RDIaj4Ffk2y9zCaSqTyCx9tTNh2FZNr-clPATYn9fsEkwMIsUn63Q>
    <xme:4RDIam04YPibjZoB3dyscjf8vPuvzmOrTx8TdC1reDyv4Swgb7RYhyDJBLxArWsf0
    oNFswNvV7fxNrnZbHwV0PCc1pkqcfhFmDLAMdP6uEzrxKrmK2A6zJ3f>
X-ME-Received: <xmr:4RDIaiBy7KepfwaxaDcbqU4eabknyYXlakRpoYjf4vm7IX3MdfSFX83rLbe9M-vVdtW1CsO7-0iV2qXRihLeOq13kXu5TQ>
X-ME-Proxy-Cause: dmFkZTFJyGC845cgG/N7Hy0nHlKFImEY+Pw2JvmvpFoh5Hf9DRLJ4bQ432jJUgqED9432K
    RwdrgWQ2W4QAsL4EPalxKdYAATF1iXFi6VYavu2lHkQr+dQ0XZxzLrZAR4WRPLXAe/b2tM
    HSh/cATgEQvMt2UVgM8jseeFi9b2hH8pgF/NMM1tjtFBE5Grqp5wX6Zax8SnGAwqcZOAIz
    KEoa3faIjYQ9SVlPx/6h5yis4Xiu+PcPXT1VwoANsZKFCqJDSY2a3P/Sbj5DbuF5qcqkAg
    ZDPwb0oi9G0uYT+01C7/N2zqBmKmtU69LVUpa9OgsJscWCy2PO8Bkqkm5UQaLa9ICZnUJ3
    pRhym9DzXeel0OyDm1GWRvqOY4Bc2TY3mMTI/NsKtl45QebkOzi1sC0PmbIFuCW7X7GLtb
    nVd2wFdBT2eL4RWeSYKV4BFuOpNippXVHiMl2kb6CsFd85VaAA1Adam7jX9RMai5IQ64Cr
    WfkaB2p2L9YAigtuxxu2N6t0a88nHhtz3qe5vCCDsrK9taIIakazI5N3+KVqbWRaoDWllr
    c4atMw7UbpuNqxobXGS0k6+aiusbpPDkqD6L7q/HgPBWF6W8S7Uj9sQe2GFNVZI8L8Vknh
    0pSOEmrVpJd4HX1jkkPeGSop59PQQp7Jfms3eOW+XMG2s29WzQp8Bs9EVa0A
X-ME-Proxy: <xmx:4RDIag1DTYEK_KIRhG8-JujR6XeLTg1ZuOL9FaLeWXXPNno0jEF6HQ>
    <xmx:4RDIakvts2mcCHnK1YNwB9aMIATdekGei3F4QMh7X3SZ8uaaLCwa_w>
    <xmx:4RDIao5iwyVk5y0vG-BTv6QJo9DwOrfQ1jKIglHW2Eull0AgTBxTXg>
    <xmx:4RDIatKSItJK9FlJKcNC1UBLEPnY0-7jOH8yK_L3AV8zVb9VgNZ_8w>
    <xmx:4RDIaksSyuKeILr3d_pkDpJ2ef963kcTu7ireculVcssPsi570I_UQ07>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 17:53:36 -0400 (EDT)
Date: Fri, 9 Oct 2026 06:53:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] firewire: core/ohci: defer cancellation callbacks
 to workqueue
Message-ID: <20261008215333.GA216733@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007093235.175742-1-o-takashi@sakamocchi.jp>

On Wed, Oct 07, 2026 at 06:32:30PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series is take 2 of the previous one[1].
> 
> The current implementation invokes both packet and transaction callbacks
> from a workqueue when they complete normally[2][3]. In contrast, the
> cancellation paths invoke the callbacks synchronously while cancelling
> them.
> 
> Although the cancellation paths are guaranteed to run in process context,
> invoking the callbacks synchronously is undesirable because it makes
> callback execution depends on the context in which cancellation is
> executed.
> 
> This series defers the callbacks to a workqueue when cancelling the
> packets and transactions, so that callbacks are invoked from a workqueue
> in both normal completion and cancellation paths.
> 
> This also allows local AT packets to be cancelled. Local packets currently
> use a separate path and cannot be cancelled once queued. Make them use
> the same cancellation mechanism as remote packets.
> 
> Changes from v1:
> * Use prefixed local variable in the issued macro
> 
> [1] [PATCH 0/5] firewire: core/ohci: defer cancellation callbacks to workqueue
> https://lore.kernel.org/lkml/20261005112544.240552-1-o-takashi@sakamocchi.jp/
> [2] [PATCH 0/5] firewire: ohci: invoke all AT packet callbacks from a workqueue
> https://lore.kernel.org/lkml/20260919115017.859169-1-o-takashi@sakamocchi.jp/
> [3] [PATCH 0/3] firewire: core: invoke transaction callbacks in process context
> https://lore.kernel.org/lkml/20260921031931.287429-1-o-takashi@sakamocchi.jp/
> 
> Takashi Sakamoto (5):
>   firewire: core: expand close_transaction() into its callers and remove
>     it
>   firewire: ohci: schedule callback on workqueue when cancelling AT
>     request packet
>   firewire: ohci: allow AT local packet cancellation
>   firewire: core: schedule callback when cancelling pending transactions
>   firewire: core: fulfill kerneldoc for fw_cancel_transaction()
> 
>  drivers/firewire/core-transaction.c | 101 ++++++++++++++--------------
>  drivers/firewire/ohci.c             |  57 ++++++++++++----
>  2 files changed, 93 insertions(+), 65 deletions(-)

Applied fo for-next branch.


Regards

Takashi Sakamoto
