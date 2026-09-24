Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AED356747
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224301; cv=none; b=t1sdkHf99OmdapCZejpPTM98Dl3fZ3ZPdMWeFmFmTgGUo7Us3FeBlq1/XDmeSMTbxI65hD0FP/7DX3Oxq8/JeSQfAc5mv4A8wmV3lAPPWBDGMqPkdu4onZAIwr2WTkYpcECWCFEulfoJoGxgcJGf0OPaICL1TbWnb7vSWDkjUhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224301; c=relaxed/simple;
	bh=DRylgV4Cx+aPGGL0RMZLnjTqy7p1IvTXsAq+fgAiGY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMY5HkYiB0rn5OlUL2HRPRe36Te2gSYhJoFr46TY9cvR0AMppbd+JfpOLJU4sD2Yq3M6JihDmLx7hzqgHQyOyYf85+6/ILLsfDAytXcTPWwXhdNqeOalLX+I5dH+d9CZfH9QvHNhqkt7i+Ve1tOS6WNYyirnm3fVNORJqBk/l44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJYF2I28; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJYF2I28"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so908956b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224300; x=1790829100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMjWRKOozJ8YXqfO7vP6HjijcZHrUo8rG5y9BxzpHJA=;
        b=CJYF2I28c7r402qBo5Bn+AvaVKAf6YZY4yW8m4cJFRmBLVkk8/KFOTbH6kDBCNro+r
         N8ttrqu8CtA97UDI5wMa98Wt69Xcu8odEZDjQvcTzliDHxLRWcEbzvoi7PP3tftgIuxM
         Emtmcj6sIxmlay6VoEbAP0jfBw6eHvZ5eH1fA2pgGNX/3g8RzGwjYpJ2mtCP83RLqK85
         LoHdJqRoBtAZhO1Z2SaV7pbqS838z9YyJMPX6Omm5rUFlORiNiG71Vxxs//b3M1N7kSN
         1ggiBT1MshzXVppzFzxvSwo4CfJiRl1K6k2hR2PewI8cozeUq6xxOuq/yYfoE2dXvvtQ
         9k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224300; x=1790829100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMjWRKOozJ8YXqfO7vP6HjijcZHrUo8rG5y9BxzpHJA=;
        b=lht0099sr1G3iRC+RosFcH+deerydn4LD9nKUWeBzzbc1P7nPf/qpQMDlKZKOs1gBE
         t1OxkucYCbxiGxZZn8+91rVaOriP4iHTif3H5LDRFqRe/PzmlEuQfyE5HtWconRiQJIu
         JaMHkt8SFWD8OLoFlrsIS1XOoALsZ/KeTy6nzNWx+y4zmOsz7mhvfWTz0Z9TDf/3myt6
         i1hyC0CZ0e4F122kpgP6raCfqNvEUeWljljYfWSnaxo+t/1kAhTcPoqcKRCVl5PmQnow
         WRdgI7dvpu6kOm6x7DhjphpsdpR8wK2RW3ZjqyMD1efbZgOGYlx9eNwQsoiIGQ/RoZxE
         o5cg==
X-Forwarded-Encrypted: i=1; AKwUvBw6hFTIbcAibaJVvyxWeqIOPJqP/Aw8qAvP+u3CSqQCz4YLQuV8VIpdNY4rU49RnD0Gqng6skmjaD3HKGY=@vger.kernel.org
X-Gm-Message-State: AFuF++leoHxgVYV91hhSWYva/HjzGLoO5S0upnHnTrpSz1EAX6eziFQl
	Cyok02vmmX3Qsi3cByF9gKxEaPJ0fXtNlRITqM+cf9cmC1seLaIlhbh1
