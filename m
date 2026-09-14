Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB531AAA3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353624; cv=none; b=rBwS2f0oo3Rlb29e4mTECBBXeyzfoXMbbp5n9LiX9zIpNnWjecqQSNJK6rwjIEK0PyTe39Pe58vr0pm0mAPS7M7hsnwnBwnJ66HfrdZAv+en2EACYmlJ09xH3a3mu1va0i1fSOa1aTnSc8BxeE8w2r1VAWvmN9HR9GObcOOzWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353624; c=relaxed/simple;
	bh=jq4kTlpV3uRrIiDZcZ7ot9EzjLJSv6OEC1hEhMJHiZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXonncxeTPWSHg9Ew9LMPv1GsC3KMUglaZOjdK1y/j1p13MOTAbV4IcsvONCiW4wKn+03ONgIV4KjHyHDfzivhZFMBCLwaV/m4mVGNbPDNCHRU7CA+y9bNkE3SUEBQQiH4GfG3koipFkHjcR5RpYZJagI/jrR9cmpaw77ECji9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3J5ncMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm1r9fuT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3J5ncMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm1r9fuT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06UdF3717987
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTj
	T/YfBGa0=; b=T3J5ncMouHJ2hSSaJjwzn/XLHKNfj5LjULKzGTYIa7CtzABj2LR
	yjqr8LMrpeSTqr8ccpMdM6mcLCAtn/6FKouT+OKQCfCPATRrui5Ito7hk8IgjWFj
	rnMEA6rlgoRSS0vtJgkqlORvVIZE66tTDIvrEaNaImbIiPjE/X8H4HMFpp6VA2DV
	BGKxgj6+wRHj/Sib3jz03T6QfKNXFlXk3CPJ8YbWTDywvqSsq1IVs9Md+ZTH5z1V
	vfEzEQspKl9Kj29m08JXFl3H1J++iFi18AfHi21DuYtfzkfOpbd1P0ibvTG50TPC
	oKefbgPPz16OQ1pZvGwCaMGXQJadruoVpkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmqjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so34370375ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353620; x=1789958420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTjT/YfBGa0=;
        b=cm1r9fuTcb0K2ayqzG1u3FW9fHiM4/Fwjew4amyv1qyW7hb0u5NtZLAuhL+QK9TwBZ
         2ui9a83Oa21TDk27btV5J3juusTWhRkxMIHG/vlPzbBMFGEm1B//qaEIurupUFP8Y/hi
         QarMsf5ahRHPJw0uXmz2ByFe0tX1v8EFeVt/5QKyH8MdUxpdIjTm1S7We5umWNqWQhNO
         LkdWpVq4npMnksIdc82eIrRIeGtR5xpEBdlwigryvl/KMMh2wEESc44xUA8Vk1i0quPH
         9Xu5FvljG6yUfLdz9iBDTGIy2uhJnkgS4oE7F/xlU7fjanWxGgXlUw4tXtw1hHa6TZ3o
         0vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353620; x=1789958420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTjT/YfBGa0=;
        b=biSxUQeACuCvnvnDkyQXFcDOiYOS33xSajXCjW0bcqEyb/rxfEaqL9YNCy4OLeDrIy
         8imtSMQOGEFn1rrv19GILBqTqLlXsb/ZrtPWEt0uis0IGdD/l7rYWJoXiL0VEjzK3Q5D
         u26Q75m3JVANJmvxed2rQ5wW3BQDK2AMrMKvd8hE0xB0JX5AOk/MdS1hGqh4gyYeyQkY
         fXAPfYju/jHu0BjRek2NHFFpdzZiOAtDjhbYYnEeeYBYiWfPjtNy6/nFW6cpMG2gOAcA
         Jpmn3NM9Dqf5ENRraCdTSFmPIXgqF21N1brJRqoN1BtNJ1rdnT0+hTAJB16nFi+NW3BT
         4jng==
X-Forwarded-Encrypted: i=1; AKwUvBwdVePKXdDnUOdG+3M2wVBB3L2TIitkI/r6dml+hzA7ifM/vr5IKD5swcqGiFkt32jmAP3k2mKs8DhZbnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mxHA70QY2nOFipwRqUD3kACfyhJMW/a28fn89b43j/Ue7GYrHg
	bolhZz8HyKU3vgVbbBjSjxg/b7ent/aPRQNAwXQv2HpYgKv5O+f59Rx5+RsBs7fC3jGXXAQCiTj
	GmWh2a8AO7YAkxC+q8ua/gg8LLmf5LGJdYsuy0jKCIVV7egTcD5b7yumUbj52KcKpXZ8=
