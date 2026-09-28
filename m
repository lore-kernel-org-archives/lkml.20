Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C63379C5A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565628; cv=none; b=Q1Z4FgL/nNIcyPd3vTR8DuVPBrTNgaLDkPRymnpB2vxGAu6s1dSYspT5j/eStPZSfDnqVzkVr5/YGrR3km8Wr/BS/MD2lzCXDNEHVqOmEErMcoXDKvhldqWizESHGIIvgtmZvXKIUwqNYScQYK32v4MMkKd/6hdO6i4LCZiVxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565628; c=relaxed/simple;
	bh=hhD/PLf1WNyf7Oqd7ppYYXw4cRp7PicoV7/GrXVlDSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svnjlh/LHAPJCdHCTReyHMszf+ijrNdTcFeUakeaipG6L9r1aTRM6bYnJ45+HFxupeykbnyiZObZdepY2n0Lehf2MGq2jGcDYxobqSyAPJIgATDDAKaN60XJp/wNKLLEcLWD+d27ATNHQxnMKMrPYnuEzux+72lp9ALHYmLshdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUwUuVpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gisk1DqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUwUuVpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gisk1DqG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S2DbBI1245918
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=; b=lUwUuVpoOvHJacgV
	rw/84A7U0jRHlBE9G30Mb9vROFTaFC58BsBnTzamA+nIywjyMBHV2/yae+WqBQDs
	NnrN36EiWKAZVUgww5mHrat7+ix8UFViQjAEQFpUawcp8DTCAecn5f3kmteJvB89
	S14sjahEhMif13nId1ldCl4pWxVJEtI7X4GeuntS1VH1IVwEeChdTea2boslCBFA
	axnfDWLgyk2wwlf7gGhEmvkOToFC73EljlHBx3KjnHYxK8UC74ERoOa7XTEufpul
	Vk6YttkFzMWS7YubA+o9rJgzNnhGTudzVvU1OkIX8orxf5+5J2MASiud8gvNF9uV
	3kcMbg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp4k9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4616046eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565625; x=1791170425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=;
        b=gisk1DqGj6iqDaRtryDBNy1XAfee/XQxrlMwgR0pWKxfzzKAIo8dICLqEjq2fz7Xyv
         nHQ4DWWk64BahOsC1BArqaKbjjj2NTfrYeTeFq9NkTDCQ/5rhc1y+vox8JldwftwbBFa
         TACIvtzNyfUuqJSCJReq9fpPwCNEGwBBTrYDrDFnKlsghkxaNOUveTYfywmWVJ599dG5
         LPDhPZbhAZ0eaqLfav9GfHeKBp9wHjMuGLJTXeEQ67Jr2+f54tyR0x8woay5d1RrK/p1
         DoTnabC3gPBVed4APhiIPpRAK/QszBHkxz7DFwi3Lwx6Q6nsizTYJL7k9Bue0ROjKmE8
         ORRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565625; x=1791170425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=;
        b=sQ9Di1mq63mmWD5Hzeez058aQKvAaPRiN/MezquegtNsCO7lalYlCxtJShB5FpL25n
         5QwxHoPJVM0eor96ygsKncTPKRjwyqVlOYGrRhhgi4aRDomXFTsNaCUr3jruDySPvpiC
         P1PmmZfBQYaz1s4W+xa8M2//QBra8QE9xaDcpHe2QzDEQkc0PVwTgvkm3kSDAlMggVCV
         ONjjbfYKN/1N1hTi1Ky3i/nmB5UU/9ZdQOXR+pI6Q8UbsO3jgvcjYlYDkZHHmJJC9aFb
         hr7yB/D8kg3kPkOTmToGJYlt5XbNQKChGHfDiS+OpVBd9lkBaBX4gDfnumX0iKgJTnW1
         qBNw==
X-Forwarded-Encrypted: i=1; AKwUvBydjSNLDcUQLqX7GpPpEuXtgtwcaUvhQ/8UdFYH/KjhZGdq//EhZzdia2qHVf6HWhtyYKhObyu2AYcJozU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyN9NJXNMirGGC0yCtv5oT8IJ8am/Fpj2YR7zIDXJc1icRzun6
	PTSxkKglYe7MWqyOVIOaa2GvYMaOXPJiIiV+HcQMsTGbzp0X8HEcWpCfObx0nH2EidOTeFKlVpr
	J6torPKAA0VVU0h0z/j8EJvlP1MCPkG59X/0VMNHZjD1lpcuggZWRTjgIgwZJH9fYCk0=
