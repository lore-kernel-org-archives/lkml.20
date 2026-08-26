Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB5429013
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752563; cv=none; b=dh5JrZHU+dk0m47IP7YQjw8IYPEINFF7KkZsroSV0L4Ogkpp8icFkrSjZqsRrKcs7LEmRcLyG3bbKtB1FTtto0Wt/eUcW7o9a44uy4zVyN7EbHQZaARmCVEV5w3Luuy2XqNM0VLGSHxAVNpDSCWoWlyS6SWEdgDoatoSeNEJuRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752563; c=relaxed/simple;
	bh=Fuk5n0D0xHvMhCw4oobLuLcYYMG2iZyU2fYgQ3JvG78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bU97Ua1vNJKZylpAPGATrIuoL7Z213DzVnxHkke2xJgTL1Vg6ADYf3e7IyeyXP9pNtrBmLXdoUHhYNx0e2eRTRsJpydMiTga/A85g0Aj5r2EUpLUGjR1/qtNlv8ZjEim+twNexsmvTz2fsjk2ryhJPR0jxYSoAYoZ254yPHqn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNzIsZgY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OATq09f1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNzIsZgY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OATq09f1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCHN9374858
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GvF3M2opMH+
	9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=; b=GNzIsZgYoZ+Cp0Ialf+Ep1+MYXo
	Qq3p8AtunjfmGxaWwc5GMV7+vGictha0tVDGoJJxTEn4VChALWuARR2xxiZeZ0kh
	/xo9R0wFcu/RXAuRfF7v6HbAXJTNPg3BjF6vR7WpI6SGARmAXQZi9MG6qHvPr/Ep
	aGNZCtMfXQspnnq3yBm6sd5gf5/qnc33BTvFpP3mbQ/bEiujZLtxQIVKBCAxzodU
	LgMfLRWvnq3cXnLknCmapMz018HzpMcCg//TseSIQNv2drRnhsnwnG+0aTEM3JUU
	IRzRL2VqKFuqXTnGI1XbW9DGIQFKtfr3WZzZlHvEZKK7EwGhJRtH7+m/f1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxa426-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:56:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so2859935a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752560; x=1788357360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvF3M2opMH+9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=;
        b=OATq09f1MWGBl3aKoXjrba6WGCa9wCoPqjbCoYCivbAtxXLVW0msBTJGtRjXtIZ309
         AD6Qw9ENRFP3P7AqTF01fLgV8tqd+gcEomeQqonX4kuILBb5SCp6qM6NDwqfiuIzS0YP
         ZfhhyZ5F9aBQgAcRVccmpF02PtDxF8L4sEMroSfa4fkFBej8wvCl1X5BhFgMs2Il2g+X
         3oEMWUG6UtOUyscbD7x/BnNu5aVWGIsznYtiGAzwoMTPkfFuYrQkoNJp+aWAHg1O570K
         YMb2v6Gm8NDNJIxHFivfF5/8IIYYHkMLnlIZ6Q74V8CUuODX7crTFhwrvc3AaOskgr+4
         3crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752560; x=1788357360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvF3M2opMH+9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=;
        b=IhKzizzOZKKc9OU3fzRp8+vfC4j68eLtfSLaZV5aDPv7SDDTf5TauEoAAfEzoW/xU7
         CFjAc3FZ6khcMj0Ixoky7O9GG9UO9usU5ztOgbDI/deNVmw9TGMy08hLWyLFq+U7DZ8y
         S9rSXWLJ9VmEoxovk0WolpOvDc0MkyMW8m/0ie/FtFLv74Zz+eZLFcj6u8kHLL3/7P+U
         tOgcyjeQXdpX5Eqy7RBlMuGsxKrxjclYfAtU2AANLTeqhiphhCZp7pWj0YrYHFDZqyib
         YIXeIa34Qr6p7Mvx1MXfc4n7YOUqSXlnYp932pYlhl8kumOn2rSotH7lA//E+ArHhzx1
         l+ZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rru/HQlLxJ7JbMVkO6uCPLns4gbwAKZPcVnsLo2QLLdkyIHreOv5zjtGfn/fwSfqr81hgdJdqdPVG80e+k=@vger.kernel.org
X-Gm-Message-State: AFuF++m7ZcgBtuBK3O33KizVEXhJzHTqCUEc6bGrKiYcqt+XjeXDAtkV
	SEi78+lEVekfL9F2gcL8wdpbVZdoCoUs6ubgURcywyyjNFe872OaXjZSBdMe+YUn/oviuVw5JPz
	jtbQvm2T//n23tr2TRt8mHxNtZi42axepD/kgP//p4Qc+Eeuo+CkmClM+r1WwdLegW8k=
