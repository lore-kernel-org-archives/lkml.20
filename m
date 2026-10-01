Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0651DE03
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877475; cv=none; b=p1qgEAl9d5A27lm1uNxoOEjwOjdRVHzjjOG4oBlIhTfaah059yk+l3VMOawUahH7ACc/iDq8EZszwemWxHcV0NvjAZVaAP+UTWulO2iEZrSVX7swpbugdyvV+WL7Fi/ePXiFOjquu2f4nHbsKBUnBleZeq/HaT95VSgtDk4K62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877475; c=relaxed/simple;
	bh=wziKKdMlD3hcI7MX5wQqpzq9dm/mx6FxotMLX0ZW0Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WizoC+FLbUbEFynNQz0K20BBzgUEF8ecRgi5kIGfGSUiv30K93I5OaBT0rFOwfAiBmVaHwKQbjqHqySa6b0YiRum24t/Gq/Ff0BtvORU6NXXgE3N+Y4ZNZPTs3vAniQCKbsWeyYxEtjvhIBYsVeoMrcwcGtJZMpAoU0tv74Cy3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUmd4VUj; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUmd4VUj"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91795fb225aso28554446d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877464; x=1791482264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LidMRNdI/T2ht2GtwBzMBnzfJUDX6P9vSM3+ZvhmuPY=;
        b=JUmd4VUjZf5UGQEHyg2v3EtzBn1CiIoQfcQ9UTVW0xdLgelJDEOQ1OOu4UEDCaFkxJ
         rYiKw0lACoXi9hlsfovaX0OQYin2yds9rVMvF0ntKa8Av64XoTr7Dxvq60WNW3mhfeM+
         7HGQ6pSQ6BBBCKQNIfTL6cnz5mjQy+Hc5KP5l6KUlHNduhLbPSjh8YJXW2ziWDy8evvq
         kQkuKMf02sP4ccw/T9FwkSZGBhYyVl6GLvifWg9Hkfgx27Uz6QIrO8Tqa4/ioJEaXKM8
         tGQTpfelkJzeV87N94YhXgl9Q1EOXwCHl0l5uTscPvfoCm4fh+sJK0pxJZwAe+5PYPhD
         u9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877464; x=1791482264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LidMRNdI/T2ht2GtwBzMBnzfJUDX6P9vSM3+ZvhmuPY=;
        b=N8pvuC/uX+oSkzQbu65Rvx5Sn6ubr3BVMhUba+jyYLadenUmkkM8KwJPut26S9Suap
         icxgTtzh+uDWvuSzdLDfqQRLo+yT9wl8cvl4DQPrsWZJvxjpYoOKbZfQ9OF7uy2BL4uX
         13ILi7tOGFBRMvqp7itfs2P4ohm/OKPZ50cWIW2fiUbXd7iD6Rfg6iPicYdyb0r9pRmj
         HTQ9hbfdThpZRGgm7oGWMlrgqOZxhwN0HUcfSwFmhvQJE9iavllWrHmgiYk3FhmYv3w6
         CIFuFRJJoyQfpUxRTzv9q6QN8kVKwv0zA70YUoTUMEPiEfsp8wdfqxfRpsBymH9qFexY
         lqnw==
X-Forwarded-Encrypted: i=1; AKwUvBxasaAsBLuyWT8+l+aQ8Ul0Fe888mflFqG5bnuQe3eTzgoVg9BBHQdN4g4TVUAMMO10gNV671mIMOzcAEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYQdozGq4L7S/Eq3p42NeACTENtTcry1A9XoeDauFfLT0x6W+A
	7rH+TquBNlDTUZXYnWyMt3t6APhMGzgo8E+Ez61DYaKBAmC/fHPT6jI=
X-Gm-Gg: AYBFou34cS8ILP3y/IjaOexlz7whqsqvOQ3kaq2xph8OCPnIOPEJZlYkrUt96CvOLtY
	OQxXcInJriwYd8hAwroPBLtnwyKrT07cLMPDvkpkQpy39RZILmlQWRIGQTmojBmLgNWdcTxNntj
	DsNNi81MByBbQh2iSdeSftE8qt8pQUmhn/PKT3bXTehX2Z3Ktt5fKg2rSPO8IbD6+2Ehtel5t2j
	T46YVFfTAEEmTahhewm3PbFc6z6ZPVbQ2kWPzCdyBiol3mkMey1Q6auOHKGZ0Dkdx5ylS/zjafB
	9EwYxzoyysxH3m2k8ziKmb0ATqF7RLEpuqYMQDcKykIdAjldnTNojM8UoE4CmL8okTSqAGK+n++
	gG2jnY8gB3BSjvGvTHBaCqFtFlGBLxgt8rvSyfIan1HZuffBr8b8atpUVy/Vb0tMCz5gfk6JuOP
	l3kHRBWvbJ5nkUCm5kG4i5SaxuKsieoTgz/Vzi6DR14zoZoQ8Cb/T76oPyDgeRRBAC+hWbDSjgN
	pZrrF5LhCvMkMT7c3JSyrmeXDeI0sSg1Bzfbtf77o3I7q/+dgHlY6uXhaydhQ6hFvAmr9bJqEd1
	qWBIQSwUoWKAUosD/rmarx5wAAD0
X-Received: by 2002:a05:6214:5284:b0:917:a742:47d with SMTP id 6a1803df08f44-917c0133a38mr4412546d6.25.1790877463842;
        Thu, 01 Oct 2026 10:57:43 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a9800dsm31853976d6.46.2026.10.01.10.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:57:43 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shijie Qin <shijie.qin@nxp.com>
Subject: [PATCH v5 0/2] media: amphion: fix VPU core lifetime during teardown
Date: Thu,  1 Oct 2026 13:57:35 -0400
Message-ID: <20261001175737.4048254-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() releases the message FIFO buffer and VPU reference
before draining queued message work. An open video instance can also keep
a pointer to devm-allocated core state while sysfs unbind removes the core
or its parent.

The first patch drains message work before releasing core state. The
second prevents manual unbind on both platform drivers and warns if core
removal encounters a live instance.

Build-tested the Amphion driver for arm64 with LLVM 22 and W=1.
Both patches pass checkpatch in strict mode.

Changes in v5:
- Rebase on the latest media-committers/next.
- Add Ming Qian's Reviewed-by tags to both patches.
  No functional changes.

Changes in v4:
- Resend through git send-email after the v3 Gmail submission altered
  diff headers and whitespace in transit. No code changes.

Changes in v3:
- Resend with intact diff headers after the v2 mail submission wrapped
  the diff --git lines. No code changes.

Changes in v2:
- Move vpu_core_put_vpu() after the work drain.
- Keep runtime PM and mailbox teardown unchanged.
- Address sysfs unbind in a separate patch.

Myeonghun Pak (2):
  media: amphion: drain message work before releasing core state
  media: amphion: prevent unbind while video instances are open

 drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
 drivers/media/platform/amphion/vpu_drv.c  |  1 +
 2 files changed, 12 insertions(+), 7 deletions(-)


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
-- 
2.53.0

