Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8C38644D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342121; cv=none; b=c/FkrLPAG/5G+R69xBHKHYh5Os7pL8RCYqzLezKNSG7QODHhH9eNChSAGVVchN8I/4l6TWUPh0bG39qfmGOial0jotugxGO+R7j9xkTPz5YvV7CjpNU+qOW1lEs34KV6L3MBLQeCUCEjjgFCCG9TJ9z/7D9CwMIcCtqKKDqM0iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342121; c=relaxed/simple;
	bh=8T1unBlwrMViH0pWbrFKcGsFOZw03mrL6OQHmaqAzSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XL2fhfF09BI/IvHhx6rzL01dzy8IjA3/11oM6uX5zjkLJ2vJNEkpLMqaPRmyNBVEk74A3JILLzg3nC+NlvQCvDDVNjAylM/UCPwx90nkUtX+3b+bS5XsyVapuRnWS7rvhqXOfdS92ezuFBLFvrww2v3auDPifPpNNvlQBObQy3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9j24EWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qn+fDllF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9j24EWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qn+fDllF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NKeT528523
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 09:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UhySC20aaKpea70C2ITeoe
	gyCZL/GiY9pXOTngPg0iA=; b=O9j24EWOVYLlHwfBNUJlJ0ibOCvuU5sPy0Erti
	IZ1u/9YY4nmDwMn4nY0+njwBuVDV9v5cXdZICobEWQe5ik37o51WUkBTeqixifF3
	W0q7VNj+Et9TcFaAf79ZSgao1won5VpQ4eu0uVVpjLQyA59lJO9aUuB1VWpOo2JE
	DU9pKCa0OErkIgrAi2j2le6ERnD10Pf1O57PNz7M+iYHNllII7pYRebqZZoZxPnh
	X2fVi34ZkrUlfRccO6k1aSCZaa4PPi4ozHg1zOWdtSoHeCKXY5s6Es4tnZAp9al4
	WrXG7TqXQdjlDtKv7eH8I+zIfVqeM8P+Fcq3fv/LgZG6NE9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397b8x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39906175917so1241965a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788342118; x=1788946918; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UhySC20aaKpea70C2ITeoegyCZL/GiY9pXOTngPg0iA=;
        b=Qn+fDllFgkHJv0wXBdr/cqupw33eRN2oOvj8vWKkpMmPHJ8R/mpWspRRO6q+7OhfAS
         RkNrmAdi+3j1Nyv0vAMO2sxRwpaiVrmQgSXvO+emKMWhgX8tHyTnGt7Gf8Vwvqr+wTG4
         NtmqiaSM2aVBWsOzzQFlIlGC7v+vFLsYuv13D92MwlNhBGrfrKHUbmxND66j3KegSVaj
         SvDtooIfe8aNW7XPLUI9u1f1EMJiKWDfFFVhkaN3Zvy2gi9cCf+tY+VR585tpwfp1pxe
         m+VdQPrcattOKC19522BOdpWZxa/HJYV9l3CUixnKvxSbQL46+47t/zD0LE9JaUsrgVu
         l2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342118; x=1788946918;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UhySC20aaKpea70C2ITeoegyCZL/GiY9pXOTngPg0iA=;
        b=qq1hMCVfysfphPWigV7dK+7QwOPxMOyxk9Bgk0MKN3tACEiDf0I/vVeJOGnW607wwK
         FaswYNhNPhEiP/5IV5sdco4LQuCtXMjwRDTiGYd31glx3moZRRfO9DkZ4zj184OOAfJo
         vcZbijqUZzuzBftgT2TUiSHZoBPsQ7YYcsw8Qr+HSQxnGB9RW1paY9y4uu6cXNlQ65ZQ
         7O2LXlPyc4VbkqeZSDaR83e0lvEJqNEnKuxi/Od5U3SBg1R8bmtCt5VqmrZNip85ydqf
         MHlzWWSkMH26CS2ilIMRzogmUTLsbQTF6yEvM9lREE3IsiOc5+J7yjXABToEWYSv8r3u
         6daA==
X-Forwarded-Encrypted: i=1; AKwUvBxWH7UeU+WpOLS2Wb8oEN8uWluR5KVhjO+7McvN0tG74kFPJsNIUFWUpCBkOiTUUDZciutFKZp5woD1VL8=@vger.kernel.org
X-Gm-Message-State: AFuF++kXfJbYfgFUOKk5dOnUsWKLi32RsNIxyXIF1MsSaNtGq2oHmaSp
	f+lTb8NCpvdBnj4lM4nBOuJdKEwcQkODJfQpVQiU+qoQRVMLBhkP9lsVV8T1C3Qwi/5cn/bis0L
	EFCnxqhCLZnBD/P2+K0d1YNiy1yGriUrjK0oRRZuDIgnqIf/wa9rHyL/rnJUkvTEVs9E=
