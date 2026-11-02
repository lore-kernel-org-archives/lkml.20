Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621879;
	b=mIU4cxBfq2NAz30tRvwl0ar64seerNPP6YwxGv+gqZ1LkgZNJaosWSgl4PpNe48eYZkC
	 sotSTtOG2gQcOm6RsyF2ouq+MlT6mzj/KDAun61DXP2oQocWM1doRjFWqFU9n/kBceJ5B
	 MPFqDA1tSuR4+6rs8Mgbc4bdxai4tg1gZGDKlvgbPIOMdFliQ7cgcQFCGUsdAHmXGJlsf
	 WtBPS05vAVDNH29JUvGnpL/p7cIoYKcN3yfvGIn+3ohTN0Ju0xbo3nvajTKq6qPv4Stas
	 Bef1L8uMaASnRsbVQgyc0XGaF55lPgAlxLJOoIwMDzQAxj/he8T/5Qg1cp3KCQEDhKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
	b=BOjCZXrAiM0IW+L7A4uMkqUmNdCnJQyEDifEjZj/39mqpeSf3KEJzEcf33EPhaxo1EFg
	 feY/xK86e2dfpJ7B9Nh16adf/RapeNd68i5H9p3KaiuPGBwEBQuud4ogPfcAWuV/U/Hn/
	 wBs8igtreewopu11HSJNP8aPnj/iXbWhdHWd434c34HPJo5VoMorTvdI/Zywfo67GRdly
	 Gnyb1gnUgJopNQfZOtGf3391qIdjoiddj8MOuIH3xf0nGFU2JLzo4qBo+rfIO+W/95L+l
	 hOr43K55aTtxr9xmN2SsyI9MLfsiVlC7dSWW9lzMl6cAeDQ+AA+0uImQgxUpceIV0Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Lq7Ly5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZwpU0+u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830C5606A84D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830C5606A84D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Lq7Ly5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZwpU0+u
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOc33086530
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WrbMrv0h6y/iikQNp1GRWO
	4ASKxkJC9TURHwVPkxEk4=; b=U5Lq7Ly5xFxWL+cIljkjN98MuEPW78NYsmnZI3
	/M4LbzRAdAmfrwX39Bqpi7dSRQZHF8EA/aoYH+iJ7LcBZYSih4gNjF4jIWtTrLEk
	ZgVLWK3CN6F+4CePanIodAtSRmu/Vj+BXjzgZAqGrbqK+yyiqGMzrs/6HMuljmKb
	fwyWWpN7Zlo9ojzSabjOmPlRFI3fcTPe56vs4sx2SSIbpMYzWwovy+LxEcLJwd6/
	vV7BT2Cg/sqjuXQLudP1HC1PtoNa4GwxDzUpBQsz3Pq4a/oO2ppfyQcbshbucGV0
	KUJxftfWBFbsfTcQfWe0TG4Jg7nsBCNNYU5Z+VUZ9H9Jou/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61ra2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:17:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so539014785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621877; x=1794226677; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
        b=KZwpU0+uG7NLMrYJ7o8HkUC8WeqsWOkW7kj9pdvolC0paxnsxI33UFVkldRFGt+li9
         V8ww8HZO/XgZ/u3EaFxjbFsCG2drGyu8CgWp/ylXr0tdzZBpSxB2S+ealRRzsV9Ymyzo
         r7B5hl2xIMVeBcVnvjlq384PwbyNogUbyqpOcsYyikEGOCgkN3h5mp+TVldqyPqV1EKq
         ZKermpMv/eusYZPfhVKPqEU7wVVyU3/BFcgLlT5LQMdI7ZRQDR3V7Dlmzf0odMe8qeAI
         SxEkK6q7p2VR1K7npOw7ZGG4uPL4hTcJrf9bduBZIDZvAIuj69u2RTmczilEZqgYkdMm
         RnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621877; x=1794226677;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
        b=unMuFMZvq5KfitcRWSoZYMl1vm7Fj0ET+6w8e7cRCCKkk85TMIAumIQBlUWnfOZ1Mw
         N55F8KkZ9RVQS9briIhAFOnWqGdpQ5HMf5nu4PKP8kA/WNScnO9+dDQ1YxlsrErnADMf
         JpTVPxIFMTg3fhXSwDD/9aLq7aXl3swT2wz6cUXB+Vu6P+S8LtLMa0Mbfso9JH4Huz5Y
         eXCpxAbPCtVm83d76qvTEp7AuCJxDJXAuE3OdDWudQWmHvwE3Lpz9X7vx9kitZXhOyT3
         J6Apk+cdO26zZHBECqKcwHj3jbnUDb+n7gp2wMSgEeazXk5j7dQSUh+iA25H328IfFSH
         3WsA==
