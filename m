Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428391;
	b=TmwrBALXoUBXk4gSgwGMVCcyiS91MXXclFJRyjFLfPeFthLbg6UUR6kGFFqVXp/FUjCS
	 yW6iQ5WGzmSq5u9+dz2NuuFzoMJUIVvWB0arIrGNXJQJ2+5NQK7FGh2LSOd5/xnZ43wxD
	 RHb2guB75UQae6ijZE6iuw3beE/ASZVtr+O8+O+9bAAHdjKlG0e/iVnJZp2U6ksDryvhH
	 3eCYmtkB2zBUy0cyuHbi7QPXXBKLUTV57GHWFBxi2lbcz+fjaH53swiAoUoLI/3xdA0c/
	 ilEDH/l+wFW4JPYY5FkoIEWxe3mBSJ1RYnabQwwSErBnD+b1YxvL0xFrH445HZXnBaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
	b=wwsoTNHKVLo4dBg4P/KXeY5qDRM2DfnRjpCtdKXZ52aruzVdhBZpFQ8EDtKIck0xhQYZ
	 t9iLpNSbEEZ80YMPvsQ5SkdBsEvvHynvJ78GHnurfDMs8HH3t/Q30nj3tfKVqJSNhHppT
	 eQgdTslTU88/2dR8cL0G/cHvJzunq6AwxoQ2WO1eGeJoDVwEgdlFs4cnlNp6gTov7ZvFO
	 3tyfV+WTF1IvTJcKMTpKFrmq06DIYCXOr1fT/GpMs74gecbnOud75LYQD4mSLy2Jt/jrF
	 mE/uvla29gqZ1a550ZrJjbUhlBdQix+oV9oIHGUCHZ+sNFrEyJN/FABvaU/iI4eVY2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHblxKLu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YG8G0qC9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F96606A323
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F96606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHblxKLu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YG8G0qC9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFP5ln2091659
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=; b=OHblxKLuoJZiKego
	b6u5LdtXg2slRe2xQKarFPnSxTXwXz9egl0tAR3lI+Gx3B445FqzUg7RvGZAGNOA
	pD0ScUHX+HVhIl9/qD9WHfK/z2UDfSqAn0I7R099U8At9TCdpLixL/KmHhfTqq7e
	LL3N4/90aA9WnIwiJe+PThZky/M+DQ2X8X1ImD2RrIVdqmjse6JvBmoDdDBNQmqE
	olCEe0aQ1x9hscjd3TItsdGS3uJUjHvrlW5KKJL6v6PcSnABceKCaQ+P1FDnubHq
	pfvVwYIRYNBmGdsdqcdvgCfb/yDM2rqdyYbvoTBi2TG6/0srXaloooRJhSzopW01
	8w3hLw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5ca7hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso3680344c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428389; x=1793033189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
        b=YG8G0qC9DwZDSEvhCEKFe8Ne/5i1RWpow/o4gHr0D7O7ItNkbo+MOTs6mbWIsCFngB
         aXQqvt0rbWM83YKhNQ+pNIhk42Xd++x+P79dsOLr08CrwTBu/Bzl7PjeSnfbvFivmd8o
         EjquD/YczqIrfd5ntHjIbHySxBNoZ8fri073KnRUevBnnaa2kB+EzgA7ZfRlc0dDBCv6
         bKHKizx5l+5hnu4HmUwNMbJ29AL0Y0I+wxu3j23KtppTPkeXT+Jt7GiflU08tLg/XkbK
         ulSsA/svrh32i3yl4CMccCahU6yhnSMwwBVelzBpN1TrO3yxf5ncR1WgBQIKMdqgSg6n
         Z6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428389; x=1793033189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
        b=VrLxARQJZdlJI4EM3owJVlc6w3AGv8HfFFiE7kIYMXMnzRNzVJISwO0xTQgjeX7Ubf
         jL0rdVeDNMlpvfRqYPTph6iCdy1frIu6csq4hLU0Vq2S5R5imgxQuquy3c53Y++XWws8
         9xd5HwbeTHw+j/x5Y9WVtSUC5Bwh6f2YSsfZYs+olEkdIeU4TK9UjvYF1tiFzb4LyaCi
         OS+HCHsBD8UAVpGtqFP95MLqFN+A28B5scQixVR6/TainmGCqYcyYP4fEyWCevo51pza
         t1jCPCW2qqZGgMYzvSddbMPSMgrLl/Vj0CCBrj6fVpnhoaES0vKq2pMUGpEvCrRt+toK
         iIag==
