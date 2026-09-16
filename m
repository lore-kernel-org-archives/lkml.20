Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8ED22FDE6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529012; cv=none; b=NG62dtqceh825scnjMHE2qB5MViVQenabaLp8QbE3r1nVcj63q4ItY46Knkwci7PlPO6HQ8LyW1Hf8wnH3cAXv7tfb82wb5aJtyxAm1T+L6wzRNLvCTpZDHGNGmcqWGJVfd7HB/RJAhpSLQjtxAZxnkB3d7kjW+W33MRRUj2rwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529012; c=relaxed/simple;
	bh=TrzLPfR+KAgzlMAwafjI+5hk4I1lUOvqDQs4cIQ4O/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4yriITEivG+5TEh1q8j+FUoNb24e5uMlKFnGj3bUFCEVk8xPD3ZaWs72ad26GsIos3kt/+TiYiHqsvrL7Mu51VN1wIjQsL7X4hBd6Lw2vRFHFnNvDXRbw8RK1kGpyY+laYfjtCJmnE/WeMbqlCIslL6V4QYEAJ8vclzqNvLHXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThIEkb2h; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThIEkb2h"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so251846a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789529010; x=1790133810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwHmHA1FRE10MmPE4/Q1QozBv7QcaHa7GxmmDxgqyMM=;
        b=ThIEkb2hkyirCfCMec6AJVj2A7N/Ty6qFZ70qmvWjYLkhWWIFTUjMeYpjPNGWgBRH3
         QNpFKOtgfKvDE7aN4bBe6L3uD0mpRmD4JcPhssBt1UhmntkjeYAW7SddAKukvcpIYaz0
         MWlyQo+gYEGjRakdCku8VooV1/UvHN46xI8aajOArfrY+5AM/DbSt7qMTm9H704QTk3b
         VdFGUn8/f7aFrUPE3MZ9mQj9k7Ir7H+/vzzA/HhVxDD05UlBRxaqW44SLEcDd4GRKIxt
         EtaWqfhtqFZr07olj/fpiETgSGsyrUgLBDQX18j9J2NKewmIMWfHevY+BVEyO3Rb/0r2
         xfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529010; x=1790133810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwHmHA1FRE10MmPE4/Q1QozBv7QcaHa7GxmmDxgqyMM=;
        b=Qy3BnjEO+MsVRknDSoMEcfWuIqTH8uMTatLXhmKlzJE4mExQxfdjOSpu6Is4vP/zEB
         rZW0XbrAx7SO7K06fZibirkLjIIeVhKxASPLPZIi5b8G1EQ0muvDpJvULtvp3YOmFJgZ
         rDhHMh7QfUWGThuGtifF//wQRfajZE6+4H7idkN15rhut+uZUVDlqfyPyQknHVHJEvJm
         6+2eYVOqetXXE6QCnKIODsdYhNCFUC1hIVEF4ZCDJ6ho9Ed1/sE7JWxjjHO73QgpGVo9
         sFRZinaTjUqVJdfVVvs+qlOqFJsXb2f88dVgVflFr+FBsJnbu/XvXcBe3nSlT8D6YWhX
         FzRw==
X-Forwarded-Encrypted: i=1; AKwUvBxPmR5ia94ZYNQQETC8rhDesOzbCz9qthR64UXjBmWBhZP7+sDKlpWSmFECGY9gX28IjBGBUU4yzAlO+Rg=@vger.kernel.org
X-Gm-Message-State: AFuF++ktZW/7et+V7N723tww6p7Vpb8w1mDWX2II1S/pU6Mn3iMUTCfd
	H3tlD9CB4XKC+OprJTS7lbcBI88SUJcsVSpxR1s5pp0XkuT+ZeSyXu7t
X-Gm-Gg: AYBFou1h1Q5JRWbmLTGGT4PW4MrNB4v3R793pdHQ161usWSDeVXyUtzUyLI5raTGGme
	UGt8LVYsyHutl1KMiE81/L7fhW05+dVKSuGzexwe3/k358cdnHlmqXSeT+B4PN6SiCARE8iZcP1
	CN58ffE2yP4PAUdDVssrXVnyKwhnmt5SswaO1m+rk4P3mWzIukb8QmKFalpJbGd8dvy9RzCluHo
	z9SQ3uOdFmyV3ODulleX7u2o2QY+Qv53UJ+bMOE8sUA/no+Xgj3+WQpgMFDRTtrM3+7IhwFevJT
	bDj0G4wYxYVXjZW/4SeqKKTiZWe/L4l5troVzV09hKVIgS+PmDYfVskJEbb1sqJNif8/PeM/3lm
	FxQ+293pYOwjmlPr9LqCSLEUjj+YtNvo5unCEnXV7q1h/nOHNi2XvenyhaMEki/tXVPqDrFY+Hd
	sPfTiPOoLp2Dc8tPNgwjX1UlbuRZwcNRTTKRObGTYTEZV2SZcyA09r29nNH5kXlCQALTMODS68y
	VGyAF1S3nanumcJuKbHO8nN
X-Received: by 2002:a17:90b:2645:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39e1e5777famr2430778a91.23.1789529010534;
        Tue, 15 Sep 2026 20:23:30 -0700 (PDT)
Received: from nixos.tail966018.ts.net ([2405:9800:b530:f677:abf3:8f37:82db:ab0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm2491538c88.11.2026.09.15.20.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:23:30 -0700 (PDT)
From: Tanawat Jukmongkol <tanawat.jukmon@gmail.com>
To: axboe@kernel.dk,
	akpm@linux-foundation.org
Cc: tz2294@columbia.edu,
	hch@lst.de,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/buffer: fix NULL deref on folio-less bh in __bh_submit
Date: Wed, 16 Sep 2026 10:22:57 +0700
Message-ID: <20260916032311.476258-1-tanawat.jukmon@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260915202534.468958-1-tanawat.jukmon@gmail.com>
References: <20260915202534.468958-1-tanawat.jukmon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please disregard this patch — it duplicates a fix already posted and
under review:

  https://lore.kernel.org/lkml/20260902013357.2815214-1-joseph.qi@linux.alibaba.com/

Sorry for the noise.

Tanawat Jukmongkol
