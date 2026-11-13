Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794595657;
	b=zgTjz5nMF+GeUZQ0rF2i7Ts47jacm8nhLYT/imaJSlLy4CDsPWMgk/T2GDLCpexJdSAi
	 nLyS+gmq4ze8cUGZ79wuVp8ZwikI1YzcTES+z4WnUKnWAK8QrC0Io7AU1YmZBeZ58s3JH
	 FBsqtnKPNFwMvcF/CcJsY8EcSLNh896WiGa9sWEYvhBaIQvbe4uOVsggke91XkXiAy8kr
	 GE+cIRCjQMhBNW6ZUDpqpOcEgKHfRzWc9xYEzG+R01W0tqmG1vl8C/gwjd+7HKx57XKGd
	 x8vgvI+C1OYU6GcHVPBD4yfeo3KuSgMStxqMLjjblUtPmOvDm60OyeGqVZTkjm62QaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=/TouLeE5CSqTtKRDrK0lnrLg+ooT7NPum5np2ZZg48Y=;
	b=BbEgElIHEZiz/Z7fIIV7DoPWDPOYRTX3XKK/JXQ2zA6cGzlUXc68fPipBBQkJSVfVccF
	 A583hYdL6CA2/d2y8t3jmBbRPla45KXki5G9jWe5zjUFN3LTrMR1RgMzExeCDwuyvkpTB
	 8Ww16k9iVNgJnYCu5HeEDO6OhVxEu470EFYhFUM+SeSWPIRooIB3oc0mVlDcVIn20+edg
	 eKtqr7lyhktTnFJxUztyOV/ytBVAt0IbcnajjVSl9ZVCWqA+TnKJQC6X8k+tedWVD8RxN
	 mn23yPYed5y1IbZ6k+0FG32kSxMBVu3KuHptSKRvMrg8g/7Tl+Nzox1Tyad8tyhNuRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEdyX+eP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB5606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CB5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEdyX+eP
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c10dc41270so1813256e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794595656; cv=none;
        d=google.com; s=arc-20260327;
        b=VLbt9m6QMTfv6OXK/FFEUIVtkXAylsJa8//JNls+X90RAN/K53huQmSslGk4WOPsZx
         GKK94wLU+cl/lZtdirH32KlX5dCyv9J0dQHtXa1thXxYKvsrpN+ORicC9Ljm/uS92F/t
         oazV1BD9ziDLsy/pV0tGrCsGcdnvrFzd/qJFb3HxuupFOZ1qOiZEeGoJa8hC9nD34bMy
         aHA3lxaTJj2Yy0hMkVUHNceoX2LtbUrKnJ/+EQ+5AOmlGNEDRh1RtWG6kNfYuo3AJe8B
         ITXEQi18R/k5BlR64WsTYwJsVpsm3vA9TY+BrYHGRDYTzSmPRPkZPyd1wbXru5SJwZF9
         S8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/TouLeE5CSqTtKRDrK0lnrLg+ooT7NPum5np2ZZg48Y=;
        fh=kqBtJZbRfY7+kLjpH80bGkHaatlDEys3goDTatSnGM8=;
        b=FCEWFWaFXB9yTH5XC9RQC/TltDCWggSwPyq0YQtgDbF7EzsOme9ffx3iQ5SZZavoDH
         1+ffEYMjqG3artwTBr1twZYOrDT2gK12EZ9zLELDpIcZ9y1OiyxYBqysjFeSAqemNAU5
         PhZ4V5apcCiHcklNjxY3bqTYvBKelKlg8xdd3XthVuO03AJirSc/CDSXypaKtlKbO8Y3
         fYhTi96EfjunkW6pAOq7uggAohC+jj2myUtzzyE/eJoHqUrrLtq1MUfza+TRMfJzeQYW
         iPfFKgWJOqIFmQ8XGLV5sCcnZO6gxBwzmQ26rlZZLhpinzJ3MFxL9lQjzwhdWCrcdSO5
         ZgoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595656; x=1795200456; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TouLeE5CSqTtKRDrK0lnrLg+ooT7NPum5np2ZZg48Y=;
        b=dEdyX+eP7TiPMKe02c3Caa43Fv6Nre9Mn3HwID4QBLnMs6zpzSeHslV9PRcXzSA6bU
         KaVjpPS1KuZOu0IbTeMAfCUupz3yuuPrHdbTBIOD1zd0U2xRZ3HBOt+ow+4YWhZM8pqX
         +zBmeOzGIM/nX1v9kKMcLZIrCcPs0gAhAb79BhRzSm7j+81HCRLfPMScjCEzP5pmdU5y
         wheRiiT17Umfyt0dZp0GtUnxnw43oXt0CaqKADwmUzs5+uEHUPLFVgLq9pzo13bbq8Xj
         zWoJcxEmsu2sDDXG4GrNEZuBkVC1hMRhkIGwNbJy55pOYFp5yOfpVxd6dCwwCgXN6ikK
         G8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595656; x=1795200456;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/TouLeE5CSqTtKRDrK0lnrLg+ooT7NPum5np2ZZg48Y=;
        b=YSdg3BUdRYS6gD4SEgKk64IxbtCPzT1Ty5DswSW8kChlA+bLOmztrAfEWNh3NaIW0G
         NcYAo7lvKrbmLx7ekYxSyRsrcZW+L4294RXz5iOrOI0v4pGhLGaagd6bBOe9B3QVo9sL
         9w+K8kVFAIlEKEmLcUzkwypNRfdKn+0evek09fGD1rkMs0PBFwKOTsNslM3+K+gMe+39
         Pkhhl74W6n4djcSTstv98GFMAzIiVLKwD1Lef3U/rytC3GltR7TyEXCeiH3t3ECpkr5A
         +bXQOGeThGyAKzQjXztdz1CKmcZz20yWlCCj9tGlEQD9AO90Vn0W8MqzSOYchrRcWHEg
         lVag==
