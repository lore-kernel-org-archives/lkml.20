Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E33A37E5E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790488807; cv=none; b=uZwcZUIj3cydKw/+nkedzreUN+OsS4sjxipH9UJSKjVxNWp5TalhqK37MSvqohHZ9AGMIA/BbZuOegwAUtKZwFq6HqGQIEw1Tiv1LdVe70hyyf33jKcf2v7nvxtyECGR/XKDk6l3mCJmI8EZKQYwHdeJPTAfBQRjthGm8xswFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790488807; c=relaxed/simple;
	bh=uav7FpdcMvoPqAG2gm25FMa/ksIC4Z/tBnVXRFPwCpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cbyf0tqKJLbCQm2vimf1XTgZ0mndeD4cyCPzZ5MxeHdpAv7VZgGSZ8q3FDTA1EUwoOl8yHtDA0h3iD+uTaj5SGOiUzApn/Fq0z1HaU+t+q0nZCzBBHgw8fZGqLeMd8HfRSJJly2/c35nT6iEH9KG8RACQzLrjFz0zjIkP26OT0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyZ45tRV; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyZ45tRV"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so1741956c88.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790488806; x=1791093606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gr7sKNDFLbCxJHInGWFYwlfKrCf9Hw79pJZTHn3AM4g=;
        b=OyZ45tRVDBcdD7hgU3xinj2wrLWKbz7i/swgT0vz6VdxyCujChQndhhgV1r+PnEYKd
         7wEIhh5BH6jzoLP2iK/Dt76Y4jJTIvPW0nGkOKjy/sAYXw1bS9RVj0YrMzzWc1OkMhQj
         UreO76kNpW4I6AdBDSE+c+P1NMUEhtUt5sERJTk+z/kRMwxUQqWCK3ogqg9BvIGRQLTF
         0F8ExhD2XhpxXnrA6BCFJhWGZq3dEOqSDeAs1X4YxZiEeJDdYwhUA2a6dugVmTnGHXA4
         ysEDGIMCSOwjUCG4qyGiURdQybfm7KxjOKZLpUyT7i/aBEwFoB4kg62ofTeeD0AMQcjA
         W1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790488806; x=1791093606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gr7sKNDFLbCxJHInGWFYwlfKrCf9Hw79pJZTHn3AM4g=;
        b=HoZAPNds6lcLjGVtY9kJlcN70IjlcfhuPpygJdYuNYk0OaJv5BT6gAOX07Av/ykjn3
         3UwKCmmSEdjqC6J6dp+fXGXgUzU3xTTtUsSdxxW0Q0ks7J9EP+Qtuw6YnYjNUAYanyXT
         CfblfxmzvH/h6n7nM8FR8bTfVUumj4tGwoxIvHlRhX5YkX8DSxJxiSVLVy4AbR4n6wiv
         hjaXP/lIH52XS7zEud6c1zhA4IFxwIwrFHaoGTLDggY1zm5KZr75JkzPBvQICmcRVvHD
         BeP08wzqcyjBYJLRqLUDE3JjxZOMZrmFWYkFATiEIVURLwoEC+lX0p83Iv0ZjlAX8PkJ
         ZdHg==
X-Gm-Message-State: AFuF++mokuDHkHsJJH7OT1Q+iEWTcwqli+BjjYCi0vsuF1yiJiu92Q7J
	Wn9A/Uvsgxd9GZ7KNfbhgSm0CYyQm16ubBFXwIRd0CAgs51F60mUTm6g
