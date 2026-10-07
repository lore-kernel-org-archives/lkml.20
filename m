Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F393431E71
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376134; cv=none; b=rBB6izqwtsMSv6TWKntj6u8wmBDtrs/IjuUISnb7shaHF/sNqOGezkWDEHpv+PQv26iGqPUvm13bCo40B6O6c7PQRuslIWJCkvWC92gUJN013sEk5iUmENl0OJJy23qyCpQRmaME5BNXsD5yYH2Ujom/Zb6nyaJW/l3KSADyRUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376134; c=relaxed/simple;
	bh=kUNSyhqr7wwPpgr6JHigMNODV1VFhD0+ZHL0SkSJEgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cI3z4JL30WlUFRSYL+FEYaGYie6HgY9/kkkgwjjDyvtVItdvEg1H6klNacaFty4MUc4Ab1YCnKCmTMlpi9wdmonlrI7huO30FTec+g5K0YHfVnpoTazUGv4mVueLKl0BtB07Bu8L4CXSHPaQIcBo5iHAPmnfc+PCStcHOQ/PNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q27sVlYM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q27sVlYM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso12608075e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376123; x=1791980923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekgbizW9bGAoIiJnzTpgaFhyvoePYHGFnV7RXrKiVVY=;
        b=Q27sVlYMXtq8PkGvKqvIK+nzaKE5cMWx1abKxdGAvhF/ucXsPhq7JgiO5zO9HSE/sA
         XWyZdnFyEX0j9cyH15V1Ggr4apmCFziRC1UXWN2jLexDT3iTp+obkdBP/P1GgneR9+Ym
         byA8utRjW6MAdUHql31oId1eiUUED4Oo5wI53mbJu+4TSLRqXQDLMbwqz5PF+SGx7Err
         u0St4xtX1IQU+gYOBecEHs2/UUM1APmmlaA+BZTHfyvuUmqcPkb8oTn8HSguG6MsjwAy
         Juq69kvUm2yTsJ2EObPreNpc44MYfwa9uJuNiJhR040EJ0kzzjusN1aW1zp0t4YYq6Sa
         UVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376123; x=1791980923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekgbizW9bGAoIiJnzTpgaFhyvoePYHGFnV7RXrKiVVY=;
        b=WArqyXZXfkUfeHiRwHjNMmEYkvgWAvZXkQ0wXShOb+s5r5rL3M3yUrPLUw5kR1KRcK
         rCSdZtNWZNB/8a+ZBOjl4uDKx/7ySk4k3KuzOT3MNzbESbbS3iR3qT992BfIxElPNYZ2
         1tg3P3A4Ak+LG2GZBB23SebV15ceMPSlJ8SPdT+uV+PYmpv0BTXLS6IlKdXeG+VqUJlj
         r0zol+YEOFtrSCVr5m09K2BKzvzem7U5GhalOpza+4RSPrjDeG7AE9U9I2TdMB37Q+UA
         FODFKqg4DO2o2IpvkJJ3kBW3yE835JxgWc4m+5e0PsosMH45ehiTkKH8/Kki9RS1WLUp
         egYg==
X-Forwarded-Encrypted: i=1; AKwUvByEAwOYIwsaXk3CR6oTriCYSauQ+Sde4VP2UyexxaRroY4Is41vfifkcOvHsK+T/VkgPSwnK361jacOlG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lEqcml6AgvmBa25N5KRv3uYRBXvfHf3RRcDNCD6nkEoIFCflN5
	J9ZLtU2kFcVfV+GM5qVHLZvtn+EwYaGpSOCJipPLKHtFy4y7hlSS8j3EtV18lw==
X-Gm-Gg: AYBFou0rSINnWt9Rt++fV8c8l49y0gg1jluCAtlnLIelxqI9sHPGB1zTENiywYKYWHi
	k+MKT3f0X6kaElNTuf0QtKpDrmz7jkBP4/xcw7IjRjIfaJpVyBssTVjbtoN2VAVLwiKWvd8Ny28
	L3DBbWBWDq7ZjZx3hjbbfony4PODjCHH4O3/C9wFPOrWmeBh30c2SECN2U6zS4v5BvnYCrmxX58
	at9dk5ecYQ1RSImg9YBs8xUWiV04W+lOUB7/Uk2CGxV1utalJ2S1kfmGIQJq3awk6RBGnaL6G2D
	d+VXs8g6DzByZlKSf2Tk3xtWIhDX/OeVnK6N8W3x0XmTy6ktZ26IKKs08J9ntVf5m5oSdiz1f2E
	FS8iPrlbLW6pn7fmhdzX6mRP2ayNozaefIInjMnLLq7XkdDSyMu+XwjXOKs0o/VI1D1nsb+eO39
	6vmxGqtEk6JwQfG6a2NI4g3TFNCKITJzm5zypUwvPoY4vBHnHnHgFnAnTGhdO8B3nD5WuY2bWQu
	YKFIne/hq+fBl5nIg/224Ic5wOOJWNBrr1Y5P2SdL+7uho0HrYr7gAOlppQaK0bpnMpjg7uAIam
	Q8qRuMf/aNwwuujv
X-Received: by 2002:a05:600c:524f:b0:49f:d6f0:6f24 with SMTP id 5b1f17b1804b1-4a1800d3d38mr30973375e9.2.1791376122986;
        Wed, 07 Oct 2026 05:28:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c71bd769csm5198826f8f.5.2026.10.07.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:28:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2] checkpatch: report warning with files ending with blank lines
Date: Wed,  7 Oct 2026 14:28:31 +0200
Message-ID: <20261007122837.2995-1-ansuelsmth@gmail.com>
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
Changes v2:
- Move EOF check as last check

 scripts/checkpatch.pl | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..d12e0e62def5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3887,6 +3887,25 @@ sub process {
 			     "It's generally not useful to have the filename in the file\n" . $herecurr);
 		}
 
+# check for blank line at end of file
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
+			     "blank line at end of file\n" . $here . "\n" . $context . "\n");
+		}
+
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
 
-- 
2.55.0

