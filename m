Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719F47045C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449812; cv=none; b=COZ68pX3qhNsrh45hT1tD+EwQXSHTeeTjWaaoGhIHWk+gwCJm62rNjNgl7oH7u9TvP78ZPPkpiZeNUM/KcRWkpnZKfUnLxGfGK2SX8KfKzaYhvf8yvShK6CLc5NAsgq2Mb3wQ9qHx7N5OAH83Lh0qOE1pqG82o604U6Y2eo3M5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449812; c=relaxed/simple;
	bh=irt+5R/TCuvvfWpeW9TWIubOZ/2FdIwVIvhQgVb8jCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gnsrf5uS21DaZvKUJxEjTauvmv6KyCDlxPpnrFUxEkHd4mFldbGTPpwMswSzSWbxSOuRZ7/pqM7pX7rRYhyCHBgseKnoMpt5QRP49hgBaQ+L/cU4zmtsxPrErAejbOzM+CXZT17jEPbHq7/76yNUP5bajUVpW/EX9w5gjkUDXk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mADA7tRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krb5XSC2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mADA7tRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krb5XSC2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3HF1341755
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IqML+hxzRewZJjV2LhniPwlMMPrxKKH/Yvp
	PRZcedDY=; b=mADA7tRJRgAjTtX8Q3qW3Y0iLJNUA8huvWEhRfc1mfrdXsQkHD5
	xF3AY1+HvtKFgjFPytsfy/rH4xgph1aPSwhksW38vy8QH71pu7NOL3Ca7JcqLk2d
	5Z62M1DyBhO/GWv4O37i7+/ZnA/KKXqDi5ibs2cAhGZkTxFMwNb5OsCWMbODgshq
	e9xZdw1L6PCQXrtCasZ1HMmyGnCI0FKrIz1ej8xu/9OnbsMuUtG9EBrkEyneU3Bo
	bKIpaKNvXSUw/Dna8mw9boiQm4penYW+XaX7zEPnqAg7Pl7MIV7kKpD0G8g+DgVo
	0oo9aLst8PmgHSS021V6GrR+GMLgm3yonBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t1qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:56:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9786874eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449810; x=1792054610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqML+hxzRewZJjV2LhniPwlMMPrxKKH/YvpPRZcedDY=;
        b=krb5XSC2ZPONIt/EapT+XFnUjYgJR+e6RZLGN6XoQtNy2KSCnWhbS1Cg4jTTT6aua9
         NFgqZG5sV2HqlZUtnweqklh/H1fMaVKjmlChnk+eb/dDizCWXfXsrIOiU4UjgFwp7zAx
         qcJJOgEie0kRY25aLzVh6sNz2iYqrIzZaN60IWMx+WV4TMkRyC11AgNStSJQyu1Bed1k
         V0euXWgRqq1nQO4z4zly9KbV7uaVtcacVg9TZ8GeQg7ztWd5EyW6UIj/h8Rp3DVKsYQ0
         4pQLaWQSfM7cuajrWfIeOTJAAf5iz6Ve7KxqBNYQxkFwkp7ZKnbKMKlzXHkZofyUkbe6
         D7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449810; x=1792054610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqML+hxzRewZJjV2LhniPwlMMPrxKKH/YvpPRZcedDY=;
        b=wUvqw7LuRBfxH3DT+CJ8CH6IrxW618hM5cSbvCworVDyNG/rsBeSc8fnutBpsIMmvY
         bI2TBOextNoLj8EfqePsvaMcphgVaQCRVb9/CQL0M2NRn0x66wy3pq/eeDtgTZxzFD/S
         sVeysyr5bip8EC6w5UOeOI79dhF8l/f+r2P0xsIjuWvYCwgQrDcu7Gfy75kvtY8qWfQZ
         M/TjtG7uLAa9CZklyO9GGkkN4Xv4dTtvBZMh4lqhAd6nnHMB42upNoCB4+j+PlompQNU
         3v81ZesdfPUNOgOEVrsyQuVJKZYyFLe59/jgTa4y6D0FCGdqYr9eiywp6Ra41mtPKLID
         p9+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxnO76bKraqA+rSPq3ryugPo6qe70p5IxVTDgstEuL8CoISyaQv0Id8efbmu7xzjMboeL5wPQ0yMXKahj8=@vger.kernel.org
