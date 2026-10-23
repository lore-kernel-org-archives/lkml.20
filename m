Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746205;
	b=iXBz/qflhhmUyHDabTM4qSAXe/nJOlYvBd53UV33lDu1CB39p4Ek3TEeCC4fZp7GuZD5
	 rLk+DTgUjmbcTMqa2ROoYsAFsuoBlc2ZzQXvgPoHnI1olkNlp3WGgBJshgcEK38YWhUnJ
	 9G4qF3rpyMFcpBQCJkScCEYhbyDXvq18MUr3bGLBIJ9jWXQMzaEEdO4xudBfVpszSGZra
	 9/XrFUzPC3k0eCLopGRyoxCD++PxvcZ4N6PjgFcLR+QeP2V0BG9ohE2UT7S2BYbsnxhKL
	 zIpoXOZ7igqPDT44p3Tue4Kdjd3UMfyPhkwCGGFyp0NLFpZcn2dduFj6H+Rt48HN8qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746205;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+q1eV+ucE2eCo/QY19WIgE28IiM00UBzaKhHu6xsTrE=;
	b=cCw56Ev+laxCYSa4VC+9vdlys3DC2xna7atXwfzMMIADAD+h+9zpBwlysf9yc1QPWj6f
	 dxORjtxEkj0NmBOJDesvFy2UDYqyg6p6pNO/XmLIvy4eJ3lMA3dRn0JD3yLZxwHFe/urU
	 NQBRuxtVa+dd7NYXN7seDG/eDDDRhry53rM8KfHcGMFxgQs1n6JVz/j1gMLZG+dHXJZuS
	 alchOBxtAq3hlwUb1LkOSi+B2FO9F1RjCaJh/tqCIqJIu/KWMdb7Uu2+oiph/yMhbRp0r
	 92g9hNdenK7J4hGlHg5wLkpVmaJ9HHqEhP56t/fYa89wVQePKDXjvfkqQ6dscxiM6Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlGnRFrq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRa+RmDR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A250606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A250606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlGnRFrq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRa+RmDR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F92X2067840
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+q1eV+ucE2e
	Co/QY19WIgE28IiM00UBzaKhHu6xsTrE=; b=SlGnRFrqga1sYpOmb5seGpqnHXA
	lMVCsGwtF7E4P+qtUnTF4k+SVec0V+ocmiJO6IjCO61vOGOwBxaratwVbioz6qjZ
	bQGqVW0h0u9FFAPy1p1Oaovg3IFu96kG7hH+aST3C8rUoIKMR9LPkv3gHu8RTNSl
	/pBh6DZ9Wa+wnHTc6dvi9E5dxe3p0tp1evpskV7U6NzXDD3HEqCt31KCG2QbaNqe
	vC6SxfajvbTD/XK6ZkVNhaJ38gmVTiQQGh02anQwIO0byCmhbkAbYFxkp78g9eEZ
	cHw/fek4fN4hO10DnSUQaidXe1rOBSYh/rufLnMoDAzVD0QY38qDs0zrNAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw3c42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93f67358eso7445605ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746203; x=1793351003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q1eV+ucE2eCo/QY19WIgE28IiM00UBzaKhHu6xsTrE=;
        b=QRa+RmDRJUJ5mcV5fq/2UD/vP7mk1w+/EM7x/Z2F0Xo5ZiyfwuBMJoTuuc0aebc7MP
         9e+SiJ6OVJPDdGVahn0GY8tAJzW+7AalwedaiJhKicvvO3ztVIaE5CtroVhv8rC9ew+A
         nva/7/wuumKUDgil5RFW+zKfUgRelBL1SAqMNouTmupc5pldOf1rfP1m5aJs29mok8Jk
         +s+XByF8KNB+D+zFdLAV80tloxy6NXCduwrUyJoDhGBB/TKLCI5ugG1oZOTm82bedmD+
         pbqFfehqFBnPR1DP+rh+KqgMDlMXkWkFX5E9KcxiPs8UkTzU0ElFW3F3iKosEQuq4ZtK
         d4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746203; x=1793351003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+q1eV+ucE2eCo/QY19WIgE28IiM00UBzaKhHu6xsTrE=;
        b=KtU7eyFqCggjhy8kdQZ8/mGSChMgAkct9K0vcP+hJn2lcNPRwFx/ReOAxosG2Jzs4P
         MlAFj6F0HFpDMIsQhEd9xOAcvd/5oukvoFlImRGm4g00lk4C5qy8PsTT/cuUI+T38SFK
         VHeXm3nm473aJ5Lgm/RwCa4Clh6Oc/zmfeYpsWZOWo055+pBDU/H+hTf5JhXQoMyW4u+
         7Jsqdv4WpzgR7CqjFMFBfR/WK6MJU9gBXdzV3cZFJQjrxKhKbBPDgArQzNqoDwK81JN0
         DYIGUVqpcC570iy/ddPMBaMKJA5Zg/PyYSFZRVSPT+h7mum2b3ruAc0ATRCExb9jhDM1
         vdWw==
