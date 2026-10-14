Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F6556BAA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991188; cv=none; b=R138H9pDJzGeajGIDo33D3Wu7/WwPYFm/DcW4Vdf3Q51lvLCfwaagiM8+N+uBNHcZGQ0OGf0uDhh61r1zYKrHC/hmfM67yBZFTO5QRaeCj1dSxE/nSyHk17+lXWdYvRqwzyMH6xVhIlfs1faEcJKP8S9ZhzD4biNG1wawpVME0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991188; c=relaxed/simple;
	bh=zZ4wrRNrUSlbAIRtWsrlzRF+70WmEZHyaWAMWVXvwfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgl3MqOWZdGvS491hK1TjrP2bW+ozEzhcc2a0Chm2BQMe+GHhAXQFR7zKKVbhgL9OSlZlvXhng9kVystqeLh6uyI9YrbjoepLzzNyNCP0xdGV7pmS2QdkEXX35dqLWGA6LuPSA74ePj3J6QX+cQ7ndcD7TWgqcqw1vfUeMIQ+o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=S9URo2nF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="S9URo2nF"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1667201a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791991186; x=1792595986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt2lnf8MDVtM059brPwM3fIP69zsoLXWM8Qr1rtqseg=;
        b=S9URo2nF+0CudypIdTX8NSiWbxYibg0NZRPOoDJ0CkmdEqJM2erLo8sQIKCivKxMeO
         stSFfiQwn9ejRT1d0cSqePf5sxOJ8uHoamXflm++N8Y+Pny7l5n89jT8wfPBuZwkwRmG
         UNzGGaf/+bnZT815K2gPa6HC9e1PcKdhxMj48qkIMaTqy9y1Mr36+ZuPZhYrtKrXDO8W
         M+rG/D8MzJcCNLs6tzGG4W/cNVHAYCeqbB46P+nD8zxDpF2uA/OT6lolHRADuh5Yn/Jc
         ls0S2DwgpdvgeulzUyufP0rU3h38ML6CTBJFPewN3O0xFLxDRilIQ2g64l9cPzDBJNhD
         VLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991186; x=1792595986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yt2lnf8MDVtM059brPwM3fIP69zsoLXWM8Qr1rtqseg=;
        b=2ovyePZSPirUM+R6/Uq74knZxgo71/+0+49XU8ZcvWRN52bNqBXT5uc1Z5hbAWp6jH
         4t2/Zcsgc7U2Nez5KKH+2uDC/dJAzvehStz5s2k8dWvACT0D5nm/R6r8IgGdYJqhLf5O
         cg24jd1tg77tsFbKsYHFgoBWfEtv0iqwiiPc5naeObzSFNxneGYB+LmBRULCV19E5E8N
         2jD/EK3yxsiCe2P8NyT1IGjMTzh3CIOhkr+EypasgEbMrDece0ySYR9u3nItEe/K3rVD
         he3acR81K77o/5WXfBKTQFSxcIZp3F2mrMes7knKEjMAiga41Ly8b+E62qMLhSDu13e1
         VMlw==
X-Forwarded-Encrypted: i=1; AKwUvByA76R0jcJdy0oZSNBRhxzmlSDhxLApXw+KED7FYEWE9zCa2TrU/KJQM2FK/P33xYl5hEYtkWOBsvaoOOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkoBNGkWyXHzgf6hq/gxt59pMbMZQNgqjvdRCYmkacM1vuOWCy
	9MgUGhUddQq5AGdAWHhlXyFtaKHqyo4MkKl+p5ropzEXuIp0/RhrJftx5PRloSgub9c=
X-Gm-Gg: AYBFou2KEZ7rXIgw5Z+UCs71vXIsnJKnriDcfWnAR3HGwrf1HSzU36HnzKuh2qE8NOF
	bjj4Yf5+A2qEDIkWkzlaxbUv/FQEAS2qQf9WZ0tTXRTImWjc9TmzmgaApH0WSz6k+sIitKfwJTJ
	IxFhCgvWG6m/J8fokJasj1Cd+XVBAGlG7mMgQbX4Yil6fECAXB1TTB85qXAUy11on9o6XcmltwK
	g8cz8O8UWwegjqUKbG1mxCKBJpDNEkycogcGwwlETsXY4sPGBjmFr+PMwVOwPKtYfXa3tAaN3s1
	/8OQSHOY76q3g/shkuyvVsgfqLegrpAQk28NEdmBNvvJUcEiyLWm5+JxRuK7hIy75xVGXtGCXer
	7kvILuWh5AK9JvtP9Znql0QAomFczQ8mR/sVaJ4xmhMzcH8+++zaNNiWS2fnzFiLOk75HYyf7x+
	IS9gt1fx3aT9gCgDLortErM068En/gHHc+0Pu/OWbgStz7aTwEiWpuKigCwEk8VU6mDF3Q9GCkq
	5r0tTMitoe8kGfhek3ocMnd9AdiJflM
X-Received: by 2002:a17:90b:574c:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3ac83c10467mr1056621a91.64.1791991186183;
        Wed, 14 Oct 2026 08:19:46 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac8d40e7f3sm622450a91.5.2026.10.14.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:19:45 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 6/6] scsi: mvumi: widen the flush cache loop counter
Date: Thu, 15 Oct 2026 00:19:14 +0900
Message-ID: <20261014151914.3632701-7-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>
References: <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_flush_cache() walks the targets with an unsigned char counter while
the bound it compares against, mhba->max_target_id, comes from the u16
max_devices_support field of the firmware handshake page.  A controller
reporting 256 or more devices makes the counter wrap back to zero before
it ever reaches the bound, so the loop never ends.  mvumi_flush_cache()
runs from the shutdown, suspend and remove paths, so the firmware can
wedge any of them.

Give the counter the type of the bound.  It is assigned to
frame->device_id, a u16, so nothing truncates it again, and target_map
holds round_up(max_target_id, 8) / 8 bytes, which covers every index the
wider counter produces.  That last part needs the earlier patch in this
series: without the reset check it adds, max_target_id can grow past the
bitmap it was allocated for, and the wider counter would then walk further
past it than the narrow one could.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 07cfac9276e7b..090ae79ec8c3a 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -769,8 +769,9 @@ static unsigned char mvumi_flush_cache(struct mvumi_hba *mhba)
 {
 	struct mvumi_cmd *cmd;
 	struct mvumi_msg_frame *frame;
-	unsigned char device_id, retry = 0;
+	unsigned char retry = 0;
 	unsigned char bitcount = sizeof(unsigned char) * 8;
+	unsigned short device_id;
 
 	for (device_id = 0; device_id < mhba->max_target_id; device_id++) {
 		if (!(mhba->target_map[device_id / bitcount] &
-- 
2.43.0

