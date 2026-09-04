Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00D3E5A07
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565314; cv=none; b=gJKMHWBnsCVFJkZDvdHdykWh+m6nEec2T/PUlEhKCd4pUUDi1R07YqFJshsfoPWw87UPQ2+3QFk5VCVr8/JPfWDLeicR9i10ehha64TgaKRJ0b9w6BP2PXIcegpXEVL+9OosJhlohRxIU3cEeGGPGNxs/7H60mQqw9vPH0RJAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565314; c=relaxed/simple;
	bh=OQNwteterpbc3IOHurGDzXnqV1Q89ZIRmQiLUC8eJss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTSRFnXNesp6EVf7tn6nvwEhn2Aytg9lQ/t2QGcOfyloHDBAvkCEmm41Z3DaXEmes+cbiWTi4zms4WgyrGc0Qo42h7h6L1qhmjz1PVZeBLoh7Hw/xiDWUPVD+ZzIBPA2K6KszHl0NwNOPl0aJcI7Q6kGA955WIjIIorG4jLqAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEBECRrA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEBECRrA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84864086bfeso1344945b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788565312; x=1789170112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/JnKrPKxIxB56b012D9tUkjmwAdNUuaR74g8mPWh2k=;
        b=dEBECRrA97rNsfsZnX8L/2Q/gSQEqnw35VCwKRMZh31vlqg/8EPDsKHCB8bknuATeS
         FJ50k6uhD11+yISCMpzU5ViNxLIpzDeIky4ea8jMhDcC5XXO1ymvs3yw3rhB/nXrVRq9
         yQLa7ujn6AFYlkH/zyIwXLpX/qxRlaPXRw/N/BaMwuKC/9zzNSmQWcQBwNQdf13y4HXl
         Uh74a7Y0EvAjpfCNGrM62VGEMxclZXxeFAl/UpIbKUU+lohJyCmQBz86TefRr2LeIaok
         2coXUJzA8haxVdQAtermXMU1WCJakjy0WzfUsCGsbPxzMKEObjkyGgfOQlT1e7TFaFeN
         0cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565312; x=1789170112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/JnKrPKxIxB56b012D9tUkjmwAdNUuaR74g8mPWh2k=;
        b=axPJcBDhJbg0cxFs84zqViNod3IxLQevwTWlwFIHW9y0ZTgD3T53ONziTmKziTxWlW
         7nYOnmecfrM4BRvtaGgjU1t+Ch8BQ3NZ4BtWpQI20TYEm8t+UJYiFy1SJBOtTq6ZwNzw
         VJxmAXnEWEidliR6IlFsEsVKjZhqdYjD0PmXBJKAmKT5R3adp+3FXJ46elNdwxJF9dsY
         4iUQOPFPZNIZzIYNwxIdhoX24G0YaGmoKbQAfzy9Pip5XXujCURhEpqz5TCE/XNO7eeM
         G3P60Pd9CQiedPWGBIet14gLfRYolp71s3Nd4qSf2nzOs9cFG+CQuPKMp4XzSotY+y4N
         OHRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF2xCN+pwIHkydM6kORVeBVKxml+C0eX17I8XiX9ork7J0EmjLTp0cOqUjef5W26D7D5fgN/BslKKOfCM=@vger.kernel.org
X-Gm-Message-State: AFuF++ly4JByJ7BFK7UCrgHyKR/meQ5ADlQbMCTvxgotu9fAxZqTnI9Q
	Kvu08kNgz0+bu22B6Nu2L660/9SmaHxwhv+D3FsX12vid3iSmEzlaYHjK+G6WCfCExo=
