Received: from mail-dl2-f15.google.com (mail-dl2-f15.google.com [74.125.229.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461145505CC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111562; cv=none; b=THzfCJOj5LWZeBCoVXsgpqnKjNC2djIjzVcpbf8TloXdR3KBfSUCOIHfoDRlNvuylUGxzus5V1plX+3h3tTaX52pL/yQ7VwKXIXNPob3uZ5hKAMXRu+GX1EV+sgo7tk92WXuuxB/arHwAhi/nXalsrLH4g3eEDs4PBnUXFdKI5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111562; c=relaxed/simple;
	bh=edSqkUf/Jp56J9Vg7c+aqfiXzucyWX6M92AvRsKUe34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XfHWDwFTIrhJX9AoSvb+lmoDi3fHC79fSudfnS4BZqRbY5ZjHb/PDXdbnkEfouC+JeRhdUgYRpAIl1wwlm3UH6Y0OzONNJt8WHYxrrtjqWPBAqO/DHBE69UXY655VDmihvO8BiQ2DPcskrnwR6b2vRPJtv0+wHsPNqa2UQOUPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5r2OhKo; arc=none smtp.client-ip=74.125.229.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5r2OhKo"
Received: by mail-dl2-f15.google.com with SMTP id a92af1059eb24-144f9160b81so98182c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111532; x=1790716332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81pB+7IxOj1JIFRbnFGuG+Ebf120vc1g1oVisMJhAcQ=;
        b=Z5r2OhKoH2rzwFHmTAe2GsTvadG1fQs7fjETvvVPNSbJ8BiQznw2QS4t+hJi/7drwp
         MLM9mtIePDA7bWYiP7GnZhCAepR7mxqUHhh4S5pFVazpbzWp2ViSDHygGEeVxvGK7/iU
         EiIADIz0SUQR6AN0gsKlqIk+ZpWUSnQiDfmlU3n8yp6b6iRTnHufE/BGZdFAeH5IOtY0
         rIf+BsAbojFrcw6kYhvRIk9Kk3u9AHgDwKiToZbOsxjHfSbg6WUc36orDgyYz7Uznff9
         5oUunf3yg19ZsK4hYy6Lmnbl9oSNa4m2AyoDG714wU+IcZ2MWeTXllOrt1dVvIEqT16C
         bDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111532; x=1790716332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81pB+7IxOj1JIFRbnFGuG+Ebf120vc1g1oVisMJhAcQ=;
        b=0aqdeyKYaOMiNSTsde7X5KKXoO+1RE/0ek1P3YTYCO0Sq/90uS++5Z4a4cq39fdoVp
         HVFMcFmHKMFFMnD/QB/NeLUsMVBq8nnuzLqT82Ep6Im4uuGHjNnF4zyQTJUoZ0EhJhCG
         SWZeOzPeufutNCqiv5mPok2Lw0rv5vqa4JkY9F4GJ6yd3fDqKlOwaIJh/i9xOodJORlO
         JPefNBHJUKjex7TxEypWcIl2Dwcwk57b8vAMTuEtkF/UV6JNK2EVLSEWBx90yN/PLf4V
         9W1sU0RA2CEe++9w4u0i6GrucxSMW5NqnVCI3RMhr54+DNk8xsqlJEM7oDEaGzARcuD4
         t+4g==
X-Forwarded-Encrypted: i=1; AKwUvBzpWMXK5f3A9fjh4o9Cw7XwmsVOzTNs43mcbX7jCmP0LYRT0kzAIqWp1S3hBP25XObSMBWSPeGYZ8jgQs4=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ+UdAFoshqy9R79RrF17YVEyQsXf6Yp6DAyDUUHjCDqBimGQV
	vpzJFa4q3QoclvYbb9+oP8zAX7QQFkN7V5nl4qIfJrrwGsjftccHe4Qw
X-Gm-Gg: AYBFou1altuphUxWwx3JtD8cJ/OrhMvW4bBrbqXkynACEdsb7Gx+witTao6kuJdUzql
	bLFmSXlUhJzILR1xzbybNGwikwnB+4jfhlXMPOq/VKEGvMxnREE5AzrK792PTzUWbIwDAodoSKP
	lTiMHKhp/PI3bfOCo3N3nklqYW36lP7MhgnGcSf5fz37DMlFRzFqSUFZlS4QTdCc73TTlFp9pNU
	4C8f3UFnS+EJ62zXxKTpVG0AVCb/sZ986/zNreFKEuEhyKlrrPpccZrHtiUe3rRuaP3Up60Rkrw
	jS7Ug07jnstA4LzjrcSKCmpX77PKTO5XPgEP3j0FwDucYfnz615UcLG+sSU+BBbcUcc9RXpFT3E
	7T/BoZ4R+YPIHVG9NDRc7OGETgqNsLoKJ5RJuX3jK/c6UcwDhGRsh8AihUr0jZWw4+1sibsu27E
	rR49JF7yCJADlr5zOBLCbN+dA6TZLRwY/kEk+dMyxXy64Za9kG5K51Xn4ycc1ycN7H06QfOpYws
	YTqSF3/hK6SiVo0ej5y57kJJ3HHuXG1Wu7wni0N1BNXyR6WKaogRbW9sfRldAPOAI0HwRsLf1I=
X-Received: by 2002:a05:7301:3a86:b0:33e:5c4f:f46e with SMTP id 5a478bee46e88-33e8d8d2598mr486297eec.30.1790111531511;
        Tue, 22 Sep 2026 14:12:11 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm943147eec.4.2026.09.22.14.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:12:11 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v7 2/2] tc: pie: print avg_dq_rate in human-readable format
Date: Wed, 23 Sep 2026 02:41:39 +0530
Message-Id: <20260922211139.38570-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922211139.38570-1-hemendranaik@gmail.com>
References: <20260922211139.38570-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print avg_dq_rate using tc_print_rate() instead of displaying the
raw bytes/second value.

This converts the kernel-provided rate to a human-readable bits/second
string (for example, 10742Kbit), consistent with how other tc
schedulers display rate statistics.

Update the tc-pie(8) example to match the new output format.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 man/man8/tc-pie.8 | 2 +-
 tc/q_pie.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man/man8/tc-pie.8 b/man/man8/tc-pie.8
index 5a8c7820..ec0d4af2 100644
--- a/man/man8/tc-pie.8
+++ b/man/man8/tc-pie.8
@@ -115,7 +115,7 @@ is turned off.
    qdisc pie 8036: dev eth0 root refcnt 2 limit 1000p target 15.0ms tupdate 16.0ms alpha 2 beta 20
     Sent 63947420 bytes 42414 pkt (dropped 41, overlimits 0 requeues 0)
     backlog 271006b 179p requeues 0
-     prob 0.000092 delay 22200us avg_dq_rate 12145996
+     prob 0.000092 delay 22200us avg_dq_rate 10742Kbit
      pkts_in 41 overlimit 343 dropped 0 maxq 50 ecn_mark 0
 
  # tc qdisc add dev eth0 root pie limit 100 target 20ms tupdate 30ms ecn
diff --git a/tc/q_pie.c b/tc/q_pie.c
index 04c9aa61..97690d49 100644
--- a/tc/q_pie.c
+++ b/tc/q_pie.c
@@ -220,8 +220,8 @@ static int pie_print_xstats(const struct qdisc_util *qu, FILE *f,
 	print_string(PRINT_FP, NULL, " delay %s", sprint_time(st->delay, b1));
 
 	if (st->dq_rate_estimating)
-		print_uint(PRINT_ANY, "avg_dq_rate", " avg_dq_rate %u",
-			   st->avg_dq_rate);
+		tc_print_rate(PRINT_ANY, "avg_dq_rate", " avg_dq_rate %s",
+			      st->avg_dq_rate);
 
 	print_nl();
 	print_uint(PRINT_ANY, "pkts_in", "  pkts_in %u", st->packets_in);
-- 
2.34.1

