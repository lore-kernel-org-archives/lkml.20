Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169970;
	b=NIzZlvpD0p5MSPEynL7W78Xz7ecYtgPeBImHp2lhjSlB4OIWu0AxDSt4QSUYqD6CCI5v
	 /efeDoGxHXbPd7tVXFWSDHPHFq+EBo+uIkqfaMhdYEhKOdbwnelCSGLteduQ8vg96pLKn
	 yOskedfaSKwJ0V5pYFiTacjgAfKLHwaFkgPsssvhJVqsaYsv/vLSSL5hf7aDx/PIHju1T
	 moExBSoOKcd6pBDzOT64B2Wf2v7+vSxmC95w3Tlo5lkFOVcbUFn2LldHrZ/bfrzFzzMcX
	 FpdFcOnzw+ZosBEwOwL8fzDAm5gnm0w/NGyOcSosthretoBXJ6RN1SGEom5nTIaEYtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fNZLE6g13OUkRAJQh2g053ezFujOCllvGhTaZvGIa/w=;
	b=gij9qQnWfB65FX9l2lcrwyfYrEFF2VcOrbgRrrB1Dupo78qP7Gf8P/kUHJ+pMHwaHSzn
	 QAdqCAFYyk+xOPCWV5hSPFRNZIRFYqQ6MMsrEoov2zpfNWSjU79KcX2EKNfcPEy8L31vl
	 VpnG6clncTM5IZlggu2FPIUBTkwoFv3RrxsWNHaQKm9yxwug/0UpgCK9yYrP2/3mDTItJ
	 P+sVXkL05Ior2E4dJ8D7H7Tadw8VjpeB8dJroIWI/oC/gMNwmypWi3+Qo7pjnqiHh3q14
	 X9RHZGid4kLi5ixQ6w4Fw8i7UYPjd6NyQuefVA5fqXCn4rzhLckd4ylUOtDJPapuf/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pj8oBhJu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOtYqReV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848AD606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 848AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pj8oBhJu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOtYqReV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PdCP046821
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNZLE6g13OUkRAJQh2g053ezFujOCllvGhTaZvGIa/w=; b=pj8oBhJu5/ZZdJ8l
	7/EDThTPLYP62orXP4P+P0oHUtcizPruNpd7yDYEjYC1Xjc14Qi8TVta2MnWxuiC
	qYYDom8iBLuGmwWxoI896XGYg9uLN/MfT4+rbs4K2fTKmDcJMdbNs0BnZBCMCbkN
	rIsMN3/Lbf1mAFH8H+BXX5YrrWsAEKkUDhG0lDTJh4McYSEROYyfKIaOtLBhStVV
	jbnEJdr5TVlEGVFIC9c9JUxarsabDxzuVnad5LjEIUBQkxV5Q72yczyR63rTy2e7
	zN9ZuJkCoTRpbB2Gc8H3FTh2ji3PDn1kgRdiPqj/qYPBxv8/zKMoRmpSbpTGDw2X
	+E0vrg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82trts6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:08 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-483ee5899ffso84201fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793169968; x=1793774768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNZLE6g13OUkRAJQh2g053ezFujOCllvGhTaZvGIa/w=;
        b=JOtYqReV/qd2xHLsz7dwtm1b9BiKx0rni9s/vQOU3DrmApDpg+QjHSYtHVrOdfKuJw
         jjQ/0oisew66WHwkQB3bJGkjgJA68oEuDqCwrFY6qU0PTLyEGzq8AdXdQqlD0GOZZB5g
         pkN+e5n5lS7cr/05tH1ZsCTZ43rFKndjl4SKsm2OirZCKIntczoYFfecWV+qpDAOhjNE
         zv7zjAyjVpYjJK292dkwSgIgGhlhq8X15tBWp1BpH0hWB+U0egStd8+V0YEQXRLI1Y9t
         h5loDLmbfAVo3jnmitFTgYSl3BpqDZRJiKh27JSw2FInWQ0CCaYtwYhUKmKYDT7M5Mao
         QbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169968; x=1793774768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNZLE6g13OUkRAJQh2g053ezFujOCllvGhTaZvGIa/w=;
        b=V+7VttC8iyG2dFiT0wcNCWEZRAviXz8rTZnSS/j+8SlPZ2ykwvSpIy7wWJbIL/dmng
         d2XxTHkgQVkR7AzwTQtFpWQ56+cuNkQuPp35if5zy1m0MISFBy7ej4Fsjy7g0ib0IMmS
         nMA2FALmcGtJDy4gFlnKnnxU5KItirAjCTwRZOGx2NloHwVt7uB4nFelaQTzTZwIi5QO
         oJ9btJAwAZeo07HgRM/tbzsZqjaUQmm7jF/+mfOCXU7I1b7wF7/V4UaZXR/uVkJCxrfj
         8XEeb3SpcjWt1SGYIaWf+qCFkaz3ABDNi+/MfaisQpT4l1Ba3ewWqdxSNwkgEMBHHnDN
         0AFA==
