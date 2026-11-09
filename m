Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208718;
	b=fXbo7vJDNW4vtCHvgNRKBb925TrSErGfM9oYSBbqoT/s+J8E4QzZAHkEDDinEi+lT/vJ
	 Hm659xdC+y2HVE4jyktrnYxZSpbTNNBb7H2X9kKf7E9UOnUS+2mwZmJj8kjLqmYjnH/5n
	 6Ez7zJzUQGsZ6cUWLrO8k0n76wBbUkF/RHlOvrbBbKmq72LnNoGdSxVgc2smoDwwdYdjt
	 RpErsO+dEBBdwo/rg9ZJ2WgUMaIolVAaw/7JhnPwy6bPsaL0W8+YICfJW6Qe75zjdOU37
	 hJSMBRrJwnrabD5VHEcV+cR0N1SmkKPSh7JcEe1uRhLqklM6pbRjvCmP+qe7hxPP4lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=81pB+7IxOj1JIFRbnFGuG+Ebf120vc1g1oVisMJhAcQ=;
	b=36+loqVhR9NbKRn/zqGAR18tBNmgDQqls42fltytp+k72t/PZGHjogdQmBvGi9YFzQcW
	 h2XABu5fWXDF+bSqRw1+WK89xC+IlUpwTH2ynpSfo07C9eCKQ8VXsMf73ouRpjOKp0tqN
	 mnrB9CYio4EhwaP+S0DjbE+ejrbYDNVAiiD0qg8nnsQSbrw/WQSJUZm9IiXU+Wh6fP0NX
	 HZka43XCt1NvJcuTo+Ha6Tx5dX8pbj0PS2oynz79Eu/SRlvLOjX1GbZF8xwlz7KIpYZC/
	 CD+GwKpUCNJyLux6RZ2shvoLTrPpaOtS1NSaAz7WYO3Yivr1FROa/lIMv4xrSiGdhDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP68jvnT;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DEB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP68jvnT
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37071c0f42aso1122842eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208717; x=1794813517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81pB+7IxOj1JIFRbnFGuG+Ebf120vc1g1oVisMJhAcQ=;
        b=aP68jvnTbpZapy6Yzp+j0XyxUT7J1SOhBVWtMR95VnYqQPS5Ve2hHUeJATDAC327Ux
         j+JDR1vrVtkmXc9+AQrzIwJr/fTR54c/URDXPe1dANdXYQ+8Plxeo3pm2DtQm6lfXMou
         hnsIJncFZOosC1L3nPs7pSRaYJwL+5BcKnUXQuwTzW019LkUzXRnT6eJjVTxkbGKkykL
         OeNWRzW+yVU+oR8MQf4Dz2b3+AJnsEzTGlVbGS0BK+6aAE3fm73zMcN8Bz5NfNZQdI55
         Ik3OattFwra8KE0SgUHXhTpVgNHHlASe8EeZwOtvl7Y/TNrdlHqahd+bnZ6bL0SqLRZZ
         OYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208717; x=1794813517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81pB+7IxOj1JIFRbnFGuG+Ebf120vc1g1oVisMJhAcQ=;
        b=XrTBG/n8qcptm3m1QQgzTHTchbe22jbtNrfQdPMwL0rJ5GKj/ipMh3fw2Jr+jwNN2W
         d7l5sncf3c67aYmsbmz0GzcGhE4+T5QhirB6GcLuRbimLTVeSV+qy1b7nfyGckTMUNCK
         ENGAjHSlqTYEkpfV9HAUH8/ZgUN+1ehawJGThF8FKR1v4XQFKDRnbT644qlNtUTnFxZ5
         2qnd1uq6tEeDwAt8TUIeTYSoAJufW+W9hTHsyBX6ND65Dmcl8YIRpTN1lmJyBYXzojDx
         DivJPISRS0l6PP9I86Q3msa9c4942kbvy/eIqBjeYLUdyCnRPJzAxNFCy6u9uZ8K5lUK
         r1SQ==
X-Forwarded-Encrypted: i=1; AL+hErF7NdyFK3ZmA/Cr8PZ/mK6kN+vTb0/ud1k8Zb2+kwdffb89mPaz19z2EjZ4NWeNYvVbBChVAXKtzIY4wLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dR+R+J/mL2pLN1wSirCRuGabq3QymzgNeC+ekyDhEbBv4n8mJ
	P0vSLM7RL3hBQUgaNRQiGyu7bti9+BVGOjBTD0UlXvcKLYnatJ+weU3IeAEOLPBP5F8=
X-Gm-Gg: AYBFou3xXG4piSY+grsl/so/oJFK2BUk0Ov7WGOEwzeitfjgXhb1XEVChFuDp99i6EM
	fW7BJl79zYbHfsoqcL+AQIlC6OKPY5rC7yrLaawrR4+7mgKRExxdsoNxO7ilpW8nY+pREnFOzVZ
	oqzvhL/7j5eKpQZcCEp/wwzr9u7vLU0TdK+194Uub2aK6E3fyBD5Ubm2jDNw5huVelWQHmrAO6F
	O7jy/Skkp6spmbf8wsrzGsdrtScAn4RCrKnEQ2RkpJX72hc+fHTB669RShUxxw3B0ec2m3rm3Gg
	AO1ITnLV2PyjAz1QmeGypyQ0ksOSn/TqPATj5RynoYSZ5C4uaMMsklabGYXAhPdFvgvK/6FbtVh
	fmuRIBKY6TQQgTxeE3T+ZORIvaGyTUDVyrBtgBE22Z5Qm3+F79Na6VEWiBHHxVvGiiIl/YRGs5j
	Z1j6yRM96dBautfDUWqml3brldS/tfznK2TwI6unGgFpq/H+vTfLoEUp5D3WTg3P4vEV7h2imoa
	7caDkGPTNDxixQ3+XkZtf+qXzBV3ga/l1T0Pwfw3caKHK4uFo1ida6N1VO5Sk5h12+lmya8WuIT
	ibFPdKki7HmjRstNu0OHjyWiEUK7q6BbJom3YrLGfoJoaidHtG+s1s4wImhqT2mcSju0Z6p60DP
	uQAWtU5Ks7PrWOhHp+A+xcCmu/fQW
X-Received: by 2002:a05:693c:6219:b0:36a:3ac:b15 with SMTP id 5a478bee46e88-3725e53e215mr6020332eec.36.1794208717503;
        Sun, 08 Nov 2026 23:18:37 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12878306eec.21.2026.11.08.23.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:18:37 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v9 2/2] tc: pie: print avg_dq_rate in human-readable format
Date: Mon,  9 Nov 2026 12:47:48 +0530
Message-Id: <20261109071748.438946-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071748.438946-1-hemendranaik@gmail.com>
References: <20261109071748.438946-1-hemendranaik@gmail.com>
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

