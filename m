Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37B43E4A2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463898; cv=none; b=ZIUJacxBDxxlHgS6fS+JhpQ6LNHkb+s7/aJjYtUqATJFiig8FY4g7RvoF2HFBrF/xf6lmZSB3nIFItYsDD3rnWHyp7MTO4D0iAkyZQZlxHbT/nujxj3jM4jpy5aKh1Pg7N2VjyCUmUAB28/64lpd4FW5KkNCH4wBZ93sVtZniXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463898; c=relaxed/simple;
	bh=3RtU1bqEBo8yscKERbSQ5DwgP6BRhn6hRQmtj2q5A/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t5q4j/kV7dYMN24EpNz7yjEjd41ATsI1BnjpftVCsb04l41+Uwj8YdxaWcGJS+If4TsAvPefyaKC6znA6UYyWLT1wheMi1aCZzTXRiSaTgukzlArLu1Isvcyh/X4yyvpRQY66e5P5Kh0dVopTMYivaF6mCjii4PXE8/76+8gk0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HatkTD55; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HatkTD55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED691F000FF;
	Thu,  8 Oct 2026 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791463896;
	bh=um9rtr/l7vEM8Z+qsUwa1XxX194caaO3sS1Kms+aTfQ=;
	h=From:Date:Subject:To:Cc;
	b=HatkTD55Y9KKXit0Dw/5Ap4xVIWqmyxp6Xwz3PQQlRB0sb1aaXN2QebEr82Ccquow
	 GsrsVIPxI2MA8I1u70rUpp903NnzskXl8WlFh7CIePVWpxo3yUZMaMGS6lygXginLv
	 S1RKCEWaYDSKq/bQe7KfXo6Iu6CXz2l0IZSMTHSo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 08 Oct 2026 08:51:19 -0400
Subject: [PATCH] get_maintainer: only use THE REST as a fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3aTQqBpfBXjYSkDrGI1bTUmh
 He34GEO3+WflRKiItG5Winio0mfoaA+VeRnCRNYh2JqTGNrYxxPyPwQDbkMkfMMjkiZR1mWXvy
 dre06OLGtG1oqmVfEqN/j4nL9O737G3zeu7RtPxCewA2EAAAA
X-Change-ID: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, users@kernel.org, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-a72a9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2901;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=3RtU1bqEBo8yscKERbSQ5DwgP6BRhn6hRQmtj2q5A/0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKOT7yS9dYnryPwc8KUuLpI1hovhvlr94j/+VYVGdOcI
 NVlsnByRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIncvsLwV/pVcWzBVWejxMSv
 WxqlRTbeUpAxU8v/JuYxt9Js3TofQUaG+2e9uCVSa88XHvwv7nrSa7LdhjWcU50KBfNjens5FVx
 ZAA==
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

THE REST matches every file in the tree via "F: *" and "F: */", so
get_maintainer.pl currently adds linux-kernel@vger.kernel.org to every
patch, regardless of whether the touched files already belong to a
subsystem with its own mailing list.

Only add THE REST for a file when no other matching section provides a
mailing list for it. Files that match no section, or only sections
without an L: entry, still fall back to THE REST, so every patch keeps
reaching at least one public list.

Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
LKML has become mostly a firehose of patches that are already going to a
subsystem list. The reason is THE REST: it matches every file in the
tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
single patch. During the week of Oct 1-7, 2026:

  - LKML carried 13,641 messages (~1,950/day), 90% of which were also
    sent to at least one other list;
  - with ~2,100 subscribers, that is about 29 million deliveries per
    week for LKML alone.

This issue came up during the 2026 Maintainer Summit and the consensus
was that "always include linux-kernel for every patch" was never the
intent.

This patch makes THE REST a fallback as initially intended: it is only
added for a file when no other matching MAINTAINERS section provides a
mailing list for it.
---
 scripts/get_maintainer.pl | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700d4a..966595c3a6de 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -959,6 +959,14 @@ sub get_maintainers {
 	    $tvi = $end + 1;
 	}
 
+	# THE REST matches every file, so only fall back to it when no
+	# other matching section provides a mailing list for this file.
+	my ($the_rest) = grep { get_section_name($_) eq "THE REST" } keys %hash;
+	if (defined($the_rest) &&
+	    grep { $_ != $the_rest && section_has_list($_) } keys %hash) {
+	    delete $hash{$the_rest};
+	}
+
 	foreach my $line (sort {$hash{$b} <=> $hash{$a}} keys %hash) {
 	    add_categories($line, "");
 	    if ($sections) {
@@ -1295,6 +1303,23 @@ sub find_ending_index {
     return $index;
 }
 
+sub get_section_name {
+    my ($index) = @_;
+
+    return $typevalue[find_starting_index($index)];
+}
+
+sub section_has_list {
+    my ($index) = @_;
+
+    my $start = find_starting_index($index);
+    my $end = find_ending_index($index);
+    for (my $i = $start; $i < $end; $i++) {
+	return 1 if ($typevalue[$i] =~ m/^L:/);
+    }
+    return 0;
+}
+
 sub get_subsystem_name {
     my ($index) = @_;
 

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4

Best regards,
--  
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

