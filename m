Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6A843B3E5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269522; cv=pass; b=jRRGsuc9znm9xBt6MuTIeZIOqgoNS7jTe84ZsLdI7xVOFf3J4PqfiqK7AQe4uDQnsL6g/Kzxa+oQp1dTnvullnFm3TZ8ucvs9fCsXgr+GjERR5gyNciKpYxKZs0Xd/LsJ5f32zjm6kSkT1008E62zo49pLUIibmlfkvLS5d4BOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269522; c=relaxed/simple;
	bh=wZOwL8jjh/wZ+UkZ6qjNSSvlXdI1Qks/Ut2rtHKEXWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXYyQOTChM5UW8/ElAh2voeoVm3YAkAnIzwbzrNGlUJ4cJNC5stn2kZrN33EQfn9KiDaqzUry1KSn1MrDr31sH5fh0yAdrG6+lRoOnhMlhHuOkDQjqL51qtuLBYSROR2frDwFfjpadefJcfXiVnIYMkBCVon5w3EnGq15jMbuCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGv1bIQ1; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGv1bIQ1"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so4190201a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788269520; cv=none;
        d=google.com; s=arc-20260327;
        b=oubOEuwWBw2r+GBxJMnM9D+tWepSfCbZfsReP2o7RObMksUWXtqL2c/U43h0+plQQf
         QAAwwyqA0gdwLG+QGfsSzLHVp2KBYTPX2ottaV8qiKcZPRGucIXYEUdhEk4WgIW/09Ra
         RQq1X0Ao04eUhQhZlYR4nq9A77wvfYHr81zzeSQ6vO615jFRVmfdB78SCRmx7cRmFUDD
         D//clWjFEI9MmmZno0zcQ3sRYnJi7AvRdTRI7IuhwOAzfR2xSXcmMTJE1nIyfK2pPJJT
         kBQVAen+LtSFdTb+nwA+r2VTnKHmvFZ9wPll/S004+T/bnEQbyMkTXc6PYfBB5OYzP06
         CEpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wZOwL8jjh/wZ+UkZ6qjNSSvlXdI1Qks/Ut2rtHKEXWs=;
        fh=vy8RtBZg8r4T5Fw4Hg5aVV17uj8HZ2Fa+tcZvsth0SA=;
        b=hb76QR9AqbdeyslJeAj7HJdDf17oiGMtCTl/SMuCY2WRgYo/XT5sEUMc/BcfI3fmpN
         kqT1v1e5NRvFBGetS1+dvym5sYo69PAQdEvLyaNn+s5uKtBUXLoqyKIITtdkJLJv7AYt
         Ub3axbiR0aTLzYipDAMSwjCsG6zLTXibA6RVjwUEw+kFoYd9MmbPpo3Co4DlCMHQAEHS
         NBTh1lmdpFlh6fi2LP/Xsu8BaJA9e8luVTgicBYPrXqHKsuIxakQ4+4nEM+xE3ten9rs
         Qj6HUVxcu+ft8Ovj0rGmqw+RcAHy8f4DdULnpcS7MrhbfE5UECKKIjw9XhSJi7xdyNJj
         vqDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788269520; x=1788874320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZOwL8jjh/wZ+UkZ6qjNSSvlXdI1Qks/Ut2rtHKEXWs=;
        b=YGv1bIQ1bmxqk+jyd0W+GjTkM6tTbmLm8IXuMBP6cvFxopHtYR/rLggvNNLAavld68
         1d5gIKRNNNuahGrjwokRkkIIHTieZkkF9KfYxxnzYjUzQJDiul37kpaDPJw0Z8XgJj5o
         6fvVcohk+YN81JA8ihdFbHddpgT33zLmXBMFnWEmejANzDlT9d/eG/WUBmzfau7zccFH
         Q6srx0OMEcNdyvoITci2lpHImggBhbMrSWD/X/OOqahLFiFzl0J42DvsCdXkgwGHIEDK
         tf3DqfX5P59Gwl2rKu6Wxe91TRjWIlFDbaYpni2ujxrOty4vGXgs9KNNOvSoY69bkcbP
         17Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269520; x=1788874320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZOwL8jjh/wZ+UkZ6qjNSSvlXdI1Qks/Ut2rtHKEXWs=;
        b=bR0DRE4qpntKB9Q7d2+nn2jlaL+7+jc41LsuA6ImJACA11AjpveGBDfLoYfFC2c9aL
         gFwy//HhMAW55bUGqrKWUEzTPE2N16L8hFeLRLE5drJjIrAVykLMeUfrSrjZOhtJzjEO
         aKeXxtmpuq4pcNdiHaVcmJHMXsrnqqt0/U73e42JCEmxseFpDfYSE6ZB3KofOxoXutv/
         EECJs4VTvvJjqz76YBDJESp3+i0dcA5iO+WhOKxawne2eZtp6KqXtB+jxAvB5peUl1kb
         2n6BNmFESh4P7dC0YAlk5QUu/3jbUcrLanFQriWZjIBTAVmqBmV0V16oWLKHpg8znMFm
         RFLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpfzblfRAH74oTbDLEBIVdp3lHctRR5v3LVcRZna0dLHgiJERwySz1g/m52qBU5e64QQvGabeke+6EL7g=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Q6E6844cJYBjlP+YfDv6tIYgV/r/cuNwcmYyCnvllP8/aCkU
	k5NxsqH/bDsY88+6F8zN4NhcEn7MIkDXWeKROrj+hFh+rl/QROscA03W8Ye0BfcQKViMtUwkZ3L
	0MoLA/mDeNn8G9qVw30v86H71ScTGCabSor8ahnv3
