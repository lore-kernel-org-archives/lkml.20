Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0201AC45D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373444; cv=pass; b=TdKek2HsaDbrxJOQ10zpfgm5P/EHNm1T/hxXEWYtczwPFMkhc1sxo8QEPZYRe1VgoiWv7VvkGBbZXVM7GMzBdy6ojUMViTrk8HAUtO5o1oSEfC3qGex7/7bfdNVe+UzZzSO+KWT6UqEdNAcSmTMxzlRV5XHUf1z80RiM87wvkmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373444; c=relaxed/simple;
	bh=oQ/C2MK0f3jTl/ecVf36Lh8gwLkMeknrgDMALhzIckM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cd6NBD6/8/M7qIhU0C0HYeJceWdTyTP6nQvmp1d3vghXg7IjT6C9kTPfmb8A+osXhcZnwlW9z3qpLW1E5CO83FZ+uK+aAZ9/slCl2JMHzG9g57Sjr4wArBCYYrryE+hloeS16vMKkhbBCf6CwjDo7CX+6/043azMRobycVIWBwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kolivas.org; spf=none smtp.mailfrom=kolivas.org; dkim=pass (2048-bit key) header.d=kolivas-org.20251104.gappssmtp.com header.i=@kolivas-org.20251104.gappssmtp.com header.b=AzGOECp7; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kolivas.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kolivas.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kolivas-org.20251104.gappssmtp.com header.i=@kolivas-org.20251104.gappssmtp.com header.b="AzGOECp7"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a77761ff8aso338042fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792373441; cv=none;
        d=google.com; s=arc-20260327;
        b=NUOgsoIs7hfu75CYvElflaIJ6V0sngIyLUrY7g92XM4pUfK1pHWGM3Tcpm+mjPh6Ln
         3Ww/LMshePWPczr8iQ0ASffPItDy5zckdgB0imQ7uAXKE1nSBH3NOY8UMqupOfDmcOkB
         7dduTJsxk1+eC7kXuBxA4d5dlSPRbLHUvwdWj5WTRqQ5EZ0sD1FIGXVW9WbweEMI2EEv
         +XtUehYgAjAwc2NxUXjWk/XQYz3v26f7qAVMF/eGVs26D0eXAX1nr1yN1N5FN/n2g//W
         7LDrcUYWolXREFrRAWGjJty1AcGKd7HtHSdhhabZVvtv4MZT8LkOtjWDGbsBK0b/BDW9
         uy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=PzgjULVTTCIKmieEkyQlTUiUCzyerQQqijZ9E1+hmRY=;
        fh=B474tINvBy4U6CIGna0t8Sx/4wgBHL3wFMHQqyNiStM=;
        b=CjQBurAD4ubCpsxA/ksduI4WF6OvT3hAvqmwpVYAqGF1BV/R2MStMY7fxVHlfFCgnz
         trrYAi/IR+zhtk0NJFFqqG+pmny7xDOevBv9cqaMNXuGoarxvl8PaVc/DYBZY4Onk1HQ
         7U5kR+CuDi4Kdcejh5VNN/BrrJvAM1FJtJGMjkbFMFNFhw3GRxADGF/Ysr0vpF8A5bAq
         2F9HQyufV5KUnwEcc0Qc32hUlaSQ189iQBrN8MaMIVX2427jOsW+dveDH9+JPnycI+3X
         WpTNhNVruQmPessQKwLX4LaojV4TaV1Q9eF5R6E+g3syLyyb3WlIJLrVwmFQYEGPR+J6
         WXRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kolivas-org.20251104.gappssmtp.com; s=20251104; t=1792373441; x=1792978241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzgjULVTTCIKmieEkyQlTUiUCzyerQQqijZ9E1+hmRY=;
        b=AzGOECp7sUQLNUIK+uR2nChI9X8XYcbsdoKraXLiPoZOCASA0qRurlR6730CYTdEB3
         BVuhqcW38ur/iBm0xlaJWEf3HP7ChpRUwr7F18UnrcW8ddA7yq7RPxh8lIoxjLpwKIMU
         1T99WKkW9SRhIS7mdI+5J/MJHIl0Z5EF3T4OTotHnlY2cPlyIRAOFXO53FzGsM1DGXJ/
         jKS/0hw4DpTnOhwMD1S6afSRGST+FxozRJqdCdpnDtlWL5WQzegRxj6t4Vn1dyHi5vk5
         E4LWU8umCJyJTc76vPnXF8CNuaQ6Ez7CGzAL64GtHq7glYt2hvpkEwx7e51qc2zKtgIR
         BdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792373441; x=1792978241;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzgjULVTTCIKmieEkyQlTUiUCzyerQQqijZ9E1+hmRY=;
        b=yfBC9NsB3OlALA+cwit2f/FKLypajSGDQLdwJwAz1iu8BViJwIUOdcY5To3K8D7nkt
         iKorxuUBYp1SDP/VBXprOORSUbOt0YC2GmdHVslcqWwhN5WT69LjSk3RuplbYNAIOdFn
         MkJ78+4IV6KwGV8n15TW+GWrow1BiNomjLPK7nWvqjoKjCplqmMVeqjEvuDvHaDgra2G
         9P0trakwvvx7ZDp0Cp917cfTR9Mw4gmkhtHhL9FYP9ChRZzP9lwKWzz8AdOU4lvgk7mb
         Ou7ApyZo10zN9Nh6YM90PVOszLYnxzJgXy1JI55lKLWQpd/tOpnh4DqyrdkUUbMGOxi5
         OuuA==
