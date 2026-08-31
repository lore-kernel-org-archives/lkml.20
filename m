Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF2C538D90
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189707; cv=none; b=RLnwK49t8Hor4D4oDpI0P4x0d3yGtrQHuLAQdC1wIUvun7Z051/3womOa94e2pqRuTlH1PA/c+GwxdbcUgLx7LBBVwtvj+54m4r/n77id6ViyXgnZJCN8WrK4XkOBU1n7vZ8G8m48pDC613ccU78st+SGRfbdutr6XyKaJw//pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189707; c=relaxed/simple;
	bh=Wl7hWPoxTOBlqq7vnQDQZQd/z2keZXJ4zCnVMCil4kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCkLOu+dVgZyWTnFDzYgqtFvINpLg+tV4Qedyot8MiF5HtifMhbApml0I1chako0LVtLhO2rBgZr91Xq6rUhFlRrnLrhCj2m5z4n8kHOVwjhJRndCMDpPoGiwGdLd+uxXdLZMpIBuUgea2U+V5G4EHQU3pUCYrmOyCn6PUQuBEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pskg3RuR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pskg3RuR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48433f36a21so1422351f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189704; x=1788794504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYStpApz59/NN9gdwKEzWwAQTvauo+N1Z+YjlKkOxKU=;
        b=pskg3RuRnkP6XyW0j/mGUjVSpFepIgco3Gpjx2rB618KCCUKSzwbJPkCqKH5nHJmrJ
         8Qew3s4fK2wWmMdfbpBn1l9lCOldFLnTiGBXYkc9lxkuQp7LYbKLjiKny5vUcQmfc7k3
         rIjw4bbBuSAWYIMSJdf/u2RC4a0Xb7tlmycWi5PtYsQ8A7397lgJ9RazHbK7RrL0eBHQ
         zGFrVOAUsi/PMwg1SHjxvaD9TY9bMzDYlz8qoQHNHSC8XyyySnhk3Do/4JAovbt1Jtf3
         O7klmtxsT527pevyWpiNT8UMAIPJpxUlbcGy19t0aEnhxuU/drXqigSXDozxG+DIrcwi
         DDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189704; x=1788794504;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYStpApz59/NN9gdwKEzWwAQTvauo+N1Z+YjlKkOxKU=;
        b=rrZjEvpCqCUavidHSaYrkdkyxSJcujVeD/ArGiBrxanwDcucSairObWT4f1vk3tZMU
         R40g92Py40ci/bqFBLMBY4eYbIaBHPOcl/aR6FRpH0GCOYsE/AhOttUQFMoy6GcDmdGs
         9njVYVpDmrscEJwoR1T5Y7k9iyRKb4/2H344khR+oZ0PenMdfeEdjmjkKRY2zh0OcBfA
         As3fMpk2VWKHqF4inNeiJjEyQ7TxinSV9D92j9XhQHjzmBjaetvFvlpyAapiYUh0OkhM
         FoW2AA5RZFI2Jfrg8t2cN6LMZQVVePlpJYmNrhXe2iZJ2m2p6NT+QwK4NGPq57YrJeUc
         82bA==
X-Forwarded-Encrypted: i=1; AHgh+RozjQysKjcvZKKpfJI4idjXERPk9u8vzDUaHNikrcsO52rTYMEFnkjTpAW0xLgQIDgwbNtBfU3+3mTKYxI=@vger.kernel.org
X-Gm-Message-State: AFuF++mSzh203+9/eGS3Fzti/JJoFznDdepOnARBMGUesVNa/V8Uivkn
	4BSDxBt2FbbsgMK8lOI91TrK9/HosK0tBykM+tukul3BS5HXyGse4FkHEklOwgsFGB8=
X-Gm-Gg: AR+sD13ouropPCE9jsFgo1CFAPTGcuIg4XYCUStvOhcIJv7kdWYVkAiZ6vptJ6/0HJG
	wdODFhYkHkYeI1Rh+Y/NUZrbkB5JbDGRiXASF+qG3DnjiiKwUVTLCD1tBch27ZQ1llK1wYwilqz
	ZvXQnOKjf6MWDISfzUdWKfmWFCzeFIt4TFIxR18G6d+w84OKRRzE3Mm73nAHZOY4d4XMHCxCyC5
	tV+FR546XfIPATkeDTq8P8dVoPzMLrZixdP6Z6JnXF4NNrZCPXb72wZLAJLYw/0BTdH7u+UjTeM
	DpjcMcbIAcKwAcFVSMyrVA+ssw0FIsyry9mR29w6mlYXla2Z0RvjPrgQjUd7sUzlXiZb26DZjcc
	A0SRaW+8LGojbzVjnwbktOGH5Vgvq5x/2FTiJiyYNswjsQ0bJ84OY2AbKTXrjRhbYUAtuWnSjND
	sqoOHPYJ6NiCB7yw4U/ry4SLAMfb6aV99KCVPKeK6S3y/Yl15R6J+Iw5PxorI4dNKHgYVSGAIW9
	bHCDkeEx3RT0o3P6viBczTn
X-Received: by 2002:a05:600d:8497:10b0:49c:dc11:2b62 with SMTP id 5b1f17b1804b1-49cdc112ba2mr26489365e9.7.1788189703907;
        Mon, 31 Aug 2026 08:21:43 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm528166815e9.10.2026.08.31.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:21:41 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 2/2] block: loop: restore state on loop_configure() error
Date: Mon, 31 Aug 2026 12:20:44 -0300
Message-ID: <20260831152044.166353-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831152044.166353-1-ivanrwcm25@gmail.com>
References: <20260831152044.166353-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On failure after loop_assign_backing_file(), restore the backing
file GFP mask, clear lo_backing_file/lo_device, and re-enable uevents
before unlocking and dropping the file reference.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/block/loop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 6f12976035b0..838554bd980e 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1123,6 +1123,13 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	return 0;
 
 out_unlock:
+	if (lo->lo_backing_file) {
+		mapping_set_gfp_mask(lo->lo_backing_file->f_mapping,
+				     lo->old_gfp_mask);
+		lo->lo_backing_file = NULL;
+		lo->lo_device = NULL;
+	}
+	dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 0);
 	loop_global_unlock(lo, is_loop);
 out_bdev:
 	if (!(mode & BLK_OPEN_EXCL))
-- 
2.43.0

