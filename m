Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953557;
	b=P7n6r/Cvxjr0Lm+YYLzTZXsn7yKqjPyrr+Qj4SLoYp77j9A4VNjUctSAkiezlWyGYjtr
	 WBrfPKYgUOm2eBFEf1PYJybqXYNhdnT/8xl7tzNgF90AakKPcpQSnXn3XZ/XETkjD5bi0
	 ILQxnGC06kyoJkUd9Zv1y/jFBD4KpJVvGtEZIVQbPZq42c4eHPoKwM6XOtDHw99K/2B52
	 n+if27qkBJ8g3RiZWuT0sWbqRWdDB1mrJkV73qJhRHCWaPFQpm02yRgLXcMLi5CYuFmgd
	 P/3qviADy/UxR+L+g+sFAw1P0ve52QZ+Oh+kFl73kwqCaI4w66y5xpMT7xD8X779LMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953557;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=ZBxhP5pq761fs6TqL8Z5O2/6CUogRDlHaj8hyU8axIdeXpbKaTxhny6uCFclqQUBKXCB
	 YIliXakZacuE1qK7kC6v1BSqMV4ZuNfoE3pt8HmrYhiimU1R98rDnWKUlQywfwxXrny9E
	 EC7fIJuhU9lmUuSgDhSPKeDebFU7GwWVz7LIqzKSzgdZyy5YWHnno+Km8Q0AbONvhhqvM
	 z7hSiDC66+/KMfK4jNgVWZ9yuQbql01DHlzytfc5rsIitTcYHql0ZfpoOC4vBePP8EjhX
	 MvjWwmqET/6uIwu+LGAu8WD0MAu4KdiQ/soRPIwNPqqJkoBQvpLt0HW4OAAoB/4BxnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB50A606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB50A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R328129013
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=mV4cBhnI5f1bkIth55MkDV9fkvW
	GVKNJdR1cjKgXNLqy2Cto+za8lLqIqqeLBU83/iryod2JKUPtgmZhzPmjTWWZBwE
	G6nQADiLwDNtbFsSmMgD5tabzguqrcPkuyQBRIr5unVEgKLdOFb56/SlqwOU/p+A
	QA1LyLB/LhXUnpQU8PXaZ8KylyaZn+Ije0s4LaKLjl+aG0b3ORyAHHpoMnn9HO0N
	DoOch5cre74eBI0Vlzmn3vAqVCk4D/mCmsNmNUzXpeSF5UkQo0ozS19nnDppYduD
	oP8/o7EgnS2A6cl092FWDt3HC7JKsKIbbU31p/GdgIXpovLhqfue9nFT2Zg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9suu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364605e74bso2574121cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953544; x=1794558344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=is41yZcKlcVnkykHhVxctzLohW2pQrIZFY3onETvF5oT4mLbq7G1bqjqAwdL6mwTrE
         VohlwRoFYgxs16WLokF6tcgAmw2Mro3YqmK4TbSXUbjKWDxBSJE8lJ4T6T8CEvCmtw/l
         AcWj/KTlCp5uYuyHTRRpW4k9qYKXJVGLl/Uk5aGYHCtPJ2vM7DW7GJ16BIyoNYAX4TvR
         pHi791+Tz2DpBljxrbM8VZdwItsOAv0C6f5j1c2VMrEewPnAqn1Rxt25ycV9ew3+75ym
         BVNQYW1g8WSL4DNGzcAM4wm4UJUxTMpakhoaSH8tAsgZ8NeC5bjG7q1r7sImKCmNcvWG
         txlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953544; x=1794558344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=nqFF4UIg6ubkHb3AQw9JhjrpYHTHHDUTZiRc6pq2AfG0Mp18fvAU8GJaBqc4XE0WdM
         Ijl0rO+HGr72Sl0F2tS9lW8q47dKkacDuFoFcZttm0eGd6KwhhXfT5lXFu6FkiuwVX7T
         CZuTEYom/w4teSKkv54FdHy85ZWTxLcP5SyOkaNp1fw5SMqO5F1wzcjCcKhwwlaYcmAB
         lRrcfAUgnl05Jl+DWy2Rt1Vo+BG4kHPRM1v0otK2iId4hKrCPeBZxddcMZJuM2MAhotP
         HuuCpVPosZ+cdcULiJNwYl/3sn1GzBRfyz7XVyuvCSVVHJe0lS3gs2lg6f59w/pnN6WV
         o9FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUGUwdqH1OiGMEXqy8zEMrUjuFf6UcG51WHQW2uYaWBSy2xHNuBRqMKALCo0KtgPks1IP3qaqZGcaGDoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AN5FDa9fGSxd695UyLs3Tat0ApNonrMnAxd3in4szTTve4v6d
	sB1Cxgx2XGZriCjVojmmey1taBSLZoenLoEmHnDsIouGRIRAWDuSw+wg87NzxsfNV2utb4QgwSY
	kgZcR0Z/Jb1h5fhqlMI5d5NW0t9qS449iSYRhs6KAWjFbJFIKBxoShBGHNywSZJeTGhU=
