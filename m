Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254016;
	b=ZUFF0wl5EP+1q/cIGFMiEMqMHl2BiaFGI2HZlmDqefCDp5JVDNqe4GDoZid3WQ3DBSfB
	 jb0sONNQeOXdj8/9gmUvxwHnNFU51ZouC82jVeEmzasZRZqmltIhF6DPAAYXWp3FFMAxy
	 01/Gal2piVtTzgOE2vNgkcccdrLiPfkfFBElS5YZsea3xEXZHOSOtGECf/68sz8yRiFe/
	 IDXcxPbWWRDOxBcwHwOuOl9QLI87fKsGt8P9xi9XSBWoXHV65345efaYpkYVan+LQcEJ/
	 6yitZfBKpjVcPLcirTK/XvQRkDDyJ1iLitHzSFLHPKS8I12zC3N7z1hbAP2u81EptwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254016;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=hJOBp/YHj4GC26hTLnzq6i5JkgI4uTY9TqgxEsNCRhM=;
	b=KeTOi/eXORFi5JRXQm0fqvBDTlmEPAzcB+9i/cVwl1caoLAMSok3PIgfDE3YpfI6HM8E
	 Z79aaqJHXaDqAsMBtKK6vA5l6GlvV+lY0kGUNVYRDnclCoRhFmW1PveBoAUf1ljiigwBO
	 oBOeA3jpDwZXJtajaOulJyPw8AlL8nL0OwD0O5RIEbp1aQN48NCAFptJqNzkYm1sIhGvW
	 F1K801WCBO5doa6jJuAhOLzCGJVI9X07J5jrSUBoAv76qMtiRzcZvca6XcwYp8UYIaaRx
	 uA2IEogAJm7UkEOGm7L5D9ClJ/2Ejiz9fDYmjp7xltfITKimOBuL1kZvZazfJiyJ5Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1bGkp2Mr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="clUmvoJ/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66F60A5BD5;
	Mon,  9 Nov 2026 19:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C66F60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1bGkp2Mr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=clUmvoJ/
Date: Mon, 09 Nov 2026 19:53:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254014;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJOBp/YHj4GC26hTLnzq6i5JkgI4uTY9TqgxEsNCRhM=;
	b=1bGkp2MrYceAFoF8z8KOXInsAuvkdUGe3KYWBfzXuuhQz0WG3Um2pgG8Rh6WUuLLqMyWV3
	SjoknLkDlxI7krGDjod0S1iTzoMZ577zPSJUnwuk2ha/pToTeMul1klTpOASKoeeSBepb8
	oh080rGh93b84ySOG/WOxcCufGu1xKuOV84wxOrxAhs1Das7BogyG3tEFNaTvACRg1gfzi
	tx61G2dbBylKIlp36rk7V0Xh1/g3wEmXr86Gy+HSNRvMYdvkq1HDjINYafe4PUf0ZTmmBw
	Ok1yHju/AamcMWN3sb89PtOzuNB5FAN6Jhq1t5wxHLGm8o1oz/MFDd2HsGITuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254014;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJOBp/YHj4GC26hTLnzq6i5JkgI4uTY9TqgxEsNCRhM=;
	b=clUmvoJ/LbljW/HVPjNB58lPrfIm7v71rIllWbIuAuu4TlGaBVaSlqBRSY589XOAnMWrue
	k+U36VfRgNh9FVCA==
From: "tip-bot2 for Sasha Levin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] selftests: timers: Print time values as long long
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103155442.534141-1-sashal@kernel.org>
References: <20261103155442.534141-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425401293.2093942.7165972180621887836.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     954394fe6221327e7c5a05869f958584f277fc11
Gitweb:        https://git.kernel.org/tip/954394fe6221327e7c5a05869f958584f27=
7fc11
Author:        Sasha Levin <sashal@kernel.org>
AuthorDate:    Tue, 03 Nov 2026 10:54:42 -05:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:21:47 +01:00

selftests: timers: Print time values as long long

On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
13, time_t, the tv_sec fields of struct timespec and struct timeval,
their tv_usec field and the freq field of struct timex are long long,
and printing them with %ld or %lu warns:

  leap-a-day.c:142:69: warning: format '%ld' expects argument of type 'long i=
nt', but argument 2 has type 'time_t' {aka 'long long int'} [-Wformat=3D]

Cast the values to long long and print them with %lld. While at it,
print tv_nsec, a long, with %ld instead of %lu, and cast it to long, as
it is a long long on x32, and print the unsigned long frequency in
rtcpie with %lu.

Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261103155442.534141-1-sashal@kernel.org
---
 tools/testing/selftests/timers/alarmtimer-suspend.c  |  9 ++--
 tools/testing/selftests/timers/inconsistency-check.c |  5 +-
 tools/testing/selftests/timers/leap-a-day.c          | 28 +++++------
 tools/testing/selftests/timers/rtcpie.c              |  4 +-
 tools/testing/selftests/timers/threadtest.c          |  6 +-
 tools/testing/selftests/timers/valid-adjtimex.c      | 14 +++---
 6 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/test=
