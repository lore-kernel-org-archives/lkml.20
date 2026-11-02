Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626488;
	b=L6hToXPKDJDpfKqQ0f3UKZAC5riWmQGICvfp4UpSsl6F8R7fWMMuzpM7yyj8jdPY2a+Z
	 VkDs6T23XSysUau4DYrQjUbOQ998bvhf4Wvo35JcnoSymH3L43xA7MIQMAZsW13arEek2
	 nFAsfJWhAiTkhqDqLq2X3N9iMqebB1WIuIuJTL91L5BeutrNTK3bh6lLuWvuE5uZNIut6
	 ueNYBRDlgqOxOAS7bzkfMhqGZvDcu9eYkc1nDvJj+u/YgMGtPjJj08JXMAdLvcSwxIR8U
	 /vmnt+E7BPH9X8pH15Zc5TnZICicQ0NgzvBueGnCeVLCDCyD/+9Rhzs1Pq/b2eqjN0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626488;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HXcEyfKU0u37teCYlq1WLOT4N2yI4xxa66b5B/UVhDE=;
	b=TYT6s/+aoMBKS4n1IMcKR7CqKoB8EPeVVQVnT/8L5btW7fn80TnNO+TouEnGbVnYI+hS
	 VKe7ro0ji5d1mO+F5j6jQpk99/bQZ9SHnRFwovgbeEzlpwdKVZ3fEZFYKdxtEMTJPJBuj
	 PKTwQTqYKAsAHLxGmybukojuoA6eOH+C69nFZw+XC+Es5SCVnM/aUpbdOUlBGsrMyftm7
	 vTPHYBYlc+0c9jxYClgqrABC9gZUSsk090l31y0Hukg9Ck12GHyZe4GMSrRjh4xQQcl5t
	 t7A7kFoFX9rvN4cOazalhE4z74nJnnzoC6jrRtaw/cdH9En4XIsVfbpxeTwaaIoAjTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=24OuaCTk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7pzs5Qu0;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B6606A32D;
	Mon,  2 Nov 2026 13:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27B6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=24OuaCTk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7pzs5Qu0
Date: Mon, 2 Nov 2026 14:34:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793626485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXcEyfKU0u37teCYlq1WLOT4N2yI4xxa66b5B/UVhDE=;
	b=24OuaCTkItnb6LVCGCpmWvlYuD30oade8FUQ0FFo3+h45mio1XQWJfgutfo6/n6JXefHSY
	isfrmlHN1d3nhmuhN/Rfvs1KOSAByP9KFQbHXlym9/ITSkpvRGpMlBo3aBUXw/SJ+C35oe
	jHMDsY1zBZUCxuKeQcb6rrEY7UtzK1wrqY6hEPz7wyGWIr1OdN460iVSXzzvmu/XCAN7yh
	51CuzDeRqeNoFBrgHMqPtza1xewlI3gZmtWFgVkRT8iv4hX5C9bYcbkr4pgrUC72BqQWXa
	twECkKwKi7aaCFX1fkoGCXWynSl2lMAleuVJ/18mGi8U9MpkFMB4sgXnXIs7bQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793626485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXcEyfKU0u37teCYlq1WLOT4N2yI4xxa66b5B/UVhDE=;
	b=7pzs5Qu0JRcFgGMIBorvWuDw8dEJKhLeR8CKf2RrPfsBeUCgQDdPfXuSh/FlIdvoReD27F
	oug2xnNRSJ3gZ1Dg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	clrkwllms@kernel.org, rostedt@goodmis.org, rppt@kernel.org,
	arnd@arndb.de, bp@alien8.de, kmehltretter@gmail.com,
	dapeng1.mi@linux.intel.com, elver@google.com,
	enelsonmoore@gmail.com, jlayton@kernel.org,
	quchaosheng000406@163.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] docs: kernel-parameters: Drop unsupported preempt=
 modes
Message-ID: <20261102133444.7eq6VZkv@linutronix.de>
References: <20261028024333.795917-1-ruanjinjie@huawei.com>
 <20261028024333.795917-2-ruanjinjie@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028024333.795917-2-ruanjinjie@huawei.com>

On 2026-10-28 10:43:32 [+0800], Jinjie Ruan wrote:
> Since commit d3d16750693b ("sched: dynamic: Make PREEMPT_DYNAMIC depend
> on ARCH_HAS_PREEMPT_LAZY") only "full" and "lazy" are accepted with
> CONFIG_PREEMPT_DYNAMIC: every architecture that supports it selects
> ARCH_HAS_PREEMPT_LAZY, which excludes the none and voluntary models.
> Passing either is rejected with "Dynamic Preempt: unsupported mode".
> 
> Remove the two lines so the parameter reference matches the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
