Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850124;
	b=Z5Y5/DFwOIr4v8VyqrY4vSzQ+llKNXX6dlTuBY2wT0DNsNIgxnWRbfLaeH9iSlXZFaDK
	 MqLOh3D72UUn0sR67z+8AVrGgprxzWFkgLmArz8Eh+hSQEZetedUP6QVMiFKEMrW8iWhJ
	 Y99/bFhfZL2uljx9/qY+bN47PVqEczM3WHkymMreEUc0ZGfYWYdyo/TR5zdhpRQvtGg5Y
	 1VRxLEfP0HAyVnWhb1fxH+EKmsUCVRy6kMlfJPG6R5Lzjj2fJAOuTr/N7s1nwUkH/Z+Rx
	 IgBv0Rmzpkx9HuYBTAjo3k0jZgA5RYqn0f7rbPCSlImyXx8oTjZUqmEwW+F2YGcS0xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ITO9BPI77frVV4rkGXz0VQmzGcGlDjhdfLPbJDSjlxw=;
	b=SiLc4AryNZ+dOR9PsuJGHrKTVpg650B0wXlv1IcaRIic6y//7cDZiDIqX0LU3vqI+S1h
	 Gy0lHOYm1A3H35xEh1SxEdHRZjJL9VE1y7yWhqgg+F1k+5sqq6+CKz+RGLAXApjLza8SX
	 Bae5pba4XBKOkE0DfA+6IKyGA2n+mEysaR94DS7QD41C9x1cIu/oEm5eWUruAOl6L1+dH
	 sRSgNy8Dk+6KxkYTMdRMMymelAaNo4DFB1yKyjkTdztUVmJMxfjCdlcRg8d/+jt44vLG0
	 3bg1PSrJVKvIi42FT3bdjqeiv7yBj5CH+dLfp9JiNLCcyzjSwEdJcsz56O2tRzt8tbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mz136crB;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A30606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A30606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mz136crB
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490ab0a20ebso2257202f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794850122; x=1795454922; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITO9BPI77frVV4rkGXz0VQmzGcGlDjhdfLPbJDSjlxw=;
        b=Mz136crBiUC70tCqynoE9UwbJj9fdUfn3W09AfUon7VKWLHuNZZCIVFC68HPb7/shE
         wOP6EUdjyEF5CccyglJGSvAkjsqS4mpUawspZu+JKbLkYEhF11p/Naal0XPrQKtjXshr
         vCMBlS6OTlhrI98tEguNu7qkzvmC1jx6NpPcneAVLdCQ5mME+LkLS1OeJolNJfDLZJZ4
         3eTsZ/JimspnBsTAb7K5bmNPfu2WZskW02HIJ/EKFAdX0sdTrGKYLsT49kpaZJt7VQpy
         WO4zWDUlw9mvW55Ahe9nAdvbD23JTmhAUvk6DUVWfA3Dxrxmgdhu5g5xQOcud47qY1eB
         lPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850122; x=1795454922;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITO9BPI77frVV4rkGXz0VQmzGcGlDjhdfLPbJDSjlxw=;
        b=FxAp7QB7pqcb5D9C/Ufjdcxl14Z13syrsCE5nqtBKOcdvLPxclBP8J242c1xU+VN84
         u7R+IE6WMXtocg4TlYkZOTzI0jsGdPsiVrXedqA8NbmU8RU7kW/CDV8PbzpqenJcIyBd
         VpAdLiJv5/gpBv3yZc6ddW9pkaa+P+fhJ+g7ro+/eE8QimmMf2r9zeatCPB4u+fuRReJ
         1q9ZfrroQdaupjtPsDg151CmFo1NSgzQHofXvoVWpr9SWcp/wQWGq/UvmmhnX23xvTrS
         YD7GfD3x/uLxIihlYq5Af4HMjJmf6Y9//AK6HUTDrNX5NIf5fwanmg3UCdCd8sZH3SBR
         ZDPQ==
X-Forwarded-Encrypted: i=1; AL+hErFRdY+gucsVbV8sVkWdNzqe/gD9llWRuhHFeMxo/xhzG8U07ukgA6nPisqyTB/yUNWvk+SrqUJxoM93tc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/enfYljLtcfHD4TfzgVU1o721hBTvsd6QDAcXe9yWPFMM8YhO
	U7vxoLM9lUPimK1ppiU+8J800/4Bi68jzZX4UfZ1X5SaCXjiXk6VPXTWJ6MEjoyXwHqcOrcFvzX
	4MMEllvEMc9kEQpC8f3QAyA==
