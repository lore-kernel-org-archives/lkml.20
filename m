Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442355;
	b=XVcmrUHpw+h2+IfrjmJ37hWw+wx4DyFEVKiBQ6+Gnf0fsALsPt32MfReX8Azm2RH+94s
	 sPMBorO5luG8snBX9KVnBJEFryW0rATSymsBZUz3NoEoAnMkZS0A071duZi89VVrbHfbD
	 QteWNQZUSBzmGl504vBS5q/NxmrgDExhOW3OhY4bwi+7vwWDMLEwF6B/zUzFsmahQovbW
	 lElhLsT0sLG6m78r+ihBV2pJsz80oVAcFBaysdSZsvnNqWKGAciwmGsry1RbRuejtAC9+
	 mVlCX8oao8qgIOJuS7OdnL+ifopW07Gr7OLnshaCF0obx6ZJh6nwG/afp2nPZILtB8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kplK2CyKAy4yx/18GwkbblUjaSX+3r2sP8SLaekUd+Q=;
	b=Goqnrhr9dOdpif7tgKWCDERDZbnPy/yyJxVCLQxQc93YA9Nz5Cswfrtf5NpnAOsixDq6
	 8xWgFCrsVnG/e3Y7z/5MewSXHhWl6F3jCLPaSJaI6WG2s58iuJxhmllqu0Xo9G+2DiHo5
	 anvbJp3fhxdH8dUS7D1u4N03zDhHgYboQUL/INtaWLHtAWpEn1Q8FbaFeqlTZG567c2dC
	 VioAvz1nRmEEjFgIzlV17AaH1sDoyFLXgi2g4WCEkWtduTqsUmQHWcufRmp+LZREVEpHv
	 7k0Qh//OQUTYFIgiTA1Pv3QMS2etoDCB5esOV6jlCCrdIayTHrzwv9OKrLfnNCFixBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zv35mfUN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCF0606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDCF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zv35mfUN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11277125e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442353; x=1794047153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kplK2CyKAy4yx/18GwkbblUjaSX+3r2sP8SLaekUd+Q=;
        b=zv35mfUNlYL5jWE7rjG3YIAd0Um6VkKlBC3QpTka8fQVd2GZOTq53mM2BPr6mTohCt
         zbVUMbIId6O4cA8netO5aa1HDI62F4Uk//wgC8s6tL9tKrO6CsekMCzcxDMhBckPwLVV
         YdKaTSpx2NCrop9HcGNkSIqPDquLMklXA2FOcWGFOf/adPazhqSQU0I+Qf2wZWUUbdhZ
         t1/IKumb1EEYN4lD6C3LDH7yaFKoGHzsgQ9R7q1VgrcwVeSyXjaVu8wZoEYPIEzkis68
         /VBySBAMDWZMzRFUGjPjF8ssxBoejzyvXq2acblYrOwh036M5+xPbH+PxPfK3hY4DCY7
         8dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442353; x=1794047153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kplK2CyKAy4yx/18GwkbblUjaSX+3r2sP8SLaekUd+Q=;
        b=k4/X1Fpz2Sc0tFqPjFAEYk1A4jLVOLUTj3zjakGuHsPl944vfQf2+aPCk+eLDP3eFB
         67dRTIWbRkN6xsxsB0wg7S1HcQlhC/Xo9Sy2o8NZ9JJ1iYQpomHHZcpWE+9Hzsae86OS
         1SJNzv73+whNPufn4JL19eHEZO9+2iQs/pHodCbzY+OuyacUvJ1HQMNOL1v1vK3ezWyn
         ppguwk4KxN+9nExB48Q/7cibUoDOTs22r4NPYqJolyBbrRHloXAz2KG0ksTamUY35m73
         gaFZ1Zmmw03Vbn5rOfc1M8x9J+uthGrGGfcE7ZK0H0wpqHSWiLPI2iqjokuf6L6TSDce
         Fttg==
X-Forwarded-Encrypted: i=1; AKwUvBzVx7MavclhZ3VUy/cTMljcB0jtDL1GQ495LfAU/ChvWdNCayTXoViIHAZGpiUx3I4CgprxGOZNEIz0e0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4IWZz0Bx4QPxTkjWTC31R6Cv7+M3EaMlGDXBFrDjjzP/R0hjB
	WtTSgmsip1GtsbjWSs/Ge4gBW68+nVY8Rj3YdYu3gXQLlydQcF72sOSC
