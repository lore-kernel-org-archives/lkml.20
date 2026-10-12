Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C41EB5FD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791775023; cv=none; b=p/8CHPNJD20PTc6QOQZxz2+C6xV9GS1YfR2jL9Rz/PoTWVYjtDPhIL212zw8r4bXR38ftX/Rjbf4vpcqehsAF3QlCgW88nNhTNULs4dpoz43TL5UJUlyleX8iXbyhMX7tmffrVILjZ6E9PsykCDOpbrjFAURniEyts/5LObaMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791775023; c=relaxed/simple;
	bh=BxvRC1XuAyT62AchRs1OxMKiXBLarPUmU3h20ePQ6QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GaNH2MBxIilaW0E7FEFHz6U15UYLqaH0QMRQ937Ab8QSo/dv47OjMOr14AWiHjxUku85d5hZu0/RMFUzbt7XvbaEdIzMNPbmINFnKvv4yHAyeB5I4SEAs09ntNxRK+qjdRlwBNLUEaT0HJ/WnYd21T1NRlHw2Q/thG8NcjIwMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCOpoTSN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCOpoTSN"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d01548ac96so681215ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791775022; x=1792379822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvT32PQO7yxL197/No+w7Ayr3zcIYifaH7M7l20t4kc=;
        b=dCOpoTSNFY86+VZa/vL8cwLtIirD548usrJ23vTjETh6TbWOdcnyO7SGimL5ko3taW
         52j7vcP+q7ADG4hcEDRNCAyppqPyvbsHeiMviIScw0FfAaQR1oXdGahGmpQ1dUSsiirO
         yqTRBlPih5EQ+uMFyl073YIK0zhSG0giKZBqAnF6axk3KNujbwhpuA7wF9kWh/P18N3s
         1gfkdKIhx7JXB7X4X2Y5Zea+hfdXrAzJfNRGsVvviqAJeeId4r84Hr5ETkKK9U2lWbdA
         G42j2r1eTQ+CEtvzpjz8YGZCwnsDaAArsopRuchxLJ9Oy5qY6WobWfwsT5BQSKv2oys4
         l9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791775022; x=1792379822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvT32PQO7yxL197/No+w7Ayr3zcIYifaH7M7l20t4kc=;
        b=PjT0UB+4Ut0MgqvYxIMOBoPDQj19kMYE9giTvaJLv72xROMO+WrdrAOBviUhrOokKF
         B36b7QHxeLNzKheSdgbvJRcLFlTOjWJk9gmr6Jzr+X2BI/cfc9ZUSp0ETgvv8pFambka
         lPIU3BZN5xgZ0blNdBownxif/bxV1pATkQqHs+jdth5IXMpFN8TJsa+fnmHl72O66veN
         Ya+CeqdCmTANBq3n2Jwuxu0JXgDkGqDERY9xe/VsQ6PHH9Kid9U8S8xl4OsqRTOlZPM7
         0qy3QZmIlFc3bmtpYteaEYxjFQH9fUeWLAnR00wBXIndY/AZ5NHCpdXlmUeS8FEkHhVx
         zOhg==
X-Forwarded-Encrypted: i=1; AKwUvBy3T5n44BLEeMWel5gmECLGeNLQr1jDSxMbCl/RQKt9YHYfXfpCiirNw1bfrFo3UbI3BXBP0XfBeNfWqOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6HkuQmp85ac7w1zIRzWWno7bIZtZFLfq5ORsVhBF8a6UE+w22
	RuSY4b2aKDs/Jb00QWM/ztmYp6U80o0H1xm7nshoceciZAb7cuMYTsdZ
X-Gm-Gg: AYBFou0E20gcKg9dCi0pHXf4ePbiWx+djus9NOp18jG0KJYhPBlYNik7gKQvSx0XsPL
	YcUXshz9YezJRUN4A7q60nf1rPLhnOcQULjgMsia/5ZJ6FIKNEPuFQaKQo0OXKQTv3B/e4CH1SK
	Eo35b818kuax/hxjFrAaWu+dK5TvF6cn6TXevaw5PWz4dTa5eaHrQr8tImJpYBQPG7uAWudoFHQ
	kJuv8AXG+OvsYjdIWKVohDw24IGo/cScKAwcVvZkEy4PWda6osHlcnpojKYtSiE5Az28StPIndy
	n6zbs31d9vR9UbsnRwBHVbyXl4a4LVYnT8bbd5Ec/aYxEgAcOM2k6An1JsQNM/hX0ZPMp4XjTvL
	MdXcLH0h6Ofdq8PToa0nQsXK3PIFrZXB9dxyruxqb5wt5B86Zr9gn2GwrZPAMia4BwzNzI7qGE8
	+8Z5914d8iHmXpORnGXp2sN9V24dmyU6RKAgHeQrYr9bejI4xtvN53YVA3lhLpl+fMLqZvUjWfq
	A==
X-Received: by 2002:a17:902:da4f:b0:2e5:da30:39c9 with SMTP id d9443c01a7336-2e84289f2c0mr106365545ad.2.1791775021791;
        Sun, 11 Oct 2026 20:17:01 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b160csm37798575ad.37.2026.10.11.20.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:17:01 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH] ntfs: compare streams_interface with mounted volume on remount
Date: Mon, 12 Oct 2026 12:16:56 +0900
Message-ID: <20261012031656.3858771-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During reconfiguration, fc->s_fs_info points to a newly allocated
ntfs_volume. It does not contain the mounted volume's stream setting.
Consequently, a windows mount rejects a remount with the same
streams_interface=windows setting, but accepts streams_interface=none
without changing the active pathname interface. This also breaks an
ordinary read-only remount when the existing windows setting is passed
again, for example from fstab.

Compare the requested setting with the mounted volume instead. Use its
superblock when reporting an unsupported setting change.

Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/ntfs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 242fb19ced2b..711e90be9382 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -275,8 +275,8 @@ static int ntfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 			result.uint_32 == STREAMS_INTERFACE_WINDOWS;
 
 		if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
-		    NVolStreamsWindows(vol) != streams_windows) {
-			ntfs_error(vol->sb,
+		    NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) != streams_windows) {
+			ntfs_error(fc->root->d_sb,
 				   "Cannot change streams_interface on remount.");
 			return -EINVAL;
 		}
-- 
2.43.0

