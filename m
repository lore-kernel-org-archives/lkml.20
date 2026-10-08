Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33D73A83AC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477689; cv=none; b=kST7rXgTpP/tKLIeS8gphweGI86yTJTIh1U2nDmMqKA86lKBJp1a/m1kfnejVTW2eLG4v7mL7fx+f3bAs/jk2pvvEOqvJOpuZP8rxaoFLzLzaq8PAyMfKpAJP0N7DylAmO7ZnbxoIpSOaUDx9o2cN5wypoU1Zhc3pTTCR5uzTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477689; c=relaxed/simple;
	bh=i5OklqjSP+R1YVcJhtOo2SIi+ZSueo72HKECf2ZBRLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pgdm3HsnAYlAjVgoY40u5E+qnFzzqyAxt773G8FsU1HtnqcxK1c6CRU9NNjLmXDWHJ4gLrJKgh8TXi8Rf3NiQo15dMtPwNgwmDgLwAvnZrNtn0r+v2AGv4hNv8iPQX6VO4enxmoXZ5J8wL9A8i0Uv8KNotFLZGKDEnDoYssNN5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZbfqoxk; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZbfqoxk"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4a4cb36ae00so1829231b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477687; x=1792082487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9K/L8haYGxeT0BJtB30XPB0BeztMnjGjivjy3HCdb4=;
        b=RZbfqoxkckHrtWUTfk/bv2WT3sM8MesQKuw9afsb4h04fP+q67rMV1m53XDryuhSSR
         DmnBNFmlWrhDlDph3tr+98stb63jdit1ybXycaE25InEO7Cltk7ji2PrwUYRZSe/xEJn
         fJHxAqPEIIMQRS+0umCkWpWhCvu1YncOvrC5kIHaQv7QIAzAOCZN918PJpsentkO5LPH
         SL3hS8h0bgPbhEvR/r37bH3irJOxEDwD1g5FukuQ4B9RHsZw3xQ/hOGhh5AoUnn94p8J
         DtVIw/VlmpMtG8yK0lHxtqQdqqmGdn21/B83TPU3PgTlxdfpiLF7DagpRHQFkkLGeodJ
         n6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477687; x=1792082487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9K/L8haYGxeT0BJtB30XPB0BeztMnjGjivjy3HCdb4=;
        b=lOgTStitV6JLGp+jpTXyDx499UbyUQJiZs10nyI1mNoo6x65L3II6xhxUtqWSqkaCT
         M3XNMVjTBiqVpiZilTkoa6lpf35Ad+0Ukqg+kPhQSZrC1GvSFOwvv6NZJJBr7qQ16B3X
         AKE20oxCaE6vJG1N3TBit7IhoD8mj26/t+eP5t2zZxTy5niSPSOv6aNcSCzaKlzK1DPN
         1HrE8Lfz8L4TnbOTSvJCS6IzXnQUw5M/ZsvS7Z/5O9wkmR9NkZ1gqvrTFrj6kuMfwvbV
         W2sxpBbVrcUi+V0mTDHVP/NQ/YA96X1MlEXfIRN32EuDJmI04dYWbmAzmKQYWqjgNPIk
         t7hA==
X-Forwarded-Encrypted: i=1; AKwUvBxgEk5judgnDQS2uGBDzJHdp9cgJSjBUnHp68qBvhMO+x+pUw2ZMSf+67gZtwrxhWZBWEJ8S5Nv1MmmxcU=@vger.kernel.org
X-Gm-Message-State: AFuF++kpG6RYDfb0ZGkYBGh9DOPWSe760zjVHhq+8lXN/+5JLBhDsm6z
	QRfeHiSV+Vl7BJYdczZHez1xGGaQfvYynucevm4x1CjOL/wmBycV25jP
X-Gm-Gg: AYBFou17+iNjY9GflwxJfTdS44HNJ+6PwB3JkC57kMXwkzMiWamG33B2d9pTp6ulrVl
	0bJ3GKU9yxrTApi33YcVwQ/igQbE/a1ZpJUvqWt60UL4LAcjLIUryCbPjDChB7uM/Mn9/ntAXv4
	urgs8aIIpRNrPXKYOgs2ARvAnWCrVZ5nei3bjybu/kQ87oP/emzy7l344g+KRlbmebq1gwiM6yG
	JoRxrJuF61C2zf2HXx7sGSIup6qkGKoD9t7nVcyhkKmLNRBcmVBmImJcFU7FC1uY7DwdRMDEByN
	2f17UN6IIUC0if2bRV7URVSL2EBLIlvi9hpjGOM83Vdc1in9gOPYHSU9wMZZXcOaEUV7R5y/QGB
	K6ukFmEVwknChEdaM/CSYVCOxbl0YQcz8ywxS/WxJO6Bfeq4/l2qQkXdBt4z4hENnGJqlMrbPPs
	1TuGQF+vgRcGS4NDaKlNOxfuibe+faMbt7pSreRz5KA0TzipU/4hwSceyWTXD4YQpnZEpCfTTiV
	urrvoDxMCexHAKul1nulE0=
X-Received: by 2002:a05:6808:4feb:b0:4c3:ebb:63d6 with SMTP id 5614622812f47-4fc46c9c039mr7156335b6e.39.1791477686664;
        Thu, 08 Oct 2026 09:41:26 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc48e3de37sm6249298b6e.9.2026.10.08.09.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:41:26 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] tracepoint-update: check the section end before reading a string
Date: Thu,  8 Oct 2026 11:41:17 -0500
Message-Id: <20261008164117.3670267-2-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164117.3670267-1-lzsx618@gmail.com>
References: <20261008164117.3670267-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

for_each_shdr_str() evaluates strlen(str) before checking str < end, so
after the last string of the section it calls strlen() on the bytes just
past the section. Check the bound first.

Fixes: e30f8e61e251 ("tracing: Add a tracepoint verification check at build time")
Assisted-by: Claude:claude-opus-5-5 ASan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104200.1787946-2-lzsx618@gmail.com

 scripts/tracepoint-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 4c4b669011..ad5f691c15 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -74,7 +74,7 @@ static int add_string(const char *str, const char ***vals, int *count)
 #define for_each_shdr_str(len, ehdr, sec)				\
 	for (const char *str = (void *)(ehdr) + shdr_offset(sec),	\
 			*end = str + shdr_size(sec);			\
-	     len = strlen(str), str < end;				\
+	     str < end && (len = strlen(str), true);			\
 	     str += (len) + 1)
 
 
-- 
2.34.1

