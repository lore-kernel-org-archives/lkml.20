Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12E3D411A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363224; cv=none; b=QMmJnQXo+NmrheAj/qeK6YMIM+gPjZ0JVTSwS/DoCGHGCP5jCk6yE3dxbWuKd6RiktyZi9HcKhH8aooWSUwniF1VucSHUr20Gl9JA7ixcTQVqJddxIewX0CaQpPdLqyO3quy4pADrqkLB2t5H1YwUL9tmN9e0zYqRuB2dGwov+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363224; c=relaxed/simple;
	bh=73vm1pL2rfhflK6E/C/p/bdvtgGGIUR/9hKtxk/jREE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sF6xKqOf6nYtPs76A9nsoXOwP0n8Dtqi9F/MR7quAo6ByyUnnftl7mG2f6HQBsDFOhoTg/AeTE0jwSmY/ZC66zoYEhj8AoeSO3LDs8RAmo+lijK8yr7gib3XJtQAW7ibo/2QddQWCyS4kMEI/SVDEZgQILqseFsXJNLWTuTJp4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH57WFgC; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH57WFgC"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1529237a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363222; x=1788968022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAwZDI989FVdGKLvHqYjpHzJ0A2k3qSizrEVsIJoGK0=;
        b=dH57WFgCK1vbj0zF954c+7aCWuLj5YpeV3Sg1lInCa1D9eAeUIq51e54RJFVob5Zuk
         NgKlkFRC0sEg28xCz0Skm7+N5swIvIP9HC0ppiCJ2b12ubkZ8Bp0jmYLUcUQDaqT6UTZ
         crVstJzqsWQxVdw9E+LcaIj37enrRioiMKNjRCICJp3BkoZQmJ1xCwj+viouAr1ISH3O
         yLpToptp14amcfGTnEm0oHXEJ/qKh66URDebR00nQB+HO2tDxlh8qcvYZKWbz2Y2gWhe
         QB29xQeh8R2E9LzrYI1ILSBfW9xvUXE+XZhf52Q6jRwFXBYSyDJevFhlY8tVVfGM7ZzE
         h1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363222; x=1788968022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jAwZDI989FVdGKLvHqYjpHzJ0A2k3qSizrEVsIJoGK0=;
        b=ORxd1z0542Zgloau2eCs9r6CMOu5j3YllQCVqF1Ypa6dt1iqi4UeGR4O6QXOFtVzs9
         1VsvOm1Znb6tP8KMjN5WlsAlbsoLrSvwh56I70ayfqFL+mn029lYzbE55gVlbhfbXtWS
         nYWOc+9h6KvmVAfEXMljcp+KHC/JIVEHWdpJu7NW3xIvavprHtRpNMP30le68TsvQv8+
         y11pxtvSzxLM3hhKz2UetJs23mSQysOV+f1otaUBfo40k0dSKoFIz8D4/BKDQAKl0/Pw
         6O1DbSNESWnxGvcihVZWJZSEcPn08bgyz1WQhbUet30OvibwI9RozfCjooXKlPg6cTCb
         bjuA==
X-Forwarded-Encrypted: i=1; AKwUvBwlKulLiVq+MsFsLDuePhH4ulHqtRT/pRCdpF1nZLbAjEpnoXO9SSuxha0q9z8RWbqTlm5TR4TpvGLTp6M=@vger.kernel.org
X-Gm-Message-State: AFuF++naXjt11cwZLn/ID5y7ZzsbVESnU2MsbCrUOnDEvsCExjFVwST0
	dTo/0ALkcHPlHXbOvEBxE0PwWulxkKMCHDMhUS/c7T5ZxNDRMH4eggdj
X-Gm-Gg: AYBFou3db/uyXl/DkCx2qXuzeG7OpywDVANuEqtWtdnpiOM3t7Jyle4m6+jaQ8ECOpd
	F+l1ZvwfK5c8+wtHQDTmPnrPlIAFirsawzsJ25PFu7gZoO20KTohKxvYgm629XiKfTxw0Hkhu1f
	eyyoI/e9URBUyHKEvBGgzVe6UcQ4JwfidS5VNIWsG4oSmP/76WGNMFUIMZjn5CHKy8JRbj1bSlt
	Rls9j/GjDv/Is9jaIVhhwbPA3kk7wZ1UfTxo9FD4cxeSltVUoKn9gidT2LeO850kUpMV4dJlXGd
	HonNpQ5YhL4FKgr82MFrZjDu5qypqHipesuZnJE+aYGot+y2sSWh586XPxVPjZC9MmuJJrHCmek
	3FOJ2n04crg6hO7yo2xHeyz78VVr63/dseVEjQNYaO3U7h8M0L6J2ycYaqJ296eGG7+MgOhRo7b
	VvOLDsv6iNrH/wZ8P+nIMgllh6oFQVz2Dwqi14bfc25VdrOq89ks9zg/J55EE=
X-Received: by 2002:a17:90b:2704:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39b0860c252mr15953a91.13.1788363221587;
        Wed, 02 Sep 2026 08:33:41 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08627417sm4966a91.12.2026.09.02.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:33:41 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 05/12] mm/damon/sysfs: remove probes number validation
Date: Wed,  2 Sep 2026 23:33:33 +0800
Message-ID: <20260902153334.4034394-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902143706.88115-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  2 Sep 2026 07:37:06 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed,  2 Sep 2026 22:07:13 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:
> 
> > On Tue,  1 Sep 2026 22:47:38 -0700 SJ Park <sj@kernel.org> wrote:
> [...]
> > I was wondering whether DAMON_MAX_PROBES is purely a core invariant
> > or also an interface constraint.
> 
> Thank you for reviewing my patch and raising this question!
> 
> > 
> > With this change, sysfs allows nr_probes larger than
> > DAMON_MAX_PROBES and damon_sysfs_probes_add_dirs() will start creating
> > probe objects before the configuration is later rejected by
> > damon_valid_probe_params().
> > 
> > Since nr_probes directly controls the number of sysfs objects created,
> > do we still want to keep an early check here?
> > 
> > I agree that the core validation is required for non-sysfs callers,
> > but I am not sure whether this particular limit should be duplicated
> > at the sysfs layer.
> 
> I agree the user experience may be not that good.
> 
> In my humble opinion, however, keeping code simplicity is more important than
> the user experience here.  After all, DAMON_SYSFS is recommended to be used by
> another high level tools like DAMON user-space tool (damo) rather than human
> fingers.  The user-space tools like damo can do the early check.
> 
> Please feel free to let me know if you have any other opinions or questions.

Hi SJ,

Thanks for the explanation.

I agree that keeping the invariant validation in the core layer avoids
duplicating the limit in multiple places.  Your point about DAMON_SYSFS
being mainly consumed by higher-level tools like damo also makes sense.

My concern was mainly about the temporary creation of sysfs probe objects
before the configuration is rejected, rather than the user-facing error
message.  Given that the number of probes is bounded by the core
invariant anyway, I agree that keeping the validation centralized is a
reasonable trade-off.

Thanks for clarifying.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

> 
> 
> Thanks,
> SJ
> 
> [...]
> 

Sent using hkml (https://github.com/sjp38/hackermail)
