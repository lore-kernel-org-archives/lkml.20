Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212130;
	b=dIiulF4MQ9skNKtxrxd/v94XuYAaAop6W59pNgqOsi/1jxUOeFolFSjc6ezjrUGY6TCK
	 eA8/QN2w2XQI04/bC7/rPsBuvOOY0su2JpDu4vhspCw8OGGAxilw6PFZcYw+j+AnFMnCo
	 O2MkQ1tDOzgF9W8zswc1J/ZmEFKz90PQN/ADRUWwe4LNeG2yTG+l2tS/qAcCNtrCBSZjT
	 AqHtwsPMQ8IvZ+QYNnztlt/6SNduGXffOzXedJzdHXRP5h+K4pohdtMOqDRHl6DUHsQP5
	 mPMMLpE87NK2VEMMeKyYoqG2OCtK+oBjGckOOJj431sWkGU/67lRP2hJZ4ysnnp55cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PbKGqNfUqgTQK7tkH7alniEEuM5QCv88jvXrchkccXs=;
	b=QPgw/kdLn/G2zMUWrGOTMq9bWYbDhES/oaExfmsd9uxq1Kv5y90mBmkgn6+RsvQOyKE5
	 zMo3MRI4YrFy3Veq/0F28NBw3PnS/NmWPY/HdZcNwrQcs5or+AB9/Ooiqlqv+VeP0OjwA
	 jLz8vHGKb+puQOVTkX1jzSGfrUGLn2yjk9kSJ/uoFAZKP6YKbBfYFlhYcepBVunrk62Xz
	 Bpzm+erB3fOHv8wsxEcfxUHKoWBONb/jPleC+xoR4UGdhp/i99tU6q3H8ldCkdWeroDHb
	 RwrwIkZbnEpIK6rCOCdhBzHghmwuS7GuEFWCUVwTK3aZuUjf8i82Fn9HJ495OY4rhAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRG7yHUS;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1606606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1606606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRG7yHUS
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1846bc43c28so1549551c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212129; x=1793816929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PbKGqNfUqgTQK7tkH7alniEEuM5QCv88jvXrchkccXs=;
        b=aRG7yHUSDd+MTkKytJav6i+528qytXX/cKfTZLUKkB1nNUDBOEaZ8Amzxy4t282DtU
         pBjMqjP+lRsPMR+fYy2CPP+57kQLWP7ZKI+f+vgsRKftRGPydiB7vpTMPLvSULWnKAnm
         994oMs9IpZsZUItSrbIX0yd4yIsNJOb1zbb1l4xScDvpLpLF7P4CrJKVSlBJZBG9vOx+
         jcPkkgNkpdLWs9o7Fl7RwHgo0NlTe74U1BR6I1TqsQazeUZfYiFGTo6h5Nllo+MA2JgV
         hHWKeisJLPNoY+D8ZverCwkq7RP1Bi0do2RCbzyhmFBuleGhK9/LrmMeT3mEsrdnOyro
         0NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212129; x=1793816929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PbKGqNfUqgTQK7tkH7alniEEuM5QCv88jvXrchkccXs=;
        b=wRn/oBIKHKLqJmRpWaIjTdTaSJqKNuq7HJI9+H9+o2SKHKKRaapF3/ajStqe6jzDqs
         EWQfQpmYZTjk7K/bu9/okIEeJSWMw+oDVfV+cXXEeBYQ632yk+S76GnGY5JuuhRYvnEY
         g9xkBz+CZnrMfUdZiJ0NohN72ekP/cF2Rg1RXHPwNJIdWVTNRS+9SySnq3IUYV7hlNWt
         txC0lGK7UhN8rOdO6CvvjbQMLw26uhLO+nG5rYoRuF3TuOIBZTwVGyIRjAFvBLDeaeaW
         1V/FdRNY883n0lCAymW2qFGoDYJBzuB2Ueda/24IOTkzcGzV6cEUVfCYBZjQSS8puqbG
         bJCg==
X-Forwarded-Encrypted: i=1; AKwUvByv4lHtoZ4MiKW9gjxqC4vBeUDjHD0P7VMyrMP+mOvR/1YVwk2uwIRPFG+XrX9EcVkvbeh3dhqNLiYyFWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlnvUhFkf/8ntrMubnv9tVdQODilWwxjUzWH7pazSlP0ywLJBC
	Yl/lkkXO2t/4/24+6GPxwShPA8vuq1rSxzaQUviB3cvAx5zTzqD1fq/D
X-Gm-Gg: AYBFou2m1QBcihRvCoV38DZpko5DIeIRx5HN/2KLXf3WpYhU4d5WFRGliitH1C1/2pN
	TZ8cKn43zOk/50lklgVwWPUJkHgamsaulIPMWsja1PQOiU2qm47yteXfJqeLvjMh3d4fL6IubDP
	gATqFdGa7FjuSCLUuPA6S82yWRorQk4ZjdBAF868XpJUF2bLZd+8b7h8GekZaZYXXj90PjNSCK7
	JRFktxxViLI647nYSL9pjfKEx7o6GunIIJK5C8yNWzik5U6UMj6W47KdFjlwgUtbtKtWyvnXbdq
	7aR/Alef5XBcEc3N2/+nDgbR5fLCESgAup1KwSGRl+RJ4FPGp0Xw05rkam+kZSfdXtxlgkU0ULs
	TKuHR0lcvo0CjdOu1dOMhvntZf19948ABZwK7EIhbnwOgogfqKhlKwPWFrTT0p6Jd/RBRT5j/qG
	7x4cDpBDFGihwqTNL8D8pPKeRsw494ah0r4dGZtYDMxpshBoK+naygDE/AdO0TNbA3+pWw3yOur
	0iNnyX7Cd+Q46VLY5DovP3tX2tG6ngE7tXFcXXwSDHMq1VORjIoEVjiWuQR4Ov5DWHhSTQSNKqb
	Tj91vOYo8kPTZcSVtWU41ebtoH0c
X-Received: by 2002:a05:7022:622:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1a6cd3a116cmr5669570c88.12.1793212128524;
        Wed, 28 Oct 2026 11:28:48 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:b53a:a25d:3477:6f54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a760569d53sm7111839c88.23.2026.10.28.11.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:28:48 -0700 (PDT)
From: mdshahid03@gmail.com
To: starblue@users.sourceforge.net,
	gregkh@linuxfoundation.org
Cc: legousb-devel@lists.sourceforge.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] USB: legousbtower: use stream_open for stream semantics
Date: Wed, 28 Oct 2026 23:58:01 +0530
Message-ID: <20261028182802.25212-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The LEGO USB Tower driver uses nonseekable_open() in tower_open()
However, its read and write have stream semantics.

Use stream_open instead to mark the file as a stream and disable
unnecessary file position handling.

The issue is reported by stream_open.cocci script as potential
deadlock between read and write operation.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/usb/misc/legousbtower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 18dd4115befb..b849bd0e9664 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -313,7 +313,7 @@ static int tower_open(struct inode *inode, struct file *file)
 	struct tower_reset_reply reset_reply;
 	int result;
 
-	nonseekable_open(inode, file);
+	stream_open(inode, file);
 	subminor = iminor(inode);
 
 	interface = usb_find_interface(&tower_driver, subminor);
-- 
2.43.0

