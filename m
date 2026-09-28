Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112F235E1CE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570448; cv=none; b=Jr330gxwgpSlFgShcKP14lEbn4RM0Ci3SN3wVcsZBvv0OVp+aSXlOvtheELe5rTJsCWfFhqlleql0acBQ/LdGSUDpa/dLNulCX9CzX7Ds1CI3SyUOISgjImPjz5gzmSV5Rf3NirPBiYSprzVSQZ38XFjXJQMUCSsqCrzmiKOSd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570448; c=relaxed/simple;
	bh=edSqkUf/Jp56J9Vg7c+aqfiXzucyWX6M92AvRsKUe34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b4Xeen7Gn0LCoUcAtZTap7NQdWygqZCje63uIbMvM2K2qORjcYepXPNfjf8p0m7k00tRq+VvKnNAVviKyazYJFRzcxthN2hvDjLlPcGXGg+zHzhiG/bLDuqh7fyI7R6KXn2eZlexle49IaZzEAspUMhtxDD+V3Ojdoo5jQqGXbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osCBDpcw; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osCBDpcw"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3425f2b24a4so1066658eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570446; x=1791175246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81pB+7IxOj1JIFRbnFGuG+Ebf120vc1g1oVisMJhAcQ=;
        b=osCBDpcwpPS1+t122pBTXVxM3gQ96F5GJA+qAvuN87b9tf1oFYyiMySCs00k9kJ7TW
         oH3Ar3oN8tLWbTONjCsZGLdSONbuXGFlbd7R2XPL7HPt/pHiXMBsi7MoeFGRrfkZO8Pt
         8P8orzXTXatf3Ja6zL9kMU0n5IBsDUe1NJSnuUEBP1DM5h/3OcMiCoOdWLSM9UeaWCxe
         Jv/pYObm8C0CDDEtV+hvbYEx67IUsIzKjWKvGg/Y9++tMRGC2fZmvzgAAnE7PNkjLFbI
         H4sRka2Nlkf0GVRrvTpmgQRjQyBKiKyxCCpE/MLJrOPF2w2d17EPtElQF7lbWbJiQTjH
         K70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570446; x=1791175246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81pB+7IxOj1JIFRbnFGuG+Ebf120vc1g1oVisMJhAcQ=;
        b=My3BLoVe/w6bAWQoRT9pNV/WTfGZvqNdGkbFBkoZPdNhO8RYitj1mWdS17zpyMtV0G
         wnJms6TmarddYok4Zg4dKMHOHrP5zodIJKNs32/+6rqLy8/jb1fnu8/GzSJgiwEMxWEg
         mip4DKnd1QTJFAT2oGrerGdReW7TD1qHij7+cksgmn5Q9pAHDJ+geZaFEI8BywWyLuQk
         lAranRXTQg3CxMdcTFgcP8BXk56xMyWMODHr7Dc2/UlqFeO/dGvmjYT3CvLtK02FXfLd
         2Y6GDBfDwQNZXdFkU1CgczC2TVreztDfads0M5JiyHp38378z+QHL6L7dzwhvcflBjvL
         OWsg==
X-Forwarded-Encrypted: i=1; AKwUvBw4SSldKVS10s7153sPwvgvypuvl2dpHrm8pVSgE3oJek8E35zyO1zqU8XPjp09JVV6qUnwyvB+2ec6NjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZMu28w2tgf+c1aZxZ9FSLASjuTRpVQb++GHPYP9CdWVCM57XF
	KlIvxBKtQhe2CGlhUj8DRwuLGinhtObYEVsKJ6MxvN99V9rtlrPXZ85/
X-Gm-Gg: AYBFou1YNVK91cbLcA/sarluttfcoXSHhj5Ln/D57GgODd4TtZ6SI8WP5TLCH2jsaQ+
	PwhZtYu/k7UtIsNVd2su7inzBQNkljGqeohuKU48YyW0pzCZ1gDpWkeI3ZdYvv4QbaTI1Kf5o5e
	h+VfGFN5Tgg3RAP5b7Kp5InDvzNlV+3JRoSffUeTYcLQ5aQ/Rt/4wgSGoka2G0l2pbJ/luDd4eK
	gCPEoxlwe+o/2o56EPSnX9pipvDGl0xCdMpHmdFlTJOaOmjOIJxA6M0vRtiKW2xL7g1fqoHWVpG
	yDQTX2b73y0lxO4pR+Ffwa1XKcrhTe08JXxlfLJVPAMYDiNb1zrCdq6Hh3e9+eR8AJD1+D6Nqpx
	JUhcutdXrGuugECXrcFMPDmimJqWNzuJVBwvgCaGlqDbJuuGAAfkVKrbxbmjw6uq/v1oixBsQle
	DPmfhWimgaXJH7aDczsyou5Btudgg3ydGd2MS+j4VXmKRTRLUO+rPr+0t7Mt67Dab/Egbvz521k
	+9nBYwkDyz1xX61veV3QIPGPilOGe2zQeA1zJ+vHYCRZK4qHfHFa+03ylxuN+6b9ZVK9J6z
X-Received: by 2002:a05:7301:53c5:b0:347:49d2:db76 with SMTP id 5a478bee46e88-34749d2dbcemr2199372eec.7.1790570445994;
        Sun, 27 Sep 2026 21:40:45 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm24529067eec.19.2026.09.27.21.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:40:45 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v8 2/2] tc: pie: print avg_dq_rate in human-readable format
Date: Mon, 28 Sep 2026 10:10:20 +0530
Message-Id: <20260928044020.8304-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928044020.8304-1-hemendranaik@gmail.com>
References: <20260928044020.8304-1-hemendranaik@gmail.com>
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

