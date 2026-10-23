Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754966;
	b=nHd8rMNmTeMEszeLz/4xl5aCQ2RU2hWAtT/ejtcJaJchOKeNfkB0ZjRl8Lm7uz2Nxgrt
	 D4sPnYf8eXOQeERuQRRlZQ1br40kJyTuMR9OlvcpZsvB/9dgkKh1/7dHqDr03z1tfV4Fd
	 OGQmyT08t5K5Hb6zI8dflFdpJFo+Elukv/Dh8S47bXMngEluYYr1DaoA1NKfgBSdezzul
	 f0uh0Q4JuvNVs881q9udCu5I3ccIy7R/wQOHPjoRUNGJ6s3FO+oiFyXjASh7EEJh9GfAG
	 FX5YdOzkqQqx9BFJhTJrLimXv7+YFbtxZmERAsuER4647QiwxvgCMOPl1CmZcVyhskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=siaaH19W0b1cnM6TcR3SUQHduqkChYWI/m2jWbai9r8=;
	b=5HzzAyrpRSPKACaFYbnzS7AaKAVMO9E6NQMr4sQ92wCGkmyuyOA4+hKTq/zRqeB81rgg
	 Du446Y8wwLakceeNcglJ1U9iWxmq/N17lsRcNoozYII9lqMj0WP18dL7lo0Zj8eTo4fkX
	 mfDtEe6QvFcxIrTVfNtPucRun4NqfojnQJRTeHtToLP9bMiFL3TL6GsV/Q1t+uZyU1Qjx
	 k9QdbjzzTsDeRDE0Dt0cITOIGEMnTHdZJhd72SEu68n60i+3hu8tYIOIyr6BrfEFxcVHg
	 ufwvzpF+o2ubdG+kGVlKjbqA3nQlEnU9khhevIclJr4WAt+dr62JXRPIYzHjWsVkTTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mlvHp1pM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2EB606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2EB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mlvHp1pM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5345955e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792754964; x=1793359764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siaaH19W0b1cnM6TcR3SUQHduqkChYWI/m2jWbai9r8=;
        b=mlvHp1pM9zfIVT0GFLmeVurTUjPudpQaip4Gzq4FRJ34lOuLYCAMw1XLczsDNPyNVc
         +s6rxvO7PYoQr9DcsqfQTI6zEF9/uG8PIj9IUwC5Li9wxO6Z9fn4Vg5BcDUES1Cww0XN
         gWFnxpAoUj15QGdp1SbwRmesBFYPgSRJA2fCPPLAfhIk1CI88ALT98tXYTFQQHv2PFNa
         03wZ9aaon0vm3/JBESzRGVxI9My2ezsZJU4RujyVuPs9d1p72OhpQBy4bDA/oyjhVIKL
         Hl0ONYWEky46/gR/a97LVhByxGIRva+lWQj4ITkrVbOoIeNtRj00VnrEoSjQSTMiBcxm
         rlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792754964; x=1793359764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=siaaH19W0b1cnM6TcR3SUQHduqkChYWI/m2jWbai9r8=;
        b=tKqVvcnWwQ+S6GfKH+A06g6ZSbnwdWE6faDKNbG4Wf0jY8ObrniGyvJADHpQuBuz48
         bx1a0q594cKz11TgLX58RCrDU7/SvR2H8LsPUwZo8EQJZAKsDRvccLFgJgnulq/gGVq/
         0yND61+EVffCIadqYucsBrffvzYhCPXmVyug6eb2VYWn5xy9VAdwDONg/xwMEi+V1FP1
         bM6pBeJrryDQAqSlsxs8w2krCWXvnaNI6V9MZZg5jBaXWFv+1QS6fDIWAGLqS4GwHv3p
         0k3SFQcTt75ev6nuooYzBAJphHQT3rMDSzLN/XCBRcWdY5KuzW/nTwVDKLARDzNGtcRs
         BVJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1Wg1Rh9FnLxHxQJnMP3YVQU6tMK7lUX7jj2CtUzORzKAbkGkuKVP3Hwcrva7a7v8bpx6SwBsWeWnZtoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsdLKF1YhQ6zdqFoknJu+vhW/MfgNWoUglKw6r+zSURJziJCy5
	yxTsdOHf5pR1hmzxlukbuDH75ATpWUKHEYiXVPrfFnCeXVBcHdOXIcm2
