Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72537C112
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140580; cv=none; b=aQZw5N2YNE5rp3JLrhP65pSVi4peKzpU+oLI/nKB639xkoBk5UTXmUbxDRTqOH4aTXW/xk5hBU4k1YkP8NELYL0Ix8graf5HP99XdfLBBEsnYMprwE9nM97Vv7gta1Gxy7cbfhGubfmMdDxXNJaKdczBkIrQWqI9QXSn0iM9ofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140580; c=relaxed/simple;
	bh=LV+tsjLIUEHEBxSJw3wNQTx+6xef7y2FTS1D05i/6N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nmstxis8OFzGjCTXvXtcRkP/Je2ApjbWsEHXWuK3BzO6ZryFfHvqwihAAz2D07DnDi0/jdMZ4nEq1mnRHsUoPWlpVwvSIpmqW3uM9QH9yRfiR8NhBssL/cq08EvJ9iHqsUpy5itaGRRNfB+9Nl287WRlW6BlS1W6G4ZL2aE7E1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfEJdmQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqcm66Zq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfEJdmQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqcm66Zq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lgDh921323
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ae9/W8idpRqilFnmg657Xc
	PTn01x9W+1TIzNRFLZYiY=; b=YfEJdmQqpLgjHu/zz2JCn+LtaGl9N0NK3frYcZ
	RDtbQvaPfZdJlLiF5BKczIHag/7NU3tAAiMMIImRsQhaQcSxJ+Q3iU0nl4W3JOwm
	RMVcOPo7SiLRst3NNRSd/E5kypzJUUi/9gB0M9I7BENIdz09I2dV+Gw1rdKMNaHr
	YOUc3FHqUIpOa9hxtSfzgVjaeTENCta+g8R4D1s+4pITvzSwTmIA7lHKf1bpFiaw
	rQSk3KBlW+7Gmcd6T2mGmWNNPj32ke54Tcs+0l+6isBZkCYTWqFOMd7uh6Eatb25
	nK9vvkyLoZjG1mz7UOBjHqBveQTUu4/N8UcLxs25NpMna2WQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3ay8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:49:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so1238806285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140577; x=1792745377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae9/W8idpRqilFnmg657XcPTn01x9W+1TIzNRFLZYiY=;
        b=cqcm66Zq7HKfDzzy4EHRIfOZgfYX3Zjjme0MzZaNtZl7UJQ24PRZAWMdLj0EWDkQHd
         Gvej7mPiRrBdXV1ub2kJ+wOIO0yYMIJO19cffqou4teoz2gh3n6Y07XrcdHxHnxSSi2g
         Bs8LXPuvlp527AztqYLO3i/m0Mk4ow7sXPIftjy+p0zKO72o1Ejn/dl25KHQw7cKwoHU
         4ulNiedMun7dpRmB3RIfnHrKtZiTr/Ay7K0Wrf2Tfp7cEyRCw5xNF4zklUtAEyOh2Qqc
         qbPxBhA8nxfkL8d3pHzShVTk44/1A79EDbQc/WT8QIoS98dn+9yg5keYn4opiYWfG55+
         MA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140577; x=1792745377;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ae9/W8idpRqilFnmg657XcPTn01x9W+1TIzNRFLZYiY=;
        b=NDgtFRE6P3KXk4paN/OlIM3FzSxWtbnoB7nwx3QopgdsF7wPQgsxvjGHBg49z3xFFY
         EuKDpDD9CeSvodfZFlsEiGm1s06OlnrTtvcPpUWNyxsgmhg2UMuagTI5VONaFsuLlCpY
         hpANFCVlw17qhAwYIt+PfiF9OpIyJIMI1DtSrB966ev7qumFZq89EQcUIHAi9xnXetVj
         XqIoW96Tbc6uXMUCkYex9wAjVEKcwIYF4Q7JWJx2NvHSAkIJOyHHMuqE+hmvXFP596BK
         tcQXn3+hCDlzcTZaFwWvObovRxtu2hgvbCZ1TyIKmzHfxz7dvB7aUiYqz5Y4ghjJ5FJo
         3Jtg==
X-Forwarded-Encrypted: i=1; AKwUvByLrzydshfRiSbt+wS6avy4ud732YlYzpgDTV4DG8oyPTq2PksDxnuyLOB077KtspJKiByuny4WARhv1PU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7gPh/cZXRpH51RueDGVI4TBKKy4OKZZZKTdCZDj8rhXbD5mxJ
	FoOWeHrZQC0c4qHqPTxRb1c27uNt0u8QULCMqSsUK7Ot8B6pt3MMR/qNEdkP+dGG7ysx9fxjO11
	iXZhNCTuhanDCTuRaVCEIBPWHiwhxXCKZyo8qqhzxX78idRAGF1FoP4/3mTBgYx6xhDA=
