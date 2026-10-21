Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550570;
	b=iGTHoU5OV5VSWvneaTd8dEOp/PIKqSmfxSS5aiKVMWIkG+hyXhzFyUt7vVHw9NwEQZjA
	 mk/CBv7HK/c5iFatECJwgbBXzGb53UJ7D2UFQJqBaEfBH60b2dGS2fmH3Ni0mKDiPLWNt
	 BOMXSabkK1grFNvRKmmtGHZnwrZy8j0weMzcQW3czTD6RbWUXgeZ1eLhT03G1fyDFe+1Q
	 MVAzSBTu8QR85mGbBzzp+Se9DE2X1C2huexkmpiXYVRlV2Gy8ejalJGjbwwdPfhphsopV
	 AYGmXnNq2kFxZVEgUyE090tfZ12BTnm/geH4NIP9y7hmSK5GOqieMNQIYUD+uLvc6qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GdNakqdic+EhTnNZGwTPeLsVaa0lc3BNOTpG5XYOw+g=;
	b=dsPEUkD1kiKFbfobhmBubgikXk2D6RthpT5X5zHUMIdNXoZo25/EZ2OkyCqbKq0QGmUK
	 Qyb8z7GCmzEahjDSH+sv4xuOxzPbU6oTYxmfh2tmXPQMUoC3kxoyxRk52U9evj5+uaysp
	 GcWKO3nD9UGL2rxSDwbTZgLU4op+g6ra9eBmzz8z5c7pfBX4ywylwg6jgunfvRUaGQuz5
	 aRUZniaBFZxMc3hGmVBvA+HN26k3ub9m0aAAh56IFUik0I3MJDL8nX+5VEkDCsMAq9zQg
	 Mgxsb8XXaj826tX9K6UEOtUbe9jftefKfiRrAw7G6IvvGXkSpmryggdgDMNSo5LzDHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ERXfoy9r;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A13F606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A13F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ERXfoy9r
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36661f953e4so471118eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550570; x=1793155370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdNakqdic+EhTnNZGwTPeLsVaa0lc3BNOTpG5XYOw+g=;
        b=ERXfoy9rntp4QITYu3f2H29ATGBVvi1dBQsjhAyJqBaGgW29SWOkIpowLin+YE1mO+
         Lnf2Blat2rCBrLoMWCvQ0pBBRnenVj8FdJfwykNR85Z5s59qKxTNO0LiSrTFpoKyfWIW
         jve8xFSpbRknDcdC/CRqdbLknPwsF1wM3iGY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550570; x=1793155370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GdNakqdic+EhTnNZGwTPeLsVaa0lc3BNOTpG5XYOw+g=;
        b=kd0C4BxpGrnwCZiY2vYyTRuNd2WQcBveweS8ZwRH4d0hfOiKA83quyfrwDyL8oyjnh
         DDSnu8T4whQynhUWZ5qIBjXUkcbePdiZIU6QpYnPgvz2vZR7RtVKCWI5oNlzlLXNPHcw
         D65cMqgok94GPbhPyZ1UjMltkMCPTUgi4YKTatbCMBbetX6mqPiA6eZSq6bibWXZpLJ0
         +pk48nmjQXRksSWuXR+lbbpLbzpqQrQb4N1oKSKVQgpYZdQoKOSX071ZTWvnBMIy0eXY
         Ir17PpaomZ8m27D+3diNXfbNeOhugO4wWxTs50wkCBcyKFH4lSvA1n82BssBEdopBlGC
         bZCA==
X-Forwarded-Encrypted: i=1; AKwUvBwd9Mc/MCZSLl/gptEdsxiYCNflzqmIDN/YJ3mIIn2q6HcxtsxuzjMlx1jxxPgXOw30v9PXQHw4fGE0STw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUOHHoxcadoxz0kAvlq64Pp1kMLNse5HxhsJM+EFC8J07iqFM7
	g43lqaEhpLvZ2BZACTBmdaek+QfNpNdPvrM/a24Q9WdK0MgiONG7EL7OPtWPaq1Cag==
X-Gm-Gg: AYBFou0F7AnOkAWoIpKpU5/fM6btx7G9PK0qAgweYKlWCTG0KmA/R9ZOwtt2jD0Rzqs
	LVMjDFWHiHg65mPuNaE53aYeCPzBbPLjEXN/56xOd4WSyjOJnjX8TMv5g9dYXYFyyFoQrg7Xto3
	2nOcrqtKXdkuVgMOgjj5mTheJXakOCQpiURJimqjimQ/Ovglo3kDcITnATIBbNvJUvArcpvyqUL
	nh44R908I6jTFo9/vK9rZnI6j2yiOSLHSeLLY+JaW8bqARuqO9e1Qbje8XG8+y5EwK8jqwQO0jz
	x/6OBx5M0epfJRR+wko1NryvznjtF8w0NzaUSTOlcyi6NpFPzUHxTuiU1aZkNdL6fHRVQUHiDnQ
	U4VoesIqoAxsXYSEmXAY32ITVdxm6gx1r4gEe2Yx+Rx/OrnalCqdhYWWV7upBOqpbTJQBc4HJfw
	pLl71DGscfSJMOfiZTxcGS7fiLROogq2Brceg/33C5lSlSnDyblHPw2pM5PhEpF34Fow9eworDb
	XnHqaVfMW4ZecGhddL63DbLyouVaBZ6wiWzCzG8YTBBaCneT0ra85HL371TiG0ALSPRuv3nluIR
	odGJ3bQKp6bVl6nnDRZdEFVYCclKCnt0p/LHX0KlEvh0
X-Received: by 2002:a05:7022:f512:b0:187:efba:9ba2 with SMTP id a92af1059eb24-190a84c55a9mr745932c88.44.1792550569542;
        Tue, 20 Oct 2026 19:42:49 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:42:49 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 02/13] zram: remove debugfs entry on init failure
Date: Wed, 21 Oct 2026 11:42:12 +0900
Message-ID: <20261021024236.1787884-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
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

Do not leak the debugfs entry when zram_init() fails to register
the block device.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ab064c84b092..593fa4ae47c4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -3297,6 +3297,7 @@ static int __init zram_init(void)
 	if (zram_major <= 0) {
 		pr_err("Unable to get major number\n");
 		class_unregister(&zram_control_class);
+		zram_debugfs_destroy();
 		cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 		return -EBUSY;
 	}
-- 
2.56.0.212.g129ede20d9-goog

