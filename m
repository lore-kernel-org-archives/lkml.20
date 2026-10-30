Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364737;
	b=nDvffjGAcpb3WSvEh+H0a2RbjjF0Hctscy5eoNDRtu4k4q90DWgFNQiYVK/0CkAS/7uk
	 BTilBkkTyX8dVsj/M8vAIOwQfIxGoROaI33H6Se3TA/qqNgkheQPMPtqct+++8fKvdYcy
	 JaiwwXo149WLvprKw0Bn1/m/xPUTx+Roe0+J6g0yMBrh+45aPyidqAzgSt3wh04+TsemA
	 /hlAc07zgQvPApf1iAZpl86J5GubqDWZwUxaWzzW0nUeg2lBKX008FOikw+9eWyhZYE+u
	 xvzi3do6gFg0J69VBEN7DDHM6E020iEJFev/ML26wTRyQw3VUCiEuow66rzwGSSZRQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kzZJMbX6kEn3NZvCxaAxClJhR4ih+ZQw9vsv4EJtO1k=;
	b=NI/hN+1zpIPHklMc22PNh/tWiDyEvvfVUQPdYtLTm1EXK/ddT9QuHyngts8YsS9/lmgl
	 kHs8S5UlrBoxyRXepRtboPs5gGrjExzstAcwbvXSrJnvWqsWQ4q4Y0iLj11BKXku7XZUf
	 Piy+EPS31jF1GdkVs70xcp1ela4FHmCwTqGvX4PpfLdiaC6ygcOxvHjFg02vJve0ByVmj
	 7XKaKx0p4WRG+9OapJ3yDWm5vKEouxqwmuu48iZwrYY0SJHD/TdmO6dlpgquDFG/aNWeO
	 0XhgfMBS6CbohXv+TDsw86X4Da1TRQml6NVlNS6215piHx36oRBrmhFN4Iumo7xhdlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ej1Rpi9k;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320E60A2608
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2320E60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ej1Rpi9k
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so3212125e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364735; x=1793969535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzZJMbX6kEn3NZvCxaAxClJhR4ih+ZQw9vsv4EJtO1k=;
        b=ej1Rpi9kBxixFTdjJjohgN8g0qHdMW50Pye0hDl62N/jopsn8Zfn4K1PqOapN3/Gha
         wIcEIWuI7H5z11BhzNr8ljPMaIo9GcegAvsUACJNHLStManBFQe8ZPeNiZQ7JaLDEUYh
         v88sVmf6jBgZ0RGDv+lqBh8kOVhAW1aPiQ2vC65uAB6qoR8byfvN5ybXEaoBq5h4vsZq
         FfmuM97TsQn+2PK5O1dxNsf5dItU2sJ/rYTtuq3+FAV9H5EBarWEMSW8Aq0pGXHqBd15
         sTakJ3sYoKdazqEx74b2HHzLdaA6b1+rnbdc2RljH3bwGaY2a1vMTXenuJEcykdSSLh1
         9s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364735; x=1793969535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzZJMbX6kEn3NZvCxaAxClJhR4ih+ZQw9vsv4EJtO1k=;
        b=QFOojwDyYSspq8oa71stlTuK7wUBmUz9PNQBiXuoK1ZnFmoHG2mTUlAhnIPC7k0vHh
         QlbK78nbQbRenoWHapSrKs09I9f21nFYohLgv7cgjx7IcTKvubrvlR1iNmTOZ+HyHTrl
         HSB2TJee1oW5WPf7hW7KE5bNLz6B1D298fjfKFX38T3JjemA98c1BS83qu8m/wnn9FKJ
         fmUUvV0KQddgtlnsmM5uYYIMis/lTPMg9LuCIrX5rQMN6+GR3FsWKEKY7pQZI8YDX3ol
         Pse7AFgZSnqM7iKyzz0HbkGWCzUSfoDX4K4nszmpT50XXsDn0dDbk00pBJaNMpw42JV5
         n00A==
X-Forwarded-Encrypted: i=1; AKwUvBxxMh6glTvUFCtzmALUGwtpObqAK1MWxUcrgl+BDcE2TVfrQF6pucl+oZPsrhbopzM9m0a3qHzIJlqJoiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7s6DQoHLYa8D7JZgd6n9X27bFfEANvPlirmfg5b+UcPDmT/xq
	2GHkJA1A0fpAyl678m++gyr3kpsxQVKFV9JXozT76u/Bg+67tAH2ePNJrZbhRH0OUxqFxQ==
