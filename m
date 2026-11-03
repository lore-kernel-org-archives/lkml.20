Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735681;
	b=nLNXaR7NCY+rs3I7g6ZFjUZkGEYpzFXaRBdOBlGo7n9ciVHAKqPN9Zv/EmozwMWnIVsL
	 rYbJnDW1toe55gARiY0LBcAkDSupop1xzadoZ0Trf8MIMcTJMGPLi/ZfL7TP+bB01wLBn
	 db0eQBfT+VZ4QmXGpqHHs+YszxOsFOlUYc1YJnI2ujuY1nw12v8HM4KFExXdT8zOUkPaf
	 DE6wM2vC+ARIJZnIL6nH2/TK45/HS6CQYn7o62FmxPHR44lFvA3CpCHfaVaCC58yqqUPL
	 qfqKTkWZbJXEQuLB7zN1euCOnY1JDQC1InuGwn85sdM/lgBubbayjwZI98ax8qBnuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735681;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:MIME-Version:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Report:X-Spam-Score:
	 X-Spam-Bar:X-Rspamd-Score:X-Rspamd-Action:X-Rspamd-Bar;
	bh=8Lmt44SSStVfy72XWkasOgo1SS8EQd0qTY1WU8nUAZs=;
	b=wB5+6XvPuHG07c3nAQ3Qbz3Uwc3wwkz72KBxecH2YJdfBqlgYTYSXIwJ9q79Fg3R2QK9
	 hqEAS33A3WXFG5wadsz9634xPhccQGS8uBCsmYPKb57gNcIsT0Yu8qgpTv6qGdffnoL+P
	 WTbiKfrtcNee8/drpG8oaOvKTepSDT2txDZxQ9Ep6RuCmiox4EJ1KB4sG9moO7ys+PypO
	 KAwnP9lGoobEO2fCGrLtJkHS8VRSSNbbriZtQKplEgzNS+rf+9WNfltIeDED2YNKRy4ei
	 jXoeTYWK/ynBietqaqKQzXXwpVjHWvJXxNzUt8Z5L4YK8IiFFkP8Cn/k1kqYzMqslEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=gmTK1qeH;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA8606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BA8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=gmTK1qeH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=8Lmt44SSStVfy72XWkasOgo1SS8EQd0qTY1WU8nUAZs=; t=1793735679; x=2109095679; 
	b=gmTK1qeHmPsmJC5RQtCfgqX+ZfzlSihTc7uVGzu8sBLjKXrCCG/ZUHxNHvDXUgEXPaqQ7NL/yXI
	W6HI/QLDUA9/8kw7FM35+CI3h4sxjy4qeC1Wv+BhVR5+L+HQOYGBMDMtTUc6JWvlc5e9VLugKy5Z/
	PNJc9Z7fTZiaraBnlkyS2zrv1qtcWFR5Zlw8cfvebqathujTqUkA2ZxIVl5P45gqUXl02bXCJHpXG
	vzaQInfA/FrH/Cq76A0fVN0AMIemgT5ckDltVwmanOlE8XgPxQVV/UL8mbdOE/qQspKkqRHiVlTBE
	cjtZpqO2d00B27IX2dXrCNDzFViaIRfhagww==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xOKaS-001YYN-7X; Tue, 03 Nov 2026 20:54:28 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1xOKaR-0000000Ceu8-2RD1;
	Tue, 03 Nov 2026 20:54:28 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1xOKaR-0000000EskH-1nSU;
	Tue, 03 Nov 2026 20:54:27 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 16:54:27 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi
 Grimberg <sagi@grimberg.me>, Chao Shi <coshi036@gmail.com>,
 kernel-dev@igalia.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
In-Reply-To: <auo5a1kRTSWsAYtF@kbusch-mbp>
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp>
Message-ID: <352cfcec6865cbf636a22442511f16b1@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.9, Tests=ALL_TRUSTED=-3,BAYES_00=-1.9,KAM_DMARC_STATUS=0.007
X-Spam-Score: -48
X-Spam-Bar: ----
X-Rspamd-Score: -2.4
X-Rspamd-Action: no action
X-Rspamd-Bar: --

On 2026-11-03 16:43, Keith Busch wrote:
> On Tue, Nov 03, 2026 at 04:18:25PM -0300, Mauricio Faria de Oliveira wrote:
>> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
>> index 2d8f681079e85601a92624d196e77f1ba3ace34a..3ba0666da7be6a3de2e5f0fd50155af115b4e1f6 100644
>> --- a/drivers/nvme/host/nvme.h
>> +++ b/drivers/nvme/host/nvme.h
>> @@ -708,6 +708,11 @@ static inline struct request *nvme_find_rq(struct blk_mq_tags *tags,
>>  			tag, genctr, nvme_genctr_mask(nvme_req(rq)->genctr));
>>  		return NULL;
>>  	}
>> +	if (unlikely(blk_mq_rq_state(rq) != MQ_RQ_IN_FLIGHT)) {
>> +		dev_err(nvme_req(rq)->ctrl->device,
>> +			"completion for request %#x not in flight\n", tag);
>> +		return NULL;
>> +	}
>>  	return rq;
>>  }
> 
> Is there something special about the NVMe protocol that makes this
> problem unique to it? If not, why doesn't this check go into the generic
> block layer instead?

Thanks for taking a look.

I noticed you asked the latter question in the previous
submission/review (Link: trailers), and addressed it in the commit
message; pasting it here for reference:

In Chao Shi's patch, there's been feedback/question of whether this
should
be done in blk-mq, as this is not specific to nvme. I'd say no, at
first:
- Some blk-mq calls for completion have no return value (e.g.,
completion
  on other CPUs), which suggests maybe an API change and updates to many
  callers, all for an edge case.
- An alternative available currently might be blk_mq_ops.complete(), but
  that is handled in the driver anyway, with risk of hitting an error in
  blk-mq (like this) as the code changes, and seems semantically wrong,
  i.e., completing a request that should not have been completed.
- Keeping in mind a small fix for stable, for now, should this be
merged.
- But happy to take suggestions if blk-mq is indeed the way to go.

For the former question, I'd imagine other block drivers might be
subject to a similar issue, under incorrect completions, and can take a
look at this later. I'd appreciate feedback on the points above before
trying to address it generically in the block layer, if at all possible.

cheers,

-- 
Mauricio
