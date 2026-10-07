Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECBD44AB73
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362702; cv=none; b=dtWtpZUpXQSrza0B0XDQBTYUe3e89/PAxj4+E8hf23dl8OoPdFUZ1UOBUHwlxWZhsy2nY00Ir32+4JApG62g+4VtxbLjk32mnoQnY9Ut1LvaDFb9+RgWGZt9CNTwhEcWHwiSWSctlSwmpNch3QtRlqU7jdFvlSrDBosdxU9uE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362702; c=relaxed/simple;
	bh=7KDqgod1GH8fjPIehGEiGnloM7RkFPHvH2WRwwPGAsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nhOEF1ddOnmAOEMtGvyBkAbKXLSxU2/hXBUzJIWIZ/9jO0gGcOLQ58Ml+D9FfeP+S9ABVqHaQsagTulbraOk3TJcd851Gne1ptwGDOX1MQFcjQAy8fdqf8V5Y+tvM0boTE6rb3NGCLofP4tHpYrKikwPDSkHzlTrg/As4qJy4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoqdohNx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMVJewjG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoqdohNx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMVJewjG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jdjK3194052
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 08:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ppfdFba9NOF
	0mFMXk2YDZQ9fH8GXGF50XvGHTUha684=; b=UoqdohNxKpwMCxxz8E4VqEH0tU+
	J6jxU/ZmnCo5uNc0Lg8L3IeklXORD5N7Up+TtUjz1B/qaaGgIICz8rZ32OUQAG2n
	LlrO69yKPhTG0WPsxTJbRJDgrahH8QBpFbR0Mk4VjByHdRpc3qKrNqOATaj5oC1A
	k0Isy3JFj2IsCY47fLUw0D9dfebW6NupYlCuEhwpAAjw3ZLdwAzPKlV0gMIvAHKV
	5NDt1WUwWorEcTXVciZLvA4W8jXSbbJVuF/sdEycKE9sjfLyxqP2har/XNxBHI6I
	SD4dg6XUgNuU9KT/qlWLcUjJk6kzWF/7QQTgwqDZWFDyg65zpp/3x6MKZzw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541ukf0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:44:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so4855074a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362699; x=1791967499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppfdFba9NOF0mFMXk2YDZQ9fH8GXGF50XvGHTUha684=;
        b=IMVJewjGilxgjDFIp5qqcLFkSOMKtrtidqFrTxmSKw+djDs4hp44DHBNzNn2JtFvFB
         3dvzB7jiYkDyiKsUMZHHrSV0NRXEXIvqhVnpN6wFQ7JCjRnTR00FLJCM/3FBe4WgJVbO
         Dg+auDevRcqsoMkuZ86iIa8lTTmkqy8m6LIN8yB/G4/9vKrD4vyB04+6p0RyWswX8KWn
         iMq/oC+TnrGC7ZvKRKGsn6KDAwAWraUSD77J/87RnJH2IH1No/7cyoWjC091g60sDV8U
         1hD++hG8PEA6mCM3mXnbxumzSctvToXRf8eYyzuLkEo0kVP4MKHwTKR5nsB51KFroaDc
         BxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362699; x=1791967499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppfdFba9NOF0mFMXk2YDZQ9fH8GXGF50XvGHTUha684=;
        b=jgQeK4B5Yvc32wQIa9e23z4tGAeSlsJjdl7sPYhcHPJn3gx9y4QbzS+78U2EMfvsZF
         LoQ25sUnQ92y/rsaGUvB9S2CI8HqAoorbB+bTXwuBkaFwk3MiRRzllXRkH6qvln6Qhk2
         32MYfgO7fwLb7e24pgAxg8s3z5nbGS3Ym6RorQEs6Mevx6rtKnqQf0QPrP7kvwJvUTBQ
         5WAojMU5lmbdiNClQeIvCmCOz1JYEZDuOH7r2lxttjwrA7nleQ4B3/hjLRUXSfY7voMv
         cLwjnsANNqh2sH4wQ9/s58ocj0sHHpdP2al8fhkEPHIwCJZgYG3TVQ9bPlm4E/f0t3m7
         4T4g==
X-Forwarded-Encrypted: i=1; AKwUvBySktvPnTD/UqJUULNmtxDFV+Oc4//oevPF2BaqdpCA6TfI2vOLsajd1GOyiVR4y3rwX6B5+vaF/QAVZso=@vger.kernel.org
X-Gm-Message-State: AFuF++luLVmiabQtbZg1Bcc6mjhmCFqBp8eXrA4JlgPXXPXXFwWxN3HR
	uxUhoy9sRFZVzKh3nUBHInDt6OQU1riVcmX5Kwppo8wrM6+aaF+udfu/6q2dA4yUpDw3gaAXEyG
	dv2PL0znZsLPVO+h2oe/bPB2BF5wMugXmc+ZF1cgTd8LJpq6wytwcDulVrZRNa6ajauw=
