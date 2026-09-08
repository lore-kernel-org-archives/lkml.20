Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58EB41DE11
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856116; cv=none; b=fmpkd95bHzh7g8ejxhNVKuE1EkTVS/wxtI/HoH2SAO78qYFNit4EKS4fdKUG2jZPSU3YfSAx6ocfh/FKs5EeCSjHkytEdPwAsZXhTx86lX10WjoaRnKRCmu6K93k14HhRKhQ8b+cfEscgx0VJRYFG/neH6Sitc8X6uP4Kjdiq8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856116; c=relaxed/simple;
	bh=0pC7ctkGeNewlXTVr325Y7LXGf9gQxuih85kMSrjigI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZ2xXI/OJl13alAM4gc9Od7edqiCPN+tB/mCHtzcvFBoa405FHLqSP6n3UW+eiYvvPCOimVDs81ge3a7uc12vzBenP3us7L/5qJg4ORDMJzQQ9H9+PYdrtcZYiu7+eAfOpEFgRTd/BWWKFk13sUuY3Ti/7UYIPPjnVM7mtGSTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofkNmySt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEhSW/BQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofkNmySt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEhSW/BQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1AR2979240
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JaWxqW0guWQ
	LGddd73wExT8hAoeqwzidPzMb7Po6lo0=; b=ofkNmyStFzHs91ob9A1Ts7e15K3
	Sdzz9xmOYVz9wx4Im2G/wbfkq0c5XTnbWiJZAntZAVGE7LUHUppCS64L3PQJOoZk
	Jz1u5V9VW8KFwb2DGHAT0RdBUvW1/ETSApNvPIGWkdK5BkHaNy32XF3457lnc/t/
	iqASfor7iIXXT0tA5L1TEh/rdpkdnxopF6mLigjRQVo28et2+tmaep8JRbRFI7tw
	+tMH+3a0+Wu7YYnMNWzJrK4BlZPeAFPvbgEoW84C3pIvbEgPSbr+DywtMDeO0osR
	+cTaLkvnrbkrg2nIXoE1BXtcM/u72XnmfCTbHX/w/4jus6GW+JBCAhR98Aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbwqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:28:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93975d63ffcso483065585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856112; x=1789460912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaWxqW0guWQLGddd73wExT8hAoeqwzidPzMb7Po6lo0=;
        b=FEhSW/BQU3vpL4NclwSaLuP/yIcMtXhT3gOH5EE54oU9IeDSMJ52SHZmByde8EW5ma
         JlKVp3MGTMN4TG9TvjPMJYfkVsgER41R7PP/RFQwBmhOtKWTupCnH1Y5qLwoIpQKWpZy
         z7WkfFH8OOOy4DLDJZ5Tekrez0LtuvX+DI7qQfd1BtQzUn8HXUvfuX3mmcp2iPuKkZ/m
         rlCkUVbcIJS8CLF1ZiEAwKRcSvF01q7Ua9Ou2AWRjakcGC55IAswn1vQWGB/UlprjOEc
         vhh7dv3Nd3BPsx7lxmGZGFzW4XS1U6kdqIaADWl6Jjyw0SG9/UNQhTwMKwPOCNBg8P63
         TneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856112; x=1789460912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaWxqW0guWQLGddd73wExT8hAoeqwzidPzMb7Po6lo0=;
        b=HqhRXtAmSXbSZVvBka4EufYjzZgY39szG+vayUQmNShmpUzSwuEHj+BGzJ9wSli9GB
         5/oQCv9oOfKLn3MLV1bNLBaxIAhVLVqLMI8jYEZaBAKKyjPfiFYK1YfhPRB8R+tX+wHY
         3z9315pik5E7N9diDG/SWg+5mMjGirWA5xt6dtSYu806uN9WPL0XCX7frS2IFxM7QgY6
         JMLHURs4OojbH5feOPIGuaFQ9ArzGbcTodq0oyvX+NPggZz/ehFUc1NsGmiudmE51pfM
         6BUWh+t7cEB5f0j0+PffP3nSlAFOhPFKGG2gn7luZ+Pwp2mrS68Cqcm79zacVhE/rK3y
         LTkw==