X-Gm-Gg: AYBFou1/E3DiKmdDkGT5Q9eZy9vhv0g1L7s9wPUfimZKK9Vddr5lE68/DSktA66Xc9R
	Ikc5qU0FGhJuuoXzY0WL2JhUxR4xKBZ+kC1AB+NDp7eaj+9druj913X+F+gv/JcGG4T4aRNJc/4
	2Loq499qBtpVcJk51EqN3WX5sAZiAWhnmVXIR29yDwyZUu+Z3IXuqVhoNGmMfFqms/h+dLSqrlm
	NoWy5ooN9hgV9dJgw+C+hN+CJMI2kJ+2oSzPd4CCne1qsMfp1RznfzfXEnsQNPIm6sC/2nmUgOT
	pnL7PhigbSKnP+Wp6bYkxDPuKqma0o7ayuKI5u8RoFjqcwZct9HXAgRKi49l0d/48i0YK8qY0fH
	uUqy+n5Yn0oanz7B/vZl25eAOoKNYM4KWl/AEqfLvqLQG6sIrHPQjrcd9ORJy+Mw=
X-Received: by 2002:a17:90b:52c8:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39aee125891mr4691887a91.20.1788342118223;
        Wed, 02 Sep 2026 02:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:52c8:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39aee125891mr4691836a91.20.1788342117774;
        Wed, 02 Sep 2026 02:41:57 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d802787sm12536944a91.16.2026.09.02.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:41:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 17:41:43 +0800
Subject: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure
 on non-AMBA tnoc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFfvl2oC/x2NwQrCMBBEf6Xs2YWwQqj+ingIydjuJZFJKULpv
 xs9PoY375AOOrrcp0OI3bu3OsAuk+Q11QXqZbBYsBhuwfTlH92Y8m9QkI3qVbfashb6DipKmme
 ka4jRZPy8iSH9G4/neX4BFTNmAHMAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788342114; l=2527;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=8T1unBlwrMViH0pWbrFKcGsFOZw03mrL6OQHmaqAzSU=;
 b=VhxAgktyaW1KIW5s0SnePcqNAoV3emSqk9S8gHeanO7UITnzBhl3UnklcH7X8JzN9DkaR14S4
 K4lAy5yrI9yDae3YL/YT4HNaS1hP5syGGxFwqs0lqKoPhWakkv3yOjM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfX55qBMvc+66xc
 oYldA5aYvTpkovMvnUu79IG+b11U8Pg/q9A4lbkeWbZ5UG/nkz+MU8o9RHwPtqMDNmjusXKvUU3
 DDeruIO37LiMd3fVsS/tpt7V0JJ9IT0JkJiR1QSz7YAweb/g17hqzK2AdGzOHeJxyIPwb1DXDzZ
 zgPdrjuLcYzNF4Iexh5sRpt/dSNUGfAw4uMqjTdnClP/75af+EGGey36wFzON5ajeGBm8MRV1xt
 W7qUmQby5dXNaKIX0x8b+ekbC95RavLoH/dGKT9Re2vxGffBz6rkzKh8mSC52dUC/FSYLqOyPnA
 N6pZLet13aBbyRPze+z57Ws3JfVW0Hcj2XZSm0Bzg7B1c4JRHYAziBM7KoZhCbbUQgMazCl2RQ6
 griJuTxnS4eTE9y7C+45nR+ATYSVZhj1j/naQ+53hPjfjJ1y5lQlEjRJ8JxYJpnW/lvZqQUWIY6
 alRkyCaspBpsx822gzg==
X-Proofpoint-GUID: -1sqHXUW1MRwy_E_oHmCEYHHrSDcTbAm
X-Proofpoint-ORIG-GUID: -1sqHXUW1MRwy_E_oHmCEYHHrSDcTbAm
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97ef67 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AaQHQxIyCImLPoTtUlcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfX/1hv0LtZLIob
 NEzBkdJIi3hy1J053/mf7aXXlNn+AGyxzzRyRqnPhB7Rjk1Fk1js8E+DbcJCS+r+ZhTP/q62C34
 NfsRWk6BEOrjBlnk4D/JnMJ0UzmVA3w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020085

For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
trace_noc_id() returns this value directly to
coresight_path_assign_trace_id(), which only treats a literal 0
return as "this device has no ID, keep searching the path" -
any other value is checked against IS_VALID_CS_TRACE_ID() and
rejected. A negative atid therefore made path assignment fail with
-EINVAL instead of falling through to the next device in the path
that could supply a valid trace ID.

Use 0, the same sentinel coresight_path_assign_trace_id() already
recognizes as "not allocated", instead of -EOPNOTSUPP.

Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fixes the issue in TNOC driver instead of in generic framework.
Link to v1 - https://lore.kernel.org/all/20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com/
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..8924b61ad076 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
 
-	/* No valid ATID, simply enable the unit */
-	if (drvdata->atid == -EOPNOTSUPP) {
+	/* 0 means no ID assignment, simply enable the unit */
+	if (drvdata->atid == 0) {
 		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
 		return;
 	}
@@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
-		drvdata->atid = -EOPNOTSUPP;
+	if (!dev_is_amba(drvdata->dev))
 		return 0;
-	}
 
 	atid = coresight_trace_id_get_system_id();
 	if (atid < 0)
@@ -166,7 +164,7 @@ static umode_t trace_id_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (attr == &dev_attr_traceid.attr && drvdata->atid < 0)
+	if (attr == &dev_attr_traceid.attr && drvdata->atid == 0)
 		return 0;
 
 	return attr->mode;

---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260902-fix-trace-id-error-in-tnoc-driver-eda88ea30662

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