ing/selftests/timers/alarmtimer-suspend.c
index 120b3ce..c1d87cb 100644
--- a/tools/testing/selftests/timers/alarmtimer-suspend.c
+++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
@@ -60,8 +60,8 @@ void sigalarm(int signo)
 	delta_ns =3D timespec_sub(start_time, ts);
 	delta_ns -=3D NSEC_PER_SEC * SUSPEND_SECS * alarmcount;
=20
-	printf("ALARM(%i): %ld:%ld latency: %lld ns ", alarmcount, ts.tv_sec,
-							ts.tv_nsec, delta_ns);
+	printf("ALARM(%i): %lld:%ld latency: %lld ns ", alarmcount,
+	       (long long)ts.tv_sec, (long)ts.tv_nsec, delta_ns);
=20
 	if (delta_ns > UNREASONABLE_LAT) {
 		printf("[FAIL]\n");
@@ -103,8 +103,9 @@ int main(void)
 		}
=20
 		clock_gettime(alarm_clock_id, &start_time);
-		printf("Start time (%s): %ld:%ld\n", clock_name(alarm_clock_id),
-				start_time.tv_sec, start_time.tv_nsec);
+		printf("Start time (%s): %lld:%ld\n", clock_name(alarm_clock_id),
+				(long long)start_time.tv_sec,
+				(long)start_time.tv_nsec);
 		printf("Setting alarm for every %i seconds\n", SUSPEND_SECS);
 		its1.it_value =3D start_time;
 		its1.it_value.tv_sec +=3D SUSPEND_SECS;
diff --git a/tools/testing/selftests/timers/inconsistency-check.c b/tools/tes=
ting/selftests/timers/inconsistency-check.c
index d7982ac..e8012fe 100644
--- a/tools/testing/selftests/timers/inconsistency-check.c
+++ b/tools/testing/selftests/timers/inconsistency-check.c
@@ -86,8 +86,9 @@ int consistency_test(int clock_type, unsigned long seconds)
 			for (i =3D 0; i < CALLS_PER_LOOP; i++) {
 				if (i =3D=3D inconsistent)
 					ksft_print_msg("--------------------\n");
-				ksft_print_msg("%lu:%lu\n", list[i].tv_sec,
-							list[i].tv_nsec);
+				ksft_print_msg("%lld:%ld\n",
+					       (long long)list[i].tv_sec,
+					       (long)list[i].tv_nsec);
 				if (i =3D=3D inconsistent + 1)
 					ksft_print_msg("--------------------\n");
 			}
diff --git a/tools/testing/selftests/timers/leap-a-day.c b/tools/testing/self=
tests/timers/leap-a-day.c
index b93cb57..e932e13 100644
--- a/tools/testing/selftests/timers/leap-a-day.c
+++ b/tools/testing/selftests/timers/leap-a-day.c
@@ -139,20 +139,21 @@ void sigalarm(int signo)
 	ret =3D adjtimex(&tx);