X-Gm-Gg: AYBFou0cjEV6L6Axiek6XatIUUpcqn7fBKeXTdcmbp8QbrKGBZ1hl6LKIb1xaopoFL9
	6OkzfEjC5IB/UPjP4iObRRXhHVTtQSh2+d9YLUj+cyL4GVSmkfgP6e2Bbitb6xd/Ettoci/ST9Z
	oYWBKKOrHrZpdDy+ByvTybX2dTBIjNQqA6szUzvIBxiEOhx4nf/PPRmezkJ021DzI+QcTXSSYPt
	VwOPfLVu0WHw+DTbxkkd1iuCUvgX/JIblkxaKKVOy07DJc3gG/q2dS9wWliupYj6aUbSuSKW/lZ
	C/ePRYnh8gV++TpirdrGGPgpI4T8QRTv736wYhozSrOkbhYoKUMEILtIcAvY1M9wqd2bkUnO2cd
	p+sGGsz70XTI9ka+4MrAm1vc5stNyFcEkrcRkyS4Y+oVLyvJXeosTU2xtuVbr5fpOT2Jh2WCb7h
	rFqnbdRkQaYCPvK9UAqxOCG1jFmpiS9FKGLhii6E9JcpsmNsI/Bp7x4Zyk35Eh51lsXpjLhphOM
	ihpb/NmpSOXE+RVFzPZVvY8xzT5QZ4TYQfz5aSLajz8Io4c+w9cduh5ImKSmlAwo/QwGrMDjrq+
	Qtstf8wLQLkkjunNNQR2g9dzqf57VGzIbPYT+iAPCnJ05tmEiw2I88E5g7hTOXRUHNU1F2HfUj2
	uO/08d1t0t9qMUM5wobBFG6Zi5udbMjHDZdSz2aWfWdjPywubdNmhYsU8X+xiTxuTxzWt51N8cg
	P2akCv4oW+ZVOhnftfkvLaQW5h1CU7WEDUIZgVpxRalLn6L/aq3wrEEzgvmeTN9B4H1jEA9/hnK
	iD5H6y0
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr47984785e9.0.1793364735508;
        Fri, 30 Oct 2026 05:52:15 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-a479-65ed-4521-39bf.rev.sfr.net. [2a02:8434:fda5:4201:a479:65ed:4521:39bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm3170047f8f.12.2026.10.30.05.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:52:15 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] tools/bootconfig: Preserve paused histograms in ftrace2bconf.sh
Date: Fri, 30 Oct 2026 13:51:51 +0100
Message-ID: <64093b335e44c4233947326d72c96bdfaa9954b2.1793364709.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793364709.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com>
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

The trigger file reports a paused histogram with a trailing [paused]
annotation. Removing that annotation without adding a pause parameter
exports the histogram as an active trigger. Replaying the exported
configuration therefore enables aggregation that was previously paused.

Add the pause parameter after the hist prefix before removing the display
annotation. This keeps the parameter before any filter expression and
preserves both the paused state and the filter.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested paused histograms with and without a filter, plus an active
histogram, in a temporary tracefs instance on my Ubuntu machine, running
kernel 7.0.0-38-generic, with recording disabled.

The original exporter restored the paused histograms as active. With
the fix, both paused histograms kept their state and filters, and the
active histogram still restored as active. One filter contained the
literal string [paused], which was preserved as well.

 tools/bootconfig/scripts/ftrace2bconf.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 6d36219eb997..93879181dab9 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -114,7 +114,8 @@ per_event_options() { # event-dir
 		DEFINED_VARS="$DEFINED_VARS "`defined_vars $evdir`
 	fi
 	grep -v "^#" $evdir/trigger |
-		sed -e 's/ \[active\]$//' -e 's/ \[paused\]$//' |
+		sed -e '/^hist:.* \[paused\]$/s/^hist:/hist:pause:/' \
+			-e 's/ \[active\]$//' -e 's/ \[paused\]$//' |
 		while IFS= read -r action; do
 		action_cmd=${action%% *}
 		action_rest=${action#"$action_cmd"}
-- 
2.53.0

