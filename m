Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58783B813D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582762; cv=none; b=M7e7gEqU9H4KPkexLEd5RJOi8CK50UygGRJIAgbIttpJyOaDu/M0Xp+7auCY7ISqAdhlMeeIZP0HT26jQIeOTPBVgt4QtBF1kNnjoKD45C5Sjulqvg3SKUJnpVE7SzILUou1yDxj7ztuQC0N/5bGjb/ERZyhzSovxdy2NW1UJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582762; c=relaxed/simple;
	bh=PQXZjBjrsjp9GYj4AvXgR7u5WgJ14naqr9fTVj9p8MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M9fBZTx4+fP946u6/+/QJjHWQ2jRybtiwFIRMutxNx60MkcikTMc075xm5fNxQOBWxjTlw/sYBd7HzG6WUAgC0Q2TerHiyvrfedlRXqFkbkRZvEjgHBD076xatZ/P5Cwy9rCknaFsB+CWuh68h/PKzCBPhanvoW1Qqy4NZsHOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=VijeZghR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CtJYAYRm; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="VijeZghR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CtJYAYRm"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id BE96EEC007A;
	Mon, 28 Sep 2026 04:05:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 28 Sep 2026 04:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1790582758; x=1790669158; bh=QWrEbWbu7S
	cexwQjcS9oXjuHvyEC6XUbPv+tot1HLFw=; b=VijeZghRxNOWC0rmDSpRN3ab+0
	T0PAVzlDwrgBmZ9xmF306lGG+8sp5TDwaPcp0gh6oiXFsYx8s/U1qn0aB+wlDv+W
	7sr0E+xQG+Cc6ANXA/m0A1yjz0XPNXozYQlK51+2U5I/sk5aPDF+FJgovUNAtKD+
	IJi2B+2fLmwW5TW68j6c6W167Xkjzkr0M5T7g3ZKFbxZbVHeph4wTGeGO0Ez33/q
	QAYlHwUUh3l1VjCHNZGltP/rW9GAnJiGS9D2uz1irhI2t3m7q1aGTJL1UoOcIA4e
	IkUCBuO1Rc6xBbPj48yzmt9wBQ/E7HLVlLqNVu3o6/Kr7yY4VNLmro4BtQPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790582758; x=1790669158; bh=QWrEbWbu7ScexwQjcS9oXjuHvyEC6XUbPv+
	tot1HLFw=; b=CtJYAYRmxPcY2f7EtffL+OsyboG/tLsMUE6i3+lMWVUwFPBYP8a
	IQg8JV9ZtbrfQOXiB5mXNNbGHxR9feZcr/7rTru6h2JFtp46CWucDZlIGiNW/Vp3
	ztQLH18cjsN/34Ahyxw1/BpKxelpFe6XfmN4GhKtXyK7+Y51b6ccTKYcUIfpixo/
	d2DXbgn/Owt3dtPX71PpMwAZu8tO2Kat8bOllX+A44/fWrnrSs6BjHV/4X2Z2+4h
	t8BYaCxn1VHld3VhA67+tYHmYmVQIl+wTuxMGcDQunPneRoz9Awj23b6ryKcxP1P
	aK58YD/31MeIaew/nLxRhs+b7gjYd8sjTpQ==
X-ME-Sender: <xms:5h-6asPjLfz3I4iHiOsDz1Te7S6ep6Mu_GEBb8tBLoBLK_0ciRCvHA>
    <xme:5h-6ap_sHQ_74AD9-dJRMlHw2FvaReoXuk42Mg9Tdm5Ra2LUzYTPXE6p3aHI6-t3a
    YIeGai2DfDjlVziZoeeUg8VdRSAsGq1UBZmrtLBCEZH1bvAcYAMPfcg>
X-ME-Received: <xmr:5h-6aoSn0sR1pGwxFzq8qwXmxXI8Z6rF58dfdaFmVfhsSRQy27XV_Ecv6giY>
X-ME-Proxy-Cause: dmFkZTFVkEWH2jzR3XiBpbEmdB1c1RxCkMZbnNztqgMlgkZ3XJYt8kAzZnuCZ9Aci7UQex
    ouf6/a7AsBxQo3DDuCpRpr/S7m9wZHHsFn2d3n6iSDVxdd2lovWf59cIk2Vg6W9j/UhAeb
    s8pn8G22meUR9x1vsEkGa5aAV5WRJH92WVStC292IL7DJmVAsL6aDuTV2Fo28b5+r4pWXl
    JHr6WjhJep45Yl6xx4KJH70jD/ZV2J+TOXqtIGA0Tld9/WGWzmE63aHEB8IqeCh+w+y3AS
    2ALYqpWb4xUF8c3giSHKOZP5H9ts8Xk9CyqrAvYgVxmZ15JwqXz7/+qjUT0LlQPPi+A6uD
    EAYzpHmZmDlHfJHv+oZiY9SJE579Ixl+0cAElboE0TtQUv8Dv7Vmon2HiB/TW4xkHgc20n
    soIisbMS3ZP5j30BDsbPyudSdwzNcXW0BqVXuHRnwEya8wG3nLTRW2AqULr11B+O19AML4
    w7qi2XATC6tK4irIp/uJl4GwZAMJJgLUWeW7x1faMc8ay0TkGR90VB68YCbAjJt5O4zoAk
    MHaUYi6j+WKWgj2D6a4xLAatRMD/V4Lu6rH1n1XAuroNXU+dswGa42K9vkZpYX4rzTOfOR
    BGFblp9Lcx792EIfrT/zhj3jo2Yobv+QKzVvp850czFdEjilEAvUPghMFckg
