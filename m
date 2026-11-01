Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571950;
	b=df2mUaBTufWYgUIsV02A8pEO7a+vfQuSvhqEdYKl7sSQ11dzeyGfLOig7i0qMjNwriQK
	 hQMKcbtKM8BOr2/f+E1YPWVb0XDRCspMiIE+k2J2WCxLcy29QklwF15oVj1CXYdSP93eO
	 3edaI77Pw+W2lFtfY3dbeOneI3JCrXRhfbTPUWHOr+6Qc+eG+L64o2j4sEZmNPfQ9mkib
	 aeCF//xhI0LaMkwEuFH+29iU4X550OltTmDNcvGH+E7wkspqRI3qJ37itVAdEj3gbBZjl
	 6FxuIHiHFKII8nQ4YVFwWm/E9a/2UHDrz1EWLSlBacmj5DFeuJQhic2anzrBInSdLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
	b=tIDa0SGRSnZOw0X8/Cn6HDkQe+UHYFq/tQXELCpn4uI+bt5si5orUgnPcVWT0eIZbElB
	 ScZDe0XwC57SwtnVssF3IPU+KPFpQGarq/HGS4oi7tgJYX6B69pEnV2mSAYGSnsbe5NSZ
	 u989hglBpnaJ2vYa0dTCvm3BLhC5YKRCYZLcDvdubS4AqgKWSmNkmTEXj7xkDz3USVjHe
	 +f4XOacknTUbhmODPXVW7PrhxDMfwrcgQFmevyeAbRiffnpDfH/vy0sBOnjnmPKZi45+x
	 QEkPStrf/39PzpN1RaCdngGBeY2badAYXOaAY7qyOZG3VIIRUA+Iiw8sPvXC/JEaLBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuQFYCfs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7iY4ZYt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C56D60701D1
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C56D60701D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuQFYCfs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7iY4ZYt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KKo941771905
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=; b=nuQFYCfsssQ3y9N0
	7Za3EjBr7nYaRhEHo9aY3j7SnThyTGwMB/gPb5kJYP450DFQoxpU0e1nmLixVV2g
	Ryy94jRAyJPD183XJBUbly1erFQ8c8d+0JRI+ib3Y1GMov/cte8Tv9hCHE5XdPsO
	0jL2sdhUWBn6EGsz8oHxzjrMfRJq0zkKcqa9syoD2B3FRbMvY1BVgEmUFwIv9I50
	RoMr8LcuNQc4ncTb4h34iWJ6nuOXUq4XdRVDzWvKxRtXdkNl/oc3gkvB7xpbjcqO
	f5ZlITYalzKx+4c7MXLabR5NGdhYYH/qH6/7j6ht8uobG6vEnFPNFChWIteB4Abp
	E7xFZg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2vbjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:25:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a26fe9521so3264343eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571949; x=1794176749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
        b=V7iY4ZYtHtS627Sesz8xwXpsYRXiVl4n2+shqiK5mogl3OF1Rgy2wrD2FnD09Tb3Th
         YvJns/BuQcE9wB63sbmd3nkVRN05nBe4a1ZCYKA1WDsy6dDwSpH6NoVB8zUSCtUQAq/P
         YisVX2zKVFMGFFoqlOAwtw67ccJzLWK5J/Y2i29i0WuDeVhCoroQp+GlFBnQgoo2YRwR
         kaulmkGtJuqmlFF6iRHjrZgVsM3ANpbNkUlaH/UsW1AM775XhxnRSGU7BYPGGcxJCQYr
         w2OrbA9kTyq1IIE3ZW5FmF6WDVrQccHMNW/nzqX9BbNYY0yax9z/ZhjcTrLuMTvXZiQ9
         eKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571949; x=1794176749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
        b=FbfOGHa4aYgr+mUrpfNKIuwNIn4w6712Y2QK5ogKHfIcsa3Hq9B4xjmBCX9Q/+7H0/
         E78uF1tItz3F+Dzz2k4+wpt03WKCdX4f3KQROcJuJd1iOzDQ7xJUJIpLQxKVJRpNUB80
         ZPgXIdr/RMKDwS4ykr2sc3gD28vNES6PGGgvhTBndRHuw1oyoaMwFXU3glmU8MZIudKR
         733NeSejYgcJG/SypYcPqrKR/o5fDVwoG9ESL9OD0TqvZYW2j3WVVYsl9mJgRRT29eY6
         L+6TCipgO2t0YbfvEaIR5lX8/Og5yNdsq0grhDSQFH+r6lCan+pmw9UX62e/sh8Fxret
         Q2vA==
