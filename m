Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1C1491591
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628934; cv=none; b=bU7IuRDVkksZ5trYHQBGa6qwpUHHn477UCX1ijS5EWtpu9+si/P96ztTuoF0u2/XfQmEuyBz5CQG79+IE+taBoQYlCopU+rUT9NfmRdCo66jLCRFFBKo2CPJDlShCb4Xewc5l3zF4LItVu0oskyaKrFhw56C4pWYjEySecO6ysE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628934; c=relaxed/simple;
	bh=PDFtCkUMe5xgCgX5ms0kKIDJuV9MuZTF0CtXgl87Z4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRORGpggxpOlmcbrxL0rjSKOcvLSvdzga0KJtF2XNJt9XWxKIMfakWzX9GUR69Eyk6IghVYb+7F0M8Bw1rBlIycpGSLl3AeSy6zQRX4LIHFs4+N8IUHTbwdth3gTJLrCAz3eBR+4UgeRkm/Ko8K/kCSy0c3XMiOaljlUdY9C3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW44YZoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmDF9igX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW44YZoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmDF9igX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61ESR133120
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7dL3ucP/imtNL8M2nWHaBKLW8DZgN5o/nieYjIGjzM=; b=RW44YZoU3AwpllwT
	pQCrFOiX60XozoBmw1eJYYb7ZQ0Wk5SXjZ2XAPtk55HJckrPWMMRQGPoX9RFFhdF
	a8ph/wt18EnO7/5L63OruGjTiDgn+hIUzmCY2NZNuj4T2S+7yk338Ii8QeLM864N
	upp/Bv6QkzF5Og27a64k4jgASi74gF3zV9lj2pycx+oLrX4+GBVDzBcaDlprQ2UT
	MPh79tPzebPXyQhdDl6WeB+nKDwkAZDvHoAsa/lcLs6QTA5z6ElSvwtD+FxAqtKG
	rGisxZpunCqQ25GlJV4Gdmbqw1XqKtqceZlTCUEnewl4zNlMOnUHxojv3cjgVoz2
	viINAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn549nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3f521346so422374a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628930; x=1790233730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7dL3ucP/imtNL8M2nWHaBKLW8DZgN5o/nieYjIGjzM=;
        b=RmDF9igXxld/SLpUhR58DdkAIWIxTMESeNlZ1WZ+92GtLIJCK7aTaPDeH4mN7PJo7p
         XV4nbAR5SxJ4kGXrNYdh042FXRjhk21XTNxP1nxulCHZOVsJUmUfpOsPMVuOwrYb8AMb
         hIeNBW0IOnWDySAsHa7mjC6+YBuKZtGtnTFsQXSpob3QehUJtU6kIQTNXScLI3PkfHvG
         Ilehsw6BWk9vXYIvVtRaNmFXnwjrrLnjCvTiPxXLYXQoXSB4MrvYG8YeLo0P8JjlP1hU
         S2wdx1MxxRCbb0KucU7X86xCQUGpgO6oJbykq8Z7kL2wtoUPK3lKfAPccI7i0J5+Xq7/
         22Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628930; x=1790233730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7dL3ucP/imtNL8M2nWHaBKLW8DZgN5o/nieYjIGjzM=;
        b=iZVRfwryzxQIQPOoLhRkV56IQYy3bE/lGs8QrkL6HABMw5IKnr/oPVzCIJ5q20qAmq
         A5Qwyl8odUz4FnWK4ztBSRBUCul6velNdhCTYEIEW+IXbGUyK+hVwa2QPvU5sEnIOMxO
         dLcWeH4lV6J16C4A3UxdLpP+/UfFNt3J/GfIUCW8f0twlX12vQ6ftjBYR9bmm/WbCSX5
         SGiZxxzAXaoXeufo+5GXRtvnsKVqDCyvI3D/KqyJMEEGMdAs5/GcL7sY3DYVfpG2ZQBb
         q7zVY4VzJukQVHvoyUHPEYZ9wXdTm3Cg4ux4eoWgKa8BMdzJftkG788CYzubtpErYVvl
         rCGA==
X-Forwarded-Encrypted: i=1; AKwUvBydZ5jbjW2TPOQlP5bi4V732bxk0WbEOFe9h3r1B4xTh5IvP6mh642dTaaivnYEjMBTbc1HRZLah8ogZCI=@vger.kernel.org
X-Gm-Message-State: AFuF++kHwKjzC3Ddrdzqh6dFABTrrblQhKUKipTBdysICxLumWGRk1E2
	QUr8qXHf09HzY3+l3sRNN0UqdrlHK2vH7y63Uol1sHq05/T/+DpONeBdRBSTaSYkq8goXP4oaWo
	HUXPpy3yAS1v1xY+wLR8wk2DbkgHForvqQkgjMN3+SPvm1Bzw61DZg1eYUPFu0Xd+x1s=
