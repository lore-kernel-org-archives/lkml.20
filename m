Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB7449B19
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772466; cv=none; b=jwd4OJIIfCNfkYfM5Ha9FX1b6kOziCe3edEFgmLC7l9rgDMAa2BJ/PCXCw53OhW7pNjnX6y7329bXeG85ZQBlk0G+AKpB1t2v+LJ2G/JFCC5msKJwgIZxdIrids17X3286bZOrt4tvHJCda+U/42iddZlfuJkCxm7Bld4JaFyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772466; c=relaxed/simple;
	bh=NYbmgC2XRLkSt5J1CBdChQlA98CR6LLPtwW8E/RkRc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koOvTgDlYL3ycqRFLjG9YrCk4yiLObe8cpVe+7/rwjnydrBGDaEHgL1r2rajOTKDtSvAtdI+cy9onRIP1nT4ehXpkh8mOQiokj6Q92Nlm/ZFlEg2q7SkV8yUUWwN7xvqfHJhFJfxWyIfbDpcXtKV0AzLT9b5jazznxTPhsOqCtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu6BhgBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGT6AN1o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu6BhgBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGT6AN1o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879AuNp4188442
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wwq1oK15Jr7k+xNkFsQ6GLdQUS9QHbill2N
	kskuia9g=; b=bu6BhgBgp1p4nxAXqnGNwPAM3lZ9SbzeAaKoUrwW6Hqa1+pJfXp
	PGbVGX2d5PT8bL4xoe7lXuZZN3UhG7IuU1Y0FQ/OuZvRwdlZQDUKdFUyjTr8TTza
	c4e7Fywc/dQBjDoPmy6o1FUJWyLeaYidjCw91g099JsQdkt0TTsqAW6JmrnV8Xsy
	OitIxvPL+jYaySqwjxI2FnOn4lwTpjEUx5wMHXsjE/cE19nEAByBKQrLM0QC0D6M
	90UWEr2a8omZaFTC+NA6dwSkk4MaDqtqI+vKdPh3u5NfhYL5dgT5jzfwrMCBDVFC
	44ffETrZVsgjJu6fU+34qmZsH7IoVgxTKog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqg0fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:14:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939694871aaso544813885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788772463; x=1789377263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwq1oK15Jr7k+xNkFsQ6GLdQUS9QHbill2Nkskuia9g=;
        b=CGT6AN1o9MYtY+AXFZ3X6EvKJ8OPsMIL2/mri0Lfxa9KRUmvqj4UPP/KSdiYUptD1K
         cphTtL6wqb/qZofc0uZQAEFtnuou5cvgj1HY5ITHV4vJ89WNsf+QfJ3HF9ZR+D0cOBTl
         8noN14xQTHUHGI/rDs9weNZ7SejWoR8WSF1Q0kBtMqEzX35Meizu4XX6YipU8/51vxaB
         gbLNT3M/3PnOZo5MPELBL9EmDGISqR06ahtIGUeffbqMi6E+eS/paRlxK7726EUXEuvv
         4g5frHTgzsnlpig6PUZV4Jj13fM3lDHh7lqWziJq5SnMnMXeQ+eXZ+GkHWGdRVhXLnNw
         3kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772463; x=1789377263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwq1oK15Jr7k+xNkFsQ6GLdQUS9QHbill2Nkskuia9g=;
        b=JOA75A6ZSbEWZcUIOvpDtw1ueCLdJrf/Yevh9x8Uez5YKYKkRu6dQVnImbPw2n9uTu
         3ps2zmGp+DjjTgfvDr4lyd2iFZnHM12ERGIJOkNqz0G5x0kXBf1Fe+9EO3Gpy11RIZpv
         qxolAHrfRdZy4O/JxZZfhCgqgRQmfZMIAs/rVkCXiUHkpXzdy07q0e5UwFedOidMXUD8
         NyCJaPCalWrOfFKI8MKPLmLyjp7eJMkDtumbpM2CDItg1wns12eh2SXyCRSX86xN1lH9
         Cd2uJgIMMFsR1EJ0h9AM6j3adThxRa+QQej8eL8oNcm/uaedX4wPCtll3XRnAuL6iR2J
         t1sA==
X-Forwarded-Encrypted: i=1; AKwUvByUSguRC/I3ippR+VriBN2bkxTYPGD9McI6EKkoMogFyJGRDQevtx/dAn1+ORcxcitDAzrW3DdMheliLCI=@vger.kernel.org
X-Gm-Message-State: AFuF++lp5qPK1ueSKePbvV47inc+aLs4WRFfsuD2DBz9pJd5u7lnZmZM
	Nxd3o0WWxegQDaJ39KO/dtfcy+4D53K7Kc7e6JYMpPSdp4I95AJl4F+sMf4wbBFBjtalVQWlTj9
	DnO72h6pE8jpGTaCCT3qxWTsibAMdM2dBPpNqSFckAh4idXcmlDDnPJXr6jnWbROAl8w=
