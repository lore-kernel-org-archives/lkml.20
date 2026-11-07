Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069333;
	b=LujfQWLivHc8PcQ+T8h2ytHUUHwdPIUQ0YPbI92vut/S4qcwFDxAag/aJ3AEWZJhJwds
	 GP09QCg3U30GNtxg8ZJDr33GKCCnUGxS6G5xYdPxhJU4zVz9DWad0FR7QJcIkdRScPu/z
	 gO/YSkysGTc4x70B7iseHMYC+cDEUtb9rfTYmdh2sL0PEKsM0OgQfeGWASaAzWnlDH8kF
	 zFwQT4TG0L9VZ5QJMzw0kxAJGOegfbsCNbPYahUfkdWDVKS1zyiBc4ALsr6z++IPvuijd
	 Ht5l6r2AKuPC7qsHvmL4BK4ZG9AGeaCOZNV69fpVPUA96NYR26PhMZekuABMrJmzFvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=vpx8jpvZit1mrMnK53mn6lvyf/Hr8HxBYVCEMXEzzdI=;
	b=ZAXtuXlcacZR1hh56N6LOJbNZLSq6pcQFjo/BqfmG218OYgOgxqWT1Yp/8zbNFrF7wmy
	 Lka52BXkQTaCrdOFYGmeO2tTz5WaTBV/5Q40UhdUSxlStkc1vOx69OQSOiO9IaXE1byEn
	 cZ6GB+oRN/qklk/CmZSrj3BCK1kWsRxF7cMWYg8dOQa+ehzWzzytp3J1/IVz9FEqqUSP2
	 XRSn8ju2gQwl0U29jqr6hHSah5nFz04zzffGDcUfbMuWLbbELTjrT5b/CX2QjBwrXnCLW
	 9GMRRQqID9qWS8pnHFs/Gosf3n2oGfO8SHaKiRA1TgoxFMtUuBuo3rIfGJu1MN8yI3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TbrZZA1B;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061F606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D061F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TbrZZA1B
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso600295a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794069332; x=1794674132; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vpx8jpvZit1mrMnK53mn6lvyf/Hr8HxBYVCEMXEzzdI=;
        b=TbrZZA1BRm+Sy0qn7deY4UysaYGNgo1OVyYeTt9YSwGUJ/2DYx7c1Gr/1QE7k9t5Nz
         PXOuh2OiqSfIzKcXXK3vUPjfWm6tqfhuQ3TONFWqVyhrIPTGA9XeXsbi+8yGvUBOkNkP
         CquXDLXGxoUU0NvXIh3t7f9fqE10jnZCV3sWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069332; x=1794674132;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpx8jpvZit1mrMnK53mn6lvyf/Hr8HxBYVCEMXEzzdI=;
        b=2MVrUQ9rlug3wD4WzbBdFT6wj7gsxEHfQslYEDBk5zOdync6/qT+i0RociEXNVVATy
         0M8NgezuMOzHDlMnYooUOr+NlVxCN7hftp2m8G/tzX9UqTn9+7sBt2G5iTO0PRgRpLwm
         QpjNDhlTN4dVK2PsAhFgnx9kImW4TYiNS62TT+Qbjsd1wcmMki2BgsX9xgQpUnS2y/FU
         0TaTQ+Ms9feIJ2TLHrQJWP7tzm8i9VzaO4/0qzKgURpnShrOoXlRwiDJlxlftbjYhobo
         FI7zGcEG1yqgFSJnt5Yu6UZ4DRDLaT+QhYSnTpbl35S5lpN+C+YsI7kQW7HeGy7STYwc
         GV+Q==
X-Forwarded-Encrypted: i=1; AL+hErHGTiFZ2oLtbWDjFrKPScZh7HrJbKWgeM+AitynOOS3Vb9JenRgsmMHov4Ei2nayIO40GWuLVzfYglx9RI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pBUn6L71dGDmwGczncnaLXVgkqP1V2s27x2uVJGaYrhmLvO+7
	f/zqRsRvmxPK0B/44oRCyXmwv2m/8FqazBOBP5j+A8zW5+z/1uCYxK6PRYApnfgPAydHiqYjdId
	uSsfYb0mBcg==
