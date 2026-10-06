Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814013D0927
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274201; cv=none; b=VIc8mioNEmkYBdbkioVao7WuF5QgU/ApQpFTFPt2hFOkvQfqr9c64JVd1v0zVxgHH5YWvn9eJKd7zWvA5sjOa/EwHV48KuRjvyE68Wec5kv7RjpbwJlE05M/fDB/TV4qMOaVKF13l8XiuZ68k8gOVsLPuDqFYTaudMANSsoyrcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274201; c=relaxed/simple;
	bh=h7DkrEnTmXYBw92lWxH+CAJ0i2zr2mym9tch2Vr281A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVNS9tiUqkbSOGud9WbMLYt1NF1V/bu2PKZrrtGhQwG3u+Z7kRI4AlkNaHmJZaySyIiF7DS1IMCnF+UUIWVY4lPnD86WrAFGRGA4DsUkIhqs0cW5IL9a6ZNwiCmuc7u+LzFJCQ06r6YgggVzAY1oxYtGf8zrrSxKmPZw5fraT2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hha6RA2L; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hha6RA2L"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so175454a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791274198; x=1791878998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Eok7DWYmFOkeuFX4U4OhvywDDaFg642GCVXSSU8R3s=;
        b=Hha6RA2LBmSVA75PCZKaLc8XZusOQqgKmBuN4LLG2vBKBs8cUU6lkp/y6byLxq+U/l
         85LJpIwTOU3SEO4yLvxQt2r65jJe6ixBdhwN20fcW0V8a8IWOPqcNEbXq7GYcCklyi+m
         UD8cyxJF6jcC3ftgWsdIUgv8+Gzv1+or2cSmL0yC+P2zYwliuM2TAsMIdXpNEedYu/Fx
         qwgdBe3+MespUbF5VgP/EtvIryuPBl0ofeT8n+pmP7OcFlsZwc8NJJi0JetOvOoHyqze
         nPtqr/FvsIT3EYib2JyVfoo6esDxT956dbA8Y9tXWizGpYUCJIRaPalVtdGHBl2A/ev1
         W+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274198; x=1791878998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Eok7DWYmFOkeuFX4U4OhvywDDaFg642GCVXSSU8R3s=;
        b=SnKhsu62Lo8R0SbIH5jVQEPqEPPTHplK7wa4Nxg2S+zI6hM+AX3lV/vyic4XS+R5uM
         pfZxugiNDoNF5mCyjWVKr0hpks6mJJ0DdJC9LQxaJjS4xAalukedkchYPz4V82TWuDrz
         kQmStkw5C35yncx5NwENUU+PxbjobJLiKimdqFLivjgkZkbHsu2Pbf1s6AYAwYZDXY5Z
         sMx/Jq+8eMRC2oGF1y4xn/CZS+Y/ckvNEAUS3DYY43jDXDlqTwDfcWMic48eF/dd3GZL
         pAkXrhYM15KIXGi/TvdcO2tX9GTBiCYqsN/iL49q/ra4XF7zmYwhtLgqAPc0qa1B2hHO
         064w==
X-Forwarded-Encrypted: i=1; AKwUvByeqmt8NPtdQ4LZXdojIq/oqptyPer27C/ktXCViN7yI1WF9dDROIqD40mrzM47oYO6pUL7+dX8Sg5Ga7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfxpOOxXrH9Zpp/Ct1Xmb+BS8pXivbgINKgdQc4QVu/RTVh0wW
	napmqOHecHfpzsss1lmTX6t39g5oKFXOGPbRgUTzqNrzGOxPJCgNyGj0
X-Gm-Gg: AYBFou0h7xfxq9uHGuuDJcGGJYJeMOLAtyg0QldVGEfCVA0/Z8p2VE6pd1+GAxMslwG
	UppM38YZ0eywAfBdiwbqPelW3ViOGOhlhxETL9t5FIaheueI/F28ijVD2usz+xwBaOgZ070fiDg
	dDxXvi/ZwRjX0UnKzf8xCtti8GlktaTx86dxBe6wjrgDYV38wVuXl8iLkb2f32qLgyTQtYSpsOv
	ZhTmz5yuQ67KJIwUkFd8qDlKulpEHXVzU2ammklsZwoLy2wr4ZhVvQ8lXQQ5QZDkneY2Im9UM8s
	fH6T9TV6CGdqibXcjaio5YBzcxBw1uJa/jdaMAfhONr1N8YKP06KBXJk/98x+zh1jMZVgqT+qO2
	akOV/I6P+66o2JtWw4oFOZnNqwFEwiliH9Esy+5vjYkSDl+prlAa2gUyf+9enYhuoKkqCGU1X3A
	JwxSvFWpzT9zOh0hhQQ5QUrmF7QC2eFofqcy+5U7BNv+DmTsH40cU6YzHkDY7D0VkI9QzFlE2wW
	osXs6Jspd6WvZkTdOelVzZKT70Ge7v+TgF47ZVin4k4VuKuuLkx9i2u2gDVg+IqBm5yl1fip+/1
	wlzffW5zp7CGibM4IV1MMRqaFeXcLanIE6FPjYPeOy1BFpM=
