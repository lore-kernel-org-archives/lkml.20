Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF2B3BC68D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282094; cv=none; b=RkFGe3jrGFOOpcMi4cgGBpTMEVrkqysHCsdzZtfdK9rhmrA/m6VSl7IKvku00wO5AjH6sudM+9TaABrsriAp8DSm0WF3Q20aiuGiMX9DcHYBTMRVd4TLF2FKqYE6vvCxuLJrla04wLMcllugBq+TE29OBjrE7J0PnL3/6viFqiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282094; c=relaxed/simple;
	bh=GlJCfdPBx+4sfBiJ7RsOJERuYS5/ZE2a31Yyi+PxalY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHu3Sk6+rzLxcp1LgFRndx/9BeT316bcZFR05VCQ3OOyMMnEoFyYZCFiUfbmfPMZuJbiXEZEC0QrxRfTdCgJm/Ru6LGQA7loXHNB3/vK2EGadBaae8X4IZhXkOVmoUXVcK7tO4PE6PlSX1HwQ93Z6TBPeiq+ZhPBtjP2p6jNsx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrLVvDZ6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrLVvDZ6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ff680331aso27128705e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282091; x=1791886891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKWXJnuda/efS31oDzJp4kza3qL9EyXSxIuLVytYp1o=;
        b=DrLVvDZ6p7j14WPteoLyDijPV+gjPzEBbSLx6rF97IALfRS7ALWhmQ4GcQws/5hfHN
         ZBLiyT+WFsbg1ftA/pRGXnDhoXVnxQWunE0I/Vuw982GrtVT8G5t4OiVrTqs1klusmkZ
         5K3spcenYprJgxqIYmGo9FD3pxhQ/AzDzfpcP+sd0FGnjnbFG8bUoDLEsOTb4CsPekz4
         SqxYpO4fs3XEXAPBBkWnd6IrugV1rnPm81jQAW5laqq5v7QVXw+xK2/TLjjNp1tjW4jf
         1Hp/HfDELGLOGEiHyMhxLBOJzuEB1A7qPinEnuZMTLP+ZOMXDBfcF9shKeKkkP+AZOaM
         rAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282091; x=1791886891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKWXJnuda/efS31oDzJp4kza3qL9EyXSxIuLVytYp1o=;
        b=T+RW8uBwu1j8tWRtSrrvuoQy5MZetieSjZVotOyNPFquWFHGPNzGNjvnUS3plKFd5w
         b1Eqdor04bT6rMqIPtUBxP/H3DvoaHOIfBjXA0zXEvaElDZdB/D+I9Bz8zAs83vsWmfU
         enbntM84+X8+9rR+gJU7l4uuIBy9CpkfpklWrtwqT4/Pikik0B27IphkCSYdQV6F3q2/
         xsPWNRe2c3we0/X66cV+V78r2IZ/n35y3+QF5QUAohkmO0kshCCMM0rB29jx5Yw7NCaD
         EZCi+/axzmvKLX3CO3X5FZiaRi8AKYChpLPkAcdVWDkGDaPG/NnwV34n2lSWc9l5W0Z6
         djfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAH4qta59d14TywiYTA/+7aJVyQ3xiOtTwjtWXYxgXE+Jgy9Gch6xBfiofds7FTPsCZv7sd/nXkdNvhvw=@vger.kernel.org
X-Gm-Message-State: AFuF++nLsDArwVzUq3cTGN7T7l2yPK9cs++B98vO0INABoLAMjlUO8E/
	gBobRV/3UCN2Y0Yl2M1yBV6wQP1/0yLFelZExtviYhjO2ky+jw8K+il3
X-Gm-Gg: AYBFou38QnvZjhAfxWYrsHtAjfxv/55bGs2KLeongyPIisOpiup5TWWSm1STHcRbUzN
	DlwXyARvBJWufRe7YE1daGVPamgsoAhJURYM2Mq1mNL2feydh3Fbaf6ToQPNQ/PDda+AqN1FoB2
	1MJUUjs204aN+UYKH/xQ2CmKhJTQZqW+AX3Hi0dfg4rDTn7CmXrn/Hs9AnYzMcwqCyTsVgxDIP0
	7kDhs9u5A88jDGwHXYbj0U6EHLLb15n5kmyz9v9X2G0zUmxMQaxc557aQwPmwt0ycF7sF/voaPJ
	QfZVfMZi6Z3IWOKw+S9gvicUU1rTY71ngPI+HMsh0etXgr/oCMYnNQC0PfI5ORGKHOycrAMojhH
	srgQzsD/n/QE7GFUENdYcIGQrG9O1mpXuHArfuqfI4vyPbV/RuWskfwrznTwR0PqJx2lfOaLoq9
	HdlmRyFpAMumFQkFw/yO2rUi5ewB7Q98SR43fuMsCilYPo+TgyopWk5VB1PoJHj8ul1ojcT2Yfh
	KbjUVLNGJIRgczwfanN4hOPPkT6YK1WttqxoG7QfEeXJoL14R2GPKXqGfWCaVZ450nPyDwK
X-Received: by 2002:a05:600c:8b21:b0:4a0:1b14:d00c with SMTP id 5b1f17b1804b1-4a1680b47efmr159311545e9.3.1791282091018;
        Tue, 06 Oct 2026 03:21:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178ca8bc2sm58747115e9.1.2026.10.06.03.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:21:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] checkpatch: report warning with files ending with blank lines
Date: Tue,  6 Oct 2026 12:21:01 +0200
Message-ID: <20261006102119.7695-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On applying patch, git, depending on the default configuration, might
complain for any file having blank lines at end of file.

These blank lines can go unnotice by the patch submitter as they are not
reported by checkpatch.pl with the maintainer only noticing the error when
the patch is applied. This result in the submitter getting confused asking
further info to the maintainer making the review process longer.

To address this, add a simple logic to catch this error and report as
warning. Example:

WARNING: blank line at end of file
102: FILE: Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml:62:
+    };
+

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 scripts/checkpatch.pl | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..0363828b9bd8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2968,6 +2968,25 @@ sub process {
 		my $herecurr = "$here\n$rawline\n";
 		my $hereprev = "$here\n$prevrawline\n$rawline\n";
 
+# Check for blank line at end of file
+		if ($rawline =~ /^\+[ \t]*$/ &&
+		    (!defined $rawlines[$linenr] ||
+		     $rawlines[$linenr] =~ /^diff --git / ||
+		     $rawlines[$linenr] =~ /^-- $/)) {
+			my $context = $rawline;
+
+			for (my $i = $linenr - 2; $i >= 0; $i--) {
+				last if ($rawlines[$i] !~ /^\+/);
+
+				$context = $rawlines[$i] . "\n" . $context;
+
+				last if ($rawlines[$i] !~ /^\+[ \t]*$/);
+			}
+
+			WARN("BLANK_AT_EOF",
+			      "blank line at end of file\n" . $here . "\n" . $context . "\n");
+		}
+
 		$cnt_lines++ if ($realcnt != 0);
 
 # Verify the existence of a commit log if appropriate
-- 
2.55.0

