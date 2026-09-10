Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E11493D46
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047387; cv=none; b=Nn5BwbFeGoIE1/fpfGd88oHtwY8OdM/k01b5OpkkyIFt1Xm5dz3EyihgWI19WvQyY04GbkGVyfzfKbxQpw4JDBk63bHUt+oSpNbewBd8xvm04RTF/FIgRF12uxOctrrtwlr6w+DntEwj8yWBgse+MhwDQfNFLi0uZm+Qx4Dtc3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047387; c=relaxed/simple;
	bh=+4iM4U3rlpB5qU3SWvVTG5k3eSEF/qs6b06dYl5QYbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7FbghZs7M3ZIke+zBkNXygixqC/MBCmxf+kUnw3oS4t3zuj/F3C2nloWUCUvWbMwHibWzws+UbSg0aeoO5VQry01Rz3ohj6XLI/NgLer20IMhAQbfe99nt6ouvFTZ3C8VOZyr4/b+sQwHDmKPXWY4TmXfegB4KH5uNpRlbJDu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1ImOi3o; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1ImOi3o"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b93204449so4250905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789047384; x=1789652184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdfNZLHoTwaSRGbzkk1xRxTbtBIxs9oY1WLjA5lMVdw=;
        b=R1ImOi3oh5ELpkD/0x+Yr9moIbws8n7fAc+0OM5SgCSwW3UnayZljJTnOv2TwpPDfz
         PfJG2tJJF6PSJJJvmrqlKxKbK/bv9iIIRFfB+HO1GeVx5Munci28tBa2nnCIytyJ9QLX
         csBidaibVTnu/7RzSqNy7y3Zwk6AHGaJALjMOV48khvrGBPMDwCPoEHF0MJ9V/arxEou
         qviuOuxPohI/Zm/tlXTWnkGMxxKSCncev1V3L+bdXLsgobQeE2L9BgCgu3961VU42S+g
         UMFoCL4n+N2ZTy7Iuels/QLwRhR94ae3+P4aWXAOMjzgQK8mazj2c7S0SSWO9BimLQ+i
         MmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047384; x=1789652184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdfNZLHoTwaSRGbzkk1xRxTbtBIxs9oY1WLjA5lMVdw=;
        b=CRBPkZCOjABWrCeuGsFmNc2uruQxE9bxAOj55sH1il0kP16O9WURV2u9MgvP+fkisg
         55+C1ql8PTezat3E4BfWzAgHjhZhvfR5FoC9OesTo6lE2k6QyL2Vf5aTbd0H1vDJp3nO
         OLlsT42iNHVRalensLlg6IuOcwXSUMfm9UNG5/diNsgs/RLpG/QT03JdcMiBrm1dfYoA
         jpQ7Fm1b3G+WMEUgvd9JjZyCIqZS7BtdZc1/Zv/uI5cdQnKL/ptAiAmCuxybV42Xbg6+
         f9McxEOj50+Wg/sBhEeUkx0htISBfWPOF96R8goV9SDKjIYfbo3wFmpRFM8nkv47X/yD
         Semw==
X-Forwarded-Encrypted: i=1; AKwUvBwiwFc3BXGHkzUfiLNWu0+DebnnO0xptDH3iIP1cI5VDBbCo06BgzpXgAtzHmrxSYfWhGr5/yOt3EE7Kc8=@vger.kernel.org
X-Gm-Message-State: AFuF++lQkCza+T/iUwly9AkzIuPbx5WElmvSeonIDLnvJ7YdndfM6IvO
	6WXyi8LY+akOaoJfO+4RoEgidsSz720fwXgGBeRSqixxoo22NBJF458s
