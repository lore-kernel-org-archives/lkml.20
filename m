Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA94A7CBF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587461; cv=none; b=Nphl8Zjfc5RvQh+h9e/yRZejzG2Iewn26wQ4M/dfEG0BM5F+Fallhq4hiiWVCr33ZCssu8ahtAPtokQG9BPcfewsPxHiDNIrnjDcHZEbyGTjmy/x7gm0QcVOK6K9gSCJIisL4Ckxe7Vm2vCBCHvWl6yvQwVH4fC2gyHDQivcaGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587461; c=relaxed/simple;
	bh=xIwpfm8VTXjD9mxcmYetWibD+Vq3tfuKIISgNvzmQgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ryGZf5JSi2IdLn6n7tDFVWP045d2p60jJZmonNyvx07cvbz7axdaUV6FzPg6b2x9akEVcAqgvA3qDs1bRpav2dr44WBzf71Il9LrSLHoI/N0jYdQM0H2VHc44nApJy959g2K7NjFYWFX2TDRD0Jpbg9QE4Ti8gENpjsoYuiQAvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XynCRzPV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XynCRzPV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so73976f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587455; x=1790192255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0n830f4yHIFKvE0dFIrH59B5oDR//G+OUOkS5B34Js=;
        b=XynCRzPV+8dtH6L7M1hJY9WIjiRzRCtf860/mPjpA/8c6b+2VqFR5CUtUi78ND617b
         yWetjAcAxmWwy774tiV2IaHg9W0mcXGKZyJ7J2QmSCt/OoUpierJ+DJ9hih1qBTbMZPu
         ibR5AGPwZJnk0DclwSfhrihIog6pyunAP7eQYt91gxxgxlUtwOtLAPMhXRmqFw47MR69
         oIbT7o0VXXOT8Ifq8V5BZjzpEglWsZ3ahgyp2gvg1y2zCxzzpAAEyGLY/1Wvm6WiJvcA
         aeH4xEXpzDOa7YwG+jBjDEJpbWUTRwrDMSiJnipB+AZvN9T4JSijnpFVaPk66r/UTwIq
         /ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587455; x=1790192255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0n830f4yHIFKvE0dFIrH59B5oDR//G+OUOkS5B34Js=;
        b=qVequNhW1U0BUxIgbAs8wxc9aUGX2hqDpsWLEdApcqymptX+tmPjSarvKGWBwuRODC
         nojy0g3UkXr51EWorfJ5sDpvdwlk/Z679om77mPdUuXuh88keB0qD9KHYPBAAo1TiyLj
         IcaMkTvE5dOQc3s1I5qReLI+JfH1Q+r+1I9Dx6EV7hUaemxFfRBhUvou4v8nTjQfYtHH
         9iJ83KiOdfrtmPr6AcS+wrKzDQ8jm+n9HTF56/a//ANlxcVzVxyrzzBzJeyExyVS0Umy
         3a5i3y9fLQEA+QFthGdMeIhItDmgFeO9xlsWsLbFSid1t9r6gxi5tIZLJ8BsHIotqyaQ
         hGKA==
X-Forwarded-Encrypted: i=1; AKwUvByTZrCRlcj23Gg8Wdt0ebXBYdy89AWGbbT4dGTd0dp7YAUzKZiMqNwRYrkwiImVyF77ZFFQ1oPL+QX6sJI=@vger.kernel.org
X-Gm-Message-State: AFuF++lWC7lbhIHehFpG/osiSAZAHKcVPrO4Ij/MnA0o0mCdgJDCPEya
	fMs4MZKuKSQMIUFRRrA6yFunEW6kzjfE7zSATSsv+WrA7BN0ucMlCN3t
X-Gm-Gg: AYBFou26+OUtDBKh6fcTSJ1sGB5Tk1mn78eZFAX5ps8p8ms8jOw5rfJMGMn7nopwNTE
	NH68/yQyfH8dQerUmwColJncjdC8zyZqDUAciYDO6yS72y/t3wW0adll1NF86BHAiOk67I5NXwk
	lYy6AngK0rOhIOg5JQF3mBZSHNFVpKiGnldYjjm/vjEu7JTtcPwd4G1tnwagwIDRsipP8BfM4HE
	mV7O6XxRQdcRjokhnOrUrsL6Sq98Eiu3jhl6/QO8tT/eWR1xpBgQ4Y92xVRTW4Fv0uBZ9ZIKh+w
	ZqeQPH5JzXKzaKg5i53lxGIqBPbxK/+la5g3i0eGdhvGdFlR90tvhNt+a2VJQ1RksBpOfWJFKJz
	wKDEnMI5m0ed735GH0tbptpRstnvVWJOG4HDs17ftsH10i3kspj6mKPUqFUDNCMThlcVnGAdM1D
	QhnGpVZhhkhH8DGtHAi2gCGN6K65VvMMCwThuTD7WVG3ma0tjPHZMfxNkUJx7netw=
X-Received: by 2002:a05:600c:8b78:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49eafe94883mr47066805e9.11.1789587455337;
        Wed, 16 Sep 2026 12:37:35 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm12936105e9.13.2026.09.16.12.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:37:34 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v2 0/5] vxlan: vnifilter: bound one request and account per-VNI memory
Date: Wed, 16 Sep 2026 22:34:44 +0300
Message-ID: <20260916193449.2552039-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VNI filter interface accepts a START/END range with no bound on
either endpoint and no bound on the total a single message may ask for,
and the memory it allocates per VNI is not charged to the caller's
cgroup.

Patches 1 and 2 bound the request. The first range-validates both
endpoints against the 24-bit VNI space, which also removes a loop whose
counter is signed while the bound it is compared against is not. The
second caps the total number of VNIs one message may span at 4096,
summed across every VXLAN_VNIFILTER_ENTRY rather than per entry, since
a message may carry any number of entries. Neither bounds how many VNIs
a device may hold.

Patch 3 makes netdev_alloc_pcpu_stats() use GFP_KERNEL_ACCOUNT, as
suggested on v1; it affects 34 call sites in 25 files, all of which
already handle a NULL return. Patch 4 accounts the VNI node itself.
Patch 5 adds selftests for the new limits.

v2:
 - target net-next, drop the Fixes tags, and post as a new thread, per
   review of v1
 - split the range validation out of the cap into its own patch
 - cap the per-message total instead of the per-entry span
 - account in netdev_alloc_pcpu_stats() rather than at the call site
 - trim the changelogs

v1: https://lore.kernel.org/netdev/20260909092645.3105263-1-alishmery18@gmail.com/

Ali Firas (5):
  vxlan: vnifilter: reject VNIs outside the 24-bit space
  vxlan: vnifilter: bound the number of VNIs one request may touch
  net: account per-CPU netdev stats to memcg
  vxlan: vnifilter: account the VNI node to memcg
  selftests: net: test the vxlan vnifilter VNI limit

 drivers/net/vxlan/vxlan_vnifilter.c           | 103 ++++++++++++++++--
 include/linux/netdevice.h                     |   2 +-
 .../selftests/net/test_vxlan_vnifiltering.sh  |  34 ++++++
 3 files changed, 126 insertions(+), 13 deletions(-)

-- 
2.53.0

