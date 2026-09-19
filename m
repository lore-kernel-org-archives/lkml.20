Received: from mail-wr2-f21.google.com (mail-wr2-f21.google.com [74.125.225.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8C1376A06
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798283; cv=none; b=Iu68ijzjvdXqOd0i5LlccxYHYzdY632FGS7CB4M5JOyBVzq/mIPQwDFPAlJeILXtrUJ3p0+NK+JYr92rcdpwMAYWMWLPmcdHNS/8EXC8FYrYrCfhAPx2SUiKW9RpuxLEd+g6AXq3z5nHTMYWvioMmrK383+xbdaWi3/fD3C3CuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798283; c=relaxed/simple;
	bh=lwcvsGM7dkF7romeMnX3Ds75/0ZlM0UvamxerXT9LbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jc5jQgPzSg2+hMbpVtEVdkIsHhp0Z2Mi/R+KJfWrfA/gmj/IIRgiRvZ6exv5VnVZsVR3SNDvy7vqALY7BuGEUCBlop7UHFjjimAGYAnes0/MJ0rROZnVZDnApifYjRbFsgGwBMMiEkezd3NfRiVvDS4C25mfJaOtsITvjz0m9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uh6Atq+H; arc=none smtp.client-ip=74.125.225.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uh6Atq+H"
Received: by mail-wr2-f21.google.com with SMTP id ffacd0b85a97d-482f633cd80so658134f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789798280; x=1790403080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wzv5spbilUO1qSlslWoXOyl5RLYwHziQsHbiWKOWqZ0=;
        b=Uh6Atq+HTmmPQ8WVekaEkCIekTTuRWPtOpnha3hf2CkpKiIGzivqKtbYwUegyZWNct
         LkFtvu/85nlr2r1+D1steBNiVBU0KW3S8mMmPgl4b7fB+RVVULF9/IK+8BOelZvB/bT1
         U5ZjlUBEaUclJKxwBgm8W1FxCdnHOjaqFEsu0t42jlrXuthmr21q88jHgnstb/n/hfmB
         LSIyuKQz2P/n3BiZINOb63bUHTksrqs72ECXZ5bdrtXqSxqLSGZmEFnDyEfEQVjFyj4c
         GN++ech6YB2l4GtQj1+j7RSoS5keexlycup7R+xjG/w2DmYIngW1mWdFLo2FHMEhg13W
         PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789798280; x=1790403080;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wzv5spbilUO1qSlslWoXOyl5RLYwHziQsHbiWKOWqZ0=;
        b=wsxjEl5NPSpfreODZOxuNgibXf5caJZQNGR4dyzubLpCjf8k/kPECOzuiw5tnJad9w
         uCD2fJqERzCXVxnJX8k1NhPZdQjtH/cUy4pItpOKt3WasPbQp4baX9XGBZ3J8aaHE205
         eQUksdDh8rF+PQ9VxyRXWmtYkBGMqi+v8D3WJt2ak+Fnzb//oa4gtIZp58uORp+pNSDi
         cRHQBfY5Rz4iUnjhKIltyVn7EtLFHr8sQlzuf98wkYv/UUlgDn2BBlpzsMbjiUjqAZ3M
         16rV8Xur8AXrv7O2leTi+4DT8x6FA85wEl/CY7KydrqYAGpp7iF03w9UZWFgoaK12SJD
         oZvA==
X-Forwarded-Encrypted: i=1; AKwUvBy5Jf6JDWtmOTXE2baQtVlkynkT2BZ2uOb4mXa78dXk8QF2lzdJSkemV4XuXFmmWSTX2JLteo8R+LfHq1w=@vger.kernel.org
X-Gm-Message-State: AFuF++k4qUl2D9ZnPq10aFtPuxSIJW2aEh9ihIZFAxyLO9fr5nozgKb4
	6SMAwrVacy95DeDh08/kA5BRrKopN5j4LLkO8xsF5fV50VRR4T1EeACm
X-Gm-Gg: AYBFou0Zs0cJGkp1kWy8AA5yikJS88YpBGz6upalbJgOlxcOIWsCdfefUAPJNjpET4u
	7KPWcgI/gMlOPC/N8VPaYw5bUiw6asRAvoyPWPzX1OIyOVq4HWemGsYhbp4f5nT1gm2CEeH9P5+
	2o+MMyq5mIVye2Cllwn7onqVJg4H8oFbqyE5Nnbcqfydpc+0muAcm5cLz6ZdOiuZag+nk8YYeik
	oQ4BEVbPuVaaSJSIdsLqBR7iAV1BGoUm6Bbuxu9PKdKHGCFhdmH5zKuByKMa77l2vh9ciy47nRo
	gaPm+Yj07rKZoykcjec3GIR5DBcA30cL+MKmikphxnjZV+IlJSRWG0+8+IwP/vGS/CXxFmjSDfZ
	uqvJASK+505DSU2U8BbnWuNhrovjwI+yS6ZgExgcc6dJFtGmnBPG7oT4Y1PBAx32xYP3d7cirtK
	RpaNkQduc8ADUyDCbUijajLMyJuKG61O0QtlD7j2u9aBjgyok3W3rv9VPF0mtOurzJj7a8SNoue
	0cV2a5a2WYcTMxE0VCrrAYZpRJ3MMySqF1LFrca4s5lm2DWRwPy
X-Received: by 2002:a05:600c:6211:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fc5728f84mr58855245e9.18.1789798280343;
        Fri, 18 Sep 2026 23:11:20 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1026f4sm52016675e9.8.2026.09.18.23.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:11:19 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3] platform/x86: hp-bioscfg: remove dead bounds check in audit_log_entries_show
Date: Sat, 19 Sep 2026 11:11:08 +0500
Message-ID: <20260919061108.87240-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

audit_log_entries_show() checks "count * LOG_ENTRY_SIZE > PAGE_SIZE"
prior to entering the loop. Because "count" is already bounded to fit
within PAGE_SIZE, the inner loop check "(LOG_ENTRY_SIZE * i) > PAGE_SIZE"
can never be reached and is dead code.

Remove the redundant inner bounds check and eliminate the unnecessary
"else" block after "break" to clean up the loop control flow.

Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Resending v3 2/2 unchanged: the previous attempt reached the list with
a corrupted hunk (header/diffstat didn't match the body), which is
what "patch: **** malformed patch at line 65" was. No content change
from the previous v3, this is a clean re-generation of the same diff.

Changes in v3:
  - Remove the dead inner loop check completely instead of adjusting
    the boundary arithmetic, as noted by Ilpo Järvinen.
  - Remove the redundant else block after break.

Changes in v2:
  - None for this patch; resubmitted as part of the v2 series.

Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.com [v1]
Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.com [v2]
---
 .../x86/hp/hp-bioscfg/surestart-attributes.c   | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
index b57e42f..d689ee8 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -90,17 +90,15 @@ static ssize_t audit_log_entries_show(struct kobject *kobj,
 					   HPWMI_SURESTART,
 					   audit_log_buffer, 1, 128);
 
-		if (ret < 0 || (LOG_ENTRY_SIZE * i) > PAGE_SIZE) {
-			/*
-			 * Encountered a failure while reading
-			 * individual logs. Only a partial list of
-			 * audit log will be returned.
-			 */
+		/*
+		 * Encountered a failure while reading individual logs.
+		 * Only a partial list of audit log will be returned.
+		 */
+		if (ret < 0)
 			break;
-		} else {
-			memcpy(buf, audit_log_buffer, LOG_ENTRY_SIZE);
-			buf += LOG_ENTRY_SIZE;
-		}
+
+		memcpy(buf, audit_log_buffer, LOG_ENTRY_SIZE);
+		buf += LOG_ENTRY_SIZE;
 	}
 
 	return i * LOG_ENTRY_SIZE;
-- 
2.43.0