X-Forwarded-Encrypted: i=1; AKwUvBzyFQyrGUOZZeaPEXIOnmHk/zD666NOLnyWi8GH6pODdXYdq+h9mXgc1p9SmbpQ6HpdWPLi3l4oESzX50U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEOn6ozgCeC7ehrT+n3+nwQWg39oq7bwlc8i62lwzBTYaVLnn4
	PrqC4eVgKzuMNic40XQDAdhxDTL8iSaQ1RoMJU25hxQlZ4kuhYS8NUo+Xf3tXejl6xrfyNK5PXe
	6GongYGg5/74lwpRws/a8L3SAc3DzPXcwVs8eBnzsMSvg/wPHYhrwZSxNQx78jr5s6ak=
X-Gm-Gg: AYBFou2V5g2ZJ/vlsz0Db9TFHFRP3Ri6HbfrVtK/7BI1NrgjKxuwcZuf3rLsEPgCzpL
	tkNgfzjB/WO5jYOYBm04oZ7u9DSyySQ/lOYNdUe4zKwbbKy1FioRb/cQ8ollMIL3wZnIXmbBtVi
	0B0smSqLp92SgDC+ky8kbn7jUHaHd5AXr3hauBINs6jAZozoUwQf0IZ8GSBrpmYccQqhPLR5o+2
	hXyVGZg/3PmsU/wiu4X8DC2gjHCZ+pYFcpEfpJ4eiMpNqLu4ACpaGG3BJsKEw6RJUMgPuWnuySc
	6PLMpVOzMLyr8TGcRUpb8IgdG0YMvo8Z66zfFv6aE4QCRy2T4jLlxhnFHQpmhQslUkjlodDaA/s
	4LRMgR1vvGYhFahfx+rgk7LDfqkC9zbjIjHKcGQ2ZZ42+fEsHMxoiwHb5cnVJUrgLICtQZV40Z9
	4FWspkuQ==
X-Received: by 2002:a05:701b:2092:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1ac5b7e0185mr12212173c88.17.1793571948416;
        Sun, 01 Nov 2026 14:25:48 -0800 (PST)
X-Received: by 2002:a05:701b:2092:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1ac5b7e0185mr12212134c88.17.1793571947846;
        Sun, 01 Nov 2026 14:25:47 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:47 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:37 +0530
Subject: [PATCH v4 24/25] accel/qda: Add legacy shim support for DSP
 capability query
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
Message-Id: <20261102-v4-v4-24-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=3736;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=jwnH5cfp8M6GHrX4Z/62vWuSavKSWMU+7o5H4b+rDhI=;
 b=e5bP4QRM4M++NoUYF49dvgjnn6jVgLjcjBzplELgWbocjqksZsYZ+UeV+0spKYA4N1U2Y6IMe
 CXSX78olZOjCfKLCICBHH6b1BTgTKI13Kv1urMO2RHlPcTyD5seSD2d
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: PTQoIbVGxCJ7d7IeV7Q60C2TyorZdXjv
X-Proofpoint-ORIG-GUID: PTQoIbVGxCJ7d7IeV7Q60C2TyorZdXjv
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae7bc6d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=co94-PkH9mM8E1aZUYUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX7LlByiHYis0x
 YTUmMpA9Qy2zUjqGM3oOq5vmc/10ZIWnaopzWDravAha6te0o2w1DISr0Jc90ofGm7vSLFuSK5P
 frgs9IXrPiq7+yntXu6da4NHLsZjPH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXwaO++4GNKB3G
 pbZZdl0PEroJTb93g9pZcGsBcn8b2Ejyc0gHXe7DGpl/49ubK0Py5KqW8LPX+El/+1UlFwBJzea
 MZ59/JKiK/Bl10Lp+yL05HSWgtaXiaOn8AFdYgGh2xX3iJ2sLQXzT4avf+IylsiSKwYRs2i3wsV
 YxKfPbXDBpDIcHS6N4HlntBqU1Px414t0dqVyOchE7GCQ8pzwFVYKaKK+byvf343ib0qQhOtV4B
 nBuhrLY/ZKbM4utp35g+IfTDD6EXk8CPAB7vOvHWoKxowEMK9VDlFS30M9V413t/hHdDFSTItFF
 fCq2L4mQjeYhcFEv7G1eia9sITme6fD9d6bJwAKl+RNNs1b0dsk2NHnLc/7yCO4aph13HWUWOaK
 k04Pfc5FUAh9eMnAlon421mG/zTDtP3EQRukNW6vF8lYxR8AKUOIp+Z428CXZbrUKiXWH1mCKtv
 RcmaU1QLYSpA2QMXTgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Wire FASTRPC_IOCTL_GET_DSP_INFO into the legacy FastRPC compatibility