X-Gm-Gg: AYBFou2l77KkPS0pyx4PoSN6RC3Dsb31kvdX6mlBRTvbhyTvYP+Uzo2L/pb8acGipxS
	DnY3Pfs1eIr0QNpVJ89IP7IGIYBvHfSZgem08DIKY4VXUwCucZOj89hoy5ezJ5GSC+v5vf7pu+8
	fHl2Z4rdoqPsjrzMIm8S6Iq4KeY8tGb0Tp2WRF6elAa4yRaLhh7QAbcgDSgzJqkmxEPWGOKl/Zt
	fB90KAr3HeesMYV2qQ7mx4xE072ILLoPAAh/rcmMu9nR+kKc4ooan/HZI7sAQtoD/Lk6tRcq4Ok
	qkZCWYFEJjy+qXsSBEwEvNb8dhGxtxYxHRIHxXHeBlKtgZ9FNhpjSYrqxPWdWsqzmNCPY124QTz
	7SdJFH0Z5tiFb2fe78njnOxoXCVYFr3P8pHi9h0y7ZGx58gW6qUK4QbXOGrwFWIKnbGcdU9s=
X-Received: by 2002:a05:6a20:7343:b0:3dd:57bf:7242 with SMTP id adf61e73a8af0-3e133dac803mr1178970637.8.1791362698848;
        Wed, 07 Oct 2026 01:44:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:7343:b0:3dd:57bf:7242 with SMTP id adf61e73a8af0-3e133dac803mr1178958637.8.1791362698381;
        Wed, 07 Oct 2026 01:44:58 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8b0616esm1075091a12.6.2026.10.07.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:44:58 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 1/3] misc: fastrpc: initialise channel refcount before exposing the misc device
Date: Wed,  7 Oct 2026 16:44:45 +0800
Message-Id: <20261007084447.922-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2e59n8QCOrplDPWhUDMBqytqcQKt6AyP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX7XPBC365qpbc
 f6DgTrTolrzmIi2uKoc2qIPJQfDNj9KXVO4pILSXEqHm+gvFOfcz0xZ9qJ/zMlVi2h7cIwDlQZa
 Hp0a8SHjt/jLOn/dcqUt4GzeKLO/W1E=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac6068b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zKkcRt30B2kSqeCsNmQA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX3/vQB4hBtIPj
 1LWv+dXskZk8gyLe2Wq8g8SS/TDnDX2/Il8MYUNTYcEM42lo8aZ3scF8oh9St4Ozs7Dg8BFPMQG
 3pYkoY6n9RRjvCNoJ3BQNn4kGegOMNvFIOxgIcx4/LAZ7pmQiRTbRZxHZ7+jBANlxd62uNwdGdS
 L5M1iFTY84By2CT9qH9C3W2MO7A4xjlph1M3++WJTZU+E3zpcfSn6ct9ym+qiE+YPqtEfjkEY+H
 +rpYxPlEIyBMRRVVZm0mQbDhkuEvw85MGRVuiHMiOl6pxtGjro8cWQubvZm95hkjWbfJMfPeu7+
 uamqxivqhBGbnEy4b0GA/lBC1opE7UXdYkkH8BPNAe4YJ9+JX76apF+qPF8DxNzJw17lPeUUfMl
 6icHMEPVtJrV0cWBjXY2BssigdGE17nGa4wbjztbi/Ut4UB6D4G5Xo/t9ETzP/B01HgulvFGOwA
 LEae8NK4SJDAZb4+G6g==
X-Proofpoint-ORIG-GUID: 2e59n8QCOrplDPWhUDMBqytqcQKt6AyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070034

fastrpc_device_register() calls misc_register(), which immediately makes
/dev/fastrpc-<domain> visible to userspace. However, kref_init() on the
channel context refcount only runs after the whole domain switch()
completes, several statements later.

Any process that opens the device in that window reaches
fastrpc_device_open() -> fastrpc_channel_ctx_get() -> kref_get() on a
refcount that has never been initialised and is still zero, which
refcount_t correctly reports as a use-after-free:

  refcount_t: addition on 0; use-after-free.
  WARNING: CPU: 0 PID: 760 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x144
  CPU: 0 UID: 0 PID: 760 Comm: adsprpcd
  Call trace:
    refcount_warn_saturate
    fastrpc_device_open [fastrpc]
    misc_open
    chrdev_open
    do_dentry_open
    vfs_open
    path_openat
    do_filp_open
    do_sys_openat2
    __arm64_sys_openat

This is easy to hit after a subsystem restart, when the DSP daemon
reopens the device as soon as it observes the PD coming back up, racing
with fastrpc_rpmsg_probe() on the rebind path.

Move kref_init() ahead of the device registration so the refcount is
always valid by the time the node is reachable from userspace.

Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992ee..05b2e7e4ad3b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2599,6 +2599,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->poll_mode_supported = soc_data->poll_mode_supported ||
 		of_machine_get_match(fastrpc_poll_supported_machines);
 
+	kref_init(&data->refcount);
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
@@ -2626,7 +2627,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		goto err_free_data;
 	}
 
-	kref_init(&data->refcount);
 	atomic_set(&data->ctx_seq, 0);
 
 	rdev->dma_mask = &data->dma_mask;
-- 
2.43.0

