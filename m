Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662730;
	b=MqvQy3/G9IssmfuEG+UQ2Tm9hRlMPHJG4lzA42LnD0fr+kp4MmjJqmtT7cUvZlmfJpax
	 i5QefeQpiZySOqYBfw821fKWEYEhGPpuV0fpQFPB4e4gC2DTbCVz5ujP4gln+TrgHEdzD
	 PTwX2Be6kuyQUUvk93dSNSWZLLryNLXcP3vuhk447Xz0rOI13L2F+NQwsv0FOhRTIl6l+
	 rUqMmTXBeOVYqXgtQi7Bx/MPZMQY76wRqWw5xfLCsui7LZdUPfDCMfnWdHAQiHI1F3PRR
	 VTza9NoDYBYaZOGaBbEiFxQRKPU3D8n1LdnAnyBIfUX6kMv2bQFsYYl/i0DiJLdDKAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=;
	b=Kswz3aBwX3yh5KbI9hLX/DLkpGZAhqkike6NjlE85YTENRya8PYo62etehjtXIpPewgY
	 zuRzpTHwWoClVzsdI4Pjje6VxTEjyS5+TthI9MT6p/bR0rxYbOiNQ7vva7OIN6Ne+yUSL
	 Q0rgXJK/JNOvykmRoAVAAZcROjsnDEabP5zY0VElE67H2AsbR8BpfAe7ANJliv3fWT4JG
	 oVhyeRxdTjE2pwoaLYCcP3clkgCmw+vlpwCzpKHL6Ur/HBmeK1YbXhtfFpzsrPP5hJL/P
	 phR7MtDr4FMVNUMUzj4hmwvwGXxLDU0aYR8sas9sMygOudvQ2DjWhBDxuvO19gaGwYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rfq6P8qn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/vyHk3O";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D7606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1D7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rfq6P8qn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/vyHk3O
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Lnl63194740
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=; b=Rfq6P8qn7eTM5IEM
	8ziZrLKUzKDtP1/mhjWh6O6ORDn7ZZLeRd7IOUvMamy9fLP4ZCYLYb9yQaybAOz4
	wo/7c/SJnLdIJqYZLywtqCTgp+ImjqroYW8oZeXwz4t2Q7qDI5gYzt7TCJQZbZuQ
	8T9q63wxiefY34rB4kb/7XBecaeU0h5yBRRpxGMXZkmlKTEjsL4EATvBPMKz8FaN
	Wrx+X02DOHzXMXObZq3oRI9uzIqRsF03RlTAniuRSAo8R7g3qSlptU2MCOcZJAUo
	Eigu3l6SuxoxuRE7+G7KT0DvJjZMOBcjXGC6H+RXduBf2AfsLESUtRFNgo92kr6E
	IS0ShQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0dj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3157549eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662727; x=1793267527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=;
        b=R/vyHk3O7Rkw0AsdW8nlr16XrdGaBFVQyviunHUkWVa6jdHHL5hKsIb1SgFEGnVpz+
         2uh4zR4S6zFrVOFD5fcqc3qeunBJQ3UtOPNIBwqRAqKB/LAQYt5Kz/njbn6NG6QLlm/E
         JRR1mU30LtbjhK0fhX6Lqbx/pJCqxxcM8hmPyDwBnoChce+FBof2fwxi0b+uIzT/0+og
         N831Y6PDo96dbzM+iUDBuGBmJKi8PdpQqNbU5mxWFlTUb947zeqLGppQRhG50CP/ujf0
         q5ssKSZLYoRXrTGc74da1vQffIZmkPFB/2ul9KzJMDlJeCGCvP2YehEf5/vbfKbW+CcK
         G3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662727; x=1793267527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=;
        b=deuWLKIHJFIeJP3JZMSICSzDayLjeNPV9ykQVSMda3+rpwh1huhpCCUdzEGWF7LkFR
         DXEzQN3+P7qxdfaSkMtlQTK6wYsATbks6NOA2C0rz25U2F59b0L/ACnVm1KWOESVAADQ
         6jZNSScf1ntGFznEns0UeV3nYMOlB5llTo3PCGsukpGkT05sNv+Xh4zItw2BCZ5AL8yw
         EqkrksO3CwMFokZ2YCx8f3Tb935Dqfqq+HKusZIslYEAjZYMzPc2jDNKuIKx7e5xEW7I
         KUWSZu351gZb0ceGQa037p6TQwPXwyswEtX5s8mwEzklQpZs+wIUKAmZ3xr4PYP/VWA5
         /Nmw==
X-Forwarded-Encrypted: i=1; AKwUvBxlbrVYufI50Q3vb09pHZsQGDisBGZnq32PxXk+llIyLM82z3/53N4ElqsBl+S2qXu6BAIbOJARqwLuSOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQkG9ogCDXPR5mgVtWyo7w+QkynYzEuM9/VXz0mW6tnsY6VeEr
	/v7ScgTcEOeG7F6kaSqegiQctCT+gPWhqxtuSiBaJSsSnjzbTS7MzXgVS4OJ+fbWpOA4Yj63uDO
	Y9EWP3LWDxxj+3St2gMqk+ny/CKLlCL5y0SK5+Vctz5RpbW74ZunVF9IeA54s4rhy72w=
