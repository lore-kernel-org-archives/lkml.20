Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312087;
	b=I3CiquO6ve5/uksev7rOr7BiwAqNrbS3FzV0jBsAydQa8P9W2O58UppwcXQbv4fDw1b1
	 KDTPTpVbwP+qKk6oRgiuJICJGcFFd/nWVaataGYnM88oYRD9eHopN5fDNkHalvbRv7hqZ
	 4NLHWNAURIXrV4Y8hpZaU2+hqQrpDItk6qSxUUxzh6+t94YR8c2AkLlhEH/q/rQ8V4YP6
	 fbzOabBpIgzyJQVkAxhSeTqYvRzAzn4hlHUqYshQ3C7RibBrVtuExU86VGSlmFJv3ilGP
	 pDigttKsflLCpeVSwe5aX9uOQ5HL/mka1nvr1aapL3ffzgWJvVIlLaRDcQxfbGvIN6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=;
	b=ZU1x6M8lTSViTKfcMj9LkUByGjpOYpqiZUnRqpufMjC76MBr2uViZRyM3Et2XjERkkVK
	 n0yFhjYr09s3+kjbMcdth6CM9vUpbEf+wt8fIEM/lamc6/a+06nND+e2CPxwRnjrkct1k
	 39GvEa5IyJ+9GUY4nh/OoJYjkWZpO26x7Z06pYLtGzcju3JITfrx8Q/faOjDbq40Jv1P7
	 aaCFUv6rZ05mSi8XQYityPxogg3UnLfzxsrTLsVZCmDjQiSMyehHnBuR4+C2UR8LH9dE5
	 MrMKSQelruZDvVVDI1f5a1mXGSE0D1tMR32VN0BOwEGSHfdvWlIscf1UHaPB2Bj1YUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KYFQ/o2M";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9TNIk94;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CD606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40CD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYFQ/o2M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9TNIk94
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAa3a3850899
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=; b=KYFQ/o2MMIr1RdWY
	FUUiMBa0do2xwoS7/vJbrjRGH1FBOR0BZ1UNBAAI0+h2XJ6TR26I6M9T7LJ7HerU
	Gy/Mh2rvHHWdjyRnb+p8v+d5UsGr+Eip1shpBxpv5Ea3ZZ5+VbMB7NVvTGaF4tpY
	FO0ihg7hIHedNyoOQp/e+VrNFOWE3YAa0k20GMLL47sDyGgsJh1c3NzuscgVqff0
	MvkgCRLdLJFxFA+/hOWcAVoNw1G7gdJbJT/l9kggxSiryz+k3oalpLCmaJgp419A
	Ag6dcD0+IHmQ2YDEBnNXYrfbmpLb7+I1653XoqWeqCXxeyOdGnXlEDXFPZHos1YL
	QHKe9g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx84kmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:01:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecffb6a384so1310669e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794312084; x=1794916884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=;
        b=d9TNIk94YRalU/QKI1BlI8a6U3mtIJeMfeyOTWZ3Rjp1okwd/qW4EezYwraLZ0oBxL
         FHOkGujZJKr0ZLOK9FYCfyY4ZbJ3h9wwabDo072c1zfAP6c0mR9lsCvX3W3rzXnQm6Tn
         ayfCle5rsyfgagjuBiMv0jmgrDG88QWQF/Zc/lY7p5aHWhPlYFyMykb3tfQxg9vi0TJW
         WNKBkQJ3gowj45FLznuwG8KcV26s70ZvvkOzs3JvOl6Xo76GmhDlvjnMN0BAwfnVMnbY
         RPtT1qZ07olxlbs2qoQ4BydxqVDt1OwhGlin8aGdACyXahq1Kwn5MPAz0DOLEteDgVdI
         QAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312084; x=1794916884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=;
        b=pBGGeb9BLP+W2J8aUVzJawwUVmBaRr6w0E8bLjwABaeZTPZ8+NxwDZcEB+lp8xAnkX
         GeNMwGXxs9Ta1fvcQnWME+OE4YdCOMFxVPRQ5qCaMwIUOvdEvO3KCEdaWh+Dg2H/Y30k
         5jtSREuwz4KGVbr95m8ctAJHSTALvZBQDkN7iH3o/aaOI+Z9rhZxcjDuTTming2eepgR
         6UmKWg7jKV7HloTY58vhDX2feJHtqQhR2v+badl1YGdVwilh77wUAV7/U29hGTNtVywW
         4bWVVSCGTFj2hIvEolooHq6BnzLUO1ANVNG6lwcu8DHY0I4WYzXJsKFMwoFYDvCE2+Mb
         kQlQ==
