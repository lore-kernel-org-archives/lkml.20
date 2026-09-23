Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A394071E9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152825; cv=none; b=YhS6cKXv8fAkOUz/s6Wd6BRwJvjolHjeCpVNdCe/Du3dxiUSw2Srhr6uccMkLIrYkz8ZZx0vKWK9u5DPqeeUzJpPziZUX/SpvXW8QX2MP4QYJOfipx5ozNZdC1r/15n92lNU/lywpZ/7m1oU3UFqX3amNbJFB5ilDQ9MzIjBwHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152825; c=relaxed/simple;
	bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpsDTubyPYxNHGjQkfDV1Zt277Zj376688UxLRYasNJ0tfuZFUMSzCaitZsHwBh3C8c1X50edDG4Q1WMQ1PXF+aQ4yFGx2btqp52ORXWxSuy7AIkiIQIKBUQo46sGcl6J4SJN+h6v7OiRRAGpJED4uXY7SjZDElZMJkEun6fy4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtcMmpo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHbpJJES; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtcMmpo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHbpJJES"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JQuT3701090
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=; b=YtcMmpo60xktOfVa
	5mQhINctQVE8nlltFUfINfnW064drKr8RIoYmnWHU+gviCv0D4gRNJ5EtiC1wedq
	0lvEJqtQ1nRYS7ZVV4G/tlE9F2xZdVg77oVW9MPuNv2qimpfNdEtfoFMcdw0z9QQ
	c3V/2ZFqnEQZ7t4NFqVYRX15SObz4g8jyJmRw2Q92s87JqIkrRU1Kbc6Ru/OHe3j
	MBEtb1DiCOhQTMou/fNeZc13nMMN4B5Ne2w6sJvA0QLq/lZdysoHW5Fa0Kp43NaN
	In5WySVIwztYi4ewBdwJXlODVqUCRujVqk4jfghUKhHav06dyxXRHMYObNjmeu7m
	DX+uEA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428srp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-333543ac378so765438eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152813; x=1790757613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=JHbpJJES5bVaAAYumIl4asYBD9aROedx+lGf9qvtkmqPn0IA9Omv6ClwZbm3y73dhp
         EVV/uf29ljpL1RiMkNoolKhikUYuKe8M5WyiNx4LsRYJzEMOqCBRpuo8DVSX5JK0sjKz
         McLIpIK/Fz3gSpuGc/kcrH9wKshpnEiApu5HrhXcdgWHbgeJw0UeM7i7LT/p/Q9pjhYF
         2ZeWh7umPlGqB5IRPnfvXZj3ZKDH5961PX+5Ao70n5zLAgdh7+3FX0euIzbtJR7FFLDn
         DAwqWktsLmbLmDe8+QsQzLr0K11bTHoeF88BYty4rFNkMXgmxNVSqXiIj+ylxuPiNX7c
         gKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152813; x=1790757613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=VFfTUcbaK69A42QxE91bamAmbXywZkzfCcj2Fh12e6IeaxtqEp0zJ1p6m2KrK6dqCN
         XXruUnfTdfWCbwuiqpdtEnBQGgvrkWlH5JCvunbwxf+IdzAXGu+bCeSTEgPeZcZKvNbt
         40QbBUWuccpTeaQ7ClFHQUHme582YKvFu/cEILadjMc3dvikkBfH6QNWxv0doDFrYqoV
         9fXocdvzsGE1tq2bz5VH/SYEEdatnPsK7Cl60wY6bwopl1bBy8NwzMVmKX3/ID0Gip9B
         kfLaq0yq3lhXnz0bMKxtayVDcV0K8+xWeP2IA6ArSeasixwvPIznWNGomKLHPdOjOEoW
         1kWw==
