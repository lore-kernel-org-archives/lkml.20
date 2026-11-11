Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370823;
	b=iMFkyIThVtUME/LxJUZx2jibrKVz241yedBQrwW2xrN7K86TUaam+pnBHwxWvC+YPuKJ
	 1s7923dXazdR75P825u17W/L4mT/Lc6AdkVgVHz9v8YeaGfaO0dg8Bl7f8+9+ViBqEuvy
	 NEhpjZdlo/OFQeQeGRMfAL+Yq0IP8Pmp8R7WkjaoCR1VoCfUuaOBaLsrYgCEFKqMdeQnQ
	 CWSNdlf2jz2zlEeGgqFjE4yTFs6uUQ+ArNyUnWZpCUmdxEqoCuj5AGKXmDdOh98FidpXk
	 i04+f7szc4w/GWWZ3lXF0RvShihHwJq5Qb5xd0SBGWLmBFi+OYr1L82bh1ol94BZJRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
	b=BuH8fXIxROcODXDRHbEae5lFEU7/ujSGaqIKFf7vU6/VftoiYIhzFb38rmw5rNv4e/KX
	 rPbSBQxYJ4NpbO8czF21BKmn3rWDSpYVcqUTySWIv1wJqadEJvmEY37R6EMdDR3cMb4z7
	 wMlRsMaNk5IzJ1LNLflQkuZiAZ315dmaBRVkUtrPjC2Q3rSDBKlCMxsM+T+6iPEdR7UaG
	 PjGz4yHz3eLriL7ObU63FWMVzYJ5dSnuGpYzpT/xDCOpyGqcUKnofKnGYPhtbzAz4M8kJ
	 6StBrZn+ICqTTozD7kfCA8KQHs2xQWIuCNoTvuJbksg4XZgVa9R7FusmjuHQCxdYcDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ULCjX+Yp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFPf39c4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ULCjX+Yp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFPf39c4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1t0Kd4167142
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qiQPn6s1q5c7xcpZrlCDQ6
	qpZqACFmX9HhK9uA8qPdY=; b=ULCjX+YpT1XoRb4I/7NUSu+Br9zByaBZrGkR4l
	WORfsTnlT0Swx/97vH+YNKRXpTtyG0QbXZIHsHtq4rfaACT+xC1PFtx5JdShFb/c
	vgLhUc42hYGCNSN/ERDsETkDR+1OcdZuxY3/4z8bIs7Nrnp0mJ5lx4D0K628Qegl
	SrU1guiKUnDo74zZqfZFm8Clkj3vCYXDwxoIPvvHq8GMQvfK2VgUiQsyIljD5UQd
	QqViL4udGmIypfNKNL0ZPXg9fHkZSN9yCvZT+Apd7Y/S0aorpaNum/goDjO3SgXD
	vxjE8lVMxBmYHfLw9mrjfDU6D/f72tFJNuSG6/yokWiVVYhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4c9ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1547602eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794370821; x=1794975621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
        b=OFPf39c48lDfmKpGlBSLqwFsQojrn1lFGzach4fnaKQgvjQnVzrpR6VjPtkAeVulqE
         WJnW/6SQLOF/6do6ZNUyh/hfaXI/G2g9lJy/f+maw7idcnNSeN4FCoewxq9OwcbWR7a0
         UL4v8h/+IYRbTbUN4UuQwK2MifEcf+wqj7bob83P1MEp2AsrQqvIlMcBgEUYhBMjBjcv
         gK46N4xsf3LIFC+fXb1foTozPo150XicDUBDNhWLRiBlcspK9TX98NyfWetsbONbY3ZY
         drlxIlxYMUrJ7wHu8uhRIm8Ar3vFRCRf4PyEnk3A1OPU3HmJiASwrTv/ywmOoxHP/kJR
         qddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370821; x=1794975621;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
        b=sXxC8cLEKQTV4PW8/KnQBSlJPS4Z69T0HYvm7taGGa8l8lgtSetF65q5jvs4F8dybZ
         7EqQ7iRBEvbarBxwgdJCuLQuRlov/oVGK3ut7xRRriKnrnQVjixhK6fOoZrZK/077Znm
         SWicpK+raxk+tjlsHMO6EE+Yb2m46mgvyhBZ7YF5xEdnNiFE1CQBh98Q9rKYxImEUwfn
         IAPXbWZGWjIGH8b3gonAyOVbk8Sbme+lgg+rF3rig14xwulTdOyrbGSyw0DnYrvMt83w
         3vQxAvBgZY9r6ywKHdvx1rRIHMUrW6IGP5/4EDwuEYx9nxNGCQ4aAn1KJtobgaaGsZGK
         fndw==