X-ME-Proxy: <xmx:5h-6ajn5Ac_8IPOp0m4K3alXsoCUe9Od2leuTEXPzWEM6_XRHg1k9A>
    <xmx:5h-6agSJjcUqdMMT3YfJke7oinFSkQ-YjshhE3Cxnx66UWNWFbC8bA>
    <xmx:5h-6apM8o1wShkQE45_wPUXpIJewihDN5BKWVjevSw7WgzBWmaj0XQ>
    <xmx:5h-6ahXwW_OXa38NFgojDyH7jh7BnUY8SlaEz5qARWIPTLnTVsxKiA>
    <xmx:5h-6ashlL__SAxq0VNORQZAFEjlg5k2ktTUXPYDGZNC9mni0qPWaouSq>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 04:05:57 -0400 (EDT)
From: Sabrina Dubroca <sd@queasysnail.net>
To: linux-kernel@vger.kernel.org
Cc: Sabrina Dubroca <sd@queasysnail.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Subject: [RFC PATCH] checkpatch: check Fixes for a Cc: stable tag
Date: Mon, 28 Sep 2026 10:05:02 +0200
Message-ID: <1e5824f7bb8f5d32783c5b47ef4c06b1fc59969a.1790437098.git.sd@queasysnail.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I keep forgetting to add a "Cc: stable@kernel.org" tag to my
Fixes. Not all fixes deserve one, but it's a good reminder.

Only print a CHECK-level message if one of the Fixes tags belongs to a
commit present in a released kernel. Fixes for stuff that's only in
-next should be fine without the Cc.

Assisted-by: LLM
Signed-off-by: Sabrina Dubroca <sd@queasysnail.net>
---
I don't deserve the credit for more than "suggested-by" on this,
I just fed the idea to claude and it produced this. It seems to do
what I wanted, and looks fairly reasonable to me (as someone who
doesn't know Perl).

 scripts/checkpatch.pl | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..8f675445ba51 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1292,6 +1292,16 @@ sub git_commit_info {
 	return ($id, $desc);
 }
 
+sub git_commit_in_release {
+	my ($commit) = @_;
+
+	return undef if ((which("git") eq "") || !(-e "$gitroot"));
+
+	`${git_command} describe --contains --match 'v*' --exclude '*-rc*' $commit 2>/dev/null`;
+
+	return $? == 0;
+}
+
 $chk_signoff = 0 if ($file);
 $chk_fixes_tag = 0 if ($file);
 
@@ -2687,6 +2697,8 @@ sub process {
 	my $fixes_tag = 0;
 	my $is_revert = 0;
 	my $needs_fixes_tag = "";
+	my $has_cc_stable = 0;
+	my @old_fixes_without_cc_stable = ();
 	my $author = '';
 	my $authorsignoff = 0;
 	my $author_sob = '';
@@ -3085,6 +3097,11 @@ sub process {
 			my $email = $4;
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
 
+			if ($sign_off =~ /^cc:$/i &&
+			    $email =~ /stable\@(?:vger\.)?kernel\.org/i) {
+				$has_cc_stable = 1;
+			}
+
 			if ($sign_off !~ /$signature_tags/) {
 				my $suggested_signature = find_standard_signature($sign_off);
 				if ($suggested_signature eq "") {
@@ -3309,6 +3326,15 @@ sub process {
 					$fixed[$fixlinenr] = $fixed;
 				}
 			}
+
+			# Cc: stable@vger.kernel.org may appear later in the
+			# tags block, so defer the check until the whole
+			# commit log has been scanned.
+			if (defined($cid)) {
+				if (git_commit_in_release($cid)) {
+					push(@old_fixes_without_cc_stable, $herecurr);
+				}
+			}
 		}
 
 # Check email subject for common tools that don't need to be mentioned
@@ -7869,6 +7895,12 @@ sub process {
 			WARN("MISSING_FIXES_TAG",
 				 "The commit message has '$needs_fixes_tag', perhaps it also needs a 'Fixes:' tag?\n");
 		}
+		if (!$has_cc_stable) {
+			foreach my $fixes_herecurr (@old_fixes_without_cc_stable) {
+				CHK("MISSING_FIXES_STABLE_TAG",
+					 "The commit fixed by the Fixes: tag is already present in a released kernel, should the commit have a Cc: stable tag?\n" . $fixes_herecurr);
+			}
+		}
 	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
 		if ($signoff == 0) {
-- 
2.55.0

