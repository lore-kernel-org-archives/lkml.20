Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907274;
	b=yibFO1QhDK/xnhMaNj9GpxHISorfK+9+Ihz3/lOTus7qaidnGSJcBrCuXGxmmw3ilLki
	 eBSyEh5EnFutyAUwtDfm4/5UUHaN4cI0KDATsHBlTcVZqKkmuBl9nIdY3vC6g1ky4x9xF
	 nJT5ggAUWobgj/nuNs9NZgRs08CCpK7/P8ms47gMrPbWZiMSf+DugNvpdjHNHMoRn5W2x
	 Z7tnBI2ZBj7E4unsa+wcYcw6swdA0JPQbxmbKTE8Q5QUW5i9sMr20MxG67RrGlnIcHwgM
	 +E4EsvBokjBiLsoiY6sLieSSHQsVfL4VIT7NXPXlg3mBOgM9gnc5xcQsx7TmteXmyOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c2Z46g+2d6YNzRuaG811sRC4NjWfmshbPD/+UgFSWqo=;
	b=U27SuzhMPXlL3IuUPtIls+2v+Oz9Q9XGtsNnroiG465G4DAORet3JSozvmNaQM5Rj9qK
	 YEi5EWHv2N7qJq6ssACECnYrqmh7CrNNFGh9iajB+K3UX4qw6srZtdGegK6IFXTBjv9+Y
	 1UMODc/zCSjYG9VqpJQjIiDzZ4/hhcfw5VknUDT2XW+SebPbKGLxIOdXUm5s7J5azJEeY
	 eSXll63BDk2WQA/9ei+q77Hh5SGiuifkHNWonFs5d4voyIq9h3mdbqRsu4yASzNf+X8ZT
	 nJ/PCJWIInnhTMNXS0uOE2OX+RMShcCBKE29GNwt+XD0cE4FNGK7ivPMmFQQSaXbnUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFnPpQPJ;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B4606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1B4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFnPpQPJ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a9f9473029so4108548b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794907273; x=1795512073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2Z46g+2d6YNzRuaG811sRC4NjWfmshbPD/+UgFSWqo=;
        b=oFnPpQPJrOaYZnV6BJXG4Irgs9kOnHDbCySe4yt+K/mI9jFKqe/arHGYU7puPIhcvi
         OOAnzzvcTfvEgHuJMhKCywNVVviFUAXC7YzydW/0dMxHqaoLWoNT1IkM9CnhRfhx70wx
         +mwVaEXSJhT8zYkV94lIFHJrhJh4UU03Y4Dv7hLraJKp6HsiDmxe1WjSL+3rqqcmF6fT
         WyH9w/iz3iSkoRHvGJdbfjwXvIhZAbExl3/4GRGicG8/7uc/wJjwG6wZxJsPgYMbv+j6
         DHLKShkLk4kTmurYR/Mek8ysQnPDmemPexDT6USkfMdfO6KbEhfRgmm9fJR53RUJscAg
         Pl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907273; x=1795512073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2Z46g+2d6YNzRuaG811sRC4NjWfmshbPD/+UgFSWqo=;
        b=ZrHMNh3WTb+F+/+8dpJtJJlc9z7z1zk7Zx7+QZNsF0PGf/gUSW+QkoHqHape1LA34P
         lIof7wX2IiPVSV3bl86qnHLgOkaGiyVnAB/bgx/iv8HC64nLtJ/dzfvYR3TIHyygD7mf
         7jRZO4aSQegOqDHsJiSGP2jJ3xq4YAepg0Y6rxM5u13kxTqr1RIagD8tV6ZjAXCtGWBy
         AYEhZY410xvqWrlnmyNHguTlyVh7CxjWE9KKskkuPi/ukZVzbVrqxr+L/Y8IXMez3eVg
         DgBArBqQumhKGUTO1F3fqV+WgqO8rNsO5FUZJvh+lb5FIuDkRt6pRaDSuCKWpSIxfTT4
         oJAw==
X-Forwarded-Encrypted: i=1; AL+hErEtPX0LlshiBxktsGdd9FHqqRiXRPLuNDoKMMW0cvStObobJ0P6634DM/IK9hFonUzOEFpHovOzQan0CUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b0M2XMIVFuFoerZCG35d1jNB81BprFj26/HeMxTHFflxG7+Pc
	HyMZlEB9RTY0X0VW4AKGwGT85uZ5Jgy3XrVZNq9tenUdIzqV041NonBO
