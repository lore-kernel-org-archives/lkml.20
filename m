Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746219;
	b=M0LaP8kCZAyvAzyNYRWvFOpKFCrUwMYv4GgUEmSivpfhYKcuqfcZqAEt9eAfv+1Cb0h2
	 VR3T+Q0C6q7ttbZjBRS1bcJWZAEU+kwTVX0MhbseD6XpsFxFCE7JqKKbBEvRP5WbWqjPr
	 HggTNp4y8sRpS3jQ4rcNFdFbZFl80s7N4pKELya7aoJJch/YZvBpXoc+1WIe3IQo+L2YN
	 +R+rTDVMBFYL5zz24tC3yqqZrgLil0NbGDS9qk0IGOtIfIYLVcmMRfMuO9LJapYKjvSLo
	 djBBhyUndjjqrsMrXod6w37DBC/hW4YFlaekoVBQxHbrPuwDlCFVZRQW+HnWkSYoc1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A+8sjnjyCG/D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=;
	b=p2q7x8Ti48Xx2DZqgQSyn+6mzAtUpF7ZHyGq8Y5viAnmFpMm3ByAdbKqTsQ699v28jD2
	 klq/U8bjLFyWr0Wj7+t+/72azJAstysW8yjVqF2ce3K14faf/U+tpaX/lfyvj4mpZjGKx
	 H0kmdxNqgFL2xBMRdTKR2XlhjjkbMmno2C6TDLWvDQzP5QneEj/YatwqUR2tNPMdoKvuM
	 x6aul9OY1G+EE/4gg7PqhcvujciXTVeikK113qvxAitvcWC1gf/50BS6COUcdewjSg+i3
	 1e4fCX8yx2EVg6lN4PxGTmSftydteVny6bRZb97c3fJt5DbxS0DnMd55GbAHEyxTWUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEwgp8Dr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kxydvJHS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F0260A260C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F0260A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEwgp8Dr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kxydvJHS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F8D62112106
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A+8sjnjyCG/
	D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=; b=eEwgp8Drg+K8WQqaGVgHPFoYH7m
	ZelowxguDuOG10m6kMBEkuwf1fTuo3DJ2HCfMaWYxJzvm3fs3BpIvTHw8w91OAyZ
	CHS5i7cuf6KUCmEB3uwdR7N+xei4rlA8Qx1nTZwb0gPsDzNj+QqbBnaH1lyl/8xD
	44M5sbQN4LSSU818uZPd1ciynhIcNw1tF6caBwXgA09/zxJaeoNIgZ2OlUoQH/oy
	zQBLxsc+d8O0OR/0Pp5EJl34TrOC8kTcmYk9VUZ3X92cgx8uWexF/WFpZTPRstZC
	NYonkur4H1s3tMnmGOXxnXFiA3zArRbcnX56HyJ8jdp7Vj3hNoU4e/FVO8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykaa64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso762869a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746218; x=1793351018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+8sjnjyCG/D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=;
        b=kxydvJHS7jhtpcpH6LlHPMKpiXdUMo0oTBQb39UC1QgBFw1udHYcrBlQvLDPeojt7X
         2WqHZv+HVifMAlwFOPF2rRHeC9+eypn+pzAwpxgIeTviAJ66qQVIGOYoKnW79D2noDK7
         KqL5Sj0jr+9C2Zg5GI2kEw3BM2pu3ffuGya0ZlvRjy45DYPivszL2qOGaB8k2jqXID6F
         quNK91mk6dr4Huuy4VtSbbgcxjRu2GqvcLOW2PW7PJhAp1fEsh++50mlxGAVSDNRaHC/
         ip3RQLklvbzSjCnxTk6W/Wncr8QBro34n6Ynwjum4TtY9KLZVBtwl5AB+Zgu9u64NcnQ
         8jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746218; x=1793351018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+8sjnjyCG/D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=;
        b=Nu5DCguep7vXEz4Nplwxcfl4QJBiyjGSqgYVzn4jZHeXJ3QMLZeWYaPB0QD+6CjBK2
         dr1YFP2nE3IouorhC4MXIqKA/XXTF8Et+mcH4s1BiPdrvhTx82FHKXeb9b8Yl38egq48
         0OAwxwQR3DfixXAiiTLNVX/UL1+4rKpms7PHpzSX2PEIegPT++Ca68XRifR82RD7Gfnj
         aOskq8OHTc2iREdjxZrsRu0/0Jd3e+ukicEMAbUrQn55Wnm3c2zn6DESUCT6VkeRmxEv
         1K+0J0asOM9e7QvQAbmfy6mQBx4SzWi6xRppcS3yWezV6P9z1gy7sSzD9/3QAMj7iSp7
         e1OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDEYV4Dw0V1YH0dcbjaTRnNbf5b8XT1i81yRWufN5+0FmPukFvgMZaR/zmS3s8GGSERdfwON5STXlkdX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN/u5k8IzKo3t2wL9KKSv2E8xSCjaB6SnnPNS5jN+vHrhYZl6s
	DwgZ55KTYEjUwD54SHrXrFDPtaHCpclid0VjFudrOB/GES1DFVan8Fk0Y/voquO9eOLRqBSIBt8
	qHB/UDfyqqgjRVt3XOIr53X06aCVHzNkubP6iAUlJsX5X8fVvfGxmOFtWI8te7ef5Ct8=
