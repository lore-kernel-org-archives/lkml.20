Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573622;
	b=VtZEpOeJFh3hZkydTwQ8YH7JJI5VeOtLoFoA4nqFRYZVn4rra7wtgYBhcM1GhMEk8Det
	 hvNUOoFgN5ZCaZLNfbwc6QeaP1EBzalDCzlrBL29PR0xCMZyK++0RO1XMxXFwYO97MIBi
	 VKdFWE/ItV8/3V9/AhZyENEWuR05mZDofUgC1jiS8zEvB+gw8u/X/QlCIiP99jAAsQfv1
	 g4RQMKPxLiDJmQ+eunNnJ8y47CNyjs4nOktltWai5aX8gnNoj0eCBM/Gm4K+/T8V99+ng
	 oeZFOBLAmA3rvxe/FM5k+uBvewTsu1E8LEtNmhXi7s8prkzaoYcqo+OmHF41IioAtnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rLVfg9ErNOee48O9lnXUz0AflcGEv9NaDJ2S46e/6zg=;
	b=FkVvqyfUbzlSBZzejEMa9Lqjeu3+9g6S9ZvTQ0Ee8OxnoPviMypyuAM31jksG9G1GSPj
	 md51D73lK02p6TiFcX8cC7aDVz2Oz3TtOyRAfz+GayLMrnBRxnkDdlqDalb/KAr5JqUN+
	 F6me0EJ21Fdmpw1CRUK8/OptbegrU444t3R8fh0blC8XBF8s/MbOGBZvGy8rhFP04nrEx
	 hHi646eAcWL7/S+Nqd808+mO2/KXstysq970kccO5e97E1g805fPyySZVgVNFE8tFcdNL
	 m/EY8fqEcRZrsHq5hXXos8qXzkZHuhl9S/T56VQCeHPvUe43Kkm3lW/Gwy6fJo1JT4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MmaluNyX;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5966606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5966606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MmaluNyX
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so3858195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792573620; x=1793178420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLVfg9ErNOee48O9lnXUz0AflcGEv9NaDJ2S46e/6zg=;
        b=MmaluNyXBeOxDQPT+Syg3TI5+nimVLhp94T4I9JExxUquckJDUZoLM6XZYVouYUHs2
         Zgs2g8VE4r8ydHhEzjbvvSYkyN+z0Zedl1XuDJNU6vUxVLKLJIYMK9HG1BVmkS2YZTB9
         wXxN+iy4H5xJoHwu5CgECZCpw58GHia8IseqM5lsO8fZ0dUL2SdXSEB8meOAEkkcLRpH
         0KpDo8bcOHjAgt11aPPoLLHIp/GndtXGxUuqZUcn3hml+ZZoSqgcaMcMRXKd9okbr1Ic
         J7AYwU/AvD9v1zMt8pTErk1pcm7553ROXGF3p0v/sT4UFdYXfAyUIZ9XR/m2bpPqWr0B
         w3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573620; x=1793178420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rLVfg9ErNOee48O9lnXUz0AflcGEv9NaDJ2S46e/6zg=;
        b=sSDf829st8Z7XGkKSd5oyCcJuBOy2mDN4hET/p46P0R1+kUoEbnT8/Hunr0Z6BxJKl
         PPIVDCUU0pmObKyJq5CbAP/Y9+XgqY7tw2CHFWZ9ekfcyqJeHU9v2Lgo8cTjwhzhS9Nc
         3K8GzfQlQxQHjy97ttSW7LlyDhFTWk50O2c2uMwFdFP7oHI0jCfE5FKhNmF10Cx2PHOc
         rl1/8dMp/TQfuwgjhYHt5/ZFEaeOZlRfEteNjoFHdKRjW9dDXTzBQIC9D1Ak+QNEnROL
         CLgrTfwkV3p0TMJZLFjiI9Pdegvc4OXCmW2ArZ4GAFYPnBjus2WmpLiHP3XMOUFFOdJg
         yx2g==
X-Forwarded-Encrypted: i=1; AKwUvBzEiG0GOupzhrzoVCProhgqFz3x+3Migdf6f72NI033FzZmCJCB0U/B+YDk8ZgB/sP61bS1zc1K8w4d9mU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDYbsVUVk+m9WSO0NbOwsX2OoNx0kWhzXuvvezF7oX3vfRtDDV
	+BBwYHS3VgdciC0LQBg8B149mYiVrbZp9G+APkoJZVvpn2MQmIoUciGf