X-Gm-Gg: AYBFou0J6FeCMa57IX8lXA9tWGUzTxjDsLzMqVlKdXYqGIzqNCnmtZPQQt1VwnQYJjp
	Dn5FSu1dRPteVFG2id4BBqKLZZldTX2uPh2lrlQsGVgbvu8pLc/mhhyEJ6TiFBLc3K+nGSKxasH
	aurvdx0lPcYdcpy3ghy6MlxTYCBG8QCaE+H6wz52oQHODilyiNYxvlgyZeg0m/VWgpdCp7/Pkr1
	xroyZRaSpdUUpXseKWK0ZawAh1WDHnvZTiJfqzYeSjvmh6T7R0nx9urdT12+8ltzL9P3W1GxLtG
	SFM99NzJ6Q+bdxIjAr2ly/C2kyqyw12RmraXs3cULmCzayUpf6b32j0WiPpa5kXDbM2l+Pppunh
	hzUEVBPtNYOXNL1HMgowZ5QD7+K+fcar6e7A=
X-Received: by 2002:a17:90b:3ccb:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39e1e52627bmr13473456a91.21.1789628930273;
        Thu, 17 Sep 2026 00:08:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3ccb:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39e1e52627bmr13473403a91.21.1789628929744;
        Thu, 17 Sep 2026 00:08:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:07 +0530
Subject: [PATCH v3 6/6] bus: mhi: host: mhi_phc: Update the Time sync logic
 to read 64 bit register value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-6-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=2155;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PDFtCkUMe5xgCgX5ms0kKIDJuV9MuZTF0CtXgl87Z4k=;
 b=buSyD+p+9ce7wxdFM3rWvxg7ISBYYLinSYPJpFZVQ/JTKyPD8HFIu4l89pamZwcXJ5OCHBlsx
 jU9mJ2iYS1iA7Yf4OdTsqm10MM0aO66EN6OZRTSTOs+sENrXkfM0pEk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX1OIGXNeDnLLK
 yZXVVvVEz3qlKKnxahOmfh35IqKlpRTZw6AXp7sXTxO5xKq37c1guVQjeEfxfbBnMJKfukYpkVG
 yy2erdSKL6TVOceLNKZDCTUseOr5TmNJBf2JQa3nUHt/YbXXUYZ4NXosd8zxm//ahO7MxbKGL1Q
 8EwRZBqYqH5iN/u2hg5eEbsGvnr2eEDWS31/EFPJUV5TcrXFcTFO8hbAM99s9oprIMtqiXZwV6a
 leWh6rNmLAsyg1zSb5Ht511KHt4Ck4rAztA6pIFv8fMuLe1mdYUQ4iTljs0mzSP4qirqE8GCuBO
 2rDfQmmw+VWxFCgZ4L6Mb/ID/6tmdaqkroFYcVb50KuCpBOf7PD/4poRTqvV179HPan11vxx86E
 6Vur9WKJ/zKSD7OdLSM6/K4rB0A/vpwwR/TErAcHAm9Yi9acOjtUVJy4k8+fTA6FNxnYvDaMG3T
 efIAAG5h0o9Bm+PXbhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX1lE+hSS71qKM
 qyfH+cMDgRsnNXMngb5NG9QIgj4wRGQkoMUkmRa99aN0J7RmwFG3XDzG7zpUYhb/ttVMa+RSekq
 LQ+nv/FZweXAwShTbckvvmTWqCFsFrM=
X-Proofpoint-ORIG-GUID: _Z6dOQ9JQ9Zk1ZFQqW2At5BgpYWxz5bg
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab9203 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-ftiAGXnolOcdJctExEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _Z6dOQ9JQ9Zk1ZFQqW2At5BgpYWxz5bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170094

Instead of reading low and high of the mhi registers twice use 64 bit
register value to avoid any time penalty.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/mhi_phc.c | 47 ++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/mhi/host/mhi_phc.c b/drivers/bus/mhi/host/mhi_phc.c
index 783f05b5d144..b1d10431bd30 100644
--- a/drivers/bus/mhi/host/mhi_phc.c
+++ b/drivers/bus/mhi/host/mhi_phc.c
@@ -57,26 +57,33 @@ static int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_t
 
 	ptp_read_system_prets(sts);
 
-	/*
-	 * Read the high dword twice around the low dword and retry if it
-	 * changed, to avoid a torn read across a device-side rollover.
-	 */
-	do {
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &hi);
-		if (ret)
-			break;
-
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_LOW_OFFSET, &lo);
-		if (ret)
-			break;
-
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
-	} while (!ret && hi != time->t_dev_hi);
-
-	time->t_dev_lo = lo;
+	if (mhi_cntrl->read_reg64) {
+		ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
+				     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
+		time->t_dev_lo = (u32)val;
+		time->t_dev_hi = (u32)(val >> 32);
+	} else {
+		/*
+		 * Read the high dword twice around the low dword and retry if it
+		 * changed, to avoid a torn read across a device-side rollover.
+		 */
+		do {
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_HIGH_OFFSET, &hi);
+			if (ret)
+				break;
+
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_LOW_OFFSET, &lo);
+			if (ret)
+				break;
+
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+		} while (!ret && hi != time->t_dev_hi);
+
+		time->t_dev_lo = lo;
+	}
 
 	ptp_read_system_postts(sts);
 

-- 
2.34.1