X-Gm-Gg: AYBFou0fitsd+icKLKEnrTo5/gMBTbiJX7aWD4VZt7VxUTpe/FZzJOhdaUog7ICbgEk
	77v0jGhgKVHS+q/ycphyefSZOZxMMPxx3QfDsiP6xG6gKLieif2FI/+3u4rIq9kRHFv0FupdsnP
	5stxmzm8Z++EfbuJJhQIGO6fa+nBYAmP34vsPp8z8USCwppeFr0oSwbDAo/egNfy0UO6jc1KL8R
	fX6odcVEyXJVbZrMVnWUcNqf2n/noPjlh2BzZBgl0bcp6/AavV7qGNj5lPf87VJWRkWPpY9vluN
	mQYjDXKeyE0Dd4GO5lOg7zuZsNl7eYYjtDAiYjdhPlgQp1bIQBIPQOKktU3gsDu+N1T9qMMkx+6
	qdh8FhNBXWRdKdQ==
X-Received: by 2002:a05:620a:aa1b:b0:92e:57ae:3a53 with SMTP id af79cd13be357-939802f824dmr2054857585a.9.1788772463586;
        Mon, 07 Sep 2026 02:14:23 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1b:b0:92e:57ae:3a53 with SMTP id af79cd13be357-939802f824dmr2054854485a.9.1788772463139;
        Mon, 07 Sep 2026 02:14:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm15681665f8f.37.2026.09.07.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:14:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: bus: iterate DT compatibles for class-ID match
Date: Mon,  7 Sep 2026 10:14:21 +0100
Message-ID: <20260907091421.837917-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5OSBTYWx0ZWRfX/eBtIqM9KvEK
 b3mDrFzHg5uFGnzQE9jzzsO658LOcW0NOArRFhYCYT6bhJhr6NRoPl7+ZYCaAu5W6ZE1X9fgVxr
 QN7TwJetnqkMmKkq/fjPYgjGK5mExYHHwy9FuVxOVRPOV+1FKJglK3kpNaNZcNOA6xwwnzcN17v
 DvMcfd1BlwKhuY4vQyUe3WsDJ5A5uZhmBjsQuMLYxYtBpgKirJIRLum0en90PWzo1RwgFinyEFO
 WxvjwVVyZEvFdIm6UvrE/iJHByGw45udAM5GyTKsHFlC1ZSaFb/wiDe+t+BpBwD7rP9pcOQ4kQb
 4FLhEIzeEqdLogVHBOPB/MF6T85M2Z84D+HgErg6gK5/FNezAnRmMcUm3GiLzHYrDZLqack3BTp
 mlkw10HpSoAxOso1viVn/tM6uI0I5r1nekp3u5BE7N5ug2InOLLI5G3TYeAyP43j/P/jOYpHQMh
 ar5iwCy2TzIx480nI2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5OSBTYWx0ZWRfXy8Ho1VMLZdXz
 ohD83wEfotuNe8tb+FFxDTOJj15CHL06mbDxiZBnocMO5h5qNHJopiYK7Cjf5bfUiVNVHPnVCEH
 ToD8jT0w9HXOp99ztA+wxR3S8BjeskM=
X-Proofpoint-ORIG-GUID: XquJmeS0Od__oQAAuH_MpMbDAgkYzJic
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e8070 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FnuwY2gGiWojwcxyLPUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XquJmeS0Od__oQAAuH_MpMbDAgkYzJic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070099

sdw_of_find_slaves() reads only the first "compatible" string on a
SoundWire slave DT node and rejects the node if that string does not
parse as sdwVMMMPPPPXX.  This prevents the standard DT convention of
placing a vendor-variant compatible ahead of the SoundWire class-ID
compatible:

    compatible = "vendor,partname", "sdwVMMMPPPPXX";

Iterate every string in the compatible property and accept the first
one that parses as a SoundWire class ID.  The vendor-variant string
remains visible to driver probe callbacks via device_is_compatible()
for mode/variant disambiguation.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/slave.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index e0c49cbcb1ba..a7d2938b031d 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -243,17 +243,27 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
 		const char *compat = NULL;
 		struct sdw_slave_id id;
 		const __be32 *addr;
+		struct property *prop;
+		bool matched = false;
 
-		ret = of_property_read_string(node, "compatible", &compat);
-		if (ret)
-			continue;
-
-		ret = sscanf(compat, "sdw%01x%04hx%04hx%02hhx", &sdw_version,
-			     &id.mfg_id, &id.part_id, &id.class_id);
+		/*
+		 * Iterate the compatible list so DT nodes can carry a
+		 * vendor-variant compatible ahead of the SoundWire class-ID
+		 * compatible (e.g. "vendor,part", "sdwVMMMPPPPXX").
+		 */
+		of_property_for_each_string(node, "compatible", prop, compat) {
+			ret = sscanf(compat, "sdw%01x%04hx%04hx%02hhx",
+				     &sdw_version, &id.mfg_id, &id.part_id,
+				     &id.class_id);
+			if (ret == 4) {
+				matched = true;
+				break;
+			}
+		}
 
-		if (ret != 4) {
-			dev_err(dev, "Invalid compatible string found %s\n",
-				compat);
+		if (!matched) {
+			dev_err(dev, "%pOFn: no SoundWire class-ID compatible\n",
+				node);
 			continue;
 		}
 
-- 
2.53.0

