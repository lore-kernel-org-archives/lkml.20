Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25A5581FC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087328; cv=none; b=TD1S2C30RzMJ1Qo/sNp8LLCl9t4EV3OFnmSfyydJGQInWt6F/RQSkGS3YY39vXKTJDdQtij1oiuubV9z8SRujuZ8xwod1/gH2qco3d5GlrHc84NL5RxkRgAi5RrYrwu539SjVz7jwPGvf5O8Yng6O2El3Mvnn9JxrDlX0HqHvtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087328; c=relaxed/simple;
	bh=xIgy530ICC4m3NkKuadi/zzirqDT04Q8w/kPC5TSRsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuZ4Chm08XJ2U+yIQdmB6y0ghbNggtHS/JT3DhC/aOksrO+TDegg0zXYT0GEFNYwZmA6dKnHEuq1aFTTHzckp9yI1LlR0YUgYzujFp0A3g2L7pyZRYbCEpsBCPryzflCtg+jpMsYaClS/BQSV0ty6/2DWV0mF5c8CcHslOoP38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAhbLqQ0; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAhbLqQ0"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so1554590e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087324; x=1790692124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Qx6sfb6upNLcj5IsqKTL87bc3YDUS09h8egDr62oaQ=;
        b=WAhbLqQ0L0Lm2DdQD8jamZaGUYd4uJJ+iAyP6l4/XSjA7qxCRLIm4joOjNbhKRojx0
         2EccsASsw8d33gwRDvxXsFj3VnPP988EOM6nGS9p5bIwZ4kdNziuv/fGZXXD+BDVFSYO
         1yw7MvB1oVHdymO+dcNC0vesmJE9V3jvXMoUNvPBM4oB2ZKBdfuHjwVAlkKBgU8w6p0D
         zIsgIh7AUHcZE5TItwMxKMJa1AaaZmJPI0k9Ycahcgf1f4UXoVgmmBus78nJqP7fGvzB
         xYvYCgGrrYgaVyG4f8ydWm575BBzu9ftL0pLEl2mEc9MpmmbFvNu6JCdRJ1AbDF5lBZz
         Rqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087324; x=1790692124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Qx6sfb6upNLcj5IsqKTL87bc3YDUS09h8egDr62oaQ=;
        b=OMHExYb1v1cKjidGjanaM0t1ut1sF4roKidGi+8QtHqY/cLSwn2BSyJehjpfpfeD+E
         sUjTp43LXezEfTb01rcj+0F4vuOh/egKgAUCgkIO/2Eock86idzDcDcoCmt70tWgshRQ
         yzLL5GysZZyj0f2ifM5FeJHtUp9ooLQ2XtlHfFPhOBfP8r+XVWpDbtOjn/yD+r0xqjVS
         5kflCqreH4e83qmsz62eNB0F1CpMoau3jwkGQpyu1mxZh32xKz/ExrWmprioMivEcGOb
         jGU4yNlej6eRq/BYESpKTEjwpT5gDb2SKjihobENCJ+ctI13/6biNIduHoeGP8SNBatp
         388A==
X-Forwarded-Encrypted: i=1; AKwUvBy3Z590c3N03XyhMWLwLZkFeiqkl0Hm2z3AZUT75dyvIinzvqLxTfYOEGX7FAGvzoN6LZdfP7BJuD+0ELQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ntRVLwPaywM1L5/UhvwamObeoqbycpc2TcMmZ614WP9YsxGCq9
	mzxxi96UJSpVbu4mf3B96CLHDz+Y5WTgjnsE64Zl7Mi/ZFnFs5ttvHn8
X-Gm-Gg: AYBFou2ijAFU80CxSjZyIYzSLEvPTBHTAKcnDjmEkktSH1yglgl94qDncx8ZcIlTHdE
	5xVYz4KL0rARxnxoJSCmdlS6m2kfeiRHhIcdDC6pcGqP7/YB47vqXrkR/IHjgFHYKNVsHzqRUlV
	enD6amUTisKKfV39HME2lOdGKh39rxY5dFdipfRIpY4fGoNNrCleHw/C0WTQffZJAPfsQfeBp4M
	ZYwyw+q1lBi8gtb/SgS0t5sNdI+zg3sL3PjsfaaSfNe8GwZBFN9lLdB7ywalzBn1IOq2nGja5/B
	xmpOdTriQpeMw3WlFTmBo663bBuCwXrnU14rcAE6KPcBvHo86ns7l4Nklb172ItqP3HeSn4grsD
	/oWSEhFaJSKFrIqs9/982l36p+39Dsa92gjEVXv+etHU4qw7eovixWSV0nKnK0xYlmQzoHU+kzY
	tzgX4A3YBZ83Cw4iLNzkSQRCZuReAOADw9GFfdJN1mkA4X9w84mbija2x0Qivx6qI0dgIG7CgZG
	4BvT0qBFZb3ziB1fvo4InOt1l/juypL7HNSn2pM5Q==