X-Forwarded-Encrypted: i=1; AKwUvByzl5GS+23I2/9T1d28YQh5nAL8Zoe4YC/bzbl61qEpOkWkenrlLwk7nQb2HbthlMPcAyj5OchR3NLkt3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV2s6UIIYLO64LmyQ9RR8xXO5IxdrhFD0seA0blOYWICLuhvx6
	7rS+1zseYRkiodADqXqSnXcgX3QK9dnRUB6qlAEyrKuVhdFh42+IN/Xu9X+aYt1x6TCiiQD/oC7
	PRXixAcKZqC/Gb4tyObHktwjgKO/JcqEeOQrWuSfrck+1n9rcvGdzwGZDT7Qq8NuIG08=
X-Gm-Gg: AYBFou2ZRm0Srhcuii0G1TcMciyxiapgqJv66GwS6CSBv+LGBVi+ChnKe5GN8EkXYMb
	WyQfQOr9DF5jMdq8V4jf/T9maEmUfCBDmKu5b079mgO1Qyr62mw6JGZyK7ya2KHP5r7ZoSC2dkk
	M8xDdFVOolAl40KDnNp3w+vjfxeIofpmUCUfvYKBvhewExB/AYDqZ534jAlUDa1YMYAV//HbII2
	yB/Tual0s4qYEB4hj7HLqOmvgUSJg6Tx+cTN0wj0xdeNKIdOBgEIFEO8LwxLMyPInw83GraF2wc
	wkV0/JwWDZP4AAewfz8Mbvoejppi9FS2T9MQ4GFCgPRRN+AXOA/N1UlEknQoxfdJmWuFMd1W3F4
	5J4Q5Z79SdIyzYs9/AxgQZD9zn37NJVfkalczFlGAwAxx1M/MCqOC3KXfGA==
X-Received: by 2002:a05:620a:a51c:b0:945:b967:475f with SMTP id af79cd13be357-945b967477fmr324820985a.16.1793621876723;
        Mon, 02 Nov 2026 04:17:56 -0800 (PST)
X-Received: by 2002:a05:620a:a51c:b0:945:b967:475f with SMTP id af79cd13be357-945b967477fmr324815685a.16.1793621875938;
        Mon, 02 Nov 2026 04:17:55 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm262583425e9.9.2026.11.02.04.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:17:55 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:17:52 +0200