X-Gm-Gg: AYBFou2NoN9h9dzx0dfxgz44Xyqs+i+8dNFlo48EvkS5KJuA0Kzs+eK7/X2fjIOUkjA
	IZCKu1Ch+hSHVB2fwlngwoQ9SCA2M+GGOX1Jkt3MshzSSebIJUFTZw4CfiIsrEMY1eznDF132Lc
	Jc6JgbAKVWhTm6RLMt8F/mKTamSGGb/08kkhqtkG3SZbyDMqu5Y9pbf+IuvzBjTqEhJ4/GsTWBv
	2NWeWizNobwXc+h655V9Y2XeRJlJ2bsLwQ3/U78Hag0rxTx3NvTMTpgBA2EdV8CN4FyxaEaKizy
	TEs58BnVu2zg6UuCHVeumKa3NadVzMxcaM4SUNlRGFDinV8kdk8tU0Y2yQ5+Jh1OWOHYSgfnhZJ
	I2WKzEAhuHgJyBEMl6DA/qgFT/RyPAzKv36inDWaG+7QVpp+gTTSnxTxOZk9ZMwfIn4xrqyc3ky
	lqdyG8kFhqxCofNP4PYeW+dnsV5LNBuVa5TxsTUWx4a3R/x1T/Q9W1/jN8NJU7kjMb7ruuGfyaf
	Non2YaAMzHo6fDw+3LpDVRbGfQex62JP8cR/H2N6vtDa3sLAw1ilAcEKw8SqtyGsq29wzQF9yaX
	RKKT6TXbd6DA7f2q9624N2AYJP1EtpkL6tKSV+E=
X-Received: by 2002:a05:6a00:1a8f:b0:8b6:12fd:7285 with SMTP id d2e1a72fcca58-8beb21cd241mr12546220b3a.2.1794907272845;
        Tue, 17 Nov 2026 01:21:12 -0800 (PST)
Received: from TheRealOne ([2409:40e1:499:722a:52aa:d755:8f06:9251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed204f7d6sm5014996b3a.35.2026.11.17.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:21:12 -0800 (PST)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: xiao@kernel.org,
	magiclinan@didiglobal.com,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com,
	Chandradhar Kumar <chandradhar.2003@gmail.com>
Subject: [PATCH v5 0/3] md: enforce MD_SB_DISKS bounds across v0.90 superblock paths
Date: Tue, 17 Nov 2026 14:50:50 +0530
Message-ID: <20261117092053.10884-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The legacy v0.90 superblock format (mdp_super_t) embeds a fixed-size
array of MD_SB_DISKS (27) disk descriptors (sb->disks[27]). Currently,
several configuration, metadata load, and sysfs store paths do not
enforce this upper bound, allowing mddev->raid_disks, rdev->raid_disk,
or rdev->desc_nr to exceed MD_SB_DISKS - 1 and trigger an out-of-bounds
array access in super_90_sync():

  UBSAN: array-index-out-of-bounds in drivers/md/md.c:1740:29
  index 124 is out of range for type 'mdp_disk_t [27]'

To keep each logical change self-contained and easier to review, v5
splits the fix into a 3-patch series:

- Patch 1/3 hardens on-disk v0.90 metadata loading, validation, and
  synchronization (super_90_load(), super_90_validate(), and
  super_90_sync()), preventing the out-of-bounds access reported by
  syzbot.
- Patch 2/3 validates raid_disks and maintains mddev->max_disks when
  configuring v0.90 arrays via metadata_store() and md_set_array_info().
- Patch 3/3 enforces max_disks and MD_SB_DISKS bounds across all
  branches of raid_disks_store() and slot_store() so out-of-range sysfs
  configurations are rejected upfront.

Changes in v5:
- Split the monolithic patch into a 3-patch series.
- Use 64-bit signed arithmetic (s64)mddev->raid_disks - mddev->delta_disks
  and reject negative disk or pre-reshape counts in metadata_store() and
  md_set_array_info().

Changes in v4:
- Cast sb->delta_disks to s32 before subtracting in super_90_load() so
  shrinking reshapes do not zero-extend negative deltas.
- Check pre-reshape disk count against MD_SB_DISKS in metadata_store()
  and md_set_array_info().
- Update Fixes tag to commit 1a33a379e678 ("md: reject v0.90 arrays with
  too many devices").

Changes in v3:
- In super_90_load(), also validate sb->delta_disks (for minor >= 91)
  and active/sync disk raid_disk indices against MD_SB_DISKS.
- Move the rdev->desc_nr bounds check to the top of super_90_validate()
  before the mddev->pers == NULL branch indexes sb->disks[], and check
  desc->raid_disk < MD_SB_DISKS before assigning rdev->raid_disk.
- Reject n > INT_MAX in raid_disks_store() to prevent signed overflow of
  mddev->raid_disks prior to metadata_store().
- Update mddev->max_disks in the info->raid_disks == 0 branch and the
  non-persistent branch of md_set_array_info().

Changes in v2:
- Drop early return in super_90_sync() so rdev->sb_size and sb_page are
  initialized before sync_sbs() sets rdev->sb_loaded = 1.
- Do not reset rdev2->desc_nr = -1 or zero sb->this_disk on skip; instead
  populate sb->this_disk as faulty/removed with rdev->desc_nr.
- Validate mddev->raid_disks and set mddev->max_disks in metadata_store(),
  and move the raid_disks_store() check above the reshape/active branches.

Chandradhar Kumar (3):
  md: validate v0.90 superblock disk bounds on load and sync
  md: maintain max_disks for v0.90 arrays in metadata_store and ioctl
  md: enforce max_disks and MD_SB_DISKS in raid_disks and slot sysfs
    stores

 drivers/md/md.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

-- 
2.56.1

