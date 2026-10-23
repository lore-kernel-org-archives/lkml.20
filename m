Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775909;
	b=sKjrdgXoIi+8nb2nOpOuGdFh5eEaFL5C+FKFVtcYo5TEnRP0YPes+utYVl/SU3giG8x9
	 pbz+yym2nR2ZWW3y2JJ7o/oKsJfjYUBm1zDehDN9P+KCMGEHbbp0IUFwwLGYgHtLXrNm0
	 A0JIJDQP7F6eLqDITj6AkbFtryYBpX4fSbus7cdBZOlS80YqbZabSHiZgfwPXZGIt+7tC
	 C8V1+Sc7ZzSg33pVhPZmzeLw9dUk7stHCKzaOghod4Aro+BK/TQJMyOYZ+JG3xSSpuamT
	 KruCNwqHRHsu0ebvG9a9HwGDyUZ0n7z88Z7XIQH7YkOaJiDQJ7/26OLK1ZxuahgZFOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
	b=TT9qUPRcaWGi4eE6DivZEvH4TYcpbvbE9Csik8NWnIzlTRuwivqINq8kYwxdoZd8ilrW
	 +LJ1+hW58HdlU7zFqTC1I0gYqrwXEgS1bxMtyiY/qDKdMVLW7DiMSZtTH+cOV8ygt9NHx
	 3H7Gk33XAIclt/aVAQve+lBo+68bwIF+J3Gx6sLBtwyFQBLXIpiDw1mpN3ev0T9YxjUkt
	 yIovJFn/Gigs6FMAfo8LJ5IBVXmd/4VMiBMvE0traomhVIX5pL4QwTtUlZjKfrW3vgZNK
	 SR+xWjBQmybcpO1QD4r4QPDflpdU8yR15zxHqZN45n7VFiFpTwTyufI1CG3FDCM/dPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5CD60A3818
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5CD60A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG330A3734686
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cXMlmuKppBQ
	b2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=; b=i347DQ9x7D1UCl+LQHDGivzgiQu
	MebQJAqRBiZswZYniNcj5Zv8iP+HMpB7ZwWeb9iYxTazXB48fLHKix2u40Ycdhr6
	p7NSf3OornhiWcGJh4hl7ccTfWWxY7u7hLYeuECdkDdUWlh29adAJ5Ors3c8+4Fd
	ijeNd/z9urcNS2pNIuZDd8tFzJxj1PCDGDNfJsGhPpTUjwHXtddqnOsqGErtY/c0
	anDMxKUASWUX7PV5dXOl9MPxt2RFg0l0a7TMEn4RngvhSjlb5bJ7Wy7eNPVsLGVF
	ZeHqzXvKk2n7J/K+1B9sUfyjlk5unAfG9xxTthDq8F9xGvkMj3/1L2qR+8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c25513b2aso23591156d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775907; x=1793380707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=P1lKYjc3lw79SU5QhNz9T24PTWiyXITkOa5Oon/GLu66pYx+jczmCxrkGly0Whu9tv
         3kd4743s8G4LVkLHk0RnyxxJ06soFfeYOFIljif87HeEsy3f/JlAXVWnGstXCKu41V43
         OUW6oKHTk9w81a82xdnfjhpndlNbAi3ukzNP7JP+zluiioEnRhznEd2XZ+j/PP24mK8W
         9Fdy/Lk9eST5VI3xKUxcINqFzualjkeMGpy0UCqRt7Leo1QrZwhLBu3eBfWqYZYwqjv0
         oVDp6PzMjwicF0pWDeNfZtHq98JSO35dKFNyhwK3Xw6PK4zWI/KjTaAeU+X5ALtHoeZD
         UFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775907; x=1793380707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=dyT2CfsoWrvrZL8zj6r6ENeRR0L9e5PO1lJLFjAXc7E+BxwKUqOw600qh58F+CUdq8
         a+D08X+oJ14W6nZMkZkaZgNlGE9zweZNTy5Pcey6TtvLXNTlD5mVM++9w0ImamVodne8
         eaCpy9anFwiC4xIdJuvsZxR+0lnDefDqX2cbBCehIRFKRhCD08mRY7y02QtX4oxjPmBO
         s9wTzjXUFFteUg1cqIeKEBItrnckQDMwH5VCJ1xkoRKqQneBFOF40lcN0n08Fa4ru26Z
         o5jGdKV6Oq+hA1hol1yYhhr/TcXI8X2he2/uhZcpNvbb7zV+Uc6GpDK6I4x2TozGjv3g
         GGhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+LplxprsdJpqfm3Sm3M0cdEngiGJMJJXZ4UmFcItyOmbiAKOzlB3rmnbWV3vveJ1JAJd1rutreIe1KlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO7GUqYmiA6kRf5heFywZCN8rgQpKiO6Mznt79+LgEV1oR6Z3k
	Ra4BMb5GHh/OjjCpdxjB+8aIlTuH76vCFiFDihpAgv2lASacyQA3E0lLWcp50itiZl0dP4/pqxO
	Hdfkc7lvq5qj/orYHMxH4z9RkFNPNm12hpqyoD1aE7ZncsmHfQizMomJADWEn8AFR8hM=
