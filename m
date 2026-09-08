Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C1479871;
	Tue,  8 Sep 2026 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891792; cv=none; b=mkgxl498lky6FDN983MsD4foU5CVwMcpzvUQJWnLTlqorbmJNy4BEFXw1tinF20xFBFDzCHIoGnW8uMQP6I3ed/oRfWqXbLIohjtThURB7CRELAevwMoQV2zaGPF4geNfVe9BDgMYtg/SwvvzCQLVRLoRUFdanTHWZb4AVeGBOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891792; c=relaxed/simple;
	bh=19s0eQwCwX0LakzFZQWd5eSrUTGQNFJzNe+JNOq/FwQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gISHpiqdU/3GGrviaWPWSckAtvwbsyvB5tBnF7RqZDnU2Vhxu93/teTVtGoYlHWdUcF8KhkP3eDWSFbhO2QQzVVGYxrxmuuyBiPg8f+lSsvXFGbeVYGqEZypnJ0x+ckcgd4/CfEucD4TQPEKOQahfYznvAgUN/zprt2xTe6k1Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZOXffP6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZOXffP6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDFE1F00A3A;
	Tue,  8 Sep 2026 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788891790;
	bh=8+9RzNI+9knvwbGLPMMh75AeE73OPwTJQtHbYROo9bg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZOXffP6GUBR+9e2DQvkaY8X+GHm6J1scopx6VYTBk23xdng4+so6/ufxiYvnpYt8G
	 XCwuXiMz7JmwlkCv3kb2C5kvRlgg7x4sTc3tsc3mtLT8DRzgffvxGvI/e6c5XUDaMF
	 AxGggPYDdbsMzWlXvCzSdT9YMlBfpzBcHTeR9mYo=
Date: Tue, 8 Sep 2026 11:23:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>,
 <thomas.weissschuh@linutronix.de>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 0/3 v4] delaytop: add delay max, timestamp and sorting
 for top latency =?ISO-8859-1?Q?analysis=A0?=
Message-Id: <20260908112309.6fac9c2067a36f92b45bc7e7@linux-foundation.org>
In-Reply-To: <20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn>
References: <20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Sep 2026 22:50:56 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> Previously delaytop only showed average delays. This patch adds:
> 
> 1. delay_max fields to track the maximum delay value for each delay type
>    (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
>    per task.
> 
> 2. The -t/--type option displays only the specified delay type with avg/max
>    values side by side, allowing focused analysis:
>      delaytop -t cpu    # Show only CPU delay with avg/max
>      delaytop -t wpcopy # Show Copy-on-Write delay with avg/max
> 
> 3. Wall-clock timestamp when each maximum delay occurred, displayed in the
>    MAX_TIMESTAMP column when using -t/--type option. This enables:
>    - Identifying the time when a process experienced an abnormal delay max
>    - Correlating delay max across multiple processes at the same timestamp
>    - Cross-referencing with logs, traces, or other metrics at that time
> 
> 4. When using -t/--type option, tasks are sorted by maximum delay value in
>    descending order (largest delay first), enabling quick identification of
>    top N processes with highest delay spikes.
> 

We're missing the most important information: why make these changes?

Please update this [0/N] to explain the value of these changes.  What
requirements are being satisfied?  How will operators benefit from
these additions?  How will you use them?  Use cases.  Things like that.

Also, AI review might have a found a few minor issues:
	https://sashiko.dev/#/patchset/20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn

Thanks.
