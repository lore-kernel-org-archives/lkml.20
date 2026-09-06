Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C8360ED6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788691229; cv=none; b=KoedBZZeTcHCjryMxxAaU3D7Sg2jXYIdIPceYDMVznbpY4aI1dm4f8mO7rQfDuTNxAV32UE+iykN3eZfDYk6Nb2qLWoS97U54lK1dHJyGJJcWGrel8OzeDn+gv25VcOuGGeW+hKAw6bKxTVNIfFqevqdOIjXHyFAfXZdJyK83+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788691229; c=relaxed/simple;
	bh=Rk/sBuv+0+faRbBGjnRZy+cZVoPVw6YSNswMxs7QOow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Mpbt5G++scNfWGIt+XFJn+Wu6fBRF7rlufRjlgxwuFFdXzPJwYndaEnhP7QIt1eeufTwji84uoY22JzDmXYdBrbz25dyx5+/X0007EFDMbJr1ZgXPUV780scgmtTa3vm10Wo2fayG/+OabNjWGJT7CR6NswccWaHj8DAgEhm1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GtuZ2nB4; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FOTphNSj; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GtuZ2nB4";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FOTphNSj"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788691217; bh=M/Re7kwgmEbnkuoA6Aagg6L
	0d3A9QNtAbvKVTy4BiaM=; b=GtuZ2nB4KtLa647ZadMmqoRJCy8ZpOGv68BUX4WnQBWTtWKdiy
	xiuqP/v+n+1dkGKjCCiwjDrWeF0ayav6UK87BwS8WndXyUtq4pgSDgyh+wnAXnmCFdD8Psyzkoo
	gVQY/OMWbwABLmX4x8GawCqfBoJoDb43k0KSP2mFVBS5hYR97USUXVmSrVwo6Z3a37s+mU5esda
	Rio5E+5b8qn2KiI+KOQxks0VFlp9KJkZYrP3XfW9IRivM3VEXnqF7XAMlz1RnMdGIn7XToX4lOh
	O2nK1SEu31reMjTzFgsHOTxe3W6P5Z2274EsiVrRzIifF95LbQBpMlNivzNrGTP1DYw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788691217; bh=M/Re7kwgmEbnkuoA6Aagg6L
	0d3A9QNtAbvKVTy4BiaM=; b=FOTphNSjnxRyW++w64Li194Dv4tBhfgPOvfRwC80i5Ji2wFey5
	y5RjVb7MrLa/+y5/43mT8EOXYu9du2B2t5Ag==;
Date: Sun, 06 Sep 2026 11:40:15 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Thomas Gleixner <tglx@linutronix.de>, liushugao@xiaomi.com
CC: frederic@kernel.org, isaacmanjarres@google.com, lingyue@xiaomi.com,
 linux-kernel@vger.kernel.org, weipengliang@xiaomi.com, wengjinfei@xiaomi.com,
 xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com, zhukaiqian@xiaomi.com,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=5BExternal_Ma?=
 =?UTF-8?Q?il=5D=5BPATCH=5D_tick/broa?=
 =?UTF-8?Q?dcast=3A_Plug_clockevents_replacement_race?=
In-Reply-To: <8733vn47e7.ffs@fw13>
References: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org> <87h5k34cob.ffs@fw13> <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org> <87bjab4avu.ffs@fw13> <347CE2FE-3675-44AA-80D4-1CF8632C8C9D@mainlining.org> <8733vn47e7.ffs@fw13>
Message-ID: <EB2462B9-BCAD-4B00-927D-BB89B04E4C7F@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 6 September 2026 00:15:28 BST, Thomas Gleixner <tglx@linutronix.de>
wrote:
>On Sat, Sep 05 2026 at 23:06, Bradley Morgan wrote:
>> On 5 September 2026 23:00:05 BST, Thomas Gleixner <tglx@linutronix.de>
>> wrote:
>>>On Sat, Sep 05 2026 at 22:24, Bradley Morgan wrote:
>>>> On 5 September 2026 22:21:24 BST, Thomas Gleixner <tglx@linutronix.de>
>>>wrote:
>>>>>On Thu, Sep 03 2026 at 16:12, Bradley Morgan wrote:
>>>>>> Hi, I have a pixel 7, if I could be asked to backport this, then
>I'll
>>>be
>>>>>> happy to, for the fix, add:
>>>>>>
>>>>>> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>>>>>
>>>>>It would be helpful to respond to the actual patch and not to some
>>>>>arbitrary reply. That way you might avoid your tags to be overseen by
>>>>>tools.
>>>>>
>>>> Sorry my mail client sometimes glitches,
>>>
>>>I fail to see how your mail client is responsible for you to hit reply
>>>on the wrong mail.
>>>
>>>But what do I know about all these new fangled mail clients who decide
>>>on their own what to do. When this happens to me I'm 100% confident that
>>>_I_ got it wrong and not my mail client. Maybe I'm just too old-school.
>>>
>> Remove Daniel too. Bounces.
>
>Sorry no. That's not how this works
>
> #1 An OOO response is purely informational and does not justify to
>    remove the recipient from the CC list just because
>
> #2 A bouncing email address is of course a valid reason to remove
>    someone from CC, but it is a matter of courtesy in the context of
>    the Linux kernel lists to lookup whether the person vansished from
>    the planet or just changed the mail address. That's what the
>    MAINTAINERS file is for.
>
>    The thread you responded to was from TWO years ago...
>
>Aside of that you did not respond to my actual complaint about
>responding to a random reply instead of responding to the actual patch.
>
>If you fail to review what the AI agent of your choice hallucinates
>then so be it, but don't be surprised that I'm going to put you on my
>ignore list as a consequence and recommend to all other maintainers to
>do so as well.
>
>   Thomas
>
>
>
oh crap, I see it now. I thought it was a recent thread cause of my lore
search!


Probably:

https://lore.kernel.org/all/87qzj74dxi.ffs@fw13/ ?
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