X-Gm-Gg: AYBFou3tFic9T184/GJJRDumE1jF1oivh3f08aTtL+O9HQ69XaKRteaznsUl/CvrsYJ
	S9mG5sL321T6wkGUCwfQRKIy+eJ8WgCUXN9jF0Tcwx/RKk2DvWI2DbyiRhj7UhQ1hD+PoUGmzV5
	D71S4ni0+Hezlzh+Y+vPGC9ywpxpTiWwKxXMxn8LSpl3uynr+vdgRiH2xafs4E9r8EjnYX3QVC7
	6C511nDtLkK42hxzTQioobW+YQVrepX5OKUmlgDhuMx/6QOAJzwEvh54kWXCkbAZ7iGNeuypLGw
	H9zBAarAHCCNSvVYgoKej1PwqyF3rhl0mKZNlYC2QsURfz/XemChE8LlLvhvmIg5oRGK+vbnh2k
	=
X-Received: by 2002:a17:90a:120f:b0:398:ba0e:96f6 with SMTP id
 98e67ed59e1d1-398ba0e9e53mr20108468a91.23.1788269518890; Tue, 01 Sep 2026
 06:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811154111.64669-1-kmehltretter@gmail.com> <20260811154111.64669-2-kmehltretter@gmail.com>
In-Reply-To: <20260811154111.64669-2-kmehltretter@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 1 Sep 2026 15:31:22 +0200
X-Gm-Features: AcwNN1V5-ta7UHgBf3Dcag_BjhNOVYaKS4dBVAyOmGmGTx4T_aCNwsoWOCcFjO4
Message-ID: <CAG_fn=WMH86JrNVPvz8hDHdc22asjGtETv=mCvg6E0UHqN8+Dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] kcov: Use unsigned int for kcov_start() mode parameter
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, 
	Bradley Morgan <include@grrlz.net>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 5:41=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> task_struct::kcov_mode usually holds an enum kcov_mode value, but it can
> also carry flag bits such as KCOV_IN_CTXSW, so the field is unsigned int.
>
> kcov_remote_softirq_stop() passes the saved raw value through
> kcov_start()'s enum kcov_mode parameter before kcov_start() stores it
> back into the unsigned int field. The parameter type therefore does not
> match the values it receives.
>
> Type the parameter unsigned int, like the field and the saved copy. No
> functional change.
>
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
