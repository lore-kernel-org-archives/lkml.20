Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B30746C4AF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392586; cv=none; b=SRKMmf6vJXbHOxfA6q0HSZYhLa7UeKM7MJfnDDSOVvoCHugN8cUjOcsNIqkQ26zuTOTgyI/0Bk8DxqtyPaf7OA2+H8Mp0IykQ8cKVhlrRflZm3cCsEHwktBMfrlL/QwcLat2cRmcoyLAW7GKeMI/1tXdJejsAt5mVorvllDeHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392586; c=relaxed/simple;
	bh=72MILoDifiaiK9Nla2N6x0QwLzStR2SM106Oboc2EvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgR4RnBaRxd1Rey3DfHeLySV0KLRzBML4Rw14VOz/3kqby0evTY2haaXsQAY4fB3HTir2nWseBeRAqZuy1YsR+dAmkoAWHYqueKTGTq9gs8P29TBRy/X02cNh/fwXJ0tV8AFlphbue+aH40Z67rwOKN0W+KyS6RBX+ntP4/ClD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMqJo0Af; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMqJo0Af"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a9a2f16ed4so4020709a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392582; x=1789997382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JytMekM1O3tqnBvhWTtqVwMI/KxX0kYwHkxZRtcjzKg=;
        b=oMqJo0AfY7D0Qp2FDZpDNvtS3EEO0sQg+mSiYq7zGgfnv2CnWGi7FTAUNSETGvDv8W
         YFaOj/pcqY712wfcv0svQDVsevLClKIc0xWUbiuuRHiVkard7m15gDYO1T1nBQoKVODX
         Nt9h4pQlWYfc6PYLfOymWtRSpMPY9s6cRpOICcWRFav16cBWCSYk+6MGaYCTjmoeWh+Y
         ZxpOPIzXmYVC1HqAueabPsShKMuUSHCbIg6Dtn8uKjy6HlsfBxbxTUlhQp62MZ2IeW7s
         EO9ZKxtpjr/gEbpBHeNea8YNJkWmK2p57C1IUiFnG93wDkjfCMwI9kZycih89UjzJZjv
         IVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392582; x=1789997382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JytMekM1O3tqnBvhWTtqVwMI/KxX0kYwHkxZRtcjzKg=;
        b=BbELxNVQKjLjPptvlYIHsUPec97q3kqzKdhrcAP/08k4AZu43qd8vxkVTCbXZVFMjh
         ONOJufROX2mJzMYA3Cnxw/0zgOwVzdsha3brSXgC/kRvK2M2IBdrogsvO/vF0tlncxtc
         yRSJamnamHfs9vQZKSCT+vinQNfRoSdH1NDAuqdIZkKCw1GAhYsMxWEYZrFCu1J71iNF
         JWlWDHdGo7LYt/OqecJ9aLYaCXKpjkfkmNd5R3LHUGBeTF4RGdDVgXBNnkTcuSvA2bAm
         i0Q9XiotlE+SDMvJB7pRZTNxRjdtzO7BdXdLL1g0zyaqMKZD21fa1HqNELOlSGcbpmHH
         aHrw==
X-Forwarded-Encrypted: i=1; AKwUvBw4WysPQDJLqxOcJ4xWmgEJqhg4do9MUpD3Crs9zlOzKR5stuQPFwiof8ykNKbCv0o696emiFc8e8XdUSs=@vger.kernel.org
X-Gm-Message-State: AFuF++nhWPUOekeT+92nb1FEB620u3JeRHaIeKCxY0VHcgdz9kc2wu3d
	r3nUJaplMYUiYkR2uHeOKMRqaAVoHRjbY0q3qT8UOuOtkAmi3jzEtdzI