shim on top of qda_fastrpc_get_dsp_info(), so existing user space can
query DSP capabilities through the /dev/fastrpc-* interface exactly
as it could with the driver this one replaces.

The device-wide capability cache introduced for the native
DRM_IOCTL_QDA_QUERY path is reused as-is; the shim only has to
translate between the legacy fastrpc_ioctl_capability layout and the
shared qda_fastrpc_get_dsp_info() call.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_fastrpc_shim.c | 20 ++++++++++++++++++++
 drivers/accel/qda/qda_legacy_ops.c   |  6 ++++++
 drivers/accel/qda/qda_legacy_ops.h   |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/accel/qda/qda_fastrpc_shim.c b/drivers/accel/qda/qda_fastrpc_shim.c
index c1464b1adbc2..2be1dd116ef7 100644
--- a/drivers/accel/qda/qda_fastrpc_shim.c
+++ b/drivers/accel/qda/qda_fastrpc_shim.c
@@ -463,6 +463,24 @@ static long qda_shim_mem_unmap(struct qda_shim_file *sf, void __user *argp)
 	return 0;
 }
 
+static long qda_shim_get_dsp_info(struct qda_shim_file *sf, void __user *argp)
+{
+	struct fastrpc_ioctl_capability args;
+	int err;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	err = qda_legacy_ops_table.get_dsp_info(sf->session, args.attribute_id, &args.capability);
+	if (err)
+		return err;
+
+	if (copy_to_user(argp, &args, sizeof(args)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long qda_shim_invoke(struct qda_shim_file *sf, void __user *argp)
 {
 	struct qda_legacy_invoke_arg *largs;
@@ -550,6 +568,8 @@ static long qda_shim_dispatch(struct qda_shim_file *sf, unsigned int cmd, void _
 		return qda_shim_mem_unmap(sf, argp);
 	case FASTRPC_IOCTL_INVOKE:
 		return qda_shim_invoke(sf, argp);
+	case FASTRPC_IOCTL_GET_DSP_INFO:
+		return qda_shim_get_dsp_info(sf, argp);
 	default:
 		/*
 		 * Includes FASTRPC_IOCTL_FREE_DMA_BUFF, which the driver this
diff --git a/drivers/accel/qda/qda_legacy_ops.c b/drivers/accel/qda/qda_legacy_ops.c
index fc5e94c0c9bc..8d9d597c76c2 100644
--- a/drivers/accel/qda/qda_legacy_ops.c
+++ b/drivers/accel/qda/qda_legacy_ops.c
@@ -188,6 +188,11 @@ static int legacy_invoke(struct qda_session *session, u32 handle, u32 sc,
 	return qda_fastrpc_invoke_legacy(session->qda_dev, session, handle, sc, args);
 }
 
+static int legacy_get_dsp_info(struct qda_session *session, u32 attribute_id, u32 *capability)
+{
+	return qda_get_dsp_capability(session->qda_dev, session, attribute_id, capability);
+}
+
 const struct qda_legacy_ops qda_legacy_ops_table = {
 	.session_create = legacy_session_create,
 	.session_destroy = legacy_session_destroy,
@@ -201,5 +206,6 @@ const struct qda_legacy_ops qda_legacy_ops_table = {
 	.alloc_dmabuf = legacy_alloc_dmabuf,
 	.import_dmabuf = legacy_import_dmabuf,
 	.invoke = legacy_invoke,
+	.get_dsp_info = legacy_get_dsp_info,
 };
 EXPORT_SYMBOL_FOR_MODULES(qda_legacy_ops_table, "qda_fastrpc_shim");
diff --git a/drivers/accel/qda/qda_legacy_ops.h b/drivers/accel/qda/qda_legacy_ops.h
index 95a169edc594..c79003021fc1 100644
--- a/drivers/accel/qda/qda_legacy_ops.h
+++ b/drivers/accel/qda/qda_legacy_ops.h
@@ -57,6 +57,8 @@ struct qda_legacy_ops {
 	/** @invoke: Run a method on the DSP; takes ownership of each @args[i].obj */
 	int (*invoke)(struct qda_session *session, u32 handle, u32 sc,
 		      struct qda_legacy_invoke_arg *args);
+	/** @get_dsp_info: Query a DSP capability attribute */
+	int (*get_dsp_info)(struct qda_session *session, u32 attribute_id, u32 *capability);
 };
 
 extern const struct qda_legacy_ops qda_legacy_ops_table;

-- 
2.34.1

