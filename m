Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935493F1077
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974069; cv=none; b=CnYwFsBSNUb+Rxzf8yeWcLuOnBS/v9BRqHsNgCP5xjHw3gAeD+tbPHY+Tw3l1xuXoP+UBXoMTX2ysorYvjHNFItVxPNcf00C6pYQpIK87X1hgucSubedicnMyWPWu1dUh0IhFNNn0Ag2UPAnFq1qALXnw3SytxDufH/JOqRkc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974069; c=relaxed/simple;
	bh=5reFR0cPRsol5tHJU+7BR61yhNOqUbb5L8/I1mTHXyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQpg3AXyQU/OZ8QNuBGRtTVIJKxWfKMwG1pQNhk3BAh8hpDyNZYPMeXVXnpFJBPDrljnNDehLE+qE94rpcbJjZMP9vgxDv8I+TuRcdG8MbiRNBSedCLsHiLylDtQmJPkzL54TRgcbOJg8FBsE2ySgTqNbNpwqwpeNWfVT2++tBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Ucb1GLzP; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Ucb1GLzP"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14f381f0424so11229c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790974061; x=1791578861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vg8t3uO9PE10Qg5jyexboq4szdm04bUUgkPs/yF76XA=;
        b=Ucb1GLzPG0rX878x+pxr7oRVWPNoVLvRwrLUkOONBUZlLeQ87XFZGyiiSlq3g8tJH3
         mNp+W/JX5BWPNNYq7GelriG0rPkvSs248CGAX8njZZdfbtMPH18BeV01iEIW//ZJdczP
         3+H4blzwNsdpVWdCSEOl5guiR2jcv164X0g7LbB0M8MODtCCnu9khOl5NzsB6E1zsZIl
         KGJ0RouQUlhXoZIURijGpK/iNFUwxZ1q08Hi8ktmcaaJ/QcQwd5vcLK/HTuyJSTli+83
         4XATkOnS9H6xXeRRlMLjRHJ1ovO87PaW0XHrzUnP5XhTOVrlvHWxj7OInS4auoLfHw/+
         raYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974061; x=1791578861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg8t3uO9PE10Qg5jyexboq4szdm04bUUgkPs/yF76XA=;
        b=s0PbMf8hUgBmIFDgqQIyS6nSHTRo6aczdXLgS817ppzRdlhSlNnfzTYcBJCc3DvX6D
         xc/Vh7tvUgquOhxiJkJ5fL1lWwj4gOFbPOyzs7SAUu+KheldAzFxsGhwKpBC2odpMj+R
         zT5GMjrG5nwFCS2epRT3PSO6Mx6PjXIjE6lkniNOeH82y3muTf7WrOqp1k5X52be1Zl5
         sUNwiFpMbTiWB6ysvIDb386BqF1BOHdZyh86x7SVjzufIZYC5ul/5e7mC4nauYRy30RF
         7VEl78yjjIsX7ECJH7wfwQU66X8cw1K5nYtnHinbjbavca97thUH3Rqz1cUWxItMqa0+
         ITjA==
X-Forwarded-Encrypted: i=1; AKwUvBxNORFhEla31xZw42RvhVN7tu6sCa7WqS20Ljwo1PBh7mUZpOEM03r9ej8rC3Z9CJZhT7JDd/pA70I3PaU=@vger.kernel.org
X-Gm-Message-State: AFuF++kM+WClSVCztOfpQ1YjOwbkzJNJ0bjf9yZecKRox0MPvqONH+qx
	OwDLEZKRTh+YLLJhddjjV7wrk5mKEdModyGKudc83agmjB/BzdBpQOPLwIPO/cCZX6g=
X-Gm-Gg: AYBFou2RQ25Yr1hr9mXTB1LKS16bGP5ucPekMhv8TJhhVibp/LFaPh4hSduU+Mu0swo
	6+nVcqg6G9c2WAjbdjpn1y5GGhaYrPGFiF3sTAK2kfA4EJBylvCfvNKs/ThQe4ksJFqW/fK5pkK
	jK5xesUVBpxOL0rHICzfduxcV4N8VpeNGJ14R5IhcWAiXvA0v4Hz46LEmW/lkDkWFqOBy9GAfYX
	E5jMGdyRyCP1PW0ond5ytOW1/iDbdKvP064pf17vW5vREuOpFWmbn2VuoQBa01BP4R2FUQKJn2z
	I4ckj32E5BeVpA+UkmHsaKYNgV9FNAlrNR+DJuwQ0K9quzdo5qlXak42j2l1KPe1WYLnrdxOx5m
	+i5Kwr8t/BzzH9N95uvgeFp9qwvy2vHmL9gueSm3wMrWE8toouUkjWadFIw5vZoZjZt8OwehxKj
	MQB1PxIhlmZdg2eJ55tJIVFUi72B3TZel6MUYstpHy7pfuVGpYxSSkRLNDTUaldR+udci63pIpZ
	T1Xdrmy2sCt8Zm0+hPYYPU0RM3U0q+7ldKciY80AtvPLYP1D46csOgTzGIPagV1WKrZFdE=
X-Received: by 2002:a05:7023:b08:b0:14b:1e78:a19f with SMTP id a92af1059eb24-14f58fd2d99mr5644034c88.6.1790974060908;
        Fri, 02 Oct 2026 13:47:40 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:a1e3:ffe2:b35a:69a4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151f7bd2884sm79698c88.0.2026.10.02.13.47.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 13:47:40 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 6.1.y] x86/CPU/AMD: Clear virtualized VMLOAD/VMSAVE on Zen4 client
Date: Fri,  2 Oct 2026 16:47:36 -0400
Message-ID: <20261002204737.26561-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit a5ca1dc46a6b610dd4627d8b633d6c84f9724ef0 ]

A number of Zen4 client SoCs advertise the ability to use virtualized
VMLOAD/VMSAVE, but using these instructions is reported to be a cause
of a random host reboot.

These instructions aren't intended to be advertised on Zen4 client
so clear the capability.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: stable@vger.kernel.org
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219009
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and x86 amd maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53114. It clears virtualized VMLOAD/VMSAVE on
affected Zen 4 client models.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The code change is identical to upstream.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53114
Upstream: a5ca1dc46a6b610dd4627d8b633d6c84f9724ef0

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 arch/x86/kernel/cpu/amd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index a61606a614bd71..8d9c067992e5f5 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1161,6 +1161,17 @@ static void init_amd_zen3(struct cpuinfo_x86 *c)
 static void init_amd_zen4(struct cpuinfo_x86 *c)
 {
 	init_amd_zen_common();
+
+	/*
+	 * These Zen4 SoCs advertise support for virtualized VMLOAD/VMSAVE
+	 * in some BIOS versions but they can lead to random host reboots.
+	 */
+	switch (c->x86_model) {
+	case 0x18 ... 0x1f:
+	case 0x60 ... 0x7f:
+		clear_cpu_cap(c, X86_FEATURE_V_VMSAVE_VMLOAD);
+		break;
+	}
 }
 
 static void init_amd(struct cpuinfo_x86 *c)
-- 
2.39.5

