Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596849;
	b=HDnJJp53vjCmwnxDklaEui83uRJMqw/uDlQabpftULcDfu3cdBLTiYZnrj7j9soDDZe5
	 N2F9kS9qOGMoQPs60VdpdAYlhmYkaYka16GaPoucndmy7aLQYGddHozLy+To489vF2SpM
	 E7WJ53QGuOVI1vrgowrX6rf80O7ZwsaS++tQjlcQvYlu87YdXjt6bwcqz5jz0zCR86YYU
	 JicZdab3xaZuzAYmCNzFEVpMF5tXv6kaCut5Cryaj83lks2FbODalkIr0HDHfXi7vPgz0
	 SAVoFaM+sRO19/qXWRI4+4Y3Lj4OdHcIi2cy5xmxr+fGgTLOeobguRY26HH5PJPTbiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TyKYR89dztucZkRvKJmuDPmnMeeGrPRrohNUsu403oE=;
	b=kI+QWYcIaOLUXUfO4DEiZJcwY8r6x/wnhdtk1/IusEoN/7fh0Bz8Yn/3qlfA1l2nW5f/
	 FJWbyanKG2qlMsHRRip+wX56fvOQqFCBFeMrLD2STprylc0PGSMmdGQyAdBM5TktpOpwW
	 f/iMxff+5K7BWEc2G++2jqK4ZOTcXXn0uAk2ax1W0IMjeO1ft+cFuVoYZiYdcwcIkf8TC
	 tERTK3q8SUgzD+xZqHuHG31JIssnjOsdxcyGJZj8GC1r7Pd+OcNq2uXBOXMEgvxRMkoVO
	 U9Yiv3UNzofoFPyetJEszM42SNrAjnr1yn61BAJjdLY5qwNAJxl9AYT0yxNDpcRLmkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AU6qxKFK;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48427606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48427606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AU6qxKFK
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc013095d4so281512137.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792596848; x=1793201648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyKYR89dztucZkRvKJmuDPmnMeeGrPRrohNUsu403oE=;
        b=AU6qxKFK000458g6qDLEkfm+daGWXEgCG77sG3qRRBhIQU9OhcWpyu8oy9KdvyMcFy
         G0GnBeZWBgX8xem/8YqpF7JHvGbjG7yVbNELyankfIi+MEkevtA5ws358jy4lZNdv7J7
         nn1Yc/PY7O7dPJigU1WidadFXJRcusuMtp9j6NrI37c24dwhOb23s3XZGFmd3q+Xvuo5
         FeypiI2W5mBXOGa4VWjK7QREkfg46rkhMMvAbyq7MSbUhOPKHxui4HmYl9KIxCGYQfj0
         4DlwE6fP6T1vJMnDD91wIYZ1unjkehlDQergt7GlKB/zdRKmESecboY90UT3TfuHRIn/
         O/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596848; x=1793201648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyKYR89dztucZkRvKJmuDPmnMeeGrPRrohNUsu403oE=;
        b=BKb3g9A/pqF843qEQV/70nkNqHOWl5E77/p3fISa2AXQNWaMFZA+uYvI2Bh9zsv/1c
         fh36wbxHhCutwVBl6J4V9pytj6/tl53kAzCmHVK3O1K+tjO30YAK7UwXYBPzNnUO/hN0
         YqeQp39PLPaVk/AVkEpqdn54Z85MS3h3nRB/1Z25oFUjap6uJL+Ok9Z41PPN5aaRqMEg
         E0/n6KmRJDH0+upHQCH/3qnAq2elg5q4kVqcsymyaPjpbuCNynCjh+Le1CVI6czn0JGF
         ICHW6QJPHsPVCp5bAV1x+eW8ua2dSNCQfQhOKikurcd6dwv9GNfkJ//vmkGQREn1odpH
         pB3Q==
X-Forwarded-Encrypted: i=1; AKwUvByf4zjNhBNT+7sDTqxOiaZJ0xRvznh9WHnbOKVB1hcSRE/ga/Dpl7/TH2OwR1R6AMbLybwQVNBgq4s2o2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYItbvOYGefnr0miWumn8s9cM76EWBqb0zf7ozAXYrtg9KfsN8gd
	iM7rXoPDJtXg4VCvXuSrO4ZdiAJVGx/fwK0YWLyK8q92ylpWlfhOBDjeUnr2DPgm