X-Forwarded-Encrypted: i=1; AL+hErG2pAv+zPBgUN+CUycoWEIzes69cp4GOULdtcfskYj98MJDODOzAzS0GiueDSoHTqGHnaIBRSXybeRsEIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DRQrLYfDiiMUYqiOcGyPfibjpC0QtZ4qMcKoA3SrFcRjpWRen
	yw10T0+Q2hW9gfOhphhes9HGf1//kl9FawAKlBiy+Hh+FnNO3hbiJznmpSw827PWvhLDZpqYdQ7
	FCd40Vd15p/pIUwpr2jTpuOhsULNdCgqqWEW+nf7Ln0NYuJeQ6ocSX+77Fr2TrqSBD7k=
X-Gm-Gg: AYBFou0fdigfyrkEI5gEFtkz+Wu6eZj9LZdWK2U2WXemh2EVc18P9zkxkEa8jxLYnNu
	CNQ3S4Mocaaa8jfmyok0yjgbJj95QUTAx7fb8NYMYBBDuBL1MSF5zsiAO5UeCvef29R3YvsyRLX
	jtBa7pkJYV+2zTfWDOy/yK5dQSzFVLMXzKIParoeaoZsNB/krUPbIRb1EbT10dZrKUgxLlKbPeQ
	1lPq4aSAjz4sCjWzmwUgVVx/TC+Y5zkcKRwxc1zAcEBNhwdapCmWUHmONjp399Q9gf2KWxNQvpC
	/q47TJu2BfDkq8GMY6EUJaVxfGZDZNR9aiVxqZN9aQM0bUq1Tku6hpi3ZEvmWo3GmLQtXG0xODA
	TCzxqvXRlfrZxkkmIIGMe7NkjbKiDD9CEMQfkqA7B5v/3YPaIT5aMm8/IuHJpUV/cnvszukX43k
	SuzRZnTSSkOrl9f0lYG34jHQJ01t/2LGG7
X-Received: by 2002:a05:7301:b18:b0:36c:c483:7077 with SMTP id 5a478bee46e88-37686073d7cmr1891218eec.14.1794370821255;
        Tue, 10 Nov 2026 20:20:21 -0800 (PST)
X-Received: by 2002:a05:7301:b18:b0:36c:c483:7077 with SMTP id 5a478bee46e88-37686073d7cmr1891192eec.14.1794370820535;
        Tue, 10 Nov 2026 20:20:20 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm21690542eec.16.2026.11.10.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:20 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Wed, 11 Nov 2026 12:19:38 +0800
Message-ID: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX9FEKGBVJuqVf
 K7U7/gYjA0gLEHmeXjb4Qbqkeu6UZEk0nrjCeE+6yHg7oHpv5o7gn72qX8i5MaqQAC1yjPdo9ch
 eHaT+g1Wfxbc+GCNXZwUxXeKZTvnHX4Bg332iVDzi2EskIzUA3JdKQO/omnFrfBga2PV56wrMUn
 /npe8NSq9L0brRkWENN6LpK53dimyh0WXbQdWVHMM0VsWD94CMatUHDyWgKpoSbMlX+8hsTTRJ3
 lf0INOxRcBRciijHIoSup1VFLcwDppNKynWxQ9KcxKLB5adJxwVWBjUHGVLO1L12lLEPe5L682H
 sWN/0bi0lTLbSAIs+PpG1fx2kopXL3M7JS7cTd4EXgrkjbmJAYypE6gL2JcoJEHz0aUbJ+kq0Ug
 Rs7g04mwcgefySFlLuh9BXnhx3zihhEYjAxymSfT+FBQfGFQ9urwjSVEUsZZGofw2Gi7D6mzq2T
 BwvVvTDIdv1lfUAZN+g==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3ed06 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cxXtml3fbL26w-N5-xgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX5ki6AO46A6Ba
 DqqyrxgNhd1PerUmQT0B8IGApW9nh916cytPzddngTRKW15uRsdkZPYl5TeZ1Wp59Kc4s4APF0O
 2svoJ1jxkCaghbI8FAfI4RwWHFqZLNA=
X-Proofpoint-GUID: jSNlStszHPCstayZ5MI7UaeNBPJlCWVE
X-Proofpoint-ORIG-GUID: jSNlStszHPCstayZ5MI7UaeNBPJlCWVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110017

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Changes for v3:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- Link to v2: https://lore.kernel.org/all/20261028075044.431228-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Tag the series with RFC due to dependencies
- Fixed the ddr2 TPDM labels: tpdm_ddr3_llcc_2/3 → tpdm_ddr2_llcc_2/3
- Renamed tpdm-nsp0-cdsp-llm-2 → tpdm-nsp0-cdsp-llm2 so it matches the nsp1–3 nodes
- Link to v1: https://lore.kernel.org/all/20260922100850.527109-1-shengchao.guo@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3088 +++++++++++++++++
 2 files changed, 3089 insertions(+)

-- 
2.43.0

