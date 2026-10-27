Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136179;
	b=M+DAa1UoF5tSyGXA/W6G0LBg0BCqCaMQcPI5PTPsRhm13YJDnJAiSTWVklm6jbtYCCjZ
	 vCgY/T0iem/jsYKvFOra6CUen4CQQTT7buw5HWJm+4VrBi5AAXNlFSVxsZjq1HkiAxN21
	 q121FqMo/ibkAph7bZFxcWAnFtX7cOubFKbCOeZKsrPdc7/oBmKEfJzHFJ6f6yTPxKpaP
	 2q4ybYr9XCNsPOy0xBL5FBmpAbfjinYSh5/UKd7pJf1ptIXhCG03K/rpm9RSXBG2PiwUc
	 evlmVVMWLR39Euwpr3nquECq/uFQICZtfGtAeTwy5FkVxIq03ICa3+yTD8m/XHEDV1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136179;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GDQ4XtcAXtwEftoVvY+kotQDgGObtEW/97EhJqjIjfE=;
	b=eSz31/qd5iP4/GfiQfA1g+KrVbligHKYsWncWnRi04l5E1aIPgKvIPPBBlWDWwzRtO86
	 WlImlFYPWfbKmDIkso3itUxIObxQiIxzobDooaHSFmGdN1oQRcRlWsTmRgRmRICvVhQs1
	 3VPmXEdyTagyOC1S5gKYg/uhReXjJ5dxvVIJsMI6UCAPiw7xBFHHwGANdWj9g7PpVoRWu
	 PxcsxwBrQ1QrmcHX7hXY+zEyWum3xBSfYhd/ngf3InU9d12ZrZ7ZoSEDg+tAjlQDa0cc7
	 IT174vH6ygRUoDMvLqxT/Va3fM4GhbP9vSA7BB09fjvn8ZO+/HJmooz+40LJojTlB5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nrNRmm8y;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0924606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0924606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nrNRmm8y
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5B2B175D;
	Tue, 27 Oct 2026 14:22:52 -0700 (PDT)
Received: from [10.57.65.115] (unknown [10.57.65.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 150373F7B4;
	Tue, 27 Oct 2026 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793136175; bh=+QxeAh1ii/YcVILx+TZ/60PTiONKMR0AG9CVEDzhAGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nrNRmm8yvRglA3+grpMLl4OXvfIULlpaIIoKXIIMPH2xfDbw7FYI1e9KrKzLiZjQs
	 yfB6uxdmJUV45n74xVgNM/ov/uRu0hQBjJesUAMmdJeX7x1R6JoLt8lvt4lMN25uJt
	 YJ+JYdGAuG1qZ1G3ZNdms46mzczcjlmU3CQxQpv0=
Message-ID: <40e5ef61-3b63-42b6-a109-e45998bafcc5@arm.com>
Date: Tue, 27 Oct 2026 21:22:51 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
To: Qing Wang <wangqing7171@gmail.com>, peterz@infradead.org
Cc: bsegall@google.com, chenl311@chinatelecom.cn, dietmar.eggemann@arm.com,
 juri.lelli@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 mgorman@suse.de, mingo@redhat.com, rostedt@goodmis.org,
 vincent.guittot@linaro.org, vschneid@redhat.com
References: <20260602054619.637201-1-wangqing7171@gmail.com>
 <20261027093142.2337191-1-wangqing7171@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261027093142.2337191-1-wangqing7171@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/27/26 09:31, Qing Wang wrote:
> Hi Peter,
> Gentle ping on this. I know you're busy, but I'd really appreciate your thoughts.
> 
>> I took the most sensitive workload I have for newidle balance (tbench)
>> and took it for a spin with these changes. Following are the results:
>>
>>     Clients:        tip                  bresenham_accm
>>         1      321.65 (0.00 pct)       313.97 (-2.38 pct)
>>         2      641.92 (0.00 pct)       638.74 (-0.49 pct)
>>         4     1245.65 (0.00 pct)      1237.26 (-0.67 pct)
>>         8     2435.80 (0.00 pct)      2442.23 ( 0.26 pct)
>>        16     4717.66 (0.00 pct)      4688.19 (-0.62 pct)
>>        32     9303.53 (0.00 pct)      9390.71 ( 0.93 pct)
>>        64    18002.57 (0.00 pct)     17911.56 (-0.50 pct)
>>       128    27729.26 (0.00 pct)     27621.95 (-0.38 pct)
>>       256    47134.77 (0.00 pct)     46137.36 (-2.11 pct)
>>       512    43179.41 (0.00 pct)     43277.53 ( 0.22 pct)
>>      1024    40339.30 (0.00 pct)     40176.49 (-0.40 pct)
>>
>> The %diff is in noise range which is a good indication that there
>> shouldn't be any surprises. I'll queue a run overnight to see if
>> there are other benchmarks that like / dislike these changes.
> 
> This benchmarks looks good from Prateek.
> Link: https://lore.kernel.org/all/da1896b3-6bec-4b56-bf6d-9ce775b00b8d@amd.com/
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>

Might make sense to resubmit the patch as standalone.
Also minor suggestions inline:

+				 * Base on accumulator of Bresenham's line algorithm
+				 *
+				 * Accumulate ratio each time and trigger balance
+				 * when sum ≥ 1024.
>= Is more common I guess
+				 *
+				 * Ensures exactly ratio balances per 1024 calls
Ensures the same ratio balances per 1024 invocations
+				 * and distributes ratio balance operations uniformly
+				 * across every 1024 invocations.
across them.
 				 */
