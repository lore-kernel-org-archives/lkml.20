Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383630;
	b=ZFJAewKn8VvXRsBlumRU7p96BOvu7phGijEU+CxvisqfEXfATpVbm8QOh2XTWUXThtYA
	 8IKNhzP+ZPV5MsxDdsqDBLRffyIJJ09VqOkFJSuWB98jDuuju/rL2QrsYMlTxt9qfB44s
	 oDkErJP9Ndhg2GQGMYqjGPuf8OdB6YqV8PfTjlxgMNzvmAFlcH7+ZfQvx52Ts0pBx8Rqq
	 Ix/hdAxLaPLla98cCeMNQ/ZMq7YLLI9mxf03fu15Z2ROGIfggGtCTaGfkatpBFywqGTe6
	 dBynrCZedM+LO6Gq70FstPw/gM6mhrcDIH1IjyNGAHa1TQr/czjNYlui3RGoWx3Zdbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
	b=nsHZb1C5GA3JKdMSgYLliKUXzGmyelIW+W7iMYSVPl1TZpUaHpr47RHSliwpetvrub5R
	 oiMicrPnIi/4rnM20qJye2cO0lx+XChElgEbzlZEHpul5r4sJNCpdGDMBv2iC948Xktkj
	 qr9VWPRgRZiDnOUnUn1aoc3V9z2CjENWKxmrUcaCbIyFP228DcqqfQNI8vB9tJ2vSE8Wi
	 K8INY+LqS9RTQMRNBAddqqskwyycoThnOYewmtTn5O7nmYdFe8j2K3hUUULpm8XfYmaiP
	 /7Ge3D0Qg2nT3QVFss8yK6dmtpIPF85PQx/FZP7SAo/GWfWauRPXAF/KQt6YpGkhs/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eSrG0lFG;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF460A261D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CF460A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eSrG0lFG
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1897783a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383629; x=1794988429; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
        b=eSrG0lFG7ySeSzefrD8AR8ZX0qx68Br5x/TZblJhR3nl+ObylVOTerjSzmy8C4PBMi
         zQ8XaEcAQ853WdxMFYccDPa1xeiDsJZyucqlmn4WRgozQGECM/gtMifq/tBf/bSL7BIf
         7HssaeBv173YHqdkxXqCrzCGGeEn1Z0k2X2II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383629; x=1794988429;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
        b=QEE+7n45r+vwFZmyZYbsDc+ArkuUBuMv8eLYkj+pLv02ASczTpSEGPGecqYYA8vD05
         I/TPMNm1YNexrW3LQyvpdliKFokmJFTOoGtc5IRCDTnPOAUT1vkXRM1ZnpM0kFyib2n4
         Xd7+mjSCqO3mqIsqRKdBLsExr1RClUovaZ+s6VQoLOUPVD9NtJCiwK9vWLnMZYzfW1x4
         100Megbsgv74M17xaTgybDgz21Zh/NV58lpK925Sq34NDbjKIH/iI7jK45rRIuQa4ARc
         AM54pkNhM6t7Za6MzZmI6FO1ZhMymgL93BX3Rpp33zTtwCD2nVr+z82CUtLxf6j3Ymd3
         DhfQ==
X-Forwarded-Encrypted: i=1; AL+hErFf7viqIvj+VfzUYmOaGcVK7YX9/1aNFZYC5Z56D0htCt1x/RBmOeNLRk7U0klQ2eryygeAyZk0Uz9I9a0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cI4Q8qAXvPVx/3Q0uwW8UGDHXpmIZqvjP9dhCKMoLkPXHsMU/
	rsLr7+iX4d6V1HizWAIWg2NMpgwBP03t19QRwV/or95+PkBWX8BjRBQhNC70rW0BmLE=
