Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF343B3F7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478472; cv=none; b=P/z5vcXjMv7hCxJUnzyM6ob8+lONnDPOe9AGYLy00NUZ5FVtW7QlAWEPtxPZbt79kAfbrtGLgjjtCs0lhZ1DZqOZgc5+nhCYCjpWFCZbg4FBoSAhzP/jRAhvePJagqjLWzQdCRPlPqvcAsYpscX8WjEaMDTTC2slawS4i1KPNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478472; c=relaxed/simple;
	bh=5uxg7Tq62X7t4ONo1Iw+PVq8T9wcgeIrqkC2J/jYYlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWLWCbKfsxMODyylpFWXvmA9+P4OwONDC0L8DUxYx3rszo2iA2Vx2cRreyQTa65uATOWO1nkTsgIvOECRaw1Pi98qS/jJeq6YAFRNFRr3QITU7RwTH7yHE3UPh33XPXvTKKjFvVG6UeCfnYBsQdKu/BUM9uEHExXPEVRcOV2Dgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKy2/iNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIhFC7IJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKy2/iNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIhFC7IJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Vt52528290
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lglF8Jy2Eg
	aqPwPCoZsJG+/E9siJbnm0STAQ8lMENc=; b=nKy2/iNCtyVNJTfFPp/v9rqUG7c
	USeoeGQqik+ltzttwSNI5Swk2T8aXhSUTe4UW+aOXlOUThgBnXbhLLSWk8IqIiCB
	vi7NrrrVgf53fQ4hUtA2FthOLJu6t6ciyELUtMZ1V9raOdaS0B2YUp/kpoXzXEbB
	qh8I6Cf0r1qXktxqrr2/zB0DlAE14NAeEyIFROBiG+ec7KfLePj+8VaiSgJuZDKo
	H083AnKrTyuHhAXg2ELGIV90vGMvhjqAeEFZvTMJfmdjVtgVqSIsptpml8Tia2jE
	nvv1zavYGj1v9YshMvu1TzPs8vbXJopBG54z7crOn79o8KwbI5bn3TqWwDg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9rf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:21:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78a6d5cc851so744250137.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478469; x=1790083269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lglF8Jy2EgaqPwPCoZsJG+/E9siJbnm0STAQ8lMENc=;
        b=YIhFC7IJZGbdcs+D1CTU3NavCDmbz6hsOnI+whBpqaY7vyal44LOzmRes08EyMLqLd
         b28IJGXMR4KvzshD4IhLRtBUyFO+JjCuS9ecWZxtsR/kmLOIpXENaA1HeGUz3z1gXqAz
         Hs4EEXCLMOm8w/lKU8do4kgN1KrMcJarZq+r6YlIxf49BpQ1o+Wy03G/E8tv8nNi6yTD
         esD/KXmR9eI7dr5fFpgz12FVcHMyd0Cto3KxfBN1ILq1T0KcH2Uupbs/mSIMUh1BCP0T
         hqu6Dbcra41X7d4YCU/mmjOFVKbslZrQRjEBNI37qc61wVzuomOpERSrOlZZYhIz8Oax
         T5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478469; x=1790083269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lglF8Jy2EgaqPwPCoZsJG+/E9siJbnm0STAQ8lMENc=;
        b=2ln8fSJi7uT4/77WxJoQsh7L6REiaOtUK96DO37Z7HQiAtxuhyTuVwgDcmIMuM7X1s
         smoe8i9IAMv4hOIZlG64p2apARUYCNeRa5KAT37O0vRuPnFV4Ki6AvTKmSagKYCzPvuY
         6vmdECqXv7yNBI0R1MPVBwgDUGozjC10BTUAQn23PuKf/H0xyR2YjpGP7L8pbHkTHc/r
         M5uo9txxaTuemRnbbRAaY81K9dzSYeOMfOYvMIgFlMT+dGhTDqloHC9nK1jTyIeKL8JA
         WHS8kzhl5HYU6ISLdlyqTiknAR4IS4SCTM74WwAu/VNk1ZCC/twka1oa4S9qV3hAFXET
         hPTw==
X-Forwarded-Encrypted: i=1; AKwUvBw2ezgcPK41nuE3/sM8nr5UUyZdUluM7j3V9uT0quMLDlLfPimaTgPgIELlforwNgrTJ90M/aMUp89uPQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lNxXtVlq+jWekz+n3oCBS0otTzG2LZwl00w34rgSLB81RZo8op
	+O/bOQaF1IhiN4ok2eRUunU3HAHPkmSBTpuVIlRjeiBJuryqguloPrKLP3Qd5IhrsYzRvXIgdJp
	8DXgzvh+pVzb1mxGcg9tqWqPhlnKCJU7hSiETgkA8pSSL30QJn36xk/Bo2Mb2qLHmnmE=
X-Gm-Gg: AYBFou2gjCTuxlXNO61bk7iOPNIFSRfVlvCpg6FQ/cJ3EnkvEdM0YkbPssW4bugCK3a
	0J36et5jfOd6hyiEdSrliHCRw7ovfHmQZiTja3UeA4GyZpx7Pz93qH9FihTSCVY83Ofz9g2CbjR
	HLDd9Iiht4YAxZ9fnmLIGk3hPEGEcK28Asp3ve2xtiUnz8T1h9bp13oQ2zr8Fhl5G70OhQIB+ug
	6wqCvBeegGmu8Kd+aPdvoqsnvUlJpRIccHvFi2Zhnt4LW8QKuN4ksnVTG3puNm3tMFInmX28qGi
	OaeHrJ/QoIW3hnfuhF/SZRMqB9atiMa79aIRBpxL6ZAq+3I0JWIUFGUZFMe+qRCur9qx7iN74aF
	07OywO/9g3oORTghEYLFSS3AyQlzILcSAm3Y3uh2dyoIyYbcWTyqN3QFEeA==
