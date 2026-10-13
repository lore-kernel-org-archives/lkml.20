Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47D531AF0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914589; cv=none; b=eiNTsz4JkEHbm38l0MwLyTO9XfLpti8QevDDRBYS/qyZfLRC9IfpRoz+n3hUo8ND1DWqWxZL+ISBK5aG/6uUXkV1/DEmeGqpeKyrUUWVArD2u97IPyW9xBz1rb4wmJ8ID5mRKy8V6x1AvwJx4gYnZO9bzLbzagO2IUiQl9q278E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914589; c=relaxed/simple;
	bh=8QoQiaUknFw6yvkIK8dR+3u9Ax3UfCtpP/SNCi3d48w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsCVKki45l+r+ptYKy/8JmYq8JHKPh+NyNgVIFgCYUBg2OkqebMoD+ewJcLa5qeFurlQBdknw6kHwqJWBtUatJBHePLKAZowFUQt/mut53pFg48/OhEDy7nI5izeN3ReHcQ7XmjZpV/0NRL77gPXDRx+SigCSAHzG6mogHt+Z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxPshHhs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxPshHhs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so1615735e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914585; x=1792519385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Krc+gHcRwAHdAXwe+VUoLF2d3nEBam+7GbmQa8wq/d0=;
        b=KxPshHhsdHdn/4VG4H6U58ZU3cu8VHkD23+aRv/6XARIO34mvb3geUJlxngolSI98/
         IYLfiV5Cb+uOuphje3UObDJ+Qvy2ehHMYCPzoHztFiYZkZ1Zv4lfUmQQRCfa70udPmlq
         jqyu8GFCM7aRaj7fa/uwAyPpAk4+nroQt+e8p7sjj+h2Dvno4I7guSwm9A+bUvIh2hO0
         yz5EAXhZKNVFt5U+DiQFp6Uv5e68DIDnOf/Lpwe4A7fmLQH2/8G06VDCEwR1Moyrjm0R
         5mhUj943fcpgAiKwFkBQAsN+4mR944UXw19zEI0Vur2hMd26u+Kt6c/CjoOSLIMsO6nO
         +myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914585; x=1792519385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Krc+gHcRwAHdAXwe+VUoLF2d3nEBam+7GbmQa8wq/d0=;
        b=gHDE8Cz+yYFnGU01Ci3qAFCLxhLdnuYg3f6j7ep2cVS/zi8NhdbTCt/zSbY0AvQEH2
         0JY3rO6mE8AzA27nlIrjQ2NG6e/g9xDEadE1wYBFOJI97TpAAetc6vmTmodJj6p7FZL2
         GlxcM++jQNPosPhb+VJB/NoMbNtthAYIdR0Sdb4fUF+5MSHD15KbxMklcmyZEgxsENtR
         iKwcy5Jmuf5fcT7vfaRU7wIMv+lF+PihNAWL2T3UgNBVnHKKxlPD6DGn1Js7rq+YlEFE
         /zSFXdHWnam8GRJW6rmi++4QIsiAJ2vk/yoLSep3zvqqNops5L2mKcHjGx/DRAEkgbTq
         vnog==
X-Forwarded-Encrypted: i=1; AKwUvBzU2+gYniJD9qBDIurGeygbXJuDyex9OwEIml3mExf1DmMPoS3++6LRNT05HJE7Rn/H4tqLhc7/ck32N2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2EaJGE8L9/ktvOBiKFUkg+rN8wQEPV695puAd1OKQStJUcrfk
	RyLg0SraOsQqKLIUqLhV7pY77E82bu0ut26i02O3pGEXuHhu4oZfJO3U
X-Gm-Gg: AYBFou3+ifgP48m7qtV+LAumvDtk3IV9NdfebOQKZxg2FAltcYWPBRfiTQCwbp/o8g5
	cbCApm548O88oWJa9vu1knlrj2EqaLuZBXyfnScdSRqL7JxJQZfKbIoQrvUkdjYWHOuF+tLCtp0
	uG7bqUBxNv+SS46XS3cOpC89ycux7XZkxSVP3NLDxavHSB6HhwiiTrQGhrb3ulyzd0FfFVrmRib
	bwD536Pwf2/+Z0skK5Zm2Pudd8q7sPC0R6zim/v81XUpO3J9r8U63AFKHLpXEgtexGjwDkbZPDl
	3AxVHUcddo5/kFMWpBp90Zf5RGhVtH74ctUoYLMKt/bSxy1zsTVp5gLHYNoskht8e2EnXFLzzPZ
	dHxv+QW7vxg+cbbI8G/nDu/sccOWFI6Vc8f+N/rsqA4QyIt7eTQNWCisB2DsjyN2/i2KLka5yIt
	jFqHl9x9gYD2WpamhvwmezPS8Dro35SXyOT/c2brFo50jqRxw10iWs4i9FnvG1xAiJQxiUk/q8a
	5+MZl6MnKUEY90lGok=
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr260068075e9.3.1791914585194;
        Tue, 13 Oct 2026 11:03:05 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
Date: Tue, 13 Oct 2026 21:02:52 +0300
Message-ID: <20261013180253.477605-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180253.477605-1-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nvidia,aux-devs which can contain a list of phandles pointing to
auxiliary devices, such as amplifiers, sound-muxes or dsp, to be added to
the sound card.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
index 2588589ad62d3..316806fc7346e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
@@ -48,6 +48,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of audio codec
 
+  nvidia,aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of phandles pointing to auxiliary devices,
+      such as amplifiers or dsp, to be added to the sound card.
+
   nvidia,spkr-en-gpios:
     maxItems: 1
     description: The GPIO that enables the speakers
-- 
2.53.0

