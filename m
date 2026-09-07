Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB2043D4E9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770322; cv=none; b=eHjqvg13JQxP9IOA2Ggs8uL/VC7OvtGYgfGI29eQqtUsY64FOgPAV9+ODhJ5iiA0EJK23d3zIbttDutHkM42kfdPKnAGLzj9KaOtV+KPmPL7pm6+XrG9CQztpXRA0R3U5wkpOr7FWo5kybSg/rEi6ddw7YbW1NZ7SI3I71QGx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770322; c=relaxed/simple;
	bh=nGv5PetXuMnjGRkeIe8kY1eFNyjb5QBvGtSYOUuF9OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vy4ExtdxE+x70Mp71D0Jde6p21NceB9+9dyhxA3EHCDin842v9yJZ0JWnp0sFjXncmu89Wkl79y5TlMkGs/ATdxf0rxz/8iuvS36IC7V8LR2ZcUohq7NxolD/rWB4bZqgUHjjUh/y0DaHTuhi+SDRmddb/qCdnkzXuK+iJeFSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fm3ix7CK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKnK4BJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fm3ix7CK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKnK4BJE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NNBn333059
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uo7ZUub3lrZ
	EEc8DFMNE8az0niDw3dx2TBatUAmNhAA=; b=Fm3ix7CKWGUCowiXlEr+Uue7Hnz
	3gZYvz4/FECE38qiTik1WO1XqhLpLh/tXjDOMSzVb7gh78zy406jE4pi9R17GJLH
	UidSOTET8i3AaPVVo+nrCNNrKZv1dnPUoDhu5/LUdElUHWucW09C+s6Wdju0oH09
	j8XC56KYJwf/VgX+RgK1tsXpEOMiSO4/HVFzmUYcihiXkVjDUk6NellH8RAQPv9F
	WozCSvnD1WMwEV9wB98ZPjg2WJbi6dMwzWk9mpchUF3AjKvhbCEA8lIOg7/dmyQZ
	kdzvmmxeSTi64DP3ccaVdoTvAb5ktBYX9Syt3lfykjVaW0uysSazeeuxLHg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8efp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91051512080so18445716d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770318; x=1789375118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=YKnK4BJEUcJga8PapVQCfwFPvuE67segraz7Z8xE9zBF66w5IAP51EPRNKyG7i5vLA
         Nmm6jDmOxq2s53LGjLsoV5XrHsU5gWu7s24Rojf60P/O5Sfg2UK+NHlbIMI69664EpMa
         IJer1kQtfwIUoibaVaKMrErudHUrNxIWYD3lNmSkOfP+TTQ6UGR7zur/0ILEuY0DWIbl
         6fyRjwjp59fh/y9R8k9LWKy53qTMlyjfAF2TLgo05kSRvsR1ORHbjYc/5uETFxDSb780
         o9ua+hqxo+oJDoRJ3ehOiWb3+AHZvtgMc/w8OtGbIF99Y+RsrAu9E1zQgl3yRtNXU0jm
         lfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770318; x=1789375118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=FgZEt61SW0mLtQAr0ZnTa/fTb1PfyjhmQiJAJqNExglPYzeOFyJP8TMJXf9JmcFPGi
         9j2GwY6Qn3U3CD/WsUo1W6pXm/Vea4yhZG0dmGcfYwjH7ZMn9BQvETuH5gTYfsHgHObN
         Z80ew3Fi9Oe9DfMXSZW9bD2/h9C7glvqhl9f8QFoMvuqkD5f3Ktca5Q8f9Qk5tyPFt2+
         jfWj0b0XXN7qYKo9HG64kWk1EkVXg5/YaSGCXDVgoMMmO53mtb0HMmMQnrwp8Ip4Iwls
         izOpfLTESolfWGKZTGCcSVeFO30t87DG99Rza5lH/vMmHlyBA5rv6mC599eyaUrLROIL
         zoWw==
X-Forwarded-Encrypted: i=1; AKwUvBzmr32kBlbhU4/sipfD55eHSO7OwxGfLM91pf46aD+T05ZgVROYcyb3JhqG2KsIuLbiQnWTFP9PuMR4DW0=@vger.kernel.org
X-Gm-Message-State: AFuF++l9PGDAf/LAJOd0i2nAyiiDa9c9NpytRzijopH208KA4EtXIVYt
	C90ZgLDPgkN+nn2WCfkc3p/IIs634wK1OKAmjCIIfPe/qRhe5HWbapaCqHp4vBL/sms617Fm/Oh
	FfEDx/2tElGejhaf68tgsFNaOii923QE8t8tMNrBE1RE34fgoAAoRpQXVG5tjakVSS04=
