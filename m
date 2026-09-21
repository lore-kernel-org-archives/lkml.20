Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C7039182E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021256; cv=none; b=AUJ2Eccnc5ezLhQmYFUdXTDWf30BL6ETfFfD4CShLBVCHE0Fv1EMtshaUYlCVQb4PRBL/x/zctQGs4BCjuzRbZW4AMOppzJWQw4ShQndcEEMbm2KxldMhzDgqXuIGVzIVG7QJTaGHS4dHl/YpYlpfA/hgUESvPuuB2MsIqnOQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021256; c=relaxed/simple;
	bh=h8e53L5zdYtFd0pFE4MxiUgVtoMWZ7wr783X/OjPx4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koWsLW459wA5V6mGbgtgWQMfVhu/kdSVuykQh/u4vbjcvLpp/x2Luu8egIeYRMAGg4LX39Ksu8RdYBZGi2v3ThKt5W4Tr2CmzH5sYxmnEeprjdG5mjLvOTb2X0o4slsh1RM+PQzf/EeYMUMA7XPtApBoqUL5Yt9Sn/GT1AFc09Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=f9L2KWat; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="f9L2KWat"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so2086189a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790021254; x=1790626054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XupBU+OHDiEaB57xV6YrpzDidx9L2S107dqdUErPaGE=;
        b=f9L2KWatq4SfI0CM3hxcDFSyDkJJkdm09W7aviGTkaUrWVHiEST6tsWau5MpNQAHkG
         4iTk7sBbzSYHVT8AVhjCuwif81ftW5/oXgcARMv5FIX4Idbus9m/7XVYX1mkwIPWdTJ5
         ByNB/6fbzeCTPD2BwL1GSkxCdwnPc1DPcO6pawhqnb42gxWczDcRh6tcMBKRILLL2kLQ
         /srYF43qPkjGB+Aj3LmdFLYkvZAN+SJnAC5vqzn6BBEHWpKg/Pw5L/UoA5BVr1Zn0MYZ
         73J08gD3xeLpQlCiAVCiC+jAyKvSrOFL84lgllb8IlfQgk7Jnn/jEH+0/v/Wc/VPNWeD
         xkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021254; x=1790626054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XupBU+OHDiEaB57xV6YrpzDidx9L2S107dqdUErPaGE=;
        b=Z+nRX6kvN+eDQ3/lXQSwsWthb7IsiD/4KiW4W9TyxAeR8UXylBTUXRqTe0D+GO2zKA
         ntvAEZLddQoQh3ofSK0x54bvTJP6mYLiHYUPeRLVwxFuMscnm5EOWfJ8J3L2t8XuGssJ
         k4cSdOcDzESoS5xeFGnqgWd/LxlXsv7vIP2BRGdr91lk9b61ZEapSa2KkMMW5CMILvPU
         WgIHbs89U/rUKksqEX2fSm69QRnz2sX02PsFHzIvmQVZ+E+egoaQuUpFHBWs/h+QQ65u
         QAyCPy+BjYgJv1RCX99J6HpQGz0i07HHO58stm5p1omiL0kPDNMOTsfEJAEGWkdq7oce
         Sj5A==
X-Forwarded-Encrypted: i=1; AKwUvByxMOMN7hLXtql4eCm5VqLzrQKtoFzUlamhwbXxO1ZRCTkAYgI1b94Mmp/DuEZJGlkncM5yi+L6TJ6Mrmw=@vger.kernel.org
X-Gm-Message-State: AFuF++lp/treUr5m8pvA5TtPhQ5BFDDMobEu+790TvOWwNtjTIP3BZao
	yr0wDC4jRHV2Kv6yqKhDdtEvZgSgeAkZYWG8QOnER0WJIz/58hEoa6ZYteiCy1YK7tQ=
