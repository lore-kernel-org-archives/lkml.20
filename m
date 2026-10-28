Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214001;
	b=Ucuw50qwDQoQwTrtWSvRu2ndr7YqQvUNjL+VfSOa3VBbNg4i2CDMXlm4MTghY0vjZEhv
	 QD5XMfepVQhhKKoANQBiiqVxZhgvJBgTVw7xBQI7+Q0MoN1WupxZvfl1uUPEjo43/E6EA
	 2UR6r45eH/H5Suys3eKu2EMKWQlAxzJcj092cDFSKJtBjqX/rV4Uo8cSHsAIcjViX1IS0
	 f2f1YvhFsMmE+cbk8y06KhDyGrBhFW12LP0pwYoKuiXbCk0fRPie0m8cIpb1hvLilqYGV
	 Jky0vNdpeeIrHWbT7EXXQWPeab3wTk5xuSz5P2Gzx1LMew2C8+zUEIWdfvXZa1i+RyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
	b=hIqyeJoc0NVZAcuPgOZb/uk8PAYUf6SnSh95Xr1DxEunDo1Oh5BCWu8C9xtYBN3G6ukK
	 hK3NKz0UtTAdrIyCw8Q/kg6FEKxqEDc8CHD5RjMBNKx9I1PRFyRQD8NfJAWUEwqQS1Ccx
	 AqKG+DyiGHA1Fsg3xOX5s8J8hrWOM8dzsqK/fosQ94ybAGSvvwf1Y5kbyPLJ4YnX7FF3D
	 FG9BghyMGXNasahhvtEZGaNxUJn/I5imk8YRQIlTw10nMOroGkN7eOgY+vcJNAXeQPBaF
	 oIveQ2TKBqArQzqtoRrMvexEWKFOtc2BroqPnJTJohFTj2Pbs+1/9djLPzHuHo3gV7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfQqSZN8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hbl9ZqCe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A370606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A370606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfQqSZN8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hbl9ZqCe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkSHu3050424
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vMX5mTiEmVP
	Eae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=; b=MfQqSZN8+nDjqRL8kwcIv6Rs9A8
	ocedGDkFCTbgqUbXvjvIt8Y3F1l9SAYoYDnwBz+mDUTKBe9eip/csoGm4a5MeuaC
	mqsWBYYmbDFyuuJuu5uPQPm0IgpfA6wVEWejeglaqrD9SwqlJCY+V4CWwhsDQduF
	5nn4idd4CSWQdO/UeS1XByuQa1v08lCgUBfB3P6+HFCh8betkX0a9VShG4/DtS4m
	HRNkJLy5gMyGYA/OxVPqjBK7apWFXY3O/jLgWJuoJs/LayZtlFNvze5hgScy3AKC
	PQzVFkIjtPNdx8zTEhFvAdWaCxgym2oAylOgP4Lhs8C1jhZdJoutmp03Uuw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurct4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2545715eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214000; x=1793818800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=Hbl9ZqCeZW6WuB/q+GOTi/+oVSWNIXetmAL5lcPFdD+a4nOpGQyalJEBm3Ykr1ceZQ
         Hmae6q5mA4Z7YJQxrEWtMMDX+0zjFaqPuwPbLKAoT6Sy0aHykGefRBdujtUd4bj1RxnH
         IsQxHwFnrPY1cwooMFlnzT9KkKJd/xDNcAkO5qXRwpPqWoNDs+6gSrS+SmYE19ohUOu4
         tmlJ8D7SZLfXcdPl59k/DsfJb6NC/LKtfLCBerhlqef4kEJp3cTpi6OE2R7xVdjUJIe/
         5Pi+ucWjI0Qm4W2H57Dae03M3ud2tqbFT+JJl8dxIE7fti84qu0uABCElnQEneNwC3xp
         po6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214000; x=1793818800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=AY16NoV4nmkyAUM0lwjYajJxO/I5LibfTGpM3PjZZh3Dr6kTLvaO1POus08zTLNpM/
         csOPNIehdqiQfNt6Z9R3In66cikEAEGvIAU5hYXQ8aKF7obq4FydvySAGsU2zDko2nzP
         5rABEWrdCSuLtWsVccl5sj+wDm7hjThFbtUwSHAb0hHC6vnpQ4AVTb+F8+MPOksYX6ds
         LbltU1i0hT6Fnc6oO17u/Rr0FfRe2M4jyF+zxqTVvzKd886163XezKxl7iuRamplW0Tm
         1snJ3Sg+RmqBsOHDKIuPV7+pmBR5pInOI2pop918WigdiSE0GCQe4iW6iyP2rjpGwjA5
         kmnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE5NTcd4HBlNytqdpTyWmx/7/TzFgs7GKrLo3FAcjIrDU1P769O0Hi2xRiBqlcvQyEOecmrxPpLNVOda0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiQdWHEEMZCfTMRVx6ZPVizn3JTkdtTAZM+aXFGuFN4jwoLYVR
	SRDX24HsGwmQGzlQ3B0MD7Npkv99D/6CPOfmnr20ThEwtKvriBq5W3WzZ/gPvLAM0mn5nYB5CVb
	KCcV0lLIlBPThQMQc2UmOXDjTT6AV8mLeCnsfJNDBF/Jyzdp6FP2xqDU83DmEeZ152a4=
