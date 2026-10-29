Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237786;
	b=hNgQMNnvaPxJMZwgDqr+J3/uWXonb6BvRAsNGWn/E9NRlpIQzXVW+JyRk94dFWCi+phS
	 VztmaJfEuDe6tfv+uWl/UTBorPkr+7IV1wMtJ+lucK2eJ/kppvDBewmczCeU8vHxftzRj
	 4G1ozOWiiTH8FX7cg2SguoLS5nKLG1vRK/P9Qk7ZdxhDYisZpVVp2zHBgIN1YOWZq92R6
	 hplPwxo2kAbaLWjIfKDnsTxgDpHJKlQwolZtFQZBnWVREJ/bQT0ienjvul/xZIfYYLabu
	 S9NFaXeS8uuaEJ2TdwcPel08ks5kNLz8wMOOLaxClfpoeOcNBC7wUVEEhyyhJeTQezA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237786;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Stat-Signature:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=3mkztJFQV04Dva50X0PM7gLgSBJ0mzL2cHjSZN7w0es=;
	b=LsFJzOzNwzL2CXkVRfqYTChz8c5opMdMmNYFDImAz6Jzp2EXRwzlI2GKOc1lVeYpZkFE
	 sClcYOox1NiG1QLPOA9ei2/cVFEU7hHOjkmLKFf3bX4Gmo6gcrxZ+0O4Ju9ALZuspOdnd
	 jwfBw/Gf8/d1TyJfejemNQcJzEFVj6Xx4g6N/IuFjsQQ/m1Emw2i5D3uzJzk89JL6bmLo
	 5Q2vrPYpWYj6tkun4Pc1LwljvJapm/P0iQBfxDZQeX3F8dE6dpnjHfjbTfO93SKCONCGs
	 m13qPVth/MRn0o7WG4TPNSwxX9SthLKIgmhgB2ezNFqJ4K3ooc0brqn7GYM8LRl0RSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=HlsEKFwT;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E710606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E710606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=HlsEKFwT
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 28A1F1C3183;
	Thu, 29 Oct 2026 01:36:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 8379A20025;
	Thu, 29 Oct 2026 01:36:22 +0000 (UTC)
Date: Wed, 28 Oct 2026 21:36:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, John 'Warthog9' Hawley
 <warthog9@kernel.org>, "Ricardo B. =?UTF-8?B?TWFybGnDqHJl?= (SUSE)"
 <ricardo@marliere.net>
Subject: [GIT PULL] ktest: Updates for v7.4
Message-ID: <20261028213621.31707282@fedora>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 8379A20025
X-Stat-Signature: ocwtyymdw7i9qn4od8uwiz6qzn9gpfhh
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19E/+hj8jFQdga1RTXEpe7fNQ5vxwvfMes=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=3mkztJFQV04Dva50X0PM7gLgSBJ0mzL2cHjSZN7w0es=; b=HlsEKFwTcdpyBhmxg1oIqExtfi3t0w+nkpMyhe9WFAFsx69NiosLIuNAQqF/CsEdX2r4RjbhV+Zn2NqiZc9Rqu7ZmEsYwbNKEoai3wrExKR7BGD1jEndYtT0F987CU4KLjF3w48waEktExLjIEujNSG0EkQEAnOCE4pqZkyWg8Y=
X-HE-Tag: 1793237782-897990
X-HE-Meta: U2FsdGVkX19NBkmORpJetUJnbBN+oIZnAHvJaDkH/wjKNR6BHKYNrG4bX18Mb+cwSgVJpIh3HsEIRMp4NqQAL3vveNwEAEmazAoP5l4kBz46CMh1fnmfnMAKQwnX+00XkSNRQ8di6HI/KWKF7bUasvE8otxt3aTFfd80RU3aVeXT9r72RpGoMdiVueMl5+GydE7oLWhP+ZIUzef+vBsp9jAPGPrJyzJjN+Wp19HZsEQVJ9HmhsXMiS3rr3fe6aIv1tYOeaHSm+0pbxASE/Do0TPDWXc1Zxkc3e1GLUS8KB1N/EP0WTcbUhwOa9fxlkirffUKPzs/DWMagHySn7qBoDArsBG9PmsV


[ This time with 'GIT PULL' in the subject ]

Linus,

[ I just noticed I had some ktest patches sitting around in my repo.
  I just pushed everything up to my tree. They are minor updates so
  hopefully they are fine for this late in the merge window. ]

ktest updates for v7.4:

- Sort configs before writing config file

  Currently the .config file is created from the perl hash array from
  reading the applied min-configs. The order is determined by how perl
  hashes the values. This causes the .config file to be created in different
  orders for each run, and the order may determine the final value of the
  .config file after it goes through a make oldconfig.

  Sort the values when creating the .config so that the result is the same
  for every run.