X-Gm-Gg: AYBFou0B3MX5fB0D5Ko6jB8Msr9fCa89Bwd7jmUrS27yCjjXLVxLuPM/1rW3DbC2XCe
	YNYAWCr1aSPWe2OSiOnPZ/pZ0zwvbpbx+16tZOa/01u/tNEhGk7BBDJQH2wWd0VtYvqa1W5BS4P
	9npdf5UtYEdw+XtsVUW19TSVI7SmeFKRXDbPUMiHDl8KMWz3fEdteoU4tMloVFaxL7XoFFNNBg8
	I2dhNSVNNNFfjT2uHOtZwfVlJsF1jX14+raoMlQnbJjDramX9sCGlp9vaNKbPtB+Z4ZJSSsNEgT
	sKuA7prq/oGtxxpCbTfbNn4ALQwplJwXlChTyhO4+ZHiE7gTnsJEq4ibSa6aFY8dciesdFsJWKQ
	jS241Ky6IhckkyFVPTZCDcOTi4dKEfzzO6NunmPGd9KBNS3E9LtxPL2ENJ/4NcsuuIQG4rygQkn
	rj/466AxfsjXbtwBj+TObO/sZBGKaSD9XSWgNxN/OfmPYrg7jdh23N2Q/1BGHG+ypLuoXaNr4xL
	4wB/MImVbOJQmoRS0rKWadZ0Oe+9TMXCD36IYFRJ43dJKD767CNttdytHeA2uW8/1ZZ6Kx8
X-Received: by 2002:a17:902:ce02:b0:2dd:ad74:ac33 with SMTP id d9443c01a7336-2ddb1bbdf3cmr169683055ad.28.1790021253750;
        Mon, 21 Sep 2026 13:07:33 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:289a:f600:f11e:a45c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebcdbe8sm501164eec.15.2026.09.21.13.07.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 13:07:33 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengming Zhou <zhouchengming@bytedance.com>,
	Ming Lei <ming.lei@redhat.com>,
	Yi Zhang <yi.zhang@redhat.com>,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 6.1.y 1/2] blk-mq: fix tags leak when shrink nr_hw_queues
Date: Mon, 21 Sep 2026 16:07:25 -0400
Message-ID: <20260921200728.84114-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921200728.84114-1-artem@trailofbits.com>
References: <20260921200728.84114-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengming Zhou <zhouchengming@bytedance.com>

[ Upstream commit e1dd7bc93029024af5688253b0c05181d6e01f8e ]

Although we don't need to realloc set->tags[] when shrink nr_hw_queues,
we need to free them. Or these tags will be leaked.

How to reproduce:
1. mount -t configfs configfs /mnt
2. modprobe null_blk nr_devices=0 submit_queues=8
3. mkdir /mnt/nullb/nullb0
4. echo 1 > /mnt/nullb/nullb0/power
5. echo 4 > /mnt/nullb/nullb0/submit_queues
6. rmdir /mnt/nullb/nullb0

In step 4, will alloc 9 tags (8 submit queues and 1 poll queue), then
in step 5, new_nr_hw_queues = 5 (4 submit queues and 1 poll queue).
At last in step 6, only these 5 tags are freed, the other 4 tags leaked.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
Link: https://lore.kernel.org/r/20230821095602.70742-1-chengming.zhou@linux.dev
Signed-off-by: Jens Axboe <axboe@kernel.dk>

[ Backport to 6.1.y: use this tree's cur_nr_hw_queues snapshot when
  freeing excess tag sets. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Stable submission note: patch 1/2 in the CVE-2023-54227 series for Linux
6.1.y.

CVE: CVE-2023-54227

Build: This patch was included in the x86_64 allmodconfig and
CONFIG_WERROR=y build. It produced no new warnings or errors.

 block/blk-mq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 8a9d9e3db1668a..b6215bee3d3c45 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4509,9 +4509,13 @@ static int blk_mq_realloc_tag_set_tags(struct blk_mq_tag_set *set,
 				  int cur_nr_hw_queues, int new_nr_hw_queues)
 {
 	struct blk_mq_tags **new_tags;
+	int i;
 
-	if (cur_nr_hw_queues >= new_nr_hw_queues)
+	if (cur_nr_hw_queues >= new_nr_hw_queues) {
+		for (i = new_nr_hw_queues; i < cur_nr_hw_queues; i++)
+			__blk_mq_free_map_and_rqs(set, i);
 		return 0;
+	}
 
 	new_tags = kcalloc_node(new_nr_hw_queues, sizeof(struct blk_mq_tags *),
 				GFP_KERNEL, set->numa_node);
-- 
2.39.5