X-Gm-Gg: AYBFou0cfFviWlcc74wBAyhDSqWgORXbK1B97fr+DrIQcPVj8PeBCdUnG1qSw7N8xVO
	HVMnt/3SO2O6WD7oXna777U5HX/U3f+nlZgSWtlrGhvBtZ2LB5sXCV8P/ouNva6eIa91jAhbNlJ
	BfazWZOTUDyEhTMV5n9Ks3vQaSSLxXATuVTiV85VRTZLaB97R3r+x25/iL12z6OytIa9AkkQ68F
	svVXwnik6CmHbbx80+lyNULuMbgaJJWaoUkkbXBWvMR7cDVR3WJnpYVlJsmx8tOrLUTj/HpSVM7
	uTxNbc91eethDZb/Ke+PuQ1Rnlb4qSmawwaSRAC1o1P/3ubES9C9HGB0HTypLJrRd0tO7Tf+JSg
	zLHWbDV8cF5g7JpA/GWfsq7or7lhkiD0+PMxt4ITrW7k8l2Wyc/NoJMQi+vUy+Ns63f67eNR852
	6rxCKAF/DOuVqrEx/fM6MFGJlvKbGVaw3uZWB7Hp3oJ8Jc5vKEeOhLSkAdLUIcUJLwux07INqvY
	hIGPFwOznY+BLRwTSBfo62Jasy3fWD86KISp314K99WtGNiYr7+WCa0BCEdyMxdD8mqfYsD7XRU
	TRz50ChcZbtHEn2NxkU6g/DDcyrn
X-Received: by 2002:a05:600c:19ca:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a211c8fa81mr31321535e9.8.1792754963632;
        Fri, 23 Oct 2026 04:29:23 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.0.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21534a306sm25672665e9.0.2026.10.23.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:29:22 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: ranhongyun1@huawei.com
Cc: a.hindborg@kernel.org,
	brauner@kernel.org,
	chengzhihao1@huawei.com,
	drifabdelmalekmohamedsaid@gmail.com,
	jack@suse.cz,
	leitao@debian.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	yangerkun@huawei.com,
	yi.zhang@huawei.com
Subject: Re: [PATCH] configfs: fix use-after-free in configfs_symlink() racing with rmdir()
Date: Fri, 23 Oct 2026 12:29:20 +0100
Message-ID: <20261023112920.188-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023092541.1858529-1-ranhongyun1@huawei.com>
References: <20261023092541.1858529-1-ranhongyun1@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ran,

Thanks for reviewing the patch.

There is an earlier unhash inside configfs_detach_group(child):
it calls configfs_detach_item(child), which calls
configfs_remove_dir(child). On successful simple_rmdir(),
configfs_remove_dir() calls d_drop(child) while the child's inode
lock is still held, before the later d_delete(child).

Once configfs_rmdir() proceeds to detachment, both branches reach
configfs_remove_dir():

  CONFIGFS_USET_DIR:
    configfs_detach_group(dentry)
      configfs_detach_item(dentry)
        configfs_remove_dir(dentry)

  Otherwise:
    configfs_detach_item(dentry)
      configfs_remove_dir(dentry)

For default children, detach_groups() acquires each child's inode
lock before following that same call chain.

However, d_drop() is conditional: if simple_rmdir() fails,
configfs_remove_dir() skips it. In that case, the hash check alone
does not cover the window you described. detach_groups() still sets
S_DEAD before releasing the child's inode lock, so I plan to add
an IS_DEADDIR(dir) check after relocking and before reacquiring
parent_item. That covers this alternative path without accessing
the potentially freed item.

The reference handling in my patch remains necessary: put
parent_item and set it to NULL before inode_unlock(), then obtain
it again after relocking and validating the directory. The new
failure path will release the target references via out_put_target.

I also noticed that your patch's new goto out_put still calls
config_item_put(parent_item), although its containing object may
already have been freed. It also bypasses the puts for target_sd
and target_item after a successful get_target(). Additionally, the
existing get_target() failure path still puts the stale parent.

I will include the dead-directory check in v2 and validate the
updated patch.

Thanks,
Drif
