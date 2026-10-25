Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948312;
	b=V/phkizOMW6/MOMi1jbuTW4VzvCeW3fp5iurmW0afPfI65Tv1G3Ms9vaCFbnzoy6izCE
	 ld9YPtKFa5tq0EewoQTQrHh2S2yb3IpIadquAKrVHInOZyWOSX7kpHB6SvL1bF/7MbRs+
	 96U6l5vv3+MoNAvK10Xo0xcRgYOPNcQWs9KUBMofFMf0qvF5jOe+Sp9O7YQWsMtKHBQZu
	 5NGF1xtI97yTnmhcE9zypX6VE+/i5Ln65eZfzLJXkfM1U/nqs92xiNNicUXanHXa1nzV5
	 96IwsE4H831ZC4hOUoZ4jtGCOhVI8AgtdtizYro9K9lRpNh/IBYeRjbbAq8k0dbgFNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kaazuBYoFlNi01fHJWSjX0ZrC024FOWcAqZVtF/rwIM=;
	b=LcB36DP4OsOsxzPSMpsD37JOQ0fKehb+92RAGVvCcCVAlD0q3dAYNXuUcNxq15CcVlte
	 sXz6ktO0Db1h1m+SFskoK3jQRxbdhE9vi3ZFacFcnBtKDVQskYka7v51vTI0b/+VAlO3l
	 QXMEzp2DP4KYJpWxQRaJK9wIORpyRfE7/yxbP8FIRnLoFizcmmeE9sKrJA0L7jNKAeN8s
	 pT0cRfxYQ1tTsZCvgRYo7PcZOAsAiuc5rrjxpvjbOl/mMSZGTaHJfOsP20tAHIWSc7gPC
	 yCqlLo+fUOpHSMpHP2hnJsad5oUGcJnK2hR7azOGQfRGRcsnV+wxNwjpBddWMRV7t9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1crgSwR;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E01606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1crgSwR
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-35829219da8so4153815eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792948311; x=1793553111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kaazuBYoFlNi01fHJWSjX0ZrC024FOWcAqZVtF/rwIM=;
        b=d1crgSwRNAX8pcAiY9hJctAMXtQlVms7wbaULTZ21mEbK4effAqJ0lIajzsC9XpvQt
         Fr7ujXbZ9AyfVmQQRCObEMTHTLQ/Gj3VvN80mGyjsahf5b1lgQ5Jdlmq8Rddh4rqCdN+
         ATsStbP9vZCv/Y+zm73kbrEvXmn/7SA99GWNkcs7lf5stwtkU+wLrfNu6zGIxdNclhJi
         hn685tJayEUUAl57b3vKbtNiRocD63gBcpZvD424L22laZ1FOQb0Flq+wK98ZRo/YHVU
         nyys2UNgMCmT/j+uz1mWoN0tByIjFNCx6UxzNGGH64uB/FqzKEgW7RxlvpiVPvzUXG3I
         pQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792948311; x=1793553111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaazuBYoFlNi01fHJWSjX0ZrC024FOWcAqZVtF/rwIM=;
        b=UrCZKKcUj4yg7NHFo4s+FSuabIrQn/KFg/juY0T9rHvSCU8JUjbEZEzg61GRWLYeTn
         EnOwZgfbA1ubLy6gJknX48uzPXbqNr++hJmU9Kn6WvMlYKmCugnMjN5mNvBFyi1haNib
         tiDwVkWGaVxgNU4dvE+eRoBw6MP7QPlHW2PtP5ZeLv+WzdQpH/Cu60NaUZtLy02yuv4O
         sSz/LnrItXJSzATfmqXYhcIXHebXbkW9SQILu/r3+4rb4LsEQATZWveDIz7WB8d4m/G4
         7/u/Oy18DW93QUxS63IJSCkFjfjTRK/m3l0TAKR8e3ygKIexToTkO8R9rQx3Q0f/fc5B
         cJhA==
X-Forwarded-Encrypted: i=1; AKwUvBzNtWRjlFvRg8UKcPy+LUczIIW2lPhsiuVOKi2OcA3+hKDfksPW53SvKBzVlRP6B4zHz2vibH60Ao31Pfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNylS6ut39mYJ6lxwH6K0TUlExHihyRUFms2DEfPxuuTzIF24M
	Fr14l9p8J9K+b8jc2QteV1A/gfYC5JPz0/rtYVZcoJPDuoV+1MnLugC/
X-Gm-Gg: AYBFou3Czetx71fxuEYAxtJueVQCWs3mz4EWUJyfUQGcH9dErwDYbj9PbFPDSm1VujM
	mH/ZTiaI7yKW7sQ7tSqBddTtvq+xsoM9urN8nTbCfKCtXlXL85MinWRxqITwiaVrEtz3pEFJQzR
	1PhaX23SuxPdwuRXmkvkZj1jPqJQFjY+jr7VHo7k9jxujhqR6Tx6jd2knrMSpVeSlFVOBAALuZm
	0EHO9mvPx2BSkyRo3H1ymvAeczWHSrdyX+FMi/jGeCHh8T5YQoDqA+UyI7t5uzcdxP+cNO21XYm
	wVREEWj8u0/1ErcSVEi0ndldom7wpY0wcuLgpwD5IvSiU4AZV91tM1LJVDmRVuEH9QbNTsy0my9
	oWcoK0HPP+u4pUFje2QmUWXXbDw02R1yljPS+wBRJg2qXLBa8tYZwT1Vb+Q+9Qs9PBRR9voQod7
	EfpYv6aHnVFgf9rbsN96VR1c4s2i5/h8NU+iFR0TGMJnZEhFCWTsotQilVnVfyqnPm8TgfEuABL
	NBsnP5UroTTS+mgCVUVRfEtnypBQFYhv6sZT+gw8agmIA33GCzzg7z3KDMdVuSSxfrt3w3eGW3P
	y14whxg54objtucK8Ew5H9jFTsB7OQ==
X-Received: by 2002:a05:693c:88ca:b0:366:6c79:212b with SMTP id 5a478bee46e88-369e85043a7mr5516718eec.25.1792948311310;
        Sun, 25 Oct 2026 10:11:51 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c576ebsm17670582eec.3.2026.10.25.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:11:46 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	akpm@linux-foundation.org,
	dave.hansen@linux.intel.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] libfs: do not extend i_size when no data was copied
Date: Sun, 25 Oct 2026 17:11:30 +0000
Message-ID: <20261025171130.16115-1-dennylin0707@gmail.com>
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

simple_write_end() updates i_size to pos + copied even when copied is
zero. A failed buffered write past EOF can therefore extend a ramfs file
without writing any data.

Since prefaulting was moved to the slow write path, this is reproducible
with a one-byte pwrite() at offset 4096 into an empty ramfs file using an
unreadable source buffer. The call fails with EFAULT but leaves the file
size at 4096. generic_perform_write() calls ->write_end() with copied == 0
before trying to fault in the source buffer.

Only extend i_size when data was copied. Keep the existing folio handling
so that zero-progress retries and successful writes retain their current
behavior.

Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/libfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 8e2cc627bc7f..d889a4a14f41 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1007,7 +1007,7 @@ static int simple_write_end(const struct kiocb *iocb,
 	 * No need to use i_size_read() here, the i_size
 	 * cannot change under us because we hold the i_rwsem.
 	 */
-	if (last_pos > inode->i_size)
+	if (copied && last_pos > inode->i_size)
 		i_size_write(inode, last_pos);
 
 	folio_mark_dirty(folio);
-- 
2.43.0

