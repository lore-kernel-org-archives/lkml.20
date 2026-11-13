Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585068;
	b=OhQmKu+FNW0TfeVU20/wr4AZrCsMhsIdd1S4u3Yw6II9lSBjvt6yoOA/BbPL0coZtnC5
	 K1Q7hyDG3y+wst2iSuJLmVmsMyEAgYiRCAh+WpfOTq0qcvVlNbciRz+TkwXxTm4B9sqAK
	 ItIhrpBIEsDG0GREkolOJP03uMGKVaWPZ62qNvSxuo3iaXiVs0tvmBig85vhG7U1vQZ1G
	 X1iMOHTzrG/EGGJP6cY4SeeQ8OYfBnLJ/LEHdGHSTvJAI5wHxs0ri3oRqX1PFvrvLAaPn
	 aOKva+gYhsnWwxBO7sHKYTwbXmTjmEaPcewFzvZk8OMW+sbb7/JpsEk0FHSw6MFCBkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585068;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aQ8Z58R/hTyFw2ouZE/gUSOiBop//SC/eqGEGwGnljo=;
	b=A1CENYucly1bBOB5aBbN3HKmUaAlsSn5xW6j/PEsG5UpY8KoKdLy38h6nB3Fnh2XBWEj
	 hvyr8gaQSSwk7rX+w6s7EuNVagZbZ1RCllhN5E3oV6MMvXc+yEGB5u+ti94oWymTw1C//
	 V8yNru/PoM7m58+cqe4qmIq5luaQ7PsiIA/SAQe0FtysipyNR5csHdWna3fSCpqJSEqGN
	 veVyQOtKGZEKVVz3rzt/uA4E7+woDbctrIM0c3bHTKSiAF0KxTdDqD0XIgnKO9jm6TsGs
	 qlokSqHbvMlaL5x/9pJ/KpFxEsvINAMGl7ELsIdHBZj7Wx4F8rWKL4wqsroU0eAU2Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="MYa4/DHX";
	arc=none smtp.remote-ip=91.218.175.178
Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8EA606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8EA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MYa4/DHX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A/AmnZWEYWikBqc5eV8eYfvyQwT7TRZgxe3Vx14+ezA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794585065; v=1; x=1795189865;
 b=MYa4/DHX+qGhqVZTthTQbCTyT+/r5F05PjaJQrQBkv7WZYhf9xZSXpGNF/hMq5AvZDN9coi1
 DzaMFuJ/Kz1xmjVfWsSaPN7MJ3AeucmiIdEAtPQQ6YohlZxgzmY1Mhn2seeJzmtreYqS7SBzgYE
 Wthp4yHghqfKb6gDSwyczsl0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id af9b908daa4435a9;
	Fri, 13 Nov 2026 15:51:05 +0000
X-Mizu-Trace-ID: af9b908daa4435a9
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 15:51:01 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: leitao@debian.org
CC: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com,
 ebiederm@xmission.com, kernel-team@meta.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 npiggin@gmail.com, oleg@redhat.com, peterz@infradead.org,
 stable@vger.kernel.org,
 syzbot+8fdf0d8e10bdde1c2e88@syzkaller.appspotmail.com
Subject: Re: [PATCH] reboot: halt when power off fails
In-Reply-To: <avWGu4l_nXP_eFyh@gmail.com>
Message-ID: <2D88DE92-A563-41B0-AB0B-5F9EA5CE3EF4@linux.dev>
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

On 12 November 2026 09:33:22 GMT, Breno Leitao <leitao@debian.org> wrote:
>On Wed, Nov 11, 2026 at 09:02:38PM +0100, Oleg Nesterov wrote:
>> On 11/10, Breno Leitao wrote:
>> >
>> > --- a/kernel/reboot.c
>> > +++ b/kernel/reboot.c
>> > @@ -791,6 +791,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2,
>unsigned int, cmd,
>> >
>> >  	case LINUX_REBOOT_CMD_POWER_OFF:
>> >  		kernel_power_off();
>> > +		pr_emerg("Power off failed: System halted instead\n");
>> > +		/* kernel_power_off() already ran the shutdown, only halt. */
>> > +		machine_halt();
>> 
>> Agreed. Even if I don't think my ack has any value in this area:
>
>Thanks, Oleg.
>
>I tried to find out who merges changes to this file and it is not clear.
>akpm seems to be the closest, as most of the changes went through him,
>and somehow he was not CCed here. :-|
>
>Andrew, would you be willing to take this one?

No maintainer, Andrew merges.

I tried asking to be one, no avail, whatever.

>
>thanks,
>--breno
>
>

--- Thanks!
