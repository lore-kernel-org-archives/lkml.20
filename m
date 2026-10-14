Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF54EE867
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983561; cv=none; b=gAUCMtaqUtrmPfano2r+hGJkWU+xbFiSBUyYhaDphJ+ONqWYULNh7KC5v4/reqr7V4Sdu5OlsLATqEqp4ny5nNW/eTqAFvQcP38QXMXobaYb3b+lxKIOJXTGhppC8SvJQ0iP4xxsQ/dN8EyNZ35V20N2q/1+B6wbOfuXBOh8myI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983561; c=relaxed/simple;
	bh=O8NtjP6nu7AxNEUWbQ4bIzDBMnvkOBW0C4DQch6lsDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV3FCXOFkGnswpZw3dLZul1q5CGQTajDIiVwFA/n+c+QsDH93uEmsmWTmexGuXe9Mn25/AujS//k3ljMdC9JeJpAFeUz3+uHvYl1wUihl8h9MptU4x3xl6rpa2fsU1nrwNXNT1e2YPW2DMywGByGNwnAaAevzjhr5B0CB5nbJyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ZZzBqF1r; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ZZzBqF1r"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5350c1b9e0dso3839331cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791983558; x=1792588358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jEpV9CpjUjV+rZO83DWrS1XtF4LOaO3+hdRBygY+Bw=;
        b=ZZzBqF1rVo/3bVyXimsqlH1Beg/p0Q2iQ3BY87VIJrLdh/+F5wCdrPsmqh3VRtyYuF
         PW6hSyZ9FWfQvQg4yTmr1+7vHH9K9UXgBAg+5IfM8ySMdiTtljob+6bzDeZ1EW8vMQ2O
         BmUQT4hmbd0nGrSbOTOBCgFN+zCYnzfRKBgyRfsDvgfecbCprjM7g9aRgHmDUvCzutw5
         qogkRbJrVoRs1W3b6SjNk/QrRJ6ELDP//aUvAG97wXYzNLwdIm0bWYPBF0oW/5TKtdkW
         fOu03Gq5kg66GZ0fRpVKlfxZY+6RZODXOzV+umSMi0XlC3aveS84Jgjl1DevFElNDAJ5
         51bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983558; x=1792588358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jEpV9CpjUjV+rZO83DWrS1XtF4LOaO3+hdRBygY+Bw=;
        b=VKpV61llj87bgiYiukLFU0Bu+QWLlFb5c4tROHjvxD3XqQN5LNv3CZUw47ggdBcBYk
         hw0ge3RdDYQtCRvP/+TfSOzTxnY5ezuRyjg0cyuYxVl6VKabh7XUulZdt5kxkosW69on
         FsBbyQ+uJK/VrwmHEBVSNEoChzcABo92+re+cgWPa935hNC+FIv3gKw8vwjkNz4kdwFy
         9jgPYvwqaH+FpROoM97wmJ6Q7OcMpsbdrDLJNM5ZKADq4cJmPF4EZA6e66q/FbV9ByqJ
         nXwzCw/AOX2NwAJnaVK9xAwt2biFBij95oohH1CrOWOMm61QHArBWOoEUN1PvF2sZ7qy
         tXvA==
X-Forwarded-Encrypted: i=1; AKwUvBxijTwYpu3lv8HAU+aDaTSlFh2eZb6WpWAHyvBqPXL4e5Jqv7MASb5Tx9rEx1BP8h43WizUZP26cJrl3Qc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8PDsGqDIOCg4qlkntcDcfEf+B7UHWUq3MrEtGI/TFt2STvFst
	8lXNDKY9gLCuywz2JWca9RtvPezZ/ob2G3ArGFlEJmjwo3qiWGFhZi8BWJLE7oPObb0=
X-Gm-Gg: AYBFou1A7JhLbBkhufZuc5ear+hjoevEuAhV1+J+iCSgzMusLjmkBgnUOFN/7i/gMdB
	aFRmH9JcxmULd+WjYRrhVRbu2aCZ2H+1JRPtFGMU3PP36RFyrovvvQdYzLeVuI069S/Oy6vNhAj
	Dsc2WbSxD3K8g07nDuMtU4+qU7st3EPz2ZTpLUeVfvKV8W9L6CxSyl1s0nP3IE+r5VvLruyXK2Z
	b6tM3Bq4XPzzEmmS35jge3viQ4aDTZ+Sy1xi0k0LlbSv5ajWc7/iyPqsmw88K14Vua8K9XsNqlz
	KwEe043TE3B8Kgn4vZz65exDW77y2fgNEKm5ae0+WyqgTu80/V/s67/BG/rqNuH6tBWai5BG4Bn
	XEnonb+i63AC4uR3LKxNXO/dNYOSvi9HZN6TEMkMz5vEJCX5GH0T2Nvjkltur+lSeeQmxLLfp58
	ZThiFmRZ7+5CF5S+JgFz6F+az/Y1dJWVfD/Jxazo55lukHmnsyo7rSo3gn57jz+g5O8KHZespAJ
	pQ8v6U3npUwzJb5s2lBQrgFprKx73hK5EqFiHde4ctxo0jgwWtCKV8=
X-Received: by 2002:a05:622a:511:b0:533:3ec8:a834 with SMTP id d75a77b69052e-5359fb3dce3mr261396561cf.40.1791983557461;
        Wed, 14 Oct 2026 06:12:37 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fa173sm124088821cf.7.2026.10.14.06.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:12:37 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:12:35 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/6] sched/numa: fix scan-period adjustment for shared
 faults
Message-ID: <as9_SwmLxAcTovnl@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-4-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-4-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:44PM +0800, Li Zhe wrote:
> Commit 37ec97deb3a8 ("sched/numa: Slow down scan rate if shared faults
> dominate") intended to slow scanning when either shared or local faults
> dominate, and to speed scanning up only when many private faults are on
> remote memory pages.
> 
> The implementation uses the private-fault ratio as the slow-scan signal.
> That makes private-dominated samples slow scanning, while
> shared-dominated samples can still fall through to the speed-up path.
> That does not match the stated intent.
> 
> Replacing the private ratio with a shared ratio fixes the
> shared-dominated case, but the scan-period code still only has separate
> locality and sharing ratios. Those ratios cannot distinguish a window
> with many remote shared faults and only a few remote private faults from
> one with substantial remote private faults.
> 
> Track faults that are both remote and private, and only speed up scanning
> when that signal is large enough. This keeps local or shared samples
> slowing scanning and avoids extra hinting overhead when the remote
> activity is mostly shared.
> 

This changes NUMA balancing behavior that's been around since 2017.

While it's not the stated intent, it's been consistent since then,
and i'm concerned that this could cause unexpected regressions.

Do you have performance numbers on this change to show it's actually
beneficial compared to the existing behavior?

~Gregory

