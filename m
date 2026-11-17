Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897303;
	b=PIDQqpPThx6uOrBv2NExcOFyoIty5M7TjUk7HZ5iXNdm3Q5wVplrvN1nLIqCdbSSNWOc
	 mbRvOWPpGM0wRSWkDbM0MXO+UGpzsNmGN3+oWgTkHo5ueznbXekCim9El4pZuFOiN16yF
	 WL/KYSydy63M9xIGWlLMp3L+FC+v9CYzG5KqUW1tsnhNU8VmH9SjSr1Fsw692wTgbKQIy
	 aIyCQxM3iGyDAMCjXYtFWXgu+BaZXdmTsz1YPZi+j/L8dGjdyDGb+WqLm7GvQONbxLvxl
	 rON0fXYqk4b7cmjBAxGaDIA3Yu+RGm6pzTNuWJRxDkywVD2aNcNUF2yvjyyd5vX7LkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
	b=NJa1nkECcmGjGL7YYg4TbKlFmbdKZRVi9NrQGbdUVcdW0gib6Rm3rZ0J/Ak+a7aDs7wx
	 l834cZC6ou4RdwMpsJlAGRVm47QoJSi5QP27ziYSv3c7qWnYfNFcDr6dVXxEVd7GkqUH2
	 lw564H3WSnGuIqUuVQAu6kt1s9o5uNyAE6LrOgX5cwgRXm4MSamyup+D88qsQrQA1JjnO
	 KZooIlRRVLftTS03oqQ2O5Dwd7OvWZwASmAf36A5ApnkHl9uiCInD+wPNLiJH0/cAD5Dy
	 G8leQzr8pSmSZ6v741+CCVxh+Ca9wyLigQF3ZzJ6Zv0VMcZ33nuNrxCB39vL46ceNtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC338606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC338606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LqFv3980776
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=; b=QWbc13VmIdJvnXzA
	bQiATrZcnstmTHHiYR6z7c8SXurnSXQjcNElEVWRw9/7Uqp4h/G+PdHc/tn9gGKi
	KUjKLAxo1ROdxa3AG2rbJobTSiMHXfc5h5Wka5NBVMRC8/O3Vczzr+EBXujAx1so
	srX8GE5AYypBPMwKJSVBjjrOsrjr2WpWTYPlWmwSOWBmlPcqeYvK6Nh3pZMcUhi7
	5pJ3gqRMgt5rKqy+5gYQmvk/j3dBfvjQHiFhU3AljpSjhonuhmcmXdq8tqfoqp/J
	1i8UcjhhwoUkAKgBu2a6pK3lMW2tOhrBigjb5wlnk2not1hmV2X0MFvP+6su3CN6
	Mr+6zQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd01mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3580728a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897301; x=1795502101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=TYGo9foxs3rekmQKGjGedjGlFZcozrLORoc7LRb8zc/shqcygtGkKCjHaktElA2yjC
         a8sXQ1Va83cGWl26Dzjli6kBVyKakIaZhraIjKslQZGv94ru8aVd8fT5FzEFDKZVT4Ck
         /+AV+sQA0L5MqEOG9iv4yBrl9fJjpNwCxZasbE4/99qZUvSNki3MdG3vGIaNOMp/vM7R
         OUQpgRxDH7a9UFBghwNh4gn2oup6RfpNHRo4LFeSA8rfh0gyrZHEHaSmVMtJ6bIvxhrQ
         QW+dpVKzLukOe8biH7fJ6IwVPFTivqQxCbBSs8xDzl/D881OjKpLR/UPInTR9+JZXZbt
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897301; x=1795502101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=eeJqnWTjswus6aERr48DfKiGwllqN8Mvv8kltcWuppsgEPJmz3eAr3jmd9MFeKJN/t
         b9c64EcZSYxskA9nRQqr0xutdz2tyunUgUmTEjgsPUvZyBhCFuKB01vEOGwwabjpA9gB
         NZJBzCChVYJc0Sls785GoaS+iDQISeYfarnekCnX3swV+RSDMr/N6Auhe5urw8oKmgnp
         8YIjuc144j8WPxh9w9TyKSV7GQUxoJgClwU8ajraVUAueuIKOFzP86LzY1QcGBqg7aIo
         4Df2sf4DnSJT4grXaU+KcPd1OAdkSFq3RN46YJb/MYFohUIL97O+fmHA3ZzwII8Z6VS0
         TgRg==