X-Gm-Gg: AYBFou0NPU/z2mAltdg+TDCBoNb6rrzChXAm213yDPKxB+2BMleHkC8v6FWx7EvruGj
	vpiRcsgCIqfgSCevQyIivwEy1Q6YDgPNjb28otWRS5e4L340RtU5ZdNwJaDQHAplMpWTs9EWi3M
	+DKLf1nH1WGF8OR8wHWPlgridU27RJSfnKQXrAusIgLJx9o6WUPiJdpVxd0VzjLvExM80FzZsFJ
	RdFqnA5W2AwHVzXGS/VZhnvwkB2kqUg/TC6AaIgG4p28IWBVYzFIfPTezeuVsTRIjkqnqlrVcam
	tQ3Q4xfziOuTJHElJ6aRaM+r+rBjgNBOmyDSTZ8W3pt3vW9pig5hprO/K9oDUAdZXg0BiQfYa4q
	Qlc2m/qIuDzSoRoZTM+PXcPnVC7elfSS6+oFeQwQ72Z6yPmQ1mHY3mUNsvqldFPJxCCI+dUuwGJ
	tn1LQ0TGmFGSOx42RC4gNA1HcxmsjBFkwn9XxwFlSb3ntOx7BTjoC88ng6PLCtEr+px6hA4bggG
	FEwxt9/s+lRwEun6N7jPHCboQ4gfjzuf9ooEvBWjUPzglQRrzrFGb5s2S1GpzfI6A3QZxRDgXOb
	KLpkW6JClKZTtkvLp3BWKQlFV5Z6f6YUw4fEHcHSA+lKuyOdCA/XBLvfhg51jSr9iFqSfmJdiCZ
	/jyMv15eMq0ydkUxF0ADJolZI+VB4pQteR7WVsSLD9VSmBCnR/OgmL0VXYUpN9yBsBiPgLtsSrf
	vJrT/iDPG3nUCMqogYqcw3lbt0te8nq0mheZ2YtPJzP9q3Wkdf4Gn7
X-Received: by 2002:a17:90b:5483:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b182fb308emr1835511a91.25.1794383629583;
        Tue, 10 Nov 2026 23:53:49 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da4cd8csm3404966a91.2.2026.11.10.23.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:49 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:45 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 9/9] selftests/liveupdate: Check handover revival, sequence
 and memory stats
Message-ID: <738fbfd19034ce495de9b22c705a7815a236907d.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Extend the handover stats test to cover the new files. On the first
boot, kho_incoming/state should be none, liveupdate_num 0, and both KHO
sizes 0. After the kexec, the handover should be revived and
liveupdate_num should be 1.

restored_size should grow by at least a page each time a memfd is
retrieved or dropped. The memfd in the unclaimed session is retrieved
last, once everything else is done.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../selftests/liveupdate/luo_handover_stats.c | 74 +++++++++++++++++--
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/luo_handover_stats.c b/tools/testing/selftests/liveupdate/luo_handover_stats.c
index f18df79dda55..2863630b823e 100644
--- a/tools/testing/selftests/liveupdate/luo_handover_stats.c
+++ b/tools/testing/selftests/liveupdate/luo_handover_stats.c
@@ -10,6 +10,7 @@
 #include <libliveupdate.h>
 
 #define INCOMING_DIR "/sys/class/misc/liveupdate/incoming/"
+#define KHO_INCOMING_DIR "/sys/kernel/kexec/kho_incoming/"
 
 #define SESSION_CLAIMED "stats-claimed"
 #define SESSION_UNCLAIMED "stats-unclaimed"
@@ -28,13 +29,13 @@
 /* The first open starts deserialization. */
 static char state_before_open[16];
 
-static void read_incoming(const char *name, char *buf, size_t len)
+static void read_sysfs(const char *dir, const char *name, char *buf, size_t len)
 {
 	char path[128];
 	ssize_t n;
 	int fd;
 
-	snprintf(path, sizeof(path), INCOMING_DIR "%s", name);
+	snprintf(path, sizeof(path), "%s%s", dir, name);
 	fd = open(path, O_RDONLY);
 	if (fd < 0)
 		fail_exit("open %s", path);
@@ -54,6 +55,11 @@ static void read_incoming(const char *name, char *buf, size_t len)
 		buf[n - 1] = '\0';
 }
 
+static void read_incoming(const char *name, char *buf, size_t len)
+{
+	read_sysfs(INCOMING_DIR, name, buf, len);
+}
+
 static void expect_state(const char *state, const char *expected)
 {
 	if (strcmp(state, expected))
@@ -61,13 +67,13 @@ static void expect_state(const char *state, const char *expected)
 				   expected);
 }
 
-static unsigned long long read_number(const char *name)
+static unsigned long long read_number(const char *dir, const char *name)
 {
 	unsigned long long val = 0;
 	char buf[32];
 	char *p;
 
-	read_incoming(name, buf, sizeof(buf));
+	read_sysfs(dir, name, buf, sizeof(buf));
 	for (p = buf; *p >= '0' && *p <= '9'; p++) {
 		if (val > (ULLONG_MAX - (*p - '0')) / 10)
 			break;
@@ -75,19 +81,45 @@ static unsigned long long read_number(const char *name)
 	}
 	if (p == buf || *p)
 		ksft_exit_fail_msg("%s%s reads '%s', not a 64-bit unsigned number\n",
-				   INCOMING_DIR, name, buf);
+				   dir, name, buf);
 	return val;
 }
 
 static void expect_count(const char *name, unsigned long long expected)
 {
-	unsigned long long val = read_number(name);
+	unsigned long long val = read_number(INCOMING_DIR, name);
 
 	if (val != expected)
 		ksft_exit_fail_msg("%s is %llu, expected %llu\n", name, val,
 				   expected);
 }
 
