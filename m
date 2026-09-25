Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221743E2751
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790335001; cv=none; b=k6RtIMd5c+o3aTHOp0pf1HziyPxhSqzqtN4oj1YJHAJmeHL1EYQJoS8LeF2k4C2YzuH0y9Bil5jSU91IhH/DxumGsvmpOaVMw5EmZftXDzvv+G2RktSp/DQW1QHmk2vTfrzenZ6t0bPujZN29Amq04RFQ9VBafQvO3P0bJccSes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790335001; c=relaxed/simple;
	bh=5ZujRSyQJregJPMUymk/yiSTpGUWq/0YVKoOx5Zs1Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncQhCVfZLzxDY7x00TTXti894Hw4VrQdQzWDKaOMMafEhkB8zEH16dUMzK2SPHjzY9nNbTFQCR3llRRC7R8iNiMnjMDdL++3NpjAdaTF4Ln9l6ZinHamFGVZvDoQWD7DifXz72ozeI0x0J/N+VN2pQ+ypcMVjVJYzimIBEqoaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=YLt7KEFB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="YLt7KEFB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so4542035e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790334998; x=1790939798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXXodn/Gz9EuJ+FWpPi+CnP7LgY7X1c9rtJL7VC41Io=;
        b=YLt7KEFBvzRj/1gYmBQ/moTatLl4SjdaziNDGnWYi5ExL0nWrKvBW2XOE40K+g3rxJ
         ZtfBRRKsPj1hJUoBuWa86mP02B2A38e6dBL9NSf6sueJjSJzoyH4MLrcamCLwsM6pkCJ
         B0WIds7AXocIy82t6oVeUdzw6XMi3ql+dY3mBQ4VdIccZ6MGJnac4SatChUFzbcLSPfS
         GrwOJptZD8UadW75qhbc07c9+Q5z8pFioIIygJtuOZYUJ2qIDfvZXgXVTm3SKAVTkHwz
         TQq8YVoD+t/uPRibDIvIYicCxbmNLjBH1xMPjNb+y+IveLZYX5mZmKKbKN53xj9ssWlh
         +EWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334998; x=1790939798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXXodn/Gz9EuJ+FWpPi+CnP7LgY7X1c9rtJL7VC41Io=;
        b=OsIg74+pWtgkiP5qDXT6LX5XaUYaxRvcxku20v+XfbxyGBWXIGj9jPB8ZZQmRxymyj
         vZZ3stg7VQmMyZtczVhUOd49+91nz4jTcdfQY6e5kgZVeRohZDZ8K9KD20vAcCmyFD9K
         JLciGp9JisqLT5nLGpD4HAZGQYKqn388Pe2I0ABqDuAo0ZocwL1AMa5QceKDxXsMnG0q
         n4zrx+yR8lB4ycs5Lqha6msYrx3/FRk6m0HXT7ImGiz3ThySmnylea2qQtlRaMaH3WM+
         MOyMhiTAof0zeaZspro6NKVgGzItl/0E/8DgzddBi/jYNbalGTWy05ExlO4PpE8Y8rgM
         aGXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqRfvTR/zfM39mSoyrTL08eZPiy0hxmebbtKZzokO+Bx1REtFGRzvU6xfOyyNLeY1Paa2mpJtV/ctrcxA=@vger.kernel.org
X-Gm-Message-State: AFuF++kSfxfhEISqIU/+uLgnxcjAzhwLJC1hFPgNale+ktR4D2fVQF0k
	HcdKUyx6Ertcz1abTVGDFDmxQquVwuXOm13uakR/nmKqPYh5QSaw9ndvziadUmnfT/3Y
X-Gm-Gg: AYBFou1sM7vsDEbkP/8kGqkUFiuTG377W/37uXYsOAW1Tjd4wPn9qIw0qL0loiIiXbg
	x1iXbuwPkh9lI1ddtoho/tLNnDYqV5zP+P4xSkv1it/98WDCh8Q5aviCy17c7TY+YY1go1+gHT1
	h0GCcqtv+0nNr1lfvzjLmbYsRmm4OTUR9PHRKdlGHpQojHEou36ph352gaqpcP8ZNdlxKgYk82l
	BAvGpQx3077TO+rwKKAXC+GHgNcZyuvl2SMWyN0ZXr0RO1tMRh+rrS/akH78mZQQrUXWvvZX1Gg
	iJ4Vb9VT6GHzhswytnoaRSuiXjVGGFrLQe94mxIgYuFVUcnoxk3ULnVwZU9uck6s9oosvnVRA9D
	QyFrLUi2zFQHvpeQhEQVM9YTQh2Bc78grvUDdkaRBehnDc2hgBjdgZVZTPAe1xjDGKJKQsGZGqq
	d5gInDiKiGLgpWdD3AHK1Dm5W7n4a52Qgb0807Svs=
X-Received: by 2002:a05:600c:3b1b:b0:49f:e4d4:dd70 with SMTP id 5b1f17b1804b1-49fe6705bd7mr95338555e9.31.1790334998062;
        Fri, 25 Sep 2026 04:16:38 -0700 (PDT)
Received: from cachyos ([151.36.34.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm50237695e9.12.2026.09.25.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:16:37 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fs/ntfs3: validate SetNewAttributeSizes payload length
Date: Fri, 25 Sep 2026 13:16:14 +0200
Message-ID: <20260925111619.68345-3-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925111619.68345-1-giulia@bynar.io>
References: <20260925111619.68345-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_action() handles SetNewAttributeSizes by reading alloc_size,
valid_size and data_size from the redo or undo payload. It only treats
total_size as optional, but it does not first check that the payload is
large enough for the three fields it always consumes.

For LOG_RECORD_MULTI_PAGE records, find_log_rec() allocates exactly
client_data_len bytes. A crafted SetNewAttributeSizes undo record can keep
the undo payload within client_data_len while setting undo_len too small
for the fields read by do_action(), causing an out-of-bounds read.

Before this fix, mounting the crafted image on a KASAN build produced:

  BUG: KASAN: slab-out-of-bounds in do_action+0x7640/0x89e0
  Read of size 8 at addr ff11000101d94ed0 by task mount/61
  Call Trace:
   do_action+0x7640/0x89e0
   log_replay+0xcd38/0xe690
   ntfs_loadlog_and_replay+0x3e0/0x500
   ntfs_fill_super+0x1fd3/0x4510

The same report showed the object came from find_log_rec():

  Allocated by task 61:
   find_log_rec+0x17d/0x5f0
  The buggy address is located 0 bytes to the right of
   allocated 80-byte region [ff11000101d94e80, ff11000101d94ed0)

Reject SetNewAttributeSizes payloads that do not contain the three
fields it always reads. Keep the existing total_size check unchanged,
because that field is optional in the current replay code.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 88bd6ef98467..c5de4ebcc7ec 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3463,7 +3463,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 	case SetNewAttributeSizes:
 		new_sz = data;
-		if (!check_if_attr(rec, lrh) || !attr->non_res)
+		if (!check_if_attr(rec, lrh) || !attr->non_res ||
+		    dlen < offsetof(struct NEW_ATTRIBUTE_SIZES, data_size) +
+				   sizeof(new_sz->data_size))
 			goto dirty_vol;
 
 		attr->nres.alloc_size = new_sz->alloc_size;
-- 
2.55.0

