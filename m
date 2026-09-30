Received: from mail-dl2-f26.google.com (mail-dl2-f26.google.com [74.125.229.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7FA30F7E8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736414; cv=none; b=EomnBpNRWE8x5ahLC02L4qsAqRKQ9zxbWLWy3Mcw5aWSK+GPgE0wckIrFF2A0+HHMTNB6rk2PGsFTVEjud3UEWbHGmrvyfURU0s1RWCRIgp3TXtI4mS4FTlfzlMEK6CbncdJ5wnGHVdPGqoxkqUVrRdCvCd2XEdm1cZ5sT1RU+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736414; c=relaxed/simple;
	bh=UXD1S75khvSt0FgsLz/T6uzhAE5DrMjJOyelj7NaGl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vc+mmtY0ROSyx2aeALuxBs7G7U10aoRtv7VlG0XGRjZujAX5D6yvneCK5kSmpBO0C5yabq3CmLmbbSpV5wxkgcwElUXyzPDqckrpilqEHE1+W+K/KvPMPj97oNJEDqZ6ge8Sk9J5hof+exaSPU0KVLcl5pUPXVRGy7JQkrt8a9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=UQLu1cve; arc=none smtp.client-ip=74.125.229.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="UQLu1cve"
Received: by mail-dl2-f26.google.com with SMTP id a92af1059eb24-144f47a9b57so4418291c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790736412; x=1791341212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lomeLoiz+N4sTQlSWuotqu+7Ex6081P2NAVD9CMpcWc=;
        b=UQLu1cveLUz2BkGx3Gu1vf12K8ngme6hyxwM8iWrDEgk1I0c5eKf5TAcb2WXNrtf1t
         QY+HX6LXwIiZjTwyhnhOxr0N52rP3rTcFATh7kE0bEC3m/HIKDXy/OGSzP+CAuImD00B
         AoeBe8WfZoHDvt+UmRGe0qXdV4h17dqTaWI3c9PS3EGZrTFplqaLSnw2kswNWUnuhGlj
         ImTruf5XuUvFeMyOKvi0xs/gZmcv3SnxaLMkMtsWMgf9ZCqCV5j9Og8BmSmwXkhDcjur
         0ShspzcyZz6SNHhvo517wRZIPmlrFR43EyGy2frHKenoPx3oT2uQn3vNwzb0Crurr4uT
         YIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736412; x=1791341212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lomeLoiz+N4sTQlSWuotqu+7Ex6081P2NAVD9CMpcWc=;
        b=MpWS4ACwUx3rPq/spIRI2zu3vi8uEom6qLgkt4AL1KvW1Dy+UaGaXYVvJkhlJIP1DT
         qNeD5n/TLwCFh7QhCBSXsKGJD3KaCc/KJsmE35Qu/GsugOxd1TC+xXgKtGnPeOwb4hlu
         ZqmKAU9xr/udNlMijpO5H0bqhNbGPNGawhDRsdvvlmxiJg59rStvmbOU0dqkm2ziG4la
         9zzpopQTIBV6DcAvAu+M0lnQV8fsgSVjUd/hlpZdn3sYSm/dVQpkKJZOFSG+0ScMoWqr
         wx0Bjf9NhvJWek17pXFFxFxkv/JxOt9J8naUmR/cNP73zwS1zioAdfOmAHW0GwiJr1Bq
         yFoA==
X-Forwarded-Encrypted: i=1; AKwUvBzD2LV5eG8umEbMrP9ZiuxIUXDR8WbPOh18QCJEeLbw+b8O5P8rpxGmBsZl1NeD+Xh0EmuqfUcPYOdp02o=@vger.kernel.org
X-Gm-Message-State: AFuF++mR9o2aIkyWHhNrlWquvTEiXqBA706HGYIGZjWNDMUx0EfeHPJm
	AcAdQsFn77OINcNcWoA7AX89HkkKSVVJItY9N1c1u71Eu/3USa9FJFNvNEi6eX/97p4=
X-Gm-Gg: AYBFou0S4GJbPb70VtwF2YjoUD8cA4i+ro+S+T1WZWW7AWzLZl0lw+eOkPaNxpsR40E
	CJs9dy/eucYjmbElHZLBgRMCBeO1/rrUsDHdEVq4SjzW0LSbMD3YA3pXnVSOWjbFTrvDCz0g4xY
	s4/M70LTegKmT/iqHtiNcOAR/hhMZivWX5yCgrKyRQfy7E5jU2zCh8KTyWN7TyrP41RQJb2V7PT
	nM4otMOURI+3abx30yc8AwatJk5UkV/hpU/9xoJlGFtGArCHSIgjx28AtbxBk059IrxWc/kWH7V
	R2W2CJmk8AEyPcNIHyowno2QGUassyQoRqnwNyAVDb+2jyS5HRMAC0lpjZ78+ztWZAwfbAVPovd
	19btPuQdssfkaZ1zSAw9RtHshzcmuE1QUGzU5CXDi0vkCk/Iq+FmB6LC4K+Gg3C7hMnpFrLhYfB
	HNl+vhsQswOvuD6/AmsjE1vYC6LAQqW9Fv5w8WPGJ1jRw86zJGgnxrIXckfoOptfAsJ/FYKdIxl
	xzFWvItjjmOkOdTRTdAD7YoLcWhFXEXvXtaAuAnWleh/R51AzXfEsmoWjbGzXtaEtA0baw=
X-Received: by 2002:a05:7022:7f1b:b0:14a:583a:8ddb with SMTP id a92af1059eb24-14c9f219854mr1348062c88.31.1790736411597;
        Tue, 29 Sep 2026 19:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm226271c88.13.2026.09.29.19.46.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 19:46:51 -0700 (PDT)
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
Subject: [PATCH 6.6.y] x86/CPU/AMD: Clear virtualized VMLOAD/VMSAVE on Zen4 client
Date: Tue, 29 Sep 2026 22:46:45 -0400
Message-ID: <20260930024647.96625-1-artem@trailofbits.com>
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

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-53114. It clears virtualized VMLOAD/VMSAVE on
affected Zen 4 client models.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The code change is identical to upstream.

Could you please queue it for 6.6.y?

CVE: CVE-2024-53114
Upstream: a5ca1dc46a6b610dd4627d8b633d6c84f9724ef0

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 arch/x86/kernel/cpu/amd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index a2313fa8a0729e..955da4c2385fa0 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1196,6 +1196,17 @@ static void init_amd_zen3(struct cpuinfo_x86 *c)
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
 
 static void init_amd_zen5(struct cpuinfo_x86 *c)
-- 
2.39.5

