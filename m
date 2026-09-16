Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017724DA9BC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591076; cv=none; b=gGCSjX2iD3PQC4HIox4+pn2y2qHzy/KJmr+WXD0OWpJqD0hNvghItd2hbJ2zYTL3mEAQY5/sTGMuDLfHJJy5WN+Waxpt2LD4LUsXK+spT9p+lILMo0gZ1SKst9GDy33Eqp+DjhG2pw/yUOQL5kVNnYf5a9P0GTXIXeGrxQT4uDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591076; c=relaxed/simple;
	bh=N0M+5lX8u10ymJ5zT4gHnMiLC1a8tcaOzl/D+69pl9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia2yu/Gp3USFczDmZdI0sFq0fPbXQoyi48r1tQiUgi909ztr7a74GbMPmstb9hUloB6JSKOpa7qNWzEDZn2RyFwdVsJBxoF0pNOfOcx/Xx88H2tuhMpk2Ycs2EqX60tRXtWQ7wenjCmLc7kKxFEIk+EzX6Lf7UliEhyQFzCNsyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN3gm7N+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN3gm7N+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e620fa473so886635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789591055; x=1790195855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLSxCm7Zg9jl2SBJK9a0jUQkYbmCJ1Ycix0gizuzkzs=;
        b=mN3gm7N+3lHnWTUNNAfsr+MNNij8c6pOnfo7QLB5tv/yKCUF8z1/qse+ig0G/TrRjL
         EcVvzYlkVGq2VDv9AZnA+xmobz7Z5hGloN//YLpi9uOGkcYBLOGPM8NB7Z4LDhKC4GNW
         BxocUJs2uWS91ZyX51Mj7dgzPCN8xzifGiDOIgS0mCImV7sRWN009XDWfqpQFfDKMLk4
         RUgZBL2lKaL5jDqDM33LsK+O7jBZpV/cBZKvs0Zyd7873+ujMlZY94WVZId/FFHhz1WK
         3+8B1pN9y1+Ui71AtNCvV9+Iag3nl3QtM8iEtwH5c1CrL6KkrKV9XiZ2scVYmIaqcu5g
         BlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591055; x=1790195855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLSxCm7Zg9jl2SBJK9a0jUQkYbmCJ1Ycix0gizuzkzs=;
        b=oRY4gCdBvOeOpMyrSrwsqcBTajMrXAg8aA/+H4l2IXCXcTawlpBdvXcQWQPFwbBY7A
         fpJb/nK/Uu8cJSBHqwJBvtepqH9A4DBfJqjSuIm/C4E3gm7QXoqQmSiKXpByhGnWeeCM
         CgX5YUM88S8Iiq0u2MSJjpKNKExayh3WNy9y8mEueYsgvwHWXrsShM6hYjG3gldfIBrp
         QfsDDmpa9KBXl9uMCouGlhKEscurWR9TWeoeXu4oylmpff3ugWDY9jcKeO/xzIYhze1g
         wZuCLsmECtzZ1YAiwfW/EUzFxVDgxfzCbsNdB4svaUZQkQwqwhVAgJ1owsUpw5KVARdi
         s0Lg==
X-Gm-Message-State: AFuF++lHUySI9wb4J2ZhcwrPxAllWC7JQcRRCFvLaAIVa72ONRao45rp
	btyAN1/tUMsMiHtUKZxF/WDuczNwJhcBsvLeMkP8OBrFyrysrhu3qFHD
X-Gm-Gg: AYBFou1TZz5ES72Jdu5mY/ZhiRH07KvNezsM7zir24kmc1+S6/C3O4sTOMtvx+LKxDU
	I9CNxyK1DazswhUGCelh9p6UNoUchA+9H3XN+kz/h9SNI/igeqaYoc5f8Xr1fG+9GdGhUp+Uo5s
	zP/6HUvDzSpbsSqYFlqJmT0ZQkV51v225TgjkoArgOiFVOT51wnnyeFZspIKfzUbT3kZacR1w3q
	0hbZoUwsEThnMs8oOMLkLLW73xo4zWM479NoWvNGJfXqjvXVzWhc21e3A2spbpILjWRfda2DqBd
	TqaC3xPtaMmY4KNx1vClSedM3RzYK/SGIR2mBGgJaG/vSX+KWU9ZbikSQ675O4mUtlcxAWbgemq
	9Gbp1M6wHwduFUE+IsrvNuw+m2PFJ9lFH/dftBbojc4brHzVULYk3UTfrHayK3SrXTnlw3E4qy0
	dNVfX+zcaWSZMyqCIAnG8imZz74m5YGn7F7k8MHniyBZ7H6NgomRLOLLab5e6OPyGyNvhmO27/m
	u2doeYjtYD+mG4tDglhHnxegQ==
X-Received: by 2002:a05:600c:83c4:b0:49e:6838:c813 with SMTP id 5b1f17b1804b1-49eb734574cmr49879025e9.33.1789591055213;
        Wed, 16 Sep 2026 13:37:35 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.82.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm20559075e9.2.2026.09.16.13.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:37:34 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:37:32 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>, stable@vger.kernel.org
Subject: Re: [patch V3 1/8] signal: Prevent exec() race
Message-ID: <aqr-DEcZvokJ9v7k@andreayoga.localdomain>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.572536604@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.572536604@kernel.org>

> @@ -1030,6 +1069,10 @@ static int __send_signal_locked(int sig,
>  	lockdep_assert_held(&t->sighand->siglock);
>  
>  	result = TRACE_SIGNAL_IGNORED;
> +
> +	if (!task_can_queue_signal(t, type))
> +		goto ret;
> +
>  	if (!prepare_signal(sig, t, force))
>  		goto ret;

Should this check sit after prepare_signal() rather than before it?

The comment on task_can_queue_signal() and the changelog both describe the
new check as preventing a sigqueue from being queued and leaked, but placing
it ahead of prepare_signal() also skips the process wide stop/continue
handling, which prepare_signal() documents as happening even for signals that
are never queued.  Moving the check below prepare_signal() looks like it would
keep the stop and continue side effects while still preventing the sigqueue
from being queued, since prepare_signal() only removes entries from
task::pending and never adds any.

  Andrea
