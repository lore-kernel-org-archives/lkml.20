Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21273EBF1A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814384; cv=none; b=RDoyYaL6cc0udnT78eWhz4P79+1PNPbjOhlZwYrsVD2OUgjUpKSltxC6B9O6sIWAkFCg4QaDGq3mK/uDK5zJn8Z3qjpeQkPYk/6DzA3T7R482uc/D/z/RoHEpGLRYmdjOyN1jY2WW/9knWO747Dzg7Fyj0nN/62AftduH+Qz42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814384; c=relaxed/simple;
	bh=t6c75OVtqoiVL5APmNkHvyrxzzrqj5gyzHDtGWOtmWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8UnnhIW2d0Iu2L9AtvGAKv7rKvfR4OIBu5pniyXZxU8m6W4h4Fhk03zz2uA5vF94qtvtUZcmKOXxVCDbcBWfpF4lpOrbhqU4PtvPuTOnfgI67owjOPBU0n1l9RYnf1+qEDNH2JJ9bp6ZzbF+Tk2E3OrmgAYl0Lk+RuJ/tE1kks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOCGnP9R; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOCGnP9R"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so989990f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814381; x=1792419181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oPHUN39m0Ic+wQfl+2jkv0p3LC0GdWlez6ws3xAFII=;
        b=MOCGnP9Ro2oVPSuw70tWtnSRkn7271GESiEG4ZDfFL1+NPD8M27h3/iAFZVitRKoWx
         PRviCUA9X1dOeTnjjRNASLTWAnSxhz/imIrym/zSgaDf1k9QDACmTGDcK7SGtjn8v82T
         YwJezsbXfFM+Z2LDWCFrV+V9279jxWMy6P+sKamcjMePTv/MACCe2A1PVjvuAV3bOVun
         mC9vLlXsGiXvXoEqSIa/r6dQvI5q8ktwnCc+UKtZi7zclB9vAA9JzTf5+jgeCqkXwMpV
         xTHkWjsur8YqVYKxHGpw2ZtMb3ABHccD1LB76IKL99WCDBo+1O+zav0JFvOFzaG+Uxec
         U5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814381; x=1792419181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/oPHUN39m0Ic+wQfl+2jkv0p3LC0GdWlez6ws3xAFII=;
        b=FtAqRNl2ykx+Mw/LbUyDWlNIdrS3nDzgSxVOLrD5HKS0ChyfQD4W6wmdJw49KK5ylj
         Z5ExOHHEHB3dj5qXkE/r3+EI/W2hug5sS19+ka+wwMSweit+Zx34QQpkA2flasQEhUZ7
         jEM0ZuM1x9HXsSjXCLcuk5EgzzQC1BXAz5X4mTKnMqYgBz+TeFEW1HuuKR/shbKGLRRG
         uaCrJBit4RaFtGsJNFlpAHhlQZV0d8UwTJKVKuz7jxGY3D74sbSyv46Pvw8Y1z95hBB9
         JLOJgcd+C6w1a8X6vt+QUptywJQqrrD6DM0S4XVegjQn8ilK4ejU0R5jWfeSAstw5uHZ
         b7ig==
X-Forwarded-Encrypted: i=1; AKwUvBzYxeRCxp2Hcn22/STS87Dkj6Y/1ZfWcSYKoTvMcpcg65XfPxViiMveKaxXWql4A4GMlGHOUp5rV516et0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsuwYdDZTCc86apmJTck0sXavchP0gSrp6OiVVoygOcpXy+583
	CCK6BjDJS+gUgPPaoGK9iptAWdPl4S7jPKJWwjzjMA6FC1z5DfyLHUdj
