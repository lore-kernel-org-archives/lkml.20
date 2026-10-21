Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558611;
	b=A9HStvDjKCfRyER0hviIR/8ERdt31vXdQ+UOWmJfWCiYjrRrKowjwubN+zbeXy5k2htL
	 d8my0OsMppdlzyIWWZ7Sihl9BQl+esXO1gV/czOLg8TLMor7FqodhLl43HFLI4bD9VGrt
	 lvRDh1hAOFQ+iWttbIY2lIvKMTj7mCUVdIL4+xJP31CmnI345LjQK6bfY+mC7Hw1JvpVd
	 yQI9aG3KCE3gi7lChctAiqf9EbHYk3LF228FzGyp50VWeibXrmOrkyt7ba39CDiIyg6fd
	 /mM5HDHXViVckdo3qrD/q/dhkKxSgfIpYL3/RiAgeI8zQ7qK6m7yN6TqcN1M0dHt2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
	b=bNJIaylrz4dbu0DbCgOawxyBQ5p3CAHa9DTfvBdtsxVLKfbCLjnBKn1rMlaNw708twBx
	 HsXR/5pN251O7xQi0Oz/K0nJ5DaWpA3TqEtjmPc9GEKAqQhpv+oW0LTH0tve4rlcgBmpg
	 cRoSvkCrm4cWFsy8dXHSwnq8YvELOcjrIjsQDd76MIP0Mm9QR0vaP5jVOk8BZt0Mc2eCO
	 vedgdaqpsXJfeoMvUNq+jwCMIBXbKLzc6CqGYGZVc6eoSAQ8BPYQTwJIUFR9AdhlytExq
	 hggzXXl211G6mQJxDijPu6nP5yk9OUn5Nh+SHpBN+pqRbaSsu/Ss92wZC/ELvq7X47A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9hpyqMX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clbBynL1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21874606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21874606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9hpyqMX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clbBynL1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FC503116248
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7eU+9UKpstYUUXcA0ZzkT/
	1ibGlLMaGdIyWkm2MNBlQ=; b=h9hpyqMXMIde5aLNxYKXrZM4yuOzilQU3DH2a1
	6EFSwk8BRFLrb6GS8utgZCbKHz/J/qNvL7nreoOl37FSuQRVCaqVpUWsH8SlR5kI
	AR/wuhg7R8CccOpDcZSAPFjQk1i3Xnt/LOEaTiTo3xjAeLDhoT+Xo4XUyrnr361i
	qvJN2mzDFq/Ekgts2AD1TEO0U9Xjo2+bEUNviPmhbnZhETcj2Cpplb2NtLdmVtcu
	u3Ur5UW3e9FquocpbD4AVHtNqkx8LJ48Hj8bjCMIsABV5PhXuIW9CnKkRy4VqWxN
	GArZoUqcYwemiIaVfWGYmubfLEXLIHjWHXP78MfhjI6EYLsw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9ht1fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:56:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-18eb2616974so549090c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792558608; x=1793163408; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
        b=clbBynL1U88ui2CYGCj1ijRhexIWau5T+Gp30UH3eNOuVTtumMZV7hbGecjuTdBEWa
         ds0VFc4CWKjGo7dEm9vheuS1MIfoOWvZ6vEINUTbWWnhoVe2GP/pXny+H5TpDQm0fnqs
         KYLW83Az5e7LBzWqy11zFvueeA2pLvg7tMqhLFecQi+c+7msIKCaoEyxplAFzz58fMIb
         o8yNgPttCUPMwiOF8ggs27BWCK8oGyO2mL4V90VdgS+zY5rDm2JrT66QnC8mo9IVRiXw
         uu/MuQfh7BXANboqDZy+1pKs2RHfhlBunV/BLldYJzPcD+t8E0mzVCIUfaePWfNNhWBD
         9nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558608; x=1793163408;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
        b=EPRQPV3cfXIkb7vffMv45RvVRR/ZC+Ap8AhsYkClBYT9ODRkFGO2KAC57t0Z/GI/0V
         AovgHGx89yEt8BRnB7ev8SoQIQn0OlzyRs2STCbo6SdMkozpxhGNPoEcSa9hLq9mtI+m
         vrXwz6EsiujmPkRqv9VIdJHUGhFJnyfN0YIJUlt9dEksh23SmzDrXr+1dLhyj9MMhXui
         VldU5cgZHqMO8Xz12BGJavsNcD+N6fdG4mZ31c01w1nmcnxE9y1d2JMeSMHI4tlVpOOX
         SDm5d5yPfuLpAmvuCKLSAGKKPfQeFTLb2UZsO/D2+qbPw+n6D6rRcM5R2JhK7FpIrVNQ
         e59A==
