Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792786432;
	b=MOwdRvLAeOdZVFL7ZPD3AFeBy0tiFWlfC4amNRbkYswGnhXW472OfVNFj8lnU7UjPdZp
	 LNMlD9DFeRW9BYltBxXTH6JK2iWHHt0SI4Py+Ibllrk/PCZbNEPDlw/qhuodMKKWcOcjD
	 8SNlUIjOI4K5rtvT0X9tnXSYIBCEF03wZACS0MMytKf9Y8MUDWCOqTWpK/jmQbBG1maeL
	 QF6tfD+yMQv8FGOKj3rsCz5oPJ36IVR0zQIFJOMnvLZOwJhXdgp3x6pZbKOp9HyHrcLol
	 PN3qF/SoartqrS3Z3zjzNPrhf3mO7phvHrkEkwONmMOy+M0Cg2/uncVKxU60+bCCuOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786432;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=O8zJuP0Ot29cykJumEd36/jpkmF637YijXUmNxlxlHs=;
	b=vYAEBSpqLpFaTiQ6Cb/rJmmnItdvSq+ig98djL31kAz4UY5kLep2BGl8/bPrsWjPXGZR
	 JGyNApO8GsdRGYs1KfagLgTXi2nUu8SCIFjdcZyIBGMICwecwRKSTzw3s1Q1Lk2Kn7AFC
	 g9OWrCEK5rVqDPX8IgtrWt/ljl2eU1WHp74lPuUy8uoKfmtZ7s5S3tyHWvbp3+JG73h/z
	 qrTrby8rVmqRGeFb9aRLV4xx5wV5KCF8Fw30wvh+zT2P0wpiqDgfK0cdphLlfivPc2ZBk
	 yDXfTLcmxJLnAGPXs0FlEez8JedH+0G1YhlrcCb3ZbER+lupxfTwElslMTFeX1XxRFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k+14i5YI;
	arc=none smtp.remote-ip=91.218.175.37
Received: from mta0.migadu.com (out-37.mta0.migadu.com [91.218.175.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31EC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k+14i5YI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=a03eyxrKrab9+L0DXSFejSIOg808W4EwyuwEhzn7A8s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792786428; v=1; x=1793391228;
 b=k+14i5YIoMGofBAbinKbqriTBzZ7I/nNyTRHolKAOY2lqcgeqobVo3VIULim4XRAG++QMoAC
 JikSP4S3Ch+xzqD11WJwd04hHYZXJa+zfyMgbg5kb1k0sqEB0Gpu6LkSOEDEtmIMt0IazLO3CH2
 aoghGWuy63mQG7wnK1PCB0n0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 830156828f935bad;
	Fri, 23 Oct 2026 20:13:48 +0000
X-Mizu-Trace-ID: 830156828f935bad
X-Migadu-Flow: FLOW_OUT
Message-ID: <75b66acc-354e-4cd2-b9cb-4c22e8a02635@linux.dev>
Date: Fri, 23 Oct 2026 13:13:41 -0700
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
Subject: Re: [PATCH v4 1/2] tracing: fgraph: allocate shadow stacks inline
 with GFP_NOWAIT
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: mhiramat@kernel.org, mark.rutland@arm.com,
 mathieu.desnoyers@efficios.com, andrii@kernel.org, peterz@infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20261021174406.2891598-1-vineet.gupta@linux.dev>
 <20261021174406.2891598-2-vineet.gupta@linux.dev>
 <CAEf4BzaTYgNwiBtvYoSw1wzuFZchs-2CCP93gh2OeDt-919-eQ@mail.gmail.com>
 <20261023143816.48163575@gandalf.local.home>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261023143816.48163575@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 11:38 AM, Steven Rostedt wrote:
> On Fri, 23 Oct 2026 11:13:44 -0700
> Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
>
>> Acked-by: Andrii Nakryiko <andrii@kernel.org>
>>
>> I presume this will go through Masami and Steven's tree, is that right?
> Yes, but it came in during the merge window, and since it's just a speed up
> and not fixing something that's broken, I was going to let this go in the
> next merge window. I rather have a change like this sit through a full -rc
> release.

It is a speed up but not for optimization sake but to cure rcu stalls in 
production at Meta. IMHO it should go in sooner than wait a full release 
cycle.

Thx,
-Vineet
