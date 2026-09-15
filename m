Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E234BB273
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491453; cv=none; b=CyrttH22hdPBtokezXYGQDI8d8icIhr2tSSn7F0eUuj+dNI8hEDNvDPpYTbbRu/wdQxMujcMGktp/FVxYH/K2GGeJw3XyDddoZHU7VRl1a/9Infejm4DRjZRCINv3wBMKG6PkMvo5FIR7wUoOkUtoufUyGomNKx7/F9RG8I7Su4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491453; c=relaxed/simple;
	bh=AsXKWMqSsZYic+4+nHonSuw6IKnniuZC4TJ17xky5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYtoWEz5a++qhaopOEAw+QLoCuIW9dD1vlPLMFdEuBZN3pixkERwM2VXafwHm+uA9xqCsiNRWUKFHXnU5Xb5FPZhW9OnDyHgSeT54E0dc511BRODDfKTRLts7GfhtagfPZGBcaxihEs66wK0Yko0gX9L3nWnhJN/pE8ZiXG8fcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zvh6+Xes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fc+JoXIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zvh6+Xes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fc+JoXIK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FGXVKe3577068
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vThtmsH7s5Q
	Z/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=; b=Zvh6+XesFDYRzFtmL7N7o2bYwlh
	+X/vj+7zZ+WIL30wUvLTTeuvmIrNCDP1iFE725JZnZP5sGaTBz6FXQbiYCztjX7/
	IWTQT7gtjdnd+b9RCrcSpHfvdsryqyQnau8qvLPdLxqTOK4fkaMFoILeD1Pv0gyD
	EMVTlxJJltQDvKrHH3pw3BEjOd8hA8PYWr1KtH60jZSAuWqHouQ3P3dJBsDZ7YLd
	QF5hJVwPvCGYGbF/Ew1Mq2dD9rgTqa6r4v7aXi3aJgKrkTxo6E9xjYTEWOT88oiY
	VatmXztCcTXdD4/WTs/BPk3TNR5x/O1EAyouKDqceJfTbpWL/DWbM8sINjA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n605g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78580a6b2fbso1562753137.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491442; x=1790096242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vThtmsH7s5QZ/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=;
        b=fc+JoXIKh4kLWNUi0T4sx8voKaQxFWZon8d/9CheIWwXT+C66IC6/IhL8zUkQ5hMpV
         PW7g5AG9imIL6C7odqatxwKZN6d1q2leBRFI4qSPBmFehA0KBXlIjYX2ug74WE89z2aJ
         55BCsT/Oi5Cjl61H3tELcAr3JbsgYWyWLmwGHFvVELfsVALa82Ot0/GLozHBa+vvC+mj
         SXNbJMGXT4UTUCmAdVO6AjrG+emc5B+TQgUZVoX/sC5cR7tAaV7YftzpCU3kRnfU/1Cn
         N+GFeE2buoOaFqoKARtBka3EC0cOFijJvnoeU9Pd38MO+6DrqYXHCkHwiJ+cuAOFzR6z
         i+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491442; x=1790096242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vThtmsH7s5QZ/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=;
        b=P73WRTqlEGpGVCdCrGHGbz7FIh14Eit4v97nJvrEUdegbPvC5EcMOm/ondpX+NGEvT
         1gVmF0hUqaCl5rX5pagNoe4aceqRLWs3DESVWg0FfEFpejA5vrrZop1VtsGdY7fVlbks
         +y+6Man6Tx4Yrfl7zVXcfVb5CyyKPaA/2FmbhMCrpan6SeN0x/ncZAb0nTKn6nWWAUcJ
         xye+IECcIb0blzWkoN7d1nULFCpbAzpX39JKHju8YsbGdPHWjXnxESEj4epBvQg5/nlL
         tNubO4Mq3o4rtXv/AtYeuQtSNmsFII5EE+tT88IUltdce+m/XD6Jcwn1Q9G/W4sl5Ny0
         vc9g==
X-Forwarded-Encrypted: i=1; AKwUvBwNVYVdOMWdLakCgVPBpdTqNRvWzaFg5GPWR1pHyW4jx61RQuwS/7FSf5VumsmFIx2jrGqoprVX9QUHX+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lSiBQfhCUW/B2B/eMLJiBlIeIELMwepyvcCc+3y2GxOxgAQC/T
	44L9HubpdLqikXTK6Sl7bgVbnsgL1suIH6zFrQHAcsQdPE0IZpM1RD8p7lFPzrJq86GYseetKW8
	e8+HMcdYt3kp4QO2GKsTWNHUPNG2Y3Jfm4CfKgXwbAM0ZT0UIb7NTI87dYvgGTqmriVA=