X-Forwarded-Encrypted: i=1; AKwUvBxLEjg+4NP3WDVq8VT/vlkJyg+TF0PutZBCkZ2mQk6kWbpjv4sRK8HhbsG2dIKyzc0sy908hYLFuO4GpWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFaZ+mEV+ugFIRlTlVQ5e/rkkXfJJfXyqsZjJuxBCbf3oyseLj
	VOSexgBVSPPhguURaHcRmbmGFklS0BBNRKiOnY8j4aFC3X0jAc2zLOfn1tcu3/RFg5MuU+jQzSN
	6qUwOIMH317YYVBdtzFTk4yYx6shopyHC4BukjAd5q+d5Rz9ZsbLj0Qepe5NlEPH0upM=
X-Gm-Gg: AYBFou1xvyqJod+2PLBE9UDAbf7Tjqv7UDNmI0WGI80/cuxz5a0XNlCLspYISDQV0i3
	eudvo1pKDsBLm+2d3rsgcyrEd6KdddmaidYtA7mJano7Vv8UTOOJW5PLwccwpkpoQgTuvNoYUqE
	wyU//QMNpenObLBFy7C6T3qU4oyysvnPz1rB3LZHnRl9MDZ3XKICKPbxWdRcL75g+w8auSl2xUq
	+2zJBeaOmLIqRJVcBdksevoCxfqER0Y3tUauZgtSpufph6zT/87iezq5Vxfyc0lgxFGHeHfY2AJ
	pQaYy2QB41+Bc8vpdS2tShV/KroquznRp89AgeeOP6ATVZSWzBZDLN6T8fr0NWgJdKlNlyo81Cu
	Wr7L0UVtNLC9h4UOo6V1vCSZG8Didpwk=
X-Received: by 2002:a05:701a:c90a:b0:152:92c6:8b58 with SMTP id a92af1059eb24-190a6adaa1emr1087599c88.35.1792558607752;
        Tue, 20 Oct 2026 21:56:47 -0700 (PDT)
X-Received: by 2002:a05:701a:c90a:b0:152:92c6:8b58 with SMTP id a92af1059eb24-190a6adaa1emr1087567c88.35.1792558607170;
        Tue, 20 Oct 2026 21:56:47 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm3149280c88.8.2026.10.20.21.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:56:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:26:41 +0530
Subject: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
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
Message-Id: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAhG2GoC/2WMQQ7CIBBFr9LMWhoYrUpX3sN00eJUiBYqo0TTc
 HexWzc/eT8vbwGm6IihrRaIlBy74AvgpgJje38l4S6FASXupUYUNz+LaMUgtRw1GdUcEIo8Rxr
 dew2du8LW8TPEz9pN6vf+JZISSmwbQj0ouTtKfQrM9ePV302YproMdDnnLzIvTo2jAAAA
X-Change-ID: 20260922-knp-rh-b090f9ec1572
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792558602; l=1627;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=g7PmCw+MropldZsXCylYqSjzw6KcxByQJbN1pb6h64A=;
 b=0xXacu5E7uFMoh9mM6MSJbOYT6ty1oNvnKT8vUy+qPJHOcrgcESf6ys+BSbHv6HRsDNGTANUp
 Cdh8hsFnRR/C58/ED3GpJVJ/Z17lFpcJv1iydo/W4YrOyDJkMAX9etA
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad84610 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eaQUxe-TdNk2Jkw2ZF8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxOSBTYWx0ZWRfX/KcpoCc3Dtuz
 YwtRxLVdJQhfaI+zOZZNRN0UV7O8LrIOLsOtdPEjbvY+9ajFmKp2yjWlNKOX73yTJ9leYpu5a8S
 CiLi+p4xC1PxZwSNlslJuBlwoovkm3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxOSBTYWx0ZWRfXztDVBZl0LHAb
 2yHWTSzluwypP1SCU4Hzsn1EsouzcS3voz/fD0PUVLEVmY04IYdCNyik3lmzhXDFrEHSb0gsBeL
 XnJ461kH3G4dxmX/lzClEH0g8B/n0kqBHcbOhSI11yYqeZ0Tp7ddyerwvkuMyGdvSpadSG5wEoF
 5qSoveZFzvwlbs/W4siXjrLjYGhvRKs8lIvnFDKz2/HIW4WLBj0sD0siQWA5l92nS5hQH1Ou/Ky
 Ug22imQtXSqWBWeHBglQHl6vophEUu0ejCMAD4Qg/1f9Zar8NPXeCboRKsUgYydym8V+XL9T0b7
 tWvbFUF1mEei0Oi2wiN4b0hkWVcEeNF+88m1964viMHASsPyY9k+efr3rBLRXkyvaKZQBIrcbph
 NWKdZ1ieE+O/IOyf1gYK6MntczwT/TAwjpBsmu6YLJkEwvEwDO+C6gipRvpEJV3bbiI90pdbf57
 qn10J3BKYkPVJ/Is77w==
X-Proofpoint-GUID: rtAhmUjecFh8YQ1Bc0EQ582smlLRe0Ml
X-Proofpoint-ORIG-GUID: rtAhmUjecFh8YQ1Bc0EQ582smlLRe0Ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210019

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Make the audio PD remote heap no-map.
- Link to v1: https://lore.kernel.org/r/20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..8a1b53e9f73b 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2755,6 +2763,9 @@ fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-knp-rh-b090f9ec1572

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

