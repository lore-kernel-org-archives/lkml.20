Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842346;
	b=JfO3llViU4rHz9zUkmyx7R4KispVmR903HUK8NkpWYeycCGVegRdlXIC2/YlPPenJr5W
	 mFBryB0de1pckr9NhnkocXCUw/4+3wDklAfxhMFT9ofSWTQHBYwY5HYs5glkb8uOuziBo
	 fQ/7aehV6Ud3MpQyaqQRGdFNRLWsKBs7egMVy7MPSW93ZBsn22Au2FNT/etxV99mYEklj
	 2Xeu8O/ib+kQpJ8N3AUHNguH0b6G3RCP2WRxa20Ozr7YHmEx7cwnfOHRwD+3BPRCE0sXk
	 6r3/1khy/U0YTBbAv/RYuh9OwIqttizX46pL0prPml9G+okquBqm7lJqsl7hy+3VHsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842346;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/p62E+DsKjzO1De2gJ8rQ5MNrD/NGRcm69PVIh9Cv50=;
	b=2cWkN6t2NoJ07LaDAgjdRhwMkX1cQLEU93tbpX9H6L1Ekuy1EaOUmzb18KqvJYpidrnI
	 aT6w6VMMS9hrtIxBwqmlYeOWJHu0SafiaNXgGej0Uuy8lYJbtdUp8cN0U4vVu0crhScDu
	 EVsaePrpgJgCkpqUTiAo0i6e2rToLl5R62xHZWylCkRBaaQVXIgUJd0BwNAb48WhyHImE
	 kQgDOX1f03SSbDypvqQxFZXGYDP9o5x/u2d04R2EmmuhFdVUY5Vq5ImpAmqOYiMPTkLGJ
	 74E+u8Ik9+uSm1KcklFB5sbgx/uNDJ0TLDIyz9nAutuchC2X8csq4TieICLvBkFWlpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijLedmC4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F52606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijLedmC4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347121F000C5;
	Mon, 16 Nov 2026 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842346;
	bh=/p62E+DsKjzO1De2gJ8rQ5MNrD/NGRcm69PVIh9Cv50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ijLedmC4e/AV4AikvMBJden6BFBPZQls+wJGdv+EStcb3m5+CTqQeb822zSStxKbo
	 smU+pjbuacxEvPOJGcadkFo9qZLRJInmE5dYZpk8Qdo7Ha62R0/Byn7t5PJiAuzXNN
	 uEFTvnRFYp9NoA2KOVBWcVUYyWgF8azlq28jXRFDXsaZN5QYOeE3jeikXZIoOOyIVx
	 59pvx+jG8IGxCBc5qgqflb1sZkO7EPWfGBDsKwUa/zOTDc4YfEKXVp/iowKpup44px
	 tI/RNDg2wNig/cWxqAb6TRa6+Dall1tZTOFoAvyqWZSukBw14c3RpGXoWcbVZl/TQw
	 4GEnixsjMWgrw==
Message-ID: <120f301f-5359-4f56-8b21-87ef6470ffa4@kernel.org>
Date: Mon, 16 Nov 2026 16:19:01 +0100
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
Subject: Re: [PATCH] powerpc/32: Use HAVE_PREEMPT_DYNAMIC_CALL instead of
 HAVE_PREEMPT_DYNAMIC_KEY
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <d26da63caddc52de7894c763304ec7ecb23909a8.1781866685.git.chleroy@kernel.org>
 <763622c4-d2fc-4e84-8474-fdd72a64b5e6@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <763622c4-d2fc-4e84-8474-fdd72a64b5e6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/06/2026 à 14:32, Shrikanth Hegde a écrit :
> Hi Christophe.
> 
> On 6/19/26 4:28 PM, Christophe Leroy (CS GROUP) wrote:
>> powerpc/32 has HAVE_STATIC_CALL_INLINE, so
>> HAVE_PREEMPT_DYNAMIC_CALL has to be selected instead of
>> HAVE_PREEMPT_DYNAMIC_KEY for less overhead.
>>
> 
> Do you have any way to quantify this overhead?
> 
> 
>> Fixes: 6ad7751537e8 ("powerpc: enable dynamic preemption")
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Finally HAVE_PREEMPT_DYNAMIC_CALL was removed by commit 5b9a28eeed37 
("sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}").

So droping this patch.

>> ---
>>   arch/powerpc/Kconfig | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 81642206f7de..7475907cef5b 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -281,7 +281,8 @@ config PPC
>>       select HAVE_PERF_EVENTS_NMI        if PPC64
>>       select HAVE_PERF_REGS
>>       select HAVE_PERF_USER_STACK_DUMP
>> -    select HAVE_PREEMPT_DYNAMIC_KEY
>> +    select HAVE_PREEMPT_DYNAMIC_CALL    if PPC32
>> +    select HAVE_PREEMPT_DYNAMIC_KEY        if PPC64
>>       select HAVE_RETHOOK            if KPROBES
>>       select HAVE_REGS_AND_STACK_ACCESS_API
>>       select HAVE_RELIABLE_STACKTRACE
> 
> Patch per se, looks good to me.
> 
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