X-Gm-Gg: AYBFou1K49/7BpflbhS6ig9Zdc8kbXWJ5PIHBog6GHb2e6Jd2hRaHuduBaa/rcYTkb8
	a4fMZkBrw9GVnqgT769SJvmmpMsA4YPEiAf/F1/FICqpvKz8zk/2v/+bynL9s92yyTh9NVmvg4T
	CUxZc1pqQwQboxk+K+diLmgVC/ygdpSvX95rGt2o8PkFkgzSO2uLS+BaFZ4Wz2tz9BQnTHYqyjc
	gyOWZVrpTTGireQ15g+6BmbF98j1thgHC7SW+qHeZZ4rgItjXNpXs94oVeOCKmGVmuqV3K+VDf9
	qK5GhQcR9pU+BPxR3khpQEby9NHRBVb3bEieuxK1g2+kDeWf557T4tET5m/hq8CCnFZNBlBWLY3
	TFMTzcKE4cBXLnjEgiJqIb0HpaR43Z4+bjB2RqzoU/g5aNuUa22GAxzQVdbiDt0EGY7l9Ta5T9T
	pXsl5yFfMb2XJpXxB0T1Q7DsMdtu36C1A//0jPuZTfOlH2Ojz6jSG/MlzzsU5K0KomDc4aomyng
	4BA6jiz5K4JidMlwMBAzEs0/awizu6iD5H6GsLuhdS3ArnvD0drQ9rMU85PUw6scCa0kQw/fHie
	AfI4DctkDWZpDj0wIelKjyFKCb1S6djaH1/MJdL5tM/13rYPDfYiSKwGP+akmGIVpptiuljfjeU
	lEuvo+AyVCJK85g4y8aF9ZL2uyQLkbbITy38Udrq9SLQ/tHYICAvkwxrvZZyrmVg/9SyzZufods
	Ialt9wrubKMyaYdh5vHWIubgj4XSYTtkZSJjiCuMaOfRj7c2D2wPtl
X-Received: by 2002:a17:90b:4b0f:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3b0db6e5c68mr6010349a91.26.1794069331989;
        Sat, 07 Nov 2026 08:35:31 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10588225asm3741301a91.8.2026.11.07.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:35:30 -0800 (PST)
Date: Sat, 7 Nov 2026 08:35:29 -0800
From: Chris Down <chris@chrisdown.name>
To: "Martin K. Petersen" <mkp@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@lst.de>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 2/2] scsi: sd: Fix data corruption in WRITE SAME(10) discards
Message-ID: <c58578f870580f92d1acd6cb73b59b7a7867d80b.1794069087.git.chris@chrisdown.name>
References: <cover.1794069087.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794069087.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

We already cap the discard length in writesame_10 and writesame_zero
mode, but we still truncate the starting LBA to 32 bits. A discard at
or above block 2^32 can corrupt live data near the start of the disk
and still report success.

Discard is advisory, so return BLK_STS_NOTSUPP if the request won't
fit in WRITE SAME(10). Discards that fit can still go through.

Fixes: c98a0eb0e90d ("[SCSI] sd: Logical Block Provisioning update")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/scsi/sd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a28d11886aca..9b8530267b4a 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1131,6 +1131,9 @@ static blk_status_t sd_setup_write_same10_cmnd(struct scsi_cmnd *cmd,
 	u32 data_len = sdp->sector_size;
 	blk_status_t ret;
 
+	if (lba > 0xffffffff || nr_blocks > 0xffff)
+		return BLK_STS_NOTSUPP;
+
 	if (!sd_set_special_bvec(cmd, data_len))
 		return BLK_STS_RESOURCE;
 
-- 
2.54.0

