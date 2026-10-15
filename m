Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977755304BF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072919; cv=none; b=cG3RYqZU8xd09o9x7zdxt7Q5kyf431dRn/kzEkH7YT7yX6r60qaGgAORk9HQyoe4Rcq474oTHuBR35o1XC36QHe4gjDW3Dt9ID3wD1bSgXgCeLrhte/WO1ExDwU4vbOtjZTPpo4YauV/8J75Khbj+O5e4I13v2j+F4Q+ezNyTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072919; c=relaxed/simple;
	bh=jMGqcQxXkeLK6oDlI1qcZ9EhHxYpED5iTPacXJnniJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3rjLuB05K/MeRmw0CxRVPbHp0tml/SobxO8eUJW0p3xktG3YvVEjGtAwbuaiuE5ciLKskH1NVF59RCFMayrsJpCym2jjEbhwEQBcrr2MZg83LShrwyVVj+vZhJMQKtEzlRWudEugZfl9RbFKZR2OKuRvt1SNTyVUa6MuZajroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Cn69xabe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Cn69xabe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20907365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792072916; x=1792677716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfykzrnE66xERksJpYGI3+c3xpM8bFlEG4AlHLkeq8c=;
        b=Cn69xabewviIpkJAjS0NAATFactpOvok/kdfS6XdfCNo3FExC5/ehY24lPCAC1IB6q
         Xj/oA1q2j7nWGsqw4tCwvqrqk2BaLRoFx2b7LNUY8vuMMQgoSvgK8qxgXeAlpwsesgqr
         MaVFNo91RYmKCym/hP4MdTQLywt/xUnjRoF20STchfAyOU/Xe4SnujoyraltW98EOzlt
         F9cB70obgiFWshfULjlXtiroC9+BZXhkvgAKKFBzL00Cq4fT9vFZl6S/0Dde/O608zLI
         aLpNY3OqYz9Qm4i8VKM7bvCIcLCiCddWBtX91X2crDhSogcoXMtYpVRBiVbdTlKUyIKj
         es9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072916; x=1792677716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfykzrnE66xERksJpYGI3+c3xpM8bFlEG4AlHLkeq8c=;
        b=qyyucI8T2zlabZd7v++qS3OO3swkI3eZ6iFzC1WWuse9DIR86L/t5eKeLMAyQpOXem
         sJqWQZQm6aYrwYJK40wlAOs6rKT6cuc+bSHsm321U4o2FMSu1zaG/vjA/PqoHoXD3SP2
         FI+AWuPu7BLxNz/9e1awfBiylVehOQ1iO8r3C89aY+/XgfQGvhDI6tl5NBkLiQk/Cfek
         VwcwlCMfJGLhHo8nD36cwv/aAYd5dC24l/3KEpdLqpgorwrHS+q60tsR7TnOVld2mUOM
         99O3iNw4pl2LCApPoqi+OdaDKuyumWQ/XfTDm9RmpFao04lDSOJIhM8OHnMFVPOajWXw
         xx/w==
X-Gm-Message-State: AFq9FYJdf6KGhVTA1SuiHYbD8Epy/WcfATpjIepBmtTWhst8pHa1JMec
	WwjQ8YTGPqKD/dsnjGBhp8w8gAzpkcG34ggi7rAeaJTQy6mq7/Zr4WCjx30jMXvzmhyvm0traa4
	R9Nb27Bk=
X-Gm-Gg: AYBFou1kD6l4/81cETk19AfQWEbQNxm8dk2HkuouZqWKVVd/4QiLOqlQTE6rslCPaho
	Jad1NkiGqpjvVYnxC/Qh6rYBursFDb3f3e4YaI/rMNFECZ4NVu3OSJjcLiiMMSawQ62YhH8xvz1
	R5hFfPa9gR+9uR9GSLZhTeokWjGeP/ECF1YhkEavdDsB0bHR5TlRw+ZmPTsJhisjL7YmDTYct5d
	ftxH7aPk1Sc6FrQl19XvQ6BR55TCKw4uxPLAZYt+hmS0EWg6HN8Hjv5X98iGSq22P4PCl2SQW/Q
	kSgdNyvDHU4HlbEUz4EvZfT30dtByhTutCYws8HS1s6LiooEV14nLPBXgw7hOjcrYoNS/Dwxb45
	exVfUW2jPHwcOsLcaxGa9BOqirz8Hm6IfdaG3Wa6tzX3DGeug7gWnMpYaiXsinY/GR1Y/H8aUkU
	XVfeAldzc7/wjsizcoA8nJO6OM6cnOHgBAPsDN8PB7yrhuaidFLfeFYiJ7xTxyYu1kUOgpitDzq
	61D6hhIHg7JlKgJV2Xt3g==
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr377835405e9.3.1792072915540;
        Thu, 15 Oct 2026 07:01:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd7319c6sm85233365e9.0.2026.10.15.07.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:01:55 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v4 0/2] workqueue: Make WQ_UNBOUND the default behavior
Date: Thu, 15 Oct 2026 16:01:46 +0200
Message-ID: <20261015140148.231126-1-marco.crivellari@suse.com>
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

WQ_BH is always per-CPU, so WQ_PERCPU is forced in case it is not present.

The WARN_ONCE() when neither flags are present has been removed and it has
been replaced by pr_warn_once(): from now on, every alloc_users()
without WQ_PERCPU will be considered unbound.

Q: I decided to pr_warn_once() just to make sure users are aware of the new
behavior. It makes sense or we can just drop it directly?
I don't think the WARN_ONCE() is appropriate now, for this specific path.

[ P2 ] updates the documentation accordingly.

Thanks!

---
Changes in v4:
- WQ_BH: add documentation about BH workqueue implying WQ_PERCPU

Link to v3: https://lore.kernel.org/all/20260904141421.287647-1-marco.crivellari@suse.com/

Changes in v3:
- WQ_BH require WQ_PERCPU

Link to v2: https://lore.kernel.org/all/20260903165251.481362-1-marco.crivellari@suse.com/

Changes in v2:
- if/else to add/drop WQ_UNBOUND/WQ_PERCPU moved before wq_size assignment

Link to v1: https://lore.kernel.org/all/20260903152204.401638-1-marco.crivellari@suse.com/

Marco Crivellari (2):
  workqueue: Make alloc_workqueue() unbound by default
  doc: Update WQ_UNBOUND and WQ_BH documentation

 Documentation/core-api/workqueue.rst |  9 ++++--
 kernel/workqueue.c                   | 44 ++++++++++++++++++----------
 2 files changed, 35 insertions(+), 18 deletions(-)

-- 
2.55.0

