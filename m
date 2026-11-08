Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111696;
	b=x0YXzgiaVjOc5OkuOfUefdN2VRUpactNrpBrqf7+LK+p6tpyF9JP9v2gKw+EqTb2WNjE
	 UXtzPnxr/dKxInzmWwq1tnSbBRUAL1z8l+3bal4VjA6Vx0INQ/2oief5YO6rPmaCjumYp
	 puFWx4oKA6Axuu1sxR88HlnzimwGhRkEOFVb2HXcVheVXAP6622+Qxqr6zFhIfn30o9IJ
	 C50e6U9ABcRjCXHdL44uXpEEk81IIiXWI1NoPwDgBvRUqASR+1wtyCNIQ7PiXmLP5p6dE
	 EJdR3TqJZQ3U5wzdZ1IDmGsZv3H/+JNs5tpCKGHHgI3PV10AYmG2j/R90k1O2FY7DHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=;
	b=hQFhWfVuFV4hEVTNseXwkZA3NQ5etlmXn6TZEhcFg/oLzb2T+NYMke/HkimmujD+DBsG
	 wKM0nxM8tvNBxDUYRjjVVdx/ZXbHpvY61px6vwvJAVYLDCzdK2PwUxTn/M5j8HLdXslCz
	 chmWGEbbmaq/2p+wzoAEQProBKrIfyLNGggiXB2EqfOL3V01T4MYW/8rwmTDLOkQSRmh1
	 ykmxPGIV4mpTHVtm1E50LTzs8/H2s6K6pL/CaTtu7tkntTdzTWXZaKBB2B+EdZ7Of+7/q
	 bmHBkIS1pCbdYykRVliUs5h7QhU9FnUtj50i5FnDNvCq/U+3Fcvh9jzO09xul1hjkFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7hTffsU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSbNeX6O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40D606A336
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F40D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7hTffsU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSbNeX6O
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84K1YD1094764
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 04:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=; b=T7hTffsU9/3FgYPu
	vVZUAw+bVsHc58D3UwzP+1TbtMWH5SO7zxcfiEIl7c7UdW5YhV5twOsW9S+tDEuP
	rPFDL1uxbchpXwD+y9nUjMZ6VqTh6GMhe7LvVizBmthp242/i1Vz8JkwhXBHdTGK
	eTFLurLIcncUajcquEUu49C7Zn971WFMLtKkiu96GtjIyLe2tiqylnbQREDTkasM
	jzRzoLqxbb5XMm+c/9UCHwbwbRSZyMxzY8zrfmfybFTgUxO8EDhJbYDfRr0j8nVe
	NEnDj2TcdrvJdljsd8zeDIHkrFbW//DHDqRdJBJcUsKP1PiAdIIu1+EJ2IW8u02S
	aqMbkQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsu06tdc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:21:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso282479eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111694; x=1794716494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=;
        b=jSbNeX6O7RvZpkEw9U4AdxGWNn51QHf4Rfx8HvveSGZ2h8It1tOKHiT2CQNRGfh0T5
         RNOk784eiz8HjRNF2vbRWomCDTDavdUkB+m6mjaoSsjGcODrM6PC+Ic0xf3NDFXIxQp1
         qBt7ydCMkrGUpKFW1Ud2oxse7cwZeFAv9g5+lYWbWHUrjmieD1ydLva/SxWZ2oMbAWrF
         cqyrXQbZlNG6cv3wGkjgbEcSgT5/arsXo3LfMIMZK5D+UPQgu2+jWa21uXPXSQkbr9hE
         0Pq7rA9dxhHlE9T2kkTHlP2KXB6b8j3UpuL8unygeZUdGhUwGFOBaGstM5Lfu/PEGf8w
         AbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111694; x=1794716494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=;
        b=QlPZJDP/UyV4Lh+IhYCosz3NmESAoS2YjH84AgrBcuztFDr6WkH7sCfP4TbVssMAnm
         tUPRfXRr3MKp1FXKsXRDIi747RoO0nZhbTU9uUEj8ke1NbrNLGAI/vMmkWhVp3lK2gXm
         xZEraHjOjGMPN0YwEqmSsOeAz+GlVe8d+Oi7P5mIJIeDR8dXkXNI0+rzodaGmNi88+Wh
         HwMkIJIQ0FC7LCxtahJ56urc7Bpy+13OfuDHfs5yub0RBmw4Dik8ErRzIqF75iuA0Mkq
         sM9EfQGu3yobYwwg3EPqBxXCCZUj5Y1HccHr0kNe98asbbkTnVDc6EyCW+2LnPu1vw+I
         XGkw==
