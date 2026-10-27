Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112070;
	b=5dB6eE1paO+uvkzRGI3FFt1ZwSpAicKBWuYaHftpOetp//kcNxfGp1/BggBV5zBkcw9Z
	 TtdUcqzjBx6JOesYbfUlOq3nk6JnIvIS6P43d2JX64cfF7xPfW07+bKvf1NU3LcvX4lFS
	 SqdhnNeQdQigb2RdqVmiAzrzR6Ed9TP8eW8OUammcW18iGiaJcpRN6MyJQqfgZxwKN912
	 wzwkL6ai0w1OudKN9kbB/C9mE5XnDgdRVBitBvuzRqGWM2pxqVJFAz90gRxVzuH23A/EJ
	 tN7MhNWviQhUdzGsVrskLPbGyhhB6MkU0PS8re7KeakmTlBOlb0n93dQEViyXA9cdiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rkwojZsyZMs6xnXWVxQkKwahjcOTdkxi+tMztfsICyk=;
	b=haB/GhZX57YbDpkyBcQAclLq2AcnQn6vd05vMEu7Ygb4/6cWErAR3krhpFoAVp8Q6Sh2
	 L1ZjRNs5hwFD/WlDw8J171NZ3Q1vm3vz333UXiGaP4eyWUvCoGc0QeOOWuXTYm7x7Kf7g
	 hG15/d2qzYvWUy0lMSSgjGIjkKN5lXwsyYkDycp66yIXnu958erh5upAl45w0ecgTq59y
	 W/TQCznPz+eWuzCJnyAzpP6k9i18k2BTVL1Js9ublzXyE03ovcVuukaH1K9BxIDLlzlKe
	 IugKrgZ3L77SZOdlLto+bkL79Zcc14FBnjopykpqtkcJQIY4PDwPmnkfuoKFK80RerA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LAg4eR8+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DlcUMWts;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D219260A380C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D219260A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LAg4eR8+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DlcUMWts
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo1KT3449475
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rkwojZsyZMs
	6xnXWVxQkKwahjcOTdkxi+tMztfsICyk=; b=LAg4eR8+0cibYIyjdvg3jg8V4PA
	+bVoOpUgIfetdiK1YHHJCL4cZxoyZn3W26T4iJ8SncdWfmTqItijEWwJZTWcq/50
	7UIQjtYVoD+JyeA40HtKC60qq4L8MvEdUyn1aw3+iGpn/dvE4peQnGL0m/yCZrOM
	y/YT2oxf7aeWRtk6tMsW2ycekQ4Dt9H46qlXB2a/cqwemVfashxXX5IbbQvN+Zrx
	N536uxTzuO3Ho9fz97zukFqKH2iI/lpcZ/CE/X7LUwzft4y5wl5Czne2tGRreJj1
	0Ke3MHdRkViFjvQUzLMj7+Tq4OU5I3286T8WnBTBpOvYHMt6w2U34p5WGEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91b0n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso560795285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112068; x=1793716868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkwojZsyZMs6xnXWVxQkKwahjcOTdkxi+tMztfsICyk=;
        b=DlcUMWtsOdDKru+aVo88rbI8i19D1CZEyxaONJN8v+ZuOuggrVFQgQweBbWgeAEkkb
         xtBa5ufTmjyB2UTtjehX319Mdvda/ylduJLiaEUSlDgDUfp84LO6pAesN3BOebQYz+my
         7pzIAmQL2h99s8+Ht5x+nb+lY8CfobHkZZd5allyvVZhgKbg+egH46p/fC3grnDpxcHz
         OK1Gv/6Heb217cBjoZaewV8LKvRJy8TTllgpl4PpaWAerCdi4MZIJ3RikJs9E0aEDCtH
         sGd5pbivT6QfspGtXM2R5zfdD9v5agula0rVad50/5sGIv9vVRm0o1or2lldwQH6NOey
         Lypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112068; x=1793716868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkwojZsyZMs6xnXWVxQkKwahjcOTdkxi+tMztfsICyk=;
        b=ojFXGXe1iodwhje2znS95HCz1p9l0zjNhB2n1tvdWwq/2FBpaji7SCo2n8WuGFG6LS
         C4lCdaMtffp2CTeEDbfsKlFC54q31DNhrMrd0ZND2tJtyarH6keaomTIk2c8d5RxnEei
         ZtR5jPZfNiEPKH76fo6D/X+XpUx3ldXjOYWYoeeiHXAoiMPMihWTj4zK4c4Bm4Nq59+F
         yV8PovdKCeKu2c1O0aVwA33/YfhdY6if2uaFAyh+29HGta7sS/0pLNdclRivkBOcHwyg
         MQpdHpLphlo7VXmBEE3XqvdpqAfiiVy2wfvqq+oZosFqLIlX3NZ6SMgxfj/EFCypZ8YI
         lRaw==
