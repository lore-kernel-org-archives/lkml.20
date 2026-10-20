Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506828;
	b=KjguYj/EO1acpPrvUbaQf4LvQJJn7exd27Pjo7YRDDjwlKv0ktmMhAvDPv3MlhM0pxTT
	 diJpPt+WsR+z0bcJVVrye1Nm1NI2vg8Z3L1gOHyDgCX+FJolrzti6idWFb7Db7pminbyQ
	 zCp2+GW74KRUPE/oS04V+lqkS7WBjv2yjHbE11rCTzXSA9PtqVn0/GtsIlHktlLw3Bn3d
	 TEO80DJdjWWzG7WEOClY+asXrNAnXksmphr724qbMfKnkq8Q7Sbqnjsqt0da7uerd+5RD
	 81sgiXHSYMkOHQRmL1AskB0RUeT6bDYBOClcuETAJ0uvqyjegfybtNtp23daex0+ZMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506828;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Stat-Signature:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=mqwyqkEBoam5eZLB5ejTvO5EOFtBdTT+O6KBB1MaL2Q=;
	b=bYtuGUmkQSE9dxgF72QSGEDVdTtmh+m0VktQkUU9nPSHPDiAMh/KyI+6HsN6eOnIvvtA
	 MkhWYlkjshfxUWEDrwSz/nKbcLG5hU0xOm3fV12AoBuzwYL2+WZ9X2hB4BQmRtrn7DfGu
	 w3E76bux37sZD0i7cPVRw+f8hOpWkgYb5RjSWSaevD9rvI7MKUKD5t8uFQrR7zPxfkCQi
	 mtTTwHscy4Qw7CMXLOySiu7m29ZRRQIbEvhlbDBqvg/jcpDM9nf0o+KSnCh7Vfk8oo8gJ
	 n+5CrIWXQun8IvO1/nbIisDMjfuMD6VlPTtM9dwCOrbW9N8lBlFcaoO1CMukPUWBxSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=MyG1rUwR;
	arc=none smtp.remote-ip=216.40.44.14
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61E606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A61E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=MyG1rUwR
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 0919B1401FF;
	Tue, 20 Oct 2026 14:33:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 8143D20011;
	Tue, 20 Oct 2026 14:33:39 +0000 (UTC)
Date: Tue, 20 Oct 2026 10:33:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John 'Warthog9' Hawley <warthog9@kernel.org>
Subject: [PATCH] ktest.pl: Add total test run time to output
Message-ID: <20261020103338.4be97a72@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 8143D20011
X-Stat-Signature: ququ9p641r3t8xjktn4akeyw6weghyc5
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/rWB03iSkoEX43+HkJPG1rG+CzbilAN/c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=mqwyqkEBoam5eZLB5ejTvO5EOFtBdTT+O6KBB1MaL2Q=; b=MyG1rUwRYfk/BB5ZMSBybLVn3lsPnJGavE+dK1BKW3rOMX7+K4w8DTiF8POov4RrEMsQOXiu2z9j5J0NXtSmkPt0ZlKCc2VSo9tZsKMP5kx59DswyT9jfW/2NqVn2+r5sH8XeX5ObzjErUr14NJQFNqa74aGzox5sGXi4YL13Gw=
X-HE-Tag: 1792506819-645977
X-HE-Meta: U2FsdGVkX1/bO3KND9O4NV+YvxTjQABy63FoHoHoMI0f/pRAO0Bl6GLBWTEPHb3iEJQCU3Ac5qi/tIguIJPAEGg6BELnFNBdxT3xukiNaVSsUDlVluoZJjPhR01GuYgq9Vez3tLhIeNu3gmowNQ3P3X1C7s58XK3ETF358+jRa8rJHR8yFAxrfPxnRhCDdcn8iznPAM4Hno0NBvhBVC6yWaPiJLIEwYk1eZef5vKPsj9Ikr2VqMIiwhnQiFdQW29o6h5hNHxylb17pNo0whzYeoX9oi16I+YxE9MsDOP3xt4PEPTvia0i+Xl24u0rGoVNEhuxI+NwHij8I32BugcoqSqrlDEa3+t4BRaj5Bk/+1RUNtP5MMw+/2tcurfe9I3

From: Steven Rostedt <rostedt@goodmis.org>

It can be interesting to know what the total time of all the tests took.
Instead of just seeing the time for each individual test, at the end of
the test (even on failure) show the total time the test took to complete.
This can also help identify if something has changed in the setup that
should be investigated if the times suddenly increase drastically.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 tools/testing/ktest/ktest.pl | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index f94ed2e98887..29d29c40807b 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -227,6 +227,7 @@ my $build_time;
 my $install_time;
 my $reboot_time;
 my $test_time;
+my $start_run_time;
 
 my $warning_found = 0;
 
@@ -1609,6 +1610,14 @@ sub run_post_ktest {
     $post_ktest_done = 1;
 }
 
+sub show_run_time {
+    return if (!$start_run_time);
+    my $end_run_time = time;
+    doprint "\n   Total run time: ";
+    show_time($end_run_time - $start_run_time);
+    doprint "\n";
+}
+
 sub dodie {
     # avoid recursion
     return if ($in_die);
@@ -1631,6 +1640,8 @@ sub dodie {
 	`$power_off`;
     }
 
+    show_run_time();
+
     if (defined($opt{"LOG_FILE"})) {
 	print " See $opt{LOG_FILE} for more info.\n";
     }
@@ -4534,6 +4545,8 @@ print_test_preamble 0;
 
 $SIG{INT} = qw(cancel_test);
 
+$start_run_time = time;
+
 # First we need to do is the builds
 for (my $i = 1; $i <= $opt{"NUM_TESTS"}; $i++) {
 
@@ -4766,6 +4779,8 @@ if ($email_when_finished) {
 	"$successes of $opt{NUM_TESTS} tests started at $script_start_time were successful!");
 }
 
+show_run_time();
+
 if (defined($opt{"LOG_FILE"})) {
     print "\n See $opt{LOG_FILE} for the record of results.\n\n";
     close LOG;
-- 
2.53.0