X-Gm-Gg: AYBFou0aIfyxbWcqhhVaiKtEfvlMXwUpTyqF/k1zGwmEerMHo67gpW/rPXfUR1OGP5t
	qlJ+/NOtKEoS3O4dScJ6GaDClZF2KfYOTdIWapeQlcHeEMnfn+Ipja25DA8TDuJ3w1ShXBtwCHL
	eCaKxiHY9GaXVCOMDCGbKbLETrDHk5fnWDqlhwzeVmsYyisncmxE/STSWH21o/vWQlyVGTkrSh4
	fN0sC6PwvoqWgdC4Qfc8WaAMC6eyJy8ss7oJq40ewgjCyIpVfCHYZ1QHc/ue8KWAGxuo9s35jpz
	HpoVqHRk+b28OP4+rQhlJPALcuWm/Y/WPPicSATR26DTcfVQzrlhjidvPE+kaLYVZgbNutbFLdV
	7J2XfMCJz25ZXLh+zCOpPA7SENxbfWcCn6ZxlYMYFKcC+jbu6+HFDPkpk0K5LANXOi/c+2/34X7
	cZJ+CKUtq0u3MwAPzGUdBPPzH9p/LIKePxdPPErKc12RiEnVALgV5G3XpmcDuwGizUzuARzZv2B
	5v1UmnoD2dTNrbNWQ8rdeNdtSnaKsYg6yTDRdUtTICoHnCPrmuB8F/5Bn59CIA0Xs2GaE1UyrxN
	LqZKyFoqGzOPv1bUuO+O88V95ySnqwvL4pBZL9ruf+Rcx3fiP3tEZiInrvGKbctkzzOnba0A/pT
	U+NiWMjM3Kkr7tpf4hEo6XwUHG+mvmTHHQMZBkrTGJIwK7ZpOPHn/opGp/z6UQ7YM7yOR+cR5QG
	mOPyv+7CDLW1KdCW5dD8VI9bxotEH2saPs3n304Ld5dKHg+Cuft3Ehf1ZXfAMX8eui4AycNU69o
	6RE7uI=
X-Received: by 2002:a05:600c:4f82:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4ac1889c857mr99757055e9.20.1793442353201;
        Sat, 31 Oct 2026 03:25:53 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-994c-f615-42f0-2afb.rev.sfr.net. [2a02:8434:fda5:4201:994c:f615:42f0:2afb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm195363135e9.1.2026.10.31.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:25:52 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] tools/bootconfig: Reset histogram variable tracking for each instance
Date: Sat, 31 Oct 2026 11:25:33 +0100
Message-ID: <3ffce36857ca841dc9fb69da304f7575bb637499.1793442331.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793442331.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com> <cover.1793442331.git.edumucelli@gmail.com>
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

Histogram variables are scoped to a trace instance, but ftrace2bconf.sh
keeps DEFINED_VARS across calls to event_options(). If an earlier instance
has defined ts0, a later instance can export a consumer of its own ts0
before exporting that instance's provider. Replaying the configuration
then fails because the local variable has not been defined yet.

Initialize the variable resolver state when starting each instance so
that its consumers are deferred until their local providers are exported.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I reproduced this with two temporary tracefs instances on my Ubuntu
machine, running kernel 7.0.0-38-generic, with recording disabled. Both
instances defined a histogram variable with the same name. In the second
instance, a consumer sorted before its local provider.

The original exporter put that consumer first and replay failed with an
undefined variable. With the fix, the local provider was exported first
and all three histograms were restored correctly.

 tools/bootconfig/scripts/ftrace2bconf.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 9100ebcd5af6..b63e04bf9400 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -84,8 +84,6 @@ synth_event_options() {
 }
 
 # Variables resolver
-DEFINED_VARS=
-UNRESOLVED_EVENTS=
 
 defined_vars() { # event-dir
 	grep "^hist" $1/trigger | grep -o ':[a-zA-Z0-9_]*='
@@ -164,6 +162,8 @@ retry_unresolved() {
 
 event_options() {
 	# PREFIX and INSTANCE must be set
+	DEFINED_VARS=
+	UNRESOLVED_EVENTS=
 	if [ $PREFIX = "ftrace" ]; then
 		# define the dynamic events
 		kprobe_event_options
-- 
2.53.0

