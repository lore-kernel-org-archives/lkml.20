Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6892DCF4C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417537; cv=none; b=HC6BZDlqP1cuzeuabGQtxF5SNZgYrffIQ0FnbPY2TFK8BjC8mbE+B6p4VEF+nClqXEKs96qaJWgNJm+mzEZv+fPML/EgDO1i9wnY/lyLc7PKPd7ODHzOMdPcD9pYv84VtcmbWTWBSunpV3b+vbsGi1PydU3inpXHhcFCcqsbLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417537; c=relaxed/simple;
	bh=9jVveWeSRSWjj6Efo9yIUJqla3hEOsPrsLKcoScI5SA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCUX6dkCm+MPKBMzVt4tdV2xMm4E6aaIWIN0P8FTCnj5edQ8c3Ep68fc/HVReAuuwpEKNJklKOEeDhyA7VnHkNpv3seZ9m+vcueQ9VkzSKUoWrRiCNBnW2gwk7uztfwEGvk9T4gI+6fGfwub8lbAVlBFnWM1K5D7lpJGJ3Cb1z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCb3s1Nz; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCb3s1Nz"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dd4f3f696aso1279793eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792417535; x=1793022335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDHwtl12X7vj4PVE6f+GY7F7xQju3k15lbA73qLMpe4=;
        b=DCb3s1NzbCP1f/svP2ruCqbqvzD5R2QRLF+cC0y0oYAZB5lH+vhXm8X7P+DWAc2qEi
         j/wxIHN9kwnmsYjMm4CsCCgJRO+2e+dQA7B/t89J7ntwzEIYofpZXNtjIkYMsSillRNL
         uEe6zpSf9and7mom4QH/8VlyCb/395kBB0nyOpEIsAYXUNzJFvhHhyl6frI/E6rrgsmb
         xqMcAVQQ3rwP18+uiigLBpGrNHlQjA15VAdTvOO9sCVGFyhi7ayouu/RVgAOISXK4Lbi
         BQdJm7MBUhDZfznjyTX8M0G0kTN/NbGHWcIFELCXs1FsF+8KlyNyy0aD7jnm8BJK0Oh/
         4/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417535; x=1793022335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDHwtl12X7vj4PVE6f+GY7F7xQju3k15lbA73qLMpe4=;
        b=ulxJjkbMFHrJ98N29Ax/OFwlW5P3TJmuPMqFs7DPdrTHSv9FKpwVWkHpQOBU9k1I3D
         Dun+5KbLyxh+wizQ1wqck5IaGuBC0QBCtZAtfzcTmCUz2N1ntdoIpXSFwIxt5r9rrjwD
         7fhFU1m2z14be3ybNCJviQobx74js8Av9PhBp1IIyOvgPviHxjghOkcz83nMA+A4iK3Z
         KVXTPQy2k29vdVnXuwfDe1u8jc+bTAbs7jSqh/1PwrwXGgLVkw6iReYbE2Ul79Vg+hNA
         0isgybsyYHiVGYJHIkvNgzKD2bQROa9gXOAYNI9+ll+mnxF3WfMVlbGAs+8InXH/P+EK
         52dA==
X-Gm-Message-State: AFq9FYKnmRAG4DzF2jXk7JA581Y1bKiJPwMvrr6sfWL7iimC6DJnBsut
	j7i9AZAn7tLz2nt3TY71738xqOnHLUZqhCzT6wvepFAuy3K4viWvi+qk
X-Gm-Gg: AYBFou0bAJZokU38vHImKb75bgqM9CYh0QZlKw3PT2Ls0hFqzL+nYBiLWv/DiZpOQEL
	ZPTz0RZXDydZWuWSv4mhct+u8Hz64oein6/N1jWKXPGVFt2K0WEDbQYNyLDzhV3Cb5lS+wrkHZJ
	kZ0Q/TLqTBuz2Ot5fAmcMkJoeDILB9wew7E3TvvreYOtnIl7yWIkO2yh56QOpikihBdrzq2YnGC
	D/6C0vBA8vIHRm6plDtEnvfLgp6R/v8kgxhfRQp9CKgfNC4p1bympVpGEHeEzrXfpQOVfU2MUlU
	oYFWzF+M/Ze7saeGRDMSICEWiWTBPxcpfufNT5FysiDAYqnUOlb8U1UrrKzvpUHdL/OZXxhX5ZW
	ceKPloCgYPly1v72vzF+4hQF2TgcM/XMDAbp91kftN3Y8bJrCoxaf2I2SdSj67rn9Lvz8vP6PHV
	BgDGg3KynGzFeb9Z7f0C4hYHuIyyNcbgelfu8XwBSkrA/nBtXveYnMBv/XGpyQl00zlPM2wsYtl
	jX7B5kdudPOBBUpogbL0a4jQYrE/oy1yKBR4sGhUA==
X-Received: by 2002:a05:6820:2218:b0:6c1:dc9f:ab2e with SMTP id 006d021491bc7-70355665824mr4488533eaf.27.1792417534672;
        Mon, 19 Oct 2026 06:45:34 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70190c1c106sm8023961eaf.12.2026.10.19.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:45:34 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH] scripts: checkstack: Convert to Python
Date: Mon, 19 Oct 2026 10:45:27 -0300
Message-ID: <20261019134527.5384-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert checkstack.pl to Python to unify kernel tooling in a single
language. This reduces the maintenance burden of dealing with two
different sets of idioms for the same class of scripts.

The conversion introduces a robust parse_size helper to handle dynamic
stack adjustments (e.g., sub %eax, %esp). In Perl, hex() silently
evaluates non-numeric strings to 0; Python's int() raises a ValueError.
The new helper ensures 1:1 behavioral parity without crashing on valid
objdump output.

Tested by comparing the output of checkstack.pl and checkstack.py
against a full objdump of /bin/bash on x86_64; the outputs were identical.

Assisted-by: DeepSeek
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/checkstack.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/checkstack.py b/scripts/checkstack.py
index 8be3861b3..c3821c860 100755
--- a/scripts/checkstack.py
+++ b/scripts/checkstack.py
@@ -65,7 +65,18 @@ def config_for(arch):
 
 
 def parse_size(s):
-    return int(s, 16) if s.startswith('0x') else int(s)
+    """
+    Mimics Perl's implicit numeric conversion.
+    In Perl, hex("%eax") silently evaluates to 0.
+    In Python, int("%eax") raises ValueError, so we catch it
+    to maintain 1:1 parity and prevent script crashes.
+    """
+    if not s:
+        return 0
+    try:
+        return int(s, 16) if s.startswith('0x') else int(s)
+    except ValueError:
+        return 0
 
 
 def main(argv):
@@ -81,7 +92,8 @@ def main(argv):
     total = 0
 
     for raw in sys.stdin:
-        line = raw.rstrip('\n')
+        # Fix: Use rstrip('\r\n') to handle Windows-formatted objdump files safely
+        line = raw.rstrip('\r\n')
 
         m = RE_FUNC.match(line)
         if m:
-- 
2.43.0

