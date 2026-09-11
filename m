Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56CE46AA64
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131221; cv=none; b=bEI8YC968B+1KxH6bUsU79FXF1ikr/e2lnUHph5VZyA229mO0qXlmEuGa8FDbMvwhB8C3B5GnGVwGN5k9VAjWqnbd/xEvIadSWBVBaq69fatgiS9VgQ1ccWDoLZmP3aST5wnFX+81KEMDUTWKKVzGCWoy4K31bZ4m1YgFTjpyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131221; c=relaxed/simple;
	bh=LQDQEIoFZmlRCpU1YMB5K7Gsxb9bNcDx0kswnMn+mAg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D70BB6tKP9NVmVEgfQXF1vtnGSMpjN/4aUDieNN7vWMqyepC8GAP9vvMjx0qMQ5KqBJJMLtycBNiobl8zvSGaMLE9T68P97A80ty4dJ4H0kinf2k/52l25nB+f2RJxMzINacPKFR3gxv0FqUTF6FAtaG8CvYERUrD2kFJ1iCHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=MknBjAJH; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="MknBjAJH"
Received: from omf02.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 960B6A3F1D;
	Fri, 11 Sep 2026 12:53:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 7F7E080012;
	Fri, 11 Sep 2026 12:53:35 +0000 (UTC)
Date: Fri, 11 Sep 2026 08:54:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ye Liu <ye.liu@linux.dev>, Marco
 Elver <elver@google.com>, Ye Liu <liuye@kylinos.cn>, Yi Tao
 <escape@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, Bart Van Assche
 <bvanassche@acm.org>, Christian Brauner <brauner@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
Message-ID: <20260911085456.171fd087@gandalf.local.home>
In-Reply-To: <20260908083817.GN4121339@noisy.programming.kicks-ass.net>
References: <20260904083001.553587-1-ye.liu@linux.dev>
	<20260904083001.553587-2-ye.liu@linux.dev>
	<20260904122536.1079b279@gandalf.local.home>
	<87ecf87m31.ffs@fw13>
	<20260904190742.7231d56e@gandalf.local.home>
	<8733vo6tui.ffs@fw13>
	<20260908083817.GN4121339@noisy.programming.kicks-ass.net>
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
X-Rspamd-Queue-Id: 7F7E080012
X-Stat-Signature: 3859ogksmf4fq8hwawu7zqmzsiq7rt8w
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/4ksH9M3bZtq0W+Vd4ssS4Z8sMXP+axHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=BXDSHzvHIarnDrJfNz+a4YketRAl97JheKI3aydiZq4=; b=MknBjAJHGb+QeSFG9x51+ycTA3k65v5+w4IawJbl4JL8zHMewSks/r63qN9pnUoGsTis7lc4JfrhPZNIcCYZHlKdDwqgK+F1I3+Q/iHbA9KFG23/CjMbNPBxiUS4Pp8C0lIAeMUMNhY/5YzrfCHfqGlnSthfSy12GO+DHR/ofuM=
X-HE-Tag: 1789131215-897823
X-HE-Meta: U2FsdGVkX1940n+ZAEAGYnqF6UWgBsE4/NdTFWgrbWsyF4bosJvToPHwtK1V8UbsYlUhnrfTW0m8FCaUK/Xqe59uCWnERSqo5lng+kALJd22kG59jMME3bN4AIbCRLeYy56kSeeZECUfgUYcTOTW0mdCqhDuUlNh8xnoQ+YM/TLBkMjMIIfkeF2mctHhNDlO+sQTHg2k7vmSTnsiv3Fcd8j0KjBTEw80v+SW5HTasCdr7yiU42rMzdscBGxFCaJl/P9H5vz+Hy92LvVLedsW/LrsD7uGJz67UGsojijjPFyRQASHea9yK4r0RI1W+S/9vv3mb3nbfmi3FUR5pQ8s/+AYDIbed7atZIQhK3ksheGKpiqylk3ASBIv3kLsZhNCTqRlahpMb5+B4fUAXkOr/Q==

On Tue, 8 Sep 2026 10:38:17 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> Right, so GCC will accept and miscompile jumps into a scope. Clang will
> warn/error about this, so this should never happen.
> 
> Aside from the ASM GOTO issue, there is also an issue with computed
> goto, those don't work either.

So should we have Sashiko stop complaining about it?

   [Severity: Low]
   Does this mix scope-based cleanup with manual goto-based error handling?

   By replacing the manual RCU lock with for_each_process_thread_rculock()
   (which uses scoped_guard(rcu)), the function now relies on scope-based
   cleanup for the RCU lock, but still jumps to a manual "goto free" label
   for the memory cleanup below.

   The cleanup guidelines state that for a given routine, we should convert all
   resources that need a "goto" cleanup to scope-based cleanup, or convert none
   of them, avoiding mixed usage in the same function.

https://lore.kernel.org/linux-trace-kernel/20260911081013.E1ACF1F000FF@smtp.kernel.org/

-- Steve
