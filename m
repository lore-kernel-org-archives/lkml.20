Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E115F302146
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788646016; cv=none; b=n6lfzXrTwIdwz56knLp6/MtnopJp5zG1CAWOsbwX3fAUul9K/G9SiIJNioyQKMclgebIBUKHiMaFfNDZ5IHHazLz6hqvME3IZYlqeJkrjO7LXYG7Hy0lO5Vcnd7ezhPtrrTjYTy1+SAimy4eWCUNlCXnEdeOkP83IX0IQWhqQUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788646016; c=relaxed/simple;
	bh=gKgXvSljXA9H4GECV+o/De7yPVXjBgAJ5xd4HgNjjX8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RyUAys1m1821RAfmv57JyUC6GvlWHbb08p6bsS6cj7oTwPNAsm0cfKMRmq+8yrZfhXXEUpmjtSESDoPtVTQMbHFID5K5gq34ehq+QOQB0TYfXVO+W+qjyDztSw2GbP8aU5lFYuei/ITuUMeEajXBfEC9gVQ+XZHnq6cP5eHifvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ACcYKFoX; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RY3OzOuD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ACcYKFoX";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RY3OzOuD"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788646008; bh=E1x5Avq89KFxOOoCrq350XK
	XU3AzWUZ7h4wE99FKQ58=; b=ACcYKFoXndYjI/c18w9fW5bczyMaQNEyDKoHdNUHQ4KQ4pfl/U
	pQ4s/XnX5mCMpODY9jKQHHoLhLCMTNFZ4maeZVL86q/JqJxx/gVqHFEoU4WOfs4uAS/xDBfFIBN
	CRglKsi2jekUYJQaVVDRBGqYG6hBDj1e6en7PTBxKpX1sF64/bFe6wqOJoimxJUfn93m0j73cE8
	39+Q2MJALPiLw2jS1mkQ4rbztTF5HnD9X2hxv/gvojdPaRG0tgCseIZF7QeK9PCUTUI2IQFhF5s
	ZODp9YVVJ/CJ7HGDjxPYpXDVC7QZ702uWrx2VRWlR3WEb9I4p4rzmRtdukxwfziCp0Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788646008; bh=E1x5Avq89KFxOOoCrq350XK
	XU3AzWUZ7h4wE99FKQ58=; b=RY3OzOuDbPb+4oZFg1IvNt38YCxp5+4pI/DoyFiiu9IpR9R/7k
	Q2FITA7eNsHmYXgm5dc2PcFLg8ULYoiFCEBg==;
Date: Sat, 05 Sep 2026 23:06:45 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Thomas Gleixner <tglx@linutronix.de>, liushugao@xiaomi.com
CC: frederic@kernel.org, isaacmanjarres@google.com, lingyue@xiaomi.com,
 linux-kernel@vger.kernel.org, weipengliang@xiaomi.com, wengjinfei@xiaomi.com,
 xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com, zhukaiqian@xiaomi.com
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=5BExternal_Ma?=
 =?UTF-8?Q?il=5D=5BPATCH=5D_tick/broa?=
 =?UTF-8?Q?dcast=3A_Plug_clockevents_replacement_race?=
In-Reply-To: <87bjab4avu.ffs@fw13>
References: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org> <87h5k34cob.ffs@fw13> <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org> <87bjab4avu.ffs@fw13>
Message-ID: <347CE2FE-3675-44AA-80D4-1CF8632C8C9D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 5 September 2026 23:00:05 BST, Thomas Gleixner <tglx@linutronix.de>
wrote:
>On Sat, Sep 05 2026 at 22:24, Bradley Morgan wrote:
>> On 5 September 2026 22:21:24 BST, Thomas Gleixner <tglx@linutronix.de>
>wrote:
>>>On Thu, Sep 03 2026 at 16:12, Bradley Morgan wrote:
>>>> Hi, I have a pixel 7, if I could be asked to backport this, then I'll
>be
>>>> happy to, for the fix, add:
>>>>
>>>> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>>>
>>>It would be helpful to respond to the actual patch and not to some
>>>arbitrary reply. That way you might avoid your tags to be overseen by
>>>tools.
>>>
>> Sorry my mail client sometimes glitches,
>
>I fail to see how your mail client is responsible for you to hit reply
>on the wrong mail.
>
>But what do I know about all these new fangled mail clients who decide
>on their own what to do. When this happens to me I'm 100% confident that
>_I_ got it wrong and not my mail client. Maybe I'm just too old-school.
>


Remove Daniel too. Bounces.


My bad. 

>Thanks,
>
>        tglx
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
