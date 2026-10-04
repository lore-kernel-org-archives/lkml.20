Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1A32B12C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094223; cv=none; b=OLY+UqJLwGNO21oXoUX1EWVmMe5oDpiNCYMR20/WJeV++wxPQ9LHmfCA/s6pirT3Pl0LxuKtlBPcbH9rbSQc8FZO7LGxmilcPnyM9lL7aQd52dj3VxuQHlEfd0f8WmXu9CYc6kaoleh4ElKTpPlco336ruD/M+mCc4rgeuuLvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094223; c=relaxed/simple;
	bh=6sxk2tww2VGXolVUOhPmyMP57/cl+QMiVkRCX1JnBUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awmE5t1FX04ulEvr+ntb7GgGmmmERpcWLrO+9rsPPyq+/B3xsbB60gRMR0u3+jcHR/Z8jX9Vy9L72EYc6ywPXrz7BHn34sI2y+WHIiS32BDlMJje6S5QiXv8J/afAsFTioN0P04hhR/HypcWuuQGyUYJuFOQNAvi73Yw18vkfxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzdXsyS9; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzdXsyS9"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09dso244760a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094221; x=1791699021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04hTsdUrWnp+GI0S5nrnWDa1XwZ/YzaTtTKcCpafa/Y=;
        b=LzdXsyS9o88xBdwO0v6kzYptf122oXFWS9NhKUcgLDhkaiqjFSyg0WPc7L200u0eKM
         guxa8aTajuBwLVnu1Jt20R8UP4L/Bum54+TpN69o6QbSNsjshPVSVwqPGN9bzANqplND
         OzTnXa3Jp/eWTt4TKBw2uRZWqTAMDaXs8VrWanTF69Spq2T9xQfMKC6hUwUnvtIYlWsx
         uYJeXwpIjwAeBv9FZzS2Wo4VtQ9UiX/fBNNVQ0ofX5wIJo5HNVS6OL1tiY6gBBxQsrfR
         ot4ilusGUQfndrrtUxMxEPYiG4sHdpjcpLosim4ZHF6aSlrCpMjpuVCz2MQzCq5xBGmE
         B7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094221; x=1791699021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04hTsdUrWnp+GI0S5nrnWDa1XwZ/YzaTtTKcCpafa/Y=;
        b=UCzt9mMs91E6/vghQ/0Yd5MBcmbx5ezYq7Oq0SXJkQGcHRH1rkf4pyLX5CXfEQcqeG
         FwUmJU7opktpJo67JcdAKlFWtmWqyquaIf7yQZz+llgCxxWSAIQDChs8j/h8YIg/eqaG
         0pkAk4Vd8MTaGIoyjKVVZBpxz4rKE3CWeX1ygnQ/ZXULMyHUtO7GHiaL734zfs8VgjiG
         SW1Fqw2WRwuOewW1mwobRSSF4jIml6GktEbVlUe1HQWhDtNZKYO0P3DE0pNXUByMJLVG
         gX0DWv/sFnmpTesJKlCAP/AxZ5bNhdrFSK/uimbIacDTcLom1LTcwADxTrc13HvPqVHn
         +vYQ==
X-Forwarded-Encrypted: i=1; AKwUvByOTkZo4brXgjGl9Gsgxzfg9S0doEh65SDZ8wULShDdCOVv7HADFDK+7XBkMI1PDpJT8rP+PNylUGhWOJI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6kcfMkokQV3tSHpghW0s3jUnvLS/EPkGddXxX0Vdj10XmuaPo
	/uf3lQ7VwYkZ3BmqwEdoiC73G4Bsts/WMFMZyyacLy99NLer8oQxZq5d
X-Gm-Gg: AYBFou3jtJyeK4txOkE0P0gS/Gd7JWnu1jNoKh6V64dFXviIAJq3Xm0HamFpJEloc50
	XP9djKJe6jt5JE7ZJL06WPcFIQNM2E2zsX5T0yVUWbork3hTTr3kip7Zto9K7Ce78bEXsCmyyKt
	uAaq8TUYWhdEHLWQao6geoGSdN1N7bm8iriYGgisZwMkDNgnWV/ze0GOgGZOK7gSH28dCjUvmoW
	fTvzcIjCsr+Yto+n5u4o9is9nctQ9siNCtOXkWKJiFQ5Y/Hdogl4HE4IAnj4z1XbN0roeAyXIAl
	nEcvyvW3WfNZiAvjrS9hwQi6cUC6zlCaSKxmGCyaqDWjw+cK5J9hX5PGlOq1YeZeQZ5CK76CDZp
	KweaBZRsos3nQ0vSK9h2HCkvd7ddc2KGcB6gNsBoR799Zsuiq0sBARmRpgc42Xi/0kpJhzgsYb4
	a9VpPBf+qfMPp3edYacqhB3Z5Biu0tSTK25WhnG4oMxjiUgErop0BS7upATqMhII3TrXUvyd64C
	R6DOG5TQqAdD45T8AI6lWv/cWiFde/5Gda29g5Mmc/G+6kwueofccqLZHHbPil22aDtD3Wp
X-Received: by 2002:a05:6a00:8d5:b0:880:f278:6b0b with SMTP id d2e1a72fcca58-88af3cc62bcmr6165889b3a.4.1791094221281;
        Sat, 03 Oct 2026 23:10:21 -0700 (PDT)
Received: from codespaces-2362ac.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f5b79sm2427955b3a.15.2026.10.03.23.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:10:20 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: yi.sun@unisoc.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>
Subject: [PATCH] f2fs: skip further SIT updates for already invalidated blocks
Date: Sun,  4 Oct 2026 06:10:07 +0000
Message-ID: <20261004061007.7433-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When update_sit_entry_for_release() encounters a block whose bit is
already cleared in cur_valid_map, it reports the inconsistency and
corrects se->valid_blocks and del. However, it still proceeds with
the discard bitmap and checkpoint accounting updates.

This can clear the discard bit unnecessarily and incorrectly decrement
the segment and section ckpt_valid_blocks counters when the block is
not marked in ckpt_valid_map.

Continue to the next block after correcting se->valid_blocks and del,
so that an already invalidated block does not trigger further discard
bitmap or checkpoint counter updates.

Fixes: 81ffbd224e5f ("f2fs: update_sit_entry_for_release() supports consecutive blocks.")
Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/segment.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 51858f64e43e..fc2f0fd8e318 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2560,7 +2560,10 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 			f2fs_bug_on(sbi, 1);
 			se->valid_blocks++;
 			del += 1;
-		} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+			continue;
+		}
+
+		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
 			/*
 			 * If checkpoints are off, we must not reuse data that
 			 * was used in the previous checkpoint. If it was used
-- 
2.53.0

