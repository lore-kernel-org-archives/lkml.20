Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943819;
	b=PV1jcmBXe4m0FUK1oC37xmViLqzGKM7lQgAAJ0FVlp6TMLJxTuuZ3kqomr1iP2GDkvA4
	 ahgQi4ZzbFGOAdd1KCDsJGCynvGpR2nBWQfr3Fs0Aez+Yvh6e2qCZwWIGcxSpx81YNAAa
	 Tv6g95GWgeb0tknXbTYnQvI+V6OaCmI3M0wdu735MDjvjH0dL2xV6h69kbmEdDvL/ShVp
	 VAYid/TqtqiDfPQ2saRaUjE4XygacdXZH5lyEbACYjElaZovXHQiB/V4e5jZMONuBXr+x
	 1wr5NBAqkYeaz5wylgJwA/t40UIjgyZe5wYXOgA2B9gX5XARACMvszCdfx3890DtNyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
	b=LHDcBn9UDUrMcDXkhQlNnp/aEBUMXvVuQ6rG06KKr1J29DHCdFpZmp3y1dnoMgiQ5WwL
	 0bg9SvmoiaDT0HJe/xMLGhEvYo1emf/C9TdeKECZIN8s1RaHRwb9/28+6Y6tK/KuPhlMp
	 iSwdLaqjs8noNBnFMV9CtJl6gkl1CWKDo8yQK4YBdkIXYFxBrAJKCMXcjes83YalYzRRg
	 Swp1KWDiB+sWAGa0UKuS3cngcOLVZrmJnPbu5BzCAuG3OOO4XQXa+PwtuSYKA8gkYvgBJ
	 aNrWQA+NaG/PUbaR6slZfGG0jio+fHw3kz4uMywt7IfF7xFTOy/FAt+83u39IV7vitQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ONuOYru/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ9+HyqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8651606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8651606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONuOYru/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ9+HyqX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xwVx1866673
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0AYPyGhXJjP
	i7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=; b=ONuOYru/mlLgps54ZxIiXGxWDZ2
	Q7zKIOb7Tev3vHVwjaRLeSuOoyZcVUmrTtlp8/lwRHFkTQPTp22gE+iy4Q3pu8Jf
	8OBqJ3HQMvkjt2Jwh6WpEMZ0vlhNuOjIv+u9AtxwVVItPuq832JqvF49eL1jLQiv
	okduLc6DHLJKimzqxsz3xE00rhiv5tSwF5OVgJZKPBeVk2O4RvyI2rzLNlkQRXEC
	h/OiOeKMQb1neyPo/N7aLpSFtKPpaAfHlhJyeLgJOynJHvAnoJxFMvZ/ZUxfaR0m
	fawM5xqI6za2sf6IjxIQPH3TUB6evgfJVr/kcw66AYJGgBpIO5n7a/Ezd2g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p994dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:43:38 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-879b1d03d5fso3409767b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943817; x=1794548617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
        b=QQ9+HyqXBkUtqeCFKopjSAIw5P12Xus/dId9lzrOZKAZRMGLVQ8vEdlUZsRhr+6C9l
         r5Tr4d8KlrUzETo3gcCAvjnaHYaiK/kb+APnKO/jyQKCaPjtWACJq13rR94ZEKJNmuHP
         TTbJBDSUMv91xLMqAJb0oNwrFFjLsX7Dt2RLC8u22vSM63PAvERey7PL5JjIDX7y0SZo
         1U9+cOJBOaDx/RbA8C+qbn+PQSMxvQrL+O0SCangDhYjPlURG7pVd4dRK54GUSOVCAMo
         fR/cFtqCTrdX58Mvcyj8a16v1zcws6bYomIVcOdCD3vKr+RuHCBB78jyXbDO31ArNmO8
         FfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943817; x=1794548617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
        b=tRzkp6BNPSSP0cw8K9CbeQEV28vOErT0zQ8ig5Hm+tIMRk9rXlH7cqcLdw71WsHe62
         n4PsUfyPZCshexb3JHs+YGeh8mx8rYYdI9CGvrDNu8f8A7Yg0Mnh45+lusimTAyOTJ9l
         6EM4AdwcK/sHgwFx/2BeGg9qLxCYjqo7UufkdCnpi2gFpGmhywvzsAujiq7PgmV4/rL3
         bKctb7A1dYpIAo7Jn5+6p6GwrPCfOt/zgh0JG9Lh6+yI+2c5RjsI7XP5R8hX7u69YtyS
         lrvHYa5HSeY1Q9QrjUyGHaNIKIAB7JUVFUNqFp09Bi5F+6qrQSgJOkfegyMLHnGNwkTq
         RVHw==
X-Forwarded-Encrypted: i=1; AL+hErHV8BYOPI2YyQyvDXTqti0czJvC1sL48aD6sdse/uoi1lF+S6V/Xt4zzGhkQ5s+pEyYfvZVEBxzanK1WdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wn/CPCHDfd8KI7S9Jp9dEKzKfEhp0kCww2yFGZrFGA7sklkIk
	4linHXZcD51Qh/TFFGUb/gfK6yGhBc4XR3nECw37OYgv7ugiOgA52UU9KWYqviCqkkCSDg7mG/6
	C0KDkMm1r7GP96G4U8pwneiSxPYpMLZZgrWQat6Ly4A+JPvEt1H5Xak8MAMYp43gKX0E=