X-Forwarded-Encrypted: i=1; AKwUvByHlCNLbpSqyZ9+/rIBWRvL1TlwfElsxrOkUMr9jQPb5cAx4gnRptAePpGXPaj1gOFbYZD3t0BuQtUIvHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9iPtbgJ4ZZ12oZBqK00MA85DlZQt+SDJ9tMH4XtLvqzMojYFr
	qg8ce8FSnsfE6a+sN6XbiBum10NgVkDKBaNu/shn5w6pe0jmeuSoJOrnsjou/yh4W7ek++aWC77
	0DpCM23glNF3qU8kgX58JDwluhOv1bmigIyxcvpWBmxezNHbd/rQunIrpqjmxBJkGrVY=
X-Gm-Gg: AYBFou3rxJYcx1buRKptEQop9yh9PUv0plEN+TSJ6XcPdy8Is81ZiCz/+P72hQw3+t+
	uX7HQVl6sW/f92AYc08QZfnT74SbmlRMntGcmemxJT4QL3PA4YQoQ3wTEj2gIY42yczrH2W0l51
	gqP7sRV/n+cHXl0xSmruN0jIigL945BokOzuIUM7DyZDziQzAgRdSemseUHJwPbHmwnWYg8Cp4P
	qKsFjLACJCchqjTH3a2CS6/2kOeimWVy5XvLhkLhl/fkTf6xDNLw+KAOsrKs0E1o1vb4Tw0/jJu
	ycbH4anFpEjAAXAsJFmMH/p18njO7KefMek4dN0zy4dFaZy/uXWnhWn3mN93jhLOLaDjtqMe/jp
	GBxpTzxyMSVsQ6GzTfu4GpNMc7tSYdo+CFl5Ct9kZwd3py7qJ3ETonRD+iB1w2csEmSKe9D6c+0
	Mb3IQp5Xk3yFM09++ST+pu9u7YSAC4tN/WmLk=
X-Received: by 2002:a05:701b:290b:b0:158:7ea9:4a5c with SMTP id a92af1059eb24-185143509a6mr11591217c88.27.1792428388421;
        Mon, 19 Oct 2026 09:46:28 -0700 (PDT)
X-Received: by 2002:a05:701b:290b:b0:158:7ea9:4a5c with SMTP id a92af1059eb24-185143509a6mr11591181c88.27.1792428387663;
        Mon, 19 Oct 2026 09:46:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:16 +0530
Subject: [PATCH v3 1/3] dt-bindings: sram: Document IMEM found in
 Qualcomm's IPQ9574 and IPQ5332
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
Message-Id: <20261019-imem_restart_reason-v3-1-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX/5biVMzFzR8w
 uyZRjX669IAv9LkKtbdG2myAYFJkyJk28AOH6XQGIXFNuoUxLmy0XDmIqFBSW3OZByiBcOBoZod
 E/aNtOX6gpflkSw7aZHi6WHd3zj0I2A=
X-Proofpoint-ORIG-GUID: zoobsAv-UAxxZo6sl30_BupmlYr8krjL
X-Proofpoint-GUID: zoobsAv-UAxxZo6sl30_BupmlYr8krjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX5ccOj35/SMi7
 3ViJi6rMT4cM6I2YJgdYdjydrQZ3h5JTla/zWUWZwQ1M7Ok2jIL4ComrAJoJsgrLfXvz7XF7BPW
 Kqh9Wl1pQ6nbbuzLt1BR9bY0awofGngRX+rcTdhgnRtCAWia04beVOudJOFJEJ78WJQCm24hpXw
 ni+w3RfJ6VE1fl81Q02iGpgf7izlCAfLemHNtI7gKbrqJkOYlSnpwhfEnRmw5MLNgjrY+r3qK7X
 P2rj+4j3VswOomzlRXVByCK1DCfqN0I6Kv5u065geYg6G/7mtDqiH7tvVwgYR4ahxFgwxx9XlAs
 9RdtX4i0dkLl6qiOObGQ9wu7Q1EA1HqZUacN2EN+jdgnNk2SvxMSSlCVAbsupfhR8FAbp+GoTXw
 sH6OMBCI2uLkn6V/kGWXtdxuhhD5ccjFEYmpBvfzXL5Pu635iOEkPQTFy89u4iC8ogkfzlub05r
 La0uyIFeW7jWbuAOKyg==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad64965 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190066

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

