Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AEB4A5C51
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439758; cv=none; b=d/Pmg5Kt3iHrl0EQD8bMEFqH8tGEBR1jZj4yZRUkNaCT3NCrrnXfyh1dqfaf1YMeRrDa0GF06i7DjQS3vjGf9ErGMzNS9yD5AAtOhOolDcaQFAPXohUUYBNkiLDqVnNRfWCfYbAYoc93iEra9aMlkOAcNDDCVs4MCreb/AYwrjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439758; c=relaxed/simple;
	bh=ti3X/FfJPddFDTM3Sp385gW31mRXom1WiuQysL66Jxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hwstQEjd9m8Z7878SL5DOhryG+dmDtKHvAeHU2CNfdmjSONGyFoqoPU7vKhVmWQfqnaX7lKOemqigiYDnns1+bgPZcSqVtvRrMItv1BFNr6t6tyVSmA8reXNp8O44MoAItw87GJJYsJWgzi8BPi3cOCSr7LkaM6lRtftqM571EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=CZBAhX6l; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="CZBAhX6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1788439430; bh=ti3X/FfJPddFDTM3Sp385gW31mRXom1WiuQysL66Jxs=;
	h=From:To:Cc:Subject:Date:From;
	b=CZBAhX6lYrniC/wfN80BSQNv7izrwRBpkItTBsE3keDgsvp6CS4o2m6uhL/w56nwY
	 LXxzd1yEb0XIDJsZ36YKchO55Vt4Z6Rq1Ae7BUNpuPOIz8cT7MlOlm7fvP88tTompU
	 ZxV9rh07a8P1EAEEVCcv7q3Nm5u9vGCu7wHFKemE=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <phahn-oss@avm.de>)
	id 6a996b86-c6f5-7f0000032729-7f000001c7b2-1
	for <multiple-recipients>; Thu, 03 Sep 2026 14:43:50 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu,  3 Sep 2026 14:43:50 +0200 (CEST)
From: Philipp Hahn <phahn-oss@avm.de>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: Philipp Hahn <phahn-oss@avm.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] checkpatch: Ignore symbolic links
Date: Thu,  3 Sep 2026 14:43:43 +0200
Message-ID: <06c4fbd7eb5f0ad8f3a7b54ff12851e7ec370bd6.1788439374.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: FRITZ! Technology GmbH, Berlin, Germany
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1788439430-EDC55B9A-D943FAE4/0/0
X-purgate-type: clean
X-purgate-size: 2440
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: A3E78A0303  external: no

If a commit adds a symbolic link, the target file name is stored as the
content:

> diff --git a/include/dt-bindings/clock/qcom,sm8650-dispcc.h \
>            b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
> new file mode 120000
> index 0000000000000..c0a291188f28f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
> @@ -0,0 +1 @@
> +qcom,sm8550-dispcc.h
> \ No newline at end of file

checkpatch handles this as a normal patch and issues 2 warnings:

> $ scripts/checkpatch.pl --no-summary --terse --show-types \
>   --git v6.11-rc1-1-g99447ef003d19
> …:136: WARNING:SPDX_LICENSE_TAG: Missing or malformed \
>        SPDX-License-Identifier tag in line 1
> …:136: WARNING:MISSING_EOF_NEWLINE: adding a line without newline \
>        at end of file

Detect hunks, which add a symbolic link and ignore their content.

Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 scripts/checkpatch.pl | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a63..1a875e0d8b084 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2692,6 +2692,7 @@ sub process {
 	my $author_sob = '';
 	my $is_patch = 0;
 	my $is_binding_patch = -1;
+	my $is_symlink = 0;
 	my $in_header_lines = $file ? 0 : 1;
 	my $in_commit_log = 0;		#Scanning lines before patch
 	my $has_patch_separator = 0;	#Found a --- line
@@ -2904,6 +2905,7 @@ sub process {
 			$realfile = $1;
 			$realfile =~ s@^([^/]*)/@@ if (!$file);
 			$in_commit_log = 0;
+			$is_symlink = 0;
 			$found_file = 1;
 		} elsif ($line =~ /^\+\+\+\s+(\S+)/) {
 			$realfile = $1;
@@ -3493,6 +3495,9 @@ sub process {
 			     "added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
 		}
 
+# Check for symbolic link
+		$is_symlink = 1 if (!$in_commit_log && ($line =~ /^new file mode\s*120000\s*$/));  # S_IFLNK
+
 # Check for adding new DT bindings not in schema format
 		if (!$in_commit_log &&
 		    ($line =~ /^new file mode\s*\d+\s*$/) &&
@@ -3646,8 +3651,8 @@ sub process {
 			}
 		}
 
-# ignore non-hunk lines and lines being removed
-		next if (!$hunk_line || $line =~ /^-/);
+# ignore non-hunk lines and lines being removed and symbolic links
+		next if (!$hunk_line || $line =~ /^-/ || $is_symlink);
 
 #trailing whitespace
 		if ($line =~ /^\+.*\015/) {
-- 
2.43.0