X-Forwarded-Encrypted: i=1; AKwUvBzG02AzYRGBDlW2bE4AG1vDFRJxVnWyJbv9ZF39cGCrvCEorHa6DO6bRKxNdJ+CX9IX6gOnDTQsDRVG2l0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUooIE9uWJZery9m5xi1+VmDS4LkptU1A2dGfPsm3UiKeAtOVb
	QJoEx2bW3tAq7jBDb69IK6D/CXwjpuuCHtyy4b5WM5BfkTugtp+976bX0A6NzzQ/fKkJDWted7m
	zQXEti6bgPmCNRFaRPqhBSc4F4eb5TBkTeRbAufuTXskiZx5uyD9C9x5DQb4iIfJ63pPzVSW0uL
	8=
X-Gm-Gg: AYBFou3nOXHH3e5H0qL9EV+tVqAT+/sTdj2KNOC0m3LvuTDkbxfFWri889OmP7HUPme
	ipJ3rijJRe1IUoflm7sOcCpvxYJl9D+GEth+k9v25ZoelicxVpi8x6GK6sBnZA2POYhaHggfYo4
	v4KV4miHXXLBItYdUUP4H+UBEBsj9Zl2xboret/CRx0eCEgyWfOup7oYt5jdqB3yilnKdIOLjFI
	XxW6BQ7JVpr0zAi1DY1sbDuWxIILHbwQiUM6QdOJYNgseevZXyKhBkNMkcpfZVcIk+KYz2cAUfU
	RE60SCye2loG2/0sibhX9LABHNzHHgZjK122QjratDV/TicDxdBXyqYvG+9noMtOCxjiSD78Cle
	Rm1YTn0QYh9Ww8IyWVlDNvb2ULdeDipSzov+9/i91IMaC//oTr6IX+8gmiwG29tLAoEq1eFaJdY
	ZShjN8OCaTTstcnzKuBy2T
X-Received: by 2002:a05:6830:67fb:b0:843:7bb5:28ad with SMTP id 46e09a7af769-85abf097011mr1938749a34.2.1793169967806;
        Tue, 27 Oct 2026 23:46:07 -0700 (PDT)
X-Received: by 2002:a05:6830:67fb:b0:843:7bb5:28ad with SMTP id 46e09a7af769-85abf097011mr1938729a34.2.1793169967375;
        Tue, 27 Oct 2026 23:46:07 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1fd30d98sm860727a34.14.2026.10.27.23.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:46:06 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:45:51 -0700