X-Gm-Gg: AYBFou0vol//bD31DpShO8SQ2mDv4x8PpVYVBQqE8CYFgUnyHODoI2qVRrFMY92olNg
	rqrNsBNhv7adwTuE0e01aKosvTi286SEnYSW5uz/bg2eiR6ee1MFWeCploi8CKtBW+qaJPIqd1z
	c1ugWbmbKLeAAbxCAx2KW6AmcfmSOK7SlQgwve/kBn+HqUm6bVob7nPgzbhR4d6is7OlSTgoget
	HAq23kTm3/rlEgzfl8UBdNgB2JIvetB8qkBfJJSkhtNRdhwFi5lCP3iAXA3BjDih4gsKOrIsS1k
	P9BIxNrhFsoB1NiABduOw4nA30kQYnpQegHtYDaD8XUbzDvgoil7klSNi9th8IQdYrEyrUu2m79
	3pxqNVaXLG65a7MSO1pHIaL+LiWPsnHlVEUGBDavLkcPed1krHuK3GDz+k0c4ru347AKTj/ZNDX
	4e5IM3RouNFMczJn5Rids+7fcYyCFarzg0xMZ5pJk7OBecuKuDXJNQj8zKPf6QshvMOUmW0l/i4
	Ni1YsjAvRHyuorgJ4Y7FjBWrX9ZUpnlKDrkC8bcmVChURuiEJUIL8rPlEiaC84=
X-Received: by 2002:a17:907:3f20:b0:c26:1f8f:ed53 with SMTP id a640c23a62f3a-c29a4339baemr362278166b.12.1789392582327;
        Mon, 14 Sep 2026 06:29:42 -0700 (PDT)
Received: from misharu.home (2a02-a463-a071-0-7759-cb87-66e5-4165.fixed6.kpn.net. [2a02:a463:a071:0:7759:cb87:66e5:4165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm437207966b.4.2026.09.14.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:29:41 -0700 (PDT)
From: Hari Mishal <harimishal1@gmail.com>
To: Kenneth Feng <kenneth.feng@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Xiang Liu <xiang.liu@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>,
	Asad Kamal <asad.kamal@amd.com>,
	Rex Zhu <Rex.Zhu@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hari Mishal <harimishal1@gmail.com>
Subject: [PATCH] drm/amd/pm: bound SCLK FCW range entries to the table size
Date: Mon, 14 Sep 2026 15:29:20 +0200
Message-ID: <20260914132920.10127-1-harimishal1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomctrl_get_smc_sclk_range_table() copies ucSclkEntryNum entries from
the VBIOS SMU_Info table into pp_atom_ctrl_sclk_range_table. Both the
source (asSclkFcwRangeEntry[]) and destination (table->entry[]) arrays
are fixed at MAX_SCLK_RANGE (8) entries, but ucSclkEntryNum is an
unchecked u8 read straight from the VBIOS, so it can be up to 255. The
destination is stack-allocated in both callers
(polaris10_get_sclk_range_table(), vegam_get_sclk_range_table()), so a
count above 8 overflows a stack buffer, not just a heap read.

Reject counts above MAX_SCLK_RANGE rather than clamping to it. Only
one version of this VBIOS struct (ATOM_SMU_INFO_V2_1) has ever
existed, so a count above 8 corresponds to no legitimate table format
and means either a corrupted or a tampered VBIOS.

Fixes: a23eefa2f461 ("drm/amd/powerplay: enable dpm for baffin.")
Assisted-by: gkh_clanker_t1000
Signed-off-by: Hari Mishal <harimishal1@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
index 4b796d60b03d..3217ad3c1d17 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
@@ -1025,6 +1025,9 @@ int atomctrl_get_smc_sclk_range_table(struct pp_hwmgr *hwmgr, struct pp_atom_ctr
 	if (!psmu_info)
 		return -EINVAL;
 
+	if (psmu_info->ucSclkEntryNum > MAX_SCLK_RANGE)
+		return -EINVAL;
+
 	for (i = 0; i < psmu_info->ucSclkEntryNum; i++) {
 		table->entry[i].ucVco_setting = psmu_info->asSclkFcwRangeEntry[i].ucVco_setting;
 		table->entry[i].ucPostdiv = psmu_info->asSclkFcwRangeEntry[i].ucPostdiv;
-- 
2.43.0

