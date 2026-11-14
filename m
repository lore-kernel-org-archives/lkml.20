Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645512;
	b=Kvq+AUc8JWUMOiOOV8o21H8cqE0nftdGIhXnvz1+nrzboQe5pNMhr18JHKK93wto2sgJ
	 Nr43Mj+wSeTgVR4cP3F87313b7+ubLjEXrmTFXCkIu3bXJCC35tbJQSs4nIXzjotbxftD
	 rwiz2hrv0Jbx4MBiSC44Wu4ift1hRR4AXTcqhH3tZvhfDvPNKQslf30LHoU8870Y5RqRe
	 Tm1krjDwlNA+vx/kgl/8uFPjzs325w4K5zlznQ8Yqc3thaP8pM2AaQk0zM+SsANTN7U/Y
	 aUKee0KKTTef8DwjTTvhS8oHDdDgzhTqnkNcnEVVVrnGpS6GiUJae2YuorYcT5NX3sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
	b=Bq4WTzeh7GpZPd5Nh1UDG/6YLyrLyPeAqK881vpbf5ypp1aLBXYOdMY1WFt1/n9guuL4
	 0b4ld2RDo5s6Y1Jco7BDxQt3pjA/QNr3p2opSRguwZFfkvzMecdEW87W0rT4pGbNUEqJE
	 0usb0/84BAOV7YuZC5PS3+qQ+WYbSDZNUFXre/zCOQ9sNUL3bljfD0mWSCq7JuMGNQYuR
	 7cyGLv+AXesutkJEojyIluNVUbWGdBE6tXcVnKv20d84jLPqP3EGSla/oLPaw3Ib3HTWM
	 HFmewdtCogsRzA1WW74ZJDBCZ8/0SCY3M0aUOIYMMQ0+6nQMIgU/KNr80LhCYSJnZzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7kYbs0O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZnRuLdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A9D606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A9D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7kYbs0O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZnRuLdj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE7BcNS2730048
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfm
	g63ivkF8=; b=l7kYbs0OKPtJ1adry7/YU+mlEXIUbCAOepo7ud2mCYOIvLhohU3
	9bp5Hn94SZn0+7D7pnTFYONt6duqZAJ8719PeF0jHllQUxCHdKSmdP9YXrMXf5SE
	RXaMQdIaQQLqCFgcToTev7JFOMAoYRAAwAQ+7ukCevHdEenit9PWaOAd0/+BkNvA
	Aoe8qs4EZs+3me8o0rBkIhsYC4j80jpp/xJWfk+xohJsq9iXzGRvxEHI/ZxOk55z
	q6LazgtujyTbGo2/wYfbbSjBTpDPm/hzNnUIWGrep3V28pXKViq+CXi4BOUdSPQz
	fMS5VWMlcTKnp6An+crSjwEFfUcGey/2/SQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgfjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:38:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so2456818b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794645509; x=1795250309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
        b=XZnRuLdj0B+5Ah90ToZnqSqL/2upa0xQesXn815meAswLAC2F9L6E89PNPMtXZI5Md
         ZWjN1WcLAxo5N+Sa7LuOeTymdso8L7iyNQN4i8F8aPMZWKDpr+ptkKydxgO0B1tO3/IR
         HJdwem6QU8fIqJZJpOyrXanbAGdpAMpnoUQlnCVpfDtZg4xjDwllAaFl0bpn7rkBF8Ik
         OptyPdo5+XJwyNGa22NLlbkzFr39PLVH1nxzzJJo7Pcr9k7GwiQ9BuuXkPQbJLPJL4lg
         L/nNsBuFLl5ZNe0Kho4p820z+qwUW7uRoS0dHOXXCR8E+Syh3OnGvLP0qsHch9VIRf02
         aPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645509; x=1795250309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
        b=qZep9Z+MhE8Lsq7yDymIh8SUn0iMiYx+Sf864/fv+Uq4iyF8vEy+whQZBEY13JvQr+
         XJY4XblLAsSEuF01kBI8pK9NznitcIok2Za+mky7U0IDR2qZgFkxV9YimCZZ9Grbudw1
         Udw9P/rifIrGmakydrtL76SrL0NRZG0meUYP4/BHTA46VEGYZdyuLXfuf4DU2ZcJgHQo
         UIbl7cobCqfinBlKy+3+Skfok3SMZOnIpnqRgwbz5DjtLGG5no6RefslY+Idgm43ZNE7
         v9EmUBbPLmc6yB9UgAp3dvGLjqP8eWFahq09p19xqWAyNxjCX7hQd+NoqsxMz/K7H5+7
         6pxg==
X-Forwarded-Encrypted: i=1; AL+hErFPzI4WCIoGdWaIodusQ0bA57scX63HoSQZ/r8qx6o8WeeihGxwxuNGdb3pUgR1lYiCbCr5M2+WuiqKjjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ytroL00tlAS2MgIpsCXmFu3VD9/ZFcgMcPyHptZ4lHtDHvY+G
	34uj8MZUNvLUFjorDUznsKj0EUlOXy+hMIcAtCRETZvd7AbVVi5i7CGsr6ygxAPcH2vvAvNJL4O
	7Ec0decFLlleTRJs3Vm3ZjRrn50HXbaOMzcChMi5m4gTfLLBZ7MxkjJuvODuqvzmKlDQ=
