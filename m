Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE48F476CE2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391158; cv=none; b=C/Y3e/NO/plewhfBrTCmMBbxnnP+bO4MR2yTq+egnf/iGwBWzGLEXX5D0UwRErCl6ygn7h0b6iYrsNED/uF1jhtCgcF9Qo47KWf2r6cSUZoFSJcUi0mIW44Qj5vwE2QV28r92zgaPtla8WxD0PuvZG3BXAPyF/E0jzTLFeTEcDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391158; c=relaxed/simple;
	bh=+ot06/esph++ISFoL95/F/SezXZW3wAoizYDA/ZXE4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDjWlvD4hj8HV3xQw//1esO4jVPyayDs+rQ6lXZUgk3mk1AfMitcCMjJvc6Ijij59WSSqh4HoqgI/nAuYe7Dc0gtuidxTQ6HrjjmuGrutXw6QsB9Op3NOUOuCpK2GxsoM3Ordvk5pbw2ydDOb/ADDgZ0yapKmdFVO+NIvfAAGxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQSD2/J5; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQSD2/J5"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-486e3f86ef3so246331f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391155; x=1789995955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4bb1Qf4ZN2oQ0J+b8ooyhKAW2X1wwD7W1Q4Zbnoqvc=;
        b=IQSD2/J5iRNkrn/HtQNzL0kpqSvWQsblJ31UhQ+T03H/YIlTIkbMZTlkhQWX4V3ph5
         R5qGmIUP7RRi1i4wCp1nx40viTQOcsBzwos+TH0EJ+HVgbFy5wKzFs/8eM87Xjk1tqg2
         sSvnpoJAcISVx8/yx6kiJf+9kUJcOdsH6+1d96Ce63Vbcvtj9QpDPJVraSPjyr//oAcx
         5PAkuaAfCqRwIGS5UGtR8uOCSusQtyRvjm3Opp48M3A1cXZteSmeVK/xryPge5Pg0rAM
         AVJ1E03Gv7h7vTUVizvU1t6JfJm2GaLB/QpJEDxtix9J3bmC7QbzQh1SRDZluLWNBzOj
         teew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391155; x=1789995955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4bb1Qf4ZN2oQ0J+b8ooyhKAW2X1wwD7W1Q4Zbnoqvc=;
        b=ClNpNk943UqgLcA5ZBnn6yY1EW/a/MEmQgP6XozNCki98BNBNzBEEOYV1oTkSjaeoV
         TpVrE3lb9yxYTfM5W63RfbC1UmmyEXkpO3k4bqC2bUPswQyazigk2bNBVK4Hg01NZvU1
         UiJwPnTTvN0SreCE690iuFBsNkQWLmz3leDMYwwfwE2zQ26IGrkMdeJ/agbpdewCkN0V
         oIIE6968zk+1+Em2YpBVyIj14Md2iOmEMJcP/ixZrt4cl/stdmdInhDT9oSOBYqkY59+
         VxL10c5P8Ret2tDiya31tly0Ntcdo25rN6aYVbJvW8fUz+lmqfPaHExRMPghNxNiLmhK
         ixbA==
X-Forwarded-Encrypted: i=1; AKwUvByF8ridXCNKP/dHs4aRvxmKs6sHhYwlyc3lpMcvzhc13Wi+7x+w0F69Bem74rNMK4ghLG5AianqaIhdo+o=@vger.kernel.org
X-Gm-Message-State: AFuF++nBv83+y5GEeC0PpWzlpZPBho6HYMT1XE1XGUK+xVDZTjqecx1t
	WIt8Q+ZsUHHK4JALbBnxcWKhVo8JMzE4zi+VYFoWyIeaIWTaVcOSuHFc
X-Gm-Gg: AYBFou2sgJrMbo+DgozBcUtoEF3JIv9gy0lrQnjAARJl/I22gcnYA6lICHMRDU8kpd8
	eWVeeWR/gB6VJY31QXmcPl7kTparcZXRO6Il4LAD0QfPH4j/MsKUuBcG75NPqx1TNPUZTh+o5BH
	u6odzEIgg5Lx80r+1E/z/WL8uP9Z2FUu95W8E/Oxrz1OzvBnIrCD3M56OSWw0DKNUScPN0wQAAt
	w5MqKwaK1lERfcaD1lAyHvX9O6+bZQOmrkWg2kaivIS6hBz90zR6gAnAWfBXdXhW7KV+kLtgLRr
	NY/rtta6a0hiH+H2eFKss74J6A3ky9wnSJchMj49PPN2Mo3JgX8s+bOy4pX0GcvIkKyJM2qVNnj
	3kOZ5Lf3sk8SpMi6mD8hy85fDUbUsd5kZtZGdYaAYIqeaZyLSV9oQj6P63xZZ3P+5H7QU0o3pS2
	K6UkERvz0LT5gb/IHBPtAA4rcrPWBNPB0+MhE/KNFp3i+sCQxAoh8rdXaJQl28CwzkUBDRbi8aw
	xZx8grmZvheQmU=
X-Received: by 2002:a05:600c:8b2f:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49e7a657446mr26349045e9.5.1789391154592;
        Mon, 14 Sep 2026 06:05:54 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62225628sm234119165e9.3.2026.09.14.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:05:53 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: bvanassche@acm.org
Cc: jgg@ziepe.ca,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/srpt: Fix srp_sq_size documentation
Date: Mon, 14 Sep 2026 16:05:36 +0300
Message-ID: <20260914130536.19769-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "Shared receive queue (SRQ)" with "Send queue".

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/infiniband/ulp/srpt/ib_srpt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.h b/drivers/infiniband/ulp/srpt/ib_srpt.h
index 4c46b301eea1..506c11b84359 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.h
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.h
@@ -350,7 +350,7 @@ struct srpt_nexus {
  * struct srpt_port_attrib - attributes for SRPT port
  * @srp_max_rdma_size: Maximum size of SRP RDMA transfers for new connections.
  * @srp_max_rsp_size: Maximum size of SRP response messages in bytes.
- * @srp_sq_size: Shared receive queue (SRQ) size.
+ * @srp_sq_size: Send queue size.
  * @use_srq: Whether or not to use SRQ.
  */
 struct srpt_port_attrib {
-- 
2.53.0

