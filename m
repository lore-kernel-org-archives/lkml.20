Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3E74AA598
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366721; cv=none; b=BkhNKmOJcbx9tgL6DJ1EL/ix2sJyz0pumIhbHp9C8OUMY2nMfq8UgTrchWLVdvtUYg21gZlMmi8B/9m1XF2EXRBj0OXgHvY3xAXEKAS1OndHnAa/0qCMtKH064IVrm34M7nrZVpBMebOQtRCQT0dWbbY5xwI6Zt17MzJL+XxqJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366721; c=relaxed/simple;
	bh=pm0hHpSLRiLOOilhtmRyk5FRVGDXUbxpzbAY6SMoY+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clHjiT1RdSgzeBorvK2q6tmyGfyyMNLdqc948vo4+YO4jFTfrI1UFF1r1Usdbt59y2jKO1myOc3fdBUjK4JjLk8cQmcrirI+iQh+z2JRdgyxB3o3ZyTPWPVxJ7vSf2kcRLlxj2Tx7BmxwFo2iCiWmJhQe74zP0N1FBwTkcS/ia0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=QW9hNUzb; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="QW9hNUzb"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4hZpCf3GWtz1XM0nt;
	Wed,  2 Sep 2026 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788366713; x=1790958714; bh=EWHrrhDldvl70GeKdEGikvuu
	p6F4viFm+NuKzwv0x3U=; b=QW9hNUzbHLil4rjGnxpIslcguYc+ZpfgWtKXh0B4
	09XouDGXQc+mbqxSEH39+MM4M9VQkcBW5/jJWq77KSnVOsO43t1k3y+csNxmzPN5
	XT6l7hD4TynInCrii35UqLz1ZUlK20+yvqQDUrqr+b3JSWvFWhzqWdO8+d/XJcvo
	6F9qR9sPY4WXUKi/CaYUa0lEtUx4H2H7DAgHsnCZF44eUHV2f3rvNfspL33DWTID
	Pew5Pg71UwRZ9icSAiKkPQZCmwf4seEna80aE2li/yeXfJGbTBZXY4CtjOtZUp60
	b6+Vzm+sOIKZu6YHEHsLnnr1/h8q3/jXheNSQI3kqRVxnw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id fp2SKTp4TTLF; Wed,  2 Sep 2026 16:31:53 +0000 (UTC)
Received: from [IPV6:2607:fb91:7cb:47d2:e7e2:7eb7:db31:4f7b] (unknown [172.59.225.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4hZpCS2c7dz1XM30w;
	Wed,  2 Sep 2026 16:31:47 +0000 (UTC)
Message-ID: <a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
Date: Wed, 2 Sep 2026 09:31:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Steven Rostedt <rostedt@goodmis.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260902093644.5b0e8a64@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 6:36 AM, Steven Rostedt wrote:
> On Wed, 2 Sep 2026 09:24:37 +0100
> David Laight <david.laight.linux@gmail.com> wrote:
> 
>>> Yeah, it was originally used for the tracing format files so that
>>> tooling can know how to display the raw values it parses. Also it is
>>> used for the filtering logic to know how to compare to the raw values.
>>
>> And, in this case, the value is __bitwise so the 'tooling' doesn't know
>> how to display/compare them and you get a compile error.
>> Doesn't seem wrong :-)
> 
> Where is __bitwise used for a trace event field? Or is this an issue for
> one of the other users of is_signed_type()?

An example is any code that traces blk_opf_t or enum req_op values 
(there are probably more examples):

$  git grep -nHE '__field.*(blk_opf_t|enum req_op)' include/trace
include/trace/events/f2fs.h:1185:		__field(enum req_op, op)
include/trace/events/f2fs.h:1186:		__field(blk_opf_t, op_flags)
include/trace/events/f2fs.h:1241:		__field(enum req_op,	op)
include/trace/events/f2fs.h:1242:		__field(blk_opf_t,	op_flags)
include/trace/events/jbd2.h:364:		__field(    blk_opf_t,  write_flags		)
include/trace/events/nilfs2.h:207:		    __field_struct(enum req_op, mode)

Thanks,

Bart.
