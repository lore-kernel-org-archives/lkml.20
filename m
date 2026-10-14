Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A5F47F775
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964240; cv=none; b=egXY9vDvrCBKG23W7dbyCIe8cDbUq5WvvgNlu9iI6+9ubs9bRf7DeGZKgRGnfI/yRvHCLAP/ZZPWZGed+h7xGTo3Kn9QZxwSsuzOMfZMZS139ouDZz7XOwI3Xq9pquwcfYJ5Fph43fH7hDwds8zV3BwBVBqgRobzTDPC0BmkxWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964240; c=relaxed/simple;
	bh=xA4PGxsekeMYQbPFTM50r6j4nWL3Mau8rDcGMK8YqJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD1QlVGxn3Z9n5+BE7t2sjrhaJ1xdfXuah1snP0EHRiXP0nOk8Unexzi9pg2He6sp5EnwFlO3A4oHgpghSWQuY+D9YhNqS//gEW3J2x+EzlMtYQvs3xEICoIyogFVgSvZy8Q1FIQowNQxDpyBc8psCR6t14bugfvXU9FjhFc5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NcFlcTto; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NcFlcTto"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c14a06c95so2943763f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791964233; x=1792569033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EtTypnWxP6M9B1xrfyLNoNvejjXvkriIpfOMkAgmYRA=;
        b=NcFlcTtow6g5ugSqiFyZX0VdmjYC5dYZlMGDFcehi+0ea19SOz7GZbdNpDGV7APzDA
         y2qMpO/szZU6yKDRRMallKi0SvCshMMhdE8VClgC2+Fy3bBOx4y484LZTlYWFDaP2/q4
         Fux7jt/Y4SQB46gHk/bb1ZpbMp+fC7cFxQCWXzYlnxW1gMBck5tPPaOCjHlne0q5Jj+E
         sottIKRPzPJ/8cqEXdoe6frn67A19q/ip2q3uwLUAQ2dN4sxLQl/hQKEX8pk2hml6Fk6
         RAlJLJlP8RGB2TnMeqYZh00gput6vnYYJJBpTjAc1CwBqNd3y8vEhx5QNGcgvGEC29h6
         FFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964233; x=1792569033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtTypnWxP6M9B1xrfyLNoNvejjXvkriIpfOMkAgmYRA=;
        b=WpkukhvsIDsI4sp5kpeXGkzF9psNQ5qp7eM2F6TtEYU9AKPtWIzTcVp5K4uE3mIpfB
         tyIFmJN7t9LAIzkPU66e2CACuIaV80i54Jzc9AQdkWHloCYZwiPC+muIS3af70yI2ii2
         ioYvnTnDWhrvJ9UGFPzdyowdNEhuZiK7pnZUXy/FcUJXixRm5wdZIxrIZzANda2zy3Jo
         tfEZm7Ycz6O31vK5ZJndrhCxlWsGAD+SeIzWcWwVWT4Y7jWNHUkkGqCNfOyb1nauTZ93
         w0bayMb6c138A234wmBQjxUp/KGTTk5qlWUbf2dYIhIp1lsar0ew0QooFwTTWTIglRTF
         68oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXZGLf2c+De90SLYfPSnux+0Q/uXhZVPLpR2d8D1BGG5UWnsYo6Ksf+VPdWWRQaSbMXTcymuiDfz6vH2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+WmTCB8HNSO7asqXu8mN9dBsjzhE/uONvR6y4260SFvfduIP+
	G6IwTlI7cWsOlouQPp4ShJw/Q8w1IeNzaAL8fcfXYpmSZr6cwJYpaEjeYY5PjhUjiLE=
X-Gm-Gg: AYBFou0oQNTvlWvAOboqtJNuBrVP9kWHBrL3xY4p+b29P2sxCJD9l/u930kuKmw4XKJ
	PwkIweCd7eR7eq3UK0SLbNqV4tPLUIvpmpjwb0ej2/z0C85B1W/+dZbhvGhdAvWJNHCCCQ0vQWa
	wP+gYzWcSPZwZPYyUtIhV15ciW0H8+Z0xWRLgosq2G403bc6WDMoKBCyoyLPU8/A8urou+rsk41
	QSZptJkZtqVAgmxgC8ZDCl/jIbj7BC0076Cr9dt+MALLz6e1XJNRXRc5Pe3vsEo2hnRwOTX41pF
	3GPAHAVNIWe8JN62p1S3M07Z2x7KqnO2/N+j11/pZo5tAVh3Je7S0ZpKP6/VcwfTZSDbDkvb0BM
	tBz4DlksPhDK/5v/HJsXbho8BZFK3FkuWXYxgFt8a9RyGKEb/Gh1wiFAa9snJmjOgYrYfgGMSTF
	bjDEDL4+A2z8uklUmTwBMciK+W448+T1Rc9yMF8vnXXXml2LHG9gH2WR/lVvWHY1DcP8+N5p37H
	szdAuIFe7TX
X-Received: by 2002:a05:6000:4553:b0:48c:4658:602b with SMTP id ffacd0b85a97d-48dbaadd05emr18566177f8f.10.1791964232830;
        Wed, 14 Oct 2026 00:50:32 -0700 (PDT)
Received: from localhost (109-81-25-183.rct.o2.cz. [109.81.25.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac35dfsm10313855f8f.33.2026.10.14.00.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:50:31 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:50:30 +0200
From: Michal Hocko <mhocko@suse.com>
To: BouziguesAlexis@johndeere.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: nommu: set MMF_OOM_SKIP in exit_mmap()
Message-ID: <as80Rpm-VHhP14aK@tiehlicka>
References: <20261013-fix-nommu-exit-mmap-oom-skip-v1-1-cb957cdbfcc3@JohnDeere.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-fix-nommu-exit-mmap-oom-skip-v1-1-cb957cdbfcc3@JohnDeere.com>

On Tue 13-10-26 17:56:19, Alexis Bouzigues via B4 Relay wrote:
> From: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
> 
> Commit 212925802454 ("mm: oom: let oom_reap_task and exit_mmap run
> concurrently") moved setting MMF_OOM_SKIP from __mmput() into the MMU
> exit_mmap(), so it is no longer set when a NOMMU mm is torn down.
> 
> As a result, a NOMMU OOM victim that has exited and freed its memory
> keeps the OOM killer from selecting another victim until it is reaped.
> 
> Set MMF_OOM_SKIP in the NOMMU exit_mmap() once the VMAs are freed, as
> the MMU version does.

Is this a real problem that you can actually hit?

> Fixes: 212925802454 ("mm: oom: let oom_reap_task and exit_mmap run concurrently")
> Assisted-by: LLM
> Signed-off-by: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
> ---
> Restore MMF_OOM_SKIP on NOMMU mm teardown, which was lost when it moved
> into the MMU-only exit_mmap().
> ---
>  mm/nommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 498e01ee40b0..913b2a1b5b3b 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -1555,6 +1555,7 @@ void exit_mmap(struct mm_struct *mm)
>  		delete_vma(mm, vma);
>  		cond_resched();
>  	}
> +	mm_flags_set(MMF_OOM_SKIP, mm);
>  	__mt_destroy(&mm->mm_mt);
>  	mmap_write_unlock(mm);
>  }
> 
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20261013-fix-nommu-exit-mmap-oom-skip-b8e68bf34b6d
> 
> Best regards,
> -- 
> Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
> 
> 

-- 
Michal Hocko
SUSE Labs
