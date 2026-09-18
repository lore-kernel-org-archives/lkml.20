Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEDE4570FD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727869; cv=none; b=VXUhNNu1ITDK4rHknbJKlGW0z5kSsKEWQidFOuggId7nSOFL7wHRsj7EVjDgSN536p/3ja+EMq3lDCLLXslWlngZHil2rY/Bajs5xg8GGPf9tU3MiKUvA51R066xEkcAFeKESHNnSkBGaC1kvFzUw0KVjCZog/fy6/TQYCtsmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727869; c=relaxed/simple;
	bh=9WXolKQnl4nR09tJ2zTfxPUGVKX126nWlQoWsMsa6sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoWtlkqQrnTpA+Hzd+OeAHKgAATVIVOU63JGTecJUbtQ1F1GNfagvJYt5TuFHpncbLSUk1jmgIQaO8WJj2nyLHryhtiDM0hZLYM5t8+w8+Rgxqrt/FhG6wjsnNYlqfWgwAvHSbY1IbdPZr6fzq8FyZklR7QdVnAyHkaQGaFm7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlFxI6IU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlFxI6IU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso4619875ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789727867; x=1790332667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7lp6VfC/CWEJQth+JIZbySidJqOjfJTVvIQb76h45k=;
        b=BlFxI6IUFqjgbGbM5aTri0shdMdpOwEIzF/Xfuwq6kALxoUPCv0hqa7wrzUhMOStsU
         fG3EPchKkQyGr3JFSYbiQXpV+w9L++Z/+lX+waY1UYGsbY2MBDoIgvKXMICVjOPcaMKV
         grGp78+gQ/zh9yfpmAWO+GvEOS0NMIsSnuw5yyULEZnD2GkAFITWxtO3kTtmYoUEGqwv
         YNZgNEyBEWH8pLa++/J5VjUfC/G88msx+36OhPRpD9RkoRxYy8ETNqisrf36EgWf+4y5
         LRmFP2td+Ff2AdNI0F+e5BqnGmvB9PPPKt+oBYlXlvapkssxlwZ83QNN5vExsr/kvZkI
         d/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727867; x=1790332667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7lp6VfC/CWEJQth+JIZbySidJqOjfJTVvIQb76h45k=;
        b=ov5Bz3SRDjRdprljKach5KNXQKR1/ugd8Uq+akCejf1vNRJvQS3CPWcYb32vuQ0cRB
         +QFo1GOGF2Kqq5TrwglNa7n5R8zjL4j42NYs3c6Q7nKz16beUX+WcaKEEObaVUPMaoXj
         lsY+NsKRhzTo5hvhcJwhiNxwcKf4Qgi6Bv0S10bXJ6TgpABkXsD+xjgL9ae2BEYUphvq
         /UWy5LaIH1o1yp8wHO0OtZXuRmdfdoHKqv/A24wkrImEV6ieL6lD+sJbbgAAd9+wtKNw
         s3U/Qx1py61e2aUJ/I5dtS+D3iG/5zrYY7BbkceV8Md+j0An0Y+QyniA2EfWmic/bgmn
         KK/Q==
X-Gm-Message-State: AFuF++kZ/HEIAnfVqsNwba5eiQXwzO9cOjQWx3VfUYRBcTfkzI8tDJJy
	JVMDuqlvNcxeieg6FwfKn2D1pJqZAsXNfevkSq4Tnj3b7ST0Ze86E5PK
X-Gm-Gg: AYBFou2ePTy23qPvCZQQ0kDzecXCECZrD9psaoII/RFozO5Hz1FZPu43B7Sk0LBArzP
	3h091ogyRyvqlIaWETt1+8smytPo2pInVreSbqVRDPQ+rHRPsJj6+9bRj8c+dCjLpthHNNknz1W
	JFEMeP2BxoXzVP/ATUOgTY9n41xPzEqJ0cnzh05CdPuM1QArJxlICWz8woEPHaJJi8PH+p2ofTQ
	TKR8cZ3k+XmsDTALEewGYKng9r/oIPf0drmAmdMnFCQ2SOtrtQCfYpaxipu7LT5AlZrG443aXQZ
	kXJrUBBalah0wz6GtSzyR0N87rAbhotLc450zZ0vt43Lpgc68/jPG2lDfG5j7WFTMp/tKkbRPdF
	NJDd5mLC7cfMpIJ/Kz+s26uYc6r65Z+pBUYH8cMgwuUFr4qdijuHaAhLRr57QVFgPXVcv2t/J7n
	ngI/AE9YFCrOOicdRL0IsbIL93Yki34Yy6G+S49Lj5sOiUp8ymCopIsEcrK6k2TNBg3vbw4Nh38
	2JQ03/apAzJXb0loC7AXEqE0PcoQ7GFAwDG4WHLdDlLuJyWChVXaF4qykwgcOOr/qG0augRnPqd
	t6YUqynFpfasfoBX4woe6pc7KqlEzzDoDoj/1LbgOjkdrxFLNBTYVagb7Wf5AXY=
X-Received: by 2002:a17:902:c40e:b0:2db:331b:e187 with SMTP id d9443c01a7336-2ddb1add604mr47844355ad.8.1789727866959;
        Fri, 18 Sep 2026 03:37:46 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb760dd35sm5749815ad.80.2026.09.18.03.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:37:46 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-kernel@vger.kernel.org,
	hch@infradead.org,
	djwong@kernel.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	ansgar.loesser@kom.tu-darmstadt.de,
	Matthias Goergens <matthias.goergens@gmail.com>
Subject: [PATCH v4 1/2] dax: return the comparison error from dax_dedupe_file_range_compare()
Date: Fri, 18 Sep 2026 18:37:37 +0800
Message-ID: <37be2d6f07799df3da33971e172681c3f78ac0e3.1789653814.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789653814.git.matthias.goergens@gmail.com>
References: <aoQcvGw4UmkMKmUz@infradead.org> <cover.1789653814.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dax_dedupe_file_range_compare() returns ret, the positive result of the
last iomap_iter() call, when dax_range_compare_iter() fails. The caller
treats any non-zero return as the result of the range preparation, and
xfs_file_remap_range() returns it as the remap result, so a failed
comparison on a DAX file reports success with a small positive length
instead of the error.

Return the error itself.

Fixes: 0e79e3736d54 ("fsdax: dedupe: iter two files at the same time")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 1fbba0d21c13d..de11bbbb6a384 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -2264,7 +2264,7 @@ int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
 		status = dax_range_compare_iter(&src_iter, &dst_iter,
 				min(src_iter.len, dst_iter.len), same);
 		if (status < 0)
-			return ret;
+			return status;
 		src_iter.status = dst_iter.status = status;
 	}
 	return ret;
-- 
2.55.0

