Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ABF47F3BD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000868; cv=none; b=N3JmgtLNeRaHZrzonS6sDoiNnqjQm0oMl/VfJarKrxZl7L8CijraAAn0C/RcjStKDSrkCq2LjznJ2f/lquY93K+wowAwqxri9QMPeaLQpFb38+E+QGpsy876dVeK7gZPMFLDj2V+ZmPAUNakmi4RWG4f9GD+Xk0VTzrGY8eMVW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000868; c=relaxed/simple;
	bh=xWhN7uZ2slREjpQRvcnRYMjExEZdl5HT9HVSkK4bQNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=azDLlyw6KPBj+QRjDxHuHu/XPf+gkb27fbNaj8u0PahGL7Ax6ykyOSv1I6aLBN6jx75tPpsXYT1R6RU+M0oo99zARKFxVE1XiN0VUfcSvjIgJw/moY7ge0gcnxKwfXF9Epn2X2WpD+sMgd2QFRl+vmhxp/CT9trIad4a469VRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=Mr119seY; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="Mr119seY"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b19e291cc6so4113057eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000866; x=1792605666;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPejdbRa49foOItsbGrXpJOqsHr6pGxtWCTLPGq5ZfQ=;
        b=J15Z2A30VF4Se9cNWl6t/OqJXf8i9hWWmYyvYJ30IksRDih/widfwzrVXZo0XF7eHd
         5uciPj3XFLCaSepJNNYZVcRjcyhycalctgaCW+DnV+Xs98PZnUdbZ7Lk2ebRmVWaZTuT
         2UVE8l4bauz5iZLM55uzhFyQhoN8GMxmPGJu2afeIMnxISxhsz4DUIHTvAffF4vXs0JC
         sny04BWTIkN3W2RZf5u0ExErOm53VJCdStPqM6sdCoZh09bIcjIJprhkS9BZ/SttKOMM
         iUBxDlknNdISCDAWTMDqvFHr5WINaqTsU9ouYJvcarr21JONolQfzcu6MJenJ2x42T3H
         ez8g==
X-Gm-Message-State: AFq9FYIdWgLQkRc8Ye6rIJVWFX4DNYLvUJ5DWnRHoP1VJmnRNkg17l4D
	aB9G/Peeko9X3oo/IGT3lsmk0tMLl74lvsgYhYKzi6XuaOe0W0xpaIm4rGjDK1zM
X-Gm-Gg: AYBFou0ABR0gxBGytRrktjFN2xnteEeJy5rok2YKzNpAq/h7ZVAgj/yyonEyYRibOKN
	LiTwi932OzKWDa4wxV2ByRF1J978TJy6I3PxojSKXpQz9UIVVeggjlcDOf5k5nVErje49IRuWvo
	IPQFegG4oufcLnSRmOTQbVevszJtdWxzN04yhXtHj7cPidPdcn280+Bn3Fi+G7Qy5FNo03HCtVs
	FuDX1ZVdPQ5HUZhkluFpAyBRHV/R6HbLKqLOjrkFKzg7g9wuv91XHYtSB7wFGyBgSb7nWWHwE93
	YALm3XMtgaBeU+kE7Zo+5fHcwv1tbEu23yWZAOeA9d3KdhOmuSsDzLNaN6d9hb0qAONpWhHzQtP
	DwHfn1mPY6uBoro+A5OGZUEpptM8WDkv3CCB4A17SZjHg1kiKqeVBGLY/5N2O8fosHvDPxMt3z4
	mBny7qHD0C8jiyHHPrFpjRDztIL+x0+Fa4KfHs+3CgbJ1WBYS2SjIWu80g9w90M2AvzP/qWePp7
	9t8GDT/ptOLO3Ati2C+J/xlNy95Wf4GAyeaRnJJKBq0hbJrZRe3kT/7zOLDZeKzq2amwlMLXh6w
