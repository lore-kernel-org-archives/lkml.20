Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6D4119ED
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360584; cv=none; b=WdTYnTphazQlXTwUdP7Jkr6a81JWKcJHIQR5z70Aumst1MikOwDavzC3RqZiiV8to/2pE7XXLLj+76QdiGxBwmXWvkQqv47dyAqmLLGaInb9vARw2VVimN0m7qgWPVsLB4mannvyk2/As/fJviNtDuMe7Z3z6PesnIheBij+87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360584; c=relaxed/simple;
	bh=YN8kUQ6ZlKVRJjYCkXx8/+9vAj+b+1FqleRYawM0zvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sD3d5nRPyaEJ1a+X9+zitEG6PqeRitn7en3qq33EKogF7uz0o8uXoTz09YxkPsp9t0uoKl08r2KJQ5qprvHzQCHFwf6P/mRtF2Qt1xs5QXHlxtbvvH3/7Z8Mp4KMuUajrk2EW9C9q0Yu/sW1rZEe9plhvCDMFsXhH/3PNx+myzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVFKISEz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVFKISEz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so12413145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791360572; x=1791965372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsXNxIBxfMmA8HdXQlxYB/Cvw6s6MUtFsEfrjpMvRfc=;
        b=jVFKISEzSJTLaDIc1N0Hm+0H3Jx10v9i2rgYUijlRD6FxljMxmz3CzpxfGDgUZl44p
         2MAKijKMGRYIDcsvcyZberFC+1Ejx5FCRx/BbCIoxAaZLriOjbj3j5CsroZd5Y99Se3t
         ljc/fd5R/LQc8mcH8CUVkQpbzHgs7oTCx3NsrAQSSnePF0pMGI/qQj5mH/tKehvClKvu
         +6LsC+OrLUOvJC25gZeFcmZ2D4z2InAjoJpLaZzgyteTYbjMXt7lgHUj38tXECjvj5py
         kejPw9A4qcDl8pJlN+bYmwxlntSpRhX1ha70xtArUOWWvEFB2617WJ4ZUhEvnUgL0YDj
         J53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791360572; x=1791965372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsXNxIBxfMmA8HdXQlxYB/Cvw6s6MUtFsEfrjpMvRfc=;
        b=Xn89njGmUgmHa8sIl5pP3WRtMXAfPqg6RphyI4B78Bubfz15Q60OH1HUJ5uS00Jnrb
         1f7eLF3xkvmMZ3DRyXXDtIF1H1VDqxq1x8AAPIzfqlt/KrxSsZHcg+R+97tjX2LrVY52
         YXEv2ixX1CYWBBUd/DeiyaqjvjejU4+Y6lc6/hiTJKEZlUtl/L0nB+f8o2v6RdF3HDwb
         F6zHMe5hRYg+IdeAOjEFHd5PlPq3+OdRWCaw5Zjjt7ewYvKrznXPohZf2dlshPhU+6BZ
         BRaJrSALiSfT1dPoEYzAEiioGDVwQGmdBt/Ae2EzCRQM7JQ8xZ3F3j0bwaDO5rmJ8ha0
         D0GQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6IGMfvCfk8hMHjxgWQmcGnA5KLmuaqsMectguFY6mQzoky45yTWpKzlm5ZkPxnTZhJ8hVZ7oQPbXIKzw=@vger.kernel.org
X-Gm-Message-State: AFuF++mdhePxh/pFqPFeEdiLmniutPkv7nBZvtolwoZMPDNV7RGdkgbF
	7nZcGBsP7xnzzRhxPs5u9MvSm6e5ADNaVYIBsQJkUZNcwda8AEQZJwM6