X-Gm-Gg: AYBFou3iKAE124QAao7KOEAMo9kpxZEwuRxPy/wRxb6aof6DQ36iGz8keqtqdHdi3uQ
	5KvPS5V40WoO8fuh4kuWHAkvlRFRBQnRaREwYjvV9qh/Ycdjn1qUe56ck/e+X2cuRNlIuKqxOfF
	BODRIG66vd3fwdudgHPsW8wojLmS0S5pVYAaSNQpVYdnZblt7lC1ZA1wsZXjSzmZNwEJSy8YrjE
	EsWt08O6vqN4xe/fCz2SiU1UWhl61nEBbVWgKGm5KQ4OEPmu9X0QGFyModjMbvvUbVvTDpDaV10
	J5VKv5+b5uXgbqpYgzkPrbsSypZA4nIR1MRkQcehum7edegR8kk8EqLxxoMkOp/dZC9AokFD/CF
	6b2RVnuyr/IcoWS13DB09EhDP20k=
X-Received: by 2002:a05:620a:628d:b0:93f:1dbf:6cfc with SMTP id af79cd13be357-93f1dbf7018mr123108485a.36.1792140577156;
        Fri, 16 Oct 2026 01:49:37 -0700 (PDT)
X-Received: by 2002:a05:620a:628d:b0:93f:1dbf:6cfc with SMTP id af79cd13be357-93f1dbf7018mr123107185a.36.1792140576712;
        Fri, 16 Oct 2026 01:49:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d1bcsm3649332f8f.54.2026.10.16.01.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:49:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] power sequencing fixes for v7.3
Date: Fri, 16 Oct 2026 10:49:32 +0200
Message-ID: <20261016084933.39924-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX6D1GC9LI4GjQ
 82gmeq68ATBtLfm9XJCLIvPLBhUaTmLc8tTE9a9CfuWOCv02Ml4CHfkW1i+f7E+VCqeVgN+OTEt
 Q0xHZm/Ylyv0S6HtqYi38NjvDh6BvjvHw7vXQtKMLQlXZBgix79VESZPvynNPkTiE+YzbtI1qiS
 0O2F0MR1uszJpE/oCq9MuEjNQ61P1cWD0JwoU+XzhkCMXd9cCdFpV9pHkhvzPEp1K1W/wZYdAVh
 71SWqR7DxCWRaTEcNXsHTuiwqHl7t5xc3omJx+x8LylvLKpKTfH7oo52uCOXPEr5u6LnEMMGQ9h
 XJsy3ltIme1Hf4hnGuRQze/wClAdQyrCsTndMjEpad0d4RtK7wh44rvXxeQfGiMMgxwAaiO69eO
 +d3/iP5nDO6Ro3zYVEtCQhIRqk/J8rly+AliXbUyuFMXdr8KZdjFoYW9G0gUSs6U63gxiktHvkY
 O8hccQ8rd934MW5RDCA==
X-Proofpoint-GUID: 5nSVcOklKKg6eAkESbFWEde08eECbgUv
X-Proofpoint-ORIG-GUID: 5nSVcOklKKg6eAkESbFWEde08eECbgUv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX7QFHRyYsFWBz
 KViZ94r4cPF7j5z+g6+9DRzUKepR1WJzVJ7BlCcuQ7o90w9BUmGb9ytN3BWRph5euxo4BBVi5ii
 uLe77WkASiWAMkia3FofeToOqwIjoiU=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1e522 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=i_sB5PnZ_mCEERRZbpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

Linus,

Please pull one final power sequencing fix for this cycle. It removes
a workaround for a PCI core issue that was since fixed and the workaround
started causing problems instead.

Thanks,
Bartosz

The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-fixes-for-v7.3

for you to fetch changes up to dbd674ccf30f66f5eccf637964a93910df8dbf84:

  power: sequencing: qcom-wcn: power off WLAN at probe (2026-10-12 15:36:07 +0200)

----------------------------------------------------------------
power sequencing fixes for v7.3

- with the PCIe code reworked to power the endpoint via pwrctl before it
  starts the link training, we can now remove the workaround for WLAN
  power which instead started causing an issue with endpoint enumeration

----------------------------------------------------------------
François Roux (1):
      power: sequencing: qcom-wcn: power off WLAN at probe

 drivers/power/sequencing/pwrseq-qcom-wcn.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)