X-Gm-Gg: AYBFou1BqMkRphC8z7Vmduo7vmKLAhHOG9GR/r52T+A9PNHlPKcbKOgUD24UhGKgwjG
	QTbEJx/oDxTt1LaN2RXC62kynF3/Pdh+sDsradMlJOXOeiD9OYZWj4RoIsQpHqnK+1Tj1djFmxG
	4W/gZG6P3Vm6cyLj80F5xEP7VKXStUUtUJ8aPRFkkQj8emH5mld0ojZHFD1J0PeWKxykw5YrK1M
	Kjy64UnRt9U1WWudvDc4HIkg6YUe4QvuSgLH0Ok5N/HYinYJsKM6D13ui+4bRL+H/Pi7ZFFzJ0x
	hx0dHQY2871+D5Lmit/tazFBK/ppddzzCfuaennEXQBo3sPPNxvMapG6JAE0Oue4KOs3Y/roSkl
	m+mOuen7coptgiUL8pWGZ8heXqDfuH8txTnejR8n2kPuM/zZSDTAn0fwaMH3tNPnEk3JQ156i3/
	pm2sruz4zTz9yi6a1IEMvCR5VXlAW4fgEyHHVr8XuID1mbcMgB6wa47x4/MJYuP1/gskXXWJltC
	m2s6pBZS/kyODbmokYBOQEIBxXojObPrT27I5wkCdiA
X-Received: by 2002:a05:6000:490a:b0:48c:490a:336b with SMTP id ffacd0b85a97d-48dba7bea0bmr16554793f8f.5.1791814380792;
        Mon, 12 Oct 2026 07:13:00 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.59.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac02cfsm18703035f8f.39.2026.10.12.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:13:00 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] nvmet: zns: reject a NUMD whose byte count wraps
Date: Mon, 12 Oct 2026 16:12:30 +0200
Message-ID: <20261012141239.156408-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012141239.156408-1-parri.andrea@gmail.com>
References: <20261012141239.156408-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zone Management Receive computes its buffer size as (numd + 1) << 2 in
u32, in nvmet_bdev_validate_zone_mgmt_recv(),
nvmet_bdev_zone_zmgmt_recv_work() and
nvmet_bdev_execute_zone_mgmt_recv(). NUMD is a 32-bit dword count, so
any NUMD from 0x3fffffff up wraps.

The data length check in nvmet_bdev_execute_zone_mgmt_recv() sees the
same wrapped value, so such a command can pass it. A data length that
does not match the wrapped size is already rejected by that check, with
Data SGL Length Invalid. Every site agrees on the wrapped size, so the
target zeroes and fills only that many bytes and nothing leaks, but it
answers a command whose NUMD asks for 4 GiB or more.

Reject a NUMD from U32_MAX / 4 up with Invalid Field, next to the
existing check for a NUMD smaller than the report header. Computing the
size in size_t instead would still wrap on 32-bit kernels, where
nvmet_check_transfer_len() and req->transfer_len are 32 bits wide.

nvmet_io_cmd_transfer_len() in core.c uses the same expression and is
left alone here.

Tested over the loop, tcp, rdma and fc transports with a zoned
null_blk namespace: a wrapping NUMD, sent with a data length that
matches the wrapped size, was accepted before this patch and now fails
with Invalid Field, while ordinary NUMD values still succeed.

Fixes: aaf2e048af27 ("nvmet: add ZBD over ZNS backend support")
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/nvme/target/zns.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 78d82b6ff1214..14689ca0c38af 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -150,14 +150,17 @@ void nvmet_execute_identify_ns_zns(struct nvmet_req *req)
 static u16 nvmet_bdev_validate_zone_mgmt_recv(struct nvmet_req *req)
 {
 	sector_t sect = nvmet_lba_to_sect(req->ns, req->cmd->zmr.slba);
-	u32 out_bufsize = (le32_to_cpu(req->cmd->zmr.numd) + 1) << 2;
+	u32 numd = le32_to_cpu(req->cmd->zmr.numd);
+	u32 out_bufsize = (numd + 1) << 2;
 
 	if (sect >= get_capacity(req->ns->bdev->bd_disk)) {
 		req->error_loc = offsetof(struct nvme_zone_mgmt_recv_cmd, slba);
 		return NVME_SC_LBA_RANGE | NVME_STATUS_DNR;
 	}
 
-	if (out_bufsize < sizeof(struct nvme_zone_report)) {
+	/* From U32_MAX / 4 up, the byte count wraps and no longer matches NUMD. */
+	if (numd >= U32_MAX / 4 ||
+	    out_bufsize < sizeof(struct nvme_zone_report)) {
 		req->error_loc = offsetof(struct nvme_zone_mgmt_recv_cmd, numd);
 		return NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
 	}
-- 
2.53.0

