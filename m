Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF13C1FF7C7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791594831; cv=none; b=HvzP2lg4hmiTdqRIaynxBE3yk52FFjeQgOnuLcYWu7iBykVc7iLEib94etdC95x5UwA5ZAHIjQx1tneqAbt1fOTP4xgjSinH6EVZ6tsdiAzeU33R9rwhkyWJFdgWuF5kRtXYmhIMpxeOOk9ptupX3UAkDgE8bSaN8fPPDX9b89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791594831; c=relaxed/simple;
	bh=kQzWih5ejE0NZ/vC70FcH3/Pju16YhN/IGAfTsIr6Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wz+S5VWQnor9KKYp16A08HmV/cLO1Vs3BnBXyLCE0gmTX+HjuSnrCYHRrbf8Ji/TywPhnH4TFPykQnfYaK/FZU55MzcFLhMDRyChKxZjcXw9uSeM3R6Mv1R7bEWmE6ZkQmK0sljtrjdRah78cylmw050ujzBTuQhPkCA2xAeV2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=w3990Kts; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="w3990Kts"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4f6d98ff6c7so249463b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791594828; x=1792199628;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rP11hVOvrUO/hX8TlyHW6EDw6cTLwAPQWbfPEYfkp4Q=;
        b=pCYlyYvPMi7P0yUub8nxhJWGKCyqd+6SsUqwX8UwU1w5+Kd6MCCNwdVghGUtII3G0C
         /EP5MDLrfD8MUhBfytIVuLpqjs7/fsxkqV3xr9EAO1dI/tOr2nY/pLApcbZi7AEUDWYv
         7noNUSLRqpApuWTdP1E+QS9sqxCdUxpa2cVNwmhkLh6GBskLT3x/miVoR3ge5NVWpyYj
         GGNJvuYlbngiIRkmos6FgeGz0aviOK9/uHuMPM0AqIFMYNrrG002Cjr05VqfI/OaOuEg
         Be4ANNCe3pxFKjAf+Co7xsTtLNs1w3O5bo9I3L7nLgkF6ww03VoDkSV6/5g5cfDH9wdl
         Nayg==
X-Gm-Message-State: AFq9FYK08rLvgeSEDXMJBz0xw/T0FJ5Qlj6QLjt1ZCrIict9ko+1jMFV
	OuWoRlL4tj505Lljpel9LzMGPMVOjHViC5nI/too5ydC4F5FwGwQfV3a2MeTBUJp
X-Gm-Gg: AYBFou3vgI1ba4Lo+HTQ5/fFuCisA6Otu37b8reZ+BTScFgQwzNHtWhpVEiy7BqUjd0
	zWpWgakV0/OvYohC5kdhtFaLYzkbGmAmMPpicAaS/crUL314U3JlEUNbOzOLfhlwQqjUGT+Fmjk
	4kuOuwj7YaQT+VeVTLH/WgBYDMPPhIObb0Mf0p8LHCUr7oCJ7fJk0lJR7TKzjpNVhvNJiYOVahI
	7TnKSFWuSGbBrLUqqSFE4zMq6W1YN2OOIC+gk8jICtBihQ+l/Ii2Qxhwp8er9EEFM3kVRMUZLFx
	6cptnHZ9jlPisDPeoywKPbWBHFZRZ/3prIZlULOtWkUgXdRO5UNl48SGE+Xo+QN3WH06mVk1yfY
	DUuoI2CfF3FAxn3KllVbwVKooyBvO2lay6LvDzmRoRJDNbBCVF0npKivPre+Tb1CMxGAlHNdSI/
	KU0nt99MX3X9lFMImGf5lOhcNLcwILZlFGmrjmG8HEY99t5Z4NpbkdmbG+8GYq4YdlgvRWUbDKW
	vnJZRsyLEAF9C6RHXgkF+zv2+sZM3gj2T9Mq/g9hNXPrxMB3u+HtZMep1lkcDIQYWVNJfve7Ef+
	d5sDZeLhW5c=
