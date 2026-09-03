Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072E4E3ED2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454455; cv=none; b=XP7DYcDxccUsEkf2sKz1pSHb/9sU6bFsBvq1ju6N0ylVWiXdoeaABZ+T3d1QKOtUTu0dn31aG93i7j8AFThIwsh1r0m/5pLJQAOFh4FTDGcgtf48rz7yj1djmqLofpxrhF4MZHEcMPD+kM8T4bSR6NhXoDGOa3Z6aI0BcqjKUyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454455; c=relaxed/simple;
	bh=/5quqybG6Ei9VVerFMjWVVrmfgfzP7JC2+MnCivc4b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fK+5xJKni96lxOKfSkpfQjfm3LaeXq0xZ2jhKMLJBHUBIIsHuGfWNAoK5+dUh33i0kLR81p5B3VVL2ITn3crvLEQGRcv0LRV8Dan19eqTrU/JPqpDpwCvN7rdWwKq4xZtWXTmc0to+NsRTwTES2kTjsLoXicQ/gtE2HNLLTYnB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kh4qhCjs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kh4qhCjs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843f205a5bso85091f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788454452; x=1789059252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Nf4CZVYnH1JGsV6AOga8x2ko6/DkHr2RZNMv5cfK0k=;
        b=Kh4qhCjsU/aNP+Vw6Bwan3w98EdkQNO5Mg5PL0MHp5RdTqoDP6AMEJbJPcJmvQoaHG
         oAi2Sfxwx1SEQXY50ktjkBc7RwUEHGZlsWnQdtmc9/ataxTmwnC/c4+WauSZgYvkT3xH
         qdnrA+km68+nGN5TFxHtTTB2xCSMpNR9nK1nlMwtH8g1to0eACMWXU6XXz4mRsG30+px
         Stjx+U5ZbLy5mqecfKMlch5U9IyMD7grB1CJN0oHB6c215KS7sZIVvZYcgjTVU/1pY6c
         W+ovZlde9iv4P9D/tSe6RiXhjGK3S1OyoyChQUlONzfGyB6JHEjpSjfucoLvq9DEPdBA
         nq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454452; x=1789059252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Nf4CZVYnH1JGsV6AOga8x2ko6/DkHr2RZNMv5cfK0k=;
        b=GBsrxRY6dxOq1jrnv75kAzHdhVY3IndMF5qg/Y/bR2XOhJk04Be6u6ujjmlM75cFRj
         sayp5Xkyd7X9SuLtsGE2fhX7Hx9c/LEOFE86wgUQuSDduicm4jW0xoq2rOMebaK/+sWf
         bjGlisal/AxgkP/L1nwiyYnpFP8X4rZsvQ9rmLvKX3e5JT3Vnifb7OISgf/dlCQ8Z8o9
         fZ4r67tjC0jd7GjfTtBFdTpAZVIKhObqnitgq5Cd6uYB7os2c3dZlJWPEO+7bHEc90DF
         xYhrKeDded7+ol3mugaEMCJaHl28QxnZwBKXlOVLcWKs4ejK+zi7d9XoSbVyd5KDhPdT
         CZlA==
X-Gm-Message-State: AFuF++mrQp8omumj85zqYMTNpJdTpY3VHmuIK2lQF60B+lc+xWKuQHuo
	SPvNe5qXdhqS7ah7TODCsFz7y8wo6vaYQ/S1AS5C0saLRnpYEG+Il6NM75vO8+q3XukUXd+r/h/
	0ARs/l7Y=
X-Gm-Gg: AYBFou1m6wywnH6ripQ3dquGYCBxNChBkxgAKLYRFMpWNynVhWyVjfHfKPAVfcGUmHL
	X31GYHu9ct6LpefKOSqJM2kYn+880KI/oK/nY938cDWKjRdODG/X0YmkUaFGJugVAzyW0EHVmzb
	rJl/TLlesv5MHWqIBMdN/tJu8tSzLv5yjn2dX0z/zrPXlq1JxLbcVqD6ui6SXzQyN/5ArwKRqA0
	AX2oBuJQoEYvqpnjsDvMTGmjmz60E6v5MF3e0s+v/ql/IHK7aM3tI7dJXxaZfjSnzKkh2jqtIwZ
	avd+3GGwsxHwFsX3QDHv48tu+8Ip2yvD8CHhXHGF2jD2tT7xhG4C2mBU29S87IJU6FYSxg/IdOi
	KH2hA1tmro0pus+N7Qb6akyBPiQQWKIYc4dTVbh91MFP+f324wz2/APkx3dwUfoJF6vYa0ijmrM
	77Tk7VZmy5Unv/7JI43ztRGCpQoccOBeiRG1XIlz/pRxM30PGECx6DhqUuit1eRjQ9K89cwboUR
	Cosb94Iw4g=
X-Received: by 2002:adf:e00c:0:10b0:482:f528:be4 with SMTP id ffacd0b85a97d-485872a7ed2mr585926f8f.16.1788454452187;
        Thu, 03 Sep 2026 09:54:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm15311657f8f.27.2026.09.03.09.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:54:11 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v2 0/2] workqueue: Make WQ_UNBOUND the default behavior
Date: Thu,  3 Sep 2026 18:52:49 +0200
Message-ID: <20260903165251.481362-1-marco.crivellari@suse.com>
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
Changes in v1:
- if/else to add/drop WQ_UNBOUND/WQ_PERCPU moved before wq_size assignment

Link to v1: https://lore.kernel.org/all/20260903152204.401638-1-marco.crivellari@suse.com/

Marco Crivellari (2):
  workqueue: Make alloc_workqueue() unbound by default
  doc: Update WQ_UNBOUND documentation

 Documentation/core-api/workqueue.rst |  2 ++
 kernel/workqueue.c                   | 43 +++++++++++++++++-----------
 2 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.55.0

