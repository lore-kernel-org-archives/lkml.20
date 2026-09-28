Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0153C3F75
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636228; cv=none; b=oWhJW9pw4yREyuK48psbzgciltrIM3cB0Ea/fraY5j/f55o6Pq+0/adFdm5ex/1UuyBIBu9tmYcDoBK8eQB1Ro/7sMEy6ruUnkvCBM9vRP+QjJNR6dSG5RSYgpEBaRMWsabZe+pM7TOZzo9tO7d8mFtB/xNGGbdc2iebKzQB+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636228; c=relaxed/simple;
	bh=qLXX7hX6/eYRgsRtpQxhB1lPzA9xjySY6NoTJHeBIVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfwXvQevVXvWdqMwts+Jrv9M39YWcn0LMFQcim6oca7Cij0M9TsJDdLM0OB6YxBSoV+rsGqVnjvYOfVEBz8HhbpFmzkX56s02kMG3OT5pJEGKRYFHRoRI9dSIGcHHLclthzVNiSKy1+o3gdBnSgAO/MnWMNdNw79webBxQcU+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=1gM8TiVZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=huROY0IH; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="1gM8TiVZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="huROY0IH"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44B4D140007D;
	Mon, 28 Sep 2026 18:57:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 28 Sep 2026 18:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790636225; x=
	1790722625; bh=TCb43eiacDDJ6V8hC/E/KmMtfwm5nkcn1xs4lHMftOk=; b=1
	gM8TiVZ+HR70Ol7JOvsOBcVzOe0tYyfnE9knBLxbIWoEogN75bMg5wH0SeCnepGo
	qJx8hheUAwi8wIja1H6mejSTpq4ysXsLwTn93ygDXVgn1ej8NxuYym7qQ/pWdUEv
	bvJBlXBm0ynBJJIgk+/u1cH8YUR599QpTK8ly6QfffBijN/n05aXohZT4eK1Af0q
	lF8h+uzRd3vzL9+/7x9SYzoPSFLhefsel6VRXF8pb+LCmFPkz5ygOj4fe8kNYT8d
	LQosxupl1VKmoKbQS2k8Zb1dgSnjgMDBbG6tLM6jfcRfd7PfyvZvqMqLAPyNw2Jv
	WAxgSwcPCNjtCDalLHEww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790636225; x=1790722625; bh=TCb43eiacDDJ6V8hC/E/KmMtfwm5nkcn1xs
	4lHMftOk=; b=huROY0IH456I5VFhhWUp3qFihgmGQ6N9T57J38rbBlScuy7Omvd
	usmH7rAs+uHEl/POU/KdmAYp/kuMle0o8hScC33rnaWcNXEGkyb+fHCZYk/UMq10
	wqgVotHeOxCSIM77MVS6OojFmg20ik7MevbIOCC17drZv4ThrasOE4M1E6lwYnGY
	ErsXZ/cinB6HUspzB5aVhEBEJsK1HGl0TOIzXfOm3Ss+yZNZoRTuzJrzHvZY41W6
	h38cJ6afwSyVgakU5OcUVPYZlwuUr67UoVvQdrLY+NBRz1du3PWIsfWzYK4Es9fG
	gfC23cmO24SWnCHUJWEvn0cfCKmbKREMfnw==
X-ME-Sender: <xms:wfC6anKrVFWHDFGtY3vBc1P81YpVN8b9jUD0uW7q_JIQQhljsB9uDw>
    <xme:wfC6apG0B3i2VjeBUw1AZ2X6bfbKvwSCgeorndaO_gcyzG8H0KQGmzJFEM8x6nBo6
    UH32ENfy65R0_nCdJAwKYzbbnVN5jmSDNcn_ykx8ohleuMcvveZwok>
X-ME-Received: <xmr:wfC6anSl9CSKyvPRHbGCY9a3rT3c1rFz4fLoIUfVvK7ITBW0bMnaPJuIpvLLtcRnaej14kAtYKhHPEnjrpYtR5tltly0Y9Q>
X-ME-Proxy-Cause: dmFkZTF01flxN13qAheHF3RT0yqegHYRWFPtnv50THhZGirzVA/03FzZAfZZ1Kpnp6j3ip
    JMiyPopZMYa6pYlTMvgDwkyPry0BUf26UJTfZmrecZ6ZWpDIRxId+zjB7fs4e/mw9ftXWw
    6L0/X9ayKdiCywBn6JR58+a40NfOdQF5mADAucp6qSOqxTSGMwa+sSDbp5/kzenkKr1iGz
    1pVAiHiDiPmJiKeOCMDth4IIgUpJwIpIdLo/Zet+71YoAyjZJQK/flZczVyypzr11g66af
    H2ebwPkX9JtldpxD+4Qct9hyvtGMCKZjvOcfyfou+VQFe+twaLk0y1VpDQBOzgBIi+a1OK
    Vtnf8h+HTxtZH1GyNP4PlZAoHSIAl+4agyLpmWS/0EMxwFrV1ykPNgh171LM9JSatpxz02
    MmZwYR1+Q6dambXkI7lUxSHIWGrn31wz98QEaSaa1tgyZaSw09M8lL8Idh7VUW8PhQwDu/
    SaOU1UGcBy7iBgjbBpqxH/ESacC8/MlLrA5zV5iL/wDSwVEgtRmlAp8BmGmXnF6Xj2aREC
    Tth5dyjm0Wk/em805oJ3nl3KxjfAwDkI00jTNx4jvH0/UV83fOK1HXPKl9NNzeEYdtZJSC
    0FBasRRKeiOMzN+Jx5MzoW9inwKIneqqu4wAkSYm7/xSiJrH+KPojjR3LfPw
X-ME-Proxy: <xmx:wfC6atGVWEV_LlOXU145gGBw8Dcw-j-eQJU-VdhRstx325dy2l7iRA>
    <xmx:wfC6ar9CklPx5HbojxG7S2cXFLXKf2yngg-LH28xwkAczSR2eh2DlQ>
    <xmx:wfC6avL8I9kggT4_S9CJ_f9wjH6kfrPW5FdVfoQeJLk7mIay3pP3aQ>
    <xmx:wfC6amYnKglP4ZxbZ4q1zivGASudfVzC0r7Tnrl8uY4DxWoTuK68LQ>
    <xmx:wfC6ah_5cxAAjEYKu_42HH5ZYZNzdy9mZAAQFzG2PuExv61QXnwd3Rt6>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 18:57:04 -0400 (EDT)
Date: Tue, 29 Sep 2026 07:57:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firewire: cdev: replace spin lock with mutex
Message-ID: <20260928225701.GA25983@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260927230724.119305-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927230724.119305-1-o-takashi@sakamocchi.jp>

On Mon, Sep 28, 2026 at 08:07:22AM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> All execution paths in the cdev layer now run in process context.
> 
> This series replaces the spin lock with mutex to avoid CPU consumption
> while waiting for the lock.
> 
> 
> Takashi Sakamoto (2):
>   firewire: cdev: use atomic_t for iso_resource_auto todo member
>   firewire: cdev: use mutex for client locking
> 
>  drivers/firewire/core-cdev.c | 89 ++++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 44 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