X-Received: by 2002:a05:6512:23a9:b0:5b4:ac27:8f76 with SMTP id 2adb3069b0e04-5b8d28fe7e6mr1013908e87.7.1790087323448;
        Tue, 22 Sep 2026 07:28:43 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:43 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 4/9] ptp: ocp: forget a CPLD i2c adapter number that no longer resolves
Date: Tue, 22 Sep 2026 17:28:24 +0300
Message-ID: <20260922142829.57740-5-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922142829.57740-1-maimon.sagi@gmail.com>
References: <20260922142829.57740-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adva_x1_bus_claim() returned -ENODEV when i2c_get_adapter() found nothing
for the cached number but left the number in place, so
adva_x1_cache_i2c_adap() kept bailing out on its first test and never
resolved the adapter again.  The comment on the parent check claimed a bad
number is forgotten and looked up again on the next sweep; that only held
for a mismatched adapter, not for one that had gone away.

Factor the invalidation out and use it on both paths.

Re-arm the one-shot identification when a new adapter is cached as well: a
different adapter may answer where the previous one did not, and leaving
cpld_id_tried set kept cpld.id absent for the rest of the binding.

Fixes: 3b815e29966f ("ptp: ocp: add TAP CPLD access for ADVA TimeCard X1")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index feb61355078a..45313143b6f7 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -4574,6 +4574,19 @@ static int adva_x1_i2c_adap_match(struct device *dev, const void *data)
  * both the notifier and a single lookup here can miss the same adapter.
  * Retrying costs a short klist walk per tick until one of them succeeds.
  */
+/*
+ * Forget the cached adapter number so the next sweep resolves it again.
+ * @nr < 0 forgets whatever is cached; otherwise only that number, so a
+ * caller that raced the notifier cannot clear a newer one.
+ */
+static void adva_x1_forget_i2c_adap(struct ptp_ocp *bp, int nr)
+{
+	scoped_guard(spinlock, &bp->cpld_adap_lock) {
+		if (nr < 0 || bp->cpld_i2c_adap_nr == nr)
+			bp->cpld_i2c_adap_nr = -1;
+	}
+}
+
 static void adva_x1_cache_i2c_adap(struct ptp_ocp *bp)
 {
 	struct device *child;
@@ -4598,6 +4611,15 @@ static void adva_x1_cache_i2c_adap(struct ptp_ocp *bp)
 			bp->cpld_i2c_adap_nr = i2c_verify_adapter(child)->nr;
 	}
 
+	/* A different adapter may answer differently, so let the one-shot
+	 * identification run again rather than leaving cpld.id absent for
+	 * the rest of the binding.
+	 */
+	scoped_guard(mutex, &bp->cpld_lock) {
+		bp->cpld_id_tried = false;
+		bp->cpld_id_attempts = 0;
+	}
+
 	put_device(child);
 }
 
@@ -4614,8 +4636,14 @@ static int adva_x1_bus_claim(struct ptp_ocp *bp)
 	lockdep_assert_held(&bp->cpld_lock);
 
 	adap = i2c_get_adapter(READ_ONCE(bp->cpld_i2c_adap_nr));
-	if (!adap)
+	if (!adap) {
+		/* The adapter behind the cached number is gone.  Forget it,
+		 * or adva_x1_cache_i2c_adap() keeps bailing out on its first
+		 * test and never resolves the adapter again.
+		 */
+		adva_x1_forget_i2c_adap(bp, -1);
 		return -ENODEV;
+	}
 
 	/* The number is freed before the notifier clears it, so it can
 	 * already be another adapter's.  Check this is still ours, and drop
@@ -4623,10 +4651,7 @@ static int adva_x1_bus_claim(struct ptp_ocp *bp)
 	 * way, where forgetting it lets the worker look the adapter up again.
 	 */
 	if (!bp->i2c_ctrl || adap->dev.parent != &bp->i2c_ctrl->dev) {
-		scoped_guard(spinlock, &bp->cpld_adap_lock) {
-			if (bp->cpld_i2c_adap_nr == adap->nr)
-				bp->cpld_i2c_adap_nr = -1;
-		}
+		adva_x1_forget_i2c_adap(bp, adap->nr);
 		i2c_put_adapter(adap);
 		return -ENODEV;
 	}
-- 
2.47.0