X-Gm-Gg: AYBFou2vTkJ+ZwcG2/lE53WHHZo0Vu6UpnCOZYyCo0sN9ReEENAs7o/f02MCUDiRjBE
	xe+W1UKDKGa8xx72BMyAgXPxJo/kOAraWtouXSmF/B/6dIavKv+V5L8gPt3E3w0TaEoQwBCr8XG
	FztJ+Y+Rmf/lFliuRcBuJmXI3kOF8q4OEI3sHSI+wJeqS4aL/D66t+bSv++2YxLCspr0WOzlQkt
	NnL8Ju443aveZc06P5R2vTMfSCJy01PNx8mN0/4G9autv3eu04JmIGTXxQ8rS8RhXh/2xFvTsFw
	Q+W8HTcQtUhkAluszsClMDa/z/kgJZ4foCOq9wyLllOk+Xco5HwFJ11NVsioJSko7ZmpYi4Lt29
	oyPdxujomr9T+Q2HfrRzgZF2twrLDmIysyzPqg27B4TCEldr9KTGR4mXtuYcZ5W89t0qZnI8Aez
	9nmw4gy0WDNc0JK/0c3scdNpfU3AY+wKUfCLY3YipzaPO2ft7HwUy2xKm9nRasVSv9CQPRDPvkI
	Ziv
X-Received: by 2002:a05:600c:3f08:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a1800ca17amr18023445e9.2.1791360572014;
        Wed, 07 Oct 2026 01:09:32 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c33091sm132227295e9.4.2026.10.07.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:09:31 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: pkshih@realtek.com
Cc: luka.gejak@linux.dev,
	rtl8821cerfe2@gmail.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v4 2/2] wifi: rtw88: support channel switch in AP mode
Date: Wed,  7 Oct 2026 10:09:30 +0200
Message-ID: <20261007080930.2473263-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <63ac6992e6614de1a085131964974ff1@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-10-07 Ping-Ke Shih wrote:
> add lockdep_assert_wiphy(wiphy) to rtw_fw_csa_{active,start,stop}?
> Since they access rtwdev->csa_vif.

Yes. Adding them showed that update_beacon_work, the TIM download,
reads csa_vif outside the wiphy lock: it is an ordinary work queued
from set_tim(). v5 makes it a wiphy work first, in a patch of its own,
the way rtw89 runs its update_beacon_work, and the three helpers then
assert the lock. The series then went through the whole AP test set
on a PROVE_LOCKING kernel (8821CU and 8822CU, including a firmware
crash during a countdown and the IPS path) without a lockdep report.

> > -                       rtw_fw_download_rsvd_page(rtwdev);
> > -                       rtw_send_rsvd_page_h2c(rtwdev);
> > +                       if (!rtw_fw_csa_active(rtwdev)) {
>
> Does it actually happen to AP mode?
>
> If it could happen, check the condition by conf->csa_active (like below)?

Not for the AP interface: mac80211 raises BSS_CHANGED_ASSOC for a
station interface only. The hunk is for the STA+AP combination the
driver registers for the 8822C, and it does happen there: with an AP
on an RTL8822CU counting down from channel 6 to 11, a station interface
on the same device that had a fresh scan result associated with an AP
on channel 11 while the countdown ran, so BSS_CHANGED_ASSOC arrived in
the middle of it. That download would rebuild the reserved page with a
fresh beacon. conf belongs to the station there, so conf->csa_active
would say nothing about the AP; that is why the check is on
rtwdev->csa_vif.

> > -       if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
> > +       if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
> > +           !rtw_fw_csa_active(rtwdev))
>
> Think of this deeper.... Is it existing race between set_key and !csa->active?

I do not see one. set_key(), the countdown work and the places that
set and clear csa_active all run under the wiphy lock, so the flag
cannot change under the check. The download set_key() skips is not
lost either: ieee80211_csa_finish() ends in ieee80211_csa_finalize(),
which assigns the next beacon with BSS_CHANGED_BEACON, and that path
rebuilds the whole page, CAM backup included, once the countdown is
over. Did you have another race in mind?

> > +       rtw_fw_csa_stop(rtwdev, rtwdev->csa_vif);
>
> Since you access rtwdev->csa_vif, should this take wiphy_lock?

It is held already: cfg80211's wiphy_suspend() calls rdev_suspend()
inside scoped_guard(wiphy, ...), and drv_suspend() asserts the lock.
The assert in rtw_fw_csa_stop() will make that visible.

> > +       mutex_lock(&rtwdev->mutex);
>
> guard(mutex)( &rtwdev->mutex); ?

Done in v5, which follows in a few days.

Thanks,
Mehmet
