Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422464;
	b=sF0fIzqoEZQEpvfx9Ffb8EZW70DV9sbXZLOeIR4Dr6+wKcZq2cL5dlLuhOy6LJG0ZIKS
	 06kJl/1aXuVvgI0l3BBWbkSsi/vJPhsumDsPTWFYUMJE7sFV59RCfDK85/mnFk4xGSfl4
	 lJ33cONxBNHGZMEK+9ahF2mJCOCh/28X3TTnw8j+jjorOmw1bN8HPOwhNJHAGXEH/o/vH
	 dORf6HhA4xWyUfgNFyDS8wJETUackkaz/MuST8uyP897wy7lsp5MNQIoPPiHjSGcOz+OY
	 nI4ZcA3FhCHjG1nJQOcsP17gUoPzFDcBh/GzUKA9L3W/+DpTjQ980PDk9WTw2pzsNFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422464;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zrnaYDCrhYEyWwJ9/Yft1y7TMxYSmjb9cV05WqzJ+3U=;
	b=1HrdGFSUNJqJBk1irNLlGV0WrzxKJndhf+DRRLZPUywDbkXTipFk7yhkelZDcsyOmIsp
	 8vAn1qjT45zk6qEg2PlWn+LklHd1chYaIPAdDjQg4NHjUyl0EtEZZpruWhhhUBeQSkB7g
	 CXR/CLrIxhcdwxx2NKbPynTqt6WuwQifbYuGgphX+SJTLtuoAkJPbVkkbI+OPQO7Pjsyf
	 YxinS6Z5r9gAtbQxzwMiLu+DT0x5UKwsIjixXUsZkU2UmfuHEAlur2s+jLYNc49wyDJHQ
	 Yo8+VW9UcZUdEpyCQzfk662qT487aAholwAmMBqi5o7ks17wknd/+DnXIaj2eBnP/iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="U9RpZ/+1";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=vv68aGoS;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064FD6084854
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064FD6084854
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=U9RpZ/+1;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=vv68aGoS
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792422433; bh=zrnaYDCrhYEyWwJ9/Yft1y7
	TMxYSmjb9cV05WqzJ+3U=; b=U9RpZ/+1muJx3rs46h/NWsJoyNcFFm9PDNAMOJakc146Kay+PH
	brzWfh5Uy9d+DCCoOaPILWaMSv46jvkCbGhIw9I9ypKQeMHZaiIC8eMzYNdKs92i1kQIqShbD31
	mLZpKXv/nW7mhELOSHXdluOxCO3yPLDyAgobv1aY+L5YzGkOMP/ipNUM5WtK+DQaS3KN3ZyURFv
	a9kwc0O7VLjdH8XqauYyKPc7GWm1mDOb1e8B4N/IFPPvVeax01ISPWlivWC0+TxO/w75fWxy0o/
	Zgjzsv5qnnLSwTWh8Fx8dl596BhSgxuHZ+D2xi8HgNQchhk01E88zKr0XNMGXttZQFw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792422433; bh=zrnaYDCrhYEyWwJ9/Yft1y7
	TMxYSmjb9cV05WqzJ+3U=; b=vv68aGoSYZIH2ijrZsX1Ykg2n6HQbr1TnIHNN5M9S5GPl7zBe2
	WcDuQY6Hg/7kiuaSWy7KlBF11BMfF1Q1m7Ag==;
Date: Mon, 19 Oct 2026 16:07:12 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: pmladek@suse.com, akpm@linux-foundation.org, rostedt@goodmis.org,
 john.ogness@linutronix.de, senozhatsky@chromium.org, kees@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] panic: drop the fake trace id from the oops end marker
In-Reply-To: <20261019144628.r8Q0S1M-@linutronix.de>
References: <20261004175419.269865-1-brads@mainlining.org> <20261019144628.r8Q0S1M-@linutronix.de>
Message-ID: <56958262-5F26-49E3-87B2-C26CA2F39F64@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 19 October 2026 15:46:28 BST, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>On 2026-10-04 17:54:19 [+0000], Bradley Morgan wrote:
>> print_oops_end_marker() prints "---[ end trace 0000000000000000
>> ]---". The format pretends each oops has a trace id, but the value
>> has been a hardcoded 0 since the oops id machinery was removed, and
>> nothing prints an opening marker anymore. Nothing in tree parses the
>> id either, the pstore selftest greps for "---[ end trace" without it.
>> Kill the fake id, the format specifier and the 0ULL argument go with
>> it.
>
>Could you please figure out _why_ it is hardcoded to 0? Someone
>requested this with a reason. If you want to remove it, you need to
>ensure that reason is no longer valid.

Nice catch!

uhhh, well it's just always been there I'd assume. Probably for selftests? 

But what's exactly the "benefit" of this? Idk.

>
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>>  kernel/panic.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/kernel/panic.c b/kernel/panic.c
>> index 213725b612aa..0436a92318ed 100644
>> --- a/kernel/panic.c
>> +++ b/kernel/panic.c
>> @@ -1051,7 +1051,7 @@ void oops_enter(void)
>>  
>>  static void print_oops_end_marker(void)
>>  {
>> -	pr_warn("---[ end trace %016llx ]---\n", 0ULL);
>> +	pr_warn("---[ end trace ]---\n");
>>  }
>>  
>>  /*
>
>Sebastian

--- Thanks!
"I'm not a very positive person" - Linus torvalds
