Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953646;
	b=Z2X/fK8MqexafGs6il90S2J+ZHrIFw/isHBUn1MSVpEmMw8AGmn5XFNE6p35+jWhejFp
	 5w8nbIrcORMy6XpE5qR+9FELUrTPa+8O3sA1FDMh4Mq8lhM6vVvSuokOiIndmdPq5lAu3
	 PPGTDAJ/nSWGaBMXE3kMjvHx6JbEqrENBhdDbSepsd3L6spewLkTx89KVQdJL81xYcvaV
	 qsSszX7KxDAaLK8QQa7lzm/KuhVoxAkoQSCFbDpqubaUQSaIwVhYKTjYJsJVq2zk6YTmi
	 eWFaCY0+lOHEVyoVK5pqTayCh/AWU6ZXLm8xqZyEjpaKRBYXY1SZxcT5MAHHp+HUY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
	b=QQ8FeY7BQqiCy8IEnSrstuz5jt9v8i5FeH8vuyovmKivyh8ZJTvbeAQMVpPe9DymLbUn
	 TjZhBF0CQPhmFhLJa3zzJ1DcnKiFaubH1R+ICm43skkwEMTEEvFQv53ETN2VyvmsnLacY
	 TlJ8R/ER9D+lTIQoj93dLQwsavkctcdyh+r7EDHIJ6I4kf7egUEs92pnI+tYvpq7+NMct
	 NDlUb63/VTmxLps+4dXJEEIrpflhqM4Kxb3n3lyLrHuVte+Pw9POgIzYbI4DaQ4vPK+YO
	 vMYrQ3lp0sclUkgQNqDiCTs0rjnR4VR4+BdiNcLY1Xwy3v40H3bwcb5DEgQlhi8Bb/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VAzK8f/P";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cMyszcda;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06166606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06166606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VAzK8f/P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cMyszcda
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJpJ1679473
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwX
	j1Fjk21E=; b=VAzK8f/PU6/PwE6Sv5E6eILvFl//DgpBsZ43k45z4PJsbk3U49m
	Pp5H/fqHTAFEahXIRqhtpm97p6IjB5YyJDyAH2I1HviPoNpRfqRDlllZ3Vunc063
	aoMCJzqpUsdsIMjAHgYEwbNTfAUFOpAK1G27JjbGcsNmok+mj9QXJSTfJ9zaDxKw
	j164fGMhDakTJ5NvgMwhk2ojwklk+DwRoB4Yy/yWVdhcBEUtUfCbdPVMbl0CbAMh
	QgDZ/5tYLYQ9SQn5xw4prsVB/SVlarEsknG+cTyAlha1Kgbgukb3lEop24ztdnyO
	sK3i3aKz6yGaPhFd/t6qKD7HiwsZqYjd2ZA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc9upf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:27:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso689728a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953644; x=1794558444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
        b=cMyszcdavbObhSkmu5xcIPuPPkjDQtdpPRwcJ+NORHttlTxWazR+tOFYn9ejafFRxq
         A7b2d4jKGkXrWzfzjOT1fBDGGRW7PhIq2XLCrVDlB7wmeSPqAVMrDQQT57Sfe8g8egNJ
         sAILYGMROKwcLzIwMpjMVgCiET8z/SJVS4MjbziVLWVPx/3jH75QpafrOK+5WfTJbKaY
         AKFWrNgbFUDe5WvExhzAQZ21FHfyiB+IVPaASNfUdRl1W7nWWcUbNhlwjxL4TAq0ff4P
         0QvhcTwvh/VDY3zgWYWXS0RCo6vNzJOFfNqhcz0TQ0byv1LG53sGIQeu40mW9Hg0WXiH
         jqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953644; x=1794558444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
        b=PBz1LJZLAKnQQYHrx7nA0O6vo8HHpJFJJpYvG5cBw5b1kCMymoA0nNB8Nd1vXis6/6
         OK7yxkXWYmOZMBHBKtWc9EeVUps27jUKlOxTd6pgJTup/fuCHZ9WrR528GF/SQUmU7Sd
         ev/wy80gl8V5pSn/5MM18xS9oR62EppT99QzyWKfDKFtuEptDYR+y/0U06NZno1Af7xQ
         lIuxWnUNaoqWL5Tv8prgsYuHCyYZqGe1JmknojqYYIoSrroBldo6mjujNZQRok8khq2+
         y0E9S7bxym5pu6Q9s4upNZn37/OlmAuTU+5mUZHJttaSJgTlcVcm9NEKnMdXx2NWU3Lp
         32yw==
X-Forwarded-Encrypted: i=1; AL+hErGRUqjegj4mnr1i1j6SBqmFxMkmbQh2FbF3nUsyY2vurmke6CDgKrUJseM0pvlCv0lVgLCKqVws/lYTTcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xp0isYlDxRbfHUGDXqC4hxjEy9qw7FI/kFrz8nUDQY1yMgZQ8
	7pr4A6VF/5oshYqUpwhpwnvcNP1TtSvxuJincpPOk5s7tkUnRhMBgMh8w9Rm2uBSTsa2o+U3aqI
	iKFD4gEGSjCQvdPU77eO2jp/K+ZZMZifhPTr6d2oA/ID3ax9XdsR8vL95zkSX4qjeQOI=
