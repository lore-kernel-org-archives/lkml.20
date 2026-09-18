Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1348E0F6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714135; cv=none; b=CnOQqdDYrc5mcVYT+WakdZ/fV9xgjIs9Be9W925MTLaNWhBvhCFcTl3yT/nBHGqsU91ORDkg/0YbvfQuWiy3EUz4hDPwCBaljYzprmmRxYLSOlW6VVxuX3N31revxQ+w8JL7qorN8WUGp6pliSBeLhPV45a658Xxoq1EmlShd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714135; c=relaxed/simple;
	bh=7rQrFMtJ55G2Mrb8g+3bc3TGIQwSJ1ztALOvfNmBOuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0NpehczdSu4gJ0bt8oNboou4/8lk+QC4TqvTxcw4VZonQNQ9DYBgfnCS2H95F6WMbqxMgH0pbfvbUevV8bBEBCyiZZIPt7HtRN6FBWyUXJc4uEQHUMnCUAOd9rUJ5i8vjFMgJzq7W03bkSNcF+pzKNJHUBFUIQUxmmpYAicrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHqYSQyy; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHqYSQyy"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso292576a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789714118; x=1790318918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6wREiIJDBBh1DL3Ex8v99bfdwJWaSg/ozdZvFtc4WM=;
        b=iHqYSQyyXr5OV0WxGbrCjp9ewO6g5Gaf6AaB7+VU43sx5UZhZGsAPRRiEPTeYxn8g9
         WP3d03fcRt0P4zfcNU8BP8Rau98JR1WBD0uHK0rqQK98OdGtRWlDd7SkIkhDKMeGNOCj
         kAd53ggo3KRCcP+xSNgQhDvWf4MpRK6UfsnCvgdvuhYJPcMEijkcFIvO4KYqX7Avr63F
         Ga6qVjrX0j6ftchJ07oake6DOX/Rv0Fbc0LK0ese7nEvYXNB2z1phnowMwm9FqC/6KSW
         zjq5vORfFiGWtEorKuCmR+uJ82PFy7RQDF2/Jee4EdprGOof4jhLYdUL4usPYBzkus7R
         P4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789714118; x=1790318918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6wREiIJDBBh1DL3Ex8v99bfdwJWaSg/ozdZvFtc4WM=;
        b=1Sc0rxny7aoOc374eZyLEKImGHJ+hJBmzgUgKM57jc+FgNb1kwBLJsgl8js2YHXgR7
         HT+MPwnJrg8yy8F7vFWukF/WuRHbgb1Dfl3ZK3OQYPGcaz4iMOM8DdNTSpW/9y9cf7Qg
         IJ4xOEEaeH4QaOrozWubSWt/LAHdZAynH8i7kTwF9iSMF3BE51gaK+iyEvY+WXRgg91j
         RQZmMH1S3DNZuu8xy3GuV5GI/e8NDAlKFksEGd4+PcCJGlt2jX8aH7SzILANWhy4ARzc
         VWFlHTvsNmNz/y+cYvSEL9gsjQC3iROwcrrTOrRGKaV3JjgRzXnPGudsoysCfzlvdouS
         GcEA==
X-Forwarded-Encrypted: i=1; AKwUvBzfB64zJgRQq6VkLsvF0suvjLIbIEoecCw3WJcEQlabpI4mM9knRPUn7h2Bbd4Z0Ow225cZwGt2pYE7Lsw=@vger.kernel.org
X-Gm-Message-State: AFuF++mlNxJXGxEVko0s9F3Y4Qa1TBS7cEcPIo71c97yyN6ncL93BuP/
	u+Z2vogZbLtthf0VCC6Tym0tqog26KmABg7QCpid7+cjEud2pdLONoM=
X-Gm-Gg: AYBFou2xCq9ztY2yFRvThaHDQ3eZiYjUQsidGwa8zaIqeIbuMcECHl36jp38CJXBukk
	Uv9de+dWDyYCNXvY67QMk0jetRkupZskEHpo4eolUIPTHIlNYhDACNti9p1LCXHz96MYSdOE2jS
	mgf1O+t1VHp2BIu+vEEh/Gq0hVbHZyzT1mGqjeBjJUypkhOniSPJeEfwD9Ud0zW5DnBvDEKbhwQ
	mvBgvlSmy5aiNXi4TlRzdVaXphGWka7lK+Lzew8lr8MVFjVro0R7T+EjYrPzJLpofMi6su5TlAz
	EG5gFhXPJXErmxguvW+J/WO2NBnh4Qsg/Dg6RHlA1Os4dmhIvQ1ZbCeUNPkQVt4CoH1LtXLywr3
	iwdyrEyAw2h5afGnVTixp4pSw16MYNLyGpq1jO6KhCNGw4CMWJo+EifcPBGOjKIh2mypAgjZ2mj
	TNOn8VdC2onr3oTOqkQCPx0uLShcDmasMVTbAj+5z2EZ1+cEg8wjKIgPxpCxUEgqqYjjBzRFQ4p
	LdwWr/6ErFtztapoSfN8Ck=
X-Received: by 2002:a17:90b:4a03:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e54d38c48mr5637761a91.8.1789714118110;
        Thu, 17 Sep 2026 23:48:38 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50d332sm1578331a91.9.2026.09.17.23.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:48:37 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: tomi.valkeinen@ideasonboard.com
Cc: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	naush@raspberrypi.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: raspberrypi: Fix error handling for media_entity_remote_source_pad_unique()
Date: Fri, 18 Sep 2026 13:48:32 +0700
Message-ID: <20260918064832.891339-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media_entity_remote_source_pad_unique() function returns an error
pointer on failure, not NULL. Fix the check to use IS_ERR() and return
PTR_ERR() to correctly handle allocation failures.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..91e9fa0341e0 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
 		cfe_err(cfe, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.53.0

