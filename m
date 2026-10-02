Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8548125B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946200; cv=none; b=t/5wIOkm8p+3IaHLgCvU5KwG0eqY1bCnJQPUve2cclYUL5rWawNOScUjvmJUFxY4WEZRBflv55Gftc7BCgu7BKma7vTfg8/oxLhxdrgXUzzC2Cbs3rDaH/jzyn6xPfQ3gQXIMb9/1j/B/HgYMfG/UOQJOGSMEwy6HDQR+8Q7Eko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946200; c=relaxed/simple;
	bh=GznQWXxSPAllIQPCRhHQgwUrw/Nqi/4iAERI4dM9788=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SC3FY6gKADVZiBxtV5U8DxTejme3lUaGqQszzV0FNG4KrbPE52T067PcUnj9m8OogU0kFYgBNVl/qkMfq45e+c2BojJNEOqu9iEK6bkxWzUxNbEwdbSmt0Y3BCUwTTdV3UJDLmkornt399urgxRcavqE0/5IlXFxwAYKaNlissk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iw7Uws8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGzJ7xjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iw7Uws8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGzJ7xjP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nVEg960550
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 13:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvHgyI/vDTc9VeLULZwinY2vkdB0hcnz9EFHVlYGik4=; b=iw7Uws8WQRVZXGf6
	GAL2QfK3ypCOQ5GIDIQFsLqDpe9shig1a0K681F3bTD2sYiuoiBY0X9RU80C2K7E
	hwSOve5OTUDX+ZFcb4pELWZOKhFRcu2zVtigj8tRg8m+SWNKx/es6TN61chjs5aR
	6gmixtloHFknIeDWy5uwWfHN2itixHSQf0X4QvXuJGIQOCnOpCstIgSMTNfySlc1
	gD/SS2pZOr16Wxch5S9E7mFo0553J3GWL4PZ6yTxmNS0IfxblBKuXfSpBip4runh
	ZGre/y09m03S4hKh0q3zQCMql7SCtYf6EKG4Nb++nOlBR0AoWCCj14EpjSwGQh3P
	W4KzPw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcmgsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:03:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510a481ae9so371038eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946194; x=1791550994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvHgyI/vDTc9VeLULZwinY2vkdB0hcnz9EFHVlYGik4=;
        b=fGzJ7xjP5VcTT5g0mTvGnCwcWXvXW6e0e4qprG+Y+6HSQQmiiviuLAQ22jruvMIBze
         +7SkH0R30Zc1o8KrfG+2/0/foZCH0FFWNmn5g6IaD6taTJl9Y6JdJKFlrj0yfaRhpUFY
         Jat0UMyu2FAGJNuXpy+HIhGc8fCc94q2wx2CS1PfxS7JpnMObHOMt6zeP4vN3gbvpF3M
         27R+jpYjtIXxi9JPB43Ho83So2JguBWgW31aZmqhPiIa0ZNOHJFh1AOzCzW6WEFJjtDF
         2Joy5YfezhAh9+iQlcLc1Zop2DaBFYMndZ3X76lOI8VkB7l3rJ4v1qB3LtXjsG0aYqoQ
         njkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946194; x=1791550994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvHgyI/vDTc9VeLULZwinY2vkdB0hcnz9EFHVlYGik4=;
        b=BQUlZ0VVNrbuCdCd0pEeAgn9qHkunaRJ1ORUexxwbKs8muKF1DLu6RqmHdzAEr4uYO
         HFPMLFdWuyXIWRG0jDTF4mRHlrCaRqnHDr1taJV3sjaMz6DyFIIzRr06ADfpHwNrzDnR
         BpV7PoTci+urobLxP69GEN6AaMZmcX/bnaJ9TLyMKbRIAaKd7Bc3vaS+ZIR1vGCTpvvw
         j2VEmpYjpPquEpt/Yaqo+EhnLYPqV/NtYYQUWEMXUWv/zwywpReGU9p6qSx+rDzq+0SC
         10QknAfCc5zsOZv/tJJfuxt/t9Qmvd5nMTHsXt+8Tz7R+3o7T8BG9i+d1vo3cc6MzvrO
         gbWg==