X-Gm-Gg: AYBFou02UbqgEIE9+j41vfYsaD7ndzFMkTvw3nv6TYauqCKHMHqB7LysvmB8WgIx3zu
	AVNChpcH88cWIun8P898I9ZkcB7nqlrbmUHQpINAWd9eVr0k9rfOwKkdty0eKYDAuKLQU7ZAA5O
	yYac2W32tjbrErJzXEuKjBBjCw5iMpNSz3arSK35M8Ym30qsAqrBLem+gZRD8bpamAxsP7UpYhj
	J0isMu9POCf/9Cs4E8Z/94VHNcZYQ/zSKuk3XQ6gdws4vfWUYegJm1ykEAUpK0rmqZiooV9yDqN
	rsU3rQdUV86j4MdeNd72drm0QpvC+tkO3LmllRiDm1qffk5u967jn3k0/JCgFo66+43Ynq7rUdH
	0tBaZyfCXKRnZ6AXvgjqPxXdH+fsUGdvaVu/D3HFOHG4Gk14+DN2sYHrtKrN3
X-Received: by 2002:a17:90b:1f86:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39debdfb22cmr1677064a91.0.1789353620366;
        Sun, 13 Sep 2026 19:40:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1f86:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39debdfb22cmr1677007a91.0.1789353619937;
        Sun, 13 Sep 2026 19:40:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add audio support for Nord platform
Date: Mon, 14 Sep 2026 10:40:00 +0800
Message-ID: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ztFpoqzauTzFbcbDg_zitSkdxwqi5-I3
X-Proofpoint-ORIG-GUID: ztFpoqzauTzFbcbDg_zitSkdxwqi5-I3
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa75e95 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rXtzl5NixRRfy2LdUdoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX4q6I3M5+BTy9
 T9VUgdlLDhMIjICoEZHxB2pkE6Ht/Ja49rWPIjaDjaGQfmzRs+917F4bGVfvd+XohksUR7TtwDV
 N3xDGy/ZXVfTox5ad+nUflZgSTaME4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX6hcIkNgorhqo
 JB7aCJgLitpkCct/gi0mTA7VllvzkgGpx8qGu4lx2suMd10JB9uu9zL0FE6tzj0OWswhr0/xEr3
 UsLEpPgkbxCvjMSy93eTinLash99FkFWyoY8ZEjVv1sC+slPoWpEPQEXdmfNUo21tkZ5ado/p/M
 QJVLG8YNGGk2u6nKqK/1adVGc1+wSl3dXAP7ZK+NASWIH/iBzFRSsH1cubIn3jto5kLlr5O8omi
 QaVbNRuQ0HWrAig8w7Cj4MK+75cY3jDkEvNX9WH4N+qRJpQ4BOhfKAbZ3z2jSLMMVAel+EXINxN
 lcBNbBUcPIIKcEdYo/pNaPZgVgjuwH4qRtfhw13r72zMziOEjP4axwWuyRBkpBDB4nCqfgoLzAB
 TMUJdpneYGI+/9mO4DhDWicbW0LTd2rauWO65/+NwaERqAxMKbKPXiQYRFEGxRxa7F09DhbKWcz
 MUzRceT4BkMbEHaRQBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035

This series enables audio playback and capture on the Nord RRD and
Nord Ride SX (nord-ride-embedded) boards.

The first patch adds the GPR node with the APM and PRM services to the
Nord SoC DTSI, which the Q6APM audio stack needs to talk to the ADSP.
The remaining two patches add the board-level pieces: a sound card with
a PCM1681 playback link and an ADAU1979 capture link, both over
Tertiary MI2S, the codec nodes on I2C18, and the TCA6408 I/O expander
whose hogged outputs gate the DAC.

Dependencies:
- ASoC : https://lore.kernel.org/all/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260911142040.100263-1-shengchao.guo@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-rrd: Add sound support
  arm64: dts: qcom: nord-ride-embedded: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 +++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 112 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 112 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  36 ++++++
 4 files changed, 290 insertions(+)

-- 
2.43.0