X-Gm-Gg: AYBFou2qz4cqOayG8Ssj87v1W76cKKsDCXRrIjtDBYm4PpUNGz2JmhWpT67EWxoLyf/
	cMVa4W/0kKuoroN51c/bN+csLBKQFjGNrhRGfWgXJ1bPRRJVyRhPCckbNkHVejgyQFg5ySBpTyD
	QfPsigvFpHB9mLBiA0HURj0PMlR1JIDrxLXsxq8uvtA2MZ5wY5Jq/jU2JkjclBNFNS2ft1cczqp
	9XvDtgr1GVVoQWwPvVGpTjPB0/VEuHYBrS/EoOmhmSNQFAxQWc9GQMzPLx+eXe1LnQNAS3qkntm
	HPLRcR+EkhVPUrIGmmGlT/20bvjwAX9CTgFC22aSUJnf9JO6qghScePwaLwKcQRNhKYinP6HPXL
	xjbDl3h+BC8FH0NAlgIZRXmsbP24t4MEJYIwCzPkr3snC68goHy1NwmHg5SiNTQL+Z+PiAgLZcj
	31DfLzx0cx0v9x77DHIU7BobDyKGEq+WxO94L7
X-Received: by 2002:a05:6a00:94c2:b0:8a0:7ba9:939c with SMTP id d2e1a72fcca58-8beb5fa7a5dmr4741517b3a.11.1794645509463;
        Sat, 14 Nov 2026 00:38:29 -0800 (PST)
X-Received: by 2002:a05:6a00:94c2:b0:8a0:7ba9:939c with SMTP id d2e1a72fcca58-8beb5fa7a5dmr4741509b3a.11.1794645508973;
        Sat, 14 Nov 2026 00:38:28 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a818asm1957623b3a.17.2026.11.14.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:28 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: soc-core: reset rtd->num_components after allocation
Date: Sat, 14 Nov 2026 16:38:06 +0800
Message-ID: <20261114083806.905386-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af81e06 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WB67ehynkFPZg5LeWPYA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfX8KeYJ2qzIHz2
 bVBUjR57VbWVZTatg0yxwAUSTJDprMAF4bBdQOxKc9+bLo5zAObSyiedeNA/4+UaQhskFKKrWEu
 TwKsXtBxiey+lsmoO/P9e/LH73GwHGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfX87CMgIhsqXzn
 L1OjLW+2GztImQXhPm7dP/Idu7vV7re8w72a9elFzW9b/bRHmSE11yK5nieOES/FSS6poR7M13i
 H5ILxh8tddSfC7SeTR9VEUCjeniS9/99alWo30aeF7N4UhBrhjmxSia1yV5xboWbfDW135qUpFW
 qRKrsSamUA8IOFNmfO8vXpQWWhT+8hDyZOJDjxR7RPg1wr9OI92+SuGKrig/0/5IJTkw+GOLcHZ
 jRsph62+mQrSY8QQjoqcyeEzvhzB76ChPo2atamTsLuPF4m9GbAukpwh4bsSHKWe3HgsgrQ+APK
 9sE/T82FbMvb9bDAMn6qwh3o3BZzyx8MY3rkvj3LCD/dh/w/Q7tvRxIZ08rFE1I4e8lmDgwBHYZ
 /PzaOosVOfVC9EF9ow4IRalEn8TPlMwN/0ShFixRmOnOxZzpNdltntVKqgCX2qvGDrq6KMCsaz+
 QsfkJr9x6EoLN4yxclw==
X-Proofpoint-GUID: 2CSaZEXiXGz5dv3jAVOsdGHIAJRawy7P
X-Proofpoint-ORIG-GUID: 2CSaZEXiXGz5dv3jAVOsdGHIAJRawy7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140034

Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family"), the rtd is allocated with
devm_kzalloc_flex(). On compilers supporting __builtin_counted_by_ref()
(GCC >= 15, Clang >= 19), __alloc_flex() initializes the __counted_by()
counter of the flexible array to the allocated count. As components[]
is annotated with __counted_by(num_components), rtd->num_components now
starts at num_cpus + num_codecs + num_platforms instead of 0.

snd_soc_rtd_add_component() however fills components[] incrementally,
assuming num_components starts from 0. With the counter pre-set, the
real components are stored past the first N slots, leaving
components[0..N-1] NULL. for_each_rtd_components() stops at the first
NULL entry, so no DAI link component is ever probed on the card.

On Qualcomm Nord RRD board, this shows up as the sound card failing to
bind, as neither the q6apm topology nor the codec widgets get created:

  snd-sc8280xp sound: ASoC: Failed to add route VOUT1(*) -> LineOut INL

The same kernel built with GCC 14 works fine, as __flex_counter() is a
no-op there.

Reset num_components to 0 right after allocation, so that the array is
filled from index 0 regardless of the compiler.

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 470c233d97c8..5aab81547157 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -368,6 +368,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		return NULL;
 	}
 
+	/*
+	 * devm_kzalloc_flex() may initialize num_components to the allocated
+	 * count, but components[] is filled incrementally by
+	 * snd_soc_rtd_add_component(), so start from zero.
+	 */
+	rtd->num_components = 0;
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
 	for_each_pcm_streams(stream) {
-- 
2.43.0

