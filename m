Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5671649DBA1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290530; cv=none; b=emd7MpdicyxGecmM3Ev0Ra/Fn/0gIT+Sk8Jp0Ut2nRP3c6sAv88+G7ySSoH75OLRbbRFNsinVGa9CuWPS8a4ZH5XFlbLxzDjVJLZwtuvLpP06Iz4VeK9bXj9CaoFvpCvkXTY3Bivky5twyYty1eJLk/XxlleDUsSC9g+Xz6a3Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290530; c=relaxed/simple;
	bh=Q3NG0i/qVd+rrXUfUirwwmCBDaQtECfP0kdnZy7pVJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGCXjfYrGPPUXnpwKnMkW1czMfzfdx0rf6jT9z8VL2QX+MmoJHyzzyGmiIhgGyCQFgDBhXyPJU+zV81EnuVHD6QVf5eYJEtf54Qc9N7Swbf51GSZFygImLa7kJuFnM9IcN4ayjZ3czlJWbZrj/JkboG6GceMK+yFOm9v79XJfK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=nkZexqSK; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="nkZexqSK"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hZG2S5bjBzlfq9P;
	Tue,  1 Sep 2026 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788290524; x=1790882525; bh=iO38GMloQ9eIQQDWpQqckYP2
	4JZqZjrZE3YPOamV5kQ=; b=nkZexqSKylxYiFMZnZC3ugfNQqJXglcXdY2y52kx
	K/IBXVX6qdo7LD57dI99sqOjEL3WwVyxKIftK5yIGjQyBCQXlUeoBw+njPbq18eT
	9JijHQYjBCKcaJotDMLvhdgwAGJMHbXKHiXfLkf/all2hUjDATa5HutNQVQt084D
	iWErGH8/QfU9DBkddJQLOKHZFbOxrZAzFBRvYmddDvR9kHzAqtz+728m3eKJURiP
	OUO2KqEcpdWW//3yQAcJrjIH1nrS2+33f0uRO+JF29IrHwiwHA9xUXw2Gn5+Dbtz
	9Mw2t6VmYooNirT9qNHjl0aN3dYxxI2jyyZfgAxoQYLd1A==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0veFDdGPqGID; Tue,  1 Sep 2026 19:22:04 +0000 (UTC)
Received: from [100.80.227.50] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hZG2L4fcczlfvq7;
	Tue,  1 Sep 2026 19:22:02 +0000 (UTC)
Message-ID: <737a4f62-f50a-40bd-a94a-1f42e9f3f54a@acm.org>
Date: Tue, 1 Sep 2026 12:22:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
 <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 11:45 AM, Linus Torvalds wrote:
> I think we should fix this in sparse, not in the kernel.
> 
> There is no reason for "is this a signed type" to be that complicated,
> and add that kind of nasty code in a header that is this fundamental
> to the kernel and gets included in every single file that gets
> compiled.
> 
> Basic rule: sparse should never make the kernel worse.

Hi Linus,

Four years ago the following sparse change was proposed:

  static int restricted_value(struct expression *v, struct symbol *type)
  {
-       if (v->type == EXPR_CAST)
+       if (v->type == EXPR_CAST || v->type == EXPR_FORCE_CAST)
                 v = v->cast_expression;

Source: 
https://lore.kernel.org/all/CAHk-=wjQGnVfb4jehFR0XyZikdQvCZouE96xR_nnf5kqaM5qqQ@mail.gmail.com/

Is that change still considered the best fix for sparse? If so, who can
apply that change to the sparse code base?

Thanks,

Bart.