X-Gm-Gg: AYBFou2L5PfvzAE1HHTY5nqvYXyjuE376kuKk/+3VmFzMSZXNFx00SNaF8PeQWYFbSa
	utBhfqeMiwZQMmlsTqWhVwAg8oy/JBg+iyiX2Wbi+dsuLsRxN/SvSzEaIkbTN5NucZY0juHmlNf
	hp/0y21lVvGQ4BZRc8wLeZkg1nyaAlH0UBWh+4lwbzsdyzwMaeKVvE6WurE5J0W5VDccz27OarB
	YcS3dfm67tIQN0wBTAwONNAzDG+eFh4XXIgYOpRvbUcaxTqfwMVrKlNnW23T6fBOvrhWsHVt3jl
	Ih3aGzApkmnL/4YkljGDkPGL3GUttqQF+Mtm1s2C9pKfbAgXA4NbYgqwB8LsXno6DGF4vs18zux
	4VRTIc53iBtfNdzjFI870Wka4QiWvEHggRnTM7WI0zucAssNMvJDEs/OT2bBjpFLtIHQNYT5tt/
	ES0wciqVCfGpDy9MnS/LghItsrhASNNhTLhky9o1SAAGDzU+orL4I14Z0r1XrDVqa9p/1BUspLn
	Wi9jmmQFqg9sGNQ7ui4fIXf7JbB1CynB7WOLiEuyEqd
X-Received: by 2002:a05:6a21:7482:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3da3a0aa9e9mr14334818637.19.1788565312325;
        Fri, 04 Sep 2026 16:41:52 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm8592131c88.3.2026.09.04.16.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:41:51 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH] docs: admin-guide: remove obsolete lcd-panel-cgram documentation
Date: Fri,  4 Sep 2026 20:41:48 -0300
Message-ID: <20260904234148.88329-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that CONFIG_PANEL (the legacy parallel port LCD support) has been
permanently purged from the Kconfig tree, its associated documentation
is a ghost reference.

Remove the orphaned lcd-panel-cgram.rst file and clean up its entry
from the admin-guide index to prevent any future Sphinx broken links.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 Documentation/admin-guide/index.rst           |  1 -
 Documentation/admin-guide/lcd-panel-cgram.rst | 27 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 Documentation/admin-guide/lcd-panel-cgram.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index cd28dfe91..70c0bbc87 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -152,7 +152,6 @@ How to configure your hardware within your Linux system.
    gpio/index
    hw_random
    laptops/index
-   lcd-panel-cgram
    media/index
    nvme-multipath
    parport
diff --git a/Documentation/admin-guide/lcd-panel-cgram.rst b/Documentation/admin-guide/lcd-panel-cgram.rst
deleted file mode 100644
index a3eb00c62..000000000
--- a/Documentation/admin-guide/lcd-panel-cgram.rst
+++ /dev/null
@@ -1,27 +0,0 @@
-======================================
-Parallel port LCD/Keypad Panel support
-======================================
-
-Some LCDs allow you to define up to 8 characters, mapped to ASCII
-characters 0 to 7. The escape code to define a new character is
-'\e[LG' followed by one digit from 0 to 7, representing the character
-number, and up to 8 couples of hex digits terminated by a semi-colon
-(';'). Each couple of digits represents a line, with 1-bits for each
-illuminated pixel with LSB on the right. Lines are numbered from the
-top of the character to the bottom. On a 5x7 matrix, only the 5 lower
-bits of the 7 first bytes are used for each character. If the string
-is incomplete, only complete lines will be redefined. Here are some
-examples::
-
-  printf "\e[LG0010101050D1F0C04;"  => 0 = [enter]
-  printf "\e[LG1040E1F0000000000;"  => 1 = [up]
-  printf "\e[LG2000000001F0E0400;"  => 2 = [down]
-  printf "\e[LG3040E1F001F0E0400;"  => 3 = [up-down]
-  printf "\e[LG40002060E1E0E0602;"  => 4 = [left]
-  printf "\e[LG500080C0E0F0E0C08;"  => 5 = [right]
-  printf "\e[LG60016051516141400;"  => 6 = "IP"
-
-  printf "\e[LG00103071F1F070301;"  => big speaker
-  printf "\e[LG00002061E1E060200;"  => small speaker
-
-Willy
-- 
2.43.0

