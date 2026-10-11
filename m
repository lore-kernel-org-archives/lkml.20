Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802673B6BFA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791696005; cv=none; b=MF+PmRAQBhx2L+Cf13xY+QEVKB95QdY6LaLJ+kZ9zO7WfMmF49MbCb72LUm0g6000Ur7eJoH3jT92NIpaDUIfieiwLQnX+guJdjlGNtFFw0V10sIKrYAd/f5f06ZhdYXrxCEEKTvi66c8gfRwc4cMgXBi6j9LA0IR4nhgrMbkrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791696005; c=relaxed/simple;
	bh=GqKeCm0TVfZ35UiMNxKYYMC82NCj03lz7WNcfGCRATo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7GS2NDH8dDhQb9V2j4P6Jnn6YP8t4s25j+uogqsrNwsWgsLxlMd68TN8j+sCQ2We0Wba/cYUiPnpb7F6YIYceOSIP6HyguTOI72SL398aN6rFEVadgmvv3iB2wh9VT2R09RCj5FG802ADC6uIY/3wXbXSRVupdoL1LBy8FVOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhN/42fi; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhN/42fi"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-141395927feso1659108c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791696004; x=1792300804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUeCocUpnPIi5hvZAU0MZvPFEOtjlheidG35piwdzu4=;
        b=bhN/42fibUpFdrq640KtcHagn6ETts5xjDz3mfggIpLFhEDv7DmVG3HBA85PEuRSnl
         EutO9D3XqSrvrukPsmjZ10Hl26/kjV9PHPDR9RwvUd9y7ssJi0iolZAXhNsP4DHMa4yc
         EibFGkqhTK8aZrCYzMYYRFS3TqwnRZh0Dv39r5kqI+EmOM8aCNyAJHg97Ar2po9cYrYj
         xc2labDXbpZOQBwGrIsYam406cWJ8nqY+3MNB8E9KCgbUDFO0193phHdgVhExHvly0AZ
         FUi/ZhKdzCuJm8I5td9uduV01Zf97XGBbdbrdtIaeZzOaV+biG2Ko/24VixpYahClROW
         G+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791696004; x=1792300804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUeCocUpnPIi5hvZAU0MZvPFEOtjlheidG35piwdzu4=;
        b=wguU53+51HqzT/712jLThtgtqtE8HANdgwVwnJUkPY8KiUk31awJRbMHeqLNvW43gI
         vB1S842x0Js/TbPaAuynN3C8j7/YdoCmjb1Y73l/FzIO3jUWFAL/auVQWB89TmMBa3ST
         x+ed71dVvygVhsklh2vkWvD9XYdsT6tzAT6dPoosFsJNzR9S0GZwvLYi6wFvItySZtU4
         tjBauTOGo2RIO8McJ8kLnh86pAppmJsFm9AUMccQ5M00fGbuxZSgXb6+BBerj7wFWqVN
         g+YuU61kkNuj8ZL/V2mf5houClKcCSDFAFloZRdWrlDvS/ugMFQjwa7Zuh8k+lsL0Oh5
         YziA==
X-Forwarded-Encrypted: i=1; AKwUvBzazk+2IPHKI3LDnqGuaMM6eu5UViToY+MNtm/TH/ItwoULxkBBGjiR0EGfejQTPmo0s6WYUUC4XmBcBbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJylN4WbL9pDQNHQXKXHH/3DJzp1E+iJ8fnW+vSWBSTz3SEsz27
	42ZhgafmkMefjuvIEGvxW8m19/F/UwCKqlxWKtOuhjyOWBdIentFxzFD