X-Gm-Gg: AYBFou2xCjiJZGJzWrZvnfXSPlXUo01/wqMJnrSbAuAmIJfCYfWMBbQW1nHRsGF0IJb
	0un+runsL/3VjeugQvCYH14PUgtGrjLvbnXpK8KfS7g68VF7eU0XWkLKS36e2s9M2n4pm90LMsC
	yroNCewe2gsljVQIOvnK7vc6J+Zbwn+qwv0ajHxSQRF1TvvOy9eFewZhaMfIC8D+8FNPr0G6+Ex
	TGENBzn1JTTNp9YPFd+MAU/88EG1EYaDd0H6kKVVGT3wJmNK7wJWQRymEQnyTBVqT+AcXb4zYKy
	+NXRATBOVcSHsm5j+fDDWFXgoRwMUkvdK5iJOWXjOhtDV56Gz+qzCaDtVjMZLpJsxBw5NRkfbPp
	E+B5xGHFhxzluD/5C8pg2oNvIozc68VfTp7WXUv5ogXg1M145ImCopli3GR3bZLvxq8yljwUMWF
	vPubzBctw+0pVZZjCrNCJ4hMy3popWBS+jnE+yL+knQCjDyHHD5DZRv3w0JDNSz9b4Yjl/Flj4K
	qLXtmJ5krvzSYS7Upx+yPN+CmB6
X-Received: by 2002:a05:7022:43a9:b0:143:4710:a869 with SMTP id a92af1059eb24-146cdfbecc6mr8275381c88.2.1790488805361;
        Sat, 26 Sep 2026 23:00:05 -0700 (PDT)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:be8c:736b:d7b9:ea97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c166cfsm17500013eec.28.2026.09.26.23.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:00:04 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: abbotti@mev.co.uk,
	hsweeten@visionengravers.com
Cc: linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] comedi: comedi_bond: Refactor strlcat() to seq_buf in do_dev_config()
Date: Sat, 26 Sep 2026 23:00:00 -0700
Message-ID: <20260927060000.518354-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bill Wendling <morbo@google.com>

do_dev_config() builds a space-separated list of bonded devices in
devpriv->name by formatting each "minor:subdev " pair into a temporary
stack buffer with snprintf() and appending it with strlcat() in a loop.

In preparation for removing the deprecated strlcat() API[1], use struct
seq_buf and seq_buf_printf() to format each entry directly into
devpriv->name. This avoids repeated rescanning of devpriv->name and
eliminates the temporary buffer.

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/comedi/drivers/comedi_bond.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/comedi/drivers/comedi_bond.c b/drivers/comedi/drivers/comedi_bond.c
index 8e10ecab4f0d..a10cfbd04c72 100644
--- a/drivers/comedi/drivers/comedi_bond.c
+++ b/drivers/comedi/drivers/comedi_bond.c
@@ -39,6 +39,7 @@
 
 #include <linux/module.h>
 #include <linux/string.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <linux/comedi.h>
 #include <linux/comedi/comedilib.h>
@@ -170,10 +171,11 @@ static int do_dev_config(struct comedi_device *dev, struct comedi_devconfig *it)
 {
 	struct comedi_bond_private *devpriv = dev->private;
 	DECLARE_BITMAP(devs_opened, COMEDI_NUM_BOARD_MINORS);
+	struct seq_buf s;
 	int i;
 
 	memset(&devs_opened, 0, sizeof(devs_opened));
-	devpriv->name[0] = 0;
+	seq_buf_init(&s, devpriv->name, sizeof(devpriv->name));
 	/*
 	 * Loop through all comedi devices specified on the command-line,
 	 * building our device list.
@@ -250,15 +252,9 @@ static int do_dev_config(struct comedi_device *dev, struct comedi_devconfig *it)
 			}
 			devpriv->devs = devs;
 			devpriv->devs[devpriv->ndevs++] = bdev;
-			{
-				/* Append dev:subdev to devpriv->name */
-				char buf[20];
-
-				snprintf(buf, sizeof(buf), "%u:%u ",
-					 bdev->minor, bdev->subdev);
-				strlcat(devpriv->name, buf,
-					sizeof(devpriv->name));
-			}
+
+			/* Append dev:subdev to devpriv->name */
+			seq_buf_printf(&s, "%u:%u ", bdev->minor, bdev->subdev);
 		}
 	}
 
@@ -267,6 +263,8 @@ static int do_dev_config(struct comedi_device *dev, struct comedi_devconfig *it)
 		return -EINVAL;
 	}
 
+	seq_buf_str(&s);
+
 	return 0;
 }
 
-- 
2.43.0

