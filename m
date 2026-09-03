Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460DD4C0423
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446865; cv=none; b=hLeebKa/ygJo0YSBvtNhfIiLnjgG2pfZRaNrcTTrPR9FnqnJkalYzVcBhFtHkOtko2dEpUuvCgtIfxkGy/gasA7iEqto9NG2NLEJcVF7ZvnWJW4IZry2lysv5rK7ATwdN0xK8p5SQ7ssT8m81uZfOUBaeai+4ceY6Ir+eLPE0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446865; c=relaxed/simple;
	bh=rIj+rXMbNle9x/hv0I6GrGhaxrw73gzbPIHQlRRMxz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0vHHW8soX3dBFZWZy7cpBGMXKsGY18iPjVrwAeJiFK1qUdfwKl8NkwV213sBMbaEroImSBhAn7E7kIJsx69Arv8t4cYt05VOtlrdGr9MmWhtA0sqvrN1jcRd+qKsROOeeUnMcYVhaMDwoDvaGoXOkKh11N8bxy5CRzxXdKNMxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntO0Qjza; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDhgnNoj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntO0Qjza";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDhgnNoj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DB8K53580128
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIUg5dqKmUx3gOnDsfnMRHvli1hg47iHrMdwpyv7Yns=; b=ntO0QjzaouxT57Fd
	w7THpr4Rvr2Qv1aXCDvt1OxE47qf/mdMfDHSXN2Uk+CGguqB5H8hXte3t0IfVNLc
	P5asGmZFaa50jBWk6nlmnd/Y7MZA9CIzY94GpUhgfvTLYqReDvesdYYU4IS/skiW
	FYIgaNUN6YjkluBFzdaxRZMQjtIudP/rNY124tqpbHjhP84YBOIRNKxqvlv0/ExX
	Yj6qOjxk0jdY7TXcpUlKvf8H5ggRrJ9EVhgRuqLEUGrPHd7szjDmoj+5TXDh2DjN
	OyWxHDNmt9BMUx/VD5fdUeBtQPhyFxkhO5WOaGK4cgTaqLjCXO4ClC40MBWMNDBm
	vU69fQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d11f85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:47:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396e5cc1846so578355a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788446862; x=1789051662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIUg5dqKmUx3gOnDsfnMRHvli1hg47iHrMdwpyv7Yns=;
        b=FDhgnNoj5KdZe12AjMVCTcc6x5sQa2EzwQYF2yA2pBvHGyTdiNoOzen96SSw7ffOYy
         mCbpcqrRRhPsb0sIBoEsek77BY16xop8TMQgWS6WcecqCQThzm2qzQcWSeLKkytqtMss
         ZdPb5gbi8nOM2Atw85OXoMUgCV7dYNou2pPKFVnJs+S5wtOYFFEVf/VjaisowqqLJU9w
         TqBDPuTPu58CCGSGdprqTRJkCuk1xNcaYhQ0/iq/OFzmgqB+lw31xv1rvEmmJS9+MBMz
         tj30Xm8KxFxXhidIW+yS4BhafGh3Ncg/fU7W48nbvUmdmnBa57BLFoK2tQgHeIb8WDpI
         eEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446862; x=1789051662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIUg5dqKmUx3gOnDsfnMRHvli1hg47iHrMdwpyv7Yns=;
        b=dWhk0XIvBxPcCodhXrWjMC6W7lbk5U/hrsg9OAjlgp7SiEJEf4C3Je0c8+lwR0Um7s
         peQuZyg+lGMqUN0Q7GrxZp45A9RliYghXjlMTde7UVgpoSE5/h3jWDa8tDwefzmzNWwm
         NQYkbygfak+LfcEr9THiZcDktqakVy2rWFmfJ/qCfJ10xLPbOUOGG7hQkv+MfglRu55B
         Tre21GXow1psc+FP3Tfa5ZfuPsN/EMxJoJnCqMCpcXZ6d9DEaQVjQ4tfk6CG8HAIP6lp
         yAJHuvOx9Z5fxO8XpN3O7LhDsO+4z4qaSWC8i6GKLxI3TaRTBI0K7xz+jx7NN6BcFdsh
         +9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxRc1sRvOrOsHI+UV/R9TRmaVuqvyQIqONlgRZod9pD/5tJheulrMUtknB4Z660Es9lbZ4kl5u0/V8Jnhg=@vger.kernel.org
X-Gm-Message-State: AFuF++kqk7bdJQopKtranDld/hBCnGRn08Oz0w0nquyYD4cbQLo8WTCS
	4ppJYx7f9eYxPNq468+v18iRFyrly+9KaJW/ohe5XUibyDtbhGDMtA5nWybyQngiuo1nxoaOEhP
	KMNOcjwlBgQANGfdk0jHZodqCZN+4afa254jAfZAsAdmezLWIHGZ7c49T1NkiF3xwIjcDYsZJdO
	A=
