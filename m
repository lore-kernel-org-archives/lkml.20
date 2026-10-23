Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775625;
	b=UAhsLvMxkHi+5edvBM9NJ926rP4g3mbhffOOZxIdrZqagH/i43AgibfdB4fcIjOJdf+s
	 wWpsGi7Fktu0EmYXL1by0Sb5wTNfPx/bjoRNicntjsRF0ZY7u3QYcGyX0gUHQM57DV373
	 tYB+exwx76GsqjBV3PqJNFqSwwQGYxEzhLIcefvuVxrB5mGVlCt9VVkyNYH+a6hiXDB98
	 1X15q6lV5HXvOg0uwYLKlAZXHLlvSypP08uk37J3DL7QsvkSmRoe9VXK8c8b/43+HiDnP
	 4qrhRNBxyrpzxk6Oims2IB72zJlJxzdEG5EioPcqRxoZez4ZOo0fv2B7gCoyXlmBAmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
	b=BNb8qtPTBrlyY5DtWGg3AzFQGt0QFq9v1GmsQuUdUC5PvZD/eIAeQi/lCF2rOGM3ynK3
	 aE1TaB/tdIu/hd1OtVl5+1UArNFTPcK1k5BqQZe21925ytL3IZZ8B6JR5h/yVBSS1sTuh
	 PR0Y/RgYKq+m243eLu5RLQpk9B+u5m++UXTNjI0t+W6qalkIyRi3nY4ZdyZiv47qpjz7g
	 zTsM4U7K3xJ7lWo3DE1GIQ6OyE+xIeGPfW/3nWfOSCu9GFBr+oZlV6XrDm79abLZzwOB0
	 f83354va1hRp9dw4KqtZek2DPVy8APURGAV5JlDfp0mb5cGxrR9koF4UmgBFNIsZhIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7L4SK1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mu2TudLt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC287606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC287606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7L4SK1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mu2TudLt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Cxt2462551
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q7CjwrJ57Ux
	ft8mucUIc/DikdBIKR1vUoHFHQH37p7I=; b=bh7L4SK1crVSQ6iTSKD6MHT394T
	QC/tYml693U6boFdRL9jMD/RLnScMtr/+6TL8aJeSnt6WgjkCx4caeW52c6SyPjw
	QIxs2QznkN67RMMoqQiv27lwo85yJdd/x4pK31mK/rxT3JzcroSyhqydCkUi1oz/
	38A4OUZ3rcMOyXhPZwKWD+t5/LfsKp+OV5yF59Nc4M6nURRdYKp5Xv+89V+znZtG
	iB6PGZLsCZxqq5cqoEFMtKxW7I/eg6USwpeEkA8YmmzIfTGUrYN0p+m5LvxprlCv
	7eeWRncT35Aw5IgN9QkoLKZcfz8wbHjhZ8SuiNyY8tM26/H+e/xGji3Cw7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvrxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso242556585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775623; x=1793380423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
        b=Mu2TudLtfAqRCKDhf+dDxfKn7WKIWVZdALD/brqlrUX4YMzWrhF8k0AkPC2oNl7DyT
         HlKQLmJwTF1FQ7dPRlNE+2Fa8a2PlXKRldAcLU0Eo8srxeHxBCStK97BQ581FmJ401Fy
         4VJz8aV9swA/vFtSTior6kqU3aLhL0a9pL1DCixz64JviL3L44AI7hLgwXW8WwRp8igT
         cM840ZyI0dPbsQH58DYoXJ++NgFo3pFYEtlzWWYYE7LJRFphdwsR73fKAuUdmx0shzNG
         oRFzans6A46JMvifyufuTBFHaD73p7KRGHU6kn+XrcglTA0IG/gRjvZrAB6N7kEmx1oY
         T2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775623; x=1793380423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
        b=TtmyzR2mtnv6erOvFXdue6d9NY5SCsvsUo+uQigYMD5HHmgaoHuHkBspwCR1r8g7J5
         mJ6o4nWUoZy0WTxmFEZp4jr3KGuV/c6xB/ASg1PmLe44F/R/7oHJnl44A2WFpdvx5Qnk
         gKU20NDti6pXMiVQhC2uh47dgUWBqZ0cgluUgW9MKtPo0P6BIvO/a0NhsuNdnS7VXVFt
         +l3L2HdnZKzRiotohcfeJZDpiBsu4ydauEedfwSBZBZM1Gi4HqJ/431NxJa+StXzjGqS
         +m+t5cVfdybC93yPw7+v76A/gPw93PpogfWqTDrF6DpSBecXXsfIqQdNJa+3JPdTDBtA
         4pWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRTp/QEGVO010Hhv3sM+dg1MhZI4NYyOMNhcPLRu1RJSzbLKwMejcKDa2VCp6z5KDyeQxJ5Z3P3M28pr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWgSx+tNuneUJnh7go+FDoxFdzcmv/r9I0bRDe2JJvYWt1Ig56
	UQVCgoULs2SMf/alInJn0JiSnlJ/OuJwRCeqFse8B0CIUCbapStshEAhg2t1pZrETqdUzziLYvy
	h/MqzOPYtC+ovChji8rfHz0gMGIZhIZOCfSTkIMhWe3qQzuCb/fU2j0JtVYQfOjYJYVs=
