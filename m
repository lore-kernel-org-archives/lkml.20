Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50A44C66A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977545; cv=pass; b=r+T1V/qxnI74kEudH6puyN8cJGHW7Au2M3EpW30YqY+VxCJHY0gSeDfQ0ZDRl/YqCRokuihgzFPcW6z1xMPBC0piAtLcL5zaIBDeHx2C3Pg259JK+1dqZnV28niL3ULJaWmeI5rjy8z8WEeDcC4X8eQjWmA+53rejvUvhc569zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977545; c=relaxed/simple;
	bh=NegY6gtmqum1Gxdq8ZWRKydUtJDoGcrkBSunDsp63z8=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWV8xqMLlYRjQNHLZ0+LAMVvp090Z982zbMPTcRM3sizNSyLw6P1C3YTnyVgyutWbmVeLgKTBtihfkMsiFEl3EJF0QjGKPT5SqBR5wH2SDN+K8NWr3RSRYbTUOVxUmPviGd5ZznrW05ejTvzgWwcVdmqvlJSWngHOe1RmVMq7HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=BOtt60UA; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="BOtt60UA"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so2758566e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789977540; cv=none;
        d=google.com; s=arc-20260327;
        b=fDnV+jcMdWHd3tg65H5H7AbdFWu/3M0cZ3p/AOHPCcQIpDKDDJAw0s6rX1D7k45dt7
         HBaew/rZvKk32Ye3twt6nDIEQIvyQjaH27j3HpSqIW2x8KW2CHj2XH7y7H4WQpm+GlVw
         KhFus/I3SpHceG/l1mP5WC94wF3jMIsabFzUcOWBjELBq7ISjV8DKksLJZ+bXNyZ1Z4h
         RcbnRD6GgVeLWUKB2205HxGAe+vHe3nIbStB9C0aUu1FM6JTh2ux42MgBlD52cGtssFi
         1DtBoMbApPe0i4RPZSbwkGgHUngXKmm9IgmODXeQrjpj5Cmd4neRrKI0aOKanv/+Oifo
         jaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=NegY6gtmqum1Gxdq8ZWRKydUtJDoGcrkBSunDsp63z8=;
        fh=7jW+kIcmIhaqyamAQ8XzHDNMeNnNyAn2ChK/PRL1gTU=;
        b=czTeBFQLoLD0MZ+/OfyiTZNOBFlLQHU4x+4y94k7pUuBC2HtHpDyhH1jYnLtRsepws
         9+6VvwuzhbWM9QfAmwGWPlDmrM6glKvvtuSnzdirFchwxiMUvER9speBXepfBvcqrSIk
         aRtMIAX/UteQ1RaU+fdaqPfOxeoCekEyq0U2wsynGLScJE9dcjPgRFo07EU8g9powFKp
         Zoq6v40CdmkxJj5vnyAC8IA+idhjz71XQUoGEucEiZ+WPoAdh5o68bnpe4cv268J/UTC
         PPih+6U+3R9lQ7qVJAqbSkI3zGfdY3eg6Ko+btYM5mGMNQPAklA7Zfk7B9hNl3sqFLdM
         eCWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789977540; x=1790582340; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NegY6gtmqum1Gxdq8ZWRKydUtJDoGcrkBSunDsp63z8=;
        b=BOtt60UAtoDcImNOpXkwQWOZyvVNQHqDiWriaisV717UFMRyOPZwd+xdWWXf+xPA0l
         M5vkSB00/m5dHCAVM+F+7M2avl0LsHgKy1L/EfrlIGe1c6wFlSzGnw5BUYtvd+jgcvEq
         ljnnDbbdANsgQ09hNEwaG1EXLmEJMaPh6kC60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977540; x=1790582340;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NegY6gtmqum1Gxdq8ZWRKydUtJDoGcrkBSunDsp63z8=;
        b=Roms1rTFY47GEzvpiMQ9TnlL7rDsjMufUEaGpnEuS87Tl48+QdcgmSRXA/gp3p4v5O
         dtqJNFi8a+QF7VnD/ebJ1WHtQTsp/TeG9JezirWHQFCbqKX2H4/zCvApoPqe9ZS9honm
         xOw/29Hz37GyPvF1PRzq4giWwmCOdXdcXQ0vYqFTNPtp/nkKcDVbkawgdvX0LQJAldIU
         xWPj67XylXQ2Oq0tddqmX0uJfQT8WKMYUj7Rl1JPr6YdQOWK7CDSiMDujEzlDDqFDuGX
         UC+3PkiT3UKA6J7eyJihjFqsSNe9exgV5HK/adAz9nOniQ/ZNwnfHJbSklkfEzfSiyty
         tUIA==
