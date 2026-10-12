Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20814440A2C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797262; cv=none; b=TNYOT1Ykxxf0AB3evTbIN4P6AOPJMCVkHl8jYI0kYlg8TMSTkQy9tSixf5JGhSMGbrAR0VJkpmdzx2hgvrlHM2v9e9ELFVNQQoGMOVRFYYRyAk35I162piPhLQXsg2ew5OMPkd8mnFc+7tV0q6RwerJHBMN56FLl4oJGZ+3E/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797262; c=relaxed/simple;
	bh=khKK7RSF+xgGFCO4AZYgwUC6y25FFMbZUhuCzsqLOGQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cZAXt3G3R7v55xybLQBGI1bUMQw0Fc2kUvk1ADZPJUPIM++BENa3VCuqBMtq6TKI2n4PUyd/NMmcHT+m1WVrx3uoR24fUlA0oaCJPjjBxVX6hIzNc/Axk3Yvgx2USPDgtj+ljf0CthwfLYjilHIBl6X/mk3Q+PkvU3Hua0O+0p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4eULovX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4eULovX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC5D1F0089B;
	Mon, 12 Oct 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797261;
	bh=mBldAvBr6to/RJszegMJr/9taByx3LmRUjouMSy6F6A=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=O4eULovXkyLQaQpvNyqGmQCON4HL0pNWUz+yN5y8IGXHVyhUOdlvsQ8GRVF7GSs4A
	 ku2XP/W6ccORr6+xKTYPPV/b/wQ2Ihvx7p81fh7uhHPR+zHXDN/rnH9TaHRyqxQg/D
	 Ium2eXHHq5vl5JvD7bFEveaaIr+Cvq3C3vSy56znBPxtcZyA2wYiC1xothkjH5F+WQ
	 xDZty1SGNGkdVS0w6aJOuOgephJNT/J4XytC8K2S5ukk+HW4ggEXVekSOtHGu38UHx
	 YwP1qp3YlDIkl9H3If6yn8DldrX6qsZhvZbf2kdWsAiXTp06Vx3MW9zVj8S9JgfkYC
	 QjveFj91GX8Zg==
Message-ID: <33508315-bf40-4c96-b77f-1a5001099d76@kernel.org>
Date: Mon, 12 Oct 2026 17:27:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 qiwenjie@xiaomi.com
Subject: Re: [PATCH v2 3/5] f2fs: cache: wake up f2fs_writeback when exceeding
 threshold
To: Wenjie Qi <qwjhust@gmail.com>
References: <20261009091857.1326197-1-chao@kernel.org>
 <20261009101340.3525944-1-qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261009101340.3525944-1-qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenjie,

Thanks a lot for the review.

On 10/9/26 18:13, Wenjie Qi wrote:
> Hi Chao,
> 
>> +	if (dirty_threshold && nr_dirty < dirty_threshold)
>> +		return false;
>> +
>> +	/* don't wake up f2fs_writeback if both thresholds are zero */
>> +	return total_threshold || dirty_threshold;
> 
> There is a related case with only the total threshold enabled. With
> cache_wb_dirty_threshold=0 and cache_wb_total_threshold=1, clean cached
> entries keep the predicate true even when there are no dirty meta/node
> caches. Writeback does not necessarily evict those entries, so the
> thread can keep looping without sleeping.
> 
> I checked this in QEMU using dev-test plus my both-zero fix, which has
> the same predicate for these fixed threshold values. In a three-second
> idle interval, the writeback thread used about three CPU seconds;
> the total cache count was 22 and the dirty count was zero at both
> sample points.
> 
> Should the thread wait when no dirty caches remain, even if the total
> threshold is still met, or is different behavior intended for this mode?

Thanks for the test, yes, it should wait. In v3, the thread won't be
woken up unless there are enough dirty caches for
f2fs_write_{meta,node}_caches() to gather (i.e. dirty count reaches
nr_caches_to_skip()), regardless of the total threshold. Also, threshold
based wakeup will be throttled once a round fails to write anything.

With your setting (dirty_threshold=0, total_threshold=1), I can see the
writeback thread uses 0.0% cpu in idle state, w/ either few or thousands
of clean cached entries, and w/ dirty caches below the threshold under
checkpoint=disable.

Thanks,

> 
> Best regards,
> Wenjie

