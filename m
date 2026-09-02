Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A44AC161
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367512; cv=none; b=lvxmoizVDqkEROQsCWOXsoxhbZ4ONgm+187MrBpbxNpKGCQwmqCdX12lDeSBwnOcW5/JG1M67kyUu4OH2v725rmFymfsNEb9KGaQtOp+Kouy1eaXy1n4NaTlqkcpuWyT6mK0cINp7DYO/7qQecC6iZt5sDIdb5QCyiTkxzWKtrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367512; c=relaxed/simple;
	bh=qgoRfbrLYpyLE6p55YAj7+O05lGflt9FKMsnXh3aKBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pE1jwmzS2vdY5z1KvVr9o+aEXJsHcAf4jOThoIO86ylu1Mk3COBP7/RlFYIpm/oA/Bg0dnF6INfG3c5qP4bRhjee6OJ5swg2BzNEBIdK3W2ufl3MC9X9U4P2Yms5ZsDdG9LW7TskM7gK0ng0qYCGvRpBPuJ3D2i/AWM79l7Oadg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=wfE6ekrz; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="wfE6ekrz"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4hZpVs3Bvkz1XM0nt;
	Wed,  2 Sep 2026 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788367505; x=1790959506; bh=B+xwGFcM/TQiTWpw0yIK8p6a
	QsY8aH2tb+BYEHgZKbI=; b=wfE6ekrzKxKvYMGGwCCH36/HEWFyBlQz18QlyAhp
	rZ+FSXMNTJSABEC2oSFwmCoLX86cjigRjDVD94ElN3vfsrncDFZoGmkMhjx/HeuX
	BbuCGt3mKqar7R9blzfT0Bo4FXvlS2shp0DZgiNdjzOezLXiIOEj3HDpMvs6BXMo
	SyyzdgsBnpqy8XBsC0LXEsO4tA8kdxJ/6moPHF8UdcxTIcYgGgwHZinYnWErcet6
	ntJ4hXwufEJt1Fz9boBoNXcRZn/kdaGhvR6e13RRtgHOH0bT4jqgRomM/9mKFZBy
	Y8f1s6FMlabzqzmiwGZCRRponzQZFCocLmnAVZPgg5OZxw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 5Yta2afuHr3l; Wed,  2 Sep 2026 16:45:05 +0000 (UTC)
Received: from [IPV6:2607:fb91:20e7:9622:4189:e5f3:350b:5995] (unknown [172.56.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4hZpVk2BDWz1XM30w;
	Wed,  2 Sep 2026 16:45:01 +0000 (UTC)
Message-ID: <e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
Date: Wed, 2 Sep 2026 09:44:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Steven Rostedt <rostedt@goodmis.org>
Cc: David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
 <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin>
 <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
 <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
 <20260901192523.0e989b10@robin> <20260902092437.00dfaa25@pumpkin>
 <20260902093644.5b0e8a64@gandalf.local.home>
 <a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
 <20260902123933.5c3c8fa3@gandalf.local.home>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260902123933.5c3c8fa3@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 9:39 AM, Steven Rostedt wrote:
> On Wed, 2 Sep 2026 09:31:41 -0700
> Bart Van Assche <bvanassche@acm.org> wrote:
> 
>> $  git grep -nHE '__field.*(blk_opf_t|enum req_op)' include/trace
>> include/trace/events/f2fs.h:1185:		__field(enum req_op, op)
>> include/trace/events/f2fs.h:1186:		__field(blk_opf_t, op_flags)
>> include/trace/events/f2fs.h:1241:		__field(enum req_op,	op)
>> include/trace/events/f2fs.h:1242:		__field(blk_opf_t,	op_flags)
>> include/trace/events/jbd2.h:364:		__field(    blk_opf_t,  write_flags		)
>> include/trace/events/nilfs2.h:207:		    __field_struct(enum req_op, mode)
> 
> Perhaps these should be converted to normal types and assigned with
> __force. There's no reason to have the value in the ring buffer be of a
> __bitwise type.

Yikes. Typecasts in general and __force casts in particular should be 
avoided whenever possible, isn't it?

Bart.
