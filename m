Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372678;
	b=GVzbRZmzD8vfdRJaNmi2HfA1336K33jWDLHnQgJ9gRAnuJOGv+JSOzVl4lb47DBpiy/B
	 BTSWAWAD5QTyozm3Y7I9/WDFHg5d7OioZRKMZsSkno/knEDYajcFxGvTt1t/6zjwXz1SB
	 plhdm8rMKHFByLt8DUTLJDZzOvdPJGpNwiXNyDubtEJTEBYBIaA7jlxB6gMcguziyafbc
	 0e+hrTBMQ5Ih76yBW4l1wLR+X2eGET7KsGGSpEi8rLT1uBIKNI+k6Ie2gynSBAa9TBAUO
	 KaEaAO1LSmUUCMrQcuoDnklsCM+olwLcb8IHzj63vY5vuoyyFvS/TRWgljIhfAVgF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372678;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=RQ+EWiIyRhW+UQsDlOuRrwxSPz/sdEOMTt74KYlggiE=;
	b=f13/4jXE9lLMnl+ntM+tM/ZbxYXC8A5Azg6OkgrjYXPBAtdo2b9OMj0V/UXsrheNHLUF
	 MNmUUIONQGXO5an/s1USa5p7tOIKU0PJilvuczBzR1vhawkHCnCe5vnbD5LpBvh2sCUbJ
	 vGsaLZSF0/EluM8KR5thV7cN84IKMvpCSoz5zPUZJHZJc3R7rJxpbDuru72l6C8bZsU7N
	 V8e/LYzynJ5lNpLjR0B2qzdDLj7DLkAsG6tu53mqtIPgs1BBGmdLEpg7ubTzsduYHT6gq
	 AQfht6jMkDR8PidjljuYFxK0Fk/MD6m9juRZvfeGc8ZBGUKVODMZhJhaSs3aaRfW4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="GzuQ/gCh";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF744606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF744606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GzuQ/gCh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RQ
	+EWiIyRhW+UQsDlOuRrwxSPz/sdEOMTt74KYlggiE=; b=GzuQ/gChKDA990t4Jn
	O3VethegJC5hzsWtS6vh15On7eTb1qiPAAn8t2pZx6s/cDDndK1z8Srnmvlr2yez
	gXmzBkdHEGyknD7FLgiUmC5hIS5V2qo4eOkAcpZJvn1ItP324Wn3H+FM5jaQ5eoJ
	cjZhaBoqirjhi91YmSBf6nuus=
Received: from iZbp142fio164970eurit1Z.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P8vbseRq+7D2EA--.26616S2;
	Fri, 30 Oct 2026 23:03:56 +0800 (CST)
From: linfordWu <linfordwu@163.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linfordWu <linfordwu@163.com>
Subject: [PATCH] staging: greybus: fix use-after-free in dump_module
Date: Fri, 30 Oct 2026 23:03:55 +0800
Message-ID: <20261030150355.1809319-1-linfordwu@163.com>
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
X-CM-TRANSID:_____wD3P8vbseRq+7D2EA--.26616S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw17Jw4DWr1kCr1kZrWkZwb_yoWkXrc_W3
	4aqryxWr1YqanxCrsFyFZxZryIva1xW3Za9FWrKFW3Cay3Aa4xAr1DCry3Xr9rJFW2krn5
	uFZ8ArnIqr1DCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiVyxtUUUUU==
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbCzxx3F2rksdxrggAA35

gb_audio_manager_dump_module() drops modules_rwsem before dereferencing
the module. A concurrent gb_audio_manager_remove() can free the module
between the lookup and the dump.

Keep the read lock held while dumping the module so removal cannot free
it during the access.

Signed-off-by: linfordWu <linfordwu@163.com>
---
 drivers/staging/greybus/audio_manager.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index 118ada9b909..1b91acc084f 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -117,12 +117,13 @@ int gb_audio_manager_dump_module(int id)
 
 	down_read(&modules_rwsem);
 	module = gb_audio_manager_get_locked(id);
-	up_read(&modules_rwsem);
-
-	if (!module)
+	if (!module) {
+		up_read(&modules_rwsem);
 		return -EINVAL;
+	}
 
 	gb_audio_manager_module_dump(module);
+	up_read(&modules_rwsem);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gb_audio_manager_dump_module);
-- 
2.43.0

