Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364736;
	b=k3K4T7/x8rRuvjS0zbpV5NV1y4AL7OSDD14OE5Dbig/gsnIcM+cVh6Oo/ZAgokT5obGo
	 IodDfj3oc9kV3GHTbFKPdWV0V5ii6endqelfIKXMwrwjE5SMa3LN8jrd2A2WSFj+ZlZF3
	 8ajCOrndMHHeBz8kM8wIj6yyq1qTuEb51Mi+0ocPJBkVZwF/+mFi9VadRWZOPChfviS3N
	 h3+lxLE7YWv4ax8cAvQMVnLY3e85auUtm6ws61eEtkEEX10qwnYHpdDIiJlxSFNHXqdrv
	 rYUXEQ1bF60E5eG+APLLbE1q8WSKPMNreJ/As5RVECcoKCoZeF8PaQonZXykG9uRJTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jlQZUr+lfyU+BwYrVoDCooNI8opcaovsjvfRljhTeI8=;
	b=t3SKjk7XG1yNVzIvn+vmMRLNkxdrhxAXRWrMJafXdo7BxVHwztgJzWoE3ca3KzykhKH1
	 U0Y40WWz4XNnRSZ5q/QN+vv/IoFHhtVmO6hQgaCkncu7BZOxtvSJW+HDXpmq8ANvQiB/c
	 zl8M24pAaNWis1Abf+KoSrxPZcBr2hw5Zw4cZ3EYQcOvltHXneViXOG4iFthJa3GKVXUH
	 6V1BGpm8Cmm8Lek+gniDcuyM8iXWHFSpeT8HIyb91rd3yVt32UqeemQkAuoZIWP+3yYoI
	 GNYSk7dTROdEXsA9uRQCsi7yyfNYd5m7T1SCL32sOjanW5W3B4D/OyulvymwnbFHtWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpTH3AXF;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422360A2601
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2422360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpTH3AXF
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214af2076so4653415e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364734; x=1793969534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlQZUr+lfyU+BwYrVoDCooNI8opcaovsjvfRljhTeI8=;
        b=BpTH3AXFoX7o71pKSUHHr5CT6lRB8RlH/mu9zk4FATSimhehH7FmBXZwbZt2mzdMek
         8AhDCzUJz5BmqcwuvC4iloh2iyilwFjWY7/cYvwPjf6H+DX1mDG2KzbQAMiym3/cy+2L
         +d3LprCQO4gb+Zxo5c698muoVAZJphtCnVA/EEU0Wr2F89ejN2zOxi8lcccjQbWiivlO
         bjjSlEGCbQRJ6scqROw5AYv+0oQ8mVQN+ROm7LgXlruPdXrz+mnWX+84ZR7IESOs7lM+
         AmzsUCDRS2tRhjAbfSMb21VKjJs921ynsmJTVwaV58e+s5PEvplrlmdWAwqgcHsajFTK
         o4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364734; x=1793969534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jlQZUr+lfyU+BwYrVoDCooNI8opcaovsjvfRljhTeI8=;
        b=v7v8p52JDxvc50dBjjszqJZtvPfEyTQ4oHZyPuD1VTdHOW94+xWAoEICGxeSZ3T304
         iWNt/ap7hBbsXe/++z5EqyvmWIOh2jutVOG6PNXsByOULzS3w6hTpOWzZ7RjCvjUYDWC
         jDuKpMHNAWp4virZuVLLJTYShADwLliWW1oLb1MzeSSERM9jKxDr6pFIrP2X9MxSE8c4
         FnLq3vDvz85PJXV9+NLb+n921rPO8HOE6EZhbZRvtV4/R0LQ/zEF/NHWBti15u4OmRK3
         J6bBS4GIOnJlTK0JzskCHT3bkhiyyaY/ZU72sHfkUjGCuFLvIo9PTWMbZBk/9cehR51A
         bIFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtQAKfx/ZBM19vL86FAkHh4Lrs1mc/aEdxN4e0kTLisfN211kIgb5RgoEjaqInRrr85is+7F5tCjx8CM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Tf1+LDA/azLJ9sylh+qTokxtD5XeG2haAcxEdUQbD3o4flR1
	v2+f5ItYxbqWQ4RE5V9Rqdw1sgNhIYX3JSSeMviw3PE/0vgJHTwxAvJ+