Subject: [PATCH bluez 2/2] obexd/bluetooth: Clean up redundant code
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
Message-Id: <20261027-fix_obex-v1-2-3d91aed181b6@oss.qualcomm.com>
References: <20261027-fix_obex-v1-0-3d91aed181b6@oss.qualcomm.com>
In-Reply-To: <20261027-fix_obex-v1-0-3d91aed181b6@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: XsKwpaoTqMwXX5xKalsz5zMAJV64FYoY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNiBTYWx0ZWRfX6ZXY4GXg5oLC
 90n9vR30qZa7XMO4eEPAGD7G2LfIIe6kNJXU7ENyqw3GLe3kvZ0J2yWtI3xnYeWMjIotAHuwkVU
 VvepzbQjLIT3OqDEw4sFY94MnM3wCms=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae19a30 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bBOUa_hTYMcDMAnvo84A:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: XsKwpaoTqMwXX5xKalsz5zMAJV64FYoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNiBTYWx0ZWRfX1JqlbLaiw/W9
 dPm6sRfhNKEORgkYtAhv1sz7UFpx9AWZz0b1xwybsyiojPKfpILox/2eDJm15EZmdu6qTdEQAkW
 ufenoqERybYeV6QhgYUtLS/ZiWEKf0RyWUOm5d0yvVbrO0GaO2aFKsz/KEv2S9LL7mTFWx59owv
 R3AdEys76ZSY5ISDnPCAclpTxtLCZmzSmXYs9J2sccGUxLfKM0eoFO4VweSWe6ltYcFO9Kn80Hs
 Sik4QutSxR1PHUtc3Kzde7MemlGv3xLNspnLhIHsoyk86FlJTgcz4XbmBcD91c9ChvnFw4rlT+/
 NkayL7VXVWEyn1gq5vXXD3TuIUOqwibdKvh+VcMGH2M1dPH4faH2KQgCVhfIuW+jOLzbNeyF3VJ
 ItZRJAUR54O/zHvL0YOxtZy8+b6tmCIDhFH92o2VWZ56znXokDzaq90a8aL47vSQEi3zWNix/Q9
 rRoaf0LEEiAkdeUbVcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280026

register_profile() already frees profile->path and sets it to NULL when
it fails, so the same cleanup in name_acquired() does nothing, and the
error message always prints a NULL path. Drop the cleanup and print the
profile UUID instead.

Also drop the trailing return in void functions.

Assisted-by: Claude:claude-sonnet-5-5
---
 obexd/plugins/bluetooth.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/obexd/plugins/bluetooth.c b/obexd/plugins/bluetooth.c
index b70090971119..0aeb1becdf32 100644
--- a/obexd/plugins/bluetooth.c
+++ b/obexd/plugins/bluetooth.c
@@ -88,17 +88,16 @@ done:
 	if (obex_server_new_connection(server, io, omtu, imtu, stream) < 0)
 		g_io_channel_shutdown(io, TRUE, NULL);
 
 	return;
 
 drop:
 	error("%s", err->message);
 	g_io_channel_shutdown(io, TRUE, NULL);
-	return;
 }
 
 static DBusMessage *invalid_args(DBusMessage *msg)
 {
 	return g_dbus_create_error(msg, "org.bluez.Error.InvalidArguments",
 					"Invalid arguments in method call");
 }
 
@@ -324,22 +323,19 @@ static void name_acquired(DBusConnection *conn, void *user_data)
 	bluez_available = TRUE;
 
 	for (l = profiles; l; l = l->next) {
 		struct bluetooth_profile *profile = l->data;
 
 		if (profile->path != NULL)
 			continue;
 
-		if (register_profile(profile) < 0) {
-			error("bluetooth: Failed to register profile %s",
-							profile->path);
-			g_free(profile->path);
-			profile->path = NULL;
-		}
+		if (register_profile(profile) < 0)
+			error("bluetooth: Failed to register profile UUID %s",
+			      profile->uuid);
 	}
 }
 
 static void name_released(DBusConnection *conn, void *user_data)
 {
 	GSList *l;
 
 	DBG("org.bluez disappeared");
@@ -479,14 +475,15 @@ static void bluetooth_exit_cb(gboolean at_unregister)
 
 	obex_transport_driver_unregister(&driver);
 }
 
 static int bluetooth_init(void)
 {
 	return logind_register(bluetooth_init_cb, bluetooth_exit_cb);
 }
+
 static void bluetooth_exit(void)
 {
-	return logind_unregister(bluetooth_init_cb, bluetooth_exit_cb);
+	logind_unregister(bluetooth_init_cb, bluetooth_exit_cb);
 }
 
 OBEX_PLUGIN_DEFINE(bluetooth, bluetooth_init, bluetooth_exit)

-- 
2.34.1