X-Gm-Gg: AYBFou14SZfOK9bqDRCbqOQCH2fW0ngOS2HJ2BDIjy5XEwd3yK+u6CQFTX5s/0nHNz5
	OYadWyviISCZUS+OstNKKjfh9js+Gw35B282NBEzF+zDJgvY53o9HZ+c6Rki2hLIcJsp4XgRA9b
	4kxyWhMzX9xuNhQKZTFOT9TkjAnuHNuDt+YCcuXdObhc/vhrTzaiiFAks9ZaWWaXuocR6ui8Ev7
	E4WvfSIpIZpoE14pby3zvpqwLAss/uWdoQtM7tTH7YKQ6d/rq9XiHUD0BEojJdFdivWXloLgNAl
	L8Z0IE56pQsPLU2mDCkuI19akJNflGFR7bW13Qyo3hA7YlxDPB/2L6YQQDCIUOz6/EHQeJPgaVS
	2RosSJGbmhSeAeGi3diOMdcM8d+oolGQvPQFIvGjvudrQZq0OqJ3Czi9r86VRxoZinBrQUxCJWg
	6dTQ==
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr1738382a91.25.1793953644456;
        Fri, 06 Nov 2026 00:27:24 -0800 (PST)
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr1738351a91.25.1793953643921;
        Fri, 06 Nov 2026 00:27:23 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:23 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 0/3] phy: qcom: carry live SS-link state without growing enum phy_mode
Date: Fri,  6 Nov 2026 13:57:13 +0530
Message-ID: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7FqTbTOnAcvaa8889oDjoJCM4_GH79NW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX7lnXfCm4OHXo
 MZ6d4IX7myjuBQjPiGVEpsfhCNELoFHUkfdIjuRytawPgqgPYUxd7/XdWSp5vQ+guRN7ATn90R0
 jOLLsJwL5ZAFnoETrIDW7bUB8jccGoZ9HJ5gfRu2aurZI1e6Y6BqjE4vz0PEd1029SQ4hLS+EJg
 MJ3JJKbxDxOG8O8pXrAGBWkvtWUxLv4xcCfyTcSApJer1sZ4mdH9jdJzpVLgZtoDGsOkMmYmUu4
 5DN+YXgipr+Z9nT4beS0Ea1IM609T9MyxchGatBCBJ0fsCpoWOk13D+EXjHNAPByQnQXYvXvfAi
 Wtdsz5PtDg9/g5wkf/dZqKb9kTb8JrNkPCAD5WdQwuuutRpI78lGuYWR3DIpESoY2r3vUo1GfTz
 s90F344iKaKr/MnoOkhTNkmgDQEirgFdGNztRLjmPpUErCbMynSGP4QoaaF9XxF7c/HqmoH8Z8X
 VKozQnGtKkOQVEvyFEA==
X-Proofpoint-GUID: 7FqTbTOnAcvaa8889oDjoJCM4_GH79NW
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed8f6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=rQF6O0ERi8bj5yKtaRIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX9KfRsJa3QGpF
 jwFqlYseZptWKp1bU5AW2bYS2J1TKdOSGG7IEMv+MbwPJDhYfaeIVslO+pnpMZz28FcH7Us7IZP
 ToPW744t4JxdO3+rKQltabdql4Yeh+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
when a SuperSpeed link is present; otherwise they fall back to
receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
made by comparing phy_mode against
PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
calls phy_set_mode()/phy_set_mode_ext() with the base
PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
submodes. As a result, the comparison is always false and the PHY
always falls back to ARCVR_DTCT_EVENT_SEL, the legacy USB2
receiver-detect path, regardless of actual link state.

Add a dedicated qcom_usb_ss_state submode and carry it through the
generic submode argument phy_set_mode_ext() already defines for this
purpose, instead of adding more values to the already-overloaded
phy_mode USB host/device submode list.

Patch 1 adds the shared enum qcom_usb_ss_state (UNKNOWN/PRESENT/
ABSENT) as the submode contract. Patch 2 makes
phy-qcom-qmp-combo.c switch on it instead of on phy_mode. Patch 3
makes dwc3-qcom.c sample live SuperSpeed child-device presence at
suspend entry and pass it down.

The contract is intentionally generic so phy-qcom-qmp-usb.c can adopt
it the same way for the gadget-side case in a follow-up series,
without a second mechanism.

Tested on an x1e80100 CRD. On a host port with a SuperSpeed hub
attached, suspended the system and then connected a SuperSpeed USB
pendrive to the hub; confirmed ALFPS_DTCT_EN is set instead of the
legacy ARCVR_DTCT_EVENT_SEL mask. Repeated the same sequence on the
USB-OTG capable port with the same result. As a cross-check, repeated
both suspend scenarios with a High-Speed-only pendrive attached, and
again with nothing attached, and confirmed the PHY falls back to
ARCVR_DTCT_EVENT_SEL in both cases, as expected when no SuperSpeed
device is present.

This series spans both the generic PHY framework tree and the USB/DWC3
tree: patch 1 adds a new header, patch 2 depends on patch 1 and touches
drivers/phy/qualcomm/, patch 3 depends on patches 1-2 and touches
drivers/usb/dwc3/. All three should be merged in order and ideally
through the same tree (or with an immutable branch) to avoid a window
where dwc3-qcom.c references a submode phy-qcom-qmp-combo.c doesn't
yet switch on. ARM/QUALCOMM MAILING LIST (linux-arm-msm@vger.kernel.org)
is Cc'd on all three patches since it covers both directories.

Tapas Rana (3):
  phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
  phy: qcom: qmp-combo: Select LFPS detect only when SS link is
    confirmed present
  usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 +++++++++++++++--
 drivers/usb/dwc3/dwc3-qcom.c              | 36 ++++++++++++++++++++++-
 include/linux/phy/phy-qcom-qmp-usb-ss.h   | 17 +++++++++++
 3 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h

-- 
2.43.0

