Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B61147A88D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478821; cv=none; b=rPoF6KwxN6y/vZyhqCRlVq4jacdLH7+Fvm37L1drxtaxAZjd7bDWW2e5PHtYDsi36w1f1WCDTTXGEbO9xilGx6VzXelgK4MpJGXE9spw50rKMZtMBLnebGtaVm5VZNe1tpt8NmDvu12GHEnG8Kxt1qQqVM3WCnyDls8CE98S2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478821; c=relaxed/simple;
	bh=ORYvywvQF9sr2A9kmeEgyJb+JyTAQ1yhyURfVvOXciU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ha+25oDMEo7DFmuBPVBzWiq+uw8o948xsE+yFjSpPqcW08ppUf6re98V8K+RRnECh1/PgorbK+VbdkQznZomiAchqIvI25jPRNB3+Dzn90wL1rwshXJqjD+9oKvSgMEtVZTKl+4hQrha1khSy04A9uSl56gVqsjqMs4N5mqcVcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brG9/f5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1JDNELg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brG9/f5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1JDNELg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxosU4005193
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/mXggK2jLiWbRfUTf+c3NeC4UYb270KnX1MFdTp2Ppc=; b=brG9/f5ZHsm+OWy9
	edieNlypHui3oeUhNtwGZXlvW/TAJgmTIRb61YuDVrQrFJN1DBtd4sEWm3zxvajn
	HKPp6dcmD0dBrO59dhmAsE6nNCfZEwTmxuJferlrSfcyse4luZQuYVbLkeVzhiQF
	DsWoR/JLXitTvALazoDdiKK+MZuUzm0Cho66AIdO3S061t9IGUeX8rQTRFSgdLSG
	Yb6QuN/Ttou8BUkpHqI5TXXW+dhQBqRFgnUnldvBEfolyiv/R23G27079WNNr7OJ
	KANQqK7fSxvgRfQHj8dKeTY8sMjhiCp3mdyvVrWLSXd2wFud9tyxq35ivVXPx9ST
	o/HD+g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xts0gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:26:58 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8200c815489so54036567b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478818; x=1790083618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mXggK2jLiWbRfUTf+c3NeC4UYb270KnX1MFdTp2Ppc=;
        b=O1JDNELgwCHfBg3hK+Ta9pAytgIACFQSPVSmWii/+Oku5jopavUv1ZmztuhfPJ44L1
         8K8F7SELogI0d8q+GcwbvdGZpnDPUxVfQvL5usBW8MMoRM5M7RT2wC0//O/z4JTch/1t
         HcQlYN1o5G3fwCgZnCrT22E/0VjK9ODihylyelytiizTL+/5FP1szSGIrPPIzJVr6b+F
         wNgpFsBgRUG5ZMR5UeJOuNId9QG4PUBxX9ufjVxk+Skr9tX6AUIsF99vE1T2C83Hkcv3
         cOMJTKnIVWdJ4mmfWhjKqA+TuKyVl/43UBqts0XoelBA4KZBqTwU00c0ghtG0rGKX9h0
         fq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478818; x=1790083618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mXggK2jLiWbRfUTf+c3NeC4UYb270KnX1MFdTp2Ppc=;
        b=hGkJm0GiykvzM2oFRTp+jVaa912vx61ycuqnCRKyeZ0sxktnK7Ng6YseVgsQwP5tE5
         yAFo+KzikSJLniDVl7GQO4rBfWi+SLT5ntinVpjHMds1EVJ6yV5WRg6nM/lJi4mnH8SR
         pCS2cUbEPI4Ttw0hoC2tP3BjoAKakKJmUlBZqBsJzbb9FzYi7HU8I9t1t3Ufte5ay+/w
         d+7MrshUL6NLATCUz9vutJZAb7YiWqb6jlUGq6gimcafhUc+aEOkFJnLKfoKhfVXG7wq
         xkW/MSCurMqcuI6QLQICBtnwaugBEbKBYle/aqHuXpU8ekRtFz/woB1/7DTO3PAZEVg/
         6qpQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7OHpNzO4iB7BZieWFp7LE0sw2rYzIUN1HKEdVH0f3wQc34PePGuQ7bn2qLcCfshrWSZLNxb7l1O1cyiU=@vger.kernel.org
X-Gm-Message-State: AFuF++lsaUNk1hOS0/J4yQHhNwzLhkVCnG8bZ8POWCNqUFcoKsGHESbF
	Esyp5u3/fb3lrB1+Ka/JBlRIX5ljuO6ZZd62HR07vPgzIxeU3HhxbnpmWPmkJ7NS1u+AEPJNqHt
	PfvkpRhuDM1Yne9uL7KWPpHAkHfpq+X5tB2KewFAzJYXQcakpp1ToOwP+925xvZmV/0o=
X-Gm-Gg: AYBFou2mZRMpo0HjZx4ymY4SJfK7qnZ5uY9cUu8MX12EE4DSUDvCvoo5/SN8GPxajK2
	S7i75Olxz77y3nR8nF2h7WHiYeKdr+INU79g4hZ+WgBbDMAqvsk8jebKvxqk9gCGwK9lKEqJOYw
	NxYX6l1viLrH2vj6tR4tHnjkReyY1FgEt0k04Kk0mpj7MwJ6tyBJ8bnsund7O8Wxknq6XjzRnVT
	ItIbScSv3/kIepsPGVxoB+V51990D2O5LhApHfNKpNuKZo0XM3oPwBp0MWPhZo6oHgLUp3zHHJl
	XqON/GVivUy+0DENfhY4qDtzCuw6sDRw54mEGctJPofCUJaec7n86W1cN1A4MgfTGxnYhNXLar2
	LPe+9+6RHx7lWEg8qtQxgtAM4v6aODG64S65T