X-Gm-Gg: AYBFou0or35/gqJUpMG58l4KXvSD4Ko8tiaVA1dbwcVoY0KIcMEnmkvFzW4pzR7x4kZ
	m/HzBh3SBBAst3Y3k7UAyxscIxHC/nuF7wHSkHsPcbWAftDKnZ8pNH+YnC3/cIQ1olkEBC/VJTK
	UseM1In6rggjOWMt5HasHsL6MYYli5T46qU5fdLGqMFf+N2v/XUFysiSu06WH2fsFrH9TVBfK8f
	K3G8ta6xDrbIipKDnqZjRNc1ljoQ/0LsXliuUS7viUh6cWjo/t8/WqUao+Plqp+ubEGwNJMlYAe
	nVLUvTiiJRHZx7yAAV4C/DQYaTr3ILTGHjPJo221oIo8c3DqUEXeBTrAAQPIKIF+XIkM+kwZ01z
	l6wjWjUKkGiCyY4Z5a7gmGCHY5bM8kEVEV5HK1JeCDhU8Mjg0EYpdBbRDfJwFIzxZokhGaO1zVr
	/RSfJl21u0KuAECAwyf8tq4SdI43tT5IgCXA==
X-Received: by 2002:a05:690c:6210:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b3419b7e4emr7126677b3.58.1793943817214;
        Thu, 05 Nov 2026 21:43:37 -0800 (PST)
X-Received: by 2002:a05:690c:6210:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b3419b7e4emr7126607b3.58.1793943816751;
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: soc-core: copy the DAI link names into the card
Date: Fri,  6 Nov 2026 00:43:32 -0500
Message-ID: <20261106054333.2748248-2-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
References: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S4idaItog7wtQTcLx63trrijMi7ejJm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX0Kj0bLwhSN1X
 C1NOxY1vx5rn/0RmU9dsEIZaLdlkNA/cnCMYKctkPAW5oT2cVK+ObLFs5UjC8FsMgDBe0m8c3Fx
 KBxIDwmGGkMRJq6nIVi6MzuPIZHEshyV25VOQvEOIfN9SL6kQZhln9FCotb2K5AtwVqLqd31yv1
 TiSTQHu0AARRNfIy57HQEfvY1NjWRIJgX8TnWPAwMgRMkMXU2C/4Uc0kqyFlB7U5xbhT4WHJZ5x
 q3go8fvEq3lqjQofPT1E/+BfolUzN46EQlwXXqLLgAP6xuvT2JFMQe5H0g/Oy6KoEn0FzF6+TXS
 SAqjdTnVYHPDitz2eQvS3HLvTC1XVjnDPVx7kPmmhh0OjYJOkAEBWbFp5K5xDx780KrHMovl0gh
 1xWlZc4/B7IOCd/iw2sYcFDdwun6EWKjdiWSZSfEF5g9jD9TOJteTY3bwjlGoCh+ulfebTiDmoW
 4xi+ZY3TeMeQPG0P2/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX25nHsqw6oLJk
 XXnMo0hyq1ucZ1HtCWVdYEBuwh5DSuCz7hvyZa3GFXg/4MdmhUFzoXBCI9K5bivHAO94WZ6NCcT
 2vEk7KL32QOMsk2CAdqugXliU+3Xxkc=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed690a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=UCKFswv1oFZCIU6oLeUA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: S4idaItog7wtQTcLx63trrijMi7ejJm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

snd_soc_of_get_dai_link_codecs() and snd_soc_of_get_dai_link_cpus()
keep a DAI name owned by the component, which is freed when the
component unbinds, so the card cannot bind again afterwards.

Copy the name onto the card device, as simple-card and audio-graph-card
do since commit aa173b70d372 ("ASoC: generic: keep fallback dai_name
stable across rebind").

Fixes: e894efef9ac7 ("ASoC: core: add support to card rebind")
Fixes: 900dedd7e47c ("ASoC: Introduce snd_soc_of_get_dai_link_cpus")
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f33bece378b61..0e62965e35aaa 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3253,6 +3253,18 @@ void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link)
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_codecs);
 
+/* dai_name belongs to the component, which can unbind before the card. */
+static int snd_soc_of_dup_dai_name(struct device *dev,
+				   struct snd_soc_dai_link_component *dlc)
+{
+	if (!dlc->dai_name)
+		return 0;
+
+	dlc->dai_name = devm_kstrdup_const(dev, dlc->dai_name, GFP_KERNEL);
+
+	return dlc->dai_name ? 0 : -ENOMEM;
+}
+
 /*
  * snd_soc_of_get_dai_link_codecs - Parse a list of CODECs in the devicetree
  * @dev: Card device
@@ -3282,6 +3294,8 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 	/* Parse the list */
 	for_each_link_codecs(dai_link, index, component) {
 		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
+		if (!ret)
+			ret = snd_soc_of_dup_dai_name(dev, component);
 		if (ret)
 			goto err;
 	}
@@ -3337,6 +3351,8 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 	/* Parse the list */
 	for_each_link_cpus(dai_link, index, component) {
 		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
+		if (!ret)
+			ret = snd_soc_of_dup_dai_name(dev, component);
 		if (ret)
 			goto err;
 	}
-- 
2.47.3

