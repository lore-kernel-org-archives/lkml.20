Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273730;
	b=uAfqLUD7P9yQyNo18YBeRLblLy9gf+27+7xnd+WzuB6mSKmjVBUGVH077FiiCqoyDvmp
	 D93KKSgMrCubWytjxLqaqPRawiERY41eJ6Y1Y9IKfUxPzGZwDN41xvK97iDtQuZQ4WiUW
	 i4kuWJFsAwwBdT67rU8xvYQkZgx605lz1qjgF4OzVqiqIiCDfbiVf1xj+XYRxJyNi1QQ/
	 KOMQCESaPutZxFgOI4cRfC5loSSECWc2Z2t1maHIvLTlw+0cLKfGxryjuVpkgdbC47ir+
	 DPqA9WGsgN5xSEw7d6W7xdyNGh6BhMjy4K0sHwkIRxFpKUQQS+ak/8dFAxP/5xLJRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
	b=er4kX7zWu5zE67SS3Q3W9rXFsmk8k2P1bnMTN4Ll9izu7+tNjQqdJUj3EYpEakAAunqJ
	 VJK4mYEoVWkpxgoz95fAG5Xo/wd2n/HD4iYQDOmBxBRP4mZlcW4NLWfFYVRbAiIg2hTyr
	 Tu4kiBW3Jns3Xayrwqy2xfD+TV0D9OB5XaRNEjQtDDgS6vQ95GSJhbu2x0qQ+D6wnatlt
	 W0l6mxnPXUBmC178XON8t3/6nL9ZzE5fU3B+Yu4vjVcsS3kFnBnxMVuCBoxwXA7nKmby6
	 WznbigJ8ToubR0lDV46/JIMssDn650mRV46jr9DzQtHu9+CU0KeNYTVCm+olxd9kcrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ks5uzx72;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nw+JICvU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172960A383A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5172960A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ks5uzx72;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nw+JICvU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j8TU2482067
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=; b=ks5uzx72sfHyikhi
	PSIzhVv0Y9oG+Pw/MB4KISgSqt7mZFsVfdyYxO3jkdQJ5uCFIWRPyqSYrD0+o0Sf
	xwonhsBbjK2HcOGbJDSz0cT7tDvY53ca3WzgX0Bsbdm3KNVimOxpOm7XizwWqBYJ
	nsafU821axWY2OcVp/QRkkSF/DDd0OEYvYofDs55oiuYXSRS1btIZaDIAYQl2OfW
	kZg6cS0ak9GAlOBbnIEuJ5EwC4dBu4eXdprI/x53eF6D0NK45dLPz2f6GjLZ6fHC
	03D4TzCkgh42Z9wObg2ruF6L9Mzvy7IRxz5o2gsADbXnTIWa+Jj0b5QNEIswl3Jc
	k0tCYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx828pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed1fbae872so22183635ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273728; x=1794878528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
        b=Nw+JICvUhwLaHyCFRJDnvvg3vJOjxlSxKLturTfRrv6JeUvuS0576qv2TbsSFSh3WR
         yHX5p4GRPvFFTXpcBxajQT7gY2c99bwBrx8bDrLAl0v2noEGuMJZyMUe1/HZnXjvAMmE
         m/pnzPXuQGObS4HD4KW8gDan5IHasn8vms9Z6cW1wOoaNziSLw/oSOD0MfgQB0ZBZcsz
         XdlPBuso1X4UAa0XkaYMuZTXT9WbNlUA8iW3VmmyC2HViCsjZMfqMzfffyGUfFM9b+40
         7QiEhB+/Yuv/dapGz+affmNygN3QRdc6OsXwiUkqiMbIaqsZkmHSJXbprk7VgdZJmdu9
         MJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273728; x=1794878528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
        b=RCGNLtLsDI3Y8yUSgWczk3t1l8H7HU68JtgjUeQv5kwbj5sTSGzOHV4yqkNIE1qifA
         xW1eU869tQ3EY2FCmK63lzEDR4zd3qPh9e1c3Zm+8rMGx24973w+JkgWyVTaJ5DBwySR
         PkLBrCzPhcKArIaRl28f9Xoko7jTVHZcGKEvvfQQlf5mi4WJWbTVejpbUEcRr0KNOUd8
         sgOyT4zE7GtgNY/E4Y81c8vugsvtdNPveEvBfu4BHFbH9hfWUsAmmeEVMMulb3UKwj0f
         tPI2cYS4rS1yTzQYOItFEOgXfSbKRGXSn2SEcpkInka0wp6ZqllLS2VIHQ/H+HSqjOGf
         S6og==
