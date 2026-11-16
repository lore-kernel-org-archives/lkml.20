Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870440;
	b=P49boRCanMNZ+KAVeoLOEdrVWmiAv8w/p9Sr7gEuD8kR9Xbu51aVZWna4e+6dNA0VNNV
	 0gW1SFRAk9kjrGpchxTZpDqZEQxi/hqUT/2EzME68GLp2T8c94rM2tmYLll8msbBcKYnf
	 l+xIRArS7KgKM0VIW7hURxXSMDi3fIl+spRNAy5iBU5zyV+trgt9BZYz0XMhCA3bduV+/
	 FDnQzWF6EKxav3zZbICGbOPJI1QcWL4QEKDTI/WRXQV6VtCkjLjlv5EJnB8ActvMpq04x
	 pA6o4beMK52Ol1bh5/MSQsmzapi6NCMbvoJ1raZO28O4jahEXViC1LJ/fv7WRRrS8EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870440;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=a+hYdH54f+sS241KpvlRkLIjI3AE72cZFVonC5GKs+M=;
	b=SCGpH5ey7V0kd/NeC2CzByqktohBmhHOVrKs/xIP3NfZC8mV7exzUgdBEpJMyPwlYEeQ
	 6u2K58i8iZtlb5Ii6QXQuGrkinxhPhZv9mYZofvp+UeFAC1mVYD2BEp4UeK60FZBZ8ZeA
	 0j8+1IYZwKCQ9ija+xgKHIagcHSqgZ9q4cZHwEoQLO4YAezNiU6KN1X5SHQD0c9P4/LN+
	 Re00gF55EcUcoL7RbmIziUSwBtsNDIxvFMmA+binlNZ+K/2EsC3qbdveM16UG8IChE1ZJ
	 WNmz0uJ2PruQoHEwo8Yoy1d+Ymx0L13ZDUIp7etv03O0LRyCNSsf9cUOr6A9SluPdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p7B5FBbk;
	arc=none smtp.remote-ip=91.218.175.129
Received: from mta0.migadu.com (unknown [91.218.175.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68576606A896
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68576606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p7B5FBbk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M2H1x15UjPv2kZktOtjNGI9ClwYTfjmxFkJmOPCqrTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794870436; v=1; x=1795475236;
 b=p7B5FBbkbMugUYm2cba2oEp46Dx35gPJhwdBxYpEOxtetG+/PWyu1I0vmdzh3UrLbCPQqWbK
 I8aSclJ5LnKWaqCMteiq+2DCiddA42HnkatqufgihNmYbKQCTXYb901TOezZLycvjyqhqPbVaYx
 esCr6Ru8PnE/s0cXr2l3AktE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 339ddca2aeb1bab4;
	Mon, 16 Nov 2026 23:07:15 +0000
X-Mizu-Trace-ID: 339ddca2aeb1bab4
X-Migadu-Flow: FLOW_OUT
Message-ID: <a5b278b7-9e9e-43d0-9fcb-a937d3e2a0b5@linux.dev>
Date: Mon, 16 Nov 2026 23:07:13 +0000
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
Subject: Re: [PATCH 1/2] arm64/fpsimd: signal: Require ZA context when
 restoring ZT context
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261110221836.3265929-1-bradley.morgan@linux.dev>
 <20261110221836.3265929-2-bradley.morgan@linux.dev>
 <ee1998f2-69dc-419a-b388-dd4e08cc68d6@sirena.org.uk>
Content-Language: en-US
From: Bradley Morgan <bradley.morgan@linux.dev>
In-Reply-To: <ee1998f2-69dc-419a-b388-dd4e08cc68d6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/16/26 10:48 PM, Mark Brown wrote:
> On Tue, Nov 10, 2026 at 10:18:35PM +0000, Bradley Morgan wrote:
>> When restoring the signal frame, restore_zt_context() checks whether ZA
>> is enabled via thread_za_enabled(&current->thread). However, if user.za
>> is omitted from the signal frame, restore_za_context() is skipped entirely.
>> If the signal handler touched SME prior to rt_sigreturn(), ZA remains
>> enabled in current->thread.svcr from the handler context, causing
>> thread_za_enabled() to succeed and restore_zt_context() to write userspace
>> ZT data without restoring ZA state.
>>
>> Require user->za to be present in the signal frame before restoring ZT.
> I supposed there's an argument that the signal handler might've intended
> this but still, this does feel more sensible:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
>
> though as the Sashiko report identifies we still leave ZA untouched if
> both ZA and ZT are omitted from the signal frame.  I'm not sure if it's
> safer to reject any attempt to return from a signal with PSTATE.ZA set
> but no ZA signal frame or if we should restore PSTATE.ZA to 0, the
> former is safer but the latter is more in line with the handling here.


Thx, do you suggest any remedies, id say sashiko is correct, but id hate 
for code

to get hairy :)


--- Thanks!

