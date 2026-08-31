Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D137DABC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199288; cv=none; b=bga84ZoHZDSfPcYK29IyziFPRYnKKvUtr59m4QlPZjBsDJkkUknIGgf51hgWTk7oKisZfGb1JrAnZYZfCDHsBlrWPX3xyvuQkbb3oejhrlVe7YIGT4DYanNhDDslVyTwv2Jn5NrJu2nU0oMnSAoSL872SlPwmPE0Qo+QHsyBjeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199288; c=relaxed/simple;
	bh=e4MUNal98QDFlUtIBqFtkylSQCrkzf7DR/AocA/eU1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFtbpT1DaVFOacUaNj/A5u2o51KHtmN0v3uTLq/CQoivWaX03OtYs8xHTagbq5YJk86g/Y/WGJg025LwBu9FMOyiql7mgG5SVKvyByVg0tmzQEzJMIGPa8ZrrFJ3q/xM+c4hQkODlBnJh0kWWmnrLC3Rh9k6pLCDv0wwlWuoKkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtXtKV7x; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtXtKV7x"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-484392e3d33so943004f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199284; x=1788804084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gkOWRVQG6iCB/P+zlnyDW+laFCqIIA6uzGOxBXE3Sw=;
        b=XtXtKV7xtlMf7uoUYCOqP/r4Khq/qj5JU7UhhqCeCxpc65WX1xwhcy2d96mHW164Jh
         uE01Obs8ZcxUpORCMtaoKoJ9JiNgckro70szeVPSSURrAM6xa+YOzogtfiaev1xS+OHq
         6eur7Rt0ynLGdCHxjZ2RV77m3wJK3XRqjkJMUZ53gKSGTjJI1NBtBlKwjaxqjO4RfOAD
         bu4Zv3WcDigMfrLEMOuW4gN3Ss17byhbH8yWHZlwLPBlLqcTRgeFopzdDETi3zpJt3Gr
         xU/8BCFkTSrAqJVJcllwtdjO3aNNszBnN/VwzmqHjsLiqbOWCDgWey23Ytb/duxSHy+D
         6dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199284; x=1788804084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gkOWRVQG6iCB/P+zlnyDW+laFCqIIA6uzGOxBXE3Sw=;
        b=OPMFDZqhRrzqizSLwk9ZWiE17Cwoj/ASyfZC7cEZDJaW+9jdEv/EzLh6oR3XBSYCTe
         LRvzHSsFUCp6hp8G1K0wVRMffY5GtpyO1u3sFILIcHMchLEgbUT0aivTe3dlDvAeO3mV
         XEq4JSH1cvNWiJ2GiGonSSvydUsU7GeKGDxvxa4ZP9a2s6r4a/KnSwN34eYzkWE8Dgya
         4xOMm8L/3cuy7lBDzlU4x5scI9jdbsNHdLXdcKWQDsIKucydRgVLc6nvQO2jExc5SPfx
         lsbZ6SbL4tJnzOxeLWdf2fxHEzc9P0S+DjuGZ/f4xc7rC/RzE6ksZ9rzwVQRLk8p36vC
         6kcw==
X-Forwarded-Encrypted: i=1; AKwUvBw5hnHKRzn0Lk5rZfOtvT6suaG7B4PQdCwXbXHi+i8OD/U29ythF9JRIZm0x45XhocR+t3OgkXiufWnsfk=@vger.kernel.org
X-Gm-Message-State: AFuF++ng1RQsnXK8RGwDKuf6SwUCI+eexW2VK0V1/1Yl6oVBzs7libNJ
	FL3o8XimTiLSvJ+fqRe3NboX1ndaYdsbMNoB5Dt2ZQIEg2Z8pvXIcHt2
X-Gm-Gg: AYBFou3XiGhUxSaNe3ogWhcUnCqP1niL8JwbAQyz7ANmr1jU7eAOmks3MLZm9PxH+yZ
	gTtg7lbR0DFT9b6qf+cw8c4JABjxwGbwuyIY1GHgk8Cl5fraFk3PPkLW1KYJGkuvVYqz0KsJpUY
	rngLVEiTr5Qo2RNTGQou4+WlqQ0BaXL50bITZTjTYP+mWgSrnmDerOhK+RU2DRtQeeAPRqy3YWh
	1j+Gz9t8NSMbWG3vblbw1UyNuv1bzjdQT44ev4cafOCUXexfvI5VqCgqfvqkYwGsc06oA9gLgxV
	qDc1QM3uPkhO6PUfV+De1tEdY54XxlY0jpuKvtwTDSfRfEJpdbhe6d+KFN11jgTPU/Pw+5bfuoT
	7cK2TMz38xUa/7saW16D2huVJG7EglH+h7cjK8XqFQj3ZZ9iK9daSUN5dlGaj8xNYWLSX2T+UAT
	m2Zt8SWPQhMh8T1wk4ChMzexqGrU/gFzJaIovffzZAjhE3w5znnzheVdm4awH3Zu6t+t48cH3qC
	OANto0HPnGzM811DGO785/Zv/hbK9e1wUsVme3sEuc=
X-Received: by 2002:a05:6000:4211:b0:482:f530:c45b with SMTP id ffacd0b85a97d-482f798a6c1mr40756497f8f.5.1788199283678;
        Mon, 31 Aug 2026 11:01:23 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:22 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Mon, 31 Aug 2026 20:00:54 +0200
Message-ID: <20260831180101.3109854-10-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

