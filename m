Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216225;
	b=WqeuKCdhV6ug9oJlhBTpl8b35KLTmEYI14tVeHrDet9AxJdzZzlIIQeXLTVZpAqQY32S
	 1AiyR+uoFhT0uCEmxTfl4660Eltdki3ugRAE0qcI8nehZKztJ8rZbOpGRUEFGXawkLaWa
	 XSAy8RSk+wjmM3LWbZHXii7Z0uYlYLRmpKODipx+BTZH6LhphgmuUP5rDM2ajUipc+fJM
	 RVVB35TVl0URq0pLFkd/TMy8P1MNX6qjQdXAcQiALn8Tqe3WDEgHn27vUx78iNH2OzFrP
	 ubfFdwZnJEjKoD+00jYT0wvkPPhYjljc7XsSnec7e80QIenhdmlaqaZa/d2utWrARbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KAHDR/durFaCmnXZCSbDEqTD1WV/JZNcTJmjD7z7vr8=;
	b=HpTTAYBVVMMEa1IFIkzzdGf7BQMUC/1LVrbFzRUFcJp2y6umb0ngbp66OLzIyMCHASF2
	 V8DNFWGnw26k27yzdtZwHi/qqv+ySf4Fjup8knIjyTYlkiBtZKvpKc6P6vpkou2WxU6W0
	 Aoug2Sf5qEVVTpwDYMqFCEVS1YR+5UtroNpdzHc07E5TeYYsSJva4lJzYCvEhREUjhzTd
	 w7QpdcEk64Y2nAEUiIDHr9hlgKx7it9oBboxgj3whdDaqu8K2mPj3F5XalUN9W9+n6atM
	 vn4qGgrYuGUWfMHAXfAIiax3SRXpxTXPSsNqUidS91f9iYUnrqwzkTJp9k6nTqQ5G6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZtT3Nmb;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F51606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F51606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZtT3Nmb
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1203008f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216223; x=1793821023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAHDR/durFaCmnXZCSbDEqTD1WV/JZNcTJmjD7z7vr8=;
        b=QZtT3NmbOEWA1FFBrpkAGLiZ1OpC5NOgVcG1N/pEP+Uy5PvPsEyJub0sgE0xDWgw4X
         nIRIzca3KeFlYGzEnHuZdzlUqc3wa1c7PQ/HtWqLJiJT349iQCppxk+Yp6R1GDzGk1Mk
         4BrsGfKzP3UGJo4y0qcePod4SEOu0LRIrGgDA36jrWJVDh+t7Tc+8OMgMebjECQe3n7m
         ZCBOe+1cKDabtkI3NSRLzvXpnZHQ2dG4pZnL0R9XVUz1KmJtsnQXGUSFUnihmqgibwHI
         MvvJ4mcVKGte0LnB5jUcFjmPj8QST7h/dVgIsykHIQXGkspKWMAthpN0VXDkUfAI/Cm9
         Dvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216223; x=1793821023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAHDR/durFaCmnXZCSbDEqTD1WV/JZNcTJmjD7z7vr8=;
        b=UG2mxMhBoW3tsqglDZXaLyvoqEGVZx6vgs+HDtR/boNh1gkBB3if5QPXZXhwoqsaaK
         aYvtPOoGiGz/qXAkxe9nNYQlP/Xn3lmzoqdEkRiXVNoCMobh/iqN4ORasszk7AjSJHoe
         SgjhJKS/0kPDV2E0f9QKIRe59RtrpXPwA7lYlfSbPwRgIjwCEAxlHgVhP0MDYM2uh6QN
         Ry9AidtIj6Afe3bH3aE8MeHcDwdmWXsaH31nYx16x7z4ye1ADjEetfD2jT93JMJNuVQv
         6QqoVd+3cKxZ5flbom8XmmBg4KfNy6NJ3xejcLBhm8jbGCuZAEc2XhFmTAtl0pMecuIP
         ZWHA==
X-Forwarded-Encrypted: i=1; AKwUvBytv4wNkQA4Tjv10lWJho22nLP/AUJvyk/yXdS3h/iNN8pVqdPtt4k+jAp19nxNfx0TJg8etYdu2VldMPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVTqu9YarDAQWsQizk/xprpJjK268NJlvasmCyPleguCBwSWdF
	XmX73ZY+Cn/kfkeSOM6WJr1yY7aHDOVfj1yUqxo7Ywqut7WnMfqYq3GqqGdNDunXcb8=
