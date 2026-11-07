Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044203;
	b=EVNIH85fbftfPlPTV/iFncStjhgiJTwtgdES1ixEQhU7LIH/Q5dRLmNu5M18bIvk92rn
	 vahz+hhWBc7dNvY2d1DVlcjHgsPFFJTQ9GGRXURmNiew2LHdypCYxV1NDzaQg1aFUAgFi
	 CgpT+MkB8NoQ3S+YxcGOl1prY7vpmFwYmr64wOh1se7+0FkgBNq3exfokccVg4YazaPqW
	 /RR78xNc0AR6mIHhdnH7CYFw7cZ26F76Yql1TpIm0W8Y+xMEdUMEtc5rybLTo6WOcAqKn
	 gWYipfDAWj7kps/lktUSHFcLJsQtirrGYIM2al2CBJahwi8QxFJUqdsUM4FlHxwiNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYMGUU2CIUg2D/sJH1ZfexvtxFBIZgq+4u/YwuahtNM=;
	b=jGRf2Y8xeW8tdvrF+m07iv9Sv70eCQvuIEnLwJddIZju++hsNLJg8TcSv6y6B9MQHw7O
	 Ga353AQBb8yAKihWcGTUdr6BnBQ/Ar1In2f5/nbW8U0cCr+2ZA2FIY9HIKjzhOel4XkqO
	 0OmdoeKKtpOUMohhiEUIsFV3ZUxs1sVCNdMjHs5iA1uk+zpy5A6cU6Ff4KgP5ozBF9sZ/
	 nJNtuban2rBrlK0vOetjpvS26FTFghI73HVZg3VRvttHm5ofznWDmxh5wd7NwrPjhKWll
	 iQxkFz1e/ADvKuRtrcffYSFCk+qloZlVGXsuweATfO3m1LmPDlKxDxG6cQSRppxYpoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNTPPUbl;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432AB606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432AB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNTPPUbl
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2230185eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044202; x=1794649002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYMGUU2CIUg2D/sJH1ZfexvtxFBIZgq+4u/YwuahtNM=;
        b=fNTPPUblkm+ze6yDmfRu4A3WkIwa0RwHtg73bpPLPYy6PTkenx+898Wpuu6duwCnid
         JDKlmv7dSB+aLXnhgwzFCvQNTN11BvFPVv47eFO8YtsU+YJvLgRAnJ07I5rC1nRo/Htr
         B/UnC9FUo6nQejx8DUIgwLPFMFo2cdbjufe+VuD/6WAWr1+CrmHDdvUOa34678vUBbQv
         CtrWJ6PxD+0lAzUf0MV6PkYzS1gAJfd6UrSkE+C0VIzecS6AClY0nA1zmmkeysaE5ANN
         oQDJkyWRrn8jIwHX/KuuiSxu3NcThoyt8O+9JPiuXhjbrhjyQBlGVdgEIFLNFJbtLS0Y
         YW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044202; x=1794649002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYMGUU2CIUg2D/sJH1ZfexvtxFBIZgq+4u/YwuahtNM=;
        b=mVft54bmhE3CEKb+aD/Ofu0Txk61oePcxwcR+qrzyimFjWcnVLsKm1i1MrKIeJJoyU
         66TB4wQ3MNucmCPDsnJakxuRoGu7Q3WDLAiE3O2Zr2clBQhu0iiUY6NEYvKolH/62NLR
         87VEr2xgkedoAB15bS1e8g+OxX3LgG7FWtMBfwx+qyYv7mm+2eWEu9aaA/j41nJC0M4u
         ZpDUyBIca39188v5cv8wno0J+N36gNs1bkwbBfoyxVrGP4GL4gEItglVGijg/Ncx3hzn
         H0CBT+LrFU9kkBGJN+zjeQri/pGrCFR8w70RenuCgRvg2UsTWzPcdb2EZ91Dgb063YlD
         hD9A==
X-Forwarded-Encrypted: i=1; AL+hErFsVwP/DHauJFxIQsdfQVTWl+afmmifZjM2spstPY+RaVYa/g5bCk56yNa+pL4i2GAiOYxoI9maGrfz6/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JhkkDgKawVDxnab7dShPMCj6i/MJ5XnDBzTeqLLDo6/zq03ie
	LSRJ3Aw3CVGK1A8Dpem8AGAw9MO2adzIsLM0LgTiks+Bn2Q3oKoIUKZL
