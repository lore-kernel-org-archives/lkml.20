Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AE40F746
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804485; cv=none; b=NH3pj+wSr5qdGUInL5LplqEmPZwQ3qTnrIuo3a6tHDVEF7JU8JydeZJ7KxY3GhSMTyXNSWPzlRBlt1J9U3dsyXi283mGMt4+LGjzIv6cuPPipb0OPZ8BQqZoKWBCKLJ9nJQJ6dcmiy5aAGNKfIkim1VQboFS685OccypX3iWrGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804485; c=relaxed/simple;
	bh=exqEXLN2SY94nU0jMh7MM0HV9X3L3BalWjmZ/lzq+sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rp3ti8qAZZ6cFTSwoW1zHLHRf0QTAt0goD7sVJBB6W1PxLbwROoue+UdUgm+NlT6vBlAOx3/gRTBN1ygO3QvTjsuAi5qZGEptl9YdeQ8R3vS/iQU7S1dh6Dph+Ck+lkJa/OkIKE+m6iPlx0OSprP/pdJR0vNAhnk0irghh0iyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KG/U3s0T; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KG/U3s0T"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe437a530dso61433a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791804483; x=1792409283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDB3l5shmaXveZ9dlihn63ZuXd4kW273Wtsgs+YqQR4=;
        b=KG/U3s0T8p/5bC7NV0gyoiq9rW+YchxwPR3DjtbN8p5sqfjCkiJHn98MRuH3eUQ/HS
         DLiUKVWq3tnI/EsCvygZIpMEEoSmNA0OjbuyvHVAM/b1CbYPdrJ40wJTwiN3fXDRu4d0
         M7IETylIE7oVhhF7p1wHw/vlYhRmpBb0oTrBq4yKSWdqPoN9FvDs/fifp80ZNsWvDwVa
         7m4c9NoMnDkK9m46a+Vm35/fKLu2o3ZRfXtikLDvLMLODiHbhmuRBfGB5UOEglDS73bj
         DS0o/JehetoThVlC5BGjg7ULWvsJZ7KHRtRAlJYmz5jiOj8/tKeLf5f5tbpD6MVQGgg3
         q3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804483; x=1792409283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDB3l5shmaXveZ9dlihn63ZuXd4kW273Wtsgs+YqQR4=;
        b=Ng9GbQJ6rfZ9Z/7c1bFYx3sJDea+cbkRXEQ/YRaB5iOlJNBXqFifhSYvuphPBuH1aE
         IdBkPWkwmAri58RSz7nxm5lZHOv04+XPVNtzJevpHQUk4cc0ViQhQWFccGKYe2NB/22f
         6JjqLTe952ZWsJw/Rmr7EDHUI76Hc1B/dO7cbpA2us5bpQdFG2ioLlXalyCq8byf0coP
         y2XNXqQRlvt0uk049Fu10cESatSXngUxzHm2Bu9bgJS9vNRmYWftvg8S/m8MVAi1e0+V
         0HKVIvLN0nt/jIB5vpmIJKNlBxA5fk5oBhAaWALybMstk856XQmARh22hTQoKO8O/mCn
         WHOw==
X-Forwarded-Encrypted: i=1; AKwUvByzWpyN+nj0faKdDkX0VO5zJo4vu+VMQn/eAz+l7TwiLbVitAVqTWWNNszV8EoXWDOfFvPJW6TeAUBrb68=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcJw/dt+192Vz6Kgj6Qwp+I9flQKXqX6IYRqXmPqOgoh1+RDec
	NU+h/JCyqdth/iUU1ywxwOcWoG0gEJuTb+gENyRLmDcWKmcqtR5DTEQ6
X-Gm-Gg: AYBFou1P9vqCEOMz+BHMSSYVwNLX5m0auBofa9qKFt//PqTbSLOFJiL6BqqyLkGkkGg
	2R+Dpq4dqU7yQTFbS3gAzy/q5u3oiG3MgNtqvkxRcEZz3IUD/J02j7wJTnXBX4LHlU3lIz/x1wN
	3Enm9JNvl8SKU16gSThZ8NkUu6spweS/w0ZiKYpr3A9HHugJdQlTrCg/fDc9BmL5iY/4et8jnAn
	vg3OKMqeEE0m1ERB6zmPWYnK6SttOWTVLlzX3q6/zBdyCpB86WqXuNiRror6WqhRDBZLQlzWyTE
	+auu1m3Hup5EAdFPG5Ki1hbicat+VuMFBDobwYUNoNMMICDFhBfqkWpJ6v5Jeh3PqBtD84NMCfE
	k+v9rIrYk3gIYlVG/k1zMKSWKGuy0ejuMlGhdQFPwTbi0j/XokuwIvDPn7Q0EjhZ7dIYktRTQlo
	G4JPy34BuTI3zqwm0ITfEbPsjS6lVZaWMrnfRpNIcmttro6Kmmx0qr1+u/b9zyAuSg2qxaH/TCT
	g==
X-Received: by 2002:a05:6a20:734c:b0:3df:15f4:756e with SMTP id adf61e73a8af0-3e16bd0ab2dmr12145528637.1.1791804483113;
        Mon, 12 Oct 2026 04:28:03 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c43ae1d3sm3911281b3a.48.2026.10.12.04.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:28:02 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH v2] ntfs: compare streams_interface with mounted volume on remount
Date: Mon, 12 Oct 2026 20:27:55 +0900
Message-ID: <20261012112755.1353990-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012031656.3858771-1-charsyam@gmail.com>
References: <20261012031656.3858771-1-charsyam@gmail.com>
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

Compare the requested setting with the mounted volume instead. Report
an unsupported change with ntfs_warning() so it does not invoke the
mounted filesystem's error-handling policy.

Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
Changes in v2:
- Use ntfs_warning() so a rejected option change does not invoke the
  mounted volume's error policy, as Baolin suggested.
- Explain in the commit message why logging must not invoke the mounted
  filesystem's error policy.

Link to v1: https://lore.kernel.org/r/20261012031656.3858771-1-charsyam@gmail.com

 fs/ntfs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 242fb19ced2b..ed9f29b16c7c 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -275,9 +275,9 @@ static int ntfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 			result.uint_32 == STREAMS_INTERFACE_WINDOWS;
 
 		if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
-		    NVolStreamsWindows(vol) != streams_windows) {
-			ntfs_error(vol->sb,
-				   "Cannot change streams_interface on remount.");
+		    NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) != streams_windows) {
+			ntfs_warning(fc->root->d_sb,
+				     "Cannot change streams_interface on remount.");
 			return -EINVAL;
 		}
 		if (streams_windows)
-- 
2.43.0
