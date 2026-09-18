Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB302FABFB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789775025; cv=none; b=JwnSNDSSi3qIFHggEJamzganCUffBZVKxaGUzpbGVZn3E5QrQ4rx8IIGyxmDEoruuhx0U8Lzam2ipivU95fAtJMJDrXdLD9MLV85xuiOnwp/3SWIhKUTR9MvidbHjlyParOChNBhT+k6cUJ8WHXScCsJpMMsIXDotXjCXSUTJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789775025; c=relaxed/simple;
	bh=yVjbgC4CMiNqZuadtlsece2kkWi9WaJOKCsG9Uk68RI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CjNq9U7q6MAFM0wdB8diwkfPBjrZDOMuId27t1wqFWkZeSalDZ+pMjznRcGF0A4XlSjBpMa5MLkDTjr6nJVt8F6OD/kKWQYWAYAURLNX1vuL85L82uYkG5UrIoBiHTi2wbdtW1oihSzILMQkXKGIM1NAdjAPeE3kNOeDPlQ/+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZXMSHp8; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZXMSHp8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so435880f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789775022; x=1790379822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgKahnX9yPSvT7KZdkfKMgtKpfOFWThRfybvZ/wWJSo=;
        b=NZXMSHp84YGtCFRmJFYCDqhkKxUslBDetCa5tIf4XG7TQ+1B1QCvp58Y3Iu5+1lS91
         PYbPMj2w9WdusSxKYF4dWX0ZGBrlhBbpdkQXIQm3zYT0n4y3vmCQ3Bsrh0wkMGoS1lxg
         m/exOdYTgivaMXMi8deGo+R+gYRTNRxRm77HwacrLOwGwXEhaNvipqYGb6pecKlUXMWA
         HTkldxvBnQCelRpMxive7gCjNpN63ECWIgDiaAtoKweKizKXL/O6aLWBmH+e7q59bTVb
         fkexvAMpQeUjW7sVen5rvgHRlO9XN82cnK3K0qKLbKVVEjeNa0B3uNMrnY6JOjaGn/6Y
         +/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789775022; x=1790379822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgKahnX9yPSvT7KZdkfKMgtKpfOFWThRfybvZ/wWJSo=;
        b=QyQkPcu+rV/50vn9dOXmqhtih2q/WlpKkgEM9LDhIQdu7vzi2ozW593gkyy098rIth
         /6Stabn/D6zW4pA4X2J2s4z+GV2NP2pOHS7Eee4TK4KkZkkf1LqwCfo93gtOi7BBNGdp
         c+diZciDTvJKJGZ5PgJqOe1vdS2fSnmyUaXMncYNlY0gIzXGj2VioqBoXWpSqmcip1dO
         YpHROMZ0YNHJAvKfjAOYUQN568Y4CzsRRHHEy+YDkPkY2JbgsCkJo6d5CYYghVw4d072
         CE6R7L0vFRZHvbvsAetTzBDOhdI2OQ8+Me6ThNncgscT1UA1oSD37Rvu5k0rkAGt4XXc
         cF1A==
X-Forwarded-Encrypted: i=1; AKwUvBy3bRikt5yVwgeMZzPgaKcnBwX+NpwGb1Mr5FUnyxOb7UR63468WCTH/pZkl4LK/G+PwoDRIApGTApMXeM=@vger.kernel.org
X-Gm-Message-State: AFuF++k9yG3lXUwg6wgznj4m26RgbfQBBLquESSrgxWwFkW6l1aB1dxY
	NouOTZFkePy9oxLs2Csyp8Lhu3jtlLXf7/Ycsey025Tt52JPifpP10/T
X-Gm-Gg: AYBFou2YsiBkaGjIyYxf5uGrUPZLz/PD2pxkzfy4nd7ATlWgQ4yBBZIr0F2DvA1EKac
	WqOYCWloF7l8WNanFdUqGIEV/PfqHpiiIk5vZk5I5wAAQ31znlLc0Z+iAGAsCfAMB9H6QzaA1ZR
	DJo7CWsPm81wHR8lIYG14XdxR8uNmbQARfEJZPEOOfz1WPhyQHlHGcsUblH4kg4tiEN7YNM8Wyk
	6q1JSEtEV3NmkhLifZhMuYdpX0GlZEwwDyGv8JK5pB982muMWmc1NCOS3PZK7H1Rpl5BK86N/fJ
	uJFV7iBxTBDx8S+2ZapByTcEozLlWSK8MVJiA9Wq6sMKKO22xHQBcLruanjcfEDCpO4Ii8V7nfL
	MMHsWfrXvan5cLAgpCSqhyw7H0YEz5fO+NlbJ/Ugq81yMVL/m0IU2cITPvoZcd9o3TD5IgeLQch
	Om+jHSH6x70sJvCxpk/kdL9EadkMELzzC/kfchM4SSWs/0tikUfwlVtOrOOfx3FWPfRBDAdNtEl
	N4iBK1hSN6b/P32aGST2cK54T2Zxa0S2ug7L/AFMTazQQYpfYn9yZJonIQuPgRkeLE=
X-Received: by 2002:a05:6000:2688:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-4871d98cdcfmr6375274f8f.4.1789775021601;
        Fri, 18 Sep 2026 16:43:41 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm2482874f8f.0.2026.09.18.16.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 16:43:41 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>,
	Milan Broz <mbroz@redhat.com>,
	dm-devel@lists.linux.dev,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] dm ioctl: don't let data_start run past the buffer
Date: Sat, 19 Sep 2026 00:43:39 +0100
Message-Id: <20260918234339.54105-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct dm_ioctl has seven bytes of trailing padding, so the smallest
buffer userspace is allowed to ask for, offsetof(struct dm_ioctl, data),
is seven bytes shorter than sizeof(struct dm_ioctl).

get_result_buffer() sets data_start to sizeof(struct dm_ioctl) without
looking at how big the buffer actually is. Ask for the minimum and
data_start ends up seven bytes past the end. Callers add it to
data_size, and ctl_ioctl() copies that much back to userspace:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0xad/0xd0
  Read of size 312 at addr ffff8880169e4c00 by task repro-dm/140
   ctl_ioctl+0x5e3/0xcb0
   dm_ctl_ioctl+0x25/0x40
  allocated 305-byte region [ffff8880169e4c00, ffff8880169e4d31)

A DM_LIST_DEVICES with data_size set to 305 is enough to hit it, and the
seven bytes that leak are whatever sat next to the allocation.

Clamp data_start to the buffer size.

Reported-by: syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48d935cf48a4a76be346
Fixes: 76c072b48e39 ("dm ioctl: move compat code")
Cc: stable@vger.kernel.org
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/md/dm-ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index a6b8e97755cd..211569dd3c54 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -656,6 +656,13 @@ static void *get_result_buffer(struct dm_ioctl *param, size_t param_size,
 {
 	param->data_start = align_ptr(param + 1) - (void *) param;
 
+	/*
+	 * The buffer can be as small as offsetof(*param, data), which is
+	 * less than sizeof(*param), so don't run off the end of it.
+	 */
+	if (param->data_start > param_size)
+		param->data_start = param_size;
+
 	if (param->data_start < param_size)
 		*len = param_size - param->data_start;
 	else
-- 
2.34.1