X-Received: by 2002:a05:6102:510b:b0:778:5369:763d with SMTP id ada2fe7eead31-79b56aec243mr6728951137.1.1789478468736;
        Tue, 15 Sep 2026 06:21:08 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:778:5369:763d with SMTP id ada2fe7eead31-79b56aec243mr6728842137.1.1789478468218;
        Tue, 15 Sep 2026 06:21:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613c3ebsm582885466b.57.2026.09.15.06.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:21:06 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
Date: Tue, 15 Sep 2026 15:20:46 +0200
Message-ID: <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX9pZ2NK08MJBj
 IX40CCJzhaGCPqsYvLTujG937UVRsV8nfZ6HVIWJrOHW3KuLC9W3BNsJMeh9h4bwhPu3aSio/3d
 ZP/ezwOmIBo2q/+VLmo/jLtTGQl4PMs=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa94646 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=ZspSQYoVYSdymiOi6Z0A:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: I-1Pp401qhWHZbYJThe0btIzqt_ripYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfXyJ/CbTld3/Au
 Y1wtL3WL9mpR7+T9TbG1yxEgTMdaY3Qt09GrCoDgMGkn3Vt3RI2t07uU647WG7Bn3aF0nEIftr2
 ndQPKfxlBdRp4XggTn/+BWbWK2DYo9zRiw5ckXnJXX8wO8yI40zXB0fD9loF6LoDcqmhuaDansa
 I5cDydThvaF7qeptbJq+eUZm9BjjRXMRx7Hc56JpXSojNaTfAsy5nnXAAN62PjIszPgDCsqRxJ6
 IkjFFkWjmj9PtKDpctEn68oTFpYgtHP6qFPyHQTJxsiQRchybuTkuqrB7GcO2nAKk7hWd9bf7+E
 kIh2/g+klOqu84IUmSVECKK2SSmLu2zmZ7oTMHogC9sjy+qVIBfUcqDuogXY3ViVz0irTl6YzNq
 bRuLFqEI2lXe9d4kguyLoOPR2iCs6icNzp7PABGzQJ1atKVZqKPfhWMlxg3klhK8hum64XCGvcT
 NHIUqdP8tjPhQ+L4xNw==
X-Proofpoint-GUID: I-1Pp401qhWHZbYJThe0btIzqt_ripYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150194

From: Ulf Hansson <ulfh@kernel.org>

As there are no longer any users of these functions, let's make them
internal to the mmc core. While at it, let's also flip the order of the
in-parameters to mmc_alloc_host() to be consistent with devm_alloc_host().

Signed-off-by: Ulf Hansson <ulfh@kernel.org>
---
 drivers/mmc/core/host.c  | 35 +++++++++--------------------------
 include/linux/mmc/host.h |  2 --
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 1bcf0e917b59..8e9e61839198 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -505,14 +505,7 @@ static int mmc_first_nonreserved_index(void)
 	return max + 1;
 }
 
-/**
- *	mmc_alloc_host - initialise the per-host structure.
- *	@extra: sizeof private data structure
- *	@dev: pointer to host device model structure
- *
- *	Initialise the per-host structure.
- */
-struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
+static struct mmc_host *mmc_alloc_host(struct device *dev, int extra)
 {
 	int index;
 	struct mmc_host *host;
@@ -583,7 +576,13 @@ struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
 	return host;
 }
 
-EXPORT_SYMBOL(mmc_alloc_host);
+static void mmc_free_host(struct mmc_host *host)
+{
+	cancel_delayed_work_sync(&host->detect);
+	cancel_work_sync(&host->sdio_irq_work);
+	mmc_pwrseq_free(host);
+	put_device(&host->class_dev);
+}
 
 static void devm_mmc_host_release(struct device *dev, void *res)
 {
@@ -598,7 +597,7 @@ struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra)
 	if (!dr)
 		return NULL;
 
-	host = mmc_alloc_host(extra, dev);
+	host = mmc_alloc_host(dev, extra);
 	if (!host) {
 		devres_free(dr);
 		return NULL;
@@ -692,19 +691,3 @@ void mmc_remove_host(struct mmc_host *host)
 }
 
 EXPORT_SYMBOL(mmc_remove_host);
-
-/**
- *	mmc_free_host - free the host structure
- *	@host: mmc host
- *
- *	Free the host once all references to it have been dropped.
- */
-void mmc_free_host(struct mmc_host *host)
-{
-	cancel_delayed_work_sync(&host->detect);
-	cancel_work_sync(&host->sdio_irq_work);
-	mmc_pwrseq_free(host);
-	put_device(&host->class_dev);
-}
-
-EXPORT_SYMBOL(mmc_free_host);
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ddb32bc2946f..198554e48346 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -585,11 +585,9 @@ struct mmc_host {
 
 struct device_node;
 
-struct mmc_host *mmc_alloc_host(int extra, struct device *);
 struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
 int mmc_add_host(struct mmc_host *);
 void mmc_remove_host(struct mmc_host *);
-void mmc_free_host(struct mmc_host *);
 void mmc_of_parse_clk_phase(struct device *dev,
 			    struct mmc_clk_phase_map *map);
 int mmc_of_parse(struct mmc_host *host);
-- 
2.43.0

