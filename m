Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA14189B9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106520; cv=none; b=ZAAcG1mMaP1wZL72fUyrqOJsJknN2DrQy+cIFeONRXULvT6ItWF35ipDPxgdjXqmnNHNqFPPchf1bOOHr+2Knol2dLZV43WWg7lt7Gz9LpzLZpGBgyN0oeChPwKqHZCNg2w3MWYkh/DOYKSlRFDWN5O1Kcnux/1RdiHWswpgN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106520; c=relaxed/simple;
	bh=YC9QBizNqxQpPlezV6L886RusmNNkXZHsgFDQG+2gGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1qdy3KGHN0g/1EsHd4xbVuyc7md1GGLvOd8E2x5etD/iQL1V6AqJ/2AYrw2PBf5sN/RmJq5sAOoeZYUAf0Ezan20eQomXdNYu3uv9ESmpnfLvLyv/n9uTRAQqv1ag9CkyHieDj7h4OfylujN3PyT8fwNPx0VmGeMETHhBqL4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIIr63fP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIIr63fP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso25657a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106510; x=1791711310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YC9QBizNqxQpPlezV6L886RusmNNkXZHsgFDQG+2gGU=;
        b=CIIr63fP9h/9n0KDlFSfX7vEhC9Txa3dOY2q4UaMcN3y/3VPG2Ep7Bou6VB9Eo6VDr
         L3cyWaTDQluZNTncFstly6ut6FReEjikiV4XRrEtDaGHxqI8WJc83vwq9mZnhqAXoKGt
         Nnri0FndfQ18uCxuoJpBjyx6oRq9OObQb6oGJ/01YOKj7QvYIdkXEzfYxVcf9/d/Ofgt
         yC2GwGUwbPiBkmLc9vYeI88VZi9kk3N9qCcvQ8s1XsnhPjvDszSePjifs9qcSZNl5xp6
         yYHALk+jK7DGD4eHF4uKfh2OejnqD2/RrqI51Gy3sBYnOQo6OYA6zAsdhACaj+XztwjR
         yR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106510; x=1791711310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YC9QBizNqxQpPlezV6L886RusmNNkXZHsgFDQG+2gGU=;
        b=q9WqG40PXuO2YoiFQJ9QEGIGiNNsqQnmxCcTqZysRxJb2w9aCCXKHjBE+cZbeML3gY
         WKDlFU8KwP+IrQuKlFgYAYYn+a7LkOkGX/GwTWlMmfIGVTlctp0GdfW3rz7eH4Al0azc
         hSGLrLXJn7AXXxKkx5O9PKBKsSkCSn+67JLgevSHwG8V8rnoGw2B0gRwoShB984U/ZmJ
         qDSwWjG6VseEF3suB72UnbL/rM+APzpRxS9/BlSaF4DdDUChQonumKo/ik3U6Cize+ny
         Kk8AkxopFBo5VORMlR2s/gMAgAVh7/u6fqmEIgK09RMHP2W5ANdX1OkH4KLnBrspNpIh
         tLUA==
X-Forwarded-Encrypted: i=1; AKwUvBxGfHLUml+zHEEC6DYU/TJWiYDdvMegW6/wtkytZGOHVE1fWjlLAFeVtmBnvl59zaCYEdc3SMxxr0RT14s=@vger.kernel.org
X-Gm-Message-State: AFuF++kFoISV7ij6hwxbGGe75mUJGlmvqXm6/mMDuJfbz460lYaXQOko
	sSia17Z+PzVRsy+6Pneo6QMkXPXRTMqzcGNQ41loYpaTm/TeXy2YT+i0
X-Gm-Gg: AYBFou0pBeJ/E4SEbnxfEt3sNKSXjCUJ1n0m13lxTQgoik76FYzrZ7ArdrUcA4q5pR9
	tYOzeXhCzHnz84mpo3cy5jBreUBcUXOo1IF7ShLYg3RNlisKf4AUDZhTU8oVCDDOPBH2kJnPVSi
	rowgxcKbYhtH0TP/H4yUjA6ugTi3CBccWcd2D0PLBtXxuV6c1x3beNh4naCWUNLAFT71cOkFnhp
	Fo5nXZGvET6PTFbR9LjA3bztEjYbajNypzr6OIc7Qxas830S5DjCs7M4FU3hkPCAj++W/m1DFWC
	ZGjm4oI76Gm9tlpKUOxKTmOM1Sm7CR5DUxiL0vbCAw59nJ2vTf6VU0NQawxrsQOAg7EI/2ynLyS
	QeNWkpfbk+3UdEpLsDGSD++m5fj7Yyk7+HFrVCKfM7nhR5W0NLj5J//EKdcmhZ1i+/VCnxy67V+
	OVnn2l009OY3gXcEl1Q9ENR3Dn48oGGcQMUEfn8skMSdoYyn6IoadyXLjGytniWqP//P/nB8fFS
	FP18kgf9GTT0Q==
X-Received: by 2002:a05:6a21:4d0c:b0:3de:b120:bb93 with SMTP id adf61e73a8af0-3e0d698a377mr3925501637.1.1791106510339;
        Sun, 04 Oct 2026 02:35:10 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d363265sm2394911b3a.60.2026.10.04.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:35:09 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	ds.heine@posteo.de,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: glymur: hard reset on the first system-domain idle entry (SS3, 0x0200c354) after a heavy load - Lenovo Yoga Slim 7x Gen 11
Date: Sun,  4 Oct 2026 18:35:09 +0900
Message-ID: <20261004093509.74316-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260914094648.14502-1-okerixx@gmail.com>
References: <20260914094648.14502-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A data point from Kaanapali (SM8850), which has the same domain states
(cluster 0x01000054, system 0x0200c354): Lenovo Legion Tab Y700 Gen 5,
v7.3-rc4, PSCI OSI mode, with the CPU PM domains split in two cluster
domains (CPU0-5, CPU6-7) under power-domain-system. With the single
cluster domain of upstream kaanapali.dtsi the firmware rejects almost
every domain state, so this does not show there. In short: we see
silent resets from plain idle, and here they follow the cluster state
rather than SS3.

Symptom: a silent reset after minutes to an hour of idle with the
display off. Nothing in the printk ring or pstore dmesg; the console
ramoops only has "watchdog: CPU7: Watchdog detected hard LOCKUP on cpu 0", and
the watchdog bites before the hardlockup panic is printed.

Keeping SS3 out of runtime idle first seemed to help, but the resets
came back with SS3 never entered at runtime.

An idle-entry recorder (per-CPU ring, records cleaned to PoC around the
PSCI call), read from a RAM dump, shows the lost CPUs entering CPU
retention (0x4) around a cluster 0 power-down (0x01000054) and never
returning from that PSCI call, with IPIs and expired hrtimers pending.
In one case the last CPU, the one requesting the cluster state, did not
return either. Most cluster cycles in the same window were fine, so it
looks like a race between the cluster state and a CPU entering
retention.

Refusing the cluster domain state at runtime: 3 h idle without a reset
(562k cluster-off requests refused). Same kernel with the state allowed:
2 resets in 78 min. Screen-off idle power did not change measurably.

Is the cluster state (and SS3) meant to be used from runtime idle on
these SoCs, or is there a firmware prerequisite we miss?

Not tested on linux-next with Ulf's CPU PM domain series yet. I can run
patches or collect dumps.

Thanks,
Joonhoe Kim