X-Gm-Message-State: AFuF++kPNzlzCpnidyiiqTiuHaoWnrDIhJ0WIlZwyqQkgk6iuVrP89at
	6m++hB/P8m+WgNSN4fW9mupYnjJP1GQ8w2gRX/efgY8CwqrNzrgq1xcpUbpLSjdTv0UrkZTR9U2
	cCDUHgn/O4n6ctfFI3PlVu1xBwID06BnK3CW9xJksICONRIAXkT+XAfavFu71qPjFBXY=
X-Gm-Gg: AYBFou3lHYigGu2BXe4cwUyFaNsj7V+QiuaoSFzfHop8MvDwo8kLDU/BlpL6Jtd6Vai
	/bEyXBviGCCnBkwpfX5VLA3mDJg6slMtOLfLaD+FZUUBz1lAol9z6qpAdTwiGvBymOCevmol9aQ
	okta55sk//MUW1OgtNPfzruhrI9n0v+bGX/YFEIS7so+sqSk0NDLCmHatTGlsSWZ2YntgFTdmXK
	591Nhbn37zTgatpUkAjBoFjihbc2ExCMomO5tJUlCKYGSkk9u/wdTZGXp6J/MxPMawryg2eEFpa
	b5EehGTQeXY8qdouwlXwfHc6zapuGIsokRjdcRFp0EvGoCMfm3n3b0eThMSVCYDJoPML9hkQ3nA
	Ta73CmyIzKacczMdIDieUN4Hr2le2C+qJtxRo9jGjBHZNJi3Ca5s/h/spD24=
X-Received: by 2002:a05:701b:4343:b0:14c:96a4:b631 with SMTP id a92af1059eb24-1620665f65amr4806796c88.30.1791449809500;
        Thu, 08 Oct 2026 01:56:49 -0700 (PDT)
X-Received: by 2002:a05:701b:4343:b0:14c:96a4:b631 with SMTP id a92af1059eb24-1620665f65amr4806763c88.30.1791449808895;
        Thu, 08 Oct 2026 01:56:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616727976csm13487226c88.8.2026.10.08.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:56:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to NEGCC
Date: Thu,  8 Oct 2026 16:56:40 +0800
Message-ID: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfX8AkM5XGTKjne
 GK2V28d0U6dEvyp62F+vaJ3iN7SSQcW1R3qcwAs5gySno8BUBOFqikhoO4++qFMD4yBRFINlT/I
 SfafDHkD2uRegLWNkdHXna9BUYRYS5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfX9nv2Vtri/+73
 TrFbpNUQWPGWguK9OMbZCXT+MxahL8jgY1rRuMK3WveaXeMnXRC4YTyAPAGcZgA2C8p+srUXQ5r
 Mxv/if8VhF4pFiXAqI1i8Dy+AH+SUhoDrpJAkr9Z4CAtNduZ6hl/+y995xoB7y6C+sQHl78JU3l
 D6ILeTB+sqNBzVzjU/bRN93teVdUunDM5hpoTHnwJsZxLK8PcxCFxC4wizvuKjR5V/kerImzB0z
 NOyd6E8KqKshewpzhoxsLb15AjtUprY+ZwkQgR7Rs9cA16b+/95T+TkVBao/dGeBO0OJ53EASWX
 +QLHCq0Uq1fkbNfSyw9NY//qcO24fa3os/fkZ7vkYcTdv8hN80gqQb4ojPotdOxcoNmgcFp7kVY
 epnLDklGjrrtz2y1+m6Ykq2zNl3u3RPF+29MostNDRx5kNDiK9N1EueylZvWdwa0NSowCfcoJdO
 7fBBZlQK5Ipj9g0ufvQ==
X-Proofpoint-ORIG-GUID: Jy3p6xaU9cMe22QUZSBG6pog8yrrQR1_
X-Proofpoint-GUID: Jy3p6xaU9cMe22QUZSBG6pog8yrrQR1_
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac75ad2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Bo4Vr6iyb8KBBA8X5XQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080035

Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
symbol muxes orphaned.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..5cf90c77838e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -799,9 +799,9 @@ negcc: clock-controller@8900000 {
 		reg = <0x0 0x08900000 0x0 0xf4200>;
 		clocks = <&bi_tcxo_div2>,
 			 <&sleep_clk>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&ufs_mem_phy 0>,
+			 <&ufs_mem_phy 1>,
+			 <&ufs_mem_phy 2>,
 			 <0>,
 			 <0>;
 		#clock-cells = <1>;
-- 
2.43.0