X-Forwarded-Encrypted: i=1; AKwUvBwzaeIGWNVvp2cfwJJIUbDeMeSP9W9ift1WptYKT20dLypf0G1KeQMzohUj7eWlUxRltWD3SvjG8cM8+wY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLordK7VHtvTZ3g9uxhyRjwF1jnW6Fq1gXYlx5K49Tamf652+FC
	r7tI0Iz70dzyvOPq14OSE9DQqFWji84QKl27VScCgaiLDOAEi3bFdjXfjP0MBBk+P0SnLvtiUfe
	57Dz1yLweBtFeqxcFS2yqqZ80szRRC9j7N0LJh16bjtGn4moZkNBHOM3XL+Apv8Gt/0A=
X-Gm-Gg: AYBFou2ZR9+Xwix9zgVEOMIC99vDaIRksNgwLZBzfVqE4xHSDUHQ3VeNziYRFfW1Gr/
	Tnw1aGCpJd5s8KmbJhHgsQIEropHG1mQEhR3QSn8+E/aoE8on2AzYZO0syVgJx8pHUq8Zeqwt9u
	PHN7LGF0zgsps+TKBxLOP153r9jbGwb5uYgDNCi46yaKQ9LUmVOynduiy/Cw0sYPRl1X0e98tpz
	/jRVbxw0IhTlDJDNAB2i4m055AuE6MLz7bHUw6hHozXMREb95CL2up488QwgzeUivHbNuHPC59V
	FRULxQdYU8Q80UI/dywyFpfCLD3FdfkNDuBoy3i1Uq3gVgAURVn1G4XpF0MWUxlFry7JrETyYNi
	QruuDNdmzrCm4mPlBaPaYVB+WWgC8aTOBX0TcQtJSLRCjefhhCJqUIDDQGw==
X-Received: by 2002:a05:620a:8702:20b0:940:f224:5a57 with SMTP id af79cd13be357-940f2245c64mr1061358785a.62.1793112067732;
        Tue, 27 Oct 2026 07:41:07 -0700 (PDT)
X-Received: by 2002:a05:620a:8702:20b0:940:f224:5a57 with SMTP id af79cd13be357-940f2245c64mr1061353985a.62.1793112066783;
        Tue, 27 Oct 2026 07:41:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm468527766b.56.2026.10.27.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:41:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 2/6] dt-bindings: mmc: Add reset-card-at-resume property
Date: Tue, 27 Oct 2026 15:40:40 +0100
Message-ID: <20261027144051.249211-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5K18MWuDg_gLP_sVVPjqdh6fQ6g8TFT3
X-Proofpoint-GUID: 5K18MWuDg_gLP_sVVPjqdh6fQ6g8TFT3
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0b804 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Q-fNiiVtAAAA:8
 a=EUspDBNiAAAA:8 a=b1zTPemSR4zJYqohF9EA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX17HZ3XHNpuPR
 7Mb25PyhdZ0PjmYPhW8DvWwLTRveyEsacQjCJ+W1fwBul0PEocdTosy15Rmzy+5S3U44A2CMDr0
 J6fq1anmTeEBoLRLyHrqm75qjEVoN32nEdHrogSMHFo7jnDHSyew2N5Gtz7goxS760wToVuZrA/
 bnADs/Q14Uns6Wt3l7Hrtywmb/4pYiED4cJ1aVVWqpKD6GLiseAkj29TbY67odRYv6s0Zi6NvEv
 SyiA84pXlV2qwkyHIYXh5/z3XPlGKNV7ouFUgWuSws12NtDCpMVdvLYnJxy2gurNqPWSdOUuPrJ
 vbBQ9MPqmgYducL1VgoxtGNnSPf/xy8asW3FGsVWqSj0ennN9d109PZIc2q2oKnOzI4SonQFpct
 A/ATzk6MioZRXmsEM3Zfsa0xNcu17J/EBifsp21aFvaHDQ2rYN8BJ3kHWqkezyjR0mZ770fYq5I
 crCUwPXAdYDkSDR2VIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXwWO5G15fFDL3
 garZcHseoP2CQrByEL/ML3icVlSUZ296Y7ssDYu9UN9JWVSkvr8ghV1kqdlFNPpAy44cD+Rcnmy
 W3h+vkiitYSQ4zb9THQ/mrQ1tcdNh+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270058

From: Kamal Dasu <kamal.dasu@broadcom.com>

On some platforms, firmware or other hardware accesses the card
during suspend/resume, before the kernel's own resume path has run,
leaving the card in a state the kernel can no longer assume it knows.
Add a flag property so such boards can tell the mmc core the card
needs to be reset before it can be used again.

This is expected to be paired with keep-power-in-suspend on boards
whose firmware needs the card to stay powered and live throughout
suspend: since the card is never power-cycled, nothing else would
force it back to a known state on resume.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 2fc8e06d5ec9..c824b95f2ae2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -303,6 +303,13 @@ properties:
     description:
       Preserves card power during a suspend/resume cycle.
 
+  reset-card-at-resume:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The HW/FW may have accessed the card during suspend/resume,
+      leaving it in an unknown state. Hence, before the card can be
+      used, it must be reset.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -371,5 +378,6 @@ patternProperties:
 dependencies:
   cd-debounce-delay-ms: [ cd-gpios ]
   fixed-emmc-driver-type: [ non-removable ]
+  reset-card-at-resume: [ keep-power-in-suspend ]
 
 additionalProperties: true
-- 
2.43.0

