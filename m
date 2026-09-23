Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1748442E8F0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144312; cv=none; b=KnbEe9ZKAode0dn5PiD8czcDVRNtSaml5KX8/D2NbEP8Jb4wixsd/rZRZVADxX9ZKtBg1QkcKCrItntLGWhQ7OiWRLECgIQrAukbr/mqeWggaorGd+DYjxuoXrJZ0FDpr9LoQskejMGrcDSm2T6AnAfXBX6wkuAGY6fvwXSGil4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144312; c=relaxed/simple;
	bh=GVW9bhD+zkoVAulOyUDyCXaB9p6HQXdcarFxGIs7jqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EMhapBFQ6tyh08GC3KNUQgiPol410LGOAYPnZ52ofxy3Wytk6JtaqZyXb8/yB4JHuJlQhyUtEHDv38YBx3DiaMp1klRMr/njXSB8IvZlVM4UJxovmTkbB5vxv7s035EOYxcj7UMiHqXDNR/pFkv1QYMIlReVriqkGuSN/dls+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx4BZelr; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx4BZelr"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so342379f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144309; x=1790749109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvn509QiPGTq/ln1pwdxML9/uSgUBXJGaIOsAHjxhfU=;
        b=Cx4BZelrAGcMy5fdOhXWS18woKcnKNpglRmUe2c/VOdsIKmGiAJ7xKxwmML2yijrzO
         hybM5J5dX1SzfzeXuN/oK6oc3rjnYZZ/DjGa5nJelkLfqGdgkLaIh9YhXBSmRGTmKslI
         VOp9cl70nnTugP1+zs36RxjV+iPNOgcJy8IPoMXdr9dfC89/DsmxAtnDiECNHCxy6kQI
         aLWK03fV9NRyAOUwZdjMiQ6wJLexeTOtdMz9Sq+6IBQTPPRTi6ZmVt6V5aIU3YsVJtNl
         JurP+tR8XDL9hHyB65VRHeJl7dOgc2J59daX4PsjUcpj1fnJM61X3zDoVguDUW78xwPm
         E9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144309; x=1790749109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvn509QiPGTq/ln1pwdxML9/uSgUBXJGaIOsAHjxhfU=;
        b=clW3sOjcdMVBrIK/uW3Gh+dg9+rDN6TP1J3khHo7peQ28K9XIK/XofmmPXxDmQGaPu
         knJNkztfgsTeGRg1W+d4577Mo+4jPr/VaS8J/gXZHLDXuyfqsRIK1vT4lO7ufqw07E+X
         XhSoNtaFyJNbdztb/H9ffs/fiZCevBjOEpSMhHAV+akCphlgIbew7OzezjTwa9+/po1z
         JRvbvbdOs38TuVIYvw0DmygZwjWNujQO3H8yo5gUflg3Iz3+X3yt77PL1tv91PzfeMVb
         dL55be2NoB9Udu0gciEI6s2k10Wovg5vGXk02AV/wEYhQfT60wlALPyYYhT3hgvD1fid
         zMig==
X-Forwarded-Encrypted: i=1; AKwUvBzrSGebCapXVXEEglR8OOoSj6fpg+WKaeORI+dKiKs5AElZUZHrjcBOEA6UHmmIfD+bcxbmFaj5/NGOjcs=@vger.kernel.org
X-Gm-Message-State: AFuF++kEEfPTbV4e0cV4/G+m8pxa2ZSbS6QySq8ncpjJC7Ft8t6dy1sW
	nW1olm/vr+/t8AQfE9lHFrVSo0VkebYrYmp58NzV0HjotcWPRY3AaPki
X-Gm-Gg: AYBFou2MuRtxAV5SRcSNvlLr+Wfw37sXISwfaH0FhRxedPWpMnba1joZSXVr11KJ4oR
	jl9KWeUQwhYlrqlLHb+5ihij6hEH6aBL71KIXn3C+W6W84aDVWGxMtPSsFTrNh+khCRcpHB/DVH
	1muyGlFa934fEKlX2y/XkEmisVrB8YFSoPaZchBb9bl0G2Yb4VllGkPunrk6spOR5VpE6MRXMXD
	Ad7+rh7IRoW9U5NtdKuUWm1qN3gRP9YoSorhlIxenVatvIJUBunBCjL65kh3OEx/lvol9poVLPy
	j/MCOkVVIDGRaoalxrLDNxXv1/YINaLRI+q8NWbhrpUVZbzH4dp+kba1UjwIcIebba0+21ssm1N
	OPPIp+p9OacNWU9RRoW988i6sDm8XRePDgFIKNcRXt6S52/75He6Q6kuS1k0FA4gjVGiMUtdDmt
	yLHxSLf9NLk64gwg4zhbE6S9X2bUg11zjLEFLLQFgyS+5E9D/Kh2T4lh4eLsuShHLa+i7zV2cBy
	SA1PAsPHM/UOW2uiRWXY9tIodjrtZqMUmWj7UbwxQIhrLsrLT39tBEmzbel+q6yMbeKAH2iemZd
	0fmJ4eKArT6LrrN2gxzEbYrTus6GagGFoLyVaA==
X-Received: by 2002:a05:6000:41e8:b0:487:35c:6513 with SMTP id ffacd0b85a97d-48867099e0dmr2216693f8f.42.1790144309059;
        Tue, 22 Sep 2026 23:18:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-182-160.95.114.pool.telefonica.de. [95.114.182.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848646dsm3859755f8f.10.2026.09.22.23.18.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 23:18:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH v2 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc
Date: Wed, 23 Sep 2026 08:16:58 +0200
Message-Id: <20260923061658.20140-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260923061658.20140-1-kmehltretter@gmail.com>
References: <20260923061658.20140-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The heading for k3_ringacc_init_data repeats struct, so kernel-doc
cannot match it to the declaration. Its three fields are also missing
descriptions.

Use the structure name and describe the firmware handle, device ID,
and total number of available rings used during DMA ring initialization.

Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes (ti-ringacc-v2):
    Changes in v2:
    - Describe num_rings as the total number of available rings in the
      comment and commit message, as pointed out by Udit Kumar.
    
    Patch 1 is unchanged.
    
    v1: https://lore.kernel.org/r/20260919163721.89044-1-kmehltretter@gmail.com/

 include/linux/soc/ti/k3-ringacc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 2de6031b9424..7b7fc237c08f 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -254,7 +254,10 @@ u32 k3_ringacc_get_tisci_dev_id(struct k3_ring *ring);
 struct ti_sci_handle;
 
 /**
- * struct struct k3_ringacc_init_data - Initialization data for DMA rings
+ * struct k3_ringacc_init_data - Initialization data for DMA rings
+ * @tisci: TI SCI firmware handle
+ * @tisci_dev_id: TI SCI device ID of the DMA controller
+ * @num_rings: Total number of available rings
  */
 struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
-- 
2.39.5 (Apple Git-154)

