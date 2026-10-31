Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456697;
	b=BpBwHd9wg4cRxDqqSL1mwlsHIQPIxbGvm7azh3D30zsJUttCQQ7o6xQo09j4fqnWFj7S
	 d/PX0Nvn5Hn/xYoQNz9zb8wfz6Ku01sYZj9Yb0vnNR9QC89MUmSV9f2PlIMUWmAFwFffC
	 5Oynqr7NnxECSn5CFi44xhZhvAbG4jRLjYhHSFAJxqR9svUZTOa0v34ITPEJ6SDj7fhzi
	 Qofg9Z6t7/Hq62BJEqUrDjyGXikOIiOde0FM0efam9rxzZHtFkKWRj5YNAcmerMQhlMx5
	 puuPVt+NjlSRbr7wiRw2bQ/PPIBNgUassL4G2TAs0ml/MNtbC6BEqUJlXruEWW2v8UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
	b=JL5bSZ/GSVCxlUhOK/IeYUVa42VTuoJlCSWnWZ9nmGQK54N+UZn5Hb8kzL47IWLWBse8
	 uqlbYKiknlbqxjxhMB6N3/PCE1/OAMhlGJGOsNelKGG6/eWEPGI9aGP5mdwiH9+BsKajj
	 vuXkn4Ool0MvCQjTJOYEsugSBOk25d7mE0vsn6S8Z20qWUBNsmFhZlboAzzYlrFau0x/A
	 amZBLabeqTDF1/iCoeWiIWCoCscWQOE/d5d+xisGQRr0CpPJv+UXhFVMVqEhA3WKkMOD5
	 PSn9Hdgv+Id0X+AApJg7njkhfm8n086azIHqNtBuHklysI/2fkBQXif9/UFGXIIQN5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KoQDbi/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDs6zhtR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EBB606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EBB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KoQDbi/f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDs6zhtR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03eV1630792
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX
	0P5nunt8=; b=KoQDbi/fgIKSgtoxa/4x6rDVtOqLkkESWPcVGOZyUKJw9Ab63w3
	4/RFYfAUdvcum7nsF9GWW0EIC41whV2+1KuqFof7LRIjRE1a9yxNZkDnZ4oyY4Em
	A9vSvWil9q/dasjiX1dFyZC8Qk8FTP6feaHiu2RmfNWqPUpQmo5vUOUjKM1wFWEB
	0DmxnRagySfszvQt8cKvvUB7ZfRdVSMgZem91y/2uuXIrTfrkfVZmUoMRk2kkBrh
	2+fyoIwP+gJap8Q+q92B9AEC+kzWeH8VlD1jlHPnojYllUTo2UXzMdPTMmUMfvVS
	xqM59tl9/xV4yJjvaJejUF9NCbNS2AAus7Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93eh64a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:24:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3092555eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456696; x=1794061496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
        b=BDs6zhtRm9qJj5rFsI2LiKnwY9iEFcmZ7fFgy4nsWkqxDPIMEjJ1eUCRr2MH5f8aFE
         GCdPeKr7BT4SO35CaDw4wuYbgraT5hZQQGvk/HcBJ45sWdb8XH9NyAqf5sJ8FuduQMmc
         Du7M/WuuxS6hWYfeTali3J+s7N5599T2axw+KDWpitbhAtg7oorAVIBXzxyOT/yx5EVV
         RrHRouIatQwnY+pSRkArPoN6xf14CQNuujg3lk80l2pcpudL0nCJ0/tSczV++gpPx+YG
         Ywz9ehFNKH3TTaUWHHnCWbQNxtpblTbfRypwRD/Odo5wB7clQR10r25wjDW+eEH+EZsR
         m5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456696; x=1794061496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
        b=kbXWLFUO8qLIYzFlR9qU2x9FNmItTOGRpOFeSUBVvBiKjUD1iL4U8KUqUp9eSUIzbE
         QBGe/fBqX5zzBmLBFxfIdIoIpetHljCyjv8kg3aCsyMWpi8K1nxxT1KF1/u2GXUzl9CD
         TvrXgyfGbUDZ56n0OfhA8+Antihjws2e9DzgOL+Y4YzXXNI4bJwQ0ZPZPca3TJN3lsek
         pDlktBAD4TfZ++juzW4cTlyToRN3BsESP0dTG1N7LnHy0FMi6DteRMxBeLuFhFzkiN1X
         OJWG1J1vbT3bWT62EIrfmEXYup6SCOgPZNeFiFc0h2sy5oX7xI5ZpFOJfolGjqeJdtmb
         1xrg==
