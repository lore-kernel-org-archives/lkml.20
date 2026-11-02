Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592233;
	b=Re5U3+5756gcmwQ/abIo+rxuF1Y4j81J4KHhNMSsdHQ5ABuyJ6hrWmF0oJgfBS+H7zux
	 itHkshJwWpgxWXvwPWlyHUFn/wcO4MHBW++9lzwC8R52lYrWNZyawS8E8J0HfanFt1+Iq
	 xx+sshsu6Ovy5q4dPbj8TiBbQf3py79bFTtExItVQ6++NhrFHVGNkhNtpSrwB4oFgaiTl
	 i3yUqBzyKXCdeTCFgFmF35CrRjVG1IFSMnDprGwfypnSdOjuZfeuB7hnz2Ks7ZaAmtQot
	 Ed94ajfUaSX5p5N13Wt9HTLmpmSoFBGv5+Q5QLBZbwHNbzNj++L5jMCDVsT0ywncCSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qsWlwY+vxPmPFxRUYpkVys4GdRvLGTlYzdsiVqsoQl8=;
	b=Hi0J7Px+Nqxf18wPwyYz5qLfDXPrCXq/YQX6+UysrOyMut+uDZOXc0h6Nzf/xbnST6xb
	 u+kJdqMiiY9ezoarFL/DotB54urceiSTL2g3floOZ3veXy1RnExHKpgK1+n/mN5mGyd+l
	 +qHrh4HLPiQ/u1GHf6V2DPardkPCe7D5bEu+OcEHybquMkjCzO0nbds+laTlmd5v6+rXE
	 Na4xUvTPZ9gmr1SenJ1JeU7z8j8hWgytcsdFA07pkDLDqLxTtGMfugYtoh+i1+lhALI9W
	 H+St97kXjvxi3yO40ozIut0RASViIwWuK7KO+hrIo+siylzpQFwZ9pKOUEiB1O5+U4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chungkai.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d3gtpeug;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041E5606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041E5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chungkai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d3gtpeug
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8aa185840bdso1472451b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793592232; x=1794197032; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsWlwY+vxPmPFxRUYpkVys4GdRvLGTlYzdsiVqsoQl8=;
        b=d3gtpeug6FV4i5D1jzTp7hFlhrCBwd0+Tb9izX8A8ynvMeubaXVUNucYTsmknPsyxf
         jrCQnoJoKm1IR2PNT1SMkl1P+94fcQ3GUaJsX12aFL/+ThbsLJ5AgbBCep2CKVkPWU3/
         BOmEIyw1ewRwvtB6dNaTjiYk/1uIYR/Veu/3GOLRGqnV6GUtr9WY1vp/FPP5EP2z2heR
         Ky2j88n4pfWvh0Nr1XSaHY3zst9RkHSFIyyiTxKUtTE76J2ONhKx2GXHFd4G4oBchQEP
         MLzf2x4K7COKfE1z0Z240F7b/3P7LjtWxnKnMMLDJ+yu+hr1MUXjhPonefcAWQeZ+Lso
         P17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592232; x=1794197032;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsWlwY+vxPmPFxRUYpkVys4GdRvLGTlYzdsiVqsoQl8=;
        b=E5DTwnFFC68cVijiOFXKkZyfV5+bIyLsCC6noLQr1LtkdSUKtAfBH1D/MQxlnKV9h5
         f1zOUyvL6hkXz8POC/N+oFzOJXPOX7Ca4apro0Zpgsu5ZOrHnaa8hufSyIh/kdljJd3n
         cW0Vjiz+HxitNN8cLVBS9RlCNJY7oqfl0zSP4tV2rae5e2LTOHCIpze78s86VCR2vV4p
         RU1cc/xrBaKkMOHfeeaEzzUBVxGdO2CCO9/BZ7U1d/vEUpfHQ7Dh8FjccFYLWqXxSGrJ
         Y2JEE+GNGxht8V+VjGD+WQ+/zdV8HOfPKCE2dZHjwq+wcopd264zEVXIXUWlcprjBFnc
         /k4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYUHLWMV7jZJwufmsCHFcSObCk6CpKqtxGJ7nbckVfnLLvAUKBeHHINcujClq1N7XLkj+0DkzvnsSAqlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uMqUx40a5vKeKozQVuCFGHQZWiO0OC6pPAIUWkkDiTeI8ySPU
	TNiACSnlwounTaKSSMBHPLOhGm01id0Baqt9FtkGAtXVl9WWrVoSJgoUZHhQ6PSXra3A1ofJbSx
	9iGyiffCupWhkMA==
