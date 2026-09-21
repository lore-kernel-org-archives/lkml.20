Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF33043C8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012797; cv=none; b=n4yoRvLXAMhz8xfZ8HUKCqR9ccUY83iCLLGDgKe8G4NOgw04X5SREA3Ssg8tMj/yqDV6CSO7Q0gPsBsR62kuNmSfcH92B9KlgKvzxBBz5yx4j0YNyZ7Zptm/yypSFshbrXFVHgMddj/Al3/VroE+GHTRG8sVUekLo6Siv135p7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012797; c=relaxed/simple;
	bh=64lfCXfUKLeF20RwvIRRfQ2FAbTLlQvRGhRFhAU69ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYovk/6rJeA2/xvvFm/zuFBBdEsd1i83/nFDe1at+Dg5kxDG12u21CaMJWyg/++/z7jgNPt9K5t73d6d6uCEDCi6nYAIH1nEu26tFWxIzxFsqO5mldudEDkIRBESjBs71FJo9IvgBcYyrBkvr/jOV7P+gm29TKI52SNiun+0CJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vaRHiA51; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vaRHiA51"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=64lfCXfUKLeF20RwvIRRfQ2FAbTLlQvRGhRFhAU69ow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790012792; v=1; x=1790617592;
 b=vaRHiA51TGkklW70st5Ia60n6y2eJkYBNP5VD14i8gSjX7MT+u1QVRj1z25LuqIoFciKJV4Y
 dxmB9txMPWmCC4AzCZbibYk2JAokpS0bHZ9zbxTaZZ1ABRbJLwwGLO8KEEjblvvmCRBcaS6A5jh
 LuAM/+BNAa7X4tlVsiauv8gU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2c77fd262556d35a;
	Mon, 21 Sep 2026 17:46:32 +0000
X-Mizu-Trace-ID: 2c77fd262556d35a
X-Migadu-Flow: FLOW_OUT
Message-ID: <0dde6d25-540a-4acc-9375-0df16f1b835a@linux.dev>
Date: Mon, 21 Sep 2026 18:46:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched_ext: Specialize the DSQ hashtable compare
To: Tejun Heo <tj@kernel.org>
Cc: arighi@nvidia.com, bpf@vger.kernel.org, bsegall@google.com,
 changwoo@igalia.com, dietmar.eggemann@arm.com, etsal@meta.com,
 juri.lelli@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 mgorman@suse.de, mingo@redhat.com, peterz@infradead.org,
 rostedt@goodmis.org, sched-ext@lists.linux.dev, vincent.guittot@linaro.org,
 void@manifault.com, vschneid@redhat.com, yphbchou0911@gmail.com
References: <20260921171928.1639407-1-usama.arif@linux.dev>
 <a29f5b829952f6a8f15128a4115c5765@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <a29f5b829952f6a8f15128a4115c5765@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/09/2026 18:40, Tejun Heo wrote:
> Applied to sched_ext/for-7.4 with the dsq_cmpfn() signature joined onto one
> line.
> 
> scx_tid_hash and scx_sched_hash have the same u64 key and also fall back to
> rhashtable_compare(). scx_bpf_tid_to_task() sits on hot paths too. Do you
> want to do the same for them as a follow-up?

Yes, let me send those as follow-ups! Thanks!

> 
> Thanks.
> 
> --
> tejun