X-Forwarded-Encrypted: i=1; AKwUvBxZXQorIAL0qP7IQGnTT/JzF0p0uNUC764SqAhpLGjOh5MN4IOgwthcW6/nnJOMgkEfZQXGmisKDAcmer8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw93T+Im2Cvct4B7OE6U8AxwdpvqMmlZaEi+JS8as9pwUsfl5U
	EG3gtoK3BHXxjh7B1edBtqBI/HsMtHI0+7WJFxjN1zKZIApGx1UdMjYGpLkxWYgEdC9FS/L0jbi
	TLgBWEMFgqmCOXaxl1j46Kuz+iumkjb10LeY8GUOCLhJD5vBZFvLFCV2VSAIbVXJHqe8=
X-Gm-Gg: AYBFou3oFPESwgu2oq9kSKrQfa8ytyqZ5e7P+wju5JdEh9twXrIV3fbdzFGUTxN4TH3
	p1KLqTZ0BzzlEjkTAXdJ3/YsfCeJeN3pVuoDIZaAV7c8HFv4s0/N500sujHMfHai6x6LObtNMbr
	WxNzncidhV1H4XsNSOccCV90/vKmNUGhLZ4Be7iUntl1lH/M5NEZfMBi8UtplqH/hl8cw5Rh2oE
	e/4IR4aYnrpYT48RNIkQktXHt3qrcI3piCZWdV4ssJRquTAWHRq11nC4YV9n6j0HGdl/FB21i12
	jeSOvuC65+gx5WCpFvJU8yzEyN2h9zp59rIf+5PcZfqKXoCFk/fLLERhJL1DhxSPnC81CeKAyOf
	9Jh3fPkt0xln2nGAtD9rYRt1Z/wG15HB/24V05DQbLJLWueOOR0dQBtBWQeufHwSojRvAYbTMB6
	439tLbDCCMgRfLrdLWj9bFL4Vt5Q9OBblWoA==
X-Received: by 2002:a05:693c:6391:10b0:34e:7f9a:c722 with SMTP id 5a478bee46e88-34f218665camr2857290eec.34.1790946193818;
        Fri, 02 Oct 2026 06:03:13 -0700 (PDT)
X-Received: by 2002:a05:693c:6391:10b0:34e:7f9a:c722 with SMTP id 5a478bee46e88-34f218665camr2857236eec.34.1790946192896;
        Fri, 02 Oct 2026 06:03:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:02 +0530
Subject: [PATCH v2 1/5] dt-bindings: sram: Document IMEM found in
 Qualcomm's IPQ9574 and IPQ5332
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-1-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: _MGyv_E-RB-SmdtNuRqsaeGMhGFLVYdo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX9jh8UofvrVCU
 aBqmbfW4OPnJ0LGmE0nK+GmjtbWhniMybudMXT+Cw1Zqp022VxedqXT96vhJmogU01EgxblIPfz
 e2UkKRiHdaqfQ2QXWoCweCnvJGI7LS8=
X-Proofpoint-GUID: _MGyv_E-RB-SmdtNuRqsaeGMhGFLVYdo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXwd//wfJ0s44k
 Yn/spLiAiHfal/fAb/Lu+lEbaiXuRjAtsGz1qpSdfgr0o+Yo822w+ZUBVPWpkysV8VG74HyoTTL
 c6gMbN5PEEhLRpsgJRYqXiSXaCWL1xh/fInu/D55Up93fFuLM65qWhfQKkXKz+L35hn+pfzlwYP
 lyO38//aBQfsu2iFBfZrvM5uvtB5nxbruswHDbspi1HhHmAGUng4/vi3vSe7L8x268u9e7QwidR
 nQ5GLsgJ44Me0RavhP8vtasJF4A07JC84YODWxI5nJXp8Xbdgxo5mGherjcJrje6RHPWkuqSzfU
 EUhk/hnUzaDlCbbwxMhsGpeefUFsp13MAuZL76o20MHR0r+2TO9j899KEkrGnIQh33m47LuGgfC
 0uEhhbrlHm3TIz8rODqdZXIqBtq9oa6TK0epeCpVndyELzxnPIBwuis2ZmwFt88p7biLlfvblT7
 NEFpdPT8jXZodfkKysA==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abfab92 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b1464722..b09a70b3d576 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,7 +37,9 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq5332-imem
         - qcom,ipq5424-imem
+        - qcom,ipq9574-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem
         - qcom,milos-imem

-- 
2.34.1