X-Received: from pfh28.prod.google.com ([2002:a05:6a00:12dc:b0:89e:ccf8:b3b4])
 (user=chungkai job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1814:b0:8a0:7024:6360 with SMTP id d2e1a72fcca58-8a9be589bcemr8234543b3a.19.1793592231862;
 Sun, 01 Nov 2026 20:03:51 -0800 (PST)
Date: Mon,  2 Nov 2026 04:03:48 +0000
In-Reply-To: <CAJZ5v0hLYKeuSHpxxRkbK07DuqOat7AuUp4nwz-1V6bgfgzWAA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027090638.900747-1-chungkai@google.com> <CAJZ5v0hLYKeuSHpxxRkbK07DuqOat7AuUp4nwz-1V6bgfgzWAA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102040348.4154728-1-chungkai@google.com>
Subject: Re: [PATCH] PM: runtime: Allocate pm_wq with WQ_HIGHPRI
From: "Chung-Kai (Michael) Mei" <chungkai@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, chungkai@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 11:59 AM Rafael J. Wysocki wrote:
> Interesting.
>
> I suppose that there is a measurable performance benefit from this
> change, so it would be good to say what it is (say, an increased frame
> rate or similar).

Below is A/B data from two arm64 Android phones (6.12-based kernels)
comparing unbound pm_wq at nice 0 vs. WQ_HIGHPRI (nice -20), with this
patch as the only difference.

The workload is an automated UI test that repeatedly swipes open and
collapses the notification shade on a 120 Hz display, driving frequent
GPU and display runtime PM suspend/resume transitions alongside active
frame composition:

  Platform A: 8 CPUs, 245 vs. 245 runs (220,524 vs. 217,954 work items)
  ---------------------------------------------------------------------
  pm_runtime_work CPU wait mean    151.0 -> 107.5 us        (-28.8%)
  pm_runtime_work CPU wait P99     1,867 -> 1,102 us        (-41.0%)
  pm_runtime_work CPU wait max     15.08 -> 5.77 ms         (-61.7%)
  pm_runtime_work wait >= 2 ms/run  7.51 -> 0.94            (-87.5%)
  pm_runtime_work wait >= 5 ms/run 0.457 -> 0.008           (-98.2%)
  UI rpm_resume() waker wait P90   662.7 -> 156.7 us        (-76.4%)
  UI rpm_resume() D-state P90      717.4 -> 213.7 us        (-70.2%)
  FrameTimeline app missed/run     0.204 -> 0.171           (-16.0%)
  FrameTimeline SF missed/run      1.086 -> 1.074           (-1.1%)

  Platform B: 7 CPUs, 196 vs. 245 runs (85,957 vs. 104,452 work items)
  ---------------------------------------------------------------------
  pm_runtime_work CPU wait mean    134.5 -> 100.9 us        (-25.0%)
  pm_runtime_work CPU wait P99     1,809 -> 1,122 us        (-38.0%)
  pm_runtime_work CPU wait max     15.77 -> 3.71 ms         (-76.5%)
  pm_runtime_work wait >= 2 ms/run  3.40 -> 0.53            (-84.5%)
  pm_runtime_work wait >= 5 ms/run 0.189 -> 0.000          (-100.0%)
  UI rpm_resume() waker wait P90   207.5 -> 23.3 us         (-88.8%)
  UI rpm_resume() D-state P90      217.1 -> 73.3 us         (-66.2%)
  FrameTimeline SF missed/run      0.551 -> 0.531           (-3.7%)

> Essentially, we're talking about redistributing CPU time between
> tasks, so some tasks will get more latency as a result of this change,
> which means that it is not an obviously right thing to do.

Agreed, this is a scheduling trade-off: pm_wq runs arbitrary driver
callbacks and genpd work whose cost is driver- and platform-dependent,
so the impact on other tasks cannot be assumed negligible across all
systems.

If changing the global default is undesirable, would exposing pm_wq
with WQ_SYSFS (so platforms that need it can tune
/sys/devices/virtual/workqueue/pm/nice) be a cleaner alternative?

Best regards,
Chungkai
