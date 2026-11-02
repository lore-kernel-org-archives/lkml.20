Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659403;
	b=4ccHCcWBlBzHRN9/gbmNBLDuiZhvWlJyWA0I3ZVC0O4b9UlX60MynblS6oO6EmdCAA0a
	 awSw2rlVY5NwouNgg2CmkUw9BQ7jORr5Eilr055wd1SUkbNF3qCG0durzgy2mvMOBAyTe
	 /qWCaT/dVXlNjPh2sIMCt3TWQSKf92AiOpKv/9WPRHn5jxCbks+fNp2/BzcWU0ewVQQVV
	 UkNK+UNkWJQb4DrEzM5WhOEV2wJLehrC2igFoiAittt7P7fcXeLUXmF4yEgmK0VG3haSV
	 s74nO7mekDiNm4xnfXxZn+KJ7rG8gwVFApLyDVZdO/qZmEl1jRHjPhbScSECXdLgZ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5NWGzmDuahMNbkrKYAl10NB7nlIcXGZEJ9qUJi6kgow=;
	b=RneCETFBhWEGj8EUzXagTjwYflGvY0BFDHrJ227FpnUqQ/Lo+uzRT2u6c4y9IXOhfDIB
	 SC5aok3jpDoLwreZf7pfiFfZTgiQyidx6Amw8+CdYtHO8WHOEiMahKZlIyrqRqiUN/4Nw
	 KF7XIY23klbs33TCeawTePs0UMCPJfBlirTYm+Xd5NwQmsAvg702RUW39bIUQjrESjExQ
	 VmU+WMZ2BPB+4qdXhDYJ82w6yLPDJAk6dKkgBQYJbHBb6pWqFOOzMponEqrxfRgm75m/a
	 z63t6hzkgGpGEA6A3cB2tbALNTX/bHqvlE9NuyOmtg8IOHDakl3Rgi1Y4ASWIk0yyWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZvfHXbD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hzCh1LKk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9F606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F9F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZvfHXbD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hzCh1LKk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K78dM1326116
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NWGzmDuahMNbkrKYAl10NB7nlIcXGZEJ9qUJi6kgow=; b=aZvfHXbDzulMKxX/
	/IuenZIGm5IZliUV3XpqYnoISo7QqCyGgR+/zDAVww6qei3y3/Tv3OSmzzJyNaZ4
	bEyC2EWjV550Kl6SrcAdR9G5ZepLXKlU2WZzbqAD9eGZuhyN7J+5rS+L0uweaDpD
	/D60/SC2Kk57CxJxUUz99CE2rr7WKi9jj3cb2Q3yFlOTgLuwpWF4vIwtTEaqY1GE
	GTVBqI+1vCKtQb9oQENCwzptsnUUvPKtrur//7Fu4uBEq6v23HaC2ZahgHzU6Iz6
	g09j+wy9mZO+ehLs7aloj8kcxBi2MziUDgUc4Yh73SfHy1+iBJ83vpP49JSPv8LF
	7q7Udw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph1bhvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:43:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so5994849eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793659395; x=1794264195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NWGzmDuahMNbkrKYAl10NB7nlIcXGZEJ9qUJi6kgow=;
        b=hzCh1LKkFAXucYa+QHLns+Ry1EzAVGUx2d/KaMj0wxBhdvHg+WbboAbfMmHHBq09hZ
         uhhWhvNbdsI0bTBtgvUccpFqHSTHVmGIElhYPFBzhu0xfhsd6wP5XliXynDgiM96jdbO
         ntJRG5Pzs1DlkIdB/TVo/OhUth98iLW86bgGxje8xpyULZPxpEQ84CCP79lmko6BbQl5
         fncjgpvwj/SCo/1Pg1mq0SV8NvfXzn7+HMLsyZm6U5yeJZ1FNSDbiEaCQ2ja5rze71gr
         UPqQZLAIgyc8NhVvNOyDwft3jnDWxP51mxY7hOh86uIRQBWvr00m267HFORpJlV+gxIj
         oPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659395; x=1794264195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NWGzmDuahMNbkrKYAl10NB7nlIcXGZEJ9qUJi6kgow=;
        b=Mb6amReeCKsfnui+YIFo5IfhST5hlMyrXYvRTiaWkgw/kxCOZC0QNJiN8EVxKUZeSu
         6RrHj5di6m2Nb/AWT6Ler268PMBROdGc1kd2ets+i/DZOWNnPDbbCKR/Pad2l/KFdiCC
         pU0h3GCxtwE0QJXz1FE5wVgssJatu4V0k51h6pNd4TH0hx72HihSAnnPB8PUkqWJOG65
         /5XN2XxxBJhsAxDYgLOkVx3y13Z39PtrkGXqQ6PWj06i71hc+CT6sC63E1kEdlUvvg7O
         g5KGR1OJBTmQXiY3GyQjaZDdfDanmgSSZ73w371gHZapCf55csf42JkTTUOYDsvR95XL
         2kcA==