X-Gm-Gg: AYBFou13aKzvKIT2s/pA/DK/oxWD4/ziAKq1LU0v617lOQmLCcRIdYegvuLNg0ZgJ0V
	10nxyFHTQG5s5nCeYDTP1AAPojWYCSQaXg6PUN3sJbfy9bs9eIDwTcUofhm9o7SLOEjIg/tkQ1G
	6vAq1w/zSJf0fJZlDcThkExC6iOkhdZP5EcjeMKA4bhimVK5gQdnUhivBD+hjx/1fcTD9Por7za
	MaFszTmbWBqV4DkFazg8pwe4FNuoYpk6BUwx9up9JfDEZnYZOFUMOy6pfBSuob5gBo9JAmjaH4k
	77o7f56duk1I4HPf+EUCKlcCtV7Td9QkS6mxqE62Adsu96LjJmODKzDMiptv5WvAFIgnb+wYyUC
	lTmTedReiXhcwxXXEBuHkKhn/EAwp7vBr
X-Received: by 2002:a05:7301:da02:b0:358:45f5:daf with SMTP id 5a478bee46e88-3674e35502cmr5978249eec.29.1792662727287;
        Thu, 22 Oct 2026 02:52:07 -0700 (PDT)
X-Received: by 2002:a05:7301:da02:b0:358:45f5:daf with SMTP id 5a478bee46e88-3674e35502cmr5978228eec.29.1792662726780;
        Thu, 22 Oct 2026 02:52:06 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm15742170eec.3.2026.10.22.02.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:52:06 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:21:50 +0530
Subject: [PATCH 1/3] mmc: sdhci-msm: Enable ICE before enabling crypto
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-qcom_ice_pm_enable-v1-1-f7a84086c651@oss.qualcomm.com>
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
In-Reply-To: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: whX9pKuX5Izd0v5gEw17aj3N-tbfSUhF
X-Proofpoint-ORIG-GUID: whX9pKuX5Izd0v5gEw17aj3N-tbfSUhF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX29iJxefj5LnU
 inA7KOR+WKVLotQyPw65VMGnAhciTitESF66m9fexsbATAQBv1lIGwPv/v4mkUqizcJwNrUfxu5
 sMUnQM1sezq4iN5i0u7DiY0ihrZ6Wfc=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dcc8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jhS48lKipzocA6WHYXAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX0YMvpbLwu5ys
 L15m6VTuB/MsdrZRMLEN5Cv7gVm0kFNTF54DeFUIceEgEufZpm15gpi+c1Bm8lxHlVot8KlUKbO
 E8BTESaK87JXRmbqDeagK3VwGyPKrfrYMl3VIW1EMi65giZ4Q5ikuO6rvdMAFcFcdb/x+WIt0Z5
 6qLR/lUn6w6O2gjVq/sapNIRp+2SDK8FTSaDU5epzpqPc98ShxkwQkN/W17Ri0JV+cpAOmVhoDL
 nDtglp+s6ze2Zq/gqoWAh/cpF3gL8m9oeX6ZzddmiGZS/LserFLFdy1C2tUI9MShLRbxm2pxWXq
 xNTU+LzBF96N00mWYyKJgh6/Am6VODkjXZg1uZJQlTxsnFvKMC8r2aXrUcHUJDztuP0/Q8kMEjr
 CgbpYObU9wDI0FNPLzn1iTJ88s4Tp2pg7Z4dXia4Hk99b6H3mepEQv1nUpRvNTPG8eIzJJ1GyDG
 6JAMSiqrusXi9aYF/4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

sdhci-msm currently exposes MMC crypto profile and sets MMC_CAP2_CRYPTO
before enabling ICE. This leaves a window where blk-crypto can issue
keyslot programming calls before sdhci-msm has explicitly enabled ICE.

This works today because ICE clocks remain enabled after ICE probe, but
the storage consumer should not rely on that implicit clock state. Once
ICE supports runtime PM and clocks are suspended after probe, accessing
ICE registers before qcom_ice_enable() call can fail due to unclocked
register access.

Enable ICE during the sdhci-msm crypto early init path which ensures ICE
is ready before blk-crypto can issue key programming calls.

Remove ICE enable call from CQE path, since ICE is now enabled
during SDHCI crypto initialization only.

Fixes: c7eed31e235c ("mmc: sdhci-msm: Switch to the new ICE API")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index aecd425bf095..85065cfae132 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1928,6 +1928,12 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	msm_host->ice = ice;
 
+	err = qcom_ice_enable(msm_host->ice);
+	if (err) {
+		dev_err(dev, "%s: failed to enable ICE: %d\n", __func__, err);
+		return err;
+	}
+
 	/* Initialize the blk_crypto_profile */
 
 	caps.reg_val = cpu_to_le32(cqhci_readl(cq_host, CQHCI_CCAP));
@@ -1963,12 +1969,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	return 0;
 }
 
-static void sdhci_msm_ice_enable(struct sdhci_msm_host *msm_host)
-{
-	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
-		qcom_ice_enable(msm_host->ice);
-}
-
 static int sdhci_msm_ice_resume(struct sdhci_msm_host *msm_host)
 {
 	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
@@ -2141,10 +2141,6 @@ static inline int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	return 0;
 }
 
-static inline void sdhci_msm_ice_enable(struct sdhci_msm_host *msm_host)
-{
-}
-
 static inline int
 sdhci_msm_ice_resume(struct sdhci_msm_host *msm_host)
 {
@@ -2182,12 +2178,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
 
 static void sdhci_msm_cqe_enable(struct mmc_host *mmc)
 {
-	struct sdhci_host *host = mmc_priv(mmc);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
-	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
-
 	sdhci_cqe_enable(mmc);
-	sdhci_msm_ice_enable(msm_host);
 }
 
 static void sdhci_msm_cqe_disable(struct mmc_host *mmc, bool recovery)

-- 
2.34.1

