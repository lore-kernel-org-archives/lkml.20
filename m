Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2F649B5CF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461930; cv=none; b=UqhUP69WCUeNVD+yp7vETsk4Grpy6ULXQ3rCbVA/Vt6//n3yxIJDE/7WjEdgSuArEYM/K/rCs92KVT3FxMW32q2jCcGzC0snrC+3B3mP7wG2FX3livE767120XUARpjmiI1O9Fu9m7wRAcje9S+KeGTVso/HmxQkCJ8HT+0/qlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461930; c=relaxed/simple;
	bh=HJA8viQXmqTMPeMmptelZiQTZUoyYiIz7WZjZo4Z65E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gndNhyLZpWhuQDiaocaCo8/MrGykIoiUXVv56vaHuQHss1tI9l9kZIk9g636nyl70zLVWPlX92RbYeZQfO8egZ0iUgeN2uaD7FM3G+vMWonYUFyh19HePX4AZm8xz234gtleRTvy6ov8PCV7YNVsb6yOdmQM0g61opeq+SLWgys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJ8v6utD; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJ8v6utD"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso17742a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461929; x=1790066729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+0cui5ayAYb0Jrx8Wg8DmgArah2Kx/gm9LNNp3GsRU=;
        b=oJ8v6utDXd+3xTjRBuM7COd45BDFQhr6p3k+CsG/tPILrAovxXqs1Z0OaOSP14M8Pl
         3nsJmq3SUGkLRD3ZCuxkB0t4IXMq+eCQJ8i3HqWDJ0otTW7jMcnJArhPOlELkZBenrOL
         UpfMGViLOOYiGHgWIS+R3JBVvzBQT94LPHGqHN2XdtgeJQH4sIbpn4Hj1OUwgef/vT85
         7KazuiMIMN/ngVDjYC0RuSSWbg1YSW1S8cg/FrI7GBpJU8FkGRbNKxgIyaQJcI0Gq3zu
         u/g4gpfX+AWR/Uf60A/irHNO42ZC6Y3wZIc7nJJ9NpK1GVrPkQxfqX3vRtvtu/bDg2PV
         oNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461929; x=1790066729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+0cui5ayAYb0Jrx8Wg8DmgArah2Kx/gm9LNNp3GsRU=;
        b=KlnFlWxDyHXqEF4SL4nkIKXa1dmiWIAuYHFSZSFQCQX+trtW6Na39Z8+49Cr3SjSiO
         bDtjXp2cGyyjeJ1oVVQiwPbxNCiePpaxgvnz5Igxs7V/2Bvz9JSjkMYiWZmlybc9/Lzr
         Gm8yuf9MEfWNm3HqzXjZtgoOyK3YF4PznkHC8EkhLnia5ipDjShYwnxy9iB6tviPce4F
         0/tAo3Bzs01f2hxz7GvDsgfdMC/ulq85aNSt9mqjyDoovXhK6u+ctxjnirjRPalgIFqq
         rz4TrX4hQutXlqv/YZ/I3qPq/L86qTrKfOn0YYyUZzFxNOaPhbba8W3UMxDLicI0JvK9
         zZcA==
X-Forwarded-Encrypted: i=1; AKwUvBwrPY9Q2KQtfZxbNjkSa8vnKGOOUA/lsx8eukqkNDy5GcE3XWzN3qquJ7rUf+KJJGquCaDOH60QhCpAl4I=@vger.kernel.org
X-Gm-Message-State: AFuF++nMnG+ILvQHDMSMF8lhlODbUmWTB+HrDd+Ng4E0hRymvdW6OudA
	WDSlaVHU4MH8/JxQ0SGaVMUVJWdUDOSXTW4X7oP5K9D1PPzYu/p/wfJq
X-Gm-Gg: AYBFou2i3ArvnZaClA47CKN/oc36YLE3iNFTMQW3DorZ16J30YrHfnvLxuynXkQD31i
	P6jUjJJXGVYAWe7TNj/HjblvQD9+bOFR6X3cQB4B2qMaeGTyjXAEteU9OwkZLMFD+y0hv3Tko3A
	DbAatgrK6uckqd6WGSwT45+AA1D2enbDPL1m1lI10xKDOe0/HBndp9GI4uDEV5K4Iq2JPFkSfft
	ssZ8xsKpZgaxzbVQNTZIHOXusownhYCU1Usm+AwpOtoct2/lxKJObn9cTBQAou3QR0kSkI4bmEl
	/WbNbJFTAdzg2X5TVMuIdRc8IFI0xhcS3dNXkHARr1lLNzZvB8z3RcMOVmF1B5HJBK2k92GHS7N
	Z55IoBWgDoDuS50zDT8TOfUq2233LcNa5SeKN8xrLe3n8pI1XlwydKdkZ0tb08mWeeU5O7hXTUP
	vhJYwv0ORHiA1dzMNZYlyA6jri4HGgPNKpAlARZtG4Qvo50LJaLtZ8Fowl4DiluKVcPbXHBGBx0
	Sh5LCSNbF8668mwCBZnKOQrhA==
X-Received: by 2002:a05:6a20:7f8a:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd52823778mr474377637.15.1789461928611;
        Tue, 15 Sep 2026 01:45:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 21/23] ALSA: hdsp: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:22 +0530
Message-ID: <20260915084424.1007757-22-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 31cc2d91c8d2..0ade73057731 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3664,7 +3664,7 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 
 	snd_iprintf(buffer, "\n");
 
-	/* Informations about H9632 specific controls */
+	/* Information about H9632 specific controls */
 	if (hdsp->io_type == H9632) {
 		char *tmp;
 
-- 
2.48.1