+static void expect_kho_state(const char *expected)
+{
+	char state[16];
+
+	read_sysfs(KHO_INCOMING_DIR, "state", state, sizeof(state));
+	if (strcmp(state, expected))
+		ksft_exit_fail_msg("kho_incoming/state is '%s', expected '%s'\n",
+				   state, expected);
+}
+
+static unsigned long long kho_size(const char *name)
+{
+	return read_number(KHO_INCOMING_DIR, name);
+}
+
+static unsigned long long expect_more_restored(unsigned long long prev)
+{
+	unsigned long long restored = kho_size("restored_size");
+
+	if (restored < prev + getpagesize() ||
+	    restored > kho_size("preserved_size"))
+		ksft_exit_fail_msg("restored_size went from %llu to %llu\n",
+				   prev, restored);
+	return restored;
+}
+
 static void expect_counts(long retrieved, long dropped)
 {
 	char state[16];
@@ -111,6 +143,10 @@ static void run_stage_1(int luo_fd)
 	expect_state(state_before_open, "none");
 	expect_count("sessions", 0);
 	expect_count("files", 0);
+	expect_count("liveupdate_num", 0);
+	expect_kho_state("none");
+	if (kho_size("preserved_size") || kho_size("restored_size"))
+		ksft_exit_fail_msg("KHO sizes aren't 0 on a cold boot\n");
 
 	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
 
@@ -144,11 +180,16 @@ static void run_stage_1(int luo_fd)
 
 static void run_stage_2(int luo_fd, int state_session_fd)
 {
-	int claimed_fd, mfd, stage;
+	int claimed_fd, unclaimed_fd, mfd, stage;
+	unsigned long long restored;
 
 	ksft_print_msg("[STAGE 2] Checking state before and after the first open...\n");
 	expect_state(state_before_open, "pending");
 	expect_counts(0, 0);
+	expect_count("liveupdate_num", 1);
+	expect_kho_state("revived");
+	if (!kho_size("preserved_size"))
+		ksft_exit_fail_msg("kho_incoming/preserved_size is 0\n");
 
 	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
 	if (stage != 2)
@@ -163,6 +204,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (claimed_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", SESSION_CLAIMED);
 
+	restored = kho_size("restored_size");
 	mfd = restore_and_verify_memfd(claimed_fd, MFD_RETRIEVED_TOKEN,
 				       MFD_RETRIEVED_DATA);
 	if (mfd < 0)
@@ -170,6 +212,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 			  MFD_RETRIEVED_TOKEN);
 	close(mfd);
 	expect_counts(2, 0);
+	restored = expect_more_restored(restored);
 
 	ksft_print_msg("[STAGE 2] Finishing '%s'...\n", SESSION_CLAIMED);
 	if (luo_session_finish(claimed_fd) < 0)
@@ -177,6 +220,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	close(claimed_fd);
 
 	expect_counts(2, 1);
+	expect_more_restored(restored);
 
 	ksft_print_msg("[STAGE 2] Finishing the state session...\n");
 	if (luo_session_finish(state_session_fd) < 0)
@@ -185,6 +229,22 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 
 	/* Finishing the state session must not drop anything. */
 	expect_counts(2, 1);
+	restored = kho_size("restored_size");
+
+	ksft_print_msg("[STAGE 2] Retrieving the memfd in '%s'...\n",
+		       SESSION_UNCLAIMED);
+	unclaimed_fd = luo_retrieve_session(luo_fd, SESSION_UNCLAIMED);
+	if (unclaimed_fd < 0)
+		fail_exit("luo_retrieve_session for '%s'", SESSION_UNCLAIMED);
+	mfd = restore_and_verify_memfd(unclaimed_fd, MFD_UNCLAIMED_TOKEN,
+				       MFD_UNCLAIMED_DATA);
+	if (mfd < 0)
+		fail_exit("restore_and_verify_memfd for token %#x",
+			  MFD_UNCLAIMED_TOKEN);
+	close(mfd);
+	close(unclaimed_fd);
+	expect_counts(3, 1);
+	expect_more_restored(restored);
 
 	ksft_print_msg("\n--- HANDOVER STATS TEST PASSED ---\n");
 }
-- 
2.54.0

