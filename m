Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924598;
	b=G7APWjMeoeMYcgKf08sNV9cy6LAIrwb6Gp9hK/ZRxh+ZMQD1vaL86yRyOugwBa3+wVcl
	 4vdnhig6BPuWlXynGCJA216qbPrEspvPQkrr/rPPU/5xopyfJjIhe7jCoBA7uxpH3z4DC
	 S8pD3tzCewH5980YKbTew0RsbblaUsK17wevbcKjh14NQPk7h6KEaSOAEKsULkhFjSTHD
	 SA8Y69Z8/Qufd5DOfAVUM7fTxe/rJf+3tZTQRSlg3mat6EiXcwk2m7Ov+NXc1FuxBr5AK
	 fbYCdRKSqcVCJvVJ7cX6hxTAkBKuQXXff0rYBSYrtEH2vtpxQvlO3gbhncUVZg77Wsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
	b=MV64yyX2VET4NHABYAp9iVeahsGSbN+NyMoP79R8P7gvByDbhN3G/pSOnY3GdSZjClG4
	 HVzEC9DjcX0Gp4YxUcLChMgKeV3J8eG2Kdq6rpk+brCJhnCtVqocXPOFIh43IT/e++4xI
	 z/WUJw4G6VM11VNSi17hU+ksNIivCYa+5FTDbT31p/iJFu3B3KbtDZ+bRc9FerVBg56Zz
	 3Y4oop/SUJo2KkaMGAdPP8ytR9hp3B26G1eqsDnOiDdwCAZ+Hr2zH5kMVlNpgX0wjni2b
	 bqN8vRq4paIlrODq8G2hy2prXi6gtd8UQWLf5EykfGQlcvFIz6Vlr3ANewszxeM/13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aZTZmH/g";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N+Ik/OZE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C601E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C601E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZTZmH/g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+Ik/OZE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1jno199498
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=if+Q2iufyNdZSoNqm8U2yc
	VdXqkw9sljJMepLaLmTxQ=; b=aZTZmH/gtGpTFuLwt0vOa+5UdMpeAg4N627XOO
	aYUMFp8a8XpavTRN487hwbVIExzpES+M+pmkDfUcWmh7V19c9mS5cyoWlbYZKug4
	/wPRHny4t/Y/H2naH46k1PMa57yj5DJbLUKns3ggU0tfWq6369KImn3kr7aRi05v
	0+U6i4w055SSH93NXUzU4ZJwelTX3GibLQ/xGNenlGRSWUYc5iGpdGRb1e1V5WXr
	AyK7vSFAzGVnpoQAdsRLl28WbLP7653IDKTSXQrTOQUSPy2osIGg2LAiudM3wqWF
	5DgK5YOaiSiCZLbm5VpQEk0JAbxYpo6wI5ZpCOnnar7OiOgA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geha3ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:09:56 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8615cc92488so4081529a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794924596; x=1795529396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
        b=N+Ik/OZEdvOniVrOcFxNyWdfAZptcK8uS5OXhyr8tz1Xnl7qvNH7AIBP71Ay2oSuOz
         37mNrtcEfdekkFIJA7SU/IIxksDS1JWkQAu4rdfi8V+OG95Rhctn3t6OsBJtSkN1W48R
         YMfLia7vYBTvle7RmxQjDvKYRJyuRjTUKtQP5T5rU+bYYN44Y6R62VtR9MVVvGG/K5LF
         LnXEFBHCr4lqOXgjxqHoNX9uPPucbm0WyDC5ofRA3YLG71CkcNZPL/lRqVeZvi+6rgkf
         LduZc+LBEpjRewkmxGz7jYgcl464qhfkwaPoOfKjjRhTsb7xN44XLBGF2R+uH7vfmgth
         foFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924596; x=1795529396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
        b=rIAjPA5hcfzSQfUmeEynaVWaKGE8oLPBiAfr1URrwEYTs6I22NRO6B8Q4gOUAght7k
         6k6KjFcg0PwnTLwzG2V6mb5GVgXf/xJsvFW30q8VqKK0eY7LaB77c2d9kG5UE8FzyKF3
         x+TdplukqweEbjilpsNuyoBMhtjWPSWq+sx9ssPkN9SAt8v5CnWb8sEfqzg0LRtt2XLG
         /losv/jIYbAs8N6G/Di05aJ5ri2eBmX5dOeIbfBI77ZxUOwleYkaCH/MXulNDHuYXrsT
         VSLEgAAztX5ZeP9PFPMTk7xq2/tzV1G7ICALytKgTy5VDYHUfGNqXPEm47mi+5gg3KpO
         /nyw==
X-Forwarded-Encrypted: i=1; AL+hErHMK21L8CzhOu8cTOMajp4PFfq1itqo9AtfOLX8Jzf73Ayd1p+zjws5D8UZtM7FGUM9VDQQDSErY4fBvyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D49/9xFVx/NrAdCwRXc+Wzpy85Ng1qU97SzJyRYPG7Gqcy29q
	Hlh+blQfJbq/R07/eRnVyID6gL+8NymRvFeR+rW9tK0H7oPS3JGJ5e3gPDhQG4KlAqJjy9poDSc
	rFslOi2c9znCdAyNKj4/V0Q3BAmUPvJf4j5sxxoskjev182Wv/RykmFt04gKMiuHETW/QRwB3+w
	Y=
