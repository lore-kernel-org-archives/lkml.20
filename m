Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D365908C2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889684; cv=none; b=SWgEsjyFqWHmK7v75hArBxkyVxeXQ9NESdR9kG1Wxq9Io5UN1hSFK/vQ3FR4KxEWF+L98IDglA3aKzYvvyevtuLRMGEHph5N52xh3KGnaOSvjr0gHW6ibATkVQKr5C1nHNllg+lE/hDh2huAYBAgWrs+Cbbx09JZKCu7jScaV7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889684; c=relaxed/simple;
	bh=rrY1owvxS07jbIpCbpLvTgnzot37t+bLysMBqFgi+Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iISP+ry0cm0Qy2VhXDzeajTh3mb2JX6NNsDQuclezpSegZu94ZpL7PQ164rKcjRF6+uf005z9d4/d0a+fHt/ufh8pjlpI7rhMdj4Y80ffRHXqYwHUpgAMbCw746RlTKPM3fy1Eon5ZnTQ3VI4dhyioAGK095q7x56cfVQW0BLlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UO4I9B5t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kyrKMfX7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UO4I9B5t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kyrKMfX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
	b=UO4I9B5tlKxToykYacgxHc84assgEASwmEMlJkbY5t4eT1hXAecsUsNPM+uip6THj1PtVh
	4xu8CQzcd1+ZgQ7LLxslwxtrJgkhpBgUj1Xe2AI4FsmmfddqcQG5VvRsho/ilPMydEX7fh
	4iLjJ0gHg5t3oINib/wmbSkNCCl1IBc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-0CjJ8J1-Mr2vxA-3GrR12Q-1; Tue, 08 Sep 2026 13:47:57 -0400
X-MC-Unique: 0CjJ8J1-Mr2vxA-3GrR12Q-1
X-Mimecast-MFC-AGG-ID: 0CjJ8J1-Mr2vxA-3GrR12Q_1788889677
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93915f50a5cso1163958985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889677; x=1789494477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
        b=kyrKMfX75qHaeOvFn9p5aLnKw0A1NO5ezUFPqJhn6GcnSlAr61yQfYVLuEMh/+Gk+d
         KUdbtdFWtxmhB32x1PG9l5Air+7vylk+++e6VgBOGk1lDAkz0EyZzqEA5YQBmEXSL4xH
         F3r4uuyKkuAsLeE8Y2bBa7gYqb2gRcbqA6IsuCyNIs03StfH8/quTZSRiTSYXs1Nv4AL
         jI4avwZ973o1ps2TxFCYO1LeukSu/ZA0WJuXfMjwRDLkRIw3szCOJqHYKiwe9hdvjSW9
         7O1bjzZRJARtzCye6bXHv9W2V7N58mslb0f/oMz6cAm9kGVkkJfpo0g/MdFOzWEdfpOS
         5OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889677; x=1789494477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
        b=tWLYu6Y+xFRva3k4HmilOZJrSn4r4jE7uJO0M3+dGtYze4hTMAqV5GOcLcbO9+XoNy
         NDahq38Pz3ATrk+ou27IaBYk4FolQo4fMwhyMGrYCRzk8/y9b1YtPTxJC/5L7SGi7SAV
         RBNMy9ABYoF1xK8kSO0jD9rTtDbgJoQvXUtpk+3Y5lbudW5LGkULyFX5LEFX4DZtFVOX
         Rx5gmy2RLvZ9TKi1iEyJEmpBaSNdbWvClpdePKUxRFuTAhngit02coIn+FnxXZCRgpGR
         PmsDEYOvwJy8M88d6ZBkT0X1497GXL2+ooQQSx+SKcpGWCdENVr9s4CLhH6/J6a7GbNZ
         r3LA==
X-Forwarded-Encrypted: i=1; AKwUvBwJNn4TjiHqrFyUWTth728omrErij3kPsX0krNwHxNoWaJzsGapXf/oQNVmQW+blpux2U2WvrDzcxakfl4=@vger.kernel.org
X-Gm-Message-State: AFuF++n8ogaHvW2eBFqrbIfMmYQ8xZU+cTZSbm9IcoqevH01PM8ASdPW
	d8XxKHZ9beYNAz+QbSWnJr3mjkOCJkYvo3kUkWAd+YepY3hOLRHSL2usuWBjPABESI40cehBVlZ
	6VZO6skE2rjnNnItQhUsvW+LPl/x6W+guecn6tuPxkMjjoOKjP5iEuzR7zs/NHtSpOw==
