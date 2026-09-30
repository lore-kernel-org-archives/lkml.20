Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF992E888A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748221; cv=none; b=h47g3kO99o5R22/Cv/xhZZNY/9bvEqBIoincWs3LGZVdRD+gc3QwVWO9Vh5HsOxcnVors0F/cBppIpFvn8W7qGeuKWNqxTzVkEKIeDgHoXl3/reUjc/hn/bIVAJWheQYIeM0PjocM7qwwF2/2hU9HoTCTFZHpzbkjaL06Y3xi+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748221; c=relaxed/simple;
	bh=UARglUKAvqBq0oxbnGvbQklaKOcZCNUwsD/ukl9WrKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SGp8NORfpCti3hH0OfyVcqOZGkSmk1oBym/kewlE0nNngjLZDdNQBch/tgh1BIYmP3pOipznksRRexDXwXIQ644Fb5DIQl3uxJy0xAdC+nOqNqpMPf8MpYnnGjoUrUvXTNM7Yy/ew+9dwLn/PY8RBaixoh9/TcKA16rMoQGg3CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UL08RL5J; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL08RL5J"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d719d99dso4314745ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790748219; x=1791353019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnB9FKIKFzNu1Po5I3Gn7uovAY3H37YHyKqyanOeRws=;
        b=UL08RL5Jh3DrD968l86xLqCF+DqjZAj0uqyWfUYyBjs9yXitkSB4FL6Wtg9ZuERqVB
         FcIKjar3y7l/ZEbt/asvO2M6xiE5kihLoTFLqQJjY/ix7WJI58pQ26d9L2an3Pwzl/ft
         y1FarPqEn+Xwd1kJjqlo5m/vS2A+30tZO2APCFV3Wp3yyOD2gmvCPkJmniMUuDOCVIlB
         6KLfuNQTkz+dYzWFjJPZas5EaU2Uq4/CRWzBV0lJombzf5MKA/oq3EtapUiAqEusUvqb
         NSQ3naEp9ldMyPiMAr5M6KO4cLs4/ZKUHuPtLmNVpILEtKDztXwxM1KjYBkzyVtCtiN7
         oWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748219; x=1791353019;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnB9FKIKFzNu1Po5I3Gn7uovAY3H37YHyKqyanOeRws=;
        b=EAB/uS4j9LJqluUccJlIREk+P3qtHE6SdH/aYbd2Ax3MvtHSwv7YjBECFIUWG+p+x+
         wS3xoZcNqEOvgWu2XOV9g3Ap6az8pnQLZ1AR3ELhk6tBsE918kL1zx7P1geRVSS0FsMu
         zzqzCWfOSFt0rgddqvR+F0Je2OJfDDCqMG0TFq69UgqXe/+Vlc3CwL27Pwsl9uHSf6ZP
         3YzWg99lpPFm2oDANHVaY3t8JKexyFaZy2VVrMuWp9DRjbeJwiH8wouruPALGDbTDmen
         HbAzK83+QXdHveRe0TZTkcuOd+4ReuAHXc7hfnHgtA3/tqFG2xVlJqluxv9Q54QVk9O0
         FAJA==
X-Forwarded-Encrypted: i=1; AKwUvBzIjafeiTMUFaxgiP2mK2QxWjA77BZxQYi+u/WpQoPLaYcKe/EHqqlXSGuXq0HsaQXsiohhYLJp0WfBhl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/pcUIxrLpucO7k2Kphe/oJDLPwJzOu1O4C2rjWjf91SigEF8O
	msMpcPa42MNwgjy/Sqkygdxk0lY+6SgyQ/MouJi1QITA5cBqOmAuMa2h
X-Gm-Gg: AYBFou1fXK8D/27royCW6tQofv8ccDs1fpXP5B8ZH7BDTMfKcHaxQrl6NBisBAt7eVM
	7W1howx6bHwYb2dHjXPCbR9mksWkyn0rgFx3KgaNqaESLA7G0EfZhTqTCwLls2c2Gd9ZcSN390u
	r2sVg5GHQJ99f6G5okKsmY+q2DPWsibfWrnEGrzqBmFn68Ov7a1WSChLBgb+MgHmEpNG/b7CPTr
	3UAB+xxJK9xnE42aUbSp5EdTDIzIkyjAidD36W6W3ZgeTDsePHAY1W8g/3MSxPTpV+JdZYdLusf
	vULGNVyvGSEUVtR76n4/JEgp4w7O9sCfI+stAjgSGkUPjAhEZqQetdNHDjqEGS5VNNX9QkdQod9
	RrtJ/5kaYqdv3Iyewawh/3R7o0Z2/52pZgi4LVttYz//VU6Rpyx8jrdGE7/gkrLelYMeq+BJrCL
	6lUuMdrdYEB+4jFdWYYj63GEDb69CcLXEKNXuqXQAFYeyuIzNvP4epcNde2WBFTT/j2k3oip3lF
	9Q=
X-Received: by 2002:a17:903:b4b:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2e2e49179ebmr3989585ad.6.1790748219186;
        Tue, 29 Sep 2026 23:03:39 -0700 (PDT)
Received: from omarchy ([2404:7a81:bb40:2400:e077:4928:9847:63b3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5b89c89sm1509225ad.15.2026.09.29.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:03:38 -0700 (PDT)
From: Ren Tamura <ren.tamura.oss@gmail.com>
To: tj@kernel.org
Cc: hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: cgroup: preserve command arguments in with_stress.sh
Date: Wed, 30 Sep 2026 15:03:34 +0900
Message-ID: <179074810121.139422.1170111592692928081@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

with_stress.sh invokes the requested command through unquoted $*. This
subjects the arguments to word splitting and pathname expansion:
arguments containing whitespace are split, empty arguments disappear,
and literal wildcard characters can expand to filenames.

Invoke the command through "$@" so that the command name and each
argument are passed as supplied by the caller.

Fixes: 1a99fcc035fb ("selftests: cgroup: Run test_core under interfering stress")
Assisted-by: LLM
Signed-off-by: Ren Tamura <ren.tamura.oss@gmail.com>
---
Validation (2026-09-24, mainline 62f4c998b297): ran both versions of the
actual wrapper under Bash on Linux with a fixture mount listing and no
stress workers. The argument boundaries, empty argument and literal
wildcard are preserved after the change:

    Input:  ["two words", "", "*.txt"]
    Before: ["two", "words", "match.txt"]
    After:  ["two words", "", "*.txt"]

Ordinary arguments and the child command's nonzero exit status are
unchanged.

LLM assistance: finding small cgroup fixes, drafting code and commit
messages, and preparing validation.

 tools/testing/selftests/cgroup/with_stress.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/with_stress.sh b/tools/testing/selftests/cgroup/with_stress.sh
index e28c35008f5b7a0f66654b10d8fccf4678120f6e..a95fb387464460ba24775a3e947a91875b743bc9 100755
--- a/tools/testing/selftests/cgroup/with_stress.sh
+++ b/tools/testing/selftests/cgroup/with_stress.sh
@@ -87,7 +87,7 @@ time=0
 start=$(date +%s)
 
 while [ $time -lt $duration ] ; do
-	$*
+	"$@"
 	rc=$?
 	[ $rc -eq 0 ] || break
 	time=$(($(date +%s) - $start))

base-commit: 551c722f40809618230001baccf219193e22fc5a