X-Gm-Gg: AYBFou3Tocr7iwqIXgQXuUtkGhWlFFIlDe5YlKvTvFeMcL/wwAOxYfnhoOqwZLAyJT+
	Dj55/fwRHCqz6xjgwKPH8RVUJ4/4MTxMwTQctj0LATK1bKuFWxGIpQ06udSx401zhXIx831O0Ed
	+yCmDToDVSXfpHyV1nnlYMVQSs+D9Tk2CZ1q4fOWSb0ltZlPBJg6ljXvlKsvRF2w8TG+U7WnVmB
	gInEM+FedpajPMfrCfivLB6W4nfIW7idoSJl449Ik+s3ZVQ77kQHYuN0+WKH+d3Nm5I4iHBhDT/
	iB8VV7KJ8J8kVvx/6N2rGTGzB/YcxLsY39XGekeOYTadp3I7XMGv7yxQMX8RjYDKPuJqrwhj43S
	TNtwqW1NhoZYAIA==
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209543485a.0.1788770318376;
        Mon, 07 Sep 2026 01:38:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209538885a.0.1788770317851;
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset() return void
Date: Mon,  7 Sep 2026 09:37:22 +0100
Message-ID: <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9WMvIcIPZSEfUTmvTQnOei7UE3IT19bG
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e780f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-Ca9_MJ7E5AnbNBKvfgA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 9WMvIcIPZSEfUTmvTQnOei7UE3IT19bG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX/ryBKlVV+WsD
 pxn/6E9eVqKcJpnf9ZH7kzW3Eli0nzPhQdszC3n+pSIRa4wlPeHw6s0Nz9bD7CoH7ZDEbGk0Fmv
 prLlf2EB6kR6FRDGlM2YRGZNoLeGuuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX+F+e5Jykc/ls
 cN+lnGd/2xKQn5oie1zvw5JWgJeOO/+IQiqv+z4hVagQ8rewvLb7065kIYEfqkxZ20oVa/k9Joi
 I1CW8Kht4QMhlzKfA8HXdSQ6D+rfe/IH7jeWHYaZ3iQsfVAbZOkc6ct+fp8xkklAvgpVZ9IO5AG
 JfC46qzrnrOzaBi/u3RhqJ835/z+YBRNvpI49LY0JaWanQqvP0mqRXix5rSO+LLlaufLIfWAPzM
 3Jzv5rhh5uxF3c/+ujslkY3a0HDfx5tMSssKwtj/XbNJN19RUkGW2Cvdnwc1NUqBGgqm7eEN1Ks
 hFJKVEBSkpE/BcCTY6gzSYqqsGy8CeeBiYTjqvSsolKbeaUrcAzkWpIzEXAwLpBoP5Jy5tbSgCM
 1fpXNeQsiMKCO1TGdvJiIVtWpU0L9Vgw+lsmdjBV/eld3IFdBJHkyDHHBz/rtVU5IN4XzUICn+x
 WfBcRazfpu4rzEK0LdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

find_sdca_control_reset() only ever returns 0 -- it just sets
control->has_reset / control->reset for the framework-known
(entity type, control selector) mappings.  The int return + caller
error check in find_sdca_entity_control() are dead code.

Convert to void and drop the check.  No functional change.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_functions.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 25f95575c731..68a50552f4e4 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -922,8 +922,8 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
-static int find_sdca_control_reset(const struct sdca_entity *entity,
-				   struct sdca_control *control)
+static void find_sdca_control_reset(const struct sdca_entity *entity,
+				    struct sdca_control *control)
 {
 	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 	case SDCA_CTL_TYPE_S(FU, AGC):
@@ -950,8 +950,6 @@ static int find_sdca_control_reset(const struct sdca_entity *entity,
 	default:
 		break;
 	}
-
-	return 0;
 }
 
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
@@ -1032,9 +1030,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->is_volatile = find_sdca_control_volatile(entity, control);
 
-	ret = find_sdca_control_reset(entity, control);
-	if (ret)
-		return ret;
+	find_sdca_control_reset(entity, control);
 
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
-- 
2.53.0

