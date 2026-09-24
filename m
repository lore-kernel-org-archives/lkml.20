Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1DA253B58
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216691; cv=none; b=mYP8pPNVWim1C4L+Wn87yWoBZ/FXjs4muicWwJLaRvgESFAKgqaStsqxX8TZGJ698HJotyugRENQaev0JFO9Yg9+Un2/srUXQZ4gyZegxmeozDkUVliNnT65dF6a9hIQQAFAhn15+E6hvVSsoZyQBP44frtfqahfFl4RROla6xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216691; c=relaxed/simple;
	bh=LJEwdCJXYFUOpsFXfusU9YAf5JfIN02KGa/uTgGJ4Hs=;
	h=To:In-Reply-To:References:From:Date:Message-Id:Mime-Version:
	 Content-Type:Cc:Subject; b=XGMykwTiY4swixvn54y0+Q0c2B/Vn/EQBAbeFazOu2Q1nzUZUFpZ589dTJ1JoIgcbnk0+qEF2Hj5pMuOe35y/uodowF02kmq8LqsqZRvcixitCa1GR0CuA+7gRW+ruea+93NKwmBT3PprBVXxH1V2Pw/2LCiUO16VDa3UQs34Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dCX2s9Kf; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dCX2s9Kf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790216676; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=2Hoz+6lDzmydq9LFtPljkge7QzlrUAbeB7f24NEGMgg=;
 b=dCX2s9Kf+IJkSxRnisi6ZS+Z5LdhSRhTttSxpYe/ERBKY+eEmA8JEry2vtRwWxYDWTQfJ9
 zlCQbNsoHm+Hd+XiIccCpsYu+4ElDqx0zOUINJKJelWlzJ3QbjLDrWaFevlBuuB4bcS5hs
 VlPJhxcWEnhxfEVq0zJjYEKmEfOtO6c/fnpqWvviIjAbmKI6BM25VsUWNqZOJXdhxg2gJp
 BZRrJv5EERIo86mwFsEQOZ3VOkT8Uj1+kWDcyU2vE1GYnINYYJ6t6wkKu3At4a7bQv5kBZ
 2xd7y5cqLxuN4NXqUAnJMBx4twOIjxg7VKqm8kYBajqMCnPd69J39s5GjGznnA==
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ab489e2+f58434+vger.kernel.org+qirui.001@bytedance.com>
To: <Yazen.Ghannam@amd.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Rui Qi <qirui.001@bytedance.com>
In-Reply-To: <20260826035314.1536340-1-qirui.001@bytedance.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com> <20260826035314.1536340-1-qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Thu, 24 Sep 2026 10:24:21 +0800
Message-Id: <e9b72122-64db-47bf-a541-3b9705ed0b4a@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] RAS/AMD/FMPM: Fix OOB, uninitialized data, and error-handling bugs

On 8/26/26 11:53 AM, Rui Qi wrote:
> Hi Yazen, Borislav, Tony,
> 
> This series fixes several bugs in the AMD FRU Memory Poison Manager
> driver.
> 
> Patch 1 fixes an out-of-bounds read in the for_each_fru macro caused by
> the comma operator evaluating the array access before the bounds check.
> 
> Patch 2 fixes an uninitialized stack bitmap in save_new_records() that
> could cause the rollback path to clear ERST records that were not created
> in the current initialization pass.
> 
> Patch 3 makes the max_nr_entries module parameter read-only (0444),
> preventing runtime writes that could exceed the allocated flexible array
> size.
> 
> Patch 4 fixes a spurious BUG when erst_get_record_id_begin() fails,
> because the error path unconditionally calls erst_get_record_id_end()
> which triggers BUG_ON.
> 
> All four bugs have been present since the original introduction of the
> AMD FMPM driver.
> 
> Changes since v1 [1]:
> - All patches: Use RAS/AMD/FMPM: subject prefix to match existing
>   convention (Yazen Ghannam)
> - Patch 1: Replace UBSan with KASAN in commit message, as KASAN is the
>   appropriate sanitizer for out-of-bounds memory accesses (Yazen Ghannam)
> - Patch 1: Use ", true" instead of ", 1" in the for_each_fru macro to
>   clearly indicate a boolean value (Yazen Ghannam)
> - Patch 2: Initialize DECLARE_BITMAP at declaration with = { 0 } instead
>   of calling bitmap_zero() separately (Yazen Ghannam)
> - Patch 4: Fix commit message to accurately describe the comment in
>   erst_get_record_id_end() (Yazen Ghannam)
> - Patch 4: Simplify error path by using goto out and moving the out:
>   label above kfree(old), removing the out_free label (Yazen Ghannam)
> 
> [1] https://lore.kernel.org/r/20260821094748.145394-1-qirui.001@bytedance.com
> 
> Rui Qi (4):
>   RAS/AMD/FMPM: Fix out-of-bounds read in for_each_fru macro
>   RAS/AMD/FMPM: Clear new records bitmap before rollback
>   RAS/AMD/FMPM: Make max_nr_entries read-only
>   RAS/AMD/FMPM: Fix spurious BUG when ERST record enumeration fails
> 
>  drivers/ras/amd/fmpm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> --
> 2.20.1

Hi Yazen,

Gentle ping on this series.

This v2 incorporates all your feedback on v1, including the subject
prefix updates and the suggested changes to patches 1, 2, and 4.
Could you please take another look when you have a chance?

Thanks,
Rui
