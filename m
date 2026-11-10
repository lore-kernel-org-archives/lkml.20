Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315319;
	b=W6unGnME9Ft2JSPbb6I2VT9T3fMBXvPQmwYBH701/JKCmAohN7gepjBzab+gxuUzJnze
	 o/fW0CfAYTUp8Ah/BirrkIA5x+wnqrJnMMsXL24iVwEfK+1RCY+X+AN3y56psSET2KRQb
	 PKajRal0sPIEq3sFAKHLr1QqzxxqL0u2rljlUXc7X6u3LjJr+JW4yEjPR1qweZei+sM0b
	 ks4VyFNPQyGfEgISxUCsWbG0jdOW1QzsWnkvPAA7zNMWWRllxEozas1P8CPh8zWJJtNFq
	 /noe+reZNddgsPlxUV3TLtTLr5NyZXg3NGQ5EJJ9I3eAR5rqIloTOhjVK7D97D5aEZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SRPDILoa9QXxM78JgQUbKtTabkG23wBYdCzn1zTCpo0=;
	b=q2J1e/XSZFCXZrsxlOuGI9cGRnNnR7IfQM5ceIK+CxpI3Z186ej9QL/aQpZGlUUsWXGm
	 stmIimDO9BFkcil90krzAhvYmTpmiroGXb1zISpGV9/oR5CSsik5H8J8jvmyyywdKZxcb
	 zVxE29BPxoF2KA2MAoMpcWqI1zHeNx+zJ1C0ZauEOL625UlFdK4rckaebrgYCuGc7LTwm
	 /M+m+4r7/1aDSxcfStZzeJSeKPrBZPrc9a73JrFdXfjulo40Za4v+HX3+1vG8BDFplIBt
	 qQCnkUWJSUQ3QVctlU2kaYz0BZ9PGruMAOpwJA33fXmyL3s+NDpmoW1kSyti+7lGpvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jAWp7xK2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9284960A2625
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9284960A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jAWp7xK2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so3034216eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315318; x=1794920118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRPDILoa9QXxM78JgQUbKtTabkG23wBYdCzn1zTCpo0=;
        b=jAWp7xK2Cccs+Chg/AP2WRTiZgrU2U9WpPLfGVk+SiwzUjv9OEZKNtrHy//Xm1UwiB
         8kI+60xGSsNHQn/6Ky2/smI9UuvtmLYF3QD6BEjQeEGPN7cK+7FFSU/o56b01kj2xW7Z
         vyejLFvQkl3eSYvxEJJKJGAxxmbZAOAQXgU7nizluEtzVGtbaIojT0d4pJs0xIv5rICo
         ay2NrSDRIfxLzRN6Z85v418etSCHq9xC/RVp1xtLBu+Wq77s5FtwKjc/j4yInsacpxMo
         btr9UpThkecQb6xnzl+VUlgJQ8I7tUnXVvLwLLmVcUgNstDVO1AFluIVJlZ3J9fQjfrJ
         0D0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315318; x=1794920118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRPDILoa9QXxM78JgQUbKtTabkG23wBYdCzn1zTCpo0=;
        b=yBjQRAQQNkwCH7hD0F9MXLIa9paQ0Dgae4ZSsEdP/oB7UVny1C8W5thfyahb+ApjKa
         dNYA+xITezot6sFt9/DI8PEi2y+3ACsXI11k9Yyk82BCq9+6DeflbDpe8zy2Ri6Y1pEL
         OVoJCUz5ZzWi92jjWLsql1fd9RwQee8kfuoz6hWyFBDIhPWmxMqhzdhM7AjMoNPlcXMX
         FDTlVrlLe1MdYEF2z7LfYVA05v+EWwC9N61v9QnqQZydkO9B241Y4QTDfY+moYTn0PmG
         hRvTieDSxFzMVf40+FTPCrcwLvVvKf7tkzCW1BG5b+ZsIK1YaNsAbhSbZF7nw+KCTD+j
         K93g==
X-Forwarded-Encrypted: i=1; AL+hErEgAriIetLCNbHhYXA+6B+lyASbmqt/j9sm8wBJmF8oXlqQGfkK5qXKuJtnqZPLkwgphk0pEx36uRrXPxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+56FhPghUjlRf4w743uoFB9Xhd0gIXWp0cEFlfirDashHb0FoF
	lTnsmcXt/NWggfid7jzb+rPyEsiIVGOQR4prfkcc5B5/BwdkPS6QIMBoztnDM5H7pF/5L/9hcua
	SpqZ07/fxWg==
X-Gm-Gg: AYBFou1ggD7yI5RDVCBADYmnr7DM0Sy7nUpd1FyGvMCNwqN88RT9hSdGm7nz2aUxIpk
	77VIKyIjO9u5WcD0HCD6ubknKjlHyCj78cXiVLvpukxWmRlD6qYWI4nfFHNIYi5YNV5bp2d6RPb
	PQeZ8DCoZ0s4+HoMeA+mEYYO60blo8/tDT2ejf4/HsPg1nEDR9/hFICF+I1OFN743/IKQSznhOl
	Um4YoYkEMciO4YjhFg7f2ZEaZhGIv2Dtu9y5vaXxfgzXtHy0XANIFpb3IQ2oOsET9CfFyyi0wfr
	P4uVSjGkiqY/RPn2uVE+Hc8j82HthZcY+vrtxGTsDFgN69SnnxRsG9CcmkJXFt1gcQTb3Ddi6BU
	PPmEc3kjGffP4Lyrxlc8jsIphLdm2QD3WsmR/uYe971EhAq8Ab8TgEzP9TayeNjN6Vhk2c4BLEF
	fb6RnP7mjU//4Wi92RKrH41eurtxWI3JfC7RnwYdwxF/6Z0K8SsM9RHpis9VNJXrG34yu1NN2U7
	AiWlvOMQXEakcK3/ZIEQbzr7olpSphYi10ixwSjlevz5OHu5xNomG+YvJ5YrtZ1+5hNif0heA1D
	RX/LKsX2yp8rhMiF68EUUrZAVT+lZ0kmDyN/wZjglEwE8g==
X-Received: by 2002:a05:7301:da16:b0:36a:79e7:2fd with SMTP id 5a478bee46e88-3752011c1f8mr3378032eec.40.1794315317645;
        Tue, 10 Nov 2026 04:55:17 -0800 (PST)
Received: from myarch ([121.165.40.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae63a6sm6855380eec.1.2026.11.10.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:55:17 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Kim <jaehoon1744@dankook.ac.kr>,
	"Claude Fable 5.2" <noreply@anthropic.com>
Subject: [PATCH RFC 1/2] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
Date: Tue, 10 Nov 2026 21:54:28 +0900
Message-ID: <20261110125459.3924-2-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110125459.3924-1-jaehoon1744@gmail.com>
References: <20261110125459.3924-1-jaehoon1744@gmail.com>
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

From: Jaehoon Kim <jaehoon1744@dankook.ac.kr>

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

Tested on LG gram 16Z95U-GS59K (PCI SSID 1854:056c): after this change
snd_pci_ps binds and both peripherals enumerate
(sdw:0:0:025d:0713:01, sdw:0:1:025d:1320:01).

Signed-off-by: Jaehoon Kim  <jaehoon1744@dankook.ac.kr>
Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>

---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 8e15638..8dd5fb4 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -63,6 +63,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook 18 M1807GA"),
 		},
 	},
+	{
+		/* LG gram 16 16Z95U (ACP 7.2): RT713 on link 0, RT1320 on link 1 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
+		},
+	},
 	{}
 };
 
-- 
2.43.0

