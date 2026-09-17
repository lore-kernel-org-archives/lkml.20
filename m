Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178CE4F4034
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677840; cv=none; b=mg2/qd0cMtYjnldClEfh/MFEo2E6cm3KKq2va1b11i/tcHnfAI3FRnBv75FfdqiTTjdmsaNYBes2fZZ2yEzTPfEs+X6rnSMamBbwvM7h3dtqn55yw55gmzw5wq+BaeEP1Be6hSFltEXikjLboWYj1LA9Bq03LdJ1R5VYsqKap6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677840; c=relaxed/simple;
	bh=3sf9YuBAZ2zv9t1g2dgGBjeM9ZfIN0Yd/tz3mo8MbxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXcFZTikaMkTEO86hFF4ju0KeMzk5uIYNm86++QtUftuQip/TEU2NERIiiPY0xoTBvQYH9xmk7ADTKv8BcBdTybFYm7VoHAPc4v8E3xrnQcPBfGn0wrLzp4fbzvWqsqJ+fXvRxaEsn3BoxA3/6IfISxUbpZxjB3tP1Tdr9zW6sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryFXBWcT; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryFXBWcT"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so491125ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789677829; x=1790282629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ia2nV/eyt+q8ysG7SMAINIwAk3HmajymljLtHeWJQM=;
        b=ryFXBWcTYawFB3BGv/pfWTAIDdTh29wQg6jfqCyPuJV0AVPE754oH8c5KPuT2lcB2u
         WvDdv0z11q4lrB9Ul0zcyv6HzN0cMrGVOY+R48cUvjatKoAZhHtJOA3lDpRBZrTjer3W
         ZgimzYwE9sEZw07NDOq/NkrnN/s/Vbb/9zOmHfllM8/JqklzbYog+cDrKhEqbcmZXumX
         fjwn+aNMNiN8vBEBfU5zP0UX+Uv81A8XA+onB6AHk/DFhlUiuGfWWJmwRQUCilZBFl02
         6LLfxI0FMgrGoc0pcJ3FL/i2hDprFh3DIXwBRwbegVujtTWym8/kltGrIthkFl28bVqt
         q7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677829; x=1790282629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ia2nV/eyt+q8ysG7SMAINIwAk3HmajymljLtHeWJQM=;
        b=txmNwPtpoekWXkXn2zjpxt5GIu9m2VhavvJhSX+4d3ExFVXubSco/OLrRQo9TwwK3d
         QBtveL/69OSivhwp36iiN0PK4vuMRcowXikbHrypePnGHJbc+rvjuf5IW/SFX5yX2dPp
         MsGxOaZXbl+v8V3K6qrHEVHsmnfIjgIiTOBLhyQHM3r7OG77wO0Qn8Yp5Ey6pR7hrWmm
         ALGcrDBwcEu93yM+HROdT6fsUUWkDsZ7FDvGNurj3dlywC+KLNreuHU2cyzMN8j15qRa
         aoaXl1/sce6woET423tVfT4UgT5FWwX02PBcFMEhpOXe3nucSaj1a6E+k6fXqhEfVTEp
         wRlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpnFanIXMCRDzRzjI2Wy2Q4JXHfHZP0EcLh3Qy/cJCVJlvmCk5sYivNt3mI39uHku+W7LZ8fOWl8lomG4=@vger.kernel.org
X-Gm-Message-State: AFuF++nwhArQq3VQk4MMtK66hElTDVXkdqP/hR/JOzFNjsRhqsBohbDm
	ftxuyqJ78ucKdYhOc3tg4IqBv2bEOATa/DeTgJYmfLhxZLwz6CDcLFT7
X-Gm-Gg: AYBFou0G5K05wnAX/BUSfdvckS4Nlz8s1ivBelun2iTwua9w0FG/Fpbocf97o7sMpeI
	eUu2wuFBDk4+Sv+ve6z83n23H1ac84MIqCr2cqeYaoCPGFA+KHuh9pHM5ky1jmIKnzFI4vK676Y
	YgRBUdl/VxkbD+Jbk6vTxOySPkNMtRQlPl3uc1anUBW/IdrKUsb49W0KzBGyrM3ON0Sze7PDAdk
	h/SJqPYDU0eZXWQQDGMYKEh+YX83aBSOGjJSco1PQDdL1L8HwB1xVk80PLNOk5GVPLZ5MZcUHxU
	wskBrHSoZ+D5eIOb4rptViE625qt+JBuDtHyYYi9a2JbKvEcntqD88CPRtysu7wQX3hrWVD90vN
	ZwDweTr22iVC2dcK1261GUf9r7JgBPIcYrkbQ2TjXlJEdyJcjXZnm7D3bf26dyUSZtd+bpSZ+2X
	Z2NTGzi0GVi8pp4kR5IO22chk+SMbkP/Vu043tL2C0V1htbE/muZjQX40M1SQlYZ0dmTMZFn3pB
	s60HL4R6qeohSc5367ySOCCPuiS3ZIrdY/gdeJMK8sBtn2C7Kna+p5xEdJPRkzFVGvw7YnYY5c=
X-Received: by 2002:a17:903:2312:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2ddb1b899famr7318915ad.14.1789677829118;
        Thu, 17 Sep 2026 13:43:49 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:6248:69c:ea81:be26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c1943f4bcsm3620046eec.21.2026.09.17.13.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:43:48 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v6 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Fri, 18 Sep 2026 02:12:25 +0530
Message-Id: <20260917204225.275251-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917204225.275251-1-hemendranaik@gmail.com>
References: <20260917204225.275251-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments describing struct tc_pie_xstats do not match the values
exported by the kernel.

Update the delay field comment to microseconds (PSCHED_TICKS2NS() /
NSEC_PER_USEC). Update avg_dq_rate to bytes/second (avg_dq_rate *
PSCHED_TICKS_PER_SEC >> PIE_SCALE).

Documentation-only; no UAPI layout or runtime change. Touch
include/uapi/linux/pkt_sched.h only

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 9c0c9787f0c3..969fa30efae7 100644
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

