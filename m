Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868EC5437F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871703; cv=none; b=L8/fTgAtW+452f82c029sFTDvJXLBV/3UT/n2z0p1B7nUvfLh/tooRjPlrdyvGLzPDPf8DtCpo+Jq/fCux7oS8L40mURbuEQoO4BeN4EFkfJvLYdriEgnII0FVaWBs0p7x8RwK2azPQUHVDcRN+FKOr5uYP5C1zI4BIFEo2WU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871703; c=relaxed/simple;
	bh=e/p7yFim3E2W2DBEUWbnuoPakNzfHI4j/ux17LzxMiU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEOV/mZhSNjHO0PqM/VXCuVAE7bw8AAllpP4HFzX97afS76nkS4kHRbLqxax2nn+9TcjBOmW+w4ldB6AMDVjxuLC88MllXgrpkUWbXMQD48FsAkE5rqDijJnEzgL+KCzUTXTb3XLUwexVQCx5LV8+qPbdx7+8JHu1eSA51mtNag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=T83ko5as; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="T83ko5as"
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 8706C1C277E;
	Tue,  8 Sep 2026 12:40:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 6AC9F20013;
	Tue,  8 Sep 2026 12:40:48 +0000 (UTC)
Date: Tue, 8 Sep 2026 08:42:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ye Liu <ye.liu@linux.dev>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Marco Elver <elver@google.com>, Ye Liu
 <liuye@kylinos.cn>, Yi Tao <escape@linux.alibaba.com>, Tejun Heo
 <tj@kernel.org>, Bart Van Assche <bvanassche@acm.org>, Christian Brauner
 <brauner@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
Message-ID: <20260908084202.1d5906f2@gandalf.local.home>
In-Reply-To: <8733vo6tui.ffs@fw13>
References: <20260904083001.553587-1-ye.liu@linux.dev>
	<20260904083001.553587-2-ye.liu@linux.dev>
	<20260904122536.1079b279@gandalf.local.home>
	<87ecf87m31.ffs@fw13>
	<20260904190742.7231d56e@gandalf.local.home>
	<8733vo6tui.ffs@fw13>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: h9mnx6aj6h73dkm9heo6r58751nsporz
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 6AC9F20013
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/aXSiHVj7CT5LLlA01+WLwOW4x/xdtJco=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=xumgzJa1QBV6wVuT57j3onGSdw1z80jMcweK6h/cDis=; b=T83ko5asmFoY28PFiYeKy+8WlzbziHgGcpX+6tjqaxt+JN4l6IcfsPg9wqILsx3I5jRfJBeWtD5y/mtv/Fv5VX6V3791Hod+TlqVWXM9C+y2WctigQj/RnRMNPD+/qNmqasSdhmTtzNfwEHTDrkAQNFrTtzpqmPlqZgbiJlAC60=
X-HE-Tag: 1788871248-940414
X-HE-Meta: U2FsdGVkX1/8gPlU2uNqdko1PIrwy1ZgDd9uvzN/LDJzT6dm4Cu5vnC+o42tx/scej6yVcDIgDitKJKvN5VQABRldrVf72g38jMgEtBB4nzzzmFGmc/KaH+IRsSkW8biGdJdBfMsgS6Y7nDhkkGqC0EQsBZg0/FiC8/Ux5GPkEBvJ1vZCEknpbrZIlCG1jFBoFXTD6sx5zNRWfncg7GAhjPxFkrUIUxuBwif8X9IaL/VU4gRR8uZs7CmTZHF2Yp+QctsmoaZuosL7oU9ie9iufhLVPAngKC+JKTAcZyk/4Kz4hp2pdmNO48el+AcksIvfyLFShESiimbdwH9IyT2EZ/uaO8Na/Nq

On Sat, 05 Sep 2026 09:27:33 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> Jump where ever you want. The keyword is 'scope'.
> 
> The normal visibility rules of variables in C scopes apply. So if the
> scope for which a variable is defined is left and the variable is
> defined with __attribute__((__cleanup__(cleanup_func))) then the compiler
> inserts a call to 'cleanup_func()'.

I guess I was just confused by the comment in cleanup.h:

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/cleanup.h#n147

    * Lastly, given that the benefit of cleanup helpers is removal of
    * "goto", and that the "goto" statement can jump between scopes, the
    * expectation is that usage of "goto" and cleanup helpers is never
    * mixed in the same function. I.e. for a given routine, convert all
    * resources that need a "goto" cleanup to scope-based cleanup, or
    * convert none of them.

Hence, I was thinking that scoped guards had some issues with gotos.
Specifically the "goto statement can jump between scopes" I thought it was
more than just a guideline and that it could actually cause issues with the
compiled code.

-- Steve