X-Gm-Gg: AYBFou3ih1ogBDkSu+41kzTCrtbQ+NkLrVV9ChbZTfepY0fQtfuUqCIh2PTMLcBeOfo
	IAfi0LA252TaZ0NAHGtuLfL02fGbjF+SQGeyzWeNvWN3kFjN7445qWVekM96WzjqvJTWkcs6I3b
	pqPE8lo3ApenJFlIJCTq88AC4edflFaa+xJ49Pzo7RUdmONsLAB1h56f0Wdb8CAtqj30Ia7e3bS
	ZOxm1aZROE4Ew908OL7SLCiHGkvjA87WMRZ8BAg2fyDjiJR8SOR22AndAtwWmUbj7wvD27G6RG2
	1Uv5CXO5Nk/wMkeIb01xMhRZOt/6dQ+pqhSEWZZEcneHCVbYHGDJ5mrvjKAKiIt9S79TCw1yuR9
	EM2utU3t0h1IrjPzSpQV4MIF6uHutgPuGjDMilPS8VFDfts2UB2EZ0/P+mXXJXAwS0mByvy8lyy
	8NDimG+pBl/5N745chLmtc0JdFknNhJNgUyzSiUiuVxHnCLnodOjlPZjHwUloa8EPRy+6wdSa4P
	2q4+FHIA72PKvycc1y4qBzQs1mvIaCpTU/n7D7BNqnXE4eVAmc5s1dTcFZj1xdZRXC8o+no7Vzq
	HOGFNcZShdjPxTM=
X-Received: by 2002:a05:600c:530d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49d01dce86fmr310949945e9.1.1789047383351;
        Thu, 10 Sep 2026 06:36:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B914600506D8644FC6130D5.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:506d:8644:fc61:30d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm77721735e9.1.2026.09.10.06.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:36:22 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Owen <support@armdesigner.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/rockchip: vop2: Scale the AXI clock to the bandwidth the mode needs
Date: Thu, 10 Sep 2026 15:36:02 +0200
Message-ID: <20260910133603.8993-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910132156.07D6B1F000FF@smtp.kernel.org>
References: <20260910132156.07D6B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/10/26 15:21, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does calling drm_crtc_commit_wait() here cause a kernel warning or potential
> deadlock?
>
> According to the DRM Subsystem Details, drm_atomic_helper_commit_tail()
> and its variants execute in atomic context where sleeping is forbidden.

Both findings rest on that premise, and it does not hold.  The commit
tail runs in process context: drm_atomic_helper_commit() calls
commit_tail() on the caller's stack for a blocking commit and queues it
on a workqueue for a nonblocking one.  commit_tail() then calls
drm_atomic_helper_wait_for_fences() and
drm_atomic_helper_wait_for_dependencies() - three loops of
drm_crtc_commit_wait(), the very function flagged here - immediately
before the ->atomic_commit_tail hook.  The default hooks block in
drm_atomic_helper_wait_for_vblanks(), and the CRTC atomic_enable and
atomic_disable helpers run inside them.

The wait itself is what the core asks for.  From the drm_private_obj
documentation in drm_atomic.h: "Drivers should store (and get a
reference to) the &drm_crtc_commit structure in our private state in
&drm_mode_config_helper_funcs.atomic_commit_setup, and then wait for
that commit to complete as the first step of
&drm_mode_config_helper_funcs.atomic_commit_tail, similar to
drm_atomic_helper_wait_for_dependencies()."  vc4_atomic_commit_tail()
does exactly that, followed by clk_set_min_rate(), which takes the same
clk prepare_lock as clk_set_rate().  The wait is on the previous
commits' drm_crtc_commit, never on the current one, so it cannot wait
on itself.

The pre-existing note answers itself: vop2_crtc_atomic_disable() is
called from that same commit tail, and the @atomic_commit_tail
documentation says "When disabling a CRTC this hook _must_ stall for
the commit to complete."  It also calls clk_set_parent() and
clk_disable_unprepare() there, unchanged.

I suspect the two senses of "atomic" got conflated: an atomic commit is
an all-or-nothing modeset update, not in_atomic() context.  There is no
might_sleep() or context restriction on this path.

Thanks,
Igor
