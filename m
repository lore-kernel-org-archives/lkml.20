Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435798;
	b=RtK0qi6FV5mH7/a/pw4W838XrRMaIXv3SXw3VI+xAgCwVjx5oV1idA6ErZbPStIJ1Hfi
	 0nachWf0x/oeW5US1ymiFIwMXNZHnePUmBmo8eoXIJ61iII5mkfSoL4nC06rhK5Gx2IIj
	 0BmJk+L2UVZxEtAouu+H1g62454dhFxNptNaYnfuTba1EvAazxqASmhKXTIRpmeHUwhC3
	 NZcWrASE/DuT4uBkSoWxCuxsF741LanigyVnYOsHfyRefDbwg65+vmPlY0AZNY1Y84JiV
	 dQLnB2H9wRU3JS5ZjlDxyyUtleJZZEsA41i5fIElOOiwOuJdfUhVW3PxEexYip0c+0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vQ/cN3iXQ5B/i7JVQO6YetuFxzCYaMnwWxfI1uKAl1g=;
	b=VxJUcA5DdJtQUH2Z1u0jZIwuxkzyzJLreFUKPjdwjEBjEyNQeC+uhJnkTLMjPVoiovqH
	 0yuxVeQpLYZAIYOclPF4uRcvAA4aFhqBDzWZmamNGDxBPWvnUkiZ+XKyJCyTVKyS3Cfhs
	 lpio/eQtjd4nGZqiaw3WlB4ktde7b69/9N79yXZxjlhT6MaV7CwkdUneA8a9SWRXBd17k
	 8U6zi+Q1Vw1wT7meUEpObTSjKcgcgNOY+IhxLpKCFV0Qnq1aA6v+Dq1R2f6O199zL01/D
	 byxzVZIJginqxG162nGG+uOzevbVa9vXiVF+FHjiaMnimycovFjjr1VsS15tJycl0tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/NVGFrq";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94D606A327
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E94D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/NVGFrq
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a17a332ecso2583402eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793435797; x=1794040597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQ/cN3iXQ5B/i7JVQO6YetuFxzCYaMnwWxfI1uKAl1g=;
        b=o/NVGFrqut97p0EnNLhdbCUAJ07cPRZVqMjz50pkaKE15ulX9LcQTdJgLopxBCbjTT
         ihhobuAIOPfT53TgWxP6egHv9VvpGz9KKEstcqTdyrhiEV5IEuVnLU+eah+UJfvYAWzl
         oc6XCweeB2xeZzinoxVGc0iLKv38jCcgIytrZc7XSbOuFB2UEe97s9ZgxPoBzq6poOR4
         IkZw0YHQsGRRMAEHJCDCAzAxj7iL+407BoICx4qpmOVDCAx5ERsxUJs1eTJuxoAPlLGz
         /jrL1xZs+IDlFc0zU43XsMAJq0Bgg2RJVbSi5aNBG8i+BJx764tUjmsP9oN/RxaQpxnR
         kPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793435797; x=1794040597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQ/cN3iXQ5B/i7JVQO6YetuFxzCYaMnwWxfI1uKAl1g=;
        b=pV3GqZdUYl1semkjLuG5X2gvyTc/we2Kc1rHlYUmUzqUdUP6ajhmar2B2+/JRfbLOz
         y1V/9WuYVEDOauC8sENh0GoKrZGtdNp35naFY+ptu8fOuLdIoW44Qyk9SSpdLKo9Q2oi
         zYFhtt0zc9iBHQ06+DVNHlrnBg9lawIqMGdwBT7ShrRI613xNIT1ZtV63L5Rq/fXiUwh
         cNirx2E26uVJQOQo8iLbyKvP91bWI7M1MheVttbQOdq1Zi0yfE70d0W4Jjtx1ZkeLj9Y
         JTF8iaGcoQ7F79n59HtknYFBmy5F2hwd4ZYeBdlB2MB765/d0EauzVCovSY0aod51G1h
         hG9g==
X-Forwarded-Encrypted: i=1; AKwUvBxEs2HfRmJ1utQuc9zS7D417bMhyUi4X6c+bSOdEvABWBQkLHx9UTRqoBOsB1jGkyW+2akZTA8BVbddfo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJum1+EGjEb4aXzSLSgRAHlTCaJRx0/v4M03YHLfDviBG6lcDlP
	7zcWSFU0hJVXpf5WpSqk2e5KVwwEAbtkgf6f5mWln4Kg/u+7XtsWcfzL
X-Gm-Gg: AYBFou29wkGkENaSWboRD3TH0gapVPkgYbw/SzMn9rncesN4FVUwGjQTDaSWlPOhQal
	JwF4DBlsyzGzmyDl/qeFLyShp+OY3K+rmei8RljpzMI8xwuOj+RGDXW/2ItahXQ1RVUujTnEAdr
	84Y3ehb4iJIYAflZTiWcCIXljvVkeJBXX+Up7iMBxXmCuqBAjsOnHyVELQCQzuOZuHI9iwskzVG
	sqdkmodVLMViJWwgFSWYFnp70OtXHXfoL2sd0SdBWZqD6Rsfc44SPHY6G3N7wkuKwA2IRab5Pbe
	XJywX4DQDchO+KqFLcCS+LOAxQL7IoTfKKoDRORe7bf7P4ZWGP/DsZagt/aBNCtggPriHGOFTsj
	xDJlYruhSdZUuThCHacBfJWFOQ/WDtIYpvCRQ+3n9WfRVP7Lch+8EIjEJH6rZ+lPW02lp5MincR
	Q9tqfZ2ZkCyR5gFlLG5IC+C/bVrHKd7tZzIztuHNXkXAozJemuUStU3PM/bF3VCudSGiDpFwJ+6
	PWzQFxZhsOKI99E7P9RkgqF9IXlypeEljxRfQqglZZ45vksI+7x/xAphuL8eQx7zXSbuHeAI8W9
	cOPMCLbz1Yvs+akk3gf+e2da9aqL
X-Received: by 2002:a05:7301:6f09:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36a5126a932mr2780573eec.27.1793435797407;
        Sat, 31 Oct 2026 01:36:37 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:3397:a4c1:ed94:f99d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm14245639eec.28.2026.10.31.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:36:36 -0700 (PDT)
From: mdshahid03@gmail.com
To: eli.billauer@gmail.com
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] char: xillybus: use stream_open for stream semantics
Date: Sat, 31 Oct 2026 14:06:10 +0530
Message-ID: <20261031083610.87160-1-mdshahid03@gmail.com>
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

The Xillybus uses nonseekable_open() in xillybus_open()
for non-seekable channels. However,its read and write
callbacks maintain their own buffer positions and do not
use the file position passed by VFS.

Use stream_open() to mark these channels as streams and
disable unnecessary file position handling,allowing read
and write operations to run concurrently.

This issue is reported by stream_open.cocci script as a
potential deadlock between read and write operations.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/char/xillybus/xillybus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 7189c6d97e7d..92c526e84572 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1607,7 +1607,7 @@ static int xillybus_open(struct inode *inode, struct file *filp)
 		mutex_unlock(&channel->wr_mutex);
 
 	if (!rc && (!channel->seekable))
-		return nonseekable_open(inode, filp);
+		return stream_open(inode, filp);
 
 	return rc;
 }
-- 
2.43.0