X-Gm-Gg: AYBFou1KbQhMlPiFfhckOcdN/6my2AVYXHtdpcqB9DH+inIu7hZC8BAWIui5qgn0icM
	O3Vd8dTY1DG87U1YAZEebEelEmLyqyVGKku4/EvGXwhoh6FMKUV7+AqgKzoQPMu/1mjX2C9gz0a
	wmgkvIjTEjmDtrsuR365oBUtClh0UMlKQogxmasmHZp0PdpTJfeZ1G2usGpVEMGYDcT0njxYBb4
	AK0zIkNXeP1fCTZhvN7WTNeFG5VjKkbBCNG7oJlODKSPd9ELLzl+PXYA09ObwZ96LdI8AQ8JKIW
	M46e6SNDH5YJB+sfGrTSCXaOblan9E8uqwKMa6gYeW6ylLLlCfCH0M6cR9Y0hzHo1o8l7E3VAj8
	AsMhO0TeK7bWazA==
X-Received: by 2002:a05:6102:5f08:b0:79d:8255:3bef with SMTP id ada2fe7eead31-79d82554188mr6083055137.4.1789491442006;
        Tue, 15 Sep 2026 09:57:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5f08:b0:79d:8255:3bef with SMTP id ada2fe7eead31-79d82554188mr6082921137.4.1789491441493;
        Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 6/8] ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
Date: Tue, 15 Sep 2026 17:56:48 +0100
Message-ID: <20260915165652.914893-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa978f3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=V3wSzEE_ktrjQKcqLJ0A:9 a=O8hF6Hzn-FEA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX1xN/v63HsBDR
 MrAUvos3R6+gQix0Y3Z1mFPmurv6zyKtaDdfhOe4/RLpo6M07NVHBlmjPAU1QIuv0L8RhWNMrbO
 BVin+tuHFotSUPvGl6+WI3EHbiAAuCte7uzDckNuQ8zqjGjPLI+vqZI2VyfaIhAHZhmBxv0tCp3
 X2Km9Xvllgo1uPKEvbeBNhcbOINL8Hdzn9iMS5Hdp4FVZJBelmq6ytrp/JABBlDMFzx2KdiW4Gp
 P3s7kQO9TmKzcLWVkFyJ+p6XFppmwzjEbdkVeI2Xf3QRWG8OwztLh4/Y3k4w0mCFCvDDK3/2Ew5
 iUXjIl3zix9Ffe6cg86x4L6d6XpuiDBGgczi9yp8FHFJjInISWjcE25wa7AByK5V7aeVA1+GyFT
 K1fp1y7r2BYy5mOGKbzPi6fnZvm8wlLXU2sfP9VIuOxk+LBlgx9sGA3Rtju8fyC9t3rVBVARrux
 9kXduEP1+h1M9x4PGhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfXxDPwE6mAIpKW
 +mgGTr6EKp0EdewtvGqMue+n+EvmQGni5ImThdjRYwF+NGEQBjrfbflgxVT+MC8G/zAmbIQbgMW
 vaijEagFu0/d8fhpG4GOK8v+57eLP0c=
X-Proofpoint-GUID: uOlYkdZn86SxpHPuFsS-FX6_6mXX2Tyb
X-Proofpoint-ORIG-GUID: uOlYkdZn86SxpHPuFsS-FX6_6mXX2Tyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
spec-defined reset value (see 02d851b46b36) from each Control's
(entity type, selector, access mode). Codecs that ship static SDCA
tables via populate_function skip that path, so RW1S action Controls
end up with is_volatile=0 and get replayed on every regcache_sync.

Add sdca_apply_default_control_classifiers() to re-run those two
classifiers over a Function.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_function.h   |  2 ++
 sound/soc/sdca/sdca_functions.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index e580201d69d5..d3d77d8bb7cd 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1464,6 +1464,8 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 
 int sdca_parse_function(struct device *dev, struct sdca_function_data *function);
 
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function);
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
 
 struct sdca_control *sdca_selector_find_control(struct device *dev,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 6eb0e1059dbd..4196c5c86a85 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2267,6 +2267,35 @@ int sdca_parse_function(struct device *dev, struct sdca_function_data *function)
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
+/**
+ * sdca_apply_default_control_classifiers - apply framework-known Control fields
+ * @function: Function populated via static tables (populate_function path).
+ *
+ * Runs the same per-Control classifiers as sdca_parse_function() so both
+ * entry paths land on identical @is_volatile and @has_reset/@reset fields.
+ * Elevate-only: codec-set flags/values are preserved.
+ */
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
+{
+	int i, j;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			struct sdca_control *control = &entity->controls[j];
+
+			if (!control->is_volatile)
+				control->is_volatile =
+					find_sdca_control_volatile(entity, control);
+
+			if (!control->has_reset)
+				find_sdca_control_reset(entity, control);
+		}
+	}
+}
+EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type)
 {
 	switch (type) {
-- 
2.53.0