=20
 	if (tx.time.tv_sec < next_leap) {
-		printf("Error: Early timer expiration! (Should be %ld)\n", next_leap);
+		printf("Error: Early timer expiration! (Should be %lld)\n",
+		       (long long)next_leap);
 		error_found =3D 1;
-		printf("adjtimex: %10ld sec + %6ld us (%i)\t%s\n",
-					tx.time.tv_sec,
-					tx.time.tv_usec,
+		printf("adjtimex: %10lld sec + %6lld us (%i)\t%s\n",
+					(long long)tx.time.tv_sec,
+					(long long)tx.time.tv_usec,
 					tx.tai,
 					time_state_str(ret));
 	}
 	if (ret !=3D TIME_WAIT) {
 		printf("Error: Timer seeing incorrect NTP state? (Should be TIME_WAIT)\n");
 		error_found =3D 1;
-		printf("adjtimex: %10ld sec + %6ld us (%i)\t%s\n",
-					tx.time.tv_sec,
-					tx.time.tv_usec,
+		printf("adjtimex: %10lld sec + %6lld us (%i)\t%s\n",
+					(long long)tx.time.tv_sec,
+					(long long)tx.time.tv_usec,
 					tx.tai,
 					time_state_str(ret));
 	}
@@ -291,7 +292,8 @@ int main(int argc, char **argv)
 		printf("Scheduling leap second for %s", ctime(&next_leap));
=20
 		/* Set up timer */
-		printf("Setting timer for %ld -  %s", next_leap, ctime(&next_leap));
+		printf("Setting timer for %lld -  %s", (long long)next_leap,
+		       ctime(&next_leap));
 		memset(&se, 0, sizeof(se));
 		se.sigev_notify =3D SIGEV_SIGNAL;
 		se.sigev_signo =3D signum;
@@ -339,17 +341,17 @@ int main(int argc, char **argv)
=20
 			if (tai_time) {
 				clock_gettime(CLOCK_TAI, &tai);
-				printf("%ld sec, %9ld ns\t%s\n",
-						tai.tv_sec,
-						tai.tv_nsec,
+				printf("%lld sec, %9ld ns\t%s\n",
+						(long long)tai.tv_sec,
+						(long)tai.tv_nsec,
 						time_state_str(ret));
 			} else {
 				ctime_r(&tx.time.tv_sec, buf);
 				buf[strlen(buf)-1] =3D 0; /*remove trailing\n */
=20
-				printf("%s + %6ld us (%i)\t%s\n",
+				printf("%s + %6lld us (%i)\t%s\n",
 						buf,
-						tx.time.tv_usec,
+						(long long)tx.time.tv_usec,
 						tx.tai,
 						time_state_str(ret));
 			}
diff --git a/tools/testing/selftests/timers/rtcpie.c b/tools/testing/selftest=
s/timers/rtcpie.c
index 4ba42d1..5d88c78 100644
--- a/tools/testing/selftests/timers/rtcpie.c
+++ b/tools/testing/selftests/timers/rtcpie.c
@@ -111,8 +111,8 @@ int main(int argc, char **argv)
 			timersub(&end, &start, &diff);
 			if (diff.tv_sec > 0 ||
 			    diff.tv_usec > ((1000000L / tmp) * 1.10)) {
-				fprintf(stderr, "\nPIE delta error: %ld.%06ld should be close to 0.%06ld=
\n",
-				       diff.tv_sec, diff.tv_usec,
+				fprintf(stderr, "\nPIE delta error: %lld.%06lld should be close to 0.%06=
lu\n",
+				       (long long)diff.tv_sec, (long long)diff.tv_usec,
 				       (1000000L / tmp));
 				fflush(stdout);
 				exit(-1);
diff --git a/tools/testing/selftests/timers/threadtest.c b/tools/testing/self=
tests/timers/threadtest.c
index 60b8b21..fbf5d4c 100644
--- a/tools/testing/selftests/timers/threadtest.c
+++ b/tools/testing/selftests/timers/threadtest.c
@@ -63,7 +63,8 @@ void checklist(const struct timespec *list, int size)
 			for (j =3D 0; j < size; j++) {
 				if (j =3D=3D i)
 					printf("---------------\n");
-				printf("%lu:%lu\n", list[j].tv_sec, list[j].tv_nsec);
+				printf("%lld:%ld\n", (long long)list[j].tv_sec,
+				       (long)list[j].tv_nsec);
 				if (j =3D=3D i+1)
 					printf("---------------\n");
 			}
@@ -162,7 +163,8 @@ int main(int argc, char **argv)
 	start =3D time(0);
 	strftime(buf, 255, "%a, %d %b %Y %T %z", localtime(&start));
 	printf("%s\n", buf);
-	printf("Testing consistency with %i threads for %ld seconds: ", thread_coun=
t, runtime);
+	printf("Testing consistency with %i threads for %lld seconds: ",
+	       thread_count, (long long)runtime);
 	fflush(stdout);
=20
 	/* spawn */
diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/=
selftests/timers/valid-adjtimex.c
index f641d5f..c666a32 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -136,8 +136,8 @@ int validate_freq(void)
 		tx.modes =3D 0;
 		ret =3D adjtimex(&tx);
 		if (tx.freq !=3D valid_freq[i]) {
-			printf("Warning: freq value %ld not what we set it (%ld)!\n",
-					tx.freq, valid_freq[i]);
+			printf("Warning: freq value %lld not what we set it (%ld)!\n",
+					(long long)tx.freq, valid_freq[i]);
 		}
 	}
 	for (i =3D 0; i < NUM_FREQ_OUTOFRANGE; i++) {
@@ -156,8 +156,8 @@ int validate_freq(void)
 		ret =3D adjtimex(&tx);
 		if (tx.freq =3D=3D outofrange_freq[i]) {
 			printf("[FAIL]\n");
-			printf("ERROR: out of range value %ld actually set!\n",
-					tx.freq);
+			printf("ERROR: out of range value %lld actually set!\n",
+					(long long)tx.freq);
 			pass =3D -1;
 			goto out;
 		}
@@ -218,7 +218,8 @@ int set_offset(long long offset, int use_nano)
=20
 	ret =3D clock_adjtime(CLOCK_REALTIME, &tmx);
 	if (ret < 0) {
-		printf("(sec: %ld  usec: %ld) ", tmx.time.tv_sec, tmx.time.tv_usec);
+		printf("(sec: %lld  usec: %lld) ", (long long)tmx.time.tv_sec,
+		       (long long)tmx.time.tv_usec);
 		printf("[FAIL]\n");
 		return -1;
 	}
@@ -238,7 +239,8 @@ int set_bad_offset(long sec, long usec, int use_nano)
 	tmx.time.tv_usec =3D usec;
 	ret =3D clock_adjtime(CLOCK_REALTIME, &tmx);
 	if (ret >=3D 0) {
-		printf("Invalid (sec: %ld  usec: %ld) did not fail! ", tmx.time.tv_sec, tm=
x.time.tv_usec);
+		printf("Invalid (sec: %lld  usec: %lld) did not fail! ",
+		       (long long)tmx.time.tv_sec, (long long)tmx.time.tv_usec);
 		printf("[FAIL]\n");
 		return -1;
 	}
