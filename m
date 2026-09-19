Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5137F74A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798416; cv=none; b=EWuspIkZtPUWl238tOD6vymxTUGs+Es8Gvo/pbZSimWD95GKKfGAihXdSJUHBLhZ9rRs7usWotd3a+QiLOP5wwDDJ8FK37Tqk7KgUB6HhhiLFBF2miwvQknQdVBjuTYQ68lHQZRwwlr+G8BATqYWsX0cDZyT8FPN+Xi7ARkvaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798416; c=relaxed/simple;
	bh=Qa5b3XVsoTWHxAknW1BfAlXBFihJbD+eYvUvkohTbFE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pj5ZV8/UZ0NDiJIDm62WuP1vfJ7rxgAusubeZA63pqjmBZHd0J3GFgMUDlKdhhHxHpffcAdja0psAe5SA55Csatd4ENF8PirsyAJqpSjdXMS0DPxYXJ2iwdYRPpPo9qoUyJEK8A46HaNyJCYyHpsT7eXHdZ5/wMboxRxdbw0pUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dii0N36D; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dii0N36D"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1252334a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789798415; x=1790403215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OEXG0DiHhzUIEAeTd7uNBMQiaOXbPFR+3PwuetpWl8=;
        b=Dii0N36D7kdqHMbKx3PZ/+VleKLobXypihvfw2giRWH5aj2X6IWihwnb84x6M6iTFV
         Um2N6USQGNgGM6P3qCU87sisfAwp3qpX++9DL2qGh/hkCWtqRHFc7hdo+tUSTLlL8MX2
         ZMv9c0FJdH7T/yw6yAU2ZhEKGd/LU1KScvA2vTwlatQoOEYpkZ9JURASc5QtcCkU/uJ2
         2X/2pOemmHxskg9gXtStjo/XlJ8erFOMyiQHasm/c9jP7aSgh9JTGv8eACQjsmSsjYvn
         xKrCZ7h4bnVQtOrPWYg35ilKFn+zz4Z5VeyCjgU0PsYov1HK1ISfiaV936ahHEmqPpqx
         4DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789798415; x=1790403215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OEXG0DiHhzUIEAeTd7uNBMQiaOXbPFR+3PwuetpWl8=;
        b=FdAhS/Yz4YEY2dPfFnwN2pSbXNR8yM2JVQLEGbfCSIhu2eX9DvMW/sUz+mGCuUCqyE
         ia+gpMJ2CGDhKSqD6zxz5Qed3CfQyvZ16xRrajkNBWIIsLWSrYlekW4HfyG5kXosLxhb
         GzsCVe3njztkDVYlXtnYOAtvXU/5ZtNZjU9a9fIqPk4blLR+aelYo888lyee8IqE5onr
         kca3PFkj0lnLza4YWeknl0wXCcv0dCN/rzYpNV9CbUPmus1qcvWVYTO2yQi8vIE1MfDk
         rQ3L+iMEAxiRESSjDi1anakCvhZ6XcjZluS9J/MJPzPW7Y3R1RW5fJkDtl/A1xELVDbf
         IqfQ==
X-Forwarded-Encrypted: i=1; AKwUvByizjAvu4TwQCH6olgSFty5+XibB5m6Oonx3id0P5iCmfr6vkeeEMpKckHuyvKTnI5TrDk9PYW2pej+45w=@vger.kernel.org
X-Gm-Message-State: AFuF++nth7OoeLe27hRl7XIlsUm0sSIUSAdkt/furbvLCcDW2qJfTmWO
	YQw5gsH6Q5ZUoh/xk+kSWMCgTf3ahMVNJTKV8YmBMfsB3FLdcvftX1GL
X-Gm-Gg: AYBFou0cxk6Guu5/N68/ruPWP2N7VPAJTccpWww4AuhYuHqyUp0RUBbUNEcqTNApEhR
	d4aMv6bsI2Ye94knBxsQLRQnkWtwO6gbbsvpm3dGezn/9WVaF0NnKqBAGv46xXsnDWT6Hq4TFKC
	wOHxfcMz7XogxqlnWhiJT1lY8b0O/ZzzOXiBhO3st2n63Ai46IRmRsANbbTSnPQ+nQaNBx1qEHf
	xnvAZj3AXZ1aExexqy0zpgLm9qhnQbXsjwNMl3QwCkgD5RHNlhLhviUWi09UY5Xbl/1fw7ayxo+
	RE3fWj3bcR4ym4MywqgPdhQS8H736gWj3WXvWytGCOpfuWlf9yNRH8qI0lTuQVJWTEIIMZ6FCif
	fACZaJ3DBJM+anX2U2D8sLp1QdunhT9UvXhLuo1fwBoGYWCA8J9X1+o0BXIjbmS3BWSFCuiXsd8
	xqBXy2YsWHrvgTNp6kLEWZBNVi7E2ekxeVQKlLemx41GuYQix3GSCjbkL4J4vq4xArli5g6vV+s
	ye2IwAKMQub+3x68MNkwUXU3maM2xAvfga41Yb5FY0EeVV3gy0l4p6rn3Swyxl7YU7ONBYpk+I/
	1HoQlI+s4A==
X-Received: by 2002:a05:6a20:7f83:b0:3dd:a006:7b31 with SMTP id adf61e73a8af0-3dda006e165mr2838794637.48.1789798414486;
        Fri, 18 Sep 2026 23:13:34 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm5781280c88.15.2026.09.18.23.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:13:34 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v6 3/3] tc: correct tc_pie_xstats field documentation
Date: Sat, 19 Sep 2026 11:42:54 +0530
Message-Id: <20260919061254.39678-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919061254.39678-1-hemendranaik@gmail.com>
References: <20260919061254.39678-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the comments describing the delay and avg_dq_rate fields in
struct tc_pie_xstats to match the values exported by the kernel.

Update the documented units for delay from milliseconds to
microseconds, and for avg_dq_rate from bits/pie_time to
bytes/second.

These are documentation-only changes and do not affect the UAPI or
runtime behavior.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index b03ee5f7..e1e686ac 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -920,9 +920,9 @@ enum {
 
 struct tc_pie_xstats {
 	__u64 prob;			/* current probability */
-	__u32 delay;			/* current delay in ms */
+	__u32 delay;			/* current delay in microseconds */
 	__u32 avg_dq_rate;		/* current average dq_rate in
-					 * bits/pie_time
+					 * bytes/second
 					 */
 	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
 	__u32 packets_in;		/* total number of packets enqueued */
-- 
2.34.1

