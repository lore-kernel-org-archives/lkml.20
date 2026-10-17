Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66D3A1A5D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252522; cv=none; b=dNeEBiO/mjG99kPvuKHaPWGMznd8KDUFmEm+2QFcgMl7NcEQc4DZ5zfj261yD71gOiI4nv8nmPXMKgSwLLWT3k8xp+npfhTOOsLIhb4PrdYwdQ0P+wlZKYhpSu2MjTwzm+jgqGG9hDR6O9q7iuCoIXOKzOmDf2sJD9g+DbP4Ekg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252522; c=relaxed/simple;
	bh=dSNCESu5+dm5e6z1LWQbgytixk/aVHVZlXJ92PA6rW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8N/yuS8ocOWJXetUCZK1LbquysMrp2FaEykYOdaWqpunT1Vjp3sOrkCdO6ANVuafLhBGBWDgzJhehz8d7ZRx85Wf5D/fPNvkNq7TrNHDTXTo88IXCliJiiwPM19gwNU3o/PLGWfnPj1mMyYFo+UQ16pGk7ImQl0MJDck9LRXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PamsQ6Hs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PamsQ6Hs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso1802335e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252518; x=1792857318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vG9pmLwap9/s2Xp+YiqlcSlpjYirU8JCd4qCN2FEQus=;
        b=PamsQ6HsGOgvLfeAREdyzChu1qNibLUxldMbamORo8ju2Q5f/YanqbsGjGSnPAGfkb
         jIrKML3VwW4qvhYcLF7bAOuZHag4YdE7RLRbsfXGplIYzdj1qGsRzvNtVBGFzhGxoFlN
         e21CQl5j80LaBVQGjT2cbcqDJ0W2Xblpfm7ZABaEQtE3IDlGAt4k5e1nNkz00WS0VMF7
         5QzFZdNb5EQjrToBjId7y/2K8gnYjc5TsL1vUQUS6HD/CqvaPug09XuOBLAI7GpC52kO
         30Xbqsk6+YACKeCqKDnULbaSzAbiP8mmKFXj5oJMdgEjT1NJtSeqIGBN/eNUaXjUJ2VQ
         BscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252518; x=1792857318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vG9pmLwap9/s2Xp+YiqlcSlpjYirU8JCd4qCN2FEQus=;
        b=TeniVtinHGoP77jVtkHLOWd9zd/MK5J/7G48+4VMA+abxUCkM3AKB2nlkRS2rRIl0n
         MQSt5mw29S3/D+gGRde/jUrS2j0+CuItH3JbXEIjmL/30IQrhGqg/H9utV/+85t5catr
         1HuIaaZvsqWHLthkgSPlIYHRsKQfTR14Lu7nWQUP+ijbaYvQ8q1GwaFXjSnxZ/SxY/Ou
         rSubTUty0qNxEaLbt95YkwucRny6aMrkO8a8xObkR1JcaDpUOa0Zhoky+qT1rxeW2lBk
         YfvOHPe5cDoluOXFuT3aelm95k9tmpMHlhRNtvpAcBBqywBibS4NfPTP8OAtDSGEN2qt
         F1AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnxqT/dlte2sKWQOVh0jFF3oHSEe07JGZh2jCdk0ejSaypi3RbLwQQGFTn2oTe7/yo/6u1WvfMPqp+rHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwkfd7eJ4UPFyo5WjiWqEuYfBHhZc9Opt/oM4GaQtLOV7KqdiE
	S59JOHZMIGMNf63yJh+nGWlYfjHHaQQYiZFQnlfGIU6wiSuI2Ibq51le
X-Gm-Gg: AYBFou3lbgGCxTtPBtwHDUwt2nq8QcFBi44JJyZUDkBpxKUuQ0saKl48zVii2kh+JiF
	0PaphCskZ/kHneLeLzkF3EakiNlAU7R6n45AcmOk3RU0/Fn0Ux7ocWfaOfSU2JWePVydyNDfNEC
	3g+ejJon+aATXVXXhG7KHe9A5MVqttqJstR1wCbH6x0eg5Q7h/hVzzMFHzAaGv4jgvaoUDcAV+d
	WSBwaeJv8dgbb3IXbqEhENHOKsPzPZ5Fj59/JI2psOqjeAiCfqHJslBFBwU1Hb45/UwJA3vXEJ7
	qUCLiJXTfEi+dA78ETpcgPjqnBl5ZkCEI/b8U4/8SnR0dg0t1RwDZMbHI+yh64Hc6tuTB8Hhbyy
	bL3t1CMWXK9eh9wG7S6XZcRX00mQ/woqxBvbuolzamsbEz+aIYfjpuNd2O01opdTIqrS6MO6KME
	vyR74nNL1FORoy2pUvIp99rsSLRSUaxLhEAmh4MZ05fvO4mVtAPPOcR8rOUZypKEgVG04rrRULW
	ML72HGtxpy8mO5no6o=
X-Received: by 2002:a05:600c:4f94:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a1d76086damr55314085e9.30.1792252518028;
        Sat, 17 Oct 2026 08:55:18 -0700 (PDT)
Received: from potato ([31.176.162.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dea678cdsm42335505e9.1.2026.10.17.08.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:55:17 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 0/2] mac80211: hide tracepoint definition
Date: Sat, 17 Oct 2026 17:55:07 +0200
Message-ID: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series does the following:
- Move static function that uses tracepoint from header file
  net/mac80211/driver-ops.h to net/mac80211/debugfs.c where it's called
- hides tracepoint definition flagged by UT=1 behind
  CONFIG_MAC80211_DEBUGFS

Omer El Idrissi (2):
  mac80211: move static function from header to referenced file
  mac80211: hide drv_get_stats tracepoint with ifdef guard

 net/mac80211/debugfs.c    | 15 +++++++++++++++
 net/mac80211/driver-ops.h | 15 ---------------
 net/mac80211/trace.h      |  4 ++++
 3 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.53.0

