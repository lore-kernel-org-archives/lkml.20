Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4723463B91
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373212; cv=none; b=iicGTGkSxbf05Yvq8z201cf+eyVz2uAnPl5O8gj8GXxJx2p351bGslX9dAuLLdySLpKWfHG+iouvT9evPA02xhUkIDOZ1VnDUuSxnmS7kZV0dEr4u8SZSFcYZ1tw/iNLo7p3ibsdzC+d2HdyIYsHlJHJAPphhD7T48NYrdEbW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373212; c=relaxed/simple;
	bh=8uqAF9sA0AD7caLiXfMLUBbYPvbD2TyTLielTqutO6g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IyjzxorYdJa0Vfb/vftmyq7jmYwlAAbmTGB4DHYoks6qYcDr4PLrTSudXZJOrQE/oeIf+8kuI7+7YvpigHQ+vKsWpqUMd7hEX+QqZ3vuVIKkUXu8n8q1tvBWwjn1BfpytlnNePuD2z7WEDvKt6DhLKiawDB55GrJB1Oi2tjSmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=yJphigbh; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="yJphigbh"
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id B36D080328;
	Wed,  2 Sep 2026 18:20:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id A3F7820026;
	Wed,  2 Sep 2026 18:20:06 +0000 (UTC)
Date: Wed, 2 Sep 2026 14:21:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902142107.511e71f3@gandalf.local.home>
In-Reply-To: <20260902190632.16e9c66d@pumpkin>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
	<20260901222909.05d6239f@pumpkin>
	<1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
	<CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
	<20260901192523.0e989b10@robin>
	<20260902092437.00dfaa25@pumpkin>
	<20260902093644.5b0e8a64@gandalf.local.home>
	<a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
	<20260902123933.5c3c8fa3@gandalf.local.home>
	<e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
	<20260902190632.16e9c66d@pumpkin>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A3F7820026
X-Stat-Signature: rnhhpiejy1tp9p3xewxfesbunotawxym
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+u5kvzOuWOYsyYIAw+T1XJqeL5iEnzXsQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=GE3DJr1Qcz8gSEgTlewFeEKHIxVZ0c7Vh+i2iwvX1gA=; b=yJphigbhcegGmDa9zovRRDEm1nBa5NWAGzZFwV2c9Yxu+/MpdClCOPDht3U6sW2QBZgY232QJl9BiIrvcpOR0k0nwFCEiVcWIIbnX7BJr1wGUCAVtL8dYG0/vUlUqdRQiR9zKSTjMz4xevKA5Zr8C0BMCtEcBJ16WZHLg2dT3Os=
X-HE-Tag: 1788373206-442325
X-HE-Meta: U2FsdGVkX1/CLRaGQZfYd0UWdRau1f4OF+ZmlaRBP9yVjF1+wJAMM0yJzRXOk1WjZKJRF2vFZvVBjER6eMItRvehY+EivcK/4P+Rgzp51fbL+Wqr/L07PLCdkOO3fOoSGtQPD2/miiTV68vqYlv+qOsQZ0h1R7OLD9fuPWXekGswVQz3KpFMF6BVvFsk1yzMZqeeHLanDy39deaer2cEtJ2Fw8prV0qzqrSXQDsOGI4kuttlqE71t87AizU4AnF6G3gF7eSYk03mVsR8tEBjxmuBlfwXZ1uO6lW1z1fKLhAWJzFcNSw/+SYxzBJQy7LOgEBP6kXXXsyYxL1kPkp02wmvVM1/piO0j2A+nBVrRaOXxDlyoY5aEA==

On Wed, 2 Sep 2026 19:06:32 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 2 Sep 2026 09:44:49 -0700
> Bart Van Assche <bvanassche@acm.org> wrote:
> 
> > On 9/2/26 9:39 AM, Steven Rostedt wrote:  
> > > On Wed, 2 Sep 2026 09:31:41 -0700
> > > Bart Van Assche <bvanassche@acm.org> wrote:
> > >     
> > >> $  git grep -nHE '__field.*(blk_opf_t|enum req_op)' include/trace
> > >> include/trace/events/f2fs.h:1185:		__field(enum req_op, op)
> > >> include/trace/events/f2fs.h:1186:		__field(blk_opf_t, op_flags)
> > >> include/trace/events/f2fs.h:1241:		__field(enum req_op,	op)
> > >> include/trace/events/f2fs.h:1242:		__field(blk_opf_t,	op_flags)
> > >> include/trace/events/jbd2.h:364:		__field(    blk_opf_t,  write_flags		)
> > >> include/trace/events/nilfs2.h:207:		    __field_struct(enum req_op, mode)    
> > > 
> > > Perhaps these should be converted to normal types and assigned with
> > > __force. There's no reason to have the value in the ring buffer be of a
> > > __bitwise type.    
> 
> There are already a shed load (or two) of __force casts in the defines
> (further up the same file) that handle some of those fields.
> They probably go away if the __field() used u32 and any casts added to
> the TP_fast_assign() expansion instead.
> 
> > Yikes. Typecasts in general and __force casts in particular should be 
> > avoided whenever possible, isn't it?  
> 
> Anything __bitwise is pretty much going to need an __force cast before the
> value can be actually used.
> But the syntax should have been __force(type, value) so that the compiler
> doesn't see a cast.

Linus has made it clear that this "fix" will not make any changes to the
kernel. Sparse simply needs to be updated to figure out that the existing
code is OK.

-- Steve