X-Gm-Gg: AYBFou1RophEaXgeEJ1WlU4IrwNZ5gdRquBKeJBLqx4vJmlpPrYYEp4lzMo21qY7ULP
	kkW1yvuLFmsil9SY3mOOA8O2WSv3Jrh5HtU2Ia81e7F7FZ+H1IIKQMeTCgDqEg0MXkyt/a3gE1O
	NKtxXs50H+/f7sFRxFb/+uWjp3vUVNFt3x2adryaMjWEK0mKS5I2j8b+XKjjwpPFFLyXHDPkuJp
	PMb1jC1VZgCm2/sKsDIxHsa/eiFOacF0sdL5UJ7/xC+P6qCdyMvVSCpIWNLwElVupc4suQ8RsSy
	dIN/1nmCLeW26IL/RdNN4v0GhOSwiklJfijjtvAHyJJRHjL6Ccp/6pzjO3UASgggAFLyeCi/DSH
	cAyI4dP8m1or7iIiyMHJE/xtuLRKIwmLBIUuhjudv3EVwB2N+XqBwOl0nfyjmv1xBQg4sG5AFFr
	bUDDT/UC3ntPnWLbya/acBnKlzO+MqXC+ZU87QeBlJmtLAqhzcOZNRHcqHHWIm9y3CAEMyQnR6T
	CWj0nS4gFwqdKbzlCAHLI8t5SD2SY35xVuXe+YmftBVRZx0BRzOpfUZWBwCICbvdx0yDIp6HKYq
	SyplK8wCYVEQ6KZ7X5+gFuMTSKsF2MfVRJCeVWBEfua73YhuVw==
X-Received: by 2002:a05:693c:881b:10b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-36f75b2c6e8mr6595097eec.15.1794044202281;
        Sat, 07 Nov 2026 01:36:42 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:5e01:ca5d:8cda:211b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm29803105eec.3.2026.11.07.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:36:41 -0800 (PST)
From: mdshahid03@gmail.com
To: ketan.mukadam@broadcom.com
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] scsi: be2iscsi: Fix NULL pointer dereference in memory cleanup
Date: Sat,  7 Nov 2026 15:06:11 +0530
Message-ID: <20261107093611.42311-1-mdshahid03@gmail.com>
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

From: Mohammad Shahid <mdshahid03@gmail.com>

During memory allocation ,DMA memory may be allocated successfully
before the descriptor array allocation fails.

In this case ,mem_descr->mem_array is NULL,but cleanup path tries
to access it.

Use mem_arr_orig to free the DMA allocation of the current
descriptor and handle previously allocated descriptors separately.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/scsi/be2iscsi/be_main.c | 34 ++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index fd18d4d3d219..95706b5db7be 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -2549,22 +2549,30 @@ static int beiscsi_alloc_mem(struct beiscsi_hba *phba)
 	kfree(mem_arr_orig);
 	return 0;
 free_mem:
-	mem_descr->num_elements = j;
-	while ((i) || (j)) {
+	/* Free DMA allocations of the current descriptor */
+	for (; j > 0; j--) {
+		dma_free_coherent(&phba->pcidev->dev,
+			mem_arr_orig[j - 1].size,
+			mem_arr_orig[j - 1].virtual_address,
+			(unsigned long)
+			mem_arr_orig[j - 1].bus_address.u.a64.address);
+	}
+
+	/* Free previously completed descriptors */
+	while (i > 0) {
+		i--;
+		mem_descr--;
+
 		for (j = mem_descr->num_elements; j > 0; j--) {
 			dma_free_coherent(&phba->pcidev->dev,
-					    mem_descr->mem_array[j - 1].size,
-					    mem_descr->mem_array[j - 1].
-					    virtual_address,
-					    (unsigned long)mem_descr->
-					    mem_array[j - 1].
-					    bus_address.u.a64.address);
-		}
-		if (i) {
-			i--;
-			kfree(mem_descr->mem_array);
-			mem_descr--;
+				mem_descr->mem_array[j - 1].size,
+				mem_descr->mem_array[j - 1].virtual_address,
+				(unsigned long)
+				mem_descr->mem_array[j - 1].bus_address.u.a64.address);
 		}
+
+		kfree(mem_descr->mem_array);
+
 	}
 	kfree(mem_arr_orig);
 	kfree(phba->init_mem);
-- 
2.43.0

