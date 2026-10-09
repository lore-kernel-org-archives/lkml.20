Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945494BB806
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551599; cv=none; b=rW2+SiWhxWudy+ZKNUiUwYDNHhrnI2pxN7GKO2GhpiTV1Df0ps8Ambtr232q/eptFOH5cOtOvKamejlHJgqzzEo9PpiSmwAA7icQ7Q+p7Pg+csAcjLRphOsoPq25LCfb99wQZWbRCZNvTZdYyV9TKGoIQhMW5EAwdqEklEq/y9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551599; c=relaxed/simple;
	bh=dGoqnN6KIe5hbkYTrJjeiwkSgDmk4QM/8FHs0528jZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCIffI2UH2id2Ri7UIzIqWL2knngAfwCr/QSJnx6mjb7I5JtlWrGn0kPX1ghAuirQjsRJwOLZESBY7EVr8v0H68kgScDYM523CDfHDkxOyFEAGhZaUao/r/G+qqAYv+RDTqglxVhFqaM3vBQUBrd2Kd5DAD6lT1sv7fORGiEVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfYRKKso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFxMBtKm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfYRKKso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFxMBtKm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KMhi2369650
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2vNY8QGJlSgQtrYgDdBjy/KCqIyEqj/mv2W+BUYgD0=; b=SfYRKKsoq74mk2Je
	lcCfeLC/PpHRiBmCN51Eg2bFhDcabEaoZL010Q/7JyxW1/jTfSueJY01zebTMG8k
	hjiTobLQhh89tp13cf8BR713gH25GJEMpjc8wXCGyLcGONXsedWJ8U2Tz6UPlmx/
	SAlrTu1jUOss/0obCuq3gNlAw08o0FTbyMEaxoAiCtmHCjkk9yZyljpMcOcEvy9n
	Uwzs3q/VqzMbthwtb+THJGIez789F1NaHOgXEoX5Pxf6Q69H68j+lQkqkNJKiKu1
	w4awvv0Cs8wNL5RN+DL/soKDAw3YPLJdhOmHMAo0eM/0zf1dCEK+AsDESia5el7y
	bWphaA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwbnt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:13:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so6885425a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551597; x=1792156397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2vNY8QGJlSgQtrYgDdBjy/KCqIyEqj/mv2W+BUYgD0=;
        b=AFxMBtKmyVfVIHL6Ps3LKzak/LA3Fo64L15tqBaTZfKckC/DzKJ0p4NwhoVJeSCtSV
         mGLoHZYdFwNCju2B+3lqvl0RC9ia7XiWjgMD6Oy6Wq27SOC8dmxtIqmZbHjXgrOEuwjO
         sLiwUVaYRWmb6UzvZ6ejT59ZI7foNvd6utB9tCw156FbaJhZpls0YpOlW35WBapCvagU
         gREeG+Eb6h2mqEsL+T4nQjld2bAKd1hZBrAblpHSVIBQE8ZTZQOnm4gXVXx7LRuJjatG
         Squmgjhf6TEiJUzJcXYssCXI3O4bFwK7e+w730ca/gR65lTwY7TPKOroNpz3zKlJPr4Q
         cWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551597; x=1792156397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2vNY8QGJlSgQtrYgDdBjy/KCqIyEqj/mv2W+BUYgD0=;
        b=Gkpwt6/zEITlK3YXtMgwpDEmZEfDEOP+4uQiVMJPaqYC+fRyR07KD7f51j7g4OJjGF
         ba7xI1kz0y9KZ+G5rY0h8nbry0iLD7X5YxZ2hBPXUJtoIX4Q9yOzBo6txLbC2ymSmz/S
         irIKbVZ+oFcDsXY0HoeXmT0E0kVatHtauETy0Z57DDof+nL5vQUX5QGUoL0mrVsIbIJN
         M77FkHVb5EPNq8MN2V85IMpUETGx/f+kGdO5zeVYp50bJ3imAinm8NqbZ8CEJzmywopt
         UKb9nwkz7ojT0TKl21z49tWyzJLPoylfQpVfC6KUTmCmhxkA2I7Ye+XHAf6/MIur29u/
         L+5w==
X-Forwarded-Encrypted: i=1; AKwUvBxRbS4WRrA2nBv/NRl5U7Ze9BYci8flkL5b76XXDdVs/EJGV3AWIEw8YxcNgAWfixyuRgbjfFmMRX493xE=@vger.kernel.org
X-Gm-Message-State: AFuF++lh5/aEr23NeIKiSg4iIBndY0SeHG6WX1UgVm3Ztct3tqSKALEI
	ogfbSmwEv93BttvAELvMzCxHWL68sB59xDjsLpx44pst9c3MV4iBjtpOJLxeqz1P88VlqHH0tFI
	JVB0JZv5DEfbvHOAdIP5WnpZE4nLTAThrNeJGFYTi4DpttIbm+2zBsT3WBM9dO20ypVw=