X-Forwarded-Encrypted: i=1; AL+hErEx12nxKEF75us1ug9i4VCmkxg5vdJEkd0IksvdmpzZbOSKDxT2Evz188HDqOQMkuVW550Q3JGKEYiv4uY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mj+uen20nlJtNp+WFn6R4TQZc4+wTzGg5wE6B5xAH8SAwhBxw
	mipa1oRmGW/P5o7ajMXvPGasrYNmBw/C9HcTvbkSGHgzXgJzpnGorJLnyJQNxxVZ0hyRcAZZANR
	LQxwSJPS7HiCdiWLsUDANq41xVIiJZqH5hfsKkOt/YP/0ed+2CHpJl9wa2hAtY1qUeQToDjxvqF
	Y=
X-Gm-Gg: AYBFou0tIEdALURtumFUTP7G8fxP1uf56prIgbL8l9iLdsWCf9l8+wIFjru79pCSA3V
	AbyaefIL2RUazgULozkabFEgkBfB61RPZUl0JZZXiMp6pOoZo4HTi4YCBDxi9TWPFGBTctbdxOZ
	4mK6y3nhUmc4lDvt5q7R5p4u7eY0ogBcmOU2OrC8UtbWHcUpM+dtwIP79JdXbcalBtGo3wOiIEc
	wfYFvKJuidJKJ6PgAIR5ZNR/c8m3LxXd80h6pT+UYb+CDyf134voGEPvPBdaGpZZnYnHPS09DTf
	qHef7MuqwF/RYbYCcAEbs4fKsIdyZFRRe8PXtfLCKMA0M+BAcSBaiuGn9RLmyJDSbcsHuxWzmg5
	5/VgWP08dEWaol8Rth76pWRCH315Zmghw1Ch1NODgkYXX5yNPso76fpVPqmet3o9yiBEC103jUB
	9gjbQqGegwp39xcwz2sGQnv0itrSmE3Nqr/3bkuBXJZVUEzR/3jPchp419tM6W7lxFeQdJVJmDE
	Z4D17WulD4t4SSwDJzJirIf2w8=
X-Received: by 2002:a05:6122:511:b0:5ec:d84e:3833 with SMTP id 71dfb90a1353d-5ee0d16f2e3mr729662e0c.14.1794312079220;
        Tue, 10 Nov 2026 04:01:19 -0800 (PST)
X-Received: by 2002:a05:6122:511:b0:5ec:d84e:3833 with SMTP id 71dfb90a1353d-5ee0d16f2e3mr729530e0c.14.1794312077191;
        Tue, 10 Nov 2026 04:01:17 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm56820295e9.3.2026.11.10.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:01:14 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:01:09 +0100