- Add total test time to run output

  Have ktest display the total test time of running all the tests. This is
  useful to find issues in the build, install, boot or test run where things
  are hanging for longer than expected.

- Update reading of the git output during bisect

  The ktest bisect is an automated way to run git bisect. Since there
  currently no easy way to know if the bisect found the bad commit (I'm
  talking with the git maintainers to fix this[1]), it parses the output for
  the line "is first bad commit". But a recent update to git has the output
  state "is the first 'bad' commit" which breaks ktest bisect.

  Have ktest handle both output strings.

[1] https://lore.kernel.org/all/20261020141011.0015d172@gandalf.local.home/


Please pull the latest ktest-v7.4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git
ktest-v7.4

Tag SHA1: 2ea0984e576a2d61b0ec784deeb6d4889a794562
Head SHA1: 5b598ba5f3bf367944956cee59c6d078c53ca694


Ricardo B. Marli=C3=A8re (SUSE) (2):
      ktest: Sort config keys before writing config files
      ktest: Accept quoted bad term in git bisect output

Steven Rostedt (1):
      ktest.pl: Add total test run time to output

----
 tools/testing/ktest/ktest.pl | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)
---------------------------
diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index f94ed2e98887..66fd98b6b04b 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -227,6 +227,7 @@ my $build_time;
 my $install_time;
 my $reboot_time;
 my $test_time;
+my $start_run_time;
=20
 my $warning_found =3D 0;
=20
@@ -1609,6 +1610,14 @@ sub run_post_ktest {
     $post_ktest_done =3D 1;
 }
=20
+sub show_run_time {
+    return if (!$start_run_time);
+    my $end_run_time =3D time;
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
=20
+    show_run_time();
+
     if (defined($opt{"LOG_FILE"})) {
 	print " See $opt{LOG_FILE} for more info.\n";
     }
@@ -2652,7 +2663,7 @@ sub apply_min_config {
 	}
 	close IN;
     }
-    foreach my $config (keys %force_config) {
+    foreach my $config (sort keys %force_config) {
 	print OUT "$force_config{$config}\n";
     }
     close OUT;
@@ -3019,7 +3030,7 @@ sub run_git_bisect {
     doprint "SUCCESS\n";
     if ($output =3D~ m/^(Bisecting: .*\(roughly \d+ steps?\))\s+\[([[:xdig=
it:]]+)\]/) {
 	doprint "$1 [$2]\n";
-    } elsif ($output =3D~ m/^([[:xdigit:]]+) is the first bad commit/) {
+    } elsif ($output =3D~ m/^([[:xdigit:]]+) is the first (bad|'bad') comm=
it/) {
 	$bisect_bad_commit =3D $1;
 	doprint "Found bad commit... $1\n";
 	return 0;
@@ -3325,7 +3336,7 @@ sub save_config {
=20
     open(OUT, ">$file") or dodie "Can not write to $file";
=20
-    foreach my $config (keys %configs) {
+    foreach my $config (sort keys %configs) {
 	print OUT "$configs{$config}\n";
     }
     close(OUT);
@@ -4137,7 +4148,7 @@ sub make_min_config {
 	    if (defined($ignore_config)) {
 		open (OUT, ">$temp_config") or
 		    dodie "Can't write to $temp_config";
-		foreach my $config (keys %save_configs) {
+		foreach my $config (sort keys %save_configs) {
 		    print OUT "$save_configs{$config}\n";
 		}
 		close OUT;
@@ -4165,10 +4176,10 @@ sub make_min_config {
 	    # Save off all the current mandatory configs
 	    open (OUT, ">$temp_config") or
 		dodie "Can't write to $temp_config";
-	    foreach my $config (keys %keep_configs) {
+	    foreach my $config (sort keys %keep_configs) {
 		print OUT "$keep_configs{$config}\n";
 	    }
-	    foreach my $config (keys %min_configs) {
+	    foreach my $config (sort keys %min_configs) {
 		print OUT "$min_configs{$config}\n";
 	    }
 	    close OUT;
@@ -4534,6 +4545,8 @@ print_test_preamble 0;
=20
 $SIG{INT} =3D qw(cancel_test);
=20
+$start_run_time =3D time;
+
 # First we need to do is the builds
 for (my $i =3D 1; $i <=3D $opt{"NUM_TESTS"}; $i++) {
=20
@@ -4766,6 +4779,8 @@ if ($email_when_finished) {
 	"$successes of $opt{NUM_TESTS} tests started at $script_start_time were s=
uccessful!");
 }
=20
+show_run_time();
+
 if (defined($opt{"LOG_FILE"})) {
     print "\n See $opt{LOG_FILE} for the record of results.\n\n";
     close LOG;
