Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B54A5EB8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360851; cv=none; b=Z4HvNiB8HkVR8ZWNbcJTedYW31Dx9C69e2bA7l80fezyNzZ5FGOCR6z+ES3c4dGOm/fk6LC9aNoJPzKpL1/nw67WbOtQ+8XSCPrl5GkhLDnu92vK6xE73MdLoqI1SEZct8MxNkKptd51hMIHMnAHkP7kQYgVvu9NUVvyBISzaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360851; c=relaxed/simple;
	bh=Bc5RyoPyL8jsNo0TXqrSYlmk5vjAHujKpDa9NlkLa3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkjvNCz9EUpXFmJ6dkcgfVVvDgXnmdMeRV3aoGKod0vnPOgLXPxvzIXiDBiXjDoSg5x4V7deTT1yFwPs/siQ8mCdhPmty0Yn7HVs23ndxsBTx8BEZe8rC6zp5TaNR/MWadB37xLwumbyKHnpm1b+uLhMtulggF2qTyUyWK+Djdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mU5k1Z4g; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mU5k1Z4g"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so766874f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360846; x=1788965646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=mU5k1Z4gPFf4rcRZW5Y1qZjCOiV/bVBFWVgO/IRoZKZ7X8FNdXMcnfq2xWh6RzcDzv
         2CUk7qu/zQj+fBvz7ikbjXemufTBObRpVvgfM3NcOIIzU+j4kt5scHR384S98Jyme9Zv
         c4yIcrRBN+QndF+Wsjtd4ijrH9HlmwhEz/Bv/TvluS2wg9WeLNmGotR05j2a7YTnFPMC
         51r1lgZOAuNVYLboMPG3rIeqPl1jP2C/GvF9ZIh7hRAnb0miztb6lnTYPVfa3o780J0s
         smh5OtsSjFZgfpjoIaXzPZ9nCqdj7ZHsgXTXtaQ4mKp6kGS40tre+DJxI1SgYtPCZoKT
         /W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360846; x=1788965646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=hQHnMz6b2q5LG7IUZ/ROs+dtHwzq0Quv+QR71VHXO6NCb7/86FJ74SUAZZfC2Yoo+8
         pNN+hk0jbqGkLCvNdA8wdRV0j95hrr9zCt66EtTWn5r2dAJvAJHSIbS+InctJnCHwAlP
         J/cackiHAWMDRHKxDyObVLwlXJjNapRkYamBBTKSVkn2cKWHtHSLHbo2Ql4t4ha6DJ2H
         2okCuv3sECz7JC3L9mgHPvCPgge01yR5Cc1XXOjNEMyzD5jTlBjIZm07p/5XKnd3CkEq
         Tdee+NpihPlcVwddXVsJy2caDYqLlXTmDwnb58ECYfl/foZFu8kVFLX2WNz5xhtoOL8z
         esiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTKaNKIE2z90pdWtOSKOz61khRdT53LUW/C9cWf/mbxkrz1uE3PWkEh562Tjtkgyoeifo6qH+T+YGe2uI=@vger.kernel.org
X-Gm-Message-State: AFuF++m984W5laa1ytWxAKyN9Takr293N4jYbAPefNVvXyK7wwMZNFba
	QHbmPACK2ZdVqEdE/MYOUs8abfmSQSQRgk+ZHklkyUUphA12O7w9jl02
X-Gm-Gg: AYBFou3CYsD9nZdv2GF3Hg+lHAL8maXaVI16pp/pZx0gYeYI/g0smhva9FwYo3a2fPW
	WAUDQAIcuAKXH9FDQ4L9gDi6YjPrJ5icq644Dh12cz4i6U51wCrydiqW+CBBT9sDcdc10uBc7oE
	sAScIfwd2v2lfk5Jz7HkSc5t76PIJnREZ1NPHP8opla03t/oBA9yubg5E/71tyHHiJ1iWbnmy8G
	vjRtVdPG5fWyMRoqXElwETrxwN8KbcyMO/fprDoetM0E9J9ZVBkNJNMf/4JcK/JLiCN3fY3rz41
	p3T4LkCI8uhrm85kHQ7QjmI4TxeSuK/YQJm5Jjx7mpMn/mTqPFm6Sr2h3u1iRkWAg4Fk4yYWeff
	Gt0h38UuCL2FGWdCBjANfmE8iba2a331r8GvwiXq+t0MZO9JzN0N8B+3tV1qzMjyuPRIUwupyi/
	NNaKXWFjIs4mFRleBUnss/idzKIuCrDsnujWLJDAYBXzE32tmW+VPER4Ws8IS6/VnIs4VZ/uJ7w
	IX+rx2SXCGCaDsH2yNGTYJWSP/NBwD0ncyBxJYM2zHlcVPGqi7sDvA=
X-Received: by 2002:a5d:591b:0:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-484913b978amr7666724f8f.15.1788360845742;
        Wed, 02 Sep 2026 07:54:05 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:05 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Wed,  2 Sep 2026 16:53:38 +0200
Message-ID: <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bridge-specific firmware parser may have more accurate link-frequency
information than the generic ACPI hardware-ID table. Let it store link
frequencies in the per-sensor bridge data and prefer those values when
constructing the endpoint software node.

Existing bridges continue to use the hardware-ID table when no
sensor-specific frequencies are supplied.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++-----
 include/media/ipu-bridge.h           |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 47317c423fad..5730a95767a2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+	if (sensor->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     sensor->link_freqs,
+						     sensor->nr_link_freqs);
+	else if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..81645a5f8709 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -133,6 +133,9 @@ struct ipu_sensor {
 	struct software_node swnodes[SWNODE_COUNT];
 	struct ipu_node_names node_names;
 
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
+	u8 nr_link_freqs;
+
 	u8 link;
 	u8 lanes;
 	u32 mclkspeed;
-- 
2.53.0

