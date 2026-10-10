Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C13C063A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647792; cv=none; b=T1Y4tJZCJeb0ZKYXPIrpET4PzGwFQuE5iJcn4I6Be+obshI5SAU1L/mKdEFhNSwn3js0RTBGp1DQyVS/4KFHbDUj9gcFzxf7n2o3mKKfPN+4/j5pTI3PmGy6OLjyDK79JiRRK9VYebhPE0uNJFz1GB6sm7J4YBYyECa6vyudQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647792; c=relaxed/simple;
	bh=WKnLYgOjHsP4cA0eTco663J9nqhRW+AAiA2GG7Nvls0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QM829DXTZoZweyJXcbHAlzWyBYGWLdEmLfeGORobdhfP+MqOQlSjmhVYhBqNzPznR/wdmDHxPYzr3/0/djdhIwyxdSxXwZ/iGJy7DHT+dX7KDOi8e03OMv2lzT8X6N0ZJPaoZiFdVQ9zDmi7OtE8ZCwHyxLH7bkY/98OG+TYQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBuZEVGj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBuZEVGj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afe75f055so599999f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647789; x=1792252589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWkFAN8xiOdJ/DDEcDTiPY7n4+mNufjxnR1mpIq8leg=;
        b=PBuZEVGjTf8h15GBD3gzCktnrjiB/Fhix2eELwyX8qLxGd6c5Kd3fRpPbMgG+iz2Rk
         fJm/n+lfeqC9Z9J/s6Yq0ofoG89EEsYT8CiXZWqzpkusyiXtnbK68zjsneQUZnCDn6Xy
         FKAGepjXWKQZfyiWGD+kl58wSvVtj3mK5yo4863a7J4CNR8ZkmT2SXSf1nFHbbYMgKIr
         Jm2O1x9q9NxrzWt5EFt/aDY5CFZ5heBI8DsyB704RqBuy/UOoBgBTpkHUJqQJ13RVk41
         nSHwcoNPHHd+9+OzIcY4aSUl2XJbSLhoHdteCFMGXjPJFFPCIvrvTZ8w0gx6V+P4Yi+c
         zGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647789; x=1792252589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWkFAN8xiOdJ/DDEcDTiPY7n4+mNufjxnR1mpIq8leg=;
        b=j0jQL/ICKYw6VUPh7RDjHMIe6ZXyO5Sh5rQYsy5pXmYL+7uIm/dKzlKR9EX0U7P8D6
         Vev1jETCGFKHF/9JbrnPD0EOCpZZLG/3rtcwi07Me4LDcjgYHogvqhMNlYR0Xkf3yEqY
         CgkoZSlbI8gSONk3GsbMrFBeMGuQOwGxSBNLEjDmGdPVvGc8KVc8vuJMTrfcMce6Jq7o
         NblvOPvsOhOoPYgja99K8b46pGclm9DCQwDv7XObHviTNlxScP2Pp9+TzMNG58ef1HzF
         fLIYGDJ1i+ZKb09c/gHGZ5JN/aimlSgW+vpeNRWJigL0m3Okd0QeZdSGhSDc1uaaNlmy
         p3JA==
X-Forwarded-Encrypted: i=1; AKwUvBxlFXdP+QZ03iGSs26OKTHn20oRQ3lSNkW3FtPy4EdvCqJ/pz+7DpefYw+n0p2oPOKEmTCyE0Rjs7VlEtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPMHN3IpGXsvt224lQBiRsWVso9EVvxAHbgbqsUmsgWYdOlar/
	Qw4PmGytDwkeSDBgoRoIipMF9VYCRaombByGGnvDsdASrTPcDqicX/o=
