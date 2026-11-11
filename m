Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361216;
	b=uols9qspNN+wK6zV3PisT479Z8RGAoBXVNLIUpN1VCEpCko0tFJa+PkH3YSgDLYcawuB
	 Off8T2gV38md8QblF8kTM+eGTaoeBVlybjtwq3fgO5ftiputnUyG6/x1e6IvKGpJdiXX9
	 pdDr+jZOZbg6jVr7IwxH+BJIlvJlKeIUY3CLepQoPKB8jP3KrvzLypeUOfVFNzo2VSnCb
	 6Cddc4MnxNWpzhoWgockaV9xhhPhCEYi1n8Y5twJosWvbDvNPyoJ7OH9CxLbnjpJJE+zO
	 eW3gnVu/Fl70g0MhDxmqp35wz+Pi+VtlZZo7FdnPdxR5B2EfKrSgrEoIMXUP/No06eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ykFGH6gPM0SkWbKXPmtRjujCSZJ5+PpFSuGK9oR+Dno=;
	b=4++ed2l+WLZ8LVgqOFy2I/Iav6k5Hh5FGbAn+6X00ir3gINwQmN/I18fO7bT/DljbxMB
	 12PVC3QFi4moUgxFjGRWAXnXabaZszBpPqRFQLWKsfIC2FQzvJXG8MVLw/yoVrTTEHe/J
	 BPtJthTKUxAsodKy/yYGGvYbxM0OyfKvYMqE22/KldZf8/n/OOGEpy+FOvKGMyNNdYygF
	 VWvPc4T6ZixhSbh+QC5AGhKbWhO4WmmrUhjBGu4uV/AX131TGG7V6zSmdVA3/gTzk8d0/
	 qjQJt8jj8LOXLKD0lWMl/NOFDBW98Usp11EIWn/XAWyWEMW3cH3ncKSttgSq9Km4ePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WLkRO3c0;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1B5606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1B5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WLkRO3c0
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a594d313a3so1561570b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794361215; x=1794966015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykFGH6gPM0SkWbKXPmtRjujCSZJ5+PpFSuGK9oR+Dno=;
        b=WLkRO3c0YqXv25uSyL6aAZJ6yrawkjxBU6b68X1ydWWn6203PJK0/UVBjxdIV2Vrh+
         j7E2BAX10mERQH2zUm6/l6ZwPECkqipZj2BGSOMykmO4xhNhKOiVfaz8iAjbfWzvTOJ7
         Du5wez8wObK5QWtrK7wMgrtOD15F8xAiohC6u73CtLIYw4X8sMhtVC7BrzPxOJZXlz2T
         esxofHExaj5jjaiwq3MxcbPakejAHh/GdUSrcFyA0zjrgGXPYFYf0GSxzYQudlD795CW
         y7nYJFH/ushOHmH83mLuV/yOynlwrRtigWb10dzUGZ/dzES3j93fzjMmltR3/4jhEmHL
         RSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361215; x=1794966015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ykFGH6gPM0SkWbKXPmtRjujCSZJ5+PpFSuGK9oR+Dno=;
        b=BXJ+ak0BCLxiF1I3lFLn4YfX5TZb4Cs/NRMtB2f44TEiQZrt05mQzugrN1RFLlgkdG
         UhGovHrZ3OP2fJ3c1fjdMUSTcwtYwh4tEmM8/E0CtgYXPAkRqVkvbDvq1X21ZIOVxqt3
         Mk+yNAAjyiwLRJOD1ZzL0tuWdl8tP+HpPj8HdleHZDvJZXIgNAlGJG2QxBDut9C+k3B4
         /cJ8PGYA6/JldxpUi13/UKVc9Z+j8qcJzGM4bC5wZKs2P3MsHjoyChJrD9HJkUnEz5c4
         oco09fhtngUYYpQvrm6I3hAVpv8Es7JMUO8TxgF4P3rPjvC1osu2J6QCf+tfi5lO3OCZ
         YVyg==