X-Forwarded-Encrypted: i=1; AL+hErE7PVtG7McyvRu4TS02SZNVJBBJlmfF+AE/KMRIufo6OznxX7iL12A9qKANOjwVD5M0a7xZKdyGMwO+GIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Wrz1aLQgWV3ED4Ud7QoCDuq74viWdOrTwMeO9zYpGKZC/3kf
	DGPF7u9B8Vs8dQ0FRaFfgE5EZ9nqOp5I9OTNE+gvgSPx+1gE+oEgXEc6/PZYkcjf9rpFhXjpuYC
	w6R6uE2aq6h6J/a6hb6ulnhjOipEjeXGl0zTE5gNZfVeEzRx8JCcE+YYrEPjJgKKUfHw=
X-Gm-Gg: AZFdTZcLWknwdwY1aiLNSjiJnBmICnzEJaNwkUcaNqJHV+7V7zEa2TjJtFB/QPmn5+q
	GKG+876tdQj8lsqf4Oav1b4q9iBEajbH1PeklQJ3EDL+sfGQTllN2HLY0GxNRNGRQKsM7f/gFDP
	OoVuNqLQKmh+CKREi6X1DRRb7RARm8xYCRXlsQg2pMt6KmYKnytFopVJhu+f3pj1P4mNClKt4kY
	duwP4ofk26wVMF938QseyaVWC60QBYXjsb+N1qdBvWClWZa2jQ2VILx5Z6FDgiJRCMOjBFALkKd
	ADu8gX3uHgyuFiR4HkglhtYsXLT4yoFinrc9DD8iN//jqlQ7m4lHzWeor+Pc9IjrX/GigOzlw7o
	IjzErUe7JIZAsMI1L+KCj30+OySk7t2snrlsO9fAAFHLy1VTn9NZWbvfgXHDqfRIUQoifYUBr0p
	ak7plzorXqd9CNoSOsEAUAM9iX75zyLO8zE7IdQ8S6+N6nvl4+
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270196a91.28.1794897300553;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270183a91.28.1794897300084;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:59 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:33 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
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
Message-Id: <20261117-add_iris_for_eliza-v3-4-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=835;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
 b=T1+ZDyLe22DDEQKX6BrZVf5duTn/QGSsXWEgvXINf9qJYvlUSBetNpCRe9y7/u1BNyumlFgI8
 6ZxZLWhbyNHBvQMum2SiJuTsqGLezkZy5XyZHA5TU7A4+lVzDbiM+6N
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afbf595 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX2qMcqXFsHH4E
 kBilL3/1XnjED36B+DASBKybqagZ6aTOmL7mJKxFLf8PweWnnldAdrppF8czeyNUwfJyMqD1MQA
 i6kTQWrrGxphCqI5xfMhtrWg2PmdjSg=
X-Proofpoint-GUID: Fu4CDNYQ4HtAtQeUETcGGDZXRe0Ukf7g
X-Proofpoint-ORIG-GUID: Fu4CDNYQ4HtAtQeUETcGGDZXRe0Ukf7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX2tlWmyY9nTDK
 gSD0Q62AkziFXYKoHtpIU56L3239GnfVFbCmntCG66hqA+oIIkWr80iNRpnw+HSkvWXyqZxKG4A
 PE8ObpbRURV5140vtn0alvpdun2uVvs3t1rMgUKR6A/g/mVC3lfPJWI4Rv7C71wsfbdRkjmj7Id
 t6MGVEXGsLVLi2/ZBiSDxtJNZ54B8oqSO55iYl6kdRO+jCXWstEJTXJ2deV7/GId2is5UoPPGYl
 ppHijfgKV/vejnwfqj+uaTbll/ij7q+46S1e0AqGBLDOG15nownesq8yFVuhuL35v0yWbNP6p8C
 c4xSovwGon+N7IRQsILe4c+BB50AZS2zmLRWDv197Uwas5LYEma+6EVt6SOifBn6ZgXL5XCEaIA
 t73iAgJKnAUuVCUndK+DafP7QaVAuvjj2nIA+Np8mPxBk35nO25CsR01hcH1S6ISBZj4q2xUECj
 iAR7ZPD6BjpJLvPf1zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0