X-Gm-Gg: AYBFou0B5V0FrEKm+XFPg+uTqCVVVWfVKVwnUNc0l1g6Adx5FhcagtyuTekAomODqPB
	ZyVQx3ixRsvy9wbXzRQkB6HjdsoSC0WwmuEIB/Qt72cso/P7QogLi+66NfeXA0pxwTonTSnhZmd
	6OhI2WTwu9SQGI1eGydE+V8PNPRIC5etYJBVOI0Pr7qBlhiuHjxFzHdn7Qt8USwSkihikyat6dF
	1vYii9OR7VkBqyMoFwHgSrL0aJTOVH/W/Bh4zurrY27Ce5+CrId7HxJkehXblchnLRx/Dxcb8Pb
	vw/UyBxkZlgyJZ0PCTJU/ZuodQ67nFQbnZLEO6GeMO5jvv5EIxKr9XyN/8rI7aTlKNb8QVjewo7
	uIMvZFjHKKw6+cYBs5Lz1bz6p3YCbXDoYOwP0NOhHbQUbc1+dak25awMPH9bQm0e5k+RE7ROqLs
	gY96GvDTsy9Nf5ADFlS0gPRuRWOv6JQPRs05Bvt+wET0qryXxy8K+as1ZY52LPldzJiDdX6CzY1
	V6zj/J0AzonMQUDufwLsKVrsnmEM7RrInlnUHeIp6+dSewc2cAu2lYPmFIAffPM5/AF/zhy4PZ/
	MJT+N3sGGH6ebDqCatveosteHkxdVnREemdbZVfpsPoGPINXy+i1dB1x5MMBWE918K8FBNvlKMU
	F5t4xuaSd3e9TDfnF+oHtaCyRlMwRgiXsGazezb5/wwGDv0DU0pHcomosxuIH+T1Ux62qs1zntb
	fN8ufYMcjb6dBl5+WI8UapY0EqtiQ7AiC/bVsfg83Tm0EDCirV8bl0ebOtslsCO6Jqw4wymGqSD
	OPHm+M=
X-Received: by 2002:a5d:5e86:0:b0:48e:21d:7265 with SMTP id ffacd0b85a97d-48e5d306296mr8258369f8f.34.1793216223127;
        Wed, 28 Oct 2026 12:37:03 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-3fca-2040-fad6-74df.rev.sfr.net. [2a02:8434:fda5:4201:3fca:2040:fad6:74df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm27004611f8f.41.2026.10.28.12.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:37:02 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] tools/bootconfig: Preserve filters when resetting histogram triggers
Date: Wed, 28 Oct 2026 20:36:23 +0100
Message-ID: <9653f7959268a03234c33ec5eb25d16294241fce.1793216183.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793216183.git.edumucelli@gmail.com>
References: <cover.1793216183.git.edumucelli@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reset_trigger_file() cuts a trigger line at its first '[' to discard the
histogram state suffix. A filter such as prev_comm ~ "[ab]" is truncated
inside its quoted string, producing an invalid removal command.

This also breaks the first pass that removes action histograms before
their variable providers. If an action histogram cannot be removed and
its provider is visited first in the second pass, the provider is busy
and remains installed after reset.

Remove only the trailing [active] or [paused] annotation. Quote the line
while extracting the command so that repeated spaces inside the filter
also survive, allowing the action histogram to match and be removed.

Fixes: 5675fd4ef51f ("tools/bootconfig: Add --init option for bconf2ftrace.sh")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested reset_trigger_file in a temporary tracefs instance on my Ubuntu
machine, running kernel 7.0.0-38-generic, with recording disabled.
With an action histogram depending on a provider that comes first in
the event-directory order, the original helper left the provider behind.
This happened with a bracketed filter and with repeated spaces inside
a string. The spaced-string case even returned success.

With the fix, both histograms were removed. I also checked active and
paused histograms, onmax actions, and ordinary filter controls.

 tools/bootconfig/scripts/ftrace.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace.sh b/tools/bootconfig/scripts/ftrace.sh
index cc5250c64699..c2b993f8e366 100644
--- a/tools/bootconfig/scripts/ftrace.sh
+++ b/tools/bootconfig/scripts/ftrace.sh
@@ -21,13 +21,13 @@ reset_trigger_file() {
     # remove action triggers first
     grep -H ':on[^:]*(' $@ |
     while read line; do
-        cmd=`echo $line | cut -f2- -d: | cut -f1 -d"["`
+	cmd=`echo "$line" | cut -f2- -d: | sed -e 's/ \[active\]$//' -e 's/ \[paused\]$//'`
 	file=`echo $line | cut -f1 -d:`
 	echo "!$cmd" >> $file
     done
     grep -Hv ^# $@ |
     while read line; do
-        cmd=`echo $line | cut -f2- -d: | cut -f1 -d"["`
+	cmd=`echo "$line" | cut -f2- -d: | sed -e 's/ \[active\]$//' -e 's/ \[paused\]$//'`
 	file=`echo $line | cut -f1 -d:`
 	echo "!$cmd" > $file
     done
-- 
2.53.0