X-Forwarded-Encrypted: i=1; AL+hErGtZ1I5LyOzqo14IQ7pE9NsROwKkIrJky2r7y9i9r+PkS/n5ZNI/PSrPBDBKm162c7bg1QtU5JLn43Mwsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OCi9esXrlvPATmRHc5XACKvH7R+iP+ajItielFXYvrpyU+VhA
	A6X3cx5otn9Tnt1uUzDtAFZYLHMn+Hv1OrODWeo+M0XWNXik6F+4p+4ELkICV27bpEahXhWuSeY
	Bcjp9ZvPH2FY3iTszdBReU+frk5AAfvRT+o3dc68JYLPa0Xoq/Ba97taqUsktSV3Zyxs=
X-Gm-Gg: AYBFou34GZuentVIqNyJe6ueU4VpHhwi1mlwkheMBcifpMcloNos8bthwtxrCYZMcVg
	oikCND9o+4ebLfbp/MJEyN+jdLmiUFafzgUPy9KfHGHYZN4cdkXILXZCpZXAkWAkX7Br0Z3aHCF
	KdEr8WuYx3U+9VrwkDdoAkj2Ooi3+L7aWI0/7znwy115udp61L9bQYLq/SmYM3GQQwVGNpETQAJ
	iResVhu+2HzVYBWLYXY0RYF6PaDyyYGSYD4ajBY8+xOt2Ug7yXdeyT6HZn0WeHE44oNllj+PT5u
	hHYBhnI5G8rXel6W6nPix6HRmvfyvn71OKSbNSPTGhU/CiQeb2m/xtswcDstD2euukLI3PHaS8r
	FHNizesKOCVhGQMb/wEACyiuhgBy/SA49Lpctzckd/m3wipolOHUEqSss71s21n1WnqTGtiPOue
	smi1troql30XgM8r39DntnOvP8PEZ9HpL1y6Y=
X-Received: by 2002:a17:902:ec8e:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2edb8f92cb5mr9829825ad.5.1794273728325;
        Mon, 09 Nov 2026 17:22:08 -0800 (PST)
X-Received: by 2002:a17:902:ec8e:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2edb8f92cb5mr9829585ad.5.1794273727903;
        Mon, 09 Nov 2026 17:22:07 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:07 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:18 +0800
Subject: [PATCH v7 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1759;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=rDavMIMltT2mlANTj80zr2Gtc/JIaNOjwXPyFgVLGy4=;
 b=qsRY1qzG5WPB4u2KTWjUNyIaRgus/vUYLvzSEQts5Yw5DwIacin+H9WhFx277CKwer9016nC9
 lMORX9mrWM8DzlfNouoyUmhfHmU4MmV7WywPUSacwz84NDiZYWAfUy3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af271c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: z_uLfwbN9eigcAJ1HBM0kgdHEFRZluMd
X-Proofpoint-ORIG-GUID: z_uLfwbN9eigcAJ1HBM0kgdHEFRZluMd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXwsG5lPM2wnkb
 XZ3gdmDz5LaU1onIFOSYnst1Gwa/+qGo1hAe0jUZjSJpV2fE0hjVddLHuBI4BoOiro7CTG5otHi
 nh+XwrBkh9m2iZ+bFoiz/J0pIUW1v70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXyLSbsFqWTHmL
 z8BQYzVxtOjTm799YgsxT/HWZY5i/RcW46XIkSrwNLYpbAqFzycv2Mbq4Hme7hWyVxQqmkjyV+O
 v2M6yntzS92Os3jSTVWJHKIwij4/Xl+Dh0p1AxXZhem8R2oRF4HV8IlzmOz5P3xOWfaYIC+Xcvp
 Lq/g/93p9XxT246L2hratAQAR838gOQKuU1nO1Av6zV9lB1s5kFNZAQv0l++AwriILXfj0p9y6x
 JYd4O/0A5gmImKdFTVxv1DlKL4CZ7AYVP1ab7JGhDeNCNb9X7YPLc26vH52mwpFkQAjRo+aH+oj
 5D4lT0zwenVgEO5G5Bl1o3xfQTttIyJHROXsLQml1QcZaok6hFIcguVxy/nIOs5Eol991zOi45p
 2luI/Osayrgz2CcrlNIpu6p+054nKYm6wgyEq5hmyStZCbzuhLqbqj3dvZ/Prz02vLm8avnaPEN
 I3mUuVYxtk+LL1NE/2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
the ATB sources within its subsystem (TPDMs and other ATB masters) and
forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..d94068aaa342 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7269,12 +7269,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000 {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