X-Received: by 2002:a05:6808:30a0:b0:4b9:e6ab:d07b with SMTP id 5614622812f47-50c5483b8a7mr3564103b6e.27.1791594828166;
        Fri, 09 Oct 2026 18:13:48 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1674ddf8sm3812260b6e.4.2026.10.09.18.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:13:47 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 445B8605EE;
	Sat, 10 Oct 2026 01:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1791594825;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rP11hVOvrUO/hX8TlyHW6EDw6cTLwAPQWbfPEYfkp4Q=;
	b=w3990Kts7LtcrAL66atLci3mh2+VjkLBwzgEOOy0LhRv39nK7wqdDxoBq+/p7Rfa+0zuXu
	C3oA148WvianAm59V+ujc+eS859HAjE2a6tSf9jD+TXCAvbF5Q9iGA9Vk30Qi+XAGY5+n1
	zHruu4UPztK3jUmaNbY+fPS2v0YKwvRtmiTFjlpgaX31AwL1/tm2/sx4v33wIcs3ZNH44W
	Q0K9M7M2IxhHstTknaQNDjA1ZqMULdPQrqEiH1/0m/rvY04P4PHimmKjoHdrZtLjQQa4r9
	ntQjhQ38UfpAKyMUg+TdPgwR89CJZR1jWxM7vFPMpKkO0xtrAxwGDDZ3kUeDAA==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Fri, 09 Oct 2026 22:13:23 -0300
Subject: [PATCH] ktest: Accept quoted bad term in git bisect output
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net>
X-B4-Tracking: v=1; b=H4sIADORyWoC/yWMQQ7CMAwEv1L5jEUaImj5CuKQBDc1iLSyA0Kq+
 ndSOM5qdhZQEiaFc7OA0JuVp1yh3TUQR58TId8qgzX22BrT46OQFkxcMLBSLOi73g3uZDt3IKi
 3WWjgzy95uf5ZX+Fe1a2zGcErYRCf47hNk3DivH96LSSwrl8nZzZ6lAAAAA==
X-Change-ID: 20261009-ktest-git-bisect-a894f472843e
To: Steven Rostedt <rostedt@goodmis.org>, 
 John Hawley <warthog9@eaglescrag.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1791594820; l=1449;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=kQzWih5ejE0NZ/vC70FcH3/Pju16YhN/IGAfTsIr6Hg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBILB1+Aipu+/Ck3sJegc14t3FBXYjo4SG7UUnCWW11Kl1wa3fCH7BdqiFGn3JQFc5D366kbXqA
 0HsghvhvA+AU=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

Git commit 0c0f93e7fa64 ("bisect: print bisect terms in single quotes")
changed the completion message to put single quotes around the bisect term.
run_git_bisect() only recognizes "is the first bad commit", so it misses
completion and continues the bisect loop with newer Git.

Accept both quoted and unquoted forms to retain compatibility with older
Git versions.

Link: https://git.kernel.org/pub/scm/git/git.git/commit/?id=0c0f93e7fa645c1058226a9bfde9e2b4441edf96
Assisted-by: LLM
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/ktest/ktest.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index f94ed2e98887..9d63a1dcdb3e 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -3019,7 +3019,7 @@ sub run_git_bisect {
     doprint "SUCCESS\n";
     if ($output =~ m/^(Bisecting: .*\(roughly \d+ steps?\))\s+\[([[:xdigit:]]+)\]/) {
 	doprint "$1 [$2]\n";
-    } elsif ($output =~ m/^([[:xdigit:]]+) is the first bad commit/) {
+    } elsif ($output =~ m/^([[:xdigit:]]+) is the first (?:bad|'bad') commit/) {
 	$bisect_bad_commit = $1;
 	doprint "Found bad commit... $1\n";
 	return 0;

---
base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
change-id: 20261009-ktest-git-bisect-a894f472843e

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

