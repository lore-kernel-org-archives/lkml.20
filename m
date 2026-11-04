Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821589;
	b=tkm+36NxjzOyDISx/on+yyTtQPx5P+LTnO78IO/liWdIM8I4za+aeKa34GmV/BB9tL5u
	 0519VXyOERKHsYfUnYaHRQup1yZElZ8sOiPX4uwuJN7Hp6kT5QHJBZgK0hKlVU6QAsrsk
	 h9whvMUXYi6o4M6x/oFoy+6OcmYZmU4fPfrst1WXxhBx0rrf4eIzksEdWGRxKHCMkPDhM
	 D4TUARPcKG6Lhm2jHk97mCo1sSeXFHDrssgctBc004VgpvTWSjpaAKdsLqdTbHZXdUUva
	 t+KbJm7XniV/JAty7jv+uXMFsl25t2A+ac3IUiIRKr9jFZuJmLWhgr+kDCqqHr1Ilkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821589;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:MIME-Version:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Report:X-Spam-Score:
	 X-Spam-Bar:X-Rspamd-Score:X-Rspamd-Action:X-Rspamd-Bar;
	bh=FepmyHBsJ69d2bGawn41LuG96FhtJK5OYJTHe17LtHk=;
	b=a0OWHTYbj6RmK/u4FyNw2ulKKARFMQJ9NNTtOaYx/0ha15fd6W/GdnpLaiMVBwVqqZe4
	 CagSb4yrnqhI3dKqNe/aBeu0q9Ezfb3b6+qpusvN+/InLuSeqk0uIXowyHsYcSo3SLeJb
	 3envZahLjscCwO//z5nJ99utXWrk1O1JpujNutIgFvBP0SbeuvwHjCMG5TSF7n8ukHSx0
	 L5jkGO8C4znyQCQ03gNhiqNvvyA+tkLGLmAxfjdwWeJYGL0vh6gT3lI208KXRMVlgK0Wk
	 t4OQLXu6AunjC9DcQviMOhKVI5rVwUKEqspHWMCsUMl0EchdwdlNIqwTdhmO3Tpn8gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=HZ2z7fFx;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14532608D41F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14532608D41F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=HZ2z7fFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=FepmyHBsJ69d2bGawn41LuG96FhtJK5OYJTHe17LtHk=; t=1793821587; x=2109181587; 
	b=HZ2z7fFxCXNdc2HZ7p0zCBeRgoaeX2ND+bYrJWvCPAYIt5ugCwqSGYPPgRjHeGgE5cFm27pf9cI
	UDozxLziAPSggezZuTHDTfJxbT7J3B45slc2fYfwp9igPZta0qAQxlmbhUjtqJS695So60d7Y32Bd
	gUPqUB3LRQ91cLC3tNgSuGZhVr0O5Jw2jwkfs50MgkDr6TlcOQ0kW1+fWziTMutH9P/LMPy5Ne+9e
	AAwAZgwM6xH6dKHtu2qPiQUtQHpu6xp989jwwTZxjHf9BAiYF1FjAAUte5vVaa0oyKQx5gN0eWjYL
	Hcv1uw5Vq9riaoPF9q+wGAoxQxh8T+1qdNbA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xOgw0-002bRo-Qx; Wed, 04 Nov 2026 20:46:12 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1xOgw0-0000000EahW-0dbT;
	Wed, 04 Nov 2026 20:46:12 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1xOgw0-0000000F9U7-03wW;
	Wed, 04 Nov 2026 20:46:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 16:46:12 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi
 Grimberg <sagi@grimberg.me>, Chao Shi <coshi036@gmail.com>,
 kernel-dev@igalia.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
In-Reply-To: <auo-v5ZliGbM1Tiz@kbusch-mbp>
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp> <352cfcec6865cbf636a22442511f16b1@igalia.com>
 <auo-v5ZliGbM1Tiz@kbusch-mbp>
Message-ID: <65414ea51d23fdbeb5d8b7bb4bd9d535@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Report: NO, Score=-4.9, Tests=ALL_TRUSTED=-3,BAYES_00=-1.9,KAM_DMARC_STATUS=0.007
X-Spam-Score: -48
X-Spam-Bar: ----
X-Rspamd-Score: -0.0
X-Rspamd-Action: no action
X-Rspamd-Bar: /

On 2026-11-03 17:06, Keith Busch wrote:
> On Tue, Nov 03, 2026 at 04:54:27PM -0300, Mauricio Faria de Oliveira wrote:
>> For the former question, I'd imagine other block drivers might be
>> subject to a similar issue, under incorrect completions, and can take a
>> look at this later. I'd appreciate feedback on the points above before
>> trying to address it generically in the block layer, if at all possible.
> 
> Here's my real concern: the proposal is a race. Another CPU can change
> the request state to in-flight, and this code will declare it complete
> before the hardware even saw it. It's a silent data corruption problem
> that we can't fix because it is impossible to tell the difference
> between a bogus and a legit completion at that point. This kind of
> hardware shouldn't be allowed to exist as it can't be used successfully
> when it behaves this way.

Could you please clarify? Not that I'm defending the patch; just so I
understand your point.

The reason I ask is, IIUIC, if another CPU changes the request state to
in-flight and wins the race over an incorrect completion that maps to
that request, the request is declared complete anyway, even without this
code, no?
 
> [...] It's a silent data corruption problem
> that we can't fix because it is impossible to tell the difference
> between a bogus and a legit completion at that point. [...]

Yes, but even though the driver can't tell a bogus completion is
different, it may tell it is unexpected — at least some times; for
example, the existing generation-counter (genctr) guard, based on driver
state [1].

> [...] This kind of
> hardware shouldn't be allowed to exist as it can't be used successfully
> when it behaves this way.

I agree that a device in this state can't be used successfully, but the
kernel should, IMHO. 
Say, in case the device hits this due to firmware which needs an update,
the kernel crash might prevent the user from applying it, in the first
place.

Please let me know your thoughts. If there is interest, I'm happy to try
a different approach.

Thanks,

[1] commit e7006de6c238 ("nvme: code command_id with a genctr for
use-after-free validation")

-- 
Mauricio