X-Received: by 2002:a05:6820:1506:b0:6f7:3c09:c700 with SMTP id 006d021491bc7-6f73c09cb90mr7343219eaf.49.1792000865851;
        Wed, 14 Oct 2026 11:01:05 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ef0023dbf7sm15776709eaf.4.2026.10.14.11.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:01:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 229156035D;
	Wed, 14 Oct 2026 18:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1792000863;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pPejdbRa49foOItsbGrXpJOqsHr6pGxtWCTLPGq5ZfQ=;
	b=Mr119seY5qFSUmwu92qy37/zFPMwetYue3WX/AjjiCpe1EgEULmyFUiWMgX8C2LXiLWKQW
	2qwTVQZsAk/9FG8rxtVEei7ZcuW9A/SbJ9IdJS6yFbp0SGC5iaR5AMj25cadLxVkYDgYS0
	tVv3EnIFmI5w66Ao00Tju/PtmCh1VX9W++oG0GQqpIHx+rVdj68+pvAsC/u/Us7i/Q5fbn
	sJOBXeHjVnWzoFC3iF0txH3BrAOMJ77LEBBLJzR1SAwxds7WLQLyaiNy+RoYHS0OCybnzY
	o2reGCj4FlpOnP7ew0I7jf7EpOj0QMnaakzNgmEh0ibQhTYkk1fADjLwrAhwkg==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Wed, 14 Oct 2026 15:00:52 -0300
Subject: [PATCH] ktest: Sort config keys before writing config files
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-ktest-kconfig-perl-hash-v1-1-66201a2dee82@marliere.net>
X-B4-Tracking: v=1; b=H4sIAFPDz2oC/yWM0Q6CMAxFf4X02cYNjBJ/xfjQzcIqOkg7jQnh3
 wV9PDf3nBmMVdjgXM2g/BaTMa/gdxXERLlnlNvKULv66J0/4FDYCg5xzJ30OLE+MJElbNzJUfD
 UNm0Dqz0pd/L5lS/XP9sr3DmWLbc9AhljUMoxbdOo0kveP8kKKyzLFz9VvhebAAAA
X-Change-ID: 20261014-ktest-kconfig-perl-hash-3070ab1a8383
To: Steven Rostedt <rostedt@goodmis.org>, 
 John Hawley <warthog9@eaglescrag.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792000857; l=2761;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=xWhN7uZ2slREjpQRvcnRYMjExEZdl5HT9HVSkK4bQNk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAlVl/EneqbLdbbRY/X1nrit4yfDF4wX/uvKw2GdhwujSOLCZG/fPk4TefuI6wiCi6in9NnfUM4
 T7hb6fvB5nQY=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

apply_min_config(), save_config(), and make_min_config() write CONFIG_*
lines by iterating "keys %hash" with no sort. Perl randomizes hash
iteration order per process by default, so the line order of the resulting
config files is not reproducible across otherwise identical invocations.

When two of those lines are mutually exclusive members of the same Kconfig
"choice", this can change which one "make olddefconfig" keeps,
nondeterministically, from run to run. Observed with
CONFIG_DEBUG_INFO_DWARF5 vs CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT: five
consecutive "-C" builds from identical ADD_CONFIG/MIN_CONFIG inputs
alternated between the two, which is enough to force a near-complete
rebuild each time since CONFIG_DEBUG_INFO_* affects every object's compile
flags.

Sort the keys before writing so the same inputs always produce the same
config output.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/ktest/ktest.pl | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index f94ed2e98887..1945f6ee2483 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -2652,7 +2652,7 @@ sub apply_min_config {
 	}
 	close IN;
     }
-    foreach my $config (keys %force_config) {
+    foreach my $config (sort keys %force_config) {
 	print OUT "$force_config{$config}\n";
     }
     close OUT;
@@ -3325,7 +3325,7 @@ sub save_config {
 
     open(OUT, ">$file") or dodie "Can not write to $file";
 
-    foreach my $config (keys %configs) {
+    foreach my $config (sort keys %configs) {
 	print OUT "$configs{$config}\n";
     }
     close(OUT);
@@ -4137,7 +4137,7 @@ sub make_min_config {
 	    if (defined($ignore_config)) {
 		open (OUT, ">$temp_config") or
 		    dodie "Can't write to $temp_config";
-		foreach my $config (keys %save_configs) {
+		foreach my $config (sort keys %save_configs) {
 		    print OUT "$save_configs{$config}\n";
 		}
 		close OUT;
@@ -4165,10 +4165,10 @@ sub make_min_config {
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

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-ktest-kconfig-perl-hash-3070ab1a8383

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

