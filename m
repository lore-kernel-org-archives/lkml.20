Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48363B71B0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477561; cv=none; b=tKNEmWbrsmskSEnMKRvqaIJD8hoBShSkqvwwf2OCGX5EjqXSLdIKp0PM7CslKrg8r4FBZmvRiJPJtLJ5qsgIOcEeyKk8EgxpT7EGSwMKTffNsVKQoUM13zR4zw752nBvrEEOpMMM1V2DIq/GXjfMZaaU++od80m3j9e75knwFnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477561; c=relaxed/simple;
	bh=gO2kWIP4b0dPnTPjD2V6JMmtB59Qf8QCafdjPrzdkLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFx8W/2YH1DVuHfzLA42MTiMGSuXNlcgD+z/p3p6yTt0ZrBE37z2wDrXptuVlL1+IUOahbz11v/Mmlz8Q8930EywkBW1mv2cKQVaI6WJYyXoKrRsHcKdImklD21Jl17NoPv61CelE45q2pFuVbIJIgqApjyubPtjPBwJun8y0QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyV6urIS; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyV6urIS"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a9baso178144fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477558; x=1790082358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLVpuIWDh64oOKbkDCist7rvO7Pgf4HJPnHhedxrwCU=;
        b=KyV6urISlhLmy8UMXDQYqE5DRdKEueHdhPF+z1QtBdIQpd2bcw/A0NBvrCQ7VV968W
         bb63+zSC6Fvf5OIqNdB72JVBpkCzRzzxODXSAaLAu5xQSDBstf1zCXMvcv/PxkK2WyCz
         iY4+LAtuJDTbITsxCk93+1J0wLmsf6UT+e3Xq5XExGXF9Xjqgf2BkJb2B8eGLbaEoQCO
         QnwwyHX8ogUIJnAQoclkn+sIIGCJBWXbj8wTlqik2P8ACvITY2pYDeg7fsrgo1gB/eDn
         /JBvVyjVpItee44xG7COelywsdXYOvmk0tQniZl3SQrwrsZ5cY076ewgFbGjQgUaWiuM
         KAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477558; x=1790082358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLVpuIWDh64oOKbkDCist7rvO7Pgf4HJPnHhedxrwCU=;
        b=MGgZWwmY9RGq5tI99cl4bzy2T5tujL8zjXzQ02zvbkzaxOvhTEXy5xmEc+QpkT0SCx
         9Z/HKfnjYxQcbwgx8G4bYP+zq4MLoXVmbpIfzebBiGEOL0b4EklaJqeWFf8uAi0Ic1p5
         d0om8xK8PKT2Oxc6kVodmOmDvnIip7lXCamXPDM7F9m8idRIk+EPYRKQ89i/SgrLaBdy
         Dn/0siIHhslW4jK8PWQ/OIFtAl5PyC5vi895fvNO2EfrC8ihvVnI2N1/yq1YBikZZMP/
         LddNEBWPMyW4gmZ23c0k9EhM3w/too9tHCFZKCzY1xf3WEb9TuJ5MCMWqoghFyGzPCV4
         51Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxGgyrtZUrSvfrr+nP6vISPCXJjZMPfx4WPOaZUtJE/9E3Fn18YyjYJszeUzUzDoSJhErIUsibHlGsIx88=@vger.kernel.org
X-Gm-Message-State: AFuF++mVQn0RzAqc+tZ/Ft8Cjyx7h6qM4HZcbWqzlDDBil7KTe5ihMuN
	BPCw4ELO260P111nMjFVMDWGEfXhhF4GAj3cXKdPI2ZAlTI6kHvDRt8Q
X-Gm-Gg: AYBFou1qMnAVWPIxu/qtKyW0dW4C8ilv//RUmszyITNhqZ1q8k672P9UHBguKjeefBa
	w21uXxsxYT/dvmiOClTkCfOQ5Er4oAKKq6Z30XvfEOJGNXtZypjgBZHk9XRm4TYhRgbTjKd/6X5
	uzgc0f75Rr7HLGQzuq576CNurgChgcK+yIuLb9MOAaKPNxH2hgkmQUqSeR2ErvBE2YiTuma60eM
	n3UbIo7zm63pGBQagGFSH797t1ds1H1xCnjCRdmFYYsgbRF9vX/i0XVSmIOob8Tx/HL62bmK/SV
	JEDchMhH3absVgaGv6+frvm8RDUDRYDweKVCUU2HAEViDI+0YMfJ+AftCO9ffEFVWuok9B7n6jT
	z96efaypkXcrzeW2Pzph6OAn8dhKH6ZkYZHm6hiblzCO9N7YbAhM2fqIELBQ2AjP7kMvrKrOW63
	WshLcvZn3XvHD9xM53Mh0Ubq1mv0UBzcPVm4oDu8ANRzzbg+kVXeOZ+CEJZvmqaP9z1fIZd4zXS
	12FJt0xmtCFSAb7