X-Gm-Gg: AYBFou2Mrs6EnSTqq8beA+7oR9TRZ6IAaQQs4PUDHWWFrw2z3seFfs6RyE7tcMuHskr
	9qihMb5PmcyQY2me2Tzu9BkiMCrCeOpLbNJPeDM0oKOjhoWsP65Mw5vd4jLFzTcdtFO0c9CGVsM
	sJEhg/RlJ/Uil6+JpzG1XWk5JgGz9KGCJ8nQQZQV7NEfnPevimRTFv0dQHLarYz6JUkEsL2T+9g
	64oJrvV94pH2xtgjCJ817bA5INxmQroyGvKpbB193iSor1dWDDxs900CI2Cp0nMLOa/WFXZgs1M
	ql+wJnWEWKg5S+gATCByPORnZ8V5I4CARCmAHRNUZcQL9rtL7yDXza/Gpms2iWrdllhD86Ylj53
	2+tJKNVeh0H2DfLRzRTdHxz6aNz7Nq0aFslrfV3d+Gb40kvge/odbKawvh88+83IhUqEXfHSJue
	Txw61apnFdhmqbHehJkeR9NmvDhnOFU7tbCI+lcONgwQcqtpE65vyXevyUtAnKTby8XUoDNPb0R
	BOlWig9Fki3k8jBA2lqmJ+IWh1B0RnwH42nos54hPEIL6zKobO/eXxHKrXULVqOybccPmgok/A9
	aQWyq830+n8A8vKlvjCqcj3z+6Gc8nbiAPtrnTVEmO5MutXYUddb+u8AMbs=
X-Received: by 2002:aa7:88c2:0:b0:857:72ba:ff0b with SMTP id d2e1a72fcca58-87e9917f67amr1139161b3a.19.1790224299560;
        Wed, 23 Sep 2026 21:31:39 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1331sm2180146b3a.24.2026.09.23.21.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:31:39 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/6] qnx6: validate di_filelevels in qnx6_iget()
Date: Thu, 24 Sep 2026 12:31:35 +0800
Message-ID: <20260924043135.3894182-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921042511.1473629-1-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org> <20260921042511.1473629-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hui,

I hit the bugs fixed by 1/6 and 3/6 while fuzzing qnx6, so I tested
your series rather than send my own fixes.  On mainline 40288c9206c1
with v2 1-6 applied:

- KASAN/UBSAN kernel under qemu: the Inode.levels = 6 fuzz image and
  two Longfile.levels = 6 images, one per active-superblock branch, no
  longer trigger the double-brelse warning.  A root inode with
  di_filelevels = 255 is rejected in qnx6_iget() without the UBSAN
  shift reports.

- Userspace fs/qnx6 build under ASan/UBSan: LeakSanitizer no longer
  reports the buffer_head leaks from qnx6_block_map() (2/6) or the
  mmi_fs error path (4/6); bad sb1 magic under SB_SILENT is rejected
  (5/6), and sb_blocksize = 0 no longer divides by zero (6/6).

- Six valid images with the same trees in both superblocks produced
  the same names, sizes and MD5 sums before and after the series.  They
  cover 512-byte and 4K blocks, zero to two indirect levels, either
  active superblock, and normal and MMI layouts.

Feel free to add:

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>

Two pre-existing problems turned up; neither needs to hold up the
series:

1. qnx6_block_map() shifts a 32-bit block index by ptrbits * depth:
   35 bits for 512-byte blocks at depth 5 and 40 for 4K blocks at
   depth 4.  Both levels are valid, but UBSAN still flags them.  At a
   bit offset of at least 32, the tree-index component is zero; the
   mapper continues with the remaining indices.  Guarding both shifts
   against the index width avoids the undefined shifts without
   rejecting either level.  A test-only u64 cast removes those two
   reports, but the images force high levels onto shallow trees and do
   not test genuine level-4 or level-5 trees.

2. When superblock #2 is newer, qnx6_fill_super() selects it in
   sbi->sb and sbi->sb_buf and releases bh1, but still uses sb1 for the
   Inode and Longfile level checks and root nodes.  Thus it reads #1's
   inode and longfilename trees through a released buffer while
   sbi->sb points to #2.  On an image whose superblocks point at
   different inode trees, old_file appears instead of new_file.
   Setting sb1 = sb2 fixes all four later uses in my tests.

I can send both as follow-ups on top of your series, or you can fold
the shift fix into 1/6.  I'm also happy to share the images.

Thanks,
Matthias
