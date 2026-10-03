Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F12332EBC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023339; cv=none; b=VFHwdQebB+dJJRgisTQybC1FSqwZVZF6Rxj2e8kR/PvCAIuzPSXxKD9NB83g3W99ze7ZT/hnm9o1AJLtnjjwR7wqfe4Oe87FsM+CiV1e96GsVIXxvuAaxNFWrUPQzoYxYgFhJkb0eVxDDPL2vknvfgpRxt1rFmKiP5AH575DGkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023339; c=relaxed/simple;
	bh=9p9gupSsyESF2elQwU2E5+rwrPb6yquTdWE7mE8LScU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=t0NrfhjRCNrMa8Ivbkrj/sbOkZjMm6p+nbcpPTSmo9DAEW3YIfwLnPluJ59eX/wNmFEpCoj0jPtyyX1g1xO+SEJ+wSLpBucGjpzvNC9HxH0dPRYBr6gVscpeG8ikF7FVhM89YkIlbSdEvzvUs/E8/hkHTUdXKVK+BaEbLzjA6eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oa1xNwE0; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=T82SRmeD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oa1xNwE0";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="T82SRmeD"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791023332; bh=cwGio/iyQ14TPr9MA/jSFit
	aTYX5VKrwvbpE18wpWzM=; b=oa1xNwE0eCCMHAT87trmUvfAdiWJF9T7eigJj4JNs+8RydT7aU
	dxIBEBCCENk44t8yHaJn4JAcoAmij07J/2ZhYA1oR0TeScaT5vFdXHS7v8Y664BalYfvMLTlPKu
	iimh60gcVEXMjBmrdPusCBwtHjppoPInkuEOI3tkAPXhmL1M0vUvfPnFCreBORCuMkFuAPjB0GZ
	+Ti9gMUAZZ3BXlnkcW3gFmPEQlYvn0by1dwzQdUp+bAmI45v7nRu9QGKa1Rp9Eum/gXde38X+Gj
	rvvr/FymtOdCyCk4TjLpwMLD4nnWNgP6CbSF15R7qob+LRGzXRXHg6sxrZHLiOoh/WQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791023332; bh=cwGio/iyQ14TPr9MA/jSFit
	aTYX5VKrwvbpE18wpWzM=; b=T82SRmeDQCZ94XVx6E4EzUawvNHMn7wiPmDeZkNp39C28uzeY3
	TROXgV/jg3t6acI9iXZbfvvGUOzAv/zTkRCA==;
Date: Sat, 03 Oct 2026 11:28:53 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Doug Anderson <dianders@chromium.org>
CC: akpm@linux-foundation.org, blum@kernel.org, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_watchdog/perf=3A_fix_of?=
 =?US-ASCII?Q?f_by_one_in_the_raw_event_config_copy?=
In-Reply-To: <CAD=FV=XDQyHTT=Mm72am7hCnRYWvZXJFw3TKA3Ty-e1WccY=uQ@mail.gmail.com>
References: <20261002175000.1-brads@mainlining.org> <CAD=FV=U-uH7iTA8Gs_vTqzbKjpk9uwCiSRGbPchmJc7DAWR43w@mail.gmail.com> <20261003000800.2-brads@mainlining.org> <CAD=FV=XDQyHTT=Mm72am7hCnRYWvZXJFw3TKA3Ty-e1WccY=uQ@mail.gmail.com>
Message-ID: <281CB59F-AE76-4619-8ACC-26F95558F117@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 3 October 2026 01:30:05 BST, Doug Anderson <dianders@chromium.org>
wrote:
>Hi,
>
>On Fri, Oct 2, 2026 at 5:06 PM Bradley Morgan <brads@mainlining.org>
>wrote:
>>
>> You were right, the truncation was the bigger half of the bug and my
>> v1 only closed the corner. Fixed both with your len + 1 shape.
>
>The above should have been "after the cut". Where you have it now,
>it'll end up in the commit message.
>
>
>> Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
>> manual NUL-termination") replaced strscpy(buf, str, sizeof(buf)) plus a
>> manual buf[len] = 0 with strscpy(buf, str, len). That count is one less
>> than the code needs, strscpy() always reserves the last byte of the
>> destination for the NUL, so the config loses its final digit.
>> nmi_watchdog=r300,panic for example ends up with buf = "30" and arms
>> the raw event with the wrong config.
>>
>> The same count also drops the empty case on the floor, strscpy() with
>> a zero count writes nothing at all, so nmi_watchdog=r,1 leaves buf
>> uninitialized and kstrtoull() reads stack garbage.
>>
>> The old code was safe on both counts by accident, strscpy() filled the
>> whole buffer before buf[len] = 0 overwrote the comma position, so the
>> worst outcome was a truncated parse failure.
>>
>> Pass len + 1 so the copy includes the character the NUL replaces, and
>> reject len >= sizeof(buf) like the code did before the optimization,
>> which also makes an empty config a clean parse failure again.
>>
>> Suggested-by: Doug Anderson <dianders@chromium.org>
>> Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
>manual NUL-termination")
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>>  kernel/watchdog_perf.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
>> index cca0485ba28c..a4f677c16b20 100644
>> --- a/kernel/watchdog_perf.c
>> +++ b/kernel/watchdog_perf.c
>> @@ -301,10 +301,10 @@ void __init hardlockup_config_perf_event(const
>char *str)
>>         } else {
>>                 unsigned int len = comma - str;
>>
>> -               if (!len || len > sizeof(buf))
>> +               if (len >= sizeof(buf))
>
>It looks like you sent this atop your previous v1 patch. You should
>send your v2 patch as if your v1 patch wasn't applied.
>
>Also, you probably don't need my Suggested-by tag. I just gave review
>feedback on v1, which usually doesn't warrant a Suggested-by.
>
>-Doug
>

Thanks, god sake, I did a fart, I'll resend V2 in a new thread... (Sigh,
new email tool bugging me)
--- Thanks!
"I'm not a very positive person" - Linus torvalds