X-Gm-Gg: AYBFou2Y2NsJNrZbDsXwf33o3RkDwlFbQbP756E7HICxh5Wo6Cyp0QT4gd1OcGMBeaV
	ylGQ9eSHyc5bWiqh27b0zkQMm/tVIjVj4BVxWBFDN0L+ZFLDUG8m4aQCr0J3fSgWaO1D+wTv0aN
	nrHcahRuf7PSRHIpthtWSxWzUz1HCoaUIZ1D7JUTWOucYWoxEkE76ZuHkjQ/txX5H+YsRZHxDKG
	gWE8gdd8B2+T+JdzLLDxzJpM8JJmXFITvN1pPlz6hHHnYytqEsCt7ETAs/by4ATgaqtuJZ9KFQm
	fIAswH5jgnf5I/wO7laE9grDOtoTANjKRNn2oMIkAL9+nISZy4nqZShnx+E/y4beBdnh3wHC28I
	iC0TlfSDvDC9PezpmYfHMycd+TX4DlzxKBw==
X-Received: by 2002:a05:6a20:a11a:b0:3e0:b937:883d with SMTP id adf61e73a8af0-3e3692274c5mr1250206637.25.1792746217655;
        Fri, 23 Oct 2026 02:03:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11a:b0:3e0:b937:883d with SMTP id adf61e73a8af0-3e3692274c5mr1250183637.25.1792746217241;
        Fri, 23 Oct 2026 02:03:37 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:36 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: sdm660: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:06 +0530
Message-Id: <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXxZAoi47KuGQJ
 ZokSEhadxLOjRA58/lY9eZNIJ+FDmY8/UWPrV5LKvKG+dsT4Bfz+RSKsVdeHMNLRQ92ivkGjdrF
 /Uq8gD39+3afXvn+c7gIGhXxrCGOrT9sYbrJ5cIlxQU1dmYoA94RDsTvMlcSSU2CTDi2l3iF7aL
 /+5G3pvDAXyKUs5zQIZFBXHo0+2cNKUo3YBUP+x9Wx5dnVXXU9YJhB26PIObXxiaPFg4aEd3V1Z
 BZha6p8cKYT6C0yty9QjjrPI5dJ1nXIeopyXZLRnTC1S8PJOb8GpI/7nwdQ9OKzK1BsBwms+M+C
 qmJFW09R8ciF8m0N4myU7QhxlIFu8/Mck6/whnl4FvwRa1yQ5+s7QVUimnnEePnWRg0BqnHsLKe
 5jhvJs9FrN6BW7lhhgWFZ1OOIaTSeGP4/Ggtze2qAIDjgNZcB5AvvhKxu70Jf5P4WUc2avfp7Fk
 lqfP6yPyyZIOK/A3IUg==
X-Proofpoint-ORIG-GUID: M3Glga80f4JNiAWY3rJN2MxlT2Q-KrLT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX/E1z5WhKV9Ra
 9XeR/oHqKolf0cKgQDwgZlGd8OdlIXx+xLFq0UhRTrE8oRDGa9S12tlseUS//dojsmKocPEYhTx
 CRj/n51sv2tLLUwmUpIUTpW7WwvY9ek=
X-Proofpoint-GUID: M3Glga80f4JNiAWY3rJN2MxlT2Q-KrLT
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb22ea cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Bp0rkiFJIKxNgHgNeN4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from sdm660 device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: 708ab9d3bc5b ("arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 0fca9662c64a..723bffc99b67 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -386,12 +386,6 @@ compute-cb@8 {
 					iommus = <&cdsp_smmu 8>;
 				};
 
-				compute-cb@9 {
-					compatible = "qcom,fastrpc-compute-cb";
-					reg = <9>;
-					iommus = <&cdsp_smmu 9>;
-				};
-
 				compute-cb@10 {
 					compatible = "qcom,fastrpc-compute-cb";
 					reg = <10>;
-- 
2.34.1