Subject: [PATCH v5] arm64: dts: qcom: eliza: Add FastRPC support
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
Message-Id: <20261102-dts-qcom-eliza-add-fastrpc-v5-1-27ad8db4a47d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG9/6GoC/43PTU7DMBAF4KtUXjOVfxLXYcU9EIuxPaZGbdPYT
 gRUuTtOQZQFpWwsPevpm5kTy5QiZXa/OrFEU8yxP9TQ3q2Y2+LhmSD6mpnkUvONFOBLhsH1e6B
 dfEdA7yFgLunowHGjDRK6zgVWgWOiEF/P+OPTZ86jfSFXFvGrkWgY69RyqW1jLn16O680ieX3X
 9MnAQKcJdTGG+LCPvQ5r4cRd7W/X9eHLfokL2In9J+irGLXkt/wJgSpzRVRfYuC3xBVFRtSwWo
 lFefXdmx+iDeubhbRK2VU563F9hdxnucP/L/9QOgBAAA=
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6335;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MUaSkQuBi8mCm8TvMJjh5957pvL7KrOsrIXVhFbgVAs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H9x8+/TuHL1Ro9pQ8PZx69E8s6QXwzhH33cS
 jyfOfGm792JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh/cQAKCRAbX0TJAJUV
 VvHyD/4/9AwOUdNjYxXbMDUPI2rA8/gqPYDPUxPPnt4wIJY685BrDJugkqhLAsub/BKtc8UzLVU
 wLQ96uc5Sk6LrRBQ3d6zHAWfMgNgGyRHsMLqyBxInlGrz9+jKUZxtyQoGZH5A41BwGXL1YWSRoQ
 QvP4PHQrcuWWLqM1g+R/V1m+vsINLFeQ9I7+YWit3sQ394OL3Zav8OcfzYMp5xn5hmyllGZq53/
 J1U1ly9ZlCbqIC0vxH9PnVmVT0aSlyT59SWXwfe2TD0u79QY1X/4Gl73GFZvBayQ/5nKjfT2YQ8
 shg7yhp/sU8ntBdtPu3iODTR+9NvZmexXrPPS31OdTGVCRMWUpxNVlU/w8e+CXJRmkuuASZW2i3
 JsXfXaDCaOxRuUaqEgq7PxgQREuuKQ2Zi/fwR/YYinjyqRNuYSor7icjozhM45J2yUCOzutPgXu
 ANPVlQdA8ojZqGs8kReXAoiRtXr8d5kGUhS7RTnO0gU9y3qchmcbdniUnXe1yn/KA6s73aP1APL
 RcqfxaK0LhOXkt6ZJzkwiF9ENeQLfpb+yMQ4TMf7rNPcuccVtN51Z22OsBqyf8hBAEzrMXzqHfP
 bnud+oIfVRYmApMTsqDmd4+BTBaE190+oN4Bb7v/Ve2DDsvWMUhKJtrV0+0rTOGlbqZknMzs8WD
 r2WB+eLPUlAhJ9Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: jULBMTGa4jMdJ9qpuoxpsmWlexBpcUyK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX2/HgWW92XhuA
 prtFoVkiFIKwPmsPcQaGlI6yDNVu2vqaQgCbrXrk2pi4yntzYsKMRZwYToJ4r160qvfsintBufd
 vavZ4FDjRHCUPjG1nIRwHaReRvHbzUQ=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae87f75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=l4Guf6AkNLRG3ev-55kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX3mzfIvDHhL9A
 UQgMcc0HDsBhTFXpa+kBAjff/JEYiStBL8jQLto2xmuyQvL7a5NEAlcS2Kqk0kaHawkVoYbC1OA
 eRrklxCd4L5UZT4DIxlvfXzql8BJBZIPNoc+sW6syqDA3HtUVe2avaIPB0PxijzpNINS99KzH+c
 6Z2aeLU8ousymzxC3AWIkUZAZiSJOyvRpHB1gaGz/NmPTav2LMLnOGqFcH0RbAZg30XAystCjXQ
 Qc0xM0hy4gIcI1rNX4OI3YajxV49qfKOCWTK2mFwVybimLqO5suKwXBZqk26XBd79NxK9uMxk0j
 YTda5K9lN1E/9hzkQGVC+JvxLhT5iqxWJEcTzNLMsqAMqBwKvNuZ28YFy6HT1EduGtW0iK8Klry
 NXyyw3quwbjzK4CLvjKvG0w+Xs75QnlDYi7AqYDfod7t4idzmPARODMRHRGZ8uXfj7Zvaj6fu5F
 sn7Tz/QKVhTqa6fr4cg==
X-Proofpoint-GUID: jULBMTGa4jMdJ9qpuoxpsmWlexBpcUyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020048

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
the ADSP remote heap memory region needed by the Audio PD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v5:
- Rebase on v7.4-rc1.
- Link to v4: https://patch.msgid.link/20261021-dts-qcom-eliza-add-fastrpc-v4-1-4d33839dbba5@oss.qualcomm.com

Changes in v4:
- Fix the off-by-one in the remote heap alloc-ranges size so that
  0xffffffff is also a valid address (Konrad).
- Link to v3: https://patch.msgid.link/20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com

Changes in v3:
- Rebase onto next-20261015.
- Add the ADSP remote heap memory region (no-map) and VMIDs.
- Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1067 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com

Prepared with help from an LLM-based assistant.
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..93e922de53cb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -615,6 +616,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x180000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x1 0x00000000>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {
@@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4643,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  

Abel

