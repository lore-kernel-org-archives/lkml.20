Received: from mail-qv2-f25.google.com (mail-qv2-f25.google.com [74.125.230.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190B51C058
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777914; cv=none; b=RVOcJpwoBHQ5xnLi4PsI1GQdwbKsUw8YK+cBm3xI8O7rCeZg45Lz6hUBthqHrsrs7fwkTaZ6wpvTv0+14zXwUastXv8chT8Gs7+DjU64bUSX9Jx2JrO6OsTHevZ/Gxdujine1B/6JMZdsc06AJwxbTI578MwB3S2Yjcwq0lk9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777914; c=relaxed/simple;
	bh=YWPdCfsFS6ZQRQCEfEmlwZY8o1h7IsheV/Zhu+t5mrY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YokSmI2HlIAEs28j13F92zHGIsKa88lICmS/4ipg74qeU9BxNLoK/hokxDmcCLtZT4N000ndXBW/+E4v9NhVyqqB+HIfY2FMW2R1V2VEAxhnTIlJHyT71Z9kdSu8P2uAiAHmwPlFpnvxHa21N5kRTOh8gulHGP4PmWBkTvRVa8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=XdniRzin; arc=none smtp.client-ip=74.125.230.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="XdniRzin"
Received: by mail-qv2-f25.google.com with SMTP id 6a1803df08f44-91782a91a3aso23114146d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790777896; x=1791382696; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=abUwIeE8e0bpFPRb9wUYRAMfwfBclRmiyensy4fqIE4=;
        b=XdniRzinlTcHzMj9HW9T692w9pUcHbeyAyLPc77mOd3x7fanJf/QcI4epp1ovlEZVY
         IMo+13a8sOH6q8EeJd2TLw+WFlQCzLL8URaHz7UyqTrLxC1O/ggVwypxm0RtL+AuMFA7
         RLD8eceGCpNSa/xtRFgpOFXrFW+RU7KE5vevaYvUDxMeIYFExbYBHPaqGOGu+ZVNt1MP
         XJE3RvifOQ43BjRb6p1rHBQatxv8APv6orX86J7ycwlToBYixsvB8tVbGHD4fI1XljP9
         /34jOMOrMw8ef7Nvw6cX/7KdcVyw6cal58EE4bLHMzljIqfHMzOh2zNieR12I3QVNxMM
         Q8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777896; x=1791382696;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abUwIeE8e0bpFPRb9wUYRAMfwfBclRmiyensy4fqIE4=;
        b=zc5xHrvJE+FUZHDLn8A951ooHf/3dVIhGO0WH/3WUuWdsE4rQsRzDvicReyQ8OYSGA
         aGRdo52y4aonfPbKXiaNQLOY5A5j1fespUTbCaL91Wog5BtBibDOovLV9GPdA/x0JPWj
         SmAVXwDlC0AhfTDx2MroQPlwDqdLq/iVKWe2zrGawxzaLmZWmRMcXh9tEnqD0nOlazRF
         kB1iKpNVsIaCWF0SWPmKj03PGB+uLasbdmuiIy+uKzAZTx8DIcYCndcVCS6G9KOS1Eot
         fL5u331IsA76gZ158NFPWxGKVcafxZerQYJOXO6+6ZLr3NTfiw9wEORAl+9eJJHhW1fu
         iO8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSvLpgEgN+jrUVKk5vSr9v2spqsO3KxuhRIbjOiTQv6rwqPy5B3YpQFW6Wda+yB+ktve468cGQIW0zyMk=@vger.kernel.org
X-Gm-Message-State: AFuF++lYhlcAsM66zwWEPBYuMh9pcbipRZvqBdL5GBW0P7EuG1/PkiWU
	gSGJ8vHplU+yf/5SYMShgoLy3tby9+q/5Yt6q1/EzvVNQoRplYFKR+a9X5NNX6XuJxQ=
X-Gm-Gg: AYBFou2eK+/6gyuhfomKSZBd7K6w/ZMicsK47tfO84aRMMP7EmrsTAwnSo40bx+/S0X
	ypVP1KnUwr4fhCcSnkH3CbTvHryGsAgGJaJbLLZHFNvfyo96HEURvPgmhTLhwvuCvVpcbL5PdE6
	86gN96cKPL5x9YlfjbMjAiZqejOoesfNy8CUYkVK/pr9S/5Lp7OAR5JMdxDkONUIw+M5SwkDQg9
	Z2W76H0X5+GYWGY1EXSROayZSNCynuG6vGJl+dksebz8rZgJs1Lw6JbFvsBlgC72YDX8FiGktN8
	+1d7o5QIdqNg4gnGdJ5naZjec7R09iXUbeKlDjf2RgDzLL2NcOMwTLCwOByo2+9Ejgwjkc8jH14
	cR85P/p/gh3OQ3JkRlupVE24Z71gmTSXiEFm03pASOBImHGSI+Z1t6XJGZvGLJ64buaHYRscOwz
	XlpdMnUyHP8MR9oFEyaMHVjMbyinWnl3FeSQdJiS5Pm1U0MKoHOMtCEkTuK4Vk5/l02K7fL+Emz
	K7e+T94Ts3dsGY=
X-Received: by 2002:a05:6214:2601:b0:917:98b6:51ff with SMTP id 6a1803df08f44-917a0bd731bmr24260116d6.32.1790777895505;
        Wed, 30 Sep 2026 07:18:15 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8aa9c54sm347136d6.49.2026.09.30.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:18:14 -0700 (PDT)
Date: Wed, 30 Sep 2026 14:17:31 +0000
Message-ID: <e15d4e3c39e8ed1860b762cfd8e43c92.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Ming Lei <tom.leiming@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Caleb Sander Mateos <csander@purestorage.com>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/9] ublk: fix dispatch to canceled io commands
In-Reply-To: <arvOwDHOgvpVW86j@fedora-laptop>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com> <arvOwDHOgvpVW86j@fedora-laptop>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 09:44:16AM -0500, Ming Lei wrote:
> It looks two races: STOP_DEV vs. START_DEV, STOP_DEV vs. FETCH.
>
> Looks fast io path shouldn't be touched for fixing the races.
>
> >   2. A partial FETCH round whose task exits, once another task
> >      completes the round.
> >   3. During recovery, the task of a queue which is ready already
> >      exiting before the last queue is ready.
>
> 2 and 3 could be solved in single simpler patch by making use of the
> ub->canceling flag, and it is easier for backport.

Agreed, yours is much simpler, and keeping the flag set for the whole
FETCH round is the right model. I ran it on top of for-next (d70609a2f68c)
with KASAN and lockdep through my reproducers and the ublk selftests. The
oopses for 2 and 3 are gone, and recover_01-04, batch_01-03, generic_17,
stress_01/02/05 and 60 batch QUIESCE_DEV/recover cycles pass.

What's left for 2 and 3 is that the device still comes up. For 2,
START_DEV returns 0 and the new disk fails every request. For 3,
END_USER_RECOVERY returns 0, the device is LIVE, and every read on the
queue whose task exited sits requeued forever, since the queue stays
canceling and nothing kicks the requeue list. With ub->canceling
covering the whole round that's a small check: return -ENODEV from
START_DEV and END_USER_RECOVERY when ub->canceling is set, checked under
cancel_mutex against publishing ub->ub_disk. The server can't fetch
those commands again anyway. Patch 9 of my series did that on the old
model, I'll redo it on top of yours.

For 1, your patch alone still oopses in ublk_queue_rq() from the
partition scan when START_DEV follows STOP_DEV, same as before. I'll
respin my series as just that, on top of your patch and without touching
the commit path: STOP_DEV marks the queues canceling and takes the
fetched commands under ub->mutex, and FETCH marks its command cancelable
before it publishes it, so a cancel from the control path never
completes a command io_uring doesn't have on its cancelable list yet.

For your patch:

Tested-by: Josef Bacik <josef@toxicpanda.com>

Thanks,
Josef