X-Gm-Gg: AYBFou34UOivpVgMkGmmdDB6DAM2+CLDrlLg6R2XheNcDoacn0Hy5hoIPK955VcBQ10
	GKiPxuzrEi01f7Xfh6cHotKhyIldhUwv6opSwnxEd+UHD2lsKtavRoFAt2PTSPhsHBlOVOq+KU6
	3VJIT/wU2mjDW1iebBO/8IF3FBSzpgZ9/Gn5nfPjHNy/HZ+k6YWeG/CUTxApx/ItOuddd8sxxSb
	E+YWGSI96nzPWIV8jpgjNhJ3VNzWGVs7OCj684s+py+ojE/Iy8iJtAFkhvH4F54eKx2Iy9oC9ns
	VCTRULwlisjLZOP0iwwGdO5tnSrk0eSTWs5lOqZcX4W84IQ9OBA2jB/fY6DWfg6MSDg4EDJkdPU
	mcKb+v3C+LbFV
X-Received: by 2002:a05:620a:6601:b0:93e:5fbf:a41c with SMTP id af79cd13be357-93f6f7871d1mr471330285a.16.1792775622932;
        Fri, 23 Oct 2026 10:13:42 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:5fbf:a41c with SMTP id af79cd13be357-93f6f7871d1mr471325885a.16.1792775622434;
        Fri, 23 Oct 2026 10:13:42 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] ASoC: codecs: wsa884x: Fix VI sense port channel count
Date: Fri, 23 Oct 2026 18:13:15 +0100
Message-ID: <20261023171316.819857-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb95c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=nTjqRRZ-t28jT2G9NSIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: a9NZ0zpJLf9LdGmUnGG9DKblouajyt84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX08twFK9hyKVU
 wIq4RhUYyZ/r7KlIVIN/0Yr4pFMR3dpvZO1tAUfSpDiM9poTQlGukOfC8MOsWnvz3xhDXLZWY7S
 yjZyVgxDnJyHJFetqUlFBUJsTeMrTxz8xBxLIyJPhap4JxKMNUe6tRWrHh3hG+HcPKbv1e79iSE
 5ViIE6Pb9nKMRa4kyIOnX3xg2CXMRKxswxPEdnQQkU70DIHtx0i36QdZOFYf2GPH5MP/CtSm/1N
 HhH1TwhaP03ZpGZjsFv0C06TD/78+g1Z4/J7eet7kCWUDymgB96f2Bo6GG/CtYnB9HJgur9vnaU
 xvuAX8UMuy82+Wq1ovTMJWXpUW8/hQcv8F1kgTbXKUFvQdsT0O0csA7oPHHmnbhKEGTmz68tGxP
 w/gAUdpWKX79vghwrOaqy4Bb4AmvZBlDg6nP81I5EnNMy4VwMNMnSFHr/XYFab4BiU4HQPQtjn9
 QSKzlKZ0vLjWcgGY+Hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzMs0u960jiXD
 IagXJdCA+jEN/JZzGGQSLrI9/wQbqwX+M/65sFz0Bk0HSRi1bYVYU6CPZwO6m8kIECkp2UlAhJN
 kk8BOsI6dGTH+p9p0uq2N2o5gw+nqdY=
X-Proofpoint-ORIG-GUID: a9NZ0zpJLf9LdGmUnGG9DKblouajyt84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries both the voltage and the current sense data
of the speaker, but it is described with max_ch = 1 and, since commit
060fac202eb8 ("ASoC: codecs: wsa884x: Correct VI sense channel mask"),
a channel mask of 0x1, so only half of the V/I pair is transferred.

Describe the port as two channels and set the channel mask back to 0x3.

Fixes: 060fac202eb8 ("ASoC: codecs: wsa884x: Correct VI sense channel mask")
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 3c008224d32e..acf32af5aae3 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -859,7 +859,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
@@ -892,7 +892,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
-		.ch_mask = 0x1,
+		.ch_mask = 0x3,
 	},
 	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
-- 
2.47.3

