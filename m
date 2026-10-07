Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BD46EF92
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372178; cv=none; b=LsVWYfQvdW9l6UZu36mas0BitMj4v+VlM2GDGcVl9WcdsZm3PMi8WWcF6g22u5ZkF4+iLQhcbALr2DNdSOoHWCsjVdVQeL37HbjyLOvNPcSMfK3O8ne29S++k/YpQUJUVHrSjxjtw37Z7Amv6E3VvVgx+OT94+0G7oQzVB8+g3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372178; c=relaxed/simple;
	bh=wCmOnbqdjTxA8hRmeLks+yHeZWibluiJptI4eT4EaNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0QKLEKiBO1YEkcySSdcin0hvrKIDy+t9m/f3k0ow3k/hIm4qLGCD6+0vd4nE7fuVBTr9KIy8TyGfJpYAgzOtYUrVvS6MrWvLD/uBxn1we3qw5tP3TCtIOvPaB7P6C3IylHY+FLL268n41GhzlYkm2HU9uW6SYge2mh6WnUGox4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLDV4wyO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLDV4wyO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso12990415e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372153; x=1791976953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TghezyuvueP8r6MAiBeZPpKt+82fYbhsR/+qMrAvjG8=;
        b=kLDV4wyOYVSYUGo63zwK/hZNS+IqXutSjseAg47+Q+7wWWhO+wUU0M6PdOLnVUx8iS
         kLr6+vZSY9r+Vrzo35/5oWa2HO579mw8Yb/SoR/jOn5r+sH3CWQlxHhr7a8Kj5fvT2ZG
         pwYqvTD3el7bILAr6CiJUfVcwYHvBXRouDkQz9cBoVVUed+QNszOQWT/rmRHB41TJcxg
         0ES6UgEDZafAMFlmO+aE87mbZZ6/gt2Hz/PWLKk0EyF8y7UUKjE2rB9sWgQwsta58UKn
         5e7gV1esKTez3Xxv1bEGB/QfTKUIC9FlnLgCcvskhzeJDJ/i0t//7aYLh5K12vV+7Bmw
         XOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372153; x=1791976953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TghezyuvueP8r6MAiBeZPpKt+82fYbhsR/+qMrAvjG8=;
        b=zO88o+AUjlYA8d88dz+U2K3qJA039qvcs27Q24A1s8IOpNkb2NGKdAvPNpTVzp8J6U
         sCrIgcQCTveTHCTeWM7KXF/3+D2bEZo8OFTKM2ijs7pcmLwap+5lkrlNWbaLfY6rKiHf
         NVqpvQgGyNCyJx5+5ydySKFLujTw1nt+eAN+rVtp6j9Z/ToXGcqu59EoMb0q5UQZ3nbC
         ZzqHlRrZAoiPJMJKeey9cmiSB1Ry3YeXD4U/QsqwIDsQGsUvEAiR4KLy0Vc+dqd8Gs+Y
         BnyQVz1rKbeyJh35NK/Ann99eHadBTt3LSFHWBqXKrwPboqmB65zuQHah2TwYvH3qD42
         MsxA==
X-Forwarded-Encrypted: i=1; AKwUvBwUGsiB28/TcYFzDr1sTUpTKUMqs0eDo+IfSfXp1UDqoRbskza29ELteDGLRpvCY9pV46LmgccAUt0obho=@vger.kernel.org
X-Gm-Message-State: AFuF++lSGpu1Hn9OS1oZlgfNFed5YKjQ2Bz0nsZis/B9NELIlqG6J+AV
	iqzrh+CeoNWpokIna04bWgEQa4m5Sf9fKuXTq/7tdr0U2MgAqPMSNQk7Dnr3RZy93wdPvmm0HVQ
	=
X-Gm-Gg: AYBFou1IAAhqZreH2BApqVuHzYd7ioDMu852kAE9qr54InDFNfVJWpeW1diPnnB2K6l
	M+vxl5+ImTwptbOEwLMB3NmOWBMX8mYt8u8bfGodvMOY4JDTrClkYJfJpUTGi1JrcoLY3+GMHzM
	togOoGavXsSYL4Y5shxp7PqAczTTjCLst3mMjVuWGJn12aX2vjex2R7nhtRwc113A0dSgldoIJ+
	1TW7xakXEgN6h+T+sLsRv/3Orpv/7z13yQH/x94kq0B12LQvWQMHiwCzJ5o88k7lp6e/ZtfDR+G
	CJCXmsm/+ejhmOfFwXDRTBlpPaqXBQEIPPBJbWcIBsSAYFfQ5utw80Cn+1WEb4mXhhes9MZWTSP
	GWCyIK5SqdbSa4e5pS2hipQekOmL8tX28oHZlWfSs3FBeFF5Ove/iNFwkXmSNyMXZwDBO1oJylv
	Y5yedWA8XecwUVsWZkP+yX1IomKz7YrfI4sAGLBJieVYcBEota5XWERwyrlKVYjIsDKd/nKuxRf
	rmiUIic
X-Received: by 2002:a05:600c:34d3:b0:4a0:1b77:db0 with SMTP id 5b1f17b1804b1-4a18067a950mr29772035e9.35.1791372153098;
        Wed, 07 Oct 2026 04:22:33 -0700 (PDT)
Received: from fedora.domain.name ([217.218.152.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm47145375e9.1.2026.10.07.04.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:22:32 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] fs/ufs: return early from ufs_free_fragments on invalid input
Date: Wed,  7 Oct 2026 14:52:25 +0330
Message-ID: <20261007112225.91127-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for an out-of-range fragment count in ufs_free_fragments()
only calls ufs_error(), which marks the filesystem read-only but does
not return. Execution then continues with the invalid fragment and
count values.

The sibling function ufs_free_blocks() performs an equivalent check
and bails out via goto failed. Mirror that behaviour here so that a
corrupt image cannot push the code past the check into paths that
assume the invariant holds.

No functional change for valid inputs.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 fs/ufs/balloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
index 628edfde3..377ba77fb 100644
--- a/fs/ufs/balloc.c
+++ b/fs/ufs/balloc.c
@@ -73,8 +73,12 @@ void ufs_free_fragments(struct inode *inode, u64 fragment, unsigned count)
 	UFSD("ENTER, fragment %llu, count %u\n",
 	     (unsigned long long)fragment, count);
 	
-	if (ufs_fragnum(fragment) + count > uspi->s_fpb)
-		ufs_error (sb, "ufs_free_fragments", "internal error");
+	if (ufs_fragnum(fragment) + count > uspi->s_fpb) {
+		ufs_error(sb, "ufs_free_fragments",
+			  "invalid fragment %llu, count %u",
+			  (unsigned long long)fragment, count);
+		return;
+	}
 
 	mutex_lock(&UFS_SB(sb)->s_lock);
 	
-- 
2.55.0