X-Forwarded-Encrypted: i=1; AKwUvBy/v3emWXXx43xK27TqJDG1bV1OHXZLG21FusDK1KJP+HgMUPTFDM8hBMeWCmwfMsMbd8vzWUTKS2gqM8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wrr58hWKBTWZKpyh1EimyrvcKx9BFnc4+UC2Ljs5uxuwG4np+
	bkPeqwpbcrJLuT1I6nOpikohCVWgXBMhAcTQfzJrbR8hPXnSTVq/1tEJcWYZ7+rnXUBrqIzquey
	bLDSf2Jk1QtPjPXHWY5Oixc556lO6bnXZnStu87J4iUVTpml3hkocRsfVBP2mgZETnco=
X-Gm-Gg: AYBFou2JHxLlsFaifwBkCs7YJrIjELGQkolmN6necMyDu/y3xU3xL/0f2G/sVHK9mYJ
	n63MJgN5xvoEFB+TZ4LmcM0e2YCQ/I/bjz/dGf6VwZS1svbyn35VSe5JZPN3iKt+q77Lvd4lCzj
	0ngpM16bsYAN8lSUowbZSlK1xMzUpjk45ptfXT+5mZ1l6YDaSlc2IdqhlSt5i7r0cUOznPVOYlR
	i/DGHDZ6vk/rgvd4jNlTLb3nhEr4nNur4zNRpDdLZLEjIrBASRcS+HHZ2UPE4WpldxnK4iZ3fW6
	7SF+bq5h3QKMQKU/ozmq3LyOiA6A03hgH+ilabw3DZwvZeM4m/hvrcKQCZEhbxUBOw7wf05lGMx
	TNCXTqAU6+uPtjUomqIyWdjmeAlpk+/cfvOSmQP6SqF/WRJbe2S+Trb2N2r65SDBaM3VnJ9IWh0
	NwZg==
X-Received: by 2002:a05:7301:618a:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a424199bemr16044943eec.37.1793659395013;
        Mon, 02 Nov 2026 14:43:15 -0800 (PST)
X-Received: by 2002:a05:7301:618a:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a424199bemr16044898eec.37.1793659394227;
        Mon, 02 Nov 2026 14:43:14 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38673319eec.19.2026.11.02.14.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:43:13 -0800 (PST)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 04:12:18 +0530
Subject: [PATCH v2 2/2] rtc: qcom: rtc-glink: Add new driver to support
 alarms on Glymur & Hamoa boards
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
Message-Id: <20261103-rtc-glink-cleanup-v2-2-895eb6e8d890@qti.qualcomm.com>
References: <20261103-rtc-glink-cleanup-v2-0-895eb6e8d890@qti.qualcomm.com>
In-Reply-To: <20261103-rtc-glink-cleanup-v2-0-895eb6e8d890@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793659383; l=22053;
 i=kamalw@qti.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=Ts6DymgZyVomCFB7KrVfm3QeWv43CCB6C6hnH1usCnQ=;
 b=rLqod8f+9DcMgW1z6JU9DN549/NKVzfIy0aLFfwxV2KW1kXQ+0ZkeLIiTja4erfTGRGGeCArT
 2uTUQJS0azzAELAr3v7y59UpRgd5cY/xglFTsxvoq64Tfyzz1LwXjOZ
X-Developer-Key: i=kamalw@qti.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-GUID: P-EhBRK1crDRY8r7rR1lyNyPF1i7EE-r
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae91204 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=yMhMjlubAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=dliEPZjOB06Bp2xvOAUA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: P-EhBRK1crDRY8r7rR1lyNyPF1i7EE-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4OSBTYWx0ZWRfX1Qc2BJ+Mugcf
 /BQAT05Zh8ECf7XV3M3yi8IQv7JyV4ovhF6n8oNT+cDbdIlRVhkvS5AxDyzXclXS01dYHs8m5Sr
 1hvW815mBq3s8AgeMXnSrEXdG4KCjWcBmNZdg3I1g1LhnLOzJ2a66745YIlJMXwlN7uR61SUB96
 S1VZ+TO6zTgbwtyH5PrH3LKbDNubqWj12qOG5kt0fBV8IRSfLJEsVo2XdVrynotEP/MTdfD8M4K
 CI/6msd59XnmCvpc5k5DhSb3Gz1YkA6iXEw+XjMAbfGnhOjTw6IOKsaaJXTuY/55up1iiumjrvy
 yEJfOPULvF0trlCouKfoIJN9qB3FnpMNnJ8T6S/jJvtCKtiL2hxdDv2dsNCmy9sCJBuYWuWjkHZ
 it6aZNbm+OLciyJyEyTnjSSzo0GN3z13GZKyruScgGTh8Ae9zjjnNSFeL4UjjIH0Vd2D/OYwMBT
 +Ri7mvf24+oLHiRjU3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4OSBTYWx0ZWRfX4g/b0szsJqkW
 mnsGSJX4vHKd41f2lTO3aKvRqdk32f5lhAi38TFis6KWsMFgU7XiOxwdP46cch1e5fuSFwkGDIk
 yB4QlrwnaqIJ4EUEv8u5X/KBjbyPHRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020089