X-Forwarded-Encrypted: i=1; AKwUvByxY6LJoXz7IKG4UkohlXN8o65SDlhH2sV0JgkTxXnZNLbL/lzKOrGDKa5EmwWFNrZkaKIudVlUJ4V83JM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtUOG9VdgKv6Fsfh2P4hUkXkvMXbNwDLLdYFdLJxdAiCcKyoDP
	sYKkeJ4v1zOgYN+I5xfQrQ2NbOITQKmYg3v9zFtXVg6zUlEl4suobCB8kUOVKA5qqm/dfCwBXWJ
	pogvPZ8n4NwypgQzl+yBwx1/7m4mWczK6Nqro6O6dHIqkaobpuvddh/ATXoa5LPD/rwMG0fF5+2
	XJsA==
X-Gm-Gg: AYBFou2foc2WgQIhwKkbgNs/dIf6yfbhugm0hNN8bbop64ppyU45v163sTAJr/Mnec0
	tyH05ZevWszO1rjAt9BYSIzvRJRkEyJsYOcl3XEtU9pMxGntbp4fg7/AujNSKD/mVf+i/FrvUCg
	PjLqoHRIT7fZPTMmLV1zxZxPEEK9uosUBjDQMwGbngCqCqPLFSDTh2NIZAbjJIMx1q+EGErvKNl
	NtlzIfj1y28q3bl8EkRTFtNyoHE94xM6OkOKXxvbI6uLn521kLM8yO1NQAkShFLXXA0tDw6EvNv
	CDblGZ8kdpgaWNIdeRWnX25RHPS95+IGHhAEzOp7kp9fSzcNGZGWUJULUyxY8ypiO1cGo5RwxXp
	agL3WfVoryK1qsGBvEeGueGiarUSN6xDQ8nTct1zaf5Z0uQ8GT3Yy8iV6FSZLSh5vT4ZH1Ud49K
	uK8OjkosZ9qG3jV5xVjrmEZL+BoX8NjG98
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr11365597eec.28.1793456695668;
        Sat, 31 Oct 2026 07:24:55 -0700 (PDT)
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr11365549eec.28.1793456694941;
        Sat, 31 Oct 2026 07:24:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:24:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 0/7] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Sat, 31 Oct 2026 22:24:26 +0800
Message-ID: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX3hfc0AxMatWS
 jkmmCqyEYl3JeW1wHUj1nlWawRgchlGbiVrpY4MdM0ynBOQ85pwl3SVF/TaOQjg358vaxXglkyZ
 /hd7SCyuTj4+E6SJ+DLFbtiXdhN/yMftVwHS4kMYvhyyvg2MwO4ytz/qC08838DHmKxiD3B6B6d
 ZwVGrl1pXeejz8wXpQ5t2pkftvtI5iV082C138w7bjN2WID7L4ChDbj+Akh4QV5N+qoCvIX8uvd
 GXxMBZA97s0IzEDWGh3NDfwwKEMmVDLqF/XV3ALJ29rTsaqPG226CECKPuN1XGGpVzeUSdH/XkV
 V1hlfSYXJLtd8U5TjII4iHxqC17U7GU+/0YyOBxT4mK3Co0I5wI6fmCrgJV/eP21temkVNPJHsf
 5ul25myH/b2n/o7Ks9BgwjFtVPGUl/oTZuCKeoTc8GQfgqGnxdjOy6wiTRa+dhrSTxn5NkjmHRe
 i7of6o4pJKYOE4c/z2w==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae5fa38 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U0NwJVSz-9pN22jjyd8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: -csoGksXr5ugRu2b7_iZ7wSfyGjxQU5Q
X-Proofpoint-GUID: -csoGksXr5ugRu2b7_iZ7wSfyGjxQU5Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfXw7jW6xCn1HV5
 g4gxCTdVkzXZseU8Ln4qoljw8CW0rrKPzPilntokNGy2r49l6XhWdWtUmcI7XieoEoHNDBNEneE
 Y0+ItYBQIPnz5OLkj+N0anSL8d7uYUY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride and RRD board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Dependencies:
- [PATCH v5 0/2] Add PCIe support for Qualcomm Nord platform
  https://lore.kernel.org/all/20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Correct pcie_phy vdda-pll b/c/d supply: vreg_l1e_0p9 -> vreg_l2e_0p9
- New patches for RRD WLAN/BT support as RRD boards with WLAN/BT module
  become available in lab for testing
- Link to v3: https://lore.kernel.org/all/20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to the unresolved dependencies
- Add PMIC E GPIO7 for enabling WCN DIG rail that feeds the WCN7850
  VDD_DIG domain
- Drop RRD WiFi patch as RRD with WiFi module is not easily available
- New patch to add Bluetooth support for Ride board
- Link to v2: https://lore.kernel.org/all/20260915015632.283642-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shuai Zhang (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
  arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support

Yu Zhang(Yuriy) (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 179 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 179 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1577 insertions(+), 4 deletions(-)

-- 
2.43.0

