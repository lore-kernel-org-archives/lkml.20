Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978016;
	b=hNquWrIXS1mbZvfAUBvsQ9bXw4WBikLbXSKzYM1PaFU/AeryyK1vBunhbjDmYKlrrab1
	 tbHHbYBtM0whqf2AvUWewLGyvMycinddIFpZn+dnRuvzlzF/RmJI2ivpDCZ0erMtf+4P3
	 pLuuWdOyzmR51PwY9+gd2ryVJYLWAP4Gpk5iVK1PIAIwi31eq+fscIiu0YuimTw5L8Owt
	 iy2ECAMDGNpXdDWKcJTll4oTnPfstNGARBdRvWzmxb7jrKZbuL2vHbnCkxh3wa2LPFtYv
	 T6YRBUKrJVgjH+01LNz5lGV3lQPXitxGNc9GT9eHRfcNblfieQAfBdGevg6xRoAraPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978016;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=I3wp7qZYECIMcLIbecPScf0AL3+m3VhUgC3UInyHpmw=;
	b=ZOyK9tV+qVcOHuBgdeByyXEJTVvkjAzFjTnhYudDjTQAVcNPGDNTjR+CDZc69tPIGn6Y
	 UwU48ShKLezu65YPaK2mK+Cqc2P0pHSmjKGRaHkyy6kmC+7rIXoSXHE22Ko8SqQjEvII8
	 0ZFUqZkhpkmMRD8aj1HggrFZbT/HZDockw942Uq9VJupaijST4Y30d+3Proe37f9gYqVU
	 fOwor9s0KT/70LTclctEFOCo9NrsUBwZucyRmNE0IyJJQI8floFwZCe4EjbMVP1KeUJdR
	 gqEH29w/xY9xznwifEpwHuxaN6Wm71RPV60Uo0o5PxJ9v7LMOfY05o16BR97mo0O2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eskOWysp;
	arc=none smtp.remote-ip=91.218.175.182
Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870FC606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 870FC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eskOWysp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S98NWqfawDspOLsHyYFeHgv0i8tOS6SEV87Z5cSSl7k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793978012; v=1; x=1794582812;
 b=eskOWyspDXbUAv/dDd1NDpbAMpn9JxUWFYVsV855bZpltr1zwfKxrfGoDU+IxqAhX1/jtxTt
 viOfRdBBH0LkEHo22EZWruapd8h4j/ShiIJggKohPfpF+jT+9VL8ErLygZEJXvD4H/VQiS8UN/5
 KA87hMGoKckiWJn/MYG81CXo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bad491a0b969e37d;
	Fri, 06 Nov 2026 15:13:32 +0000
X-Mizu-Trace-ID: bad491a0b969e37d
X-Migadu-Flow: FLOW_OUT
Message-ID: <cb06b1b9-fed4-4071-964d-90ae44803440@linux.dev>
Date: Fri, 6 Nov 2026 10:13:26 -0500
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
Subject: Re: [PATCH] powerpc/watchdog: disable watchdog when watchdog_thresh=0
To: Michael Ellerman <mpe@tenstorrent.com>, maddy@linux.ibm.com,
 npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Cc: chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org
References: <20261104034018.2676750-1-luiz.capitulino@linux.dev>
 <9fada7bf-11b5-45b6-858d-4c6b79d6a507@kernel.org>
Content-Language: en-US
From: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>
In-Reply-To: <9fada7bf-11b5-45b6-858d-4c6b79d6a507@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 5:26 AM, Michael Ellerman wrote:
> On 4/11/26 2:40 pm, Luiz Capitulino (Red Hat) wrote:
>> On powerpc, trying to disable the hardlockup detector with:
>>
>>   # echo 0 > /proc/sys/kernel/watchdog_thresh
>>
>> causes an immediate and endless hardlockup detection, eventually leading
>> to an unusable system (splat example below).
> 
> ...
>> This condition is already checked in __lockup_detector_reconfigure() for
>> the soft lockup detector and the arch-independent hardlockup detector,
>> what's missing is powerpc performing the same check in start_watchdog().
> 
> Arguably setting watchdog_thresh to 0 should mean watchdog_enabled becomes false.
> Then there wouldn't need to be extra checks for thresh == 0 anywhere.
> 
> But if the existing code already checks for thresh == 0 then this is fine.

Yes, the common code in kernel/watchdog.c actually checks for both.

Thanks for the review.

> 
>> Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>
>> ---
>> Notes:
>> - This issue was not discovered by AI. We have a new test-case in our CI that
>>    sets watchdog_thresh=0, when running on powerpc we get the described issue
>> - This issue was initially reproduced on Power10, but I developed the fix
>>    on Power9 (which is what I have access now)
>>
>>   arch/powerpc/kernel/watchdog.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
>> index 582ee3fd71c1..44f178e07531 100644
>> --- a/arch/powerpc/kernel/watchdog.c
>> +++ b/arch/powerpc/kernel/watchdog.c
>> @@ -487,6 +487,9 @@ static void start_watchdog(void *arg)
>>       if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
>>           return;
>> +    if (!watchdog_thresh)
>> +        return;
>> +
>>       if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
>>           return;
> 
> 
> Fix looks good to me.
> 
> Reviewed-by: Michael Ellerman <mpe@kernel.org>
> 
> cheers
