Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4283A6B68
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285963; cv=none; b=Rv8pqSQ1C9YJeVjnyn2Te1WraTGsGAHYWZyhn/WsGIIMH1RAywbS3rhWdyFjawh0L0xhLQoGasuavco+65jIRj2niUxeWrL7/oIeeS5nr0xz8HLXyfpTeKNGeMozEZHxDQMNgB/37q8hmZcnPle9Odd3SogwqJpFz5Y4RRZHCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285963; c=relaxed/simple;
	bh=3r7xjNc5jMB58uTm6VWV8rOPaZ1T2ACSs0A7Q/mKTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBu6cyta0zajRMgLUTHCqk+emHJyB6hsNxmoR530RQDhDCAPiZOknvNk5TSkfJ1iNF6lZFFrcdCtnvcXmBMJmrLO2+5ysmObYzI4+Siw5Gzr6QJCy82z9GToQnaCvVEBseKPdwGfqFGCWntxL+eNDcqwZ2SlXVjVYoB9hovyCGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=tfhv4GBi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VfUzWkt8; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="tfhv4GBi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VfUzWkt8"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 522C9EC00C6;
	Sun, 13 Sep 2026 03:52:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 13 Sep 2026 03:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789285955; x=
	1789372355; bh=vJW54aitUdfLF1HhsTjbdkodocCGdDxtW1WX7b8Cer8=; b=t
	fhv4GBiCqdtXjX8HrSoW8EJLJTb3+m1g+LZGqOBVH+//491ppJ7FZ0cnSt4nVx2R
	5GrFPyspOOJKGoUQUAQnGQePyu9a45oi4Z980MbKMjupuXE9jammSq2Rw5rUMcJx
	VTVC2fpaZDEmSbYHthY18tUdNgpiO0rUAWYoqiMitEt1xVRL7dAmjrmuB5D6tExN
	tcs5HR9GbsF/DXS+QYfkIj/3ZkkdkAG+QftILfdmt415D4F8ErpbGgtpnaVzxWm7
	09pvcaydBdlmEf6CR+CzIWlY+rZ8JAyp0YSgkArwdjoJkhHsFBmoNYMDs/dX6i/m
	nsnmC3NsFdDfbueuAvf9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789285955; x=1789372355; bh=vJW54aitUdfLF1HhsTjbdkodocCGdDxtW1W
	X7b8Cer8=; b=VfUzWkt8jg5X0cY/+7po7R/72DbTgrXZT/s4iCRbMO4wXpkSFfF
	25rRgrrq38toczytKrevUT+UWnKfTFBHuAzEWndSCh+L8a9wMtCHfsUk4ab85pcg
	guatNYu4Yt8sj+SfMV4OJbpoOO7fKXDzLF30Z68yMFrJGyCM/XrNqhrYbGYdqQlj
	EjrDd/pDmhHBnm0DCEbX5XmqAOls6o5tgucGnnoeyJtXfkm7DpV5RIcY4folaWYb
	7cgvJ3jxf6Zxuxfgbcw4YDuPU7BVAh8vs+evVMWRR/K064pf6f1AiYImnN40P4Zs
	saYfUfuBtwRnvvgtid4HQiuevn86tB/cGVg==
X-ME-Sender: <xms:Q1amaq0wbPY5rIK5z8b6kJAx3TtFH7ZGjcyoyNDIqjMI5-4r7qob1Q>
    <xme:Q1amarBwIi0ieZOg-XP4OSC_y1yKUufx04gqhfz1XciU--JMq0m-UY2GcJ2FLPJIz
    uryB-SLkuZQh1SQy-X2o9Y-OyWi4lyCCg7nJHP0XwOMNlBvjlHSPubu>
X-ME-Received: <xmr:Q1amaqeY7pQB_J3d-Ye4lGxXnv9WOOaC8ZF_eHzt9LcyGTm7OQw4c5uXM2AXYl0j9IU631N9_kWlPO3sUTCfHPnHIo4LKA>
X-ME-Proxy-Cause: dmFkZTFyvLICCgt4kYDlJ0N1SG/F4WPptov1GhKruedC3TwVQ0YcL4ePs492ELkPI5ORQz
    vapuFimfBLzwX3XwhizcrGRWt1OY1pgVNr8U0Ou1Ea3Gii3Mt/kQi9k//VaowBmjWzbzez
    Y+vgsP5Loytge7x8J7Qxra4u2L2f1nXFLJoJ/GbptD5dq4A72n/mqqiBm7h0gGwXoMlAQs
    wyruMHkfPzgtorpwXNLq99H+06lG2g078lGPdIiwCaDzpixU5gwkFs1OCvB02a2SgqQMFU
    Tz7NplFlDCbXYpCUZxeq/IWtHOEg3opA03Ls3jYLGdHT7kGA5kJj85y3+B2WX9sJuQ15ZW
    a3kROnvXKQ7+vdiXO6qP2U2eWW6Z0c4qVQnYEBmiLecz26wKtFTKpBvVm4Y8Yr1eSXgDPg
    61VxN0AM9InnW6Mq6CMW02R0g46sL5R/pFUYV+hBH8umZFH0HO0lZgj0AcG5dvJWDCHOGz
    szLgQdc7dQnW0c8RTTXCZ1y2N9GBtwe6kTvOiSnij7u2/W74V4KWCLMgp8XijUt5C8byRX
    xw9ZCLBekTUEtuO1qz6f74jLtFxxM3M1LCKoTCXeEJw/+Eh09ZIN5Y+JjtF5dkr0s4qxSG
    ToMSGrmxyRt0i/SDKtsAE7dAW3qnYexlNNEdMWsn/Dh8kNezwyicIGSc476Q
X-ME-Proxy: <xmx:Q1amaoj0SPDCXQMv8V31ZzEX1UKgZjz_tnraLYLQ0oluxSs7_h3ARQ>
    <xmx:Q1amaqoAtxNkpocG-tLBhYpC-nnL3NFiNzJt6aa-2vI1fMxdYsVK0A>
    <xmx:Q1amagH8DYoydgmUpaQ_Pvfq5MBfGm2s3lvymGtPxQcBgLkuNRJVHQ>
    <xmx:Q1amask6x7vyuO14Ns-mCCp3PkZ2lYh_nDrFRFwKM6Sm3PyY4AVHkA>
    <xmx:Q1amanLKwhyVDgO00oWSJwkQPNzD8ST6JPRD6AOjygSqMBkA_lQWePVe>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Sep 2026 03:52:34 -0400 (EDT)
Date: Sun, 13 Sep 2026 16:52:32 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: ohci: obsolete flushing field in at_context
 structure
Message-ID: <20260913075232.GA129893@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260912032219.3379821-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912032219.3379821-1-o-takashi@sakamocchi.jp>

On Sat, Sep 12, 2026 at 12:22:19PM +0900, Takashi Sakamoto wrote:
> The flushing field in the at_context structure is used for the internal
> branches in handle_at_packet(). This field is enabled in
> at_context_flush() when either handling the selfIDComplete event in
> the threadedIRQ handler or calling the .remove callback of the PCI
> device.
> 
> In these two flushing cases, the pointer to the work structure retrieved
> by current_work() should be different from the one in the at_context
> structure. Replacing the flushing field with a work structure check is
> preferable since the branching can be self-contained without relying on an
> external flag.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/ohci.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