X-Gm-Message-State: AFq9FYKszhiZJRqz3YVLSnKaLQy2J0YnggXMtPH8Vd3Aa4TQGTQ46q8y
	nzEpy1K79GFDusWDriORvv2wUmiIAOdqQC4MGECQx0J+oPRJUHWAR4DT94B4FCPR+3nZrca+Igg
	TtpSsN8pxS7K5yfp9APUBSaexeJK/tKohHZ2D4dRFR3qMUvbq/de2Q63d
X-Gm-Gg: AYBFou2tymmPj2dv6BuBGyJbR2Si54/yUbjUyNQeKZKxyTgdBfTJJuFyeiaZynW0SbG
	Bc1skXbVjnkQo6CgGDx/x/VHmbznp15Wx63usTkcz8ZkoOHIeRAzT9qXAWysumxnA8TiSzmfs24
	9bR+olaEnPzf5MDhDPt8Qzw65YrXE+ZlhBS90I+1Ts7PY23snDxiQrl4WH7GhNRyL0z87aXL3Aq
	nC8P8AMPSVRwWtpHjokAGwdTSCp69cK4jBPo7koUP9Y/JXFFRXE36hAwVlDcufgCGl3xGe/JdOP
	CppiGAtT+OXsO2QJwZ1KyIqCWYVuHIb8zCxMe7MLP3PmGaIr5MsnHyoZpBnobP2FLzcPrG1kV2o
	+izODUoVjK0oSjPJGjYBvgxh9EwWiLKxtFseyAPqW/+0eGUsfNtMUSjShFACDda/TEFc4TPUPc/
	RLYAxA/yn26+IHk4+r1ke6m2pbnA==
X-Received: by 2002:a05:6870:d887:b0:4a2:443e:d9bb with SMTP id
 586e51a60fabf-4a757a0dbe9mr5337490fac.46.1792373441344; Sun, 18 Oct 2026
 18:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Con Kolivas <con@kolivas.org>
Date: Mon, 19 Oct 2026 12:30:29 +1100
X-Gm-Features: AclHuK9LWwUWmioAo2LRpMhld4431Bc-NISs01nD4yhhozWBCG7UX-48_5rxPGA
Message-ID: <CABqErrFQEpa_z6u36oX9-aL9CTV4Y_g_k7-t=p=We-btf1TcnQ@mail.gmail.com>
Subject: [ANNOUNCE] Linux-7.3-ck1, Mulitqueue Skiplist Scheduler v0.32
To: linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The -ck patchset aims to improve desktop/mobile device responsiveness,
interactivity, and gaming, mostly by replacing the CPU scheduler
en-bloc with my EEVDF, configurable runqueue sharing, MultiQueue
Skiplist Scheduler.

 7.3-ck branch:

 https://github.com/ckolivas/linux/tree/7.3-ck

 Tagged release:

 https://github.com/ckolivas/linux/releases/tag/v7.3-ck1

Changes since the last major release:

Updated PSI accounting  for better I/O tracking
Fixes for obscure hotplug scenarios
Removed last vestiges of Hz dependency in muqss.
Dropped default Hz setting of 100. Anything is fine.
Dropped default of idle ticks, full dynticks is fine.
Changed minimum timeout for highres timeouts to 100us.

Shortlog:
     Add -ck1 version.
     MultiQueue Skiplist Scheduler v0.32 standalone.
     Add optional I/O time tracking and scheduling debt addition for
I/O & kthreads for MuQSS v0.32.
     Make preemptible kernel default.
     Create highres timeout variants of schedule_timeout functions.
     Convert all low value schedule_timeouts to their hrtimeout equivalents=
.
     Convert msleep to use hrtimers when active.
     Replace all calls to schedule_timeout_interruptible to use
schedule_msec_hrtimeout_interruptible.
     Replace all calls to schedule_timeout_uninterruptible to use
schedule_msec_hrtimeout_uninterruptible.
     Don't use hrtimer overlay when pm_freezing since some drivers
still don't correctly use freezable timeouts.
     Make hrtimer granularity and minimum hrtimeout configurable in
sysctl. Set default granularity to 100us and min timeout to 100us.

Enjoy!
=E3=81=8A=E6=A5=BD=E3=81=97=E3=81=BF=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84
-ck
