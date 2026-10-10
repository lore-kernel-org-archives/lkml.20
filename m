Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037B364927
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644662; cv=none; b=LEMCH7EP1vwgVNJwYExG+PKEGtPJkm6DLlOdDXe1Y8tirGv/0kugokcYTfTUka4iBvrHTb0qiXRdPBrzVmfhz7d+x04Zhwrjt/RbcECqS2p70kOUq2DJRacx8BdSKCvcPmWWom7fV+UMD9itdFHDl8Hu/9rwKdmNxU3R4ZV0YOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644662; c=relaxed/simple;
	bh=PqwoKExF7hzuaQAhCxVdphwaIay6TpBVh1ij/ZVF6Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJ75FMiZi1yN4JYQfk9UU/WbtMjbBGsy3mhY+wvQlmbjd/DxvRZz6VjrCd7mYyrbBdBx/LO0Mf3gb9DYeZE1xBh5yzPVj8qT7hu2R7FFNHmdCRBKHCpuPUT+q2JHuXR1vbXT84jn3AZtOBKyXpPy1bMBeC4phuMWxRDcLuqml6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTnWsUz3; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTnWsUz3"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso467907b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791644660; x=1792249460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqwoKExF7hzuaQAhCxVdphwaIay6TpBVh1ij/ZVF6Y8=;
        b=jTnWsUz3LBZ7qn+tfSsph4akMkZVsG0Nq4p0l4yGrScYyOH6vQTHoRbKVjsDZCCfIg
         ePC2tLcN2cqx30ta1rht4PS/DgIqkibDmJkMjcoPto7UBjZvWnB60OhlbEhC97sqDhHm
         tIq7QiohAlNKppaGEY1BucJ77PztsGedudgcsLzYvSXccZYYFdcg2ceKKL/KH3ZdzRvu
         iEV4RsIa7d2xYFo5W4ojk5qDSXiVc6BXLJhPRv4H/+sMBGFKFA3BYzY8gXcG5mAT++RT
         x9tGe8rcxZwZodvXVj9RooL00BddEp5tlaavq/18QI6r9R9Te9MJ9EN6U9MznBwnuZ4L
         S8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791644660; x=1792249460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqwoKExF7hzuaQAhCxVdphwaIay6TpBVh1ij/ZVF6Y8=;
        b=NaTNeigOGZaDIAnhzbOuNazwNh9ny6i39/8R2vBQsSfYgkXzC9Xhde45vWmu1eEax2
         jqB0fEpoQNlsS2vR5kOve4qHmeBsscqTSjlgxOiD0WW+rUpCELbQMcEHKeSkZY5YkmOt
         QzKG/srxcAul1CRSHm9f6QAq9VgVxh9bGlZ+0IlDet5/ERytMoEQnbstaerog0KPiEFW
         dWpUZHrvCrqg8KRFrMNejw9FZTX+kcBGCKEKSjT10fGdE98gC6SjT5/wbrZy4rsKiJ18
         lVimeGS13naq3PblXZ46Rt7mOui+pgv+WLmupVuPiNkzpazycp59jObJ/+umicEkKX4W
         pjqA==
X-Forwarded-Encrypted: i=1; AKwUvBwdYCn4lTemmdZglOHgxdaNsfFpFSMhdHCkD48Z4DqzFvgzSAX6LoLUxP1tUq5tpQIlN3ihoc00CNVODSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL01n0TsWctpne6ZAbmDyRYJBEWQoxK/8ihIe3Oat5MNvQVwUH7
	3SjVtN5mQQIjXEvMZi2m0KtlpybTBenljRc9EjT4i5z3BwHsA3mHQkxH
X-Gm-Gg: AYBFou0/GGIbJiwOJUxGn+nmKMj6mAcCwBaM2BYn5tKz55jGBkbvPl1gEKXvP9+b1/J
	+EpmGAKymSRi8epsjuXgJ5oeBQ3QRj5ihYQTgO0P5I/CozB+X6oh2gk8e2EiYRRuG0Jm/9e5wA/
	VGWGXfUEaSzyQ9rxUJCgXzKNkLIg2LH/BBmijOZproDdikDsEivH7UOuwi7DkL0bm/GMTZDMqUG
	uQzTGWjz/OLlAt4h5yU7qbIaWxTwner3flrrLrPGCBaAdW4LKi2sZafrPFb7OOqHThFNG/rJLXL
	4cIGLCQS2erJctvVqEeLSVSc/+Sie8oi/QjbRVJcFQfm83edgp4t1DV9TFvXmtH9CNV+fqKcDRU
	jGqHGZKneHY6R7JVFbVfJwb1PqJcOGkd3YEaCimTZHg0l7s8sUrf+tic5TW7yeX1rcmwC2qnLa1
	qVG6pzxEyMniNNATU/URl73Am+uaq7VzF4brQr5Qm6HK883WjhR43XRTILsqyKJAtCVbzR/A==
X-Received: by 2002:a05:6a20:bea6:b0:3e1:5481:5457 with SMTP id adf61e73a8af0-3e16bde44c7mr4299571637.31.1791644660094;
        Sat, 10 Oct 2026 08:04:20 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:2d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c42b06e9sm2252836b3a.42.2026.10.10.08.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:04:19 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Hillf Danton <hdanton@sina.com>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	syzbot+1b129b44597a126d2d79@syzkaller.appspotmail.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH] drm/virtio: share one vbuf cache across all devices
Date: Sat, 10 Oct 2026 22:04:13 +0700
Message-ID: <20261010150414.16953-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 27.09.2026, Dmitry Osipenko wrote:
> kmem_cache is used by GPU drivers to avoid kmalloc stalls in a
> latency-sensitive job-submission code path.

Fair, I'll drop the kzalloc()/kfree() v2 and go back to v1's approach
(one cache, created once).

> The /dev/fb reference doesn't sound right as normally removal of
> framebuffers is required before GPU driver can be unbound. Such bug
> reports should be treated as invalid, BTW [1].

I went and checked, and the /dev/fb angle isn't actually load-bearing
here: two virtio-gpu devices at once hit the same WARN at plain boot,
no remove/rescan or held-open fd involved ("-device virtio-gpu-pci"
twice on the QEMU command line). syzbot's repro happened to go through
the hot-unplug path, but the bug is just "a second virtio-gpu device
probes while the first one's cache is still around."

I also owe a correction: my commit message said
kmem_cache_create() fails and the device doesn't probe. That's wrong.
It WARNs and still returns a cache (merged with the existing one), so
the second device probes fine either way -- I'd just never checked
that claim against the actual behavior of kmem_cache_sanity_check().
The real problem is the duplicate name itself (confuses slabtop, per
the comment next to the check), which is what syzbot and any
panic_on_warn setup flag as a crash.

> Assume the similar "duplicated" kmemcache problem should exists if
> there is more than one virtio-gpu device in a system. I suggest you
> to validate this case and if it has the problem, might be better to
> make kmemcache's static instead of creating dynamically.

Confirmed, and agreed -- I'll send a v3 that's v1's static
module-scope cache again, with the commit message fixed and the
two-device case as the primary trigger.

Thanks,
Nguyen Ngoc Thang
