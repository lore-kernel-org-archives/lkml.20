Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190B24AD4AE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531275; cv=none; b=A3PNcjGuRIxdKSGO0VH50kLVx5WfFYiUvIcDdRbEnvZl6D7tD50dHlTa6Edw9vl65DkXwdo9/pJPqf8rpb0djI6Wn9Veu7R5W2MZtI6hFMwthJ6P5xxAoj2PayHod4rMv9vp0FfY0F3ici19/uxmxVwAvN/DqPRyVGDzxD7Gp1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531275; c=relaxed/simple;
	bh=ktkv47pn0bie3bf0YELiJC2P4OGo0W2kFNuUqfVo43w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToYRHWFoAFJ7Yx0PB5Fio7vqcE/UBaZ9HyOpAqVYsXd2nRT4B6WOWsgM/Ij9/MlN8G1h35dqlhEemuO4dHkDR+6OCXBEYtagpHBA7CO0gn1fVjdauRbO2UzFWvuSm96y1H3HExf6b1WE/1wkZdigZa6fs+xZ/adK2j1rhjai6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xh/o/W0b; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xh/o/W0b"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso7231035e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788531272; x=1789136072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdLN0jpTzIDZUhkcyyu9ICM6wLzBcsSldAZnVs/Xqxc=;
        b=Xh/o/W0b+TKCuV6Re1KY1GSRuBDze1Aey6e7xdWPhPkxsOW214qpTm53n5+DkfaU5p
         Ku5/4l1x5HlVB83F27RprL2uFYadgJ39vTgE6LFOtzH+VW0M/euZw+vnGp4XI8t0OhV/
         PB3gburNhoy8woOKk0PyXWP4hY9f02QvptaN2cQFss/3QF3TxV4I+6rwJoDIrYa93ggZ
         UbDwK3yg9qCCyRn/Gd72ywrH0yfxaQuC687qalpdTHl7lYBytqX3uCDojJzIei+DXSPW
         h1p7bfJENc7s/kC3CP/TV5UAeh0Huo4dnQnwUJvUQYXziVOqTU2FLySv1mc7ZzosvbuB
         zbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531272; x=1789136072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdLN0jpTzIDZUhkcyyu9ICM6wLzBcsSldAZnVs/Xqxc=;
        b=alXRgXtoF2QDgGWVbQCazyz0H5YeS7u1LplBKoB2M1lGOLEkeZHRPVDeWUYHywbAuc
         1bs0vQkE6jz6u2Hba3ZFJFVJTE9XVnsXlzacYeRdbSNea2o01Cj4ZwbfL5gdYlOTebe1
         sXvisX2O6pALndwM+CmuA2X3BP01GpWZOpSsr+/p97q8CnjC32ngxNBjHwcTBynhuWtA
         U3TQ0Xaz2+xYY7AqfqesU3WvZwyPlg/hvxGwtgBZ92xg0uJSt3beBf9xRNzDGwzfWgEK
         0KQ6UBiOlbRxkr2O4n+IoFjRomplq33tuQPbbiw+liQf4+uLc5YEeW9OYJzRAHEOMMWK
         mg5A==
X-Gm-Message-State: AFuF++l+iSwbxecGf3Eq9J934Uo3keZ9WOCR7WG16OZIK99bKTztirBp
	r/6Q11O58mflwAK0VONoXrny16JoZ8beJgi++Duo5yS33AOkSVAnt38KVlhXn7Ut/NKFiiGcWMv
	YAxHcoYQ=
X-Gm-Gg: AYBFou3ZIlHNmd5sSVgURC3PJh9UcPFhEQ2S0X9amNwvb95XylbkXuofYUjZ1/hVKP2
	csXQTJVfu5OwtV90hKiVzDTl81CAywc4XC44Vhu3qqk7JpDoaj1Wj5AuQcKX9N7+ZBj9RJ1wftt
	40jjOPGFjtGK/EdxZUsvf05pWCPFHN+MFjJirbnq3CcLqY2mX+KmHGIY5p3hYBfft1nsasu4lNq
	dpgsSVIpJs4OrpaD2J+yEm5mtgOBuAr03Ji6CQwoWNSz5HqxBuoFmf1DTyjG68PGwBZ0Iz7gV1r
	dJi6/9Sj9wY2AigmEEHsLeZ2Ep62FGDGPEfHdQzTSkpSXQZlqfqAlR4gldgJAc8yb68E6YVk2am
	T6ktER48cY3SvB5qYuI2fbcdDaF4iIf9U2MQOhI9+N19CjmBBAmGhusfluPELj9uO+3jgMfd5lN
	AX3o5O/2542/DiaduVYEPE23Avi4x8bMzkMvwc1EeD0An4w6918mypOPu84TnQ97jQAnhPir8lb
	/VJe9SbXA==
X-Received: by 2002:a05:600c:83c8:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49cf82353cemr68857095e9.7.1788531272184;
        Fri, 04 Sep 2026 07:14:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm84723225e9.2.2026.09.04.07.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:14:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v3 0/2] workqueue: Make WQ_UNBOUND the default behavior
Date: Fri,  4 Sep 2026 16:14:19 +0200
Message-ID: <20260904141421.287647-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently alloc_workqueue() make sure one among WQ_UNBOUND or WQ_PERCPU is
present. This is enforced warning and setting WQ_PERCPU as default when
alloc_workqueue() without WQ_PERCPU or WQ_UNBOUND.

[ P1 ] change this behavior: if no flags are specified, WQ_UNBOUND is
set by default, changing the default behavior when flags are not present.

The WARN_ONCE() when neither flags are present has been removed and it has
been replaced by pr_warn_once(): from now on, every alloc_users()
without WQ_PERCPU will be considered unbound.

Q: I decided to pr_warn_once() just to make sure users are aware of the new
behavior. It makes sense or we can just drop it directly?
I don't think the WARN_ONCE() is appropriate now, for this specific path.

[ P2 ] updates the documentation accordingly.

Thanks!

---
Changes in v3:
- WQ_BH require WQ_PERCPU

Link to v2: https://lore.kernel.org/all/20260903165251.481362-1-marco.crivellari@suse.com/

Changes in v2:
- if/else to add/drop WQ_UNBOUND/WQ_PERCPU moved before wq_size assignment

Link to v1: https://lore.kernel.org/all/20260903152204.401638-1-marco.crivellari@suse.com/

Marco Crivellari (2):
  workqueue: Make alloc_workqueue() unbound by default
  doc: Update WQ_UNBOUND documentation

 Documentation/core-api/workqueue.rst |  2 ++
 kernel/workqueue.c                   | 44 ++++++++++++++++++----------
 2 files changed, 30 insertions(+), 16 deletions(-)

-- 
2.55.0