X-Forwarded-Encrypted: i=1; AL+hErFtRt+OgHFDCNXN0RlyrDAbv/jyZcg7cXbRg9bmrtiSXrmcBrrsK5jWUif4fnDS0rmsysPsB3GukQKBA1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U2X1P1j5pwyaIHCQ4SytSP4JJMS7WiOrPmtLl7p8vIQSocqDd
	etWb1gq9rtZDa6jvQHYOU2uyrbrxOfXgO7LmQDFUuDsQaAyGkCIDvqy9ewFbMogv8cfDbWmNV+l
	8mulXZXo=
X-Gm-Gg: AYBFou1DhwXCUXk1DUMJZZvXdXFF1rzEqZT6kfAx13Fc+x03IosIpqnEpJBvdWc9yVo
	ytvyIXzwsMXfn8KMYuBQEM15XVFFizcB4T2Mlk2tu6nDFcvA8gDnMGOFHLzGqVYSgYZkVud6Sc0
	ymJV6K3XyiG+SFbZyL3htVm9Od8a+vAJbxBq8dHs5vY4Hz8Wo+h1LVq7Tvh1/wadkqjafDbovOF
	5uXTgdbLpKuvkfLUXoSWszdJE/InJu5Wup2i9stEKDbx+3vOA5YCxE7lL+h/tabmNPAa+R7Cdzg
	pxPH30t2SuzKaLOUxHpSHcV1t2tQh9UPC/ODOtJ6qp3pcmD3KQnWOUJybQTdpl7wBMbIiKfQ03B
	lYpu1KNU13YV4tT0f8ZndLIcjaC9v++cogqGP4cERkUXNio1kA48U1To0+4oF//9XOqK9HrKyaS
	xiyKabm4RZBjsRrc99rvChKVtE4V7dcqrlJKsDu4ZobfD2IOy5w3iHedLATiO7Zliqw3w7snXh2
	dDMgONNzuY8fn7inOdKaTV2MlI1nt0NGFLBULd4BSN/wvi00vFFM/1aASujcoXzf6U1mVN6A3fa
	BEy9+ErIc+N5QFrdmRPX0g==
X-Received: by 2002:a17:90a:c888:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b182e94153mr836619a91.11.1794361215104;
        Tue, 10 Nov 2026 17:40:15 -0800 (PST)
Received: from myarch ([61.254.29.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm1912111a91.15.2026.11.10.17.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:40:14 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Kim <jaehoon1744@dankook.ac.kr>,
	"Claude Opus 5.5" <noreply@anthropic.com>
Subject: [PATCH RFC v2 1/2] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
Date: Wed, 11 Nov 2026 10:39:09 +0900
Message-ID: <20261111013953.4011-2-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111013953.4011-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
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

From: Jaehoon Kim  <jaehoon1744@dankook.ac.kr>

The LG gram 16 (16Z95U, AMD Ryzen AI 400 series, ACP rev 0x72) BIOS
sets "acp-audio-config-flag" to 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC), but
the machine has no ACP PDM microphone. All audio endpoints are
SoundWire peripherals declared under the ACP SoundWire controller:

  link 0: RT713 (UAJ + SmartMic functions), _ADR 0x000030025D071301
  link 1: RT1320 (SmartAmp function),      _ADR 0x000131025D132001

With the flag honoured, snd_pci_ps bails out with -ENODEV, the legacy
snd_acp_pci driver binds instead and fails with:

  platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found

so no sound card is created at all.

Add the machine to acp70_acpi_flag_override_table so that the
SoundWire path is used.

Tested on LG gram 16Z95U-GS59K (PCI SSID 1854:056c): with this change
snd_pci_ps binds and both peripherals enumerate
(sdw:0:0:025d:0713:01, sdw:0:1:025d:1320:01).

Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
---
v2: rebased onto broonie/sound for-next (v1 did not apply).
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3d4c852..febf559 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -140,6 +140,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
 		},
 	},
+	{
+		/* LG gram 16 16Z95U (ACP 7.2) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
+		},
+	},
 	{}
 };
 
-- 
2.43.0