X-Gm-Gg: AYBFou1+tuEQWkETyARtWdp7Lv28jq+1F2R51Suomb/Q/pi3EXicybjJg8oaadvYZA2
	qpENBYiE1qaGcOsh7egh3V1cXf7dLU93BlxWzN4WU3LM6DALmczivWMNgWkHpvzcN3vvLoWHK67
	romnxVOLAmi4xUmDMfVNWhXXguvGeXFahd2cSJLCJfbMqX+g3RNtes2iKKdUsJZprZPr/PkCanY
	1c0sN+Js7iXYi2FM2Kb84NcLyIOJDw6Tz58STASPiwX/AEdt9ieUCCKxX/tBSMZx0d7sRFPw9gQ
	ir2Pb3OynM8MtXT73zmhTq8g4pb9aOOnjf9+gYAEzCechtYkTiD+ZaSs/RPBm6pKiqbbuXQ2Sfr
	kBBXMKlS/+g0lRfEkLvpxC026B30TRE3Qoyko+hiiewdUDdkmktx/sGvyAuFnt9ZvQFFLlL+LmT
	mM9Q==
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr13341465a34.16.1794924595808;
        Tue, 17 Nov 2026 06:09:55 -0800 (PST)
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr13341423a34.16.1794924595370;
        Tue, 17 Nov 2026 06:09:55 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862d68aac75sm3233775a34.23.2026.11.17.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:09:54 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: typec: ucsi_ccg: Add CC orientation-gpios
 support
Date: Tue, 17 Nov 2026 19:39:46 +0530
Message-Id: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtg/GoC/4WNQQqDMBBFryKzbiSJqNBV71FcpJNRB6qpSZQW8
 e6deoEu/sAbeP/vkCgyJbgWO0TaOHGYBeylABzdPJBiLwxW28YY06oVEyvEQaKCqHN2WRyFviJ
 rDfmmqkHsV6Se32fzvRMeOeUQP+fQZn7f/52bUVo53T90bbHt0d+WzOWyuieGaSrlQHccxxe5m
 cy2xQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: Qyr9GgS4KN7ITNdj-580bPhrlOWC3csD
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc6034 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OciRnzNh6Tf4It2_ZlUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: Qyr9GgS4KN7ITNdj-580bPhrlOWC3csD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX13b7kYw8PrdY
 cFLkMFHFcbte3avAdFMnsl2uGu1kUsu3IqiPqij28CSjbMVCe4VKXt4ynNd8BVnvu36uMjfPcz9
 ioII3Z7wj9PmYr4j64YZogO7A+4tWdw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfXw5IZaqQ51pMB
 wF9tUsy33oImECbbBR10nmTabT/yZjys0Pcr35Swl+jWs2zBJGG1iB3LVgR1CsN35Y1VkaNRn/a
 Z5J9Ye1NC0uCnZMR0XDIBdEnfRqUyFepstIJxGLnT2EYLxvUGuHkP3zBnc0YBL0X0YWf0wYCI6B
 1ix75CMNq2NqzPQBLqNPGeAizZw8eR1g7FKxJqy7JvI+lkjjiObdTWmfZpbVw8/tYFk73kfex0f
 w6yooI26jR+4qpzLZSI6JWx4xXIWAay8rNZYY+l3AMJeoTeBcHBQljChJkFEMWTR7bJt9ukIaq4
 CMeTp0F9Se3MBoOVGZW8NoTs9fjtIPgRHSTeygusORsdoMF1wSyhAaosttAVfOksaSh1wGVOxyA
 /dAH0Hj3fXdEG1f9HZINYgiXiQk2YyAUe4TKYdX4rbRMe2YN4h9ayuo1LHTPnGkmZZtkRBJwOga
 7XcHSsA9os5VTkJu4jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170056

The CCGx Type-C PD controller has no HPI register exposing CC
polarity, so UCSI status alone cannot tell the typec class which way
a connector is plugged in. This series adds an optional
orientation-gpios property so boards that wire a board-level
CC-orientation sense line to the connector can still report
orientation through typec_set_orientation().

Patch 1 documents the new orientation-gpios property on
cypress,cypd4226.yaml, ordered by connector number (an entry may be
left as <0> for connectors with no sense line).

Patch 2 wires it up in ucsi_ccg: acquire an optional GPIO per
connector in probe(), indexed by the connector's reg property, and
use it from new update_connector/connector_status UCSI ops to set
typec_cap.orientation_aware and drive typec_set_orientation().

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
Changes in v2:
- Correct sender/author identity to akash.kumar@oss.qualcomm.com
  (no functional changes)
- Link to v1: https://lore.kernel.org/r/20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com

---
Akash Kumar (2):
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c                  | 76 +++++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)
---
base-commit: 2c46a57079874df3a60770278f08404f5d0f782d
change-id: 20261117-ucsi-ccg-cc-orientation-cd3e221ed635

Best regards,
-- 
Akash Kumar <akakum@qti.qualcomm.com>

