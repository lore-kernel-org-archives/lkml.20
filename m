Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85D4A8A2E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367119; cv=none; b=DKnLEqsBtD5Py89MFIBvYN+JEF2xb2MjjmpoJadEmnE9g1eh0LR7o7ax80mbL44fn0axBFfGYIitiNTgc8xidYcfyPrWnQeS/yAca/rM9+rGoGeYUwj7Z8AcOJoStGJ/9x00XNxa/GBRFhts1b7pTZnYjSKBeli/JxG8W3IAECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367119; c=relaxed/simple;
	bh=NxMI9v2phrbbGIzeB2c7OK0vbCEuQJyy1JafZuyyikk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCxUEKitlx9XuRQgyHoVAdO9HpisoL18iU+qE7XDIFwKQ1R72dVg7yZny3IGlJkTHB5kEDAwP5ezmb3ZDkps6PGLCmREJtiq4CjnOIaf/O3lH0V6txvM5wlPwibM608VIYMpjcAR/CWnsU99KlhZiM9Hzivo0Wp/JFun7IwWt5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=g5wRj9H4; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="g5wRj9H4"
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 0F494A02C5;
	Wed,  2 Sep 2026 16:38:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 1DC1C2002C;
	Wed,  2 Sep 2026 16:38:33 +0000 (UTC)
Date: Wed, 2 Sep 2026 12:39:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: David Laight <david.laight.linux@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902123933.5c3c8fa3@gandalf.local.home>
In-Reply-To: <a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
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
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 1DC1C2002C
X-Stat-Signature: 8dpc91ncf4wbe6kyk7on4hzjqndfjxwg
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18x2h1qq2MkZwq+1xHnNc5UprXG2huTXoc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=CjQA8hL4yVjfKdVM7MyuSYsHlfPfe93peDrKhivLbNs=; b=g5wRj9H4hOpGfIWybPjl/re5dkvr50FjxHWTZ36fHywK/L7YegwYfwEkE1IcczO5d5ATcuNOiLaLcvbA2K8WufeBostCOV/1juvmGBr3ujNJlHcFzJUtGb+DPxuXYX4Ok4bAX5Iu+Jk+cSM27ATrrw5kajQOGZ6ayAdlTwoXTFc=
X-HE-Tag: 1788367113-930345
X-HE-Meta: U2FsdGVkX1/6+tgG4ghHYOUQmkV9okyzhRLHYdCdpHc5L284QU+dzzrQr/5ft1E/0HqC1vb5u+QHva6GCC+Xi7mtcmep7EItPgMyHnDoR30r8vwtvG3UK2AAwieBSIy/IEPU+YlNFt1XZijMFeSLugC6xPDd9mxwL8UqV97RbXZUXEAbbV7K2ARnjZiA9D5jv5h+orZ+23pcsnujyI6EBbAkzBH5VcCqAPI8q4+l+nYlH7xncFQr2JBt6+pdYk8/sdNHSgZj9nKltJiwwBHzRiR3V/uks+LK9BXbySOdEX8TuMHTNaCeSq/8Q0BZdvHPxdVj6aQZyMqfvqLQOGqIr9ndYAlaQqOf

On Wed, 2 Sep 2026 09:31:41 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> $  git grep -nHE '__field.*(blk_opf_t|enum req_op)' include/trace
> include/trace/events/f2fs.h:1185:		__field(enum req_op, op)
> include/trace/events/f2fs.h:1186:		__field(blk_opf_t, op_flags)
> include/trace/events/f2fs.h:1241:		__field(enum req_op,	op)
> include/trace/events/f2fs.h:1242:		__field(blk_opf_t,	op_flags)
> include/trace/events/jbd2.h:364:		__field(    blk_opf_t,  write_flags		)
> include/trace/events/nilfs2.h:207:		    __field_struct(enum req_op, mode)

Perhaps these should be converted to normal types and assigned with
__force. There's no reason to have the value in the ring buffer be of a
__bitwise type.

-- Steve