X-Forwarded-Encrypted: i=1; AKwUvBztdKPThM1sFgtHQw7JSuY7pwwu9NN8NpvwKKB3+CGuBN1vt4ioWU5+c+Jx/+/DteHsVuRW8Lj9w+WCn4k=@vger.kernel.org
X-Gm-Message-State: AFuF++k1heuMZtdacXfg9wTI97aY8OQph0Saa7gYXlV2K6Nfwgvsqp7K
	kTY6Tp/jviXkQA8xsU0NLxcCvhkCXzAi3qSpFcp2oYbD6/KObf4sajIwGXlwF+2V1gbcM71Nfjp
	KlCGSd4HLADcbtJtBpDMqfey4wyVbIZzwJl/W51zPfA==
X-Gm-Gg: AYBFou2wKAuTpNpYOAmh1RHSCzm+SazrDd7CET3fuIO7hS62bs3YNsMIRS5CvPeogO/
	eRFyBlMfuJ2LChCEBUhADLbJDCNCcFl63u/2z/Ddy83MCPXrAoT+T5V8jWMInrLIzQb3IP11nna
	aVOtimxDt9v0uipHsRUolRhoCEfMaSjWGYJ435es30z/KCjE57UpvyO9SLu+FmXoCNs/aq7q+so
	RHgRJZHkUyb+jpVc/XEFSTR9m1OMGMDEZWJKAvwQXIlOWe1phvESZ5zqLnolTWxEGqheFJ19Zxh
	a3RUuFRjRDcWlOb6UiTk4RO53NycHdZPVmFCD0qwyL4KJh1muaTxUfsCCfL6CsrsXW84l73r6eN
	LKAck3gSh7txfrEp5JdXrR8Aiub2rJ7lU
X-Received: by 2002:a05:6512:669a:20b0:5b8:c230:1192 with SMTP id
 2adb3069b0e04-5b8c2301450mr1851316e87.31.1789977540085; Mon, 21 Sep 2026
 00:59:00 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 21 Sep 2026 00:58:58 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 21 Sep 2026 00:58:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kim Wooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <8d8e60e260254dc2a2cc1f37cd1b3832@realtek.com>
References: <20260920-codex-rtl-rx-v3-submit-v3-0-883d11351963@khu.ac.kr>
 <20260920-codex-rtl-rx-v3-submit-v3-3-883d11351963@khu.ac.kr>
 <9b5c31541fc8430b9d4205dcdff9e76e@realtek.com> <CAH1Bc_yTizX4Cex+GRLeRUtaBdp8jEc2XEyawMzkQsZFpj1QGw@mail.gmail.com>
 <8d8e60e260254dc2a2cc1f37cd1b3832@realtek.com>
Date: Mon, 21 Sep 2026 00:58:58 -0700
X-Gm-Features: AcwNN1Uwfsw7ISFdbAgxmEh6c9ozvNd2-hswQt1dlcyjf0ujJ_bdW0MXQ2mOb6g
Message-ID: <CAH1Bc_xo+ubx97jGXdR4_d8duO+9x3ACs22eG-SaXHiCbzKTMw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 3/3] wifi: rtl8xxxu: preserve RX requests
 across recoverable transfer errors
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Yes. I want to preserve normal RX replenishment once the batching
threshold is reached. The 100 ms delay is intended to limit retries
when normal progress is absent.

In the mixed-traffic test, normal progress brought the worker execution
forward to 18.773 ms after the retry was queued. I would let that refill
proceed instead of holding the available URBs for the remaining delay.

For repeated errors, I want to keep the first retry deadline rather
than restart the delay with each error. That is why I would keep
schedule_delayed_work() for errors and mod_delayed_work() for normal
completions.

Thanks,
Wooseok


On Mon, 21 Sep 2026 00:24:47 +0000, Ping-Ke Shih <pkshih@realtek.com> wrote:
> Kim Wooseok <5mghybrid@khu.ac.kr> wrote:
> > > Not prefer using bare system_wq.
> > > Can both use schedule_delayed_work()?
> >
> > In v3, the error path uses queue_delayed_work(system_wq, ..., delay),
> > while normal completions use mod_delayed_work(system_wq, ..., 0).
> >
> > I can replace the error-path call with schedule_delayed_work().
> > However, the normal-completion path is intended to bring an existing
> > delayed retry forward when the pending count exceeds the batching
> > threshold, which schedule_delayed_work(..., 0) cannot do because it
> > leaves an already pending timer unchanged.
>
> I knew this point. Does it matter to schedule a normal case immediately
> after an error case (defer to schedule) happened within 100ms?
> (Just an open question)
>
> >
> > Would it be OK to retain mod_delayed_work() for normal completions,
> > changing its queue argument to system_percpu_wq?
>
> OK if above question is yes.
>
> Or both change to use mod_delayed_work()?
>
> >
> > With that change, schedule_delayed_work() would select system_percpu_wq
> > internally, and mod_delayed_work() would use the same queue explicitly.
> >