X-Gm-Gg: AYBFou1yXcFDMSt92PdMwsXzJFgkwSbTpffSrqz/eu4mEOoFS4WYn5dXYbw7L/UvaAn
	WXcl1iV119WuEQz/nSS9e+ojajlhIK965TN/PdlsSbG387nTgGUvVEr8I7oBmBtXM3PHrGsQj6z
	YDVqtPFRdPq4Fi4qFhW2p2W9koaOGV/2fvGWlFT+Yngvn19SgIZxu4Y3uJQzjasux3LHX+DKZbO
	FkJG9KvhsXEdIn/gsaAQLXttYyaafi4Qzl6ysAIvdbsRCJirSMgWQfVlZvNUhn/S5Gn3NAdhJhE
	YVsJxFgZdLHNTrosYqZliI0NdRnKGv66GXtCpTbnEkxjrdv+4pjUlWq3xsdUiDYiJC4nv2UKA+C
	93Cr6pAddSXBaqDZcLBnepQYOCyRFP43reuLA
X-Received: by 2002:a05:6a20:2451:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e16bf36b7amr1604017637.71.1791551597156;
        Fri, 09 Oct 2026 06:13:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:2451:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e16bf36b7amr1603974637.71.1791551596530;
        Fri, 09 Oct 2026 06:13:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:47 +0530
Subject: [PATCH v3 1/7] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-1-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=1193;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dGoqnN6KIe5hbkYTrJjeiwkSgDmk4QM/8FHs0528jZY=;
 b=mwJC2Wle5y9DraET8yU0UbFOoQINCyNlgzcL3XvjyW25clnF/BqnDm5lD3K/t9H3hMBfhKPnK
 nD9lsvUFDk+A5M7Lrgk4cnZB7lz5gz0L/a/NR9N6AWKJ3oBMQyhVBrm
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX7ameb2o6wz/L
 02r3yHI3I1+g0mUTWcwa6eLPuCPeM3aEBaS2G+l47l5jZ3bpuxpv7I7UZZpjJ5gT+z8QLvRncvJ
 o0IYRSjPCfcXXK959G7pM/T3oYXeaqe8HMoN43aQACSeMJ7YfFPf3sm7npLMxMY+Hn5x8IsTmS1
 9SsDHsHbZK9J1eklI37XSX8pppam/KJ1ZJN6zQt4mScsIg0x9JlkKaSjL2WPo4i1z3wqJDzTZWY
 CbGhXUiWMXk4a6fdebm0X1QiaXrHHA8Q5sQ/Ze6lNICmFA7cZr5tr7SUGKpK/t15+ugsDr+08h4
 /pOqGKNeyajQ6xl62spHysuUxNxAJLiF88lfiAbPtN1L/rML6V9aEQZdmba7xT9EsAs9MP96az+
 zUN2DR5+9eJyQGelD6NI3pCevS8JQNKdMrwO9v0mwTAw3XppqHDvZspDUsTvrdrhGX1tPwyYbyA
 howA9ki0auuZvFBKZlQ==
X-Proofpoint-GUID: 2MjQZ5s1ETivx-KB1Hm_GyjuSiaErUm9
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8e86d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=T4irZKxI8lZzJthKl4MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX5iL90SgKKxdE
 AaqVX8PbNx2QBBmcFDx59R7+bEL8tMYFK+J6UWjiAth6Ov1ODofWHwMah7r4YLMG9knjG+ZYMDI
 jqjHipPZmEMiwQAmDrR38+IKXO6mbn8=
X-Proofpoint-ORIG-GUID: 2MjQZ5s1ETivx-KB1Hm_GyjuSiaErUm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090052

The PCM1681 can use an external system clock supplied on the SCK input
pin. Platforms that provide this clock need a way to describe the clock
connection in Device Tree.

Document the optional 'clocks' and 'clock-names' properties and define
the clock name as "sck" to represent the external system clock source.

This allows boards using an externally supplied SCK clock to accurately
describe the hardware configuration.

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 1f0e6787a..1b3803518 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -21,6 +21,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: System clock (SCK)
+
+  clock-names:
+    const: sck
+
   "#sound-dai-cells":
     const: 0
 

-- 
2.34.1