X-Gm-Gg: AYBFou1p7cUUBlGo43d3NviAOz+z48yua5Pl2A7ROmxMngZyK3GX1Y1cNmgHJ+smZw+
	vgaxosPRcpuAysqy95gLL+GPuGvOITpWFpos1pOGINlLrJUxD6g55i7c75jRLJdv1Z7fUsoi+cN
	rdc/iMCN+fP6P9DlBZsDexTthuvB1wsDmu3um9JRLEBnJIB6HRgXmR5Y9JnYY/yaKCFMaIh9pXd
	hVjmr3J23E5tIct78tfaDb/EaAKatJP+oDDLYbtfwyE9GRdhFOu+mm568fA1MLO9EXPi2ApJzPn
	N6IA+Z650mo0e7a/0jCteY2+d5ul0IzG7i7NFaRQ7EzsMQePWfcLTd2TAoeGKTt5Yog9Q5AeMaZ
	kigmyLVfwZzcLMhKRBh7wUc7vTo9qdfzQ+4W2dAw=
X-Received: by 2002:a05:620a:46a5:b0:939:72cb:baeb with SMTP id af79cd13be357-93972cbbcabmr2833250185a.34.1788889672099;
        Tue, 08 Sep 2026 10:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:46a5:b0:939:72cb:baeb with SMTP id af79cd13be357-93972cbbcabmr2833244485a.34.1788889671455;
        Tue, 08 Sep 2026 10:47:51 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:21 -0400
Subject: [PATCH 4/4] clk: renesas: convert drivers over to use
 subsys_platform_driver()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=rrY1owvxS07jbIpCbpLvTgnzot37t+bLysMBqFgi+Qo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNl/XMezhn1zYsGtX80ei091LkxnfKvOcIY9mvH5O
 auzVZ6eHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkRjAjw8w1per1JTesE1OS
 lj27piPfMPvGTsNPXX8nB0r//p46/yXD/4RZf9ZskF6m2PKfMWbh093KwmY9CS78O+6I73h+enE
 TMysA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in the drivers and convert them over to use
subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/clk/renesas/r9a06g032-clocks.c | 8 +-------
 drivers/clk/renesas/renesas-cpg-mssr.c | 7 +------
 drivers/clk/renesas/rzg2l-cpg.c        | 7 +------
 drivers/clk/renesas/rzv2h-cpg.c        | 7 +------
 4 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1da25e4fb4d7..3df3f2b2c6de 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1419,10 +1419,4 @@ static struct platform_driver r9a06g032_clock_driver = {
 	},
 };
 
-static int __init r9a06g032_clocks_init(void)
-{
-	return platform_driver_probe(&r9a06g032_clock_driver,
-			r9a06g032_clocks_probe);
-}
-
-subsys_initcall(r9a06g032_clocks_init);
+subsys_platform_driver_probe(r9a06g032_clock_driver, r9a06g032_clocks_probe);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 80f4403ea2ba..87b555e38980 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1428,12 +1428,7 @@ static struct platform_driver cpg_mssr_driver = {
 	},
 };
 
-static int __init cpg_mssr_init(void)
-{
-	return platform_driver_probe(&cpg_mssr_driver, cpg_mssr_probe);
-}
-
-subsys_initcall(cpg_mssr_init);
+subsys_platform_driver_probe(cpg_mssr_driver, cpg_mssr_probe);
 
 void __init mssr_mod_nullify(struct mssr_mod_clk *mod_clks,
 			     unsigned int num_mod_clks,
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7f8decef92fd..f6293c968bcf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2758,11 +2758,6 @@ static struct platform_driver rzg2l_cpg_driver = {
 	},
 };
 
-static int __init rzg2l_cpg_init(void)
-{
-	return platform_driver_probe(&rzg2l_cpg_driver, rzg2l_cpg_probe);
-}
-
-subsys_initcall(rzg2l_cpg_init);
+subsys_platform_driver_probe(rzg2l_cpg_driver, rzg2l_cpg_probe);
 
 MODULE_DESCRIPTION("Renesas RZ/G2L CPG Driver");
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 63f13fe4e4b0..7ce94680c79a 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1643,11 +1643,6 @@ static struct platform_driver rzv2h_cpg_driver = {
 	},
 };
 
-static int __init rzv2h_cpg_init(void)
-{
-	return platform_driver_probe(&rzv2h_cpg_driver, rzv2h_cpg_probe);
-}
-
-subsys_initcall(rzv2h_cpg_init);
+subsys_platform_driver_probe(rzv2h_cpg_driver, rzv2h_cpg_probe);
 
 MODULE_DESCRIPTION("Renesas RZ/V2H CPG Driver");

-- 
2.55.0

