Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823680;
	b=UCTrgeE5WuHKit4TgJR+MJoe8ZXE++YuXHjsIARNp+lWur64cxFSwkyRlcjBL2yx0S8L
	 Tm2/Leu+m+PQn7UocrMJEhTMuTDFVwpC51qd+o25Q3143YLDj3Xu7t6C++PjNfXkK1wXl
	 Ypi4forXT9taSKDLKgI3YGq4/jpfcBi3d+KbA5RG35fqkivKuu3Zt4eovf8ak9ezGsL3k
	 IiYbhZk98Aj0avnkzOLDvvO83PicEKt0zqy/i6c2Dg6hIbi3GvcdJv8HBS34buN0tQTJV
	 jixXSrLus3RhFf/qfIhfKl2MPdOMJrqRcSbIeN9br/DRUr8iv6tEU9/nAJLB/8FE1dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823680;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:MIME-Version:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Report:X-Spam-Score:
	 X-Spam-Bar:X-Rspamd-Score:X-Rspamd-Action:X-Rspamd-Bar;
	bh=Q5ylkFwCSFYny5VkrDa+VS2X6oriL1/EsEN3JDNDXmk=;
	b=A+EzUD6VaGCQOLiU8E4HWR00CS8VdE6JUjmmGXJv4L6/FiX29xBzHF0biWbNnrQ4Cgtd
	 qJeX2t/0gF80V+qnNyKGmRdGAPaPKQfwgFGZrJ3D9R3EORo0igLLLgIzenPZgkA0Jab9T
	 rTTK+53ByGoKMbclI5GlZk0b3Q502DR5fbb5cvAMtqm884TOb4B/WbJM90uYqpY++L7YJ
	 j8zutEqE/B1iIfHbaHjZT5CyuFN/lcDhRQHRDE/FP/WPl4i2wiU5v16AeBCKK+IaC3QQv
	 aH6n0XlLP0xHb6/twSmgdLupfuLGCfUgSkInIw46jfPXfv4BHzI/m6lqC/9Mq+5uRYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pYKsV6yN;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A3606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940A3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pYKsV6yN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=Q5ylkFwCSFYny5VkrDa+VS2X6oriL1/EsEN3JDNDXmk=; t=1793823678; x=2109183678; 
	b=pYKsV6yNM3CW9/IXT1WMbiXi2gfdDQTaIeVSZK0mlzdsrYxzeggV+G5cUUml9ZzfcGF6SvB9cvF
	eoxVclYwwrb153FR4i7J1wblMkH/2TVyaCbh4aNHwYyewObNCg4uEHbIhoJAuBgqztVrWuTzTM6FK
	ilEBYd4Y6rAwbciPbEE0FOss06HW51z8B1NgR3LwkhCa0or1muuUSFRZYlrrbP+kgFUcnrOLhLQEr
	moWfP4S0SnmI+60lYKU7Ci3GerJ/YL2caKMcqWxeso3Ky06ipstV9nyPSlHV8EtQDWAMcnXYgoU07
	vsNY+6YDli4F134GQMOZnEngqhMnAhsGUxNQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xOhTo-002dN2-Kj; Wed, 04 Nov 2026 21:21:08 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1xOhTn-0000000EerO-32lX;
	Wed, 04 Nov 2026 21:21:08 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1xOhTn-0000000F9ry-2QNi;
	Wed, 04 Nov 2026 21:21:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 17:21:07 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi
 Grimberg <sagi@grimberg.me>, Chao Shi <coshi036@gmail.com>,
 kernel-dev@igalia.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
In-Reply-To: <auuRhVO8nZHM-MwY@kbusch-mbp>
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp> <352cfcec6865cbf636a22442511f16b1@igalia.com>
 <auo-v5ZliGbM1Tiz@kbusch-mbp> <65414ea51d23fdbeb5d8b7bb4bd9d535@igalia.com>
 <auuRhVO8nZHM-MwY@kbusch-mbp>
Message-ID: <610c32b5a2e5e36844071a367356aed6@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.9, Tests=ALL_TRUSTED=-3,BAYES_00=-1.9,KAM_DMARC_STATUS=0.007
X-Spam-Score: -48
X-Spam-Bar: ----
X-Rspamd-Score: -1.0
X-Rspamd-Action: no action
X-Rspamd-Bar: -

On 2026-11-04 17:11, Keith Busch wrote:
> On Wed, Nov 04, 2026 at 04:46:12PM -0300, Mauricio Faria de Oliveira wrote:
>> On 2026-11-03 17:06, Keith Busch wrote:
>> > On Tue, Nov 03, 2026 at 04:54:27PM -0300, Mauricio Faria de Oliveira wrote:
>> >> For the former question, I'd imagine other block drivers might be
>> >> subject to a similar issue, under incorrect completions, and can take a
>> >> look at this later. I'd appreciate feedback on the points above before
>> >> trying to address it generically in the block layer, if at all possible.
>> > 
>> > Here's my real concern: the proposal is a race. Another CPU can change
>> > the request state to in-flight, and this code will declare it complete
>> > before the hardware even saw it. It's a silent data corruption problem
>> > that we can't fix because it is impossible to tell the difference
>> > between a bogus and a legit completion at that point. This kind of
>> > hardware shouldn't be allowed to exist as it can't be used successfully
>> > when it behaves this way.
>> 
>> Could you please clarify? Not that I'm defending the patch; just so I
>> understand your point.
>> 
>> The reason I ask is, IIUIC, if another CPU changes the request state to
>> in-flight and wins the race over an incorrect completion that maps to
>> that request, the request is declared complete anyway, even without this
>> code, no?
> 
> Yes, the race I'm mentioning is pre-existing assuming we're dealing with
> this kind of protocol breaking hardware. It just can't be fixed on the
> kernel side, and the proposal trying to cater to it makes it painfully
> obvious. I'd rather crash the kernel than risk passing on corrupted data
> as a success.

Indeed, under risk, crashing sounds better. Thanks for clarifying.

-- 
Mauricio