X-Gm-Message-State: APuU4Z8SJNe0m1fgZ44Z8MPtvokP+XOMIoUm+0qGLlTls5SqiFZJIt8J
	fRHYWc5eGrrRm2RHmrzsQTOdM5czhzA/FvSilq10JUQJFN7LHVk3qJobP+M7dOcUEVP8z75zTZ1
	y5qYWnEg3mFLeoDsCuhJKxkHKFb72oToP+COh4+8K8M53L1YiCMpH9oeE1FW0zx6snzg=
X-Gm-Gg: AYBFou1Dre9jhI82HchimdcvNJomNEI6tmpajGoPpMxNfcqRuYOb+Qt6KctLSh6G8SS
	MZUjp5QCVn0BuLgKdxhJAbFL+FJYawuVldW9/XwFql2v5WNQtj4U3PngDbWPSZhFGdr0G8NigHQ
	bI5cfHhYdAOYNzu7e87fbKrWt+P2/2TYKLHdDtp7dMY2V6kaqAmwRPU/vqcqBXdjs6n8j7rNE0n
	81oFOwJfViBpuWgi+NoOgYAckE9WZBbz5TfGULLrEddYuaitVVbMYH4PQ8EwWBJxSAaRqs1A3YD
	q702IL6vUC5ExLiFKbH4NOihI2fPjp8FYnseNkhDB6b7d6wPLiPGeh7jq7ZU7hw42UDIeEqfAGR
	H9FvfulDcoa7UqrwDSarWswf7IdEyPsX7PxuzbOpbu4y9MFQJqbH1BiKmF0HijcYpYS4FAqvnVi
	tX/LVFqF9PWYfktY8=
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id 5a478bee46e88-37256614c62mr1597395eec.8.1794111694359;
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id 5a478bee46e88-37256614c62mr1597351eec.8.1794111693685;
        Sat, 07 Nov 2026 20:21:33 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:33 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:03 +0000
Subject: [PATCH 2/4] checkpatch: don't stop at the first non-patch input
 with --no-patch
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-2-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1135;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=0zU7gHyftVtbcfHIxFLj0uscADSYbqG5RMY6rYmlFnM=;
 b=0QbJ0TTNTYpa3sJbEj7jebrwoSYtcaEw7U+s9tFSECGdc2a9sVuiRgsQc3Hud/ZcLgbwYdvG6
 56xrbwS4NyFAEuQ56sJ1TNB7k0pu6KEemSpK/yoSNWg6aLAu5cyMWXQ
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX2G6JehxECBsH
 DWL/+nVnDuG2hXi8MN8TgY7Gr9N7A3fD/uCYJ86UklOHl3JyCePac//FSwhwBs99GVhgl36JRfD
 65fnTdYva/Z5mOCfE1C99daJB8SXOZOwPLyAz/cczMx6KTk+KMFRh4huAeLcG0ThonmV3qqzKTx
 EEBq7JvNo97inkLeG1RTx335UvYtWgZ3QnVl7x2KmIXqZIQnrvVvaBMzMAZFHQpvulZCobyLaPf
 ODYM46gbQgQ4NnZd+TcW/dgfRpPoKdQp0ql6c/C6a/oKf0FTxu9x/gIr/+PG3FlwvL/CGbKY3br
 EOZsFO8k6gPAKzKRdrS2bmkXpRliL+drVc/WByEM50+/BBhqr9XyTsbpHSA0GdzkW0DoF7mV9wo
 ria0cR2DBCSAimRISOLCGQijuQz8BArMBYsvqm44Y7r/HCmG/gFMiifIIVCRvV/ibllPzkaofhe
 dxjPHRRzS1LbCG1woVg==
X-Proofpoint-GUID: p4WLmMzA5dNar_-m4PbDt7INetYJDgMS
X-Authority-Analysis: v=2.4 cv=IJGXmQvG c=1 sm=1 tr=0 ts=6aeff8cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sgsBsH1kTYZblYGAWkgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: p4WLmMzA5dNar_-m4PbDt7INetYJDgMS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfXyPazdJmrxUy0
 znYRJt12vQCZJ8OUtVwi6P0knKvAzPqTJu3PC85GqTtgGa+DbX+Myfa9nU38u1evMzyv5hfnEoN
 nBo1QUBWTf7G/7DF+cz13cDhxjUdqL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When checkpatch is given multiple inputs with --no-patch, process()
calls exit(0) as soon as it encounters an input that isn't a patch.
The remaining inputs are never checked, and the run is reported as
successful even if later inputs contain errors or warnings.

E.g. with a non-patch file followed by a patch with a bogus Fixes: tag:

  $ ./scripts/checkpatch.pl -q --terse --no-patch notes.txt bad.patch
  $ echo $?
  0

Return from process() instead, so the non-patch input is still
silently skipped while the remaining inputs are checked.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e84bb4c12eb4..45279c17f70a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7886,7 +7886,7 @@ sub process {
 	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
-		exit(0);
+		return 1;
 	}
 
 	if (!$is_patch && $filename !~ /cover-letter\.patch$/) {

-- 
2.55.0