X-Gm-Gg: AYBFou0shl8tHXnysafMaeQq1j3YvcYlpo3niWQrSO6COq2TCsmuZOrcHNv+YWCg5WM
	4trCndmn7smckq4XfgtzAAEnP0+zHdVbfDO6xi4/YtT3KRw5H4ZkwZX/fBV77S6ebvpJ5LrUqvr
	6ibzufuNz/YjfVp9hpWi+IxfcQJkiRaCFyruy69Zllk0Rq5E0N8Uq0XAmvBQqCtoF66JVplgItl
	15Cx/GtArp924YCeKHD+POXcanPQWOQVt9KTVS34LZpe+kURBDPUj4hwGdMn2OID6gCNGJyONUL
	XVcKjYRJmGY4cBXgk8e2gNyiI6ST+vsJPSt0wyx7av6U1fIWtAtDm63yvUDBZYIXOQznbPNu5Hy
	4R/oa5x3HBqUtNRdgwnYdBJdNI9tCO7SD8a9KcLTMRS8FgB6utBRyyNw9X3wjeZ/EO5X8KRe2pA
	==
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248644885a.2.1793953544178;
        Fri, 06 Nov 2026 00:25:44 -0800 (PST)
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248643685a.2.1793953543833;
        Fri, 06 Nov 2026 00:25:43 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:42 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:22 +0200
Message-Id: <20261106082522.1448390-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX1Pgl4McKSrMs
 obP2wjj5wW2XN7xohI88X7POc4Rr5/ImjXPjSB3LXb2wRWWioWKLz2F1bHdQraYsCNg0Xl7Er5V
 XAIPYhf/kTzO7PFFDjO56EENhq5R0a4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX//QLO1KDLzT9
 NdBEd8Pg1q7lNjBix/8KicnKthWFuV8tsWbJcHxcb+jZB0USVK+rk6d2krGboRYJ5Y0qEQzusum
 VPfybQhuk9txwH1KMnOBldSmgijghPagQHa5HpHHiH7JsTMmm6wgzDiPqnz9pFGJsONSFDixc4i
 Hf1gPvwrtPOpBBqK0tkcVp7KeYugaH2QFv6CLnoGNsEeYpJody9sIkePWZENgoVOUZDIetprWv3
 pWZmIqsGWhtN3ePESHUqTs7ocMRoQ9FNHu+YmK5KbaXuZajDmbsHILYhiSQi7szk42BEUWUh7fO
 LBSFxt1EEYKMNp04sND+tICCFYTZfyRv0UIHyeSYtBifPdcFjJW+/aQdWS7mR4aYfGG2s9ShrlL
 0f+L138YPjg8Dv7r+k5WqxkNYbPj6l8bYJaS0b9heDqwi2XNNd84QDZYM2RLHNoTxSDVITUsCOj
 hW5ovgmi183gkyukWbA==
X-Proofpoint-ORIG-GUID: FSABttubGk3ymvFI47A8wGWuZjo3sOG8
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed8f09 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FSABttubGk3ymvFI47A8wGWuZjo3sOG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1