On some Qualcomm targets like Glymur & Hamoa, the SPMI based rtc-pm8xxx.c
driver is unable to receive alarm IRQs. This happens because the SPMI IRQ
permission for receiving the RTC alarms is routed to remote firmware that
implements the TAD feature [1].

TAD feature is a standard feature on Microsoft Windows OS based devices.
Since Glymur and Hamoa were originally launched on Windows OS, unlike the other
Qualcomm targets which were launched with Android/Linux OS, rtc-pm8xxx.c can
not provide alarm support on these targets due to the design change in the
RTC's SPMI IRQ routing.

In order to make the RTC alarm IRQ available on the Linux kernel, the PMIC RTC
Alarm IRQ is also relayed to APPS by the remote firmware via Glink interface.

To receive the relayed alarms on APPS and also to support normal time
read/write operations for RTC, add a new auxiliary driver `rtc-qcom-glink.c`
under the existing `pmic_glink` base driver, which will register an RTC device
and under the hood will handle the communication with the remote firmware for
RTC related operations via the pmic_glink interface driver.

Note - On the Qualcomm targets, pmic_glink driver is currently used for
communicating with the remote firmware by 3 clients i.e. qcom_battmgr,
ucsi_glink, altmode_glink aux client drivers. RTC glink will be the 4th aux
client to this pmic_glink driver.

[1] See "Control method time and alarm device" in the specification:
Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-defined-devices

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 MAINTAINERS                  |   7 +
 drivers/rtc/Kconfig          |  10 +
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-qcom-glink.c | 590 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 608 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaf2825ac945..b8f500581da2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23152,6 +23152,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 F:	drivers/power/supply/qcom_smbx.c
 
+QUALCOMM PMIC GLINK RTC DRIVER
+M:	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
+L:	linux-rtc@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/rtc/rtc-qcom-glink.c
+
 QUALCOMM PPE DRIVER
 M:	Luo Jie <jie.luo@oss.qualcomm.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 73ec9230edfd..41ace94550ed 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1863,6 +1863,16 @@ config RTC_DRV_PM8XXX
 	  To compile this driver as a module, choose M here: the
 	  module will be called rtc-pm8xxx.
 
+config RTC_DRV_QCOM_GLINK
+	tristate "Qualcomm PMIC GLINK RTC"
+	depends on QCOM_PMIC_GLINK
+	help
+	  Say Y here to enable support for the RTC exposed by the PMIC
+	  over the GLINK transport on Qualcomm platforms.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-qcom-glink.
+
 config RTC_DRV_TEGRA
 	tristate "NVIDIA Tegra Internal RTC driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 46f1a0fc2416..a01803a69ad7 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_RTC_DRV_FM3130)	+= rtc-fm3130.o
 obj-$(CONFIG_RTC_DRV_FSL_FTM_ALARM)	+= rtc-fsl-ftm-alarm.o
 obj-$(CONFIG_RTC_DRV_FTRTC010)	+= rtc-ftrtc010.o
 obj-$(CONFIG_RTC_DRV_GENERIC)	+= rtc-generic.o
+obj-$(CONFIG_RTC_DRV_QCOM_GLINK) += rtc-qcom-glink.o
 obj-$(CONFIG_RTC_DRV_GOLDFISH)	+= rtc-goldfish.o
 obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
