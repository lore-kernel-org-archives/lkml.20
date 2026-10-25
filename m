Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792916177;
	b=1DtVCk5KQm7lDYF8gxFVtflRXdu6LKaxzDUAm0Alk3uM8CzFdMAN4LKLitSsqWwV+qli
	 iS6cuIK4y4pIlG5+AlvlNMxgq9yDFXpP7nq7SQmGsBI2YUPrHLte7p2gjehw36D3C5UU8
	 t/ZpuQkTjA6vHBGZREFU7G1/X3nVnV7bE5vP4eJe8QPFRQ/VIryuT0/hxx6FPoZQG1Knm
	 0hlwzxPJGku3IDMxX0AVsv9nJFGElOXFWjEv8tDr6m2A0QWmes1sko3WH6GVZJ+Y+RX2m
	 GRJL9nl7kND1U+rIhB4SLvQVLT3B5EEdwuMhp/0P5S/oEC1S1t57koE6fq4pIcmNa6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792916177;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pDVCC9PFhBIVgawYa/F+D3FvgUGbAG373bzoi9jD/8o=;
	b=qz5VrP3WvEmNj4JlBx0cDjR6nRULHAsJWz60Ahin7l25ovblrM2ynaTWXR72DfmlOdWx
	 k72/HbvqBgJBSeU29tfgTjIQSrWK86g3twA5YlrKGzjMwKb46NtcsUNjbP5dScbf4ru5K
	 VKTuyS7j1suzvsNeoaAvaiLAInH6LzDiz8NM0S/siwUN6hNkYRxgoe62YVOfK2wvYChqc
	 WYFhmfB1u5gVbvakE6o6J+czeWpFVHjbPe9gMFh5ndCLPG4LwXgNCVt7Cedrrf7FS8aIm
	 wQKqED4mheSFoDuGtqNXSj5A1uNhnzCl3i9XkbC2E3JXMF55W9FVH42dqM+WI0/UzLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="ssg5/qcI";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C035606A31A;
	Sun, 25 Oct 2026 08:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C035606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ssg5/qcI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ssg5/qcIk1rCtwEzMps8s1lznRNgcTiV/k+vVP6d7pv9+wba5t3jxgKioSOUNFQKlA9QGgCOXoEoL
	 MzXp6UX1vGRXoT2Phn5wOr3g20bC5xd1eeKnfzho9qvyL6S/xMjeOwMRdPbE/UrGKdYxDMDsldmjc1
	 uoyCAhchUv4s40Wg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86addbacb3d2-e37ba;
	Sun, 25 Oct 2026 16:16:12 +0800 (CST)
X-RM-TRANSID:2ee86addbacb3d2-e37ba
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[36.137.216.17])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76addbac8b3a-82765;
	Sun, 25 Oct 2026 16:16:12 +0800 (CST)
X-RM-TRANSID:2ee76addbac8b3a-82765
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: [PATCH] ASoC: qcom: storm: Fix of_node_put leak on error path
Date: Sun, 25 Oct 2026 16:16:09 +0800
Message-ID: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
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

In storm_parse_of(), if the codec phandle is not found, the function
returns -EINVAL without releasing the CPU phandle that was obtained
earlier via of_parse_phandle(). Since storm_dai_link is a static struct,
the leaked reference persists. On a probe retry, the CPU of_node would
be overwritten by a new of_parse_phandle() call, losing the reference
to the previous one.

Fix this by calling of_node_put(dai_link->cpus->of_node) before
returning -EINVAL when the codec phandle is not found.

Fixes: 79119c798649 ("ASoC: qcom: Add Storm machine driver")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/qcom/storm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index 6b42fbfd2..6a42876ce 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -79,6 +79,7 @@ static int storm_parse_of(struct device *dev)
 	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
 	if (!dai_link->codecs->of_node) {
 		dev_err(dev, "error getting codec phandle\n");
+		of_node_put(dai_link->cpus->of_node);
 		return -EINVAL;
 	}
 
-- 
2.52.0.windows.1