X-Received: by 2002:a05:6820:4b89:b0:6c1:7804:55ec with SMTP id 006d021491bc7-6c738db76c7mr560877eaf.44.1789477558330;
        Tue, 15 Sep 2026 06:05:58 -0700 (PDT)
Received: from ai-agent-sv-01.. ([43.135.169.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf11e6af6sm1299889eec.3.2026.09.15.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:05:56 -0700 (PDT)
From: NoNine <chenmin83@gmail.com>
X-Google-Original-From: NoNine <min.chen@siengine.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Min Chen <min.chen@siengine.com>
Subject: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the device
Date: Tue, 15 Sep 2026 21:05:03 +0800
Message-ID: <20260915130503.645953-2-min.chen@siengine.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915130503.645953-1-min.chen@siengine.com>
References: <20260915130503.645953-1-min.chen@siengine.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Min Chen <min.chen@siengine.com>

The flat ETR buffer comes from dma_alloc_noncoherent(), which zeroes it
with CPU stores.  The DMA API requires the caller to sync the buffer for
the device before the device writes into it, but the TMC driver only
ever syncs for the CPU afterwards.  On a non-coherent sink the zero fill
is therefore still dirty in cache when the ETR starts writing, and its
write-back lands on top of the trace data.

Add a sync_for_device() buffer operation and call it from
__tmc_etr_enable_hw() just before the TMC is enabled.  Only the flat
buffer implements it.  The ETR_SG and CATU data pages are synced by
dma_map_page() when they are allocated; their remaining corner case, a
barrier packet followed by a live-drain re-arm, is left for a separate
change.

Tested on an AD1000 EVB: five first windows on freshly allocated
buffers, including the first capture of a boot, all without the
previous all-zero-formatter-frame runs.

Signed-off-by: Min Chen <min.chen@siengine.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 29 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb2..bf1d6c6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -689,10 +689,29 @@ static ssize_t tmc_etr_get_data_flat_buf(struct etr_buf *etr_buf,
 	return len;
 }
 
+/*
+ * tmc_etr_sync_flat_buf_for_device: Drop any CPU cache lines over the trace
+ * buffer before the ETR is allowed to write into it.  The buffer is allocated
+ * with dma_alloc_noncoherent(), which zeroes it with CPU stores, and the DMA
+ * API requires a sync for the device before the device writes into the
+ * memory.  Without it a non-coherent sink writes into memory while the zero
+ * fill is still dirty in cache, and the write-back lands on top of the trace
+ * data.
+ */
+static void tmc_etr_sync_flat_buf_for_device(struct etr_buf *etr_buf)
+{
+	struct etr_flat_buf *flat_buf = etr_buf->private;
+	struct device *real_dev = flat_buf->dev->parent;
+
+	dma_sync_single_for_device(real_dev, flat_buf->daddr, etr_buf->size,
+				   DMA_FROM_DEVICE);
+}
+
 static const struct etr_buf_operations etr_flat_buf_ops = {
 	.alloc = tmc_etr_alloc_flat_buf,
 	.free = tmc_etr_free_flat_buf,
 	.sync = tmc_etr_sync_flat_buf,
+	.sync_for_device = tmc_etr_sync_flat_buf_for_device,
 	.get_data = tmc_etr_get_data_flat_buf,
 };
 
@@ -1113,6 +1132,16 @@ static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
 	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
 
 	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
+
+	/*
+	 * Hand the buffer over in a state the device can write into: drop
+	 * any dirty CPU cache lines first, or they get written back over
+	 * the trace data the ETR produces.  Only the flat buffer needs
+	 * this; the ETR_SG and CATU data pages are synced by
+	 * dma_map_page() when they are allocated.
+	 */
+	if (etr_buf->ops->sync_for_device)
+		etr_buf->ops->sync_for_device(etr_buf);
 	tmc_enable_hw(drvdata);
 
 	CS_LOCK(drvdata->base);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27..3dd17da 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -277,6 +277,7 @@ struct etr_buf_operations {
 	int (*alloc)(struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
 		     int node, void **pages);
 	void (*sync)(struct etr_buf *etr_buf, u64 rrp, u64 rwp);
+	void (*sync_for_device)(struct etr_buf *etr_buf);
 	ssize_t (*get_data)(struct etr_buf *etr_buf, u64 offset, size_t len,
 			    char **bufpp);
 	void (*free)(struct etr_buf *etr_buf);
-- 
2.34.1