X-Forwarded-Encrypted: i=1; AKwUvBw22Fw0rftfQwml7bGegat46M4HivGBjfVQy/iZzqShnJSDykX7VjwTTsn2JL3FRjrP+RfJ2L6rxpZtomw=@vger.kernel.org
X-Gm-Message-State: AFuF++nXZ2AVQDeQ3P8E5cudQvCb2UNixHHH/OiQOIWJ70mxCZXQZ1Ro
	u0Fyu/wxJLiug52vo5phAbScET4V+lyChc9d/raUE24WLIOn7ZKpVGiEXn+6o7R4k9APP9Himug
	ris7gZSS8Cyaw+yh8CTmZ7XkUM4VSNE80R8vEhx3fIxyz6W8AOKBx3jMiSNQimFzzRWY=
X-Gm-Gg: AYBFou1ZEQcJaQJj/J07q1pOvZEAeBCP/1KqbP20TFQSIWzOWLkiUq/6KO8WjO4eFsq
	d5Of8nlc9KP1xWRVDbJzbs6y5h/rcjgHRfCkR23mMo3yUmUgKa2Pvfb5WkR0zUmBjQtgG8Yb7cu
	te7QFH5kTenrsBfpL1F5befixYEyQdqKkIXwEkNBc0bUw1h5Oila1cRinN6oRY66O/ozipnt9sd
	+lqbpsJhCRZqmOnNDedPn0ndP3RLEAKVYPkibWt0XxIoVEofWhWv/RDxvgxUJqVwisZuO9ChjTM
	+uyqnOc+snhUM2m7gH/IQOxOWaBTQj6MoatAAk9lQ9cXYFrhXpxXFNgLALVCqdEnKMNOy+dgdNc
	o+YXfc40GBVvvfQ==
X-Received: by 2002:a05:620a:29ce:b0:937:6832:1f04 with SMTP id af79cd13be357-9398042bf14mr2983382585a.34.1788856112359;
        Tue, 08 Sep 2026 01:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:29ce:b0:937:6832:1f04 with SMTP id af79cd13be357-9398042bf14mr2983380585a.34.1788856111944;
        Tue, 08 Sep 2026 01:28:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/6] ASoC: codecs: lpass-wsa-macro: use v2.5 Compander1 addresses on v2.5+
Date: Tue,  8 Sep 2026 09:28:01 +0100
Message-ID: <20260908082806.648797-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX1o70GTNY/tR2
 l83a1+4QAT2SR0jZlgQAJ7Y/Ecopv33a2EC1Fo3yRBQdW0gPmI28l+86CQM+ezojVtv+wZnwJ0h
 DMhK4N43BCWZcdJseulgUyMvLnLm+8g=
X-Proofpoint-GUID: L0Xk-hQETNjW1W8xycbkGBw5yL6ANknD
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fc732 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cQ6CwtaciBsBVqg4_WcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: L0Xk-hQETNjW1W8xycbkGBw5yL6ANknD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX3rAf+dr5/HpA
 VNNupkRCiTZWc8rtkpgMBkQ3lAhI6kntnzcdu3gBJE+NQZ8R2oCk0dYfDeYXL2ORUwc8JojbEYi
 mR4SyQwHi/1iS6tnkuC7pbGkNiOiFM7CuzYdubAHAbO2ByfPAz4o6Q07z8kcEL8vwTo0w6YAQTH
 7JRYuFcO+d+pgB8AuO7vH0ZmEwF4HeElQ5L8iSEbKloqfjUR8N8rpaRz/X6sStNmCPkBpYTO7eW
 5FS+TrDAZRyf0UqxCcmSpsI5HPwDexhJiM4E9vo8lmidNQdsN5FG7bDIsFZAB0kCZkdkvOMrona
 sGE2if+6TaD/XOMG2+LuRMJZVL0yxOdWOKNTlup1jjD1bIs0btK4QmSAYzYc9Xl+d0SaFlHR8P7
 OQbzg0HFFfJAVTM3JYRXXyv8hPpC0rpLdpZsk83PMlUyfVVRRSkP2pUG2w6Jfql7h/qFJm+wADM
 pcxBsGI0wrBLTFiUpfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

