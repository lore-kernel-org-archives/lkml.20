Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C10F377EDC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500758; cv=none; b=O8Mtbm4nstpK+ZDag6RAJnh46Ys2DmrQC/COykQ3kv2kv6D5gh8f5CHnXtwZ9qLfC/nL7t5QDeifzzqWY+PHahSt+rbczSZ9J9H7IJKOBqGCyLiKnXupDZovmfpn6/LDFgfoCwgFhWu8sADRTmi1HbVjpa+o8dBwVUFB6920rtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500758; c=relaxed/simple;
	bh=QTu9PnvDsQzQLUNvKhaCPETfiCq9YRqyZZqjyNCocuw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BIn9z8iLrRXYMVl0mbTAHAi+wyg1ZiQ2IEL0I/f727vw1jmBuxvhBqezuLKBRQ5tquOSup/dH+qwZwQ/felpj+cm0HqeVxvBHePAc89VRadmB01uJzMNIzmK17al1tVqqmdqF29QBKtUBLq4yHm3P4UFr+s0rzICnSkSgZLcYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MPTqyvGc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0YRlq9oX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MPTqyvGc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0YRlq9oX"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788500754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSy1/YOqSRv5Xucjo4fenIDYrvZFmoA3GFjyNG26I+8=;
	b=MPTqyvGcMbakOrSfpWPCZYo0Dsz2Rp3snKVS+kBaatyF1vIh3MCQMAoFH4cOwhDNz+o2KY
	QuvZ7TajmFZutQbz3SZ/9kQM4auyPaLil7QLwqbs5NdjyCYQ3atSXN61XZ7wr8WPIEqLlV
	rauV5QIhTUBwsrWpb+o7DHSayTH6MzQcYAxZDL0cjoVIbE0oQntchw21f3F3u5hcQAARMn
	Ll3+HxYRh51Fck0PfzeHS4fGVG5QY70X9o0Ix8QpT0Uy2D2hi/RcN1JTCIFi+STy3jyGPH
	iUap3kDF+FEip8kQLjvN2umXxGHFzCsT+253tOYqo+P75DrPBuSycs18TJpwJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788500754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSy1/YOqSRv5Xucjo4fenIDYrvZFmoA3GFjyNG26I+8=;
	b=0YRlq9oX2AuiLL3LPSMeH4FfcXwdYN8YepcyH3+2s8VM1DsoeNHUPX0HgTFrRrvV4xk0S+
	gK3csU0FXeqX4vCA==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Yao Kai
 <yaokai34@huawei.com>
Subject: Re: [PATCH v3 1/2] futex: Add missing rt_mutex_.*_schedule() around
 rt_mutex_wait_proxy_lock()
In-Reply-To: <874ig5a7wd.ffs@fw13>
References: <20260824125544.2353006-1-bigeasy@linutronix.de>
 <20260824125544.2353006-2-bigeasy@linutronix.de>
 <20260824132334.GI687043@noisy.programming.kicks-ass.net>
 <874igghi3w.ffs@fw13> <20260827083738.-6QSwUwb@linutronix.de>
 <874ig5a7wd.ffs@fw13>
Date: Fri, 04 Sep 2026 07:45:54 +0200
Message-ID: <871pb9a7sd.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 07:43, Thomas Gleixner wrote:

> On Thu, Aug 27 2026 at 10:37, Sebastian Andrzej Siewior wrote:
>> On 2026-08-26 20:06:11 [+0200], Thomas Gleixner wrote:
>> So this code simply failed to do that, which triggers the
>>> lockdep_assert() in rt_mutex_schedule().
>>> 
>>> And it's obvious from the surrounding comments how this task got there, no?
>>
>> I would suggest to strip it all from the futex part, not do the flush
>> and just please the assert so it keeps quiet. I did some explaining in
>> the v2 and then Yao suggested
>> 	https://lore.kernel.org/all/5df8a43e-11bb-4881-877d-40034c414984@huawei.com/
>>
>> which is what I had in mind.
>
> and I'm waiting for a proper patch with changelog for that.

Nevermind. Found it :)