X-Forwarded-Encrypted: i=1; AL+hErFpCXon1ufsLOdZifMRNVjMLBcAsj+7FzE2R6ibOiueeJXy8KT/u0O84Lvq6VjDDmZGNugA+b/m2o+xPi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZkYA+JE1w2i3LkZUjnEphxfzcuJ/YldJ6NZ75YDMjAFOD7l3u
	f/74M1sF0LqAyK75A6QgsNdeHpeid4Xhgfjdrl4Tb8/bNtg3pmNm7BQQ70l+oRPNap1YE8eELdj
	t6jv3R4XA1wX96cHAvaLXSNOQdYkmriY=
X-Gm-Gg: AYBFou2dytc/oKoih+7duI3oJ1JoN2r3aSm5w/0tg8U486otXEFPGFSkW8nqQGUQudw
	Zx9Yvg1ok1qRYHMqa7vXIgRvGlDGm2hDQzvJ6QudIQtiIMo/WZVet4+UvmVpjSv+GkrzQG3wOi6
	smQ8/gH6OqKb35UPJRMeH0h1ul2E32iO88BsF8GCWQ+cGQRQsHeQ3NSBaarc/JkXzRehXcbQT3f
	adM6Cahh/3UrA/f0hdpqW+oDg5lE4Evvggc7I/oM5B75WS9R6y1nROI+lg4heUgctbhPiLiUPGO
	qGkmRt0K3BdszsbjwU8LwjzQQgROATs46JmCrRaFM+vv4tZz7LvSxv1M2t3QW5bBV0Z01MOkJ9S
	TmpgnOSmB1xJJpjjUQnHF+pjhQAVhFct0I6PD4wrfIXoqqWjBD+fe3v5y9+Xje4DTV6nUej7/mz
	FW4s1uzDDLgHHyst7nfu2bB/E99/4drpD02Jrwxp8qMnpdy4rWeKE27El8Dh1WSvIj1SkUcsYzr
	GF1Zg==
X-Received: by 2002:a05:6512:1288:b0:5c1:57e7:e7b8 with SMTP id
 2adb3069b0e04-5c1709d6aeamr1363556e87.17.1794595655370; Fri, 13 Nov 2026
 10:47:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?0JjQstCw0LnQu9C+INCi0YDRg9GF0YfQtdCy?= <ivo.htr@gmail.com>
Date: Fri, 13 Nov 2026 20:47:24 +0200
X-Gm-Features: AclHuK9q2FQYOnq8dOMrnJk4llHA8SOzZZPwRPsJjoi4SM9PvFMk_9YjuDE_nv4
Message-ID: <CAKUb7EBUeY=2zHTu5g1ZOoo0JAFiE_MAvTDNQta+LitQnVELoA@mail.gmail.com>
Subject: Re: [PATCH] rtc: class: Do not inject sleep time without a suspend snapshot
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: sabri.alperen03@gmail.com, linux-rtc@vger.kernel.org, jstultz@google.com, 
	tglx@kernel.org, sboyd@kernel.org, mlichvar@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I hit the same jump independently on different hardware, so here is
another data point for this patch.

Samsung Galaxy Book4 (NP750XGK, Core i3-1315U, BIOS P09CFP.023),
Fedora 44, kernel 7.3.3-200.fc44.x86_64, s2idle only, RTC in local
time at UTC+2. The CPU has constant_tsc and nonstop_tsc but not
nonstop_tsc_s3, so the CMOS clock is the only source of sleep time.

After a 27 minute s2idle sleep the clock came back exactly two hours
ahead. chronyd did not step it back, because its makestep limit only
covers the first updates after start. With pm_debug_messages enabled,
the bad cycle shows three wakeups from IRQ 9 within about 0.2 seconds,
the last freeze too short for the CMOS clock to advance, and then
rtc_resume() injecting the UTC offset:

  PM: suspend entry (s2idle)
  rtc rtc0: PM: rtc_suspend returned 0 after 0 usecs
  Timekeeping suspended for 1618.173 seconds
  PM: Triggering wakeup from IRQ 9
  ACPI: EC: ACPI EC work flushed
  PM: Triggering wakeup from IRQ 9
  PM: Triggering wakeup from IRQ 9
  ACPI: EC: ACPI EC work flushed
  ACPI: EC: 0 stale EC events cleared
  Timekeeping suspended for 7200.407 seconds
  rtc rtc0: PM: rtc_resume returned 0 after 1490 usecs
  PM: suspend exit

In the normal cycles there is a single wakeup and rtc_resume returns
after 0 usecs. The extra wakeups are EC events from opening the lid.
They became more frequent here after I shortened the resume delay of
the Samsung EC quirk (ec_event_clearing=query and ec_delay=100 set at
runtime), and that is when I first saw the jump.

Your analysis matches what I found reading v7.3.3: rtc_suspend()
returns early because of the persistent clock, so old_rtc and
old_system are still zero when rtc_resume() runs.

I have not tested the patch itself. Keeping the RTC in UTC hides the
problem here.

The analysis and this mail were drafted with the help of an AI
assistant; the logs are from my own laptop.

Thanks,
Ivaylo