X-Received: from wmxa14-n1.prod.google.com ([2002:a05:600d:644e:10b0:4bb:6962:19b2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00d:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb6842670dmr149710885e9.30.1794850122432;
 Mon, 16 Nov 2026 09:28:42 -0800 (PST)
Date: Mon, 16 Nov 2026 17:28:36 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116172836.2254432-1-vdonnefort@google.com>
Subject: [PATCH v2] checkpatch: Add context-analysis attributes
From: Vincent Donnefort <vdonnefort@google.com>
To: apw@canonical.com, joe@perches.com, akpm@linux-foundation.org
Cc: dwaipayanray1@gmail.com, elver@google.com, linux-kernel@vger.kernel.org, 
	vdonnefort@google.com, kernel-team@android.com, mkl@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Checkpatch doesn't know about the context-analysis attributes and
misparses annotated declarations (e.g. mistaking __guarded_by() fields
for extern prototypes). Add them to the known attributes list with
support for a single nested set of parentheses.

Handle context-analysis attributes with parentheses like __attribute__
in annotate_values() so unary '&' in their arguments is not mistaken for
binary bitwise AND.

Cc: Marco Elver <elver@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 scripts/checkpatch.pl | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f720191..5ca2a1fc2607 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -527,6 +527,32 @@ our $InitAttributeConst = qr{$InitAttributePrefix(?:initconst\b)};
 our $InitAttributeInit = qr{$InitAttributePrefix(?:init\b)};
 our $InitAttribute = qr{$InitAttributeData|$InitAttributeConst|$InitAttributeInit};
 
+# Match (...) attribute arguments, allowing one level of nested parens
+# (e.g. __guarded_by(__bitlock(3, &bits))).
+our $AttrParens = qr{\s*\((?:[^()]++|\([^()]*+\))*+\)};
+our $ContextAnalysisWithArgs = qr{
+			__guarded_by|
+			__pt_guarded_by|
+			__must_hold|
+			__must_hold_shared|
+			__must_not_hold|
+			__acquires|
+			__acquires_shared|
+			__cond_acquires|
+			__cond_acquires_shared|
+			__releases|
+			__releases_shared|
+			__cond_releases|
+			__context_unsafe
+		}x;
+our $ContextAnalysis = qr{
+			(?:$ContextAnalysisWithArgs)$AttrParens|
+			__rcu_guarded\b|
+			__no_context_analysis\b|
+			__acquires_ret\b|
+			__acquires_shared_ret\b
+		}x;
+
 # Notes to $Attribute:
 # We need \b after 'init' otherwise 'initconst' will cause a false positive in a check
 our $Attribute	= qr{
@@ -551,6 +577,7 @@ our $Attribute	= qr{
 			__ro_after_init|
 			__kprobes|
 			$InitAttribute|
+			$ContextAnalysis|
 			__aligned\s*\(.*\)|
 			____cacheline_aligned|
 			____cacheline_aligned_in_smp|
@@ -2141,6 +2168,11 @@ sub annotate_values {
 			push(@av_paren_type, $type);
 			$type = 'c';
 
+		} elsif ($cur =~ /^(__attribute__|$ContextAnalysisWithArgs)\b\s*\(?/o) {
+			print "ATTR($1)\n" if ($dbg_values > 1);
+			$av_pending = $type;
+			$type = 'N';
+
 		} elsif ($cur =~ /^($Type)\s*(?:$Ident|,|\)|\(|\s*$)/) {
 			print "DECLARE($1)\n" if ($dbg_values > 1);
 			$type = 'T';
@@ -2193,11 +2225,6 @@ sub annotate_values {
 		} elsif ($cur =~ /^(\\\n)/o) {
 			print "PRECONT($1)\n" if ($dbg_values > 1);
 
-		} elsif ($cur =~ /^(__attribute__)\s*\(?/o) {
-			print "ATTR($1)\n" if ($dbg_values > 1);
-			$av_pending = $type;
-			$type = 'N';
-
 		} elsif ($cur =~ /^(sizeof)\s*(\()?/o) {
 			print "SIZEOF($1)\n" if ($dbg_values > 1);
 			if (defined $2) {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.703.gf848ed807c-goog

