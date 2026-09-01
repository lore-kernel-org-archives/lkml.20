Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5AC442B1C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234822; cv=none; b=jDF4PLEjGt/Ir3gwtXLA8v0SrAypuf2FL55PneG4cYHrTW0g6GNap2IUXrAAD8Rzv8uwN2CqfFa7xLRJ6vkRhYSmQEhZ1wy+82h4q27SO0T18Uh79mbWX9yHavvBQtkCVUHyEJCeBJc5cYgDEjMRq/II2hrFm4qR4HBbfNncN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234822; c=relaxed/simple;
	bh=ao9W4UafP1BG4g0Oeyh5S9QeyOeCRkfK2dC338i7aKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4hOHQRGWfqlvOU/K3l7UztjYdawSHctkECvRoinbgGr5MmNUxC16BqxlGPUoh9Y0xV+whHL3pVG/UaznyDsSOwFr7FUg4cpZWdnzMsRMpTTlD8IcoBklU7lOOwM3AbkZsJBUkhEIxQwqOHcYWzM9pIFmCc9nW3icZGB6SsB7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3/ovMn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiiddZpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3/ovMn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiiddZpP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812kxau1390946
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 03:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipv
	rJDvshDA=; b=T3/ovMn9+m0NQPNYGPdH3JveyDK3ffMQelyaGmr8pphSb2duO+8
	Ghfjz6ckaKBdKWYxHysM/P0p1uMN/sbH9h6eOynmeqGtqmM7xHdTlX1ULf2Xpgv9
	uZeGz8+T1ttxiKOIPXMDWL9mZmtVedM6w+ieAmOUJv+i1pq564Q9F6aFi7+eRDAB
	Dcs4JJD/eGu01ij/0U7maiG/1zQptQCMFsZYUhukP1pJObnV6D6jt5s2I9mKOvRx
	sBjTc97igRE+lenr61IadTm9mtm/V24Y/5236tJmgsZ//0aAv21fxVhx6yavXpep
	+bphkIa/jSwlT23+x2AjqPbCfK496awIWjw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r06wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:53:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39906175917so740399a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234819; x=1788839619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipvrJDvshDA=;
        b=LiiddZpP3a1ePth84AFgnHkDkdnwk076sOumlmbomo6umpczjjvviuyxuKrS7IeRf8
         dZSONKhaKvKyTzpFCJmvtAaglAEUhQb2utrQQBFchzxWlNRLJIfjBkuUPJnssoXxPquK
         LMA5C3QgkblhBH1jPF/+Q6JnULuGxPInKUEJKFnqHAzIzrocX57dPUQt5bNBJYm/+y5w
         ePe1BEdQDOLlgk0vhGOQRlqKyU4IHp86MyjjwND0vJVJxBEUeP4SDihgwQeosGe40eK1
         w89n+CBrZGYrHhqSBachJ7r/uWhBKAXfSR1LncNipo1AGmAcLy7uuSymk0Mfs1Pf10HO
         YoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234819; x=1788839619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipvrJDvshDA=;
        b=q95GfytnE1o5DmrbL7iDBVtIkvRP74sLoJgwpB9pflXxGwNF6uqqcGylRFQ9ikwe2e
         UUslWA+RhjlgY02mUIey2NXnJ+59rn3SwWuW6szCu1sB/NIbB6RvgUiMv3x89LUc3/tS
         LFi8CdUuexShPE5vCllurrh/8gzbm2hgjxsAQ8WBknA8wu4s1ozCrNOWM0J2+Up6mArT
         xla7CcqPvVrZKeEf7j6OEIIqqwoUqEiHtwvybFZJCEjl90DK+EEsTsWhxfX0erMgksXK
         SqfXOvToWeFtpVwkUU99oyrUEN0rkYZp+bkv7ease/DBtGmpioxhmiJUg+I1ZtbdlQL+
         1M9g==