wsa_macro_set_spkr_mode() unconditionally writes CDC_WSA_COMPANDER1_CTL3
(0x5CC) and CDC_WSA_COMPANDER1_CTL7 (0x5DC).  On v2.5+ silicon these
registers moved to CDC_2_5_WSA_COMPANDER1_CTL3 (0x5EC) and
CDC_2_5_WSA_COMPANDER1_CTL7 (0x5FC); the v2.1 addresses are dead on
that hardware, so the update_bits() calls take a bus error:

  wsa_macro 6c90000.codec: ASoC error (-5): at
    snd_soc_component_update_bits() on 6c90000.codec for
    register: [0x000005dc]

The flat regcache had been hiding the read side of this by returning
the zero-initialised cache slot instead of doing a bus read, so the
error only becomes visible once the cache reports the miss honestly
and regmap falls back to a real bus read.

Select the correct address for Compander1 CTL3/CTL7 based on
codec_version.  The Compander0 and Boost registers used in the same
function have the same address across versions, so they stay
unchanged.  Also collapse the two mode branches to a single sequence
with mode-selected values, which is what the switch was doing anyway.

Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 42 ++++++++++++++++++------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index cfd2ac0a6cda..7a2b0cf9398a 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1129,27 +1129,35 @@ static const struct regmap_config wsa_regmap_config = {
 int wsa_macro_set_spkr_mode(struct snd_soc_component *component, int mode)
 {
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	unsigned int comp1_ctl3, comp1_ctl7;
+	u8 comp_val, boost_val;
 
 	wsa->spkr_mode = mode;
 
-	switch (mode) {
-	case WSA_MACRO_SPKR_MODE_1:
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER0_CTL3, 0x80, 0x00);
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER1_CTL3, 0x80, 0x00);
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER0_CTL7, 0x01, 0x00);
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER1_CTL7, 0x01, 0x00);
-		snd_soc_component_update_bits(component, CDC_WSA_BOOST0_BOOST_CTL, 0x7C, 0x44);
-		snd_soc_component_update_bits(component, CDC_WSA_BOOST1_BOOST_CTL, 0x7C, 0x44);
-		break;
-	default:
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER0_CTL3, 0x80, 0x80);
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER1_CTL3, 0x80, 0x80);
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER0_CTL7, 0x01, 0x01);
-		snd_soc_component_update_bits(component, CDC_WSA_COMPANDER1_CTL7, 0x01, 0x01);
-		snd_soc_component_update_bits(component, CDC_WSA_BOOST0_BOOST_CTL, 0x7C, 0x58);
-		snd_soc_component_update_bits(component, CDC_WSA_BOOST1_BOOST_CTL, 0x7C, 0x58);
-		break;
+	/* Compander1 CTL3/CTL7 moved on v2.5+ silicon. */
+	if (wsa->codec_version >= LPASS_CODEC_VERSION_2_5) {
+		comp1_ctl3 = CDC_2_5_WSA_COMPANDER1_CTL3;
+		comp1_ctl7 = CDC_2_5_WSA_COMPANDER1_CTL7;
+	} else {
+		comp1_ctl3 = CDC_WSA_COMPANDER1_CTL3;
+		comp1_ctl7 = CDC_WSA_COMPANDER1_CTL7;
 	}
+
+	if (mode == WSA_MACRO_SPKR_MODE_1) {
+		comp_val = 0x00;
+		boost_val = 0x44;
+	} else {
+		comp_val = 0x80;
+		boost_val = 0x58;
+	}
+
+	snd_soc_component_update_bits(component, CDC_WSA_COMPANDER0_CTL3, 0x80, comp_val);
+	snd_soc_component_update_bits(component, comp1_ctl3, 0x80, comp_val);
+	snd_soc_component_update_bits(component, CDC_WSA_COMPANDER0_CTL7, 0x01, comp_val ? 0x01 : 0x00);
+	snd_soc_component_update_bits(component, comp1_ctl7, 0x01, comp_val ? 0x01 : 0x00);
+	snd_soc_component_update_bits(component, CDC_WSA_BOOST0_BOOST_CTL, 0x7C, boost_val);
+	snd_soc_component_update_bits(component, CDC_WSA_BOOST1_BOOST_CTL, 0x7C, boost_val);
+
 	return 0;
 }
 EXPORT_SYMBOL(wsa_macro_set_spkr_mode);
-- 
2.53.0