Subject: [PATCH v2 2/2] PM: clk: Release the clock prepare reference across
 runtime suspend
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
Message-Id: <20261110-clk-leak-v2-2-d044cf0c3f1d@oss.qualcomm.com>
References: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
In-Reply-To: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af30794 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PTOVzwXgyN4xjwbCXrMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 3no7XGx0IRnuEyWXtWwvZT2TE2uM77LU
X-Proofpoint-ORIG-GUID: 3no7XGx0IRnuEyWXtWwvZT2TE2uM77LU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX4QBVFl842PU2
 x7xf2CQWLHLMZ5HmZTMgJW5xgCRXg4RIh+cY5SbizBl4yd7VoFqqZHlON29R3rlOaaDEBcos22l
 eaZowCWujYiADCJbuEUWrRXoYLRsqPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX2C5kWFlrY511
 a0VWW/HSnRNdqtG4pgQtVzxi60JXg88qDQCIDHXmj50icjGCFPLv7IMaaOb9kMX6afpo3Z3kLp6
 p8XoaLWdYT1K7m89vcxaLDotqg+38ogK3dq8I9AAzR+1il6ppINKLwEzIu7Hgygvt/cHZYA9gtt
 dbD5i/HUr6ay1Q9fObBs3QCwxwnIDWenywUz4bKL6cvcevNqPRESl+QFQo1WRACh6ZLfdD4M28j
 uzNHgtUL7BtuVBKaK9TbyLnUgtm2uTxsBMCbfEILp0N/MyZ8R2a/xsCnVnCM3LJtsQ6lYyAdHXy
 PPlGYXQljlVJPDM4xQiatnw0WQdu0NfS1ucLzR2UdvSA6p8rvUxTVKmwltzCoadX21fxiVQEqCq
 vKGR2FFAlSXVx8IUiDN3nYAgJ/m9dhYDlYoi2SQS5h83g91OXvhNLNEa0Mr4cnfcvIY9VwGPZv4
 QLmbmmk+hfGOvtCRLjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100047

The PM clock layer prepares a clock at acquire time and keeps that
reference until the entry is removed, pm_clk_suspend() only dropping
the enable reference. A prepare reference propagates to the parents
though, so a clock with enable/disable ops can keep an ancestor that
only implements prepare/unprepare running for as long as the device
exists. On Qualcomm platforms this keeps the RPM XO clock active
across runtime and system suspend even though all of its consumers
are suspended.

Unprepare on suspend for devices that are not IRQ-safe, as those
suspend in process context, and let the next pm_clk_resume() prepare
the clock again. This generalises the clk_is_enabled_when_prepared()
check in pm_clk_acquire(), which only considers the clock itself and
not its parents. Most drivers managing their own clocks already
unprepare in runtime suspend: 245 call sites under drivers/ against
27 that only disable.

Reported-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/base/power/clock_ops.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 6f66e11a12428fb718abca197f5519b1ee21ff90..43150ecb58add7783d8602d525219c676fd808fe 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -33,7 +33,6 @@ struct pm_clock_entry {
 	char *con_id;
 	struct clk *clk;
 	enum pce_status status;
-	bool enabled_when_prepared;
 };
 
 /**
@@ -174,9 +173,11 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
 		ce->status = PCE_STATUS_ERROR;
 		return;
 	} else if (clk_is_enabled_when_prepared(ce->clk)) {
-		/* we defer preparing the clock in that case */
+		/*
+		 * Preparing the clock would also start it, so defer that to
+		 * the first pm_clk_resume().
+		 */
 		ce->status = PCE_STATUS_ACQUIRED;
-		ce->enabled_when_prepared = true;
 	} else if (clk_prepare(ce->clk)) {
 		ce->status = PCE_STATUS_ERROR;
 		dev_err(dev, "clk_prepare() failed\n");
@@ -460,6 +461,7 @@ EXPORT_SYMBOL_GPL(devm_pm_clk_create);
 int pm_clk_suspend(struct device *dev)
 {
 	struct pm_subsys_data *psd = dev_to_psd(dev);
+	bool sleepable = !pm_runtime_is_irq_safe(dev);
 	struct pm_clock_entry *ce;
 	unsigned long flags;
 
@@ -472,7 +474,7 @@ int pm_clk_suspend(struct device *dev)
 
 	list_for_each_entry_reverse(ce, &psd->clock_list, node) {
 		if (ce->status == PCE_STATUS_ENABLED) {
-			if (ce->enabled_when_prepared) {
+			if (sleepable) {
 				clk_disable_unprepare(ce->clk);
 				ce->status = PCE_STATUS_ACQUIRED;
 			} else {

-- 
2.34.1