X-Forwarded-Encrypted: i=1; AKwUvBzqg2PIpHpQoGy0GfLgQyF7VOTDwiaf1148kKZckAgVScaSFZriy1MjhcA0f7HJF0MsHTxSHHctxbvIhNg=@vger.kernel.org
X-Gm-Message-State: AFuF++lwtNrJLcePNZVbujyfqvgMaY2D+9ogO8gXVNUJAMvPj1HsqScU
	s9OSTH2FOHfbpFpgAG/IaJt103ZhWFLW+bDGSKVZ2if2rGiz6Mf6bvzP3lcsbMql+6a20mptW68
	6LnnBXb5kvDIwHqvpaXvrf8YJ7+Nnf6r+tjtzFNM+r/MAGFb5hECdwMsBI0rlbwyfeM8=
X-Gm-Gg: AYBFou3AO4CgMX8YgHxuowP9ssYmt5k54tediFcF3jrO4qPLX+BXPK9JCo288wh1H5f
	XiwmUAv3lMz2EiuXOMdv044cv+jvL6I4lGpOQiRuEfI9IS3jHA/IGh7EIrGcPeFPI/DsjeR5rbk
	U5jA9UJt30cIvJqnnfBSTrRCdYyc85PdMJXU7Hu6ZxvOrVmfCSfgoT/JnotAH8YoqKdUsXlwt37
	F4zsCUNbaiRleg+Th7S4Ntzh97ATfIXIJztRHPgUe0hgAaKSEyeAn36Zpvq/IDbP/HbmzvF3b1r
	PdUuxSrIbeT56o4/E0LEfcup/nL35XY8UcClJckFvSHcKd1DysMNpBT9Igzw28GPbrvhzUxyrMS
	aGKJe9D8RhYYZ1xtgVAFs/iDW+GzbAcIcTqIaD8EvhRz8NPNVN1+0FUER2bsn
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-398ba9e7753mr23318493a91.21.1788234818746;
        Mon, 31 Aug 2026 20:53:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-398ba9e7753mr23318450a91.21.1788234818326;
        Mon, 31 Aug 2026 20:53:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm16702035eec.1.2026.08.31.20.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
Date: Tue,  1 Sep 2026 11:53:20 +0800
Message-ID: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a964c43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KtG9YyVjr6Sm7fKX5a0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfXxE3RbxLJjeQT
 e3Ph6IWb8dHZLmAVBFohGz3UyVOHM2bY/IcF+HMAWhDRkMVOb5cizJTe8huMhjHscDfcHO+Od7I
 7jANV3oXwak4FWrQtAdlh2F+cARWGA6lhYpMg6jh3K6YsnlNCkt1BVVNobn6uX+1FoaQm4hFC6N
 1wr5VKz4q8Ku76pv3Dasyyql19gbO+wP0rIg94WRKNabdjfRenZCpqUkwDPAw/RMtYMWQwcW2X3
 EOOC5gH7g+b55TKB+Ph8hnYQtMuA0NPH8y6Ay2UdxPHCMzGWGsNH5kZshEMhTAXNN1qbfMF2VPm
 tqGpEucrl+tzMktWqBgiUyv34o+R+PMU87dCGzZQwXV/cRa2Q20HnIi/VRQK4OrskfZxXc/c6uY
 feriNvpesGBT31E+deb+D8EjS38zv6gf2EsHryvR5mkz11Vogp45s8m3/dc57DaLQkVuE8rezb8
 cbMEfqbA+JwRpoa7l/w==
X-Proofpoint-GUID: L7HI69WMIAv6ndMWLe22yfnxIxXoud9a
X-Proofpoint-ORIG-GUID: L7HI69WMIAv6ndMWLe22yfnxIxXoud9a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX20XOOF4uHoEx
 QIqvMw/KFMF0A3lm3DzhGP2JDDdwor+rWqhYiu1TvnCbJ9NvPot6YkryHLMd+jrZsUneKKTtvNs
 UDlqqbQh/RHddhG8z1vRX9wAMka3aBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010031

The series adds the missing secondary QUSB2 PHY reset to negcc-nord
clock driver, so that usb_1_hsphy can be enabled properly on Nord
platform.

Bartosz Golaszewski (2):
  dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY
    reset
  clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