X-Gm-Gg: AYBFou1IRj2jo6pJV/6QProCu4tyQcuquy7bXfjWqpKenBkaA4LWCLTxKLjiEoRfnPj
	prTBfmJG5qvNIS1+6iAvEmNTi3JOrtmbZXka5jv5NUxINoOmAV8eu1a6+gdFzpyOjXju5gpkYwY
	/oZUL2NOni14phOHeUvAiiCweVhxCKN61ql6d0XdzXVJU3Ac0hqDbZ5fQBxKoQtNOS5MMBJwHvA
	CN9t+FqYEO1RomJqykV/EPOfGoMXdZjBt2DqhLxcwWZufQ5oO8HRcV4o6YWD7yfp+B72xN7K9n/
	bRrjBe9jIUBhiDQLzrTlHvxR2qemE2I4dV5VdE7fP98I5I+2A8J8EIbuI5uH5mD5Ap+wITJKOLG
	EmpiDaNL1rzqtC4h+Cd0agKOuYeyL3/9uGyW3mk9V4/2xgPNduFzD
X-Received: by 2002:a05:7022:7f19:b0:147:cd15:3e2 with SMTP id a92af1059eb24-147cd150a91mr6364657c88.4.1790565624737;
        Sun, 27 Sep 2026 20:20:24 -0700 (PDT)
X-Received: by 2002:a05:7022:7f19:b0:147:cd15:3e2 with SMTP id a92af1059eb24-147cd150a91mr6364636c88.4.1790565624179;
        Sun, 27 Sep 2026 20:20:24 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:23 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add Advantech SOM-DB5830
Date: Mon, 28 Sep 2026 11:18:48 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-1-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX3mgHDZGHEcGn
 gzeMv3Tz83GN2VsCRNtfhXLn2K1cFE+Fhd4yK+EPh3y1B8MpeSL3Z4bxcd13PiNQg61NT3q9hSY
 +Tz6zGSUQcRFXvAFq7897GdxU44u/8rXFXOJH3nElDn/mfQ3fGNQ/jNbDTXwLm43eoCyVUuuXiA
 O61GmjV2kqQYrNcurho3vgQqBiM5JDnjy4hqrkhOOMKJ8uZs/ELHse+8CHP6aq1SolhWuWsmvs8
 gJNx1k0lyH6TuFwPpD82hIhOfMBQlLyE8gP2Xwo/MmVZDHJmetmXm+LlgLCGx8Mob+UmRGoxgFK
 Qa7E7CIt6OwMj1ahCP9Pq69V7TlyArDvQS/5wAZJ8UarE9bfYLW/dCkxzlFmWRl2kCdp+slnN82
 e8e9vASoLarvvC2Rm6ToCLNRYpCh2Qo+KgctAJLBWLqJnVMyDUSwc15ArH0DStPTiDqhezzAsQB
 +gQmJqsU9pJkvvP/B0Q==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab9dcfa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JItYRnRW4wSoxD4qVAwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: YCIXcqPbwjvFeVaXjHGupc_DSG8poFyI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXwrW/zJsO53Ma
 Xw1Gz6BKdQLjgkX8S35bypllzMWmUx+K5oG7zIwTNV4z3WlHU75NgMIB69OjkTi7zPheJYAbd/a
 N2JNxHe0y04vMPNVYkxrFDLo3WRRW6I=
X-Proofpoint-ORIG-GUID: YCIXcqPbwjvFeVaXjHGupc_DSG8poFyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

Document the device tree binding for the Advantech SOM-DB5830 board based
on the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e6b123ad58c7..3ede967f23ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1239,6 +1239,13 @@ properties:
           - const: qcom,hamoa-iot-som
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - advantech,som-db5830
+          - const: advantech,som-6820
+          - const: qcom,iq-x7181-evk-som
+          - const: qcom,x1e80100
+
       - items:
           - const: microsoft,denali-oled
           - const: microsoft,denali

-- 
2.43.0
