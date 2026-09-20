Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D7B3E2AD7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=132.226.202.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893104; cv=none; b=NMZO77CZXm0FUEvQ5gmWa4e9SZLK5ri3UYdci6zDP6dMtdd2d57Qswz5C+p1/SCyU3eaZ4yWVeItYf74u7GIQaFzkg4Tveiutn6KSc0WXgVrqZCuv2THA+7eFM3lnvp2F/L64LENge78/Gj1bLgTFNQ47YcfvftXISfpX8iVBEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893104; c=relaxed/simple;
	bh=sJYcwxctMXiLIvjjZSZKMGlbOPXMpp1oWismY7OL1zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxIcSZCA0xYZluOEGhicV1uC2r+cfp1NNcRHCm9Pk4WpJrUjZuH1HOQ1TobAPZPvZei7sfyiP1PUJ6URYWGlNL8bEv0cd9jD5zOfMeDGfNI4sHd3iXfaLKkU6TPJFcUOCuC1LJHLBaNSXRo+xje+nnvyEnEwPhPMoqBhrbDbwdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=132.226.202.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [117.147.104.32])
	by mtasvr (Coremail) with SMTP id _____wCXkD_pma9qztImAQ--.24559S3;
	Sun, 20 Sep 2026 16:31:37 +0800 (CST)
Received: from localhost.localdomain (unknown [117.147.104.32])
	by mail-app3 (Coremail) with SMTP id zS_KCgAHQXTSma9qV+dHBQ--.54809S6;
	Sun, 20 Sep 2026 16:31:34 +0800 (CST)
From: Jiacheng Xu <stitch@zju.edu.cn>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Jiacheng Xu <stitch@zju.edu.cn>,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] gfs2: protect demote requests during superblock teardown
Date: Sun, 20 Sep 2026 16:31:05 +0800
Message-ID: <20260920083109.30798-5-stitch@zju.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260920083109.30798-1-stitch@zju.edu.cn>
References: <20260920083109.30798-1-stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zS_KCgAHQXTSma9qV+dHBQ--.54809S6
X-CM-SenderInfo: qtrxiiaqttimo62m3hxhgxhubq/
X-CM-DELIVERINFO: =?B?Gn/BywXKKxbFmtjJiESix3B1w3tMoM3snk/k5SVzZVydjEqe1eefKHnLf95EnB4iem
	egWzO/wNhIP+pglnkLd0BnOseKeJr8bipqX23HM2eq1rHBHv56cT8BWJRDUtThYGkWp+Pf
	LkD8QZ23s48MrbYdbPLtWmujtIG9rr2oMH3HiwlP
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1rWF4Dur1rGw4kCFWDZFc_yoW8WrW7pr
	4UC345ZF4kCrn8Xa1Ikr4rWw1rKayfJF12y397WwsrJF15XwnIg34fKFW8tFyrA3yxXryq
	gFyYv39xCrWUGFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8x9N3UUUUU==

The demote_rq sysfs callback can obtain a glock while unmount is
tearing down the glock hash and destroying sd_glock_wq. The callback
may then queue work through the destroyed workqueue.

Serialize the complete demote operation with s_umount and reject
requests while the superblock is not active. trylock semantics avoid
deadlocking with mount failure and unmount paths that remove sysfs.

Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn>
---
 fs/gfs2/sys.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index c5868354073a..c5c540fcce92 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -334,6 +334,7 @@ static ssize_t quota_refresh_group_store(struct gfs2_sbd *sdp, const char *buf,
 
 static ssize_t demote_rq_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 {
+	struct super_block *sb = sdp->sd_vfs;
 	struct gfs2_glock *gl;
 	const struct gfs2_glock_operations *glops;
 	unsigned int glmode;
@@ -367,14 +368,22 @@ static ssize_t demote_rq_store(struct gfs2_sbd *sdp, const char *buf, size_t len
 		glops = gfs2_glops_list[gltype];
 	if (glops == NULL)
 		return -EINVAL;
+
+	if (!super_trylock_shared_active(sb))
+		return -EAGAIN;
+
 	if (!test_and_set_bit(SDF_DEMOTE, &sdp->sd_flags))
 		fs_info(sdp, "demote interface used\n");
 	rv = gfs2_glock_get(sdp, glnum, glops, NO_CREATE, &gl);
 	if (rv)
-		return rv;
+		goto out_unlock;
 	gfs2_glock_cb(gl, glmode);
 	gfs2_glock_put(gl);
-	return len;
+	rv = 0;
+
+out_unlock:
+	super_unlock_active(sb);
+	return rv ? rv : len;
 }
 
 
-- 
2.51.0

