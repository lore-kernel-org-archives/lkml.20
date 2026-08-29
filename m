Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE53F105B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787968211; cv=none; b=LU1HxZdZA/oNiwxUmtuZJ66EW20J2cY9YntGg29ifF0MwWIKc4D1J4esuFElli/8e+PUI5lJ0YfwHITKJ7bM7RlTNPnCh/M45JHQsLxWOAGjoNVqkeQofDxfkXaMXzxFm5MzwyFlLx83WTfq7pLEOxxTioPkgRLYUXxus59hAcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787968211; c=relaxed/simple;
	bh=/iqJD9g/AaG1YjZFJu2Q3XSOJAmhV2Z6W0ipXJVXn84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egH3irTRNmjpQGlCcwPlXbSpQtjUSStwdbLNaVb8JGSukDqkXo+H5PGsqv5Or2q7vkqVvBMEDDqjdMOE8DghdpaR6E/Y44k5IO95FyZn2saK3skv5n3jGtbH3UEDinx2oKCHqV1FpSPA8ZBoeL56mU0mDGzuN0QiO7PzR+88Hn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v+vtgKxR; arc=none smtp.client-ip=95.215.58.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v+vtgKxR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/iqJD9g/AaG1YjZFJu2Q3XSOJAmhV2Z6W0ipXJVXn84=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787968204; v=1; x=1788573004;
 b=v+vtgKxRBsYMITQGo0/pSgvKElzZbwHg3I7UgC+mHhsJ6eHpf0D1nndc/K4HFtw6Wp++y+xf
 vX0yVpafU2qEKOjmKNBfykROwoUQdpbFLcIzPhNdM8x819iupUtRtF8guypqlzzonKKdAs+ZpiY
 R/NgW1luFthpytQd52a5C6cE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2ecf192b3279494;
	Sat, 29 Aug 2026 01:49:54 +0000
X-Mizu-Trace-ID: c2ecf192b3279494
X-Migadu-Flow: FLOW_OUT
Message-ID: <eeae0d48-4d50-4dd4-9e16-b4f9902d84f4@linux.dev>
Date: Sat, 29 Aug 2026 09:49:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] fs: fix missed removal of
 super_fs_objects_eligible()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, usama.arif@linux.dev,
 brauner@kernel.org, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
 <3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com>
 <20260828114129.909edbfb7e42b36af2da6a98@linux-foundation.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260828114129.909edbfb7e42b36af2da6a98@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 8/29/26 2:41 AM, Andrew Morton wrote:
> On Mon, 17 Aug 2026 17:03:25 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:
> 
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
>> individual filesystems") forgot to drop the super_fs_objects_eligible(),
>> just fix it.
> 
> Oh.  Why?  Please can we have a description of what's wrong with the
> current code?

As I replied in another thread [1], this fix and commit 0ef8faff490be
together make up the complete patch originally sent by Usama [2], so
they should be squashed together. Without this fix, all memcg-aware
nr_cached_objects() will be skipped during memcg-level shrinking.
Besides the newly added memcg-aware shmem huge shrinker, XFS will also
run into issues.

[1]. 
https://lore.kernel.org/all/51f48626-c38b-4cd6-a826-92d107ae35bb@linux.dev/
[2]. 
https://lore.kernel.org/all/20260715103516.2410175-1-usama.arif@linux.dev/

Thanks,
Qi

> 