X-Received: by 2002:a17:902:f602:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2e5dcd9093amr7496675ad.14.1791274197752;
        Tue, 06 Oct 2026 01:09:57 -0700 (PDT)
Received: from 0xiviel.ip (122-63-128-121.mobile.spark.co.nz. [122.63.128.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5ccdd1f8esm6046185ad.83.2026.10.06.01.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:09:57 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: yidong.zhang@amd.com,
	quic_jhugo@quicinc.com,
	karol.wachowski@linux.intel.com,
	max.zhen@amd.com,
	lizhi.hou@amd.com,
	ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: sonal.santan@amd.com,
	mario.limonciello@amd.com
Subject: Re: [PATCH V2 16/20] accel/amdxdna: Finalize runtime PM before acquiring dev_lock on removal
Date: Tue,  6 Oct 2026 20:13:10 +1300
Message-ID: <20261006071310.198186-1-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006042230.547807-17-yidong.zhang@amd.com>
References: <20261006042230.547807-17-yidong.zhang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026 at 09:22:26PM -0700, David Zhang wrote:

> When the device is runtime-suspended, pm_runtime_forbid() synchronously
> resumes the device via rpm_resume(), which invokes
> amdxdna_pm_runtime_resume(). Because amdxdna_pm_runtime_resume()
> acquires dev_lock, calling amdxdna_pm_fini() inside ops->fini() while
> holding dev_lock in amdxdna_remove() causes a deadlock.

> -	amdxdna_pm_fini(xdna);
>  	aie2_hw_stop(xdna);
>  	aie2_hwctx_sched_fini(xdna->dev_handle);

This is worth more than its position in the series suggests: the deadlock is already live on shipping AIE2 parts, not only on the new AIE4 path.

On current drm-misc-next, amdxdna_remove() holds dev_lock across ops->fini(xdna) (drivers/accel/amdxdna/amdxdna_pci_drv.c:457 and drivers/accel/amdxdna/amdxdna_pci_drv.c:463 at 34e9ab018249), and aie2_fini() opens with amdxdna_pm_fini() (drivers/accel/amdxdna/aie2_pci.c:640 at the same commit). pm_runtime_forbid() then calls rpm_resume(dev, 0) synchronously (drivers/base/power/runtime.c:1672), which lands in amdxdna_pm_resume() and its guard(mutex)(&xdna->dev_lock) on the same task. The base wires RUNTIME_PM_OPS(amdxdna_pm_suspend, amdxdna_pm_resume, NULL) and aie2_ops supplies .suspend and .resume, so runtime PM is active on aie2 before this series adds .runtime_suspend. With amdxdna_pm_init() setting a 5000 ms autosuspend delay then pm_runtime_allow(), an unbind or rmmod more than five seconds after the last NPU access hangs holding dev_lock.

Three things that would help it travel:

* Fixes: 1aa82181a3c2 ("accel/amdxdna: Fix dead lock for suspend and resume") looks right. amdxdna_pm.c had no dev_lock when 063db451832b created it, and 1aa82181a3c2 adds exactly the two guards the base still carries.
* Cc: stable@vger.kernel.org is warranted, since 1aa82181a3c2 is in v7.0 and later.
* Could this be split out to drm-misc-fixes on its own? At position 16 of a 20 patch AIE4 series it is unlikely to be picked up as a fix, and splitting it stops the fixes cadence holding up the feature work.

One question: amdxdna_pm_fini() now runs after drm_dev_unplug(), so pm_runtime_forbid() resumes hardware on a device already unregistered with its user mappings torn down. Intended?

Eva Crystal (0xiviel)
XSource Security
https://xsourcesec.com