X-Gm-Gg: AYBFou0wzdJMrRts6P+uKnIp+ZJOvj5LaArNbCMhGrKfnjXVMor8KmG6WMymwIyB+qg
	CuJgU8DD63d/c103Z93ssjCdXbdclWwadDzVeW7lvxT4V7jlDl9W4czimpO2kAxMlbu7NtkkjdN
	eHltJ4MM2S5PXgGh1btiwBnvjeXKEatTr10bL1j5ej1pPp3TZmm9SShb3Y9xvnlmXpJgdZj+pEF
	idy5cxhEIYZD1TXsYl2c/iZAw2P4rmUcWDgB8cDlhmptu3YIgGSsBKGj9R5INSpP4ifGUEHkohb
	l3wnDtb5RROxMev7U96vdPq0DJB2ANLEek+2gAOhxFydm82QWpg6gWOnNbx7N1+uPzoZ7lrtOzh
	SUzroUeEW2BWIRqyMyHA1DC0FrlxDkErO9WmxY9xGyHfdB+Rsl3BTAi/rppJrF4gZyQXy0arpRF
	Ero/47UGyhFPSpYBUyGtg39e4EJx28AzW5TlD6HjGbPW4VLuWtZKz08MikTx5KZCCpmzdUwIvzt
	C2UVXgp7rKmKpDH3nsHxFetRfMYpS2lmumwbAZmUYN7kYYQUioVwTU=
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr93705125e9.33.1791647788532;
        Sat, 10 Oct 2026 08:56:28 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm138023065e9.14.2026.10.10.08.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:56:28 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] media: ipu-bridge: don't reference the module image from software nodes
Date: Sat, 10 Oct 2026 17:56:25 +0200
Message-ID: <20261010155626.2766298-2-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010155626.2766298-1-dmanresa@gmail.com>
References: <20261010155626.2766298-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes the bridge registers are deliberately never
unregistered, so that a later rebind can reuse them. Nothing reachable
from them may therefore point into the module image, but two properties
still do: the "link-frequencies" values point at cfg->link_freqs in
ipu_supported_sensors[], and the "lens-focus" property name is a string
literal.

Both dangle once the module is unloaded. Re-probing sensor drivers then
read poisoned link frequencies from the surviving nodes and fail:

  ov5693: supported link freq 419200000 not found

Copy both into struct ipu_sensor, where the other property names and
values already live.

Assisted-by: LLM
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 12 +++++++++---
 include/media/ipu-bridge.h           |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a..aea4699 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -290,6 +290,7 @@ static const struct ipu_property_names prop_names = {
 	.remote_endpoint = "remote-endpoint",
 	.link_frequencies = "link-frequencies",
 	.clock_noncontinuous = "clock-noncontinuous",
+	.lens_focus = "lens-focus",
 };
 
 static const char * const ipu_vcm_types[] = {
@@ -623,7 +624,8 @@ static void ipu_bridge_create_fwnode_properties(
 		sensor->vcm_ref[0] =
 			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
 		sensor->dev_properties[3] =
-			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
+			PROPERTY_ENTRY_REF_ARRAY(names->lens_focus,
+						 sensor->vcm_ref);
 	}
 
 	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
@@ -636,11 +638,15 @@ static void ipu_bridge_create_fwnode_properties(
 		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
 					 sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
+	if (cfg->nr_link_freqs > 0) {
+		memcpy(sensor->link_freqs, cfg->link_freqs,
+		       cfg->nr_link_freqs * sizeof(*sensor->link_freqs));
+
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_LINK_FREQUENCIES)] =
 			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
-						     cfg->link_freqs,
+						     sensor->link_freqs,
 						     cfg->nr_link_freqs);
+	}
 
 	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2..7c89fb6 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -136,6 +136,7 @@ struct ipu_property_names {
 	char remote_endpoint[16];
 	char link_frequencies[17];
 	char clock_noncontinuous[20];
+	char lens_focus[11];
 };
 
 struct ipu_node_names {
@@ -178,6 +179,11 @@ struct ipu_sensor {
 	const char *vcm_type;
 
 	struct ipu_property_names prop_names;
+	/*
+	 * The registered software nodes outlive the module, so the property
+	 * values they point at must not live in it.
+	 */
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
 	struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
-- 
2.43.0

