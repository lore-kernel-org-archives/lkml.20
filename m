Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114148;
	b=JWlE283KtUvA5SDYhpw8KO0lUICsMzfP299EN5AyBPU+9j5XDAxlLVmkAGK4houI49K9
	 4PTOGnohDVVDI3N1uePsR4tCeLYSfTPrW4Z7ezOGoeWQcUAUUgOANPJylqXF4k61MMwnh
	 dRhMLPQpiODlsyozdq7sLliS5FrEgurx6kpbXbg7oVUc6CfzBggFMfl8rnMPyp//xinux
	 meevS3u1wmXsefRxkAfxG+MQ+HZn50X0LVZ4iZ4Qj7QukXxyTPfZfkJBkuGJ3ShQXqaqy
	 ocz9ZgPrnfEuXnMLQaSC0PjWNpMKnroJP02ViP3k1bWw7W3LCO0yh22OWWun/to+Ewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114148;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=j3uekEY2Aa558ZNY0plFmomMgJqeUtgIz6Y+icq0YUA=;
	b=j2wpnvLb9up43XszMLKGtyK29BumZa8i76Jk7+TlVbtLDqHPjxN+cKNCSC6KF9+vL3Mb
	 pNIBsyG2mntUcoygNb3ckWTdVNRE2A2bJEIYm0c9Mieyszb1CSyio7lojoeWLuC4UIp+1
	 tmNuHJudz0RrOzAh+/Prz8/faEwMSRaIui8nAbVzajBrFG+x2hh0ARYMVfax64GC9Gvtx
	 M3ybLxYCRu9YGJq2+YoDLC/MvCa8JuHKBFI+vk5ZeB22MWKOAmlg/H/j3yfj16iMK+eCN
	 HIPS+Y7iVp+bg2qIfMNtzO2u9kei77Rp/BE375eStv5JqZSAjrnVyrg/4BB4Fu/ogwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k8J0oqQF;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B6C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k8J0oqQF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=j3
	uekEY2Aa558ZNY0plFmomMgJqeUtgIz6Y+icq0YUA=; b=k8J0oqQFfqW2DVsOX3
	0ZCIieVu4V+H0U5CkqrnwSt4Tk2Y+MZeFhFtUCRFPAk+OwXilBw+HhW/KoAxF9nR
	3ySy11Xv3ezhyPwdQdJ+JuqPGCQscHpfOvjLlcPI22CeawxfBscZM+vvmPpuLg5C
	PQriJHexo0ZrZ4qa4LCFUqEdg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3v9P0v+Bq5nDACw--.64470S2;
	Tue, 27 Oct 2026 23:15:02 +0800 (CST)
From: Chao Xu <xuchao066@163.com>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chao Xu <xuchao066@163.com>
Subject: [PATCH] [v2] coresight: funnel: inport schedule by priority can not take work
Date: Tue, 27 Oct 2026 23:14:56 +0800
Message-ID: <20261027151457.5713-1-xuchao066@163.com>
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
X-CM-TRANSID:_____wD3v9P0v+Bq5nDACw--.64470S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF13Gw18XFy3uF4DtF1DJrb_yoW8Gr1rpF
	WDK3y5uFyFgrW8Aw47JF4kuF1UJa9avayIqFyrKw48WF1jvF95uF48Kr1ktFnagFW8Gr1f
	Krs3AryIgFyUWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pimsU_UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC6BYARmrgv-YLygAA36

The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
rejects priority register writes whenever any port is enabled. The
current sequence therefore prevent the configured priorities from
taking effect. Write the priority register before enabling the
first port.

Signed-off-by: Chao Xu <xuchao066@163.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..500ff72a83c8 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -62,13 +62,15 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 		rc = coresight_claim_device_unlocked(csdev);
 		if (rc)
 			goto done;
+
+		/* Update priorities while all ports are disabled */
+		writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
 	}
 
 	functl &= ~FUNNEL_HOLDTIME_MASK;
 	functl |= FUNNEL_HOLDTIME;
 	functl |= (1 << port);
 	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
-	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
 done:
 	CS_LOCK(drvdata->base);
 	return rc;
-- 
2.43.0