X-Forwarded-Encrypted: i=1; AKwUvBx5MfLaCIKjwiCrwI8B3CVuHZMLP64akppjiIKoRuhmfAeagcOLBi+9PXpu30MSJFSbQj0wrzpF7e1bBDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lscLxbB5Lr+QsriOwQ7WHtAEo1BBozXfelZ7V+qXHtKOGv395S
	0xQ8fNp7NR53EnhcvCGKkX5nMUQfcF9wQo7yixSV5FqAyQx155WJKW1VjdQrW4JPuFW6vkm1g7h
	2eJY9vqIxMR8IVd+zm2c5mnthSqrHEO6Wtw355dRLjAClrQvimEtFksGbztOMLb/bSnN1vGKzd4
	c=
X-Gm-Gg: AYBFou3ZIhXkRlvDvl7BU7eXyGjJjsMtMlAgw8AaCbwEkg+dvseREFE7WkAd950FBzT
	ON8BCxGnOoxzwJBQ7zYoZSLyAsGCglmZD0LuH9uqCyFOUjUnDL13ov8hLUwtR+6VcQj+Ri5qt9/
	d8RKDFhMNsdDQjCIIK9ULFu3EwYHLtziFybg2gnTCLQaRZHm9LEo0JZ/aIeqHg9SFFmoeyxqG3Y
	BR0nXYTe0U2SzqKojwl8Zobse4Sa5CDLnJEt0mUECizNTtv+JjStyGSoehvKcBzq3meyp7oTlTb
	mROpDiCyh09vCSsWmE1uuhfpFLokB/UiyJndBXAfN+SLbiCdYELBMjDrhmSo3TZwdDtj+QVQyDz
	82udgz45VzbQgLG8R4nCpFoJG+g2NS/qi
X-Received: by 2002:a05:693c:87c3:20b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-33ea647e619mr1704602eec.27.1790152813183;
        Wed, 23 Sep 2026 01:40:13 -0700 (PDT)
X-Received: by 2002:a05:693c:87c3:20b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-33ea647e619mr1704574eec.27.1790152812628;
        Wed, 23 Sep 2026 01:40:12 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:40:12 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:09:35 +0530
Subject: [PATCH v5 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=1160;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
 b=e0MgaiZWsc2oUknzB47/o7/O9yahDPbB/eRXHGFyGweqtgG5dEQKiMCoL6vwICumPCsRUFTil
 krWQU6b6EpwBpTcLD+l0jsxvh2hMEnmvNvfNnKFQlbB1YCmBV1FNbCV
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3906d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ZxMUfhUp-ytzb8bTq-TOmfYjYdQJZM0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX+76IzaNcbASA
 wi2wlE+fid0zWsmg2iGAQWK9rUTVos/bmDQIgypsl8hvFhXfT3Y/Fsk5qrfcUqvX4BDYmj9TI1H
 LI93j+yz0p3smkFPaqBifO1QztNpAqF7Yz7uqSO6kXJLxvDAarq5Sc9kt/Z3h2vx2JZA5k8eiLJ
 vr/jbNBokxdoV7IEuU0xzJRD5YiBUIoXBxzmW2SeB2WZdaEipNcVRT/6Z8CQNejS5q42lZKbUMM
 Pm/I1+m0hFJKRykIyoZle33KS0BKy/gP0DYrmefHzEbSL3avYsiePL3pkLrbUxMeVtqviGcECuu
 vJK7IU1G7MNOEIUPAW482uNqK1PlPdLfvk+H2JNhbJOSP0Md4tSea4qv3amc6fnRR5aV+T/K4/h
 /3vIDX62nTW4cUOynJ8iA9KPN6D1xwwnXf/QKdVVO5q9kHQ4NEixZ8031pbKGuWnWB44MWQ5ePI
 BD7cpAp3jOGsx3hO5AA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX/lYLz0mzyG1S
 7K9UmubRJfQC+VjJ6swTXuvSBxtOb0qcT8sq5x1jyX+Nl8zf5hyBRTeddEEaXQdyo0DCAIGRSPa
 ktXDGOFmNM5Jj5kJvLy4mFlWCFT0ChI=
X-Proofpoint-GUID: ZxMUfhUp-ytzb8bTq-TOmfYjYdQJZM0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230034

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