X-Gm-Gg: AYBFou2DEWNpV1dHyOzwLa5BsimZtYEQGt2uJ5XelWYkcBBxoyyQx04f5sft/FfMYNL
	Tabwtl5mV/DQTV0VQFWk1s/HoLfp5FmbKZ5/bRZjx+GhVCViE6AbjORMd4zmEzBGrRrQBIyViM+
	4vjj92Hye6mgNSi/LkV7FvM4eYrw511NU1CrFpa5iV/ja77bC092UI8a0T3qGn+jnkqmxliKwkG
	TvsQwssTmbMBKaWNjqsywTtnegWmPQ3HP1Mat8QjTTlADUPDwzexYDH0/IvrSOA5MM7dcCf6S/B
	GVxcJmAewrp+hcyVZW3p3Cl2+i+NTV26VX/cqIjCyp1e2tadrekhbCRmFDZSBE4uLnn0D74wug/
	lsBsdEFgNR/5xwuiYMOw2009Hh1LAT77wd5/tV0fGRMA6zYc=
X-Received: by 2002:a17:90b:5828:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39aedf2714amr12351081a91.2.1788446862415;
        Thu, 03 Sep 2026 07:47:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39aedf2714amr12351015a91.2.1788446861823;
        Thu, 03 Sep 2026 07:47:41 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm25794c88.11.2026.09.03.07.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:47:40 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 07:47:15 -0700
Subject: [PATCH BlueZ v3 3/4] doc/hci-protocol: Add BT_RECV_VENDOR_PKT
 socket option for HCI_CHANNEL_USER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-vendor_hci-v3-3-015d62a57c91@oss.qualcomm.com>
References: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com>
In-Reply-To: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyOCBTYWx0ZWRfX5BuU5l8YtHNL
 uSkhU4P6IAfu8W/eRT6+CQZxiXdZrYbt8kjFrACs5e2X75VUKoTvrCZOQ1qC7dLKZNAUerUgt47
 lRLAO+u9G+jXoP+O9EPgpkX2wzzHulZMQUlgDkUsUptJCNqSqdXATVyqOBUTbPd/0iOOsW5lSeZ
 s6OheuIAVZaDCmJhBs+dHmNQmc3Bd6M8KzcWRMNJK//GkGXus4ogsQdmM0ej/k1TCJhcTpU3SjV
 hQn5HJ6R8zN8Te9p1RIGhH8hkN34sliC7Lq5xnkCgMQWgE3dFikeCt+7BpewGFExw+9FYi3linr
 LYFwia45VYzO4q5o6oNE1Rs+DwSlftzoUTNh6E1DClC5yEG4WiHkaVpjzLGPIiKFNK2zdae4LnN
 M6k02W39UPuQ0zJIuTeeG3SkJHUFdeFfLObQzKoTr6qlEBm0i8T4AOZZZbEgPnz8OhsNqamuius
 S/tJOSTZXjmm+6GeZVg==
X-Proofpoint-ORIG-GUID: IAs_KG8rDPKfRBZHLwsa-aADCfCJv3rM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyOCBTYWx0ZWRfXyG+8fSpRa0ol
 EPqG3uwYYPL64Ur9v38eaMHuf3HBrPfHyivuFw+5YcNDkbmnVLWqapPOOjrP9mHqPm596dVNtON
 dwNQvv1/2rwO54LdhzT1f7aa2LUJbpw=
X-Proofpoint-GUID: IAs_KG8rDPKfRBZHLwsa-aADCfCJv3rM
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99888f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=wa7QpaTpAAAA:8 a=Ydnp389x0cl5jbVLM_IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=ehqneT2-Ts4HTEaPPMaO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030128

BT_RECV_VENDOR_PKT controls receiving vendor packets over HCI_CHANNEL_USER.

Disabled by default to avoid regressions for existing applications.
---
 doc/hci-protocol.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/doc/hci-protocol.rst b/doc/hci-protocol.rst
index db10b35df736..53734a0037a9 100644
--- a/doc/hci-protocol.rst
+++ b/doc/hci-protocol.rst
@@ -131,16 +131,34 @@ Example:
 
     uint16_t mtu;
     socklen_t len;
     int err;
 
     len = sizeof(mtu);
     err = getsockopt(sock, SOL_BLUETOOTH, BT_RCVMTU, &mtu, &len);
 
+BT_RECV_VENDOR_PKT (since Linux 7.3)
+------------------------------------
+
+Control receiving vendor packets, requires hci_channel to be set to
+HCI_CHANNEL_USER.
+
+Default is disabled.
+
+Example:
+
+.. code-block::
+
+    uint32_t enable = 1;
+    int err;
+
+    err = setsockopt(fd, SOL_BLUETOOTH, BT_RECV_VENDOR_PKT, &enable,
+                     sizeof(enable));
+
 RESOURCES
 =========
 
 http://www.bluez.org
 
 REPORTING BUGS
 ==============
 

-- 
2.34.1