diff --git a/drivers/rtc/rtc-qcom-glink.c b/drivers/rtc/rtc-qcom-glink.c
new file mode 100644
index 000000000000..b1394b08e28d
--- /dev/null
+++ b/drivers/rtc/rtc-qcom-glink.c
@@ -0,0 +1,590 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/pdr.h>
+#include <linux/soc/qcom/pmic_glink.h>
+#include <linux/timekeeping.h>
+#include <linux/workqueue.h>
+
+#define PMIC_GLINK_OWNER_RTC		32784
+
+#define RTC_GLINK_SET_TIMER_VALUE	0x63
+#define RTC_GLINK_GET_TIMER_VALUE	0x65
+#define RTC_GLINK_GET_REAL_TIME		0x68
+#define RTC_GLINK_SET_REAL_TIME		0x69
+#define RTC_GLINK_ALARM_EXPIRED		0x6A
+
+#define QCOM_RTC_GLINK_TIME		0
+#define QCOM_RTC_GLINK_ALARM_TIME	1
+#define QCOM_RTC_GLINK_ALARM_ENABLE	2
+
+#define RTC_GLINK_W0_YEAR		GENMASK(15, 0)
+#define RTC_GLINK_W0_MONTH		GENMASK(23, 16)
+#define RTC_GLINK_W0_DAY		GENMASK(31, 24)
+#define RTC_GLINK_W1_HOUR		GENMASK(7, 0)
+#define RTC_GLINK_W1_MIN		GENMASK(15, 8)
+#define RTC_GLINK_W1_SEC		GENMASK(23, 16)
+#define RTC_GLINK_W1_VALID		GENMASK(31, 24)
+
+struct qcom_rtc_glink_get_timer_req {
+	struct pmic_glink_hdr	hdr;
+	__le32			timer_id;
+};
+
+struct qcom_rtc_glink_set_timer_req {
+	struct pmic_glink_hdr	hdr;
+	__le32			timer_id;
+	__le32			timer_value;
+};
+
+struct qcom_rtc_glink_generic_req {
+	struct pmic_glink_hdr	hdr;
+};
+
+struct qcom_rtc_glink_status_resp {
+	struct pmic_glink_hdr	hdr;
+	__le32			return_status;
+};
+
+/*
+ * Shared by SET_TIMER_VALUE (value = pass/fail status) and
+ * GET_TIMER_VALUE (value = the timer's current value) responses --
+ * firmware never echoes the request's timer_id back.
+ */
+struct qcom_rtc_glink_timer_resp {
+	struct pmic_glink_hdr	hdr;
+	__le32			value;
+};
+
+struct qcom_rtc_glink_real_time_resp {
+	struct pmic_glink_hdr	hdr;
+	__le32			return_status;
+	__le32			real_time_data[4];
+};
+
+struct qcom_rtc_glink_set_real_time_req {
+	struct pmic_glink_hdr	hdr;
+	__le32			real_time_data[4];
+};
+
+struct qcom_rtc_glink {
+	struct device		*dev;
+	struct pmic_glink_client *client;
+	struct rtc_device	*rtc;
+
+	struct completion	ack;
+	struct work_struct	alarm_work;
+
+	spinlock_t		state_lock;
+	bool			service_up;
+	bool			request_pending;
+	bool			timed_out;
+
+	int			error;
+	u32			resp_value;
+	struct rtc_time		resp_tm;
+	bool			resp_valid;
+};
+
+static int qcom_rtc_glink_request(struct qcom_rtc_glink *rtc_glink,
+				  void *data, size_t len)
+{
+	unsigned long flags;
+	bool timed_out = false;
+	int ret;
+
+	/*
+	 * Reinit the completion before request_pending becomes visible to
+	 * qcom_rtc_glink_pdr_notify(), so a concurrent SSR down-transition
+	 * can't complete() a stale completion that gets wiped out by
+	 * reinit_completion() right after.
+	 */
+	reinit_completion(&rtc_glink->ack);
+	rtc_glink->error = 0;
+	rtc_glink->resp_valid = false;
+
+	spin_lock_irqsave(&rtc_glink->state_lock, flags);
+	if (!rtc_glink->service_up || rtc_glink->timed_out) {
+		spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
+		return !rtc_glink->service_up ? -ECONNRESET : -EAGAIN;
+	}
+	rtc_glink->request_pending = true;
+	spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
+
+	ret = pmic_glink_send(rtc_glink->client, data, len);
+	if (!ret && !wait_for_completion_timeout(&rtc_glink->ack, HZ)) {
+		ret = -ETIMEDOUT;
+		timed_out = true;
+	}
+
+	spin_lock_irqsave(&rtc_glink->state_lock, flags);
+	rtc_glink->request_pending = false;
+	rtc_glink->timed_out |= timed_out;
+	spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
+
+	return ret < 0 ? ret : rtc_glink->error;
+}
+
+static int qcom_rtc_glink_set_timer_value(struct qcom_rtc_glink *rtc_glink,
+					  u32 timer_id, u32 timer_value)
+{
+	struct qcom_rtc_glink_set_timer_req msg = {
+		.hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_RTC),
+		.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
+		.hdr.opcode = cpu_to_le32(RTC_GLINK_SET_TIMER_VALUE),
+		.timer_id = cpu_to_le32(timer_id),
+		.timer_value = cpu_to_le32(timer_value),
+	};
+
+	dev_dbg(rtc_glink->dev,
+		"TX opcode=0x%x timer_id=%u timer_value=%u\n",
+		RTC_GLINK_SET_TIMER_VALUE, timer_id, timer_value);
+	return qcom_rtc_glink_request(rtc_glink, &msg, sizeof(msg));
+}
+
+static int qcom_rtc_glink_get_timer_value(struct qcom_rtc_glink *rtc_glink,
+					  u32 timer_id, u32 *timer_value)
+{
+	struct qcom_rtc_glink_get_timer_req msg = {
+		.hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_RTC),
+		.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
+		.hdr.opcode = cpu_to_le32(RTC_GLINK_GET_TIMER_VALUE),
+		.timer_id = cpu_to_le32(timer_id),
+	};
+	int ret;
+
+	dev_dbg(rtc_glink->dev,
+		"TX opcode=0x%x timer_id=%u\n",
+		RTC_GLINK_GET_TIMER_VALUE, timer_id);
+	ret = qcom_rtc_glink_request(rtc_glink, &msg, sizeof(msg));
+	if (ret)
+		return ret;
+	if (!rtc_glink->resp_valid)
+		return -EIO;
+
+	*timer_value = rtc_glink->resp_value;
+	return 0;
+}
+
+static int qcom_rtc_glink_get_real_time(struct qcom_rtc_glink *rtc_glink, struct rtc_time *tm)
+{
+	struct qcom_rtc_glink_generic_req msg = {
+		.hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_RTC),
+		.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
+		.hdr.opcode = cpu_to_le32(RTC_GLINK_GET_REAL_TIME),
+	};
+	int ret;
+
+	dev_dbg(rtc_glink->dev, "TX opcode=0x%x\n", RTC_GLINK_GET_REAL_TIME);
+	ret = qcom_rtc_glink_request(rtc_glink, &msg, sizeof(msg));
+	if (ret)
+		return ret;
+	if (!rtc_glink->resp_valid)
+		return -EIO;
+
+	*tm = rtc_glink->resp_tm;
+	return 0;
+}
+
+static int qcom_rtc_glink_set_real_time(struct qcom_rtc_glink *rtc_glink,
+					struct rtc_time *tm)
+{
+	struct qcom_rtc_glink_set_real_time_req msg = {};
+	u32 w0, w1;
+
+	w0 = FIELD_PREP(RTC_GLINK_W0_YEAR, tm->tm_year + 1900) |
+	     FIELD_PREP(RTC_GLINK_W0_MONTH, tm->tm_mon + 1) |
+	     FIELD_PREP(RTC_GLINK_W0_DAY, tm->tm_mday);
+	w1 = FIELD_PREP(RTC_GLINK_W1_HOUR, tm->tm_hour) |
+	     FIELD_PREP(RTC_GLINK_W1_MIN, tm->tm_min) |
+	     FIELD_PREP(RTC_GLINK_W1_SEC, tm->tm_sec) |
+	     FIELD_PREP(RTC_GLINK_W1_VALID, 1);
+
+	msg.hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_RTC);
+	msg.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP);
+	msg.hdr.opcode = cpu_to_le32(RTC_GLINK_SET_REAL_TIME);
+	msg.real_time_data[0] = cpu_to_le32(w0);
+	msg.real_time_data[1] = cpu_to_le32(w1);
+	msg.real_time_data[2] = 0;
+	msg.real_time_data[3] = 0;
+
+	dev_dbg(rtc_glink->dev, "TX opcode=0x%x data=%08x %08x\n", RTC_GLINK_SET_REAL_TIME, w0, w1);
+	return qcom_rtc_glink_request(rtc_glink, &msg, sizeof(msg));
+}
+
+static int qcom_rtc_glink_get_time(struct qcom_rtc_glink *rtc_glink,
+				   struct rtc_time *time)
+{
+	return qcom_rtc_glink_get_real_time(rtc_glink, time);
+}
+
+static int qcom_rtc_glink_set_time(struct qcom_rtc_glink *rtc_glink,
+				   struct rtc_time *time)
+{
+	return qcom_rtc_glink_set_real_time(rtc_glink, time);
+}
+
+static int qcom_rtc_glink_set_alarm_en(struct qcom_rtc_glink *rtc_glink,
+				       int enabled)
+{
+	return qcom_rtc_glink_set_timer_value(rtc_glink,
+					      QCOM_RTC_GLINK_ALARM_ENABLE,
+					      enabled);
+}
+
+static int qcom_rtc_glink_set_alarm(struct qcom_rtc_glink *rtc_glink,
+				    struct rtc_wkalrm *alarm)
+{
+	time64_t alarm_t = rtc_tm_to_time64(&alarm->time);
+	struct rtc_time now_tm;
+	time64_t now_real, secs_until_alarm;
+	u32 fw_current, fw_alarm;
+	int ret;
+
+	ret = qcom_rtc_glink_get_time(rtc_glink, &now_tm);
+	if (ret)
+		return ret;
+
+	now_real = rtc_tm_to_time64(&now_tm);
+	secs_until_alarm = alarm_t - now_real;
+	dev_dbg(rtc_glink->dev, "set_alarm: now_real=%lld alarm_t=%lld delta=%lld\n",
+		now_real, alarm_t, secs_until_alarm);
+
+	if (secs_until_alarm < 0)
+		return -EINVAL;
+	if (secs_until_alarm > U32_MAX)
+		return -ERANGE;
+
+	ret = qcom_rtc_glink_get_timer_value(rtc_glink, QCOM_RTC_GLINK_TIME, &fw_current);
+	if (ret)
+		return ret;
+	if (fw_current == U32_MAX)
+		fw_current = 0;
+	fw_alarm = fw_current + (u32)secs_until_alarm;
+	dev_dbg(rtc_glink->dev, "set_alarm: fw_current=%u fw_alarm=%u\n", fw_current, fw_alarm);
+
+	ret = qcom_rtc_glink_set_alarm_en(rtc_glink, 0);
+	if (ret)
+		return ret;
+
+	ret = qcom_rtc_glink_set_timer_value(rtc_glink, QCOM_RTC_GLINK_ALARM_TIME, fw_alarm);
+	if (ret)
+		return ret;
+
+	return qcom_rtc_glink_set_alarm_en(rtc_glink, alarm->enabled);
+}
+
+static int qcom_rtc_glink_get_alarm(struct qcom_rtc_glink *rtc_glink,
+				    struct rtc_wkalrm *alarm)
+{
+	u32 fw_alarm_time, fw_current, alarm_en;
+	struct rtc_time now_tm;
+	time64_t now_real, secs_until_alarm, alarm_real;
+	int ret;
+
+	ret = qcom_rtc_glink_get_timer_value(rtc_glink, QCOM_RTC_GLINK_ALARM_TIME, &fw_alarm_time);
+	if (ret)
+		return ret;
+
+	ret = qcom_rtc_glink_get_timer_value(rtc_glink, QCOM_RTC_GLINK_TIME, &fw_current);
+	if (ret)
+		return ret;
+
+	ret = qcom_rtc_glink_get_timer_value(rtc_glink, QCOM_RTC_GLINK_ALARM_ENABLE, &alarm_en);
+	if (ret)
+		return ret;
+	if (fw_current == U32_MAX)
+		fw_current = 0;
+
+	ret = qcom_rtc_glink_get_time(rtc_glink, &now_tm);
+	if (ret)
+		return ret;
+
+	now_real = rtc_tm_to_time64(&now_tm);
+	secs_until_alarm = (u32)(fw_alarm_time - fw_current);
+	alarm_real = now_real + secs_until_alarm;
+	dev_dbg(rtc_glink->dev, "get_alarm: now_real=%lld fw_current=%u fw_alarm=%u delta=%lld\n",
+		now_real, fw_current, fw_alarm_time, secs_until_alarm);
+
+	rtc_time64_to_tm(alarm_real, &alarm->time);
+	alarm->enabled = !!alarm_en;
+	return 0;
+}
+
+static void qcom_rtc_glink_alarm_work(struct work_struct *work)
+{
+	struct qcom_rtc_glink *rtc_glink =
+		container_of(work, struct qcom_rtc_glink, alarm_work);
+
+	/*
+	 * The glink client is registered, and can receive an unsolicited
+	 * ALARM_EXPIRED, before the RTC device exists - e.g. if the board
+	 * booted because of a previously armed alarm.
+	 */
+	if (!rtc_glink->rtc)
+		return;
+
+	rtc_lock(rtc_glink->rtc);
+	rtc_update_irq(rtc_glink->rtc, 1, RTC_IRQF | RTC_AF);
+	rtc_unlock(rtc_glink->rtc);
+}
+
+static void qcom_rtc_glink_callback(const void *data, size_t len, void *priv)
+{
+	struct qcom_rtc_glink *rtc_glink = priv;
+	const struct pmic_glink_hdr *hdr = data;
+	unsigned long flags;
+	bool pending;
+
+	if (len < sizeof(*hdr))
+		return;
+
+	dev_dbg(rtc_glink->dev,
+		"RX opcode=0x%x type=0x%x owner=0x%x len=%zu\n",
+		le32_to_cpu(hdr->opcode), le32_to_cpu(hdr->type),
+		le32_to_cpu(hdr->owner), len);
+
+	if (le32_to_cpu(hdr->opcode) == RTC_GLINK_ALARM_EXPIRED) {
+		schedule_work(&rtc_glink->alarm_work);
+		return;
+	}
+
+	/*
+	 * Hold state_lock across the pending check and the response fields
+	 * below: qcom_rtc_glink_pdr_notify() writes the same error/resp_*
+	 * fields under this lock when it force-completes a request on an
+	 * SSR down-transition, and the two must not race. Dropping the
+	 * response here if !pending also covers requests that already
+	 * timed out or were aborted; qcom_rtc_glink_request() will call
+	 * reinit_completion() again before this response could be mistaken
+	 * for a later request's.
+	 */
+	spin_lock_irqsave(&rtc_glink->state_lock, flags);
+	pending = rtc_glink->request_pending;
+
+	if (!pending) {
+		if (rtc_glink->timed_out)
+			rtc_glink->timed_out = false;
+		spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
+		dev_dbg(rtc_glink->dev,
+			"dropping stale response opcode=0x%x\n",
+			le32_to_cpu(hdr->opcode));
+		return;
+	}
+
+	switch (le32_to_cpu(hdr->opcode)) {
+	case RTC_GLINK_GET_TIMER_VALUE:
+		fallthrough;
+	case RTC_GLINK_SET_TIMER_VALUE: {
+		const struct qcom_rtc_glink_timer_resp *resp = data;
+
+		if (len < sizeof(*resp)) {
+			rtc_glink->error = -EINVAL;
+			break;
+		}
+		rtc_glink->resp_value = le32_to_cpu(resp->value);
+		rtc_glink->resp_valid = true;
+		rtc_glink->error = 0;
+		dev_dbg(rtc_glink->dev, "ACK opcode=0x%x resp_value=%u\n",
+			le32_to_cpu(hdr->opcode), rtc_glink->resp_value);
+		break;
+	}
+
+	case RTC_GLINK_GET_REAL_TIME: {
+		const struct qcom_rtc_glink_real_time_resp *resp = data;
+		u32 w0, w1;
+
+		if (len < sizeof(*resp)) {
+			rtc_glink->error = -EINVAL;
+			break;
+		}
+		if (le32_to_cpu(resp->return_status)) {
+			rtc_glink->error = -EIO;
+			break;
+		}
+		w0 = le32_to_cpu(resp->real_time_data[0]);
+		w1 = le32_to_cpu(resp->real_time_data[1]);
+		rtc_glink->resp_tm.tm_year = FIELD_GET(RTC_GLINK_W0_YEAR, w0) - 1900;
+		rtc_glink->resp_tm.tm_mon = FIELD_GET(RTC_GLINK_W0_MONTH, w0) - 1;
+		rtc_glink->resp_tm.tm_mday = FIELD_GET(RTC_GLINK_W0_DAY, w0);
+		rtc_glink->resp_tm.tm_hour = FIELD_GET(RTC_GLINK_W1_HOUR, w1);
+		rtc_glink->resp_tm.tm_min = FIELD_GET(RTC_GLINK_W1_MIN, w1);
+		rtc_glink->resp_tm.tm_sec = FIELD_GET(RTC_GLINK_W1_SEC, w1);
+		rtc_glink->resp_valid = true;
+		rtc_glink->error = 0;
+		dev_dbg(rtc_glink->dev,
+			"ACK opcode=0x%x %04d-%02d-%02d %02d:%02d:%02d\n",
+			RTC_GLINK_GET_REAL_TIME,
+			rtc_glink->resp_tm.tm_year + 1900,
+			rtc_glink->resp_tm.tm_mon + 1,
+			rtc_glink->resp_tm.tm_mday,
+			rtc_glink->resp_tm.tm_hour,
+			rtc_glink->resp_tm.tm_min,
+			rtc_glink->resp_tm.tm_sec);
+		break;
+	}
+
+	case RTC_GLINK_SET_REAL_TIME: {
+		const struct qcom_rtc_glink_status_resp *resp = data;
+
+		if (len < sizeof(*resp)) {
+			rtc_glink->error = -EINVAL;
+			break;
+		}
+		rtc_glink->error = le32_to_cpu(resp->return_status) ? -EIO : 0;
+		dev_dbg(rtc_glink->dev, "ACK opcode=0x%x status=%u\n",
+			RTC_GLINK_SET_REAL_TIME,
+			le32_to_cpu(resp->return_status));
+		break;
+	}
+
+	default:
+		spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
+		return;
+	}
+
+	spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
+	complete(&rtc_glink->ack);
+}
+
+static void qcom_rtc_glink_pdr_notify(void *priv, int state)
+{
+	struct qcom_rtc_glink *rtc_glink = priv;
+	unsigned long flags;
+	bool up = (state == SERVREG_SERVICE_STATE_UP);
+
+	spin_lock_irqsave(&rtc_glink->state_lock, flags);
+	rtc_glink->service_up = up;
+	if (!up && rtc_glink->request_pending) {
+		rtc_glink->error = -ECONNRESET;
+		rtc_glink->resp_valid = false;
+		complete(&rtc_glink->ack);
+	}
+	if (!up)
+		rtc_glink->timed_out = false;
+	spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
+}
+
+static int qcom_rtc_glink_read_time(struct device *dev, struct rtc_time *tm)
+{
+	return qcom_rtc_glink_get_time(dev_get_drvdata(dev), tm);
+}
+
+static int qcom_rtc_glink_set_time_dev(struct device *dev, struct rtc_time *tm)
+{
+	return qcom_rtc_glink_set_time(dev_get_drvdata(dev), tm);
+}
+
+static int qcom_rtc_glink_read_alarm(struct device *dev,
+				     struct rtc_wkalrm *alrm)
+{
+	return qcom_rtc_glink_get_alarm(dev_get_drvdata(dev), alrm);
+}
+
+static int qcom_rtc_glink_set_alarm_dev(struct device *dev,
+					struct rtc_wkalrm *alrm)
+{
+	return qcom_rtc_glink_set_alarm(dev_get_drvdata(dev), alrm);
+}
+
+static int qcom_rtc_glink_alarm_irq_enable(struct device *dev,
+					   unsigned int enabled)
+{
+	return qcom_rtc_glink_set_alarm_en(dev_get_drvdata(dev), enabled);
+}
+
+static const struct rtc_class_ops qcom_rtc_glink_rtc_ops = {
+	.read_time = qcom_rtc_glink_read_time,
+	.set_time = qcom_rtc_glink_set_time_dev,
+	.read_alarm = qcom_rtc_glink_read_alarm,
+	.set_alarm = qcom_rtc_glink_set_alarm_dev,
+	.alarm_irq_enable = qcom_rtc_glink_alarm_irq_enable,
+};
+
+static int qcom_rtc_glink_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct qcom_rtc_glink *rtc_glink;
+	struct rtc_time tm;
+	int ret;
+
+	rtc_glink = devm_kzalloc(dev, sizeof(*rtc_glink), GFP_KERNEL);
+	if (!rtc_glink)
+		return -ENOMEM;
+
+	rtc_glink->dev = dev;
+
+	spin_lock_init(&rtc_glink->state_lock);
+	init_completion(&rtc_glink->ack);
+	INIT_WORK(&rtc_glink->alarm_work, qcom_rtc_glink_alarm_work);
+	dev_set_drvdata(dev, rtc_glink);
+
+	rtc_glink->client = devm_pmic_glink_client_alloc(dev,
+							 PMIC_GLINK_OWNER_RTC,
+							 qcom_rtc_glink_callback,
+							 qcom_rtc_glink_pdr_notify,
+							 rtc_glink);
+	if (IS_ERR(rtc_glink->client))
+		return dev_err_probe(dev, PTR_ERR(rtc_glink->client),
+				     "failed to allocate glink client\n");
+
+	pmic_glink_client_register(rtc_glink->client);
+
+	ret = qcom_rtc_glink_get_time(rtc_glink, &tm);
+	if (ret) {
+		pmic_glink_client_unregister(rtc_glink->client);
+		if (ret == -ECONNRESET)
+			return -EPROBE_DEFER;
+		return dev_err_probe(dev, -ENODEV,
+				     "RTC GLINK firmware is not available\n");
+	}
+
+	device_init_wakeup(dev, true);
+
+	rtc_glink->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_glink->rtc)) {
+		pmic_glink_client_unregister(rtc_glink->client);
+		return PTR_ERR(rtc_glink->rtc);
+	}
+
+	rtc_glink->rtc->ops = &qcom_rtc_glink_rtc_ops;
+	rtc_glink->rtc->range_min = 0;
+	rtc_glink->rtc->range_max = U32_MAX;
+
+	return devm_rtc_register_device(rtc_glink->rtc);
+}
+
+static void qcom_rtc_glink_remove(struct auxiliary_device *adev)
+{
+	struct qcom_rtc_glink *rtc_glink = dev_get_drvdata(&adev->dev);
+
+	pmic_glink_client_unregister(rtc_glink->client);
+	cancel_work_sync(&rtc_glink->alarm_work);
+}
+
+static const struct auxiliary_device_id qcom_rtc_glink_id_table[] = {
+	{ .name = "pmic_glink.rtc-glink" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(auxiliary, qcom_rtc_glink_id_table);
+
+static struct auxiliary_driver qcom_rtc_glink_driver = {
+	.name = "qcom_pmic_rtc_glink",
+	.id_table = qcom_rtc_glink_id_table,
+	.probe = qcom_rtc_glink_probe,
+	.remove = qcom_rtc_glink_remove,
+};
+
+module_auxiliary_driver(qcom_rtc_glink_driver);
+MODULE_DESCRIPTION("Qualcomm PMIC GLINK RTC driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