X-Gm-Gg: AYBFou0Ydn+ABEgTaUzt3qCvQ92As4SV3PnsYaE0Ohhy6f2vEgOevDUSMY+udQ6yEIg
	anGEiWv/0potJwZBS6Pr5hO+zemkZb+hscw3ja4c7KXe5qmnfw4rRO0sEy6LbIIwCBTHxLLLEEi
	pP9EcyGccJniXaVCpQ1AYktoQ92GBh14iS9Jhg4aai5DKBlhJ65pIWzijW6LnQxpAgHQvk/OCdz
	sG2GJD6UYhX5njcuU6m5T7xtk/qLqmKdpxJrBGidJ09na1h0t0K0Eq6GnBPv6JuXKLICYzm+vkS
	OeYdjcE8Wuy0wiNgegf3VhwoLYaapc5uDBGw7r4UwJIXQU1azXzMvn7lgiysBiV5TJA6+QPMffv
	Uu6UOSjlIL/0LYE36vE7kXeICLfTRJOtdCtZcLbiNkI6kY1SaXmacwCb8s/9rB0sLO3XmZX7se/
	zePi/qBg==
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr4592433eec.40.1793213999840;
        Wed, 28 Oct 2026 11:59:59 -0700 (PDT)
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr4592405eec.40.1793213999315;
        Wed, 28 Oct 2026 11:59:59 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:58 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Thu, 29 Oct 2026 00:29:34 +0530
Message-Id: <6499d6761ba6f338544fc8a90b4a96e55b5b4b12.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXxxzJ9vYHBzUK
 A+i3dEbacDsuoajvdx1AMVvWBgtb0rkKHVHwnUUBH8EbGpsCIBOfH7rWEY7Yax31U0hh+B8qcY0
 f8U1PbNAKfG4k7aQrt0IsccCieDooc4gflFCiZbSCKQkHVyJpJvoXjP4qGYnQzzEAYdjIAPi8Xy
 ks+fLqR1bS6NYnb0NRVTCn7r9LdaiJPlIh9w7svgiQEZqTvRCJ76XCadoF/5ipXObNse1aDfLlS
 a6YjbRTp8yAV7jyV05ah4opJmExApwyamRZnbZKxcOiw8lV1TBiXn99eZsW9p8cBqZY4IQBJ3IZ
 LuH+QSvR+K1Cf4HldfaGNm8DBZDek1Cgpg6SSqedIDK7mr+SijlVEui0PZu0OV1CPlx/HUY53DB
 rlEZkFIdlYQCQVc1cQDux2kCZdgwY8XViJnF4dCNqZw8xb67Ugh/Ru25p7ja5P7fWa1N5QlMszY
 ZnuiXIVM2pErJvJyHOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX5ve4tjV2Unzm
 yy5WUifHeSMwtg2MvugXBD3BQdYBiIG6hR2vPFSQdMX4rzqO0XI4dHG8O793W8KGAvdqtTyPaS4
 pe5/DrdMLe3zgwPMBQdNOQ9AYQ8PX1k=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae24630 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: RfVfLFk_Ii4-_A0vVqzBw_7SAOmadpAX
X-Proofpoint-ORIG-GUID: RfVfLFk_Ii4-_A0vVqzBw_7SAOmadpAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

