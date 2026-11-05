Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900022;
	b=PDv8PAzJIGUZKWL5UUU9C4fpFzrrWWRZ/pozXkt4g7bByohyVzDbXt6CzkfMquVW/z0/
	 cJ7eKJx/w6FsD86Eb+muRQtrzrNMvQO7XZsHn/OuR0H9r8BKoTaeGNGwIZubz57f/Yr8u
	 8Qb/3FCE3cV+L0XESJzQQ7aNpu8pXHGR0QXoVjJKsiNTAqALVq4TxVwk7LiUnocVQB1lc
	 9Mj3B680fB7qYL/UDV2mLjG0psy4R3FMTgpaGBIlmK+7ho02u29qmSZv8qVnvX2HXrOgG
	 L8XFZ8gi5LdGFNFrXELMRghBu7hFsyho66gkoJXSISgZ2sHragbqsRYnv0smGKjCZeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
	b=4HNCIdKMQ41D50viMy+uMIAegxHfhWgF52Rq83rpCqUV6Jxvs6kQYfssLlRu7tLncyPn
	 D3g9pqhwStvy9mJA9S09w//k+yXNH1G/06vhYGrMSj0ZLMzFopyhnb53q+FeXHHgSb1+g
	 V8SLi5uxdnS0K6F6NLMXASgggKZlCwD+mS5ZagVBZ2R5NJbaKcvUTnRJRBvaF3sslZu0X
	 Y8qw/GMsNtpI6xjQMkYyLMDAo7j7sc1fNZAiHfCz8K6emEg693oB7m82ahFVxJmwOzQLA
	 1t7qjts4ynXHpY+NX5LEsBHpsGYP4+ciyg75ku/nvtfQcCCbOP2FLr0U6kTtpiK59qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyF6YzYk;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D7606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449D7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyF6YzYk
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53512cd2f85so24463141cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900021; x=1794504821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
        b=GyF6YzYkwcfyfHnKibw8IIeooBvfyNHxkcAV1jJMTNU5vjvpnqKowG+uY7aet8ZC56
         bCDc2TnFAVbFHLSslzTWYowdMjW9xyNPrtFSHUJNrfVjj2Bsk3nohMzVdvyKoOYPPbZ5
         fwxFHNggWViaS7BwqCT9siMysvEgTFAEn4DvfwkkQVBZgF/vUg65F4lj6qmojUVRFazq
         uhYeVWakNOtCHxzescl7opm5E84JIE63yBwP4U0mcwPb64hN/pNzEIiT4TULT6rpcnL2
         8VcjlFTJGWMaSO0GV14/qZ3d7w9AaogkU7FRwen8DJg/A3vWBMWTeKi9pM40ixb97G+b
         Vvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900021; x=1794504821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
        b=VXiB90hSP3v03PpEQtWi/Z1z4GKRRv9xmuFWxcBmPLN9aXw2oVWfpIucPrW8hBARys
         WqFY5d7zk4rMwEM8oubXTHVtgArQfAJsm8MmS0OWgcBhDOwWeUViLfQmRcrwOHQfbKkj
         9VZ+hgeB0a7YNTAI8aPY1yPNhWaWDc9Wq7UtmDuEPulJY2wlRdt19asjNrRQvINE9qWh
         1QJuSbf/3YNsHcN0cCFOEgpJsKI6PdK+eWQp4spzcccVmY5f/7U8GYGIZWxYWR8pxqLu
         fssXXFHOON27e9ILQp4ePv6A05FFg9gG/Ke6O1PdCvAcdFU+xpJdTa6BF9OU77jVdBeC
         fHcg==
X-Forwarded-Encrypted: i=1; AKwUvBzCqbRQtAPTPxojhY1RsXjdB6Ce8KecVuoh+P8lRoy40NqR4J6f71vOv4JwUrxzekIO5DBUxHiaPsyYGYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WBGJlv3Bu2DM0TEVWy56V0I9wPjDaHOsUJNcS9I4jqeLE3s4D
	V4aETdX2nPtCzA52WehJGQAifhCg1zopj2KDkLfGYOpFZkyrBIDuaEGVPjqMhA==
X-Gm-Gg: AYBFou3M/Fd7rFbp1R4oqXumWS4jp6zaFW/FZzZroTGsOvzCzMTB6NxVCPgQ3NR9IaH
	9KDlcWW+TUAlKkTDvmETMn2+1oSyhimHKBbpTQLYHwxNZzOulMuptIPWLoENFLkEI+xzNCESj8Q
	bNldSiPm2+OzsxyURV4eAQGbnyduFBu0z6MyQT6fusIuAdaBvOztfXuD07RrcHJFPU/79yLJrSY
	NcA96gx6/l0eLQlyjqvBcjL9zTF/pyZRqgRRvQnyPssqRtdLqtNR1xQYUILu9UDL94XvVgEPRmQ
	En+btRS7XXvCcUZprRSEEqdvYl5n5McdnBDfPv5bQoiqMfPL7thRjw3xq72SQgJ+butXFkia+f0
	n2cpsbkx+QOT6wTACRrWKDyp27jPYpGkpvtBcEnbg1qCrxWCdFWEtht9SUIPDe2MI0dyUgIzqAa
	aQ67Wfuy6lhjCXSxpiM6lORotTSoKp7UTYm/cYvXAqORVCCra6IqM74tUgVco3dQKep/y+q0r3o
	k+b0KgPsuV+C7CAS7KEnaaJF0akCyR4EV3KU3etOw8uIOy9IVcECddWoxz65a0oJjU8v7Rf9ie5
	fcXzsZ0qNPNLdf+2z+ixvX2JnEUvd0HM47jseyZq+Ezm9vpzu1WK
X-Received: by 2002:a05:622a:5c8:b0:535:87c3:79e5 with SMTP id d75a77b69052e-542b7141181mr318589391cf.39.1793900021149;
        Thu, 05 Nov 2026 09:33:41 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10ff4bcdsm55937041cf.29.2026.11.05.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:33:40 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] remoteproc: qcom_q6v5_mss: Leak metadata buffer if reclaim fails
Date: Thu,  5 Nov 2026 12:32:24 -0500
Message-ID: <20261105173336.32359-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When the device tree describes no "metadata" memory region,
q6v5_mpss_init_image() allocates the MPSS metadata buffer with
dma_alloc_attrs(), assigns it to the modem and asks the MBA to
authenticate it. It then calls q6v5_xfer_mem_ownership() again to
assign the buffer back to HLOS.

If that second call fails, the buffer is still assigned to the modem,
but the function only warns and then returns the buffer to the DMA
allocator. The pages can then be reused by another part of the kernel
while the modem can still access them.

Leak the buffer in that case instead. The driver has no later point at
which it could retry the reassignment. The MBA and MPSS regions and a
"metadata" region from the device tree are never freed, so this is the
only place where a buffer that failed to be reclaimed goes back to the
allocator.

Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. Compile-tested
only (arm64 defconfig, W=1); I have no Qualcomm board with a modem to
test it on.

 drivers/remoteproc/qcom_q6v5_mss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..1a5afce4e6c1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1128,9 +1128,12 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
 	/* Metadata authentication done, remove modem access */
 	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false,
 					     phys, size);
-	if (xferop_ret)
+	if (xferop_ret) {
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
+		/* The modem may still have access to the buffer, so leak it */
+		goto free_metadata;
+	}
 
 free_dma_attrs:
 	if (!qproc->mdata_phys)

base-commit: 8396089f91fa07dd77b580e045334e670f782ff8
-- 
2.43.0