X-Gm-Gg: AYBFou1U4vX+fqL9tUCfbM4OPvRK6iAxg0tmcKCwbaZtZv53TjTu+4LzhfWOhaI080f
	KPSEzuNQIO3KhDAXOpD3aAIgD04/RzrX6X7Oxtc7iX6O5K4QukxhGF1SaG/6jjS3mUBe74p76he
	SlC2esAkcr6uPtkJe8mLPabZiuQD+GclH2Kq5TT2KUTY7oTRV90IRajmLEjpF8PlC3IyRUFlaZy
	cbVbSoHqCOEi94C8y0qrInTdFCOJ8kbPuwmQTLykjp4S+qHCIvGh5fKRhFrzhJxY3sVnPbwm/yE
	wu5dbA7S5HfnBgYHR8HZisYXAeywHU9ov60ldGtaKNmnlWd6rs/aSJvjB7T173k5ktfXB1GLYQP
	m+/0TnjPfnZ4zfWGh1RgJ0/gdHfhFhmNivZG+fKOUQ9Kkoer2RiWtd6OWh8TG0AdbBpoianzBZR
	LT3Ohn3DZAkQVw1I1YynbWEJeeQytjG8OeiRopts4T9vrASVhqB8TFjvTkkQ2xFCRx8ssyh/oAr
	vKm6Q9FIaIoPTsZz5dd96BcW/R7e7GszZ+pkBz7i6jK68pOkoFoGeqZb+yZ1MlOn2GVMsHtuqe2
	NOeRjL3QwyB5PnZsO+LtMeiPcgdeyHcmJidalZA0JUa4zQX5FzzWsa+muDMK8IJ3mzLqGtk9sO4
	fqZm6psxa6d5nQO7lZ6EPVns/HtMl663AXREZg5DV5/tw7tdoak8bQaBM8ETL7dskRg==
X-Received: by 2002:a05:701b:205b:10b0:148:722b:7cbc with SMTP id a92af1059eb24-16a5dbfe430mr8298527c88.14.1791696003292;
        Sat, 10 Oct 2026 22:20:03 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm20673698c88.5.2026.10.10.22.19.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:20:02 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Todd Poynor <toddpoynor@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/3] selftests/timers: Test timer_gettime() on a disarmed SIGEV_NONE timer
Date: Sun, 11 Oct 2026 10:49:43 +0530
Message-ID: <20261011051943.60520-4-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011051943.60520-1-jain.sm@gmail.com>
References: <20261011051943.60520-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm a SIGEV_NONE timer for 100 seconds, disarm it and check that
timer_gettime() reports a zero it_value.

Run the test for CLOCK_MONOTONIC, where it fails without the previous
patch, and for CLOCK_PROCESS_CPUTIME_ID, where it passes with and
without it.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 tools/testing/selftests/timers/posix_timers.c | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index a92d4b9577..b6e56c08ba 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -495,6 +495,40 @@ static void check_sigev_none(int which)
 			 "check_sigev_none %s\n", name);
 }
 
+static void check_sigev_none_disarm(int which)
+{
+	const char *name = clock_name(which);
+	struct itimerspec its;
+	struct sigevent sev;
+	timer_t timerid;
+
+	memset(&sev, 0, sizeof(sev));
+	sev.sigev_notify = SIGEV_NONE;
+
+	if (timer_create(which, &sev, &timerid))
+		fatal_error(name, "timer_create()");
+
+	/* Arm the timer to expire in 100 seconds and disarm it again */
+	memset(&its, 0, sizeof(its));
+	its.it_value.tv_sec = 100;
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	memset(&its, 0, sizeof(its));
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	/* A disarmed timer must report a zero it_value */
+	if (timer_gettime(timerid, &its))
+		fatal_error(name, "timer_gettime()");
+
+	if (timer_delete(timerid))
+		fatal_error(name, "timer_delete()");
+
+	ksft_test_result(!its.it_value.tv_sec && !its.it_value.tv_nsec,
+			 "check_sigev_none_disarm %s\n", name);
+}
+
 static void check_gettime(int which)
 {
 	const char *name = clock_name(which);
@@ -680,7 +714,7 @@ int main(int argc, char **argv)
 
 	ksft_print_header();
 	if (run_sig_ign_tests) {
-		ksft_set_plan(19);
+		ksft_set_plan(21);
 	} else {
 		ksft_set_plan(10);
 	}
@@ -714,6 +748,8 @@ int main(int argc, char **argv)
 		check_delete();
 		check_sigev_none(CLOCK_MONOTONIC);
 		check_sigev_none(CLOCK_PROCESS_CPUTIME_ID);
+		check_sigev_none_disarm(CLOCK_MONOTONIC);
+		check_sigev_none_disarm(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_MONOTONIC);
 		check_gettime(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_THREAD_CPUTIME_ID);
-- 
2.43.0