X-Gm-Gg: AYBFou3YOwE9KD72Sdot0lqKKLHSPUrFIEWNVAOdQ1H+F2G3ziSXXGF8Jcqty3VaPfP
	LjGu2fL8AZ7my2vNXeHIlCtAVewv1gvJk+9WI4alwYzSGe+/ak191FKtHrl/fdwKxOXs4Au3d1S
	d0MgTEEaEYx7cgUUmhk7JcWHjk0LXicR7cTI/pCyJX2G0va6KUDkJE8lKkQNPzHrjoDpdB3Q0DV
	tdYzL6u2hiUcGDBfAnKpcnvtQmdowt7jTs22lsAFsscizncCiZIwYbUHVwiG8YybJA32NdGFnvl
	yeU23icIBU6o+74ob0FwwlEA3iyOCeHNd9bswGodObno8Q+ljGmZW5OWqDgn+2yVUX69k0nCEmd
	isORqxr2ChSidnDr0xa7q4a1QZSeBmezqvkkqzDpm+1d7xeyCvqy43a/w02nw57EppUVYcUOE0L
	Jn0caC49rSnpIkA8u76NRJ7cmtCt7ODOmEpj/eAEKVFKEyO8WbghCeeskHaU0n/1cxAx4+VfEDv
	osNA5r26DAUIwx8/lsNkn3fsO/ouIW/WtCxGGC5zWh2DvEyvnKj1qqaaMCuVeN3lcbeBcp4PN5+
	LjqLB+n+rEsesU6Bix3nRj7v
X-Received: by 2002:a05:600c:4743:b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a1fdd460e0mr25240115e9.23.1792573619791;
        Wed, 21 Oct 2026 02:06:59 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm41757565e9.0.2026.10.21.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:06:59 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC -rcu/dev] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Wed, 21 Oct 2026 11:06:51 +0200
Message-ID: <20261021090652.20333-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3e7abe29-df1f-4cb6-884f-dd0a70c5311f@paulmck-laptop>
References: <20261019162005.12888-1-parri.andrea@gmail.com> <3e7abe29-df1f-4cb6-884f-dd0a70c5311f@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 11:49:08AM -0700, Paul E. McKenney wrote:
> On Mon, Oct 19, 2026 at 06:20:03PM +0200, Andrea Parri wrote:

[...]

> > -		if (!torture_must_stop())
> > -			torture_hrtimeout_ms(kthread_do_pending_ms, USEC_PER_MSEC, &rand);
> > +		torture_hrtimeout_ms(kthread_do_pending_ms, USEC_PER_MSEC, &rand);
>
> Is the theory here that a kthread_stop() will wake up this sleep anyway?
> And if so, would that work if the kthread_stop() already happened?
>
> (I do recall adding the torture_must_stop() checks due to delays at
> kthread_stop() time, but perhaps things have changed since then.)

Yes, that is the theory.  torture_hrtimeout_ns() does
set_current_state(TASK_IDLE) and then schedule_hrtimeout(), and
kthread_stop() sets KTHREAD_SHOULD_STOP before wake_up_process(),
which wakes TASK_IDLE sleepers.  So:

  - If kthread_stop() comes while do_pending sleeps, or between its
    set_current_state() and schedule(), the sleep ends right away.

  - If kthread_stop() has already happened, i.e., it comes between
    the kthread_should_stop() check and set_current_state(), the
    wakeup is lost, but KTHREAD_SHOULD_STOP stays set: do_pending
    sleeps for one full period and the loop then exits.  That is
    kthread_do_pending_ms plus up to 1ms of fuzz, so 3-4ms by
    default.

For comparison, without this patch do_pending leaves its loop at
torture_must_stop() and waits in torture_kthread_stopping(), which
sleeps in TASK_UNINTERRUPTIBLE for HZ/20 at a time, so it has the
same lost-wakeup window with a 50ms bound instead.

The next version says this in the changelog, which in the RFC only
says "kthread_stop() wakes it".

> >  		// Omit stutter_wait() because this function needs to do cleanup.
> > -	} while (!torture_must_stop());
> > +	}
> > +	/* The readers have stopped, so nothing new can be deferred. */
> > +	for_each_possible_cpu(cpu)
> > +		hazptr_torture_do_one_pending(cpu, &rand);
>
> Very good!
>
> But given these two lines, do we need the changes to the loop?

I believe so, at least for the loop condition.  The readers are
stopped after the writer, so during the writer's kthread_stop(), the
writer can be in ->sync() on a hazard pointer that a still-running
reader deferred, possibly from the iteration it was in when
torture_must_stop() became true.  If the loop still ended at
torture_must_stop(), do_pending would make that final pass right away
and then wait in torture_kthread_stopping(), so a hazard pointer
deferred after that pass would leave the writer in ->sync(), as in the
hang above.

The other two loop changes follow from that one: the unconditional
sleep keeps do_pending from spinning while the writer and the readers
are being stopped, and the all-CPU pass once torture_must_stop() only
bounds the writer's wait to one period, instead of up to nr_cpu_ids
periods.  I'm happy to drop the latter if you prefer the simpler loop.

> > +	/*
> > +	 * Stop do_pending only after the writer and the readers: the writer
> > +	 * may be waiting on hazard pointers that readers deferred.
> > +	 */
> > +	torture_stop_kthread(hazptr_torture_do_pending, do_pending_task);
> > +
>
> And this change looks good.

Thanks.  In the next version, I'll keep the original (longer) comments
as you suggested in the other subthread, and post this patch in one
series with two patches that make hazptrtorture catch the slot-owner
race, as you asked in the slot-owner thread.

Thanks,
  Andrea
