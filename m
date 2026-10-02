Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51F43E9D2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979460; cv=none; b=tp/LmePoaJh/xAUmXgVmD0gUNDcbzN4Mk5LrSvwM6Aq6O0rW95tMtpB2hw7zPu0dVzwo38HchffjJq8Dmg2EntHhArm0o1MusKrqyCqUPL9TpTQbUZFvRQpiR9p/lQK6EDUM3VUo96SfSCbxl9Dhz4gMScPQKx5ziR68ChVfOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979460; c=relaxed/simple;
	bh=B/VXtCUQwoXPPKu8lxOmovdpJMQBwKId7zCI8uyGZkc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CEb5XmKbsYgfCY4XX2/U8Pnhozo6jGAZpWGjIbT9iSNFC4BTiwDdmlhD15cWcAtzlfm4xUtPEpIypFRq48sNClL+QbwfNrui4TDOHCv2mDVXiiN5kRncwJyVksQe2YW/vU22XZCg4qa/GJIkZVD4i1D2aYQq6T+3kureSqyJHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TR1gTQ0x; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=g2ysucJH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TR1gTQ0x";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="g2ysucJH"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790979449; bh=Sg4yY5MWZdmrnfGNvY0VeK2
	tgHJvxSQdovqzRH/Klnk=; b=TR1gTQ0x+17W1eha5sdkl6EsbHgnOn+CLJi//82uISM6rytcR7
	GZobzx67dxwulAGdRqP35mvM5c8cLaVzY+m94pUQAWObAvO+OLk9ASkklOzdv5Bj865cip/SDwA
	Qd0FYbTJqMlralKoHqUhubfBUoE8tUM45SLdbmYXvN3/orRzzRvshSDCZLtV3+rVk5myJMdyksf
	oVK4zIva2N2ph5Ow6lE/fwm9E1MLRX3wqa1kxMYy6lONXHXsGBarq1Euxf7A9pCgMDDEX6/j5e+
	W4UDiJGgIiXBWrykbA7JJJka8gfTMKWVuDTkCaMEsKK791NnWKUGqusF0TaWqnXA+wA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790979450; bh=Sg4yY5MWZdmrnfGNvY0VeK2
	tgHJvxSQdovqzRH/Klnk=; b=g2ysucJH7UVPLaJgC1mdBTAmVHz4AeLb6mqCOd/cpm4agbcJ+s
	edchTR+N2JeLfxBF4gdrPOpsNlFP87r0d+Dw==;
Date: Fri, 02 Oct 2026 23:17:30 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Doug Anderson <dianders@chromium.org>
CC: akpm@linux-foundation.org, blum@kernel.org, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_watchdog/perf=3A_reject_em?=
 =?US-ASCII?Q?pty_config_before_the_raw_event_parse?=
In-Reply-To: <CAD=FV=XZZpWUBEQzr9HAOCqC+KkF63=wU2rpw1YMcC8JYxnOWQ@mail.gmail.com>
References: <20261002175000.1-brads@mainlining.org> <CAD=FV=XZZpWUBEQzr9HAOCqC+KkF63=wU2rpw1YMcC8JYxnOWQ@mail.gmail.com>
Message-ID: <B6936CB8-9A77-4DE5-BC6F-F924E2FA7EE6@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 October 2026 23:12:33 BST, Doug Anderson <dianders@chromium.org>
wrote:
>Hi,
>
>On Fri, Oct 2, 2026 at 10:46 AM Bradley Morgan <brads@mainlining.org>
>wrote:
>>
>> Date: Fri, 2 Oct 2026 17:39:13 +0000
>> Subject: [PATCH] watchdog/perf: reject empty config before the raw event
>parse
>>
>> Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
>> manual NUL-termination") replaced strscpy(buf, str, sizeof(buf)) plus a
>> manual buf[len] = 0 with strscpy(buf, str, len). strscpy() writes
>> nothing at all when the count is zero, so on a comma directly after
>> the "r" prefix, nmi_watchdog=r,1 for example, len is 0, buf stays
>> uninitialized, and kstrtoull() parses whatever stack garbage is there.
>>
>> The old code was safe here by accident, strscpy() filled the whole
>> buffer before buf[len] = 0 overwrote the comma position, so a zero
>> length just produced an empty string and a clean parse failure.
>>
>> Treat an empty config the same as an overlong one and return early.
>>
>> Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
>manual NUL-termination")
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>>  kernel/watchdog_perf.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
>> index cf05775a96d3..cca0485ba28c 100644
>> --- a/kernel/watchdog_perf.c
>> +++ b/kernel/watchdog_perf.c
>> @@ -301,7 +301,7 @@ void __init hardlockup_config_perf_event(const char
>*str)
>>         } else {
>>                 unsigned int len = comma - str;
>>
>> -               if (len > sizeof(buf))
>> +               if (!len || len > sizeof(buf))
>>                         return;
>>
>>                 strscpy(buf, str, len);
>
>I fed your patch to my AI, and it wasn't happy with it. While you fix
>one corner case, the larger problem is still there.
>
>Image if `str` is "300,panic". Then `comma - str` will be 3. Passing 3
>to `strscpy` will copy at most 2 characters so it has room to use the
>3rd character as termination. That means `buf` will have "30", not
>"300". Oops.
>
>My AI suggests the correct fix is to change the "len >" to "len >="
>and then pass "len + 1" to strscpy().
>
>if (len >= sizeof(buf))
>  return;
>
>strscpy(buf, str, len + 1);

Makes sense. Do you think you could put this into a separate patch, or
would you like me to respin? :)

>
>-Doug
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