X-Forwarded-Encrypted: i=1; AKwUvBxct5XjsKPkhc9k4bM/sanfE257pDgnKGW/77HH65+ONJRxfWjrC09RbAXCYoeWzJYPCADj3z7qaW3o/l8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNFzsDw96eERlKpcLuhEr1k/W5dnQnrMn3pqGCeCdgE4ldN86p
	e0fliG2nr9iDimH54WnEgd+eYvzUn0xrzQLuEZmUHeIjsaOjK3p9TD4Up26FmCbhU7LyGdHrueN
	nmPwMYuQ0PWrb5RWhJFW5zgi96s2x2Av/gduSLttnIn7CuwUNOiqmyjXlQ8Ib2WiDLxE=
X-Gm-Gg: AYBFou0k1qwk5NFGxOVCM0KmqPi6ay0XIxaZzhba4zAh9LiqgVUxie8o85CBx3ddozl
	kYYE0ZiXfCDaBvjtCQyNkIuma8piyCCT6QrJZifv20XFj4bJeIJ4N8mjLyd/dR2OPM3rTNsTCrt
	wuQ9t9MHaetNgjOKPdsmglvoYNn+pAPze48yjAq1L1ntQ+f38Xny1WOc9z3ylYJnJp2qL7yvPQL
	ddVGHxEkW+YCxMOiO3YR24+ZtamMqyCfLEw5teBm8hUJbblwkuAc0Pcf3OvIlMboHAeKQdfvqaW
	ScIt7N5JHzI3jpapXNtqYIr/8nuMjnz9xD6KMRuP4YsaJy3ujqjAAkl9Idg4WkcuA0Szd/2Ku5g
	wV+q7t3nFiroT6cFvleJ4ocD/rf11fA2rSQ==
X-Received: by 2002:a17:90b:3b4b:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adce74cd8dmr1384920a91.37.1792746202947;
        Fri, 23 Oct 2026 02:03:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4b:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adce74cd8dmr1384892a91.37.1792746202282;
        Fri, 23 Oct 2026 02:03:22 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:21 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 1/6] arm64: dts: qcom: lemans: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:03 +0530
Message-Id: <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8KMubv5_fetWAU3L7_hHz5M7eqwHdxJk
X-Proofpoint-ORIG-GUID: 8KMubv5_fetWAU3L7_hHz5M7eqwHdxJk
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb22db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OoeahSk16-wZEypY81EA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX+Z1SUuXKh/RX
 1LHIhMmjsDuJkU1aah9AaVckO9qb78vvuEmuJHDCFU1Rsk8oO5rg9b3vWf1xQaNcDrXLEWsBbZy
 iqTNZ2jh0IiUunFXQZCUoOlhd42DZW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX5OL+0Q+79auw
 q82Sn6pzMcfK1g4ca0qq/Wg0tzhyO0Cy0+VNVezGeWhLStNK3+K/RJXN6gYAsU9NOxvu9CqCjaR
 eVGukaoAwtUN78XDxyHflHhlgi0XkrBCdOn/AIV0YhVcUjvzk4oTizCyf/DU658dYW6djnnsQJW
 6re0zLAuseQfYeWF3I+4ZgKs8/3cz5413ENPdYiy3Vwe6k+ScAm5beVwjSwOHZl/rUyvnrmgnAw
 6r57r6/yvGATKdt9mlyaLfah5vLL/kCNnO9/4jY/ytj/nMMKh054IpCdeIMERIHLf88HSJcsh3M
 lXchpX3R6uwTRq0DSQ/Q6DNPWoVwXEy+QPjS6ktQGvYRdVf3B7/Rx+dAkntM37ff/EnFb1cnNU5
 GwcQiM1UdY3iahYLQ+EAUIMH2Eglnqio0IRXiNBjwoFIkcMUK8vhWQ3GwN+qrSSjGo6AFreMFJL
 tuyECloybg6+qDR4hVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from Lemans device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..5481dfb73454 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7861,14 +7861,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x2149 0x04a0>,
-							 <&apps_smmu 0x2189 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
@@ -8000,14 +7992,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x2949 0x04a0>,
-							 <&apps_smmu 0x2989 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
-- 
2.34.1