X-Gm-Gg: AYBFou164EevoRMgijAS+tPNALaZW1cdgWgFZsp979QO/yGOsO0VuJoVnxjU3bg2Xl4
	Oyq8YdalxboXwHfiAZBYR9cG/p6slYRTd2ZKGuUCzg3iwu5Zl//RnWDiJAohldGZFXKiALeVEtD
	/5iX18JqJ5s+WvwC0s4BsyOF9onY2EywVIn7gSJOpimN2cPsnMcoDfDfqtl1xgu/n53QIPKhw++
	XanSe+4SW8lJiX2LLZkQdIDHZ4uRVZ8WjVkl1lzzxJOG3/XE+86jV1nD442frIO3HnzrXsc7/zj
	j6aLElFK6l8SkmXQXf3aK5yddHZokasrAqWkBq7ZmWckYDs5Q2BJRDwEc43CWcpkPwJ3OgD7b7P
	7TvNEJ1BSCbjvooZK98rXgKtwmJTvOzAkZGGTJBERmUq1PpnnYBaKRVuXaZO0a3KyEfEXFcf2TG
	hNUbQBTJg3zoV5iOWJv9SOur5F3djMt4xYdyG4/jtcZ5iDXAPRvFLZZysoLQNrapYHuiiEN1k1t
	322UZYyHPhIhLkfkDVCrkNcVyy0NlNMqekrDuiUZfVap9qnEBkUiCO1EcNNrab9eYCBtwDBwXUw
	idaZLXdYBvUghghG
X-Received: by 2002:a05:6102:808f:b0:7cc:23e7:e743 with SMTP id ada2fe7eead31-7cc9263184dmr918810137.15.1792596848060;
        Wed, 21 Oct 2026 08:34:08 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.119])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc91f9c7f1sm3056156137.0.2026.10.21.08.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:34:07 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/radeon: fix VCE1 encoding on SI by handling the VCE interrupt
Date: Wed, 21 Oct 2026 12:33:44 -0300
Message-ID: <20261021153346.124285-1-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8c60afb2-cb0b-4aec-9237-2ea3404d2793@amd.com>
References: <8c60afb2-cb0b-4aec-9237-2ea3404d2793@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 04:10:04PM +0200, Christian König wrote:
> The fence handling on radeon should work completely without interrupts
> since those have been rather flaky on really old HW.
>
> So no idea why that actually crashes for you if the interrupt is not
> enabled, my educated guess is that enabling interrupts actually doesn't
> fix the crash but makes it less likely because of timing change.
>
> Would it be possible to just switch over to amdgpu instead? Or is there
> any support still missing there?

Thanks for taking a look.

On the interrupt: I agree I have not shown why the hang happens, and a
timing change is entirely possible.  What I can say is limited to this:

 - stock radeon: every encode hung within about 100 frames (many runs);
 - with the VCE ring semaphores disabled: no hang, but fences are only
   noticed by the wait timeout, about 4 fps (~256 ms per frame);
 - with the interrupt enabled and handled, semaphores left on: no hang
   in roughly ten minutes of total encode time (up to 1080p, plus
   several minutes of KDE's RDP server).

That is correlation, not a root cause.  If it helps I can test enabling
VCE_SYS_INT_EN without processing the fences from the handler, and run a
long soak test with two concurrent encodes.

One difference that may be relevant: on CIK radeon does enable and
process the VCE interrupt (vce_v2_0_resume() sets VCE_SYS_INT_EN and
cik_irq_process() handles src_id 167).  Only VCE1 (SI and Trinity)
never did.

On amdgpu: it works for me, I found nothing missing for this use.  I
tested it on 7.2.9 and on Debian's 6.12.113 with the amdgpu VCE1 series
backported: h264_vaapi encodes up to 1080p with DPM and runtime PM
enabled, no hangs.

The reason I looked at radeon at all is the distribution situation.
Debian 13 stable ships 6.12, where SI is driven by radeon by default
and amdgpu has no VCE1 support (that needs a newer kernel, which Debian
only offers through backports).  So anyone on the stable kernel who
uses VAAPI encoding on an SI card, here through KDE's RDP server, ends
up with a wedged GPU.

Since you are considering dropping SI/CIK from radeon, I do not want to
push a change you don't want.  If radeon keeps SI for the 6.x kernels,
what would you prefer?

 a) this series;
 b) disable the VCE semaphores like uvd_v1_0 did in 013ead48a843 (works
    here, but slow);
 c) leave radeon alone and just document VCE encoding on SI with radeon
    as a known issue that amdgpu's VCE1 support in newer kernels
    supersedes (even a one-line warning pointing to amdgpu.si_support=1
    would help people on 6.x).

I am fine with any of them, and if it is (c) please feel free to ignore
the series.  A v2 of patch 2 that fixes the CIK register issue found by
the automated review is ready in case you want (a).

Regards,
Matheus