X-Gm-Gg: AR+sD106XG0NCuRZRPK/Ljk48OHTcwc6u9KgZnEMbUMd87oP1vmpZ/M6BZztiVkzaL1
	HJs7SQmGjyinpmQudNjjRawaDVyE2DoIuIvUrNApMjoMoC+kN9xWv+0BPO6PpDVwnhybxnNt9V/
	9KQXxKgBbh/kiF3TmzUIFee6VEMVcqUNVAkklsinQ0aYa3iq84LtUQpCbCFkbUUseY/1zI/vMfG
	CrT/3zIirEXmVlCqmPtS7Sp6UmbPw5WdAG5DETPRUMeYbae/57afq3nVQU2AzqKzeTFc+1liVBP
	hFIiE8LmI3f1kKe0UeqKw2p8QaUt3FX1Na5yUBiLOXlDq7JBXVjFLJ4QFzMtqrDRQediwPJqUcg
	Wj0ynI5LEDbWI+Io1bvAPsT1U/Kt5LcbsroWD/eJ2Aumln621SdZrrv/SY2Fa
X-Received: by 2002:a17:90b:268b:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3966d73212emr15756293a91.13.1787752559619;
        Wed, 26 Aug 2026 06:55:59 -0700 (PDT)
X-Received: by 2002:a17:90b:268b:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3966d73212emr15756154a91.13.1787752559073;
        Wed, 26 Aug 2026 06:55:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
Date: Wed, 26 Aug 2026 21:54:54 +0800
Message-ID: <20260826135454.658615-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ef070 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lHabChWoiVafOPoG-uEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: YtTBJFCu5xUnWbmko0hviRWYzQ8A33pN
X-Proofpoint-ORIG-GUID: YtTBJFCu5xUnWbmko0hviRWYzQ8A33pN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX3p5eL2/eh4Dz
 qq1W2DrIlXOlKyqw8hXQ20POHkIfmtcLtTm6p/FRcKsv1mrQKXDuJeiBkxKodHwXX/koXrrzW19
 GKzfj1QGvq1Dl8llvLJKa8ekPHPgpgoQBSRoEkmrzHxYuiORHIhg97qyeGmH6Wo5s9Aa865jaBI
 r9Eqi3xijBBmHTBBM3NWSVYVB+GtsXrviSq3GcvoamQxtSim0lQsjDL5cYnoYYWowp5mMvmUVAA
 R4MX2HvNDSBe7vHX7mNQbROfSVz2qEHlkk8DxQcopCoezx+rhdGHuKINxPgAS32re8XLB3Qfc8d
 sGx1t8LXl1gsE/ymId7b7kmTY2X2yDhOq6Dh8x89GwM/9xjFjcKGLKw1FL58Ect4jP7AG8y72Dq
 3bmq3A3V7QQGWFVVxLr6b9MMHfanz1CBi6ugX17Bpu+EDYmRLfueg10HBSl+fSbSVrlCd7j4U33
 buDMfYqqw6/rid+N2Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfXwfYgpFEKp7iv
 88SJNDkAlCJoIijg8fX6atgWQQIokE0Od+Q+zDpNXxS86tMqhkxjCffijrOtFGrA3N0iEt+dkJx
 mi+y5svxS/LtX0EWPjZ4h23rfBk98AQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260115

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Add the nmxc.lvl RPMh resource and register it in the Nord power domain
table. Nord supplies the NSP memory rail from this dedicated resource
rather than from the shared MX rail, so consumers need it exposed as its
own power domain.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..717c44d1c39a 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
 	.res_name = "mxc.lvl",
 };
 
+static struct rpmhpd nmxc = {
+	.pd = { .name = "nmxc", },
+	.res_name = "nmxc.lvl",
+};
+
 static struct rpmhpd nsp = {
 	.pd = { .name = "nsp", },
 	.res_name = "nsp.lvl",
@@ -331,6 +336,7 @@ static struct rpmhpd *nord_rpmhpds[] = {
 	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NMXC] = &nmxc,
 	[RPMHPD_NSP0] = &nsp0,
 	[RPMHPD_NSP1] = &nsp1,
 	[RPMHPD_NSP2] = &nsp2,
-- 
2.43.0