X-Gm-Gg: AYBFou0VWMi0gAhC+MsYuca9mD9c30JbVq7ppvfKn3aX0e67CFKLZnS4vLRadovRwgE
	S6byXBu/TuW8uDtzaCmhzeTB4VDNr9N64O2gzu78ial94M1i1sK13l0yAihYyVAqa0zi85DDwms
	YXLGyZ43AxGb9f1LsBhthKeEy+mAuu4Uf5rvD2w3/ABEyFvHnAkpPHXomCrIuIVuxEWX+GVAax+
	gkgmYxq6khtzixuPgvrNJ/40GUaThyikChrGMAk5dhSF89QpykwhK/i85szuW5rQ4HjibrVQ0rS
	FLqlfhrmaZRKh/FfIOT82T7RZmSZKe/aAhUDL4yU6kvLA6IcygLbnHZL7DrYHBGfIGMU8Sbo88h
	BF43il462XseL
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97340085a.66.1792775906963;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97335285a.66.1792775906330;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:32 +0100
Message-ID: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4MyEE0DRUTO+
 LyeQ3bRllLQth0fEeZdKm5chW+Hkf7fP+gl8R8T63Nd8oaGi6pzHitEhbn4+EpK5pScEgS9JCzV
 AzxkDMaEzfjsi7vWC5jzyr8ltptnz9Y=
X-Proofpoint-GUID: KqUmQUwKJNPq2A40282ymoZSYqaYmBY2
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96e3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gpxm3BjZcJp1ZicY-GEA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: KqUmQUwKJNPq2A40282ymoZSYqaYmBY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1JCQMLAo5ZGC
 AZNTqq0ozWXQK8KpqTspgav5N0/60Aj+DZjslQ6V1cSe4Z+9BWskVfRQd7MWQnJJfavuBSDd0La
 RsdcDiT5dJubX7SYVZwiITNtRZ3StS0b9hz5RwM+kBlLQje+zaPIthSz9ETBGXKuFraW3k2/vG6
 US19p7S+Kh5y51sdKSoI6qIckodEHgo/qltDZyV4RF7pGa60+34bCyp78u3pnVwTMmFFP7iqVr2
 IAxI72WRd/MzmfSVPONLSA0jMH7szEXpMx/mHSJjPibNRD7RZB6Ut7vr7mhFmC7QgA8slPF2llP
 soJb6R+PYWOLA3yr0GFtCrAx9xkfW3fiW4qgz5soh3+BI5mblMQaqz9o4L/kpF9oQYyEOzJR3Fh
 HHdaM3v/6UKNGl2uVuZu4ZPfzw07ujI9tDxMLHjQpvbh2v4+C588wQmaLX/O3AlzjNDINIYwzrc
 odp3f3yxlQvLaAOTtOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAIs to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..fddc76f59557 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -256,11 +256,26 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs on both
+			 * WSA (left) and WSA2 (right) buses. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_woofer>, <&left_tweeter>,
+				sound-dai = <&left_woofer 0>, <&left_tweeter 0>,
 					    <&swr0 0>, <&lpass_wsamacro 0>,
-					    <&right_woofer>, <&right_tweeter>,
-					    <&swr3 0>, <&lpass_wsa2macro 0>;
+					    <&left_woofer 1>, <&left_tweeter 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>,
+					    <&right_woofer 0>, <&right_tweeter 0>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>,
+					    <&right_woofer 1>, <&right_tweeter 1>,
+					    <&swr3 12>, <&swr3 13>,
+					    <&lpass_wsa2macro 2>;
 			};
 
 			platform {
@@ -923,7 +938,7 @@ left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -935,7 +950,7 @@ left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -951,7 +966,7 @@ right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -963,7 +978,7 @@ right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