X-Gm-Gg: AYBFou3qGGNRFHdR40wY+3XCpUQlJIIQAut9fPFhWtvAprLM5C3g6OrsX+cfbucv/7A
	nGh4Z6XMeUYYkKXG4HBUCcPPl8ZCin3chxownRF7YKWk7suqfyG4l4rGs+KAD6I/e8bTfBs3aDk
	p0cqGOjbVlwKLMxqglwTpoN6fXe5Gw4XAIhDRkPGpqubZq7h4sAtCVvqT9Ui4C/iI0xvMr9zNHc
	J8MucgavOxr9CJfSYaRfgyETgICZ6a8GhcRbuKhgl8SXaJXM8t9clEDkEong90zOfSMba51HYyQ
	oGbkdAR87Nf9mfh0FLyuHS4BLpYXmkQkPaFlMFqmYGUuarFqziUxXTEGR9HmWlrUGDlt2MAdVPa
	Hf2SuKpjv4Huq5ONn6ngl1iDzu6SzKCdulOdYZbnMappmI+Or77E54IZbQoclbP40UdKkISI/7Z
	H1QU6MAj2yJiRuOTwhLJAPUMzhUBxjnrcOINKeVfxN/xWIWGrTrkeDVT5qtYsHbX1Fr4Gkhi9ry
	mwUKm7b9bai0p64LxG6KJzZnj6wC0+YusS3BQ+0K8LcD+ZZ91uQc0IV72lcsqx62uqSmhcxbh6h
	gihcXbADFSbMrAsKtj5npqUoba9iiQ9x93vxQuseyOfC/gtOnQuHgGzDBn+BsGmiVsc+qfJ+So1
	46MHE67GESDpV8K7aAbLXnSuHdG/HZG/j68l8AF3UiCZ5/fv6n5tyL69501y7DXXfrpNxsLB0em
	zveQD+fzO8kWsGq2xgHcQkiiiI9MP/VtFpUPGe8muPI9eA3JK5zf8asaBM+Q==
X-Received: by 2002:a05:600c:a30a:b0:4ac:b0b2:fa12 with SMTP id 5b1f17b1804b1-4acb0b2fac0mr19920875e9.1.1793364734284;
        Fri, 30 Oct 2026 05:52:14 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-a479-65ed-4521-39bf.rev.sfr.net. [2a02:8434:fda5:4201:a479:65ed:4521:39bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm3170047f8f.12.2026.10.30.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:52:13 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] tools/bootconfig: Reset histogram variable tracking for each instance
Date: Fri, 30 Oct 2026 13:51:50 +0100
Message-ID: <a97b10be8978ecc64a7c5251af1cc2d91fdd4958.1793364709.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793364709.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com>
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

Histogram variables are scoped to a trace instance, but ftrace2bconf.sh
keeps DEFINED_VARS across calls to event_options(). If an earlier instance
has defined ts0, a later instance can export a consumer of its own ts0
before exporting that instance's provider. Replaying the configuration
then fails because the local variable has not been defined yet.

Initialize the variable resolver state when starting each instance so
that its consumers are deferred until their local providers are exported.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I reproduced this with two temporary tracefs instances on my Ubuntu
machine, running kernel 7.0.0-38-generic, with recording disabled. Both
instances defined a histogram variable with the same name. In the second
instance, a consumer sorted before its local provider.

The original exporter put that consumer first and replay failed with an
undefined variable. With the fix, the local provider was exported first
and all three histograms were restored correctly.

 tools/bootconfig/scripts/ftrace2bconf.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 82c4fe021fb7..6d36219eb997 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -84,8 +84,6 @@ synth_event_options() {
 }
 
 # Variables resolver
-DEFINED_VARS=
-UNRESOLVED_EVENTS=
 
 defined_vars() { # event-dir
 	grep "^hist" $1/trigger | grep -o ':[a-zA-Z0-9_]*='
@@ -159,6 +157,8 @@ retry_unresolved() {
 
 event_options() {
 	# PREFIX and INSTANCE must be set
+	DEFINED_VARS=
+	UNRESOLVED_EVENTS=
 	if [ $PREFIX = "ftrace" ]; then
 		# define the dynamic events
 		kprobe_event_options
-- 
2.53.0