X-Received: by 2002:a05:690c:c622:b0:887:1704:be8a with SMTP id 00721157ae682-88d1f402767mr18659737b3.8.1789478817700;
        Tue, 15 Sep 2026 06:26:57 -0700 (PDT)
X-Received: by 2002:a05:690c:c622:b0:887:1704:be8a with SMTP id 00721157ae682-88d1f402767mr18659497b3.8.1789478817225;
        Tue, 15 Sep 2026 06:26:57 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm1248906185a.37.2026.09.15.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:26:56 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:56:27 +0530
Subject: [PATCH v2 1/2] soc: qcom: geni-se: Correct QUP Core ICC vote
 constants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-correct-icc-bandwidth-vote-constants-v2-1-f78eb611204e@oss.qualcomm.com>
References: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
In-Reply-To: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789478807; l=1891;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ORYvywvQF9sr2A9kmeEgyJb+JyTAQ1yhyURfVvOXciU=;
 b=PGCt+aP+jk42cabmUEyAbYy1FPHGiHZieIT+Q77R5gl7R5qYcVOMHXJUjENBMiWlo7gxcyFCj
 DeVmA43HBOcBNQHpUGLcaRyIdrUVQQc1pup9sh9PiZKXNAjvv2mhQkm
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: vnJ4DMlHQTTsFdIoZDSsRT_TyrceHw1W
X-Proofpoint-GUID: vnJ4DMlHQTTsFdIoZDSsRT_TyrceHw1W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfXykg2axI8uwoo
 A17BGuMMyDxKuZ+Eh4J+F8t8rilAOkmSjIYbguIwQ1siDlaSA+wsHoEtM2UEHlCaSjZ6psMrr/r
 Bbi2FJ8aYXkq7BJ7dbvOEOVmJNSADP8=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa947a2 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B_gQsAElUtnq2ZcdrgMA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfX6L2kTPnBauYP
 V7yomozzIToI6zqePCp9pYWOH/7FfKmNLyOq7OBRe5auGuIeSJCf/Hgz/7vszCw59VqXiaJ9Yaq
 ZOia0fl2l4w4gv1JUBXhRU9x38H3WjhdsCayocicnluvB2S+mdrQbFq5qCG2d+Ale1ymdgMoEHX
 a7ax9h9fiStZ3tZ99OmfhLkWzibQCZw8Sr1s1hMxFPMy4JOumACvuUvroGLsErS4klq/2KeuMsr
 kHn9M+LqsMKnpP5CeEwrN+wEILoponW/B4TWoORh3F/Pi2Btdgwqe7NM5fxDlC7KHttIdyHmDZ1
 /veebRxaSmTmk2FKLAWHm33JB5PN5RIJtwhII3kMHqRGVI4Q/Jr0XJt9z98RLq2lrbdLFN0AQV2
 8q7saG2TyWLOmomU571TmXf86uMVIRyMajAkC0RcBWEyAb0fcjSkq3ZaUwCl8vRtcAoJ9uLUVOj
 Kewi6anng2NuXenROKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150195

The GENI_TO_CORE ("qup-core") ICC vote selects the QUP Core 2X clock
rate. The CORE_2X_*_MHZ constants are expressed in Bps, but their
values are several orders of magnitude too small. For example, the
50 MHz threshold is represented by 2500 rather than 25000000 Bps.

As a result, clients using these constants can severely under-vote the
QUP Core clock.

Correct the constants to their intended Bps thresholds so that the ICC
provider selects the corresponding QUP Core 2X clock rate. Drop the unused
definitions.

Fixes: 58ffbba6a399 ("soc: qcom: geni: Support for ICC voting")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 include/linux/soc/qcom/geni-se.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..5f18d281e6a4 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -347,17 +347,12 @@ struct geni_se {
 #define QUP_SE_VERSION_2_5                  0x20050000
 
 /*
- * Define bandwidth thresholds that cause the underlying Core 2X interconnect
- * clock to run at the named frequency. These baseline values are recommended
- * by the hardware team, and are not dynamically scaled with GENI bandwidth
- * beyond basic on/off.
+ * QUP Core 2X clock votes used by GENI clients through the "qup-core" ICC
+ * path. Values are in Bps and must be converted with Bps_to_icc() before
+ * setting avg_bw.
  */
-#define CORE_2X_19_2_MHZ		960
-#define CORE_2X_50_MHZ			2500
-#define CORE_2X_100_MHZ			5000
-#define CORE_2X_150_MHZ			7500
-#define CORE_2X_200_MHZ			10000
-#define CORE_2X_236_MHZ			16383
+#define CORE_2X_19_2_MHZ		9600000
+#define CORE_2X_50_MHZ			25000000
 
 #define GENI_DEFAULT_BW			Bps_to_icc(1000)
 

-- 
2.34.1

