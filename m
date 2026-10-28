Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169968;
	b=tK3zXkBnIbaZKlIwPvZZUsWc1Rlz6oVGk+AvNQjmAgLIYawgYxZwTa0l57hxlFzWRC8T
	 XEBk0vhqv5pQ363HpzQZtUhiR7uK4Qf0+eCE8ep7cxcxORgXN3aemDJPaqKdiMbfepy81
	 4y5Lf2j0QcMJQmK32pgjSflN9kD+jPaJPMmI+DDTKZ248cd2L8zlfO/feY3q/k/qy0pd6
	 9DkwJTjjGccFSHGoztdXzHHkIJDkmpEAsmA3GhH/YDo8n1/rhd6n8lSey/TqrUse44Peu
	 4ULziZBCnq4yX3zUIi/h2oplPofykWS8No+KC1NmvPHmgmIAN0Pw+BjA6ptW4ol6Wjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ikrSiZhzBMBxrmeIgAuxyX+6kJMDsb1nA1v3nDc7WPI=;
	b=35oIVepr+I7ceifuxG//PrtA7tTMwFCjg3+LB6z4+qGLd6lGYE9w6C2eaBHUCwHhpMvW
	 /O/9RV6mJCGzJxFS22pjPC38S21ESxkLQAFeB0KL1fT4KPHG3tHEhoRpFAeNTasv6UQ0i
	 JrVtJYZB+dHxosqLrnyjORJ4ER2qlLDoXM6VPmG7Cmf2ypV6FCxfIhiQ/NL8hfEWK9khz
	 5f/uD+qtCzF7Zq4vqJm+erZldYrom4yOMbfS83/pGKk5P3gQrKwStWbrEKMe050svmdi0
	 p07hbJzf3wRt4yH53wKayfP0ohIN7w3X4mBmEzqNlG6tl1kpHZtuF31vlDdmzZdVazQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B31gd0kp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5gHGLxG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AC8606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AC8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B31gd0kp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5gHGLxG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4Pdpp046817
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikrSiZhzBMBxrmeIgAuxyX+6kJMDsb1nA1v3nDc7WPI=; b=B31gd0kpNmEGnRRU
	NB8I+iZAv4htc9GUFcnw6SgSE4/pi1gClYl4sSxXmo5fPu2EH54Moe/KebBDTdOe
	/j+QY/1ah8TAyrtP6tnkgAVcXeFH4Bqz/RfEwzwqVtXEYYr/yRTV868LfFSKv94c
	PIV7QyugRhmq7fhmeOrzgxw5IP57MbLNKxPHBykZpDs+1sL7bqGPjh+fr8cRBwl9
	Hb3oT21YXkghl9mUzUtsstTYn/X+ayG9BQUI4ABsrJJrAMqUowq0ovTRg1nmijFG
	d+HDOE+qWfqvyx6bQQ+PX1yyE+KkWR//Z7ncqKdur+3FSFaLCL3heMj4ev2XcYtQ
	SygaeQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82trts4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:06 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-82252100b09so196641a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793169966; x=1793774766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikrSiZhzBMBxrmeIgAuxyX+6kJMDsb1nA1v3nDc7WPI=;
        b=W5gHGLxGzaAGR9iUdxCirK7WeF/nWPTJYrj9cJu+nNA+8ZpybKu3X5iwyuPXc0g5qa
         4ht5CJ24RMTu5EAsecWDbZQya9aVPBnLBPgDfh6vVxEZZjzF+vjcBc3SR0jK8BnxLxiC
         MFVXXRZCtDyk1fUPs8QdGN+I+9IVYiX9d/Lo4GVL0eJbe+vK5Cn1XThr5SLnwFVKCn6d
         nTxacPQ066qgFV3vGdLXkYwNqPS8BZsPy4AtLlSmOv1YAN30eD4pBvgK9GIEu2GY9lJT
         1gGgQQzKx2AsxAZ+P7GyJbcF1Oz3i0fMY4OjC/OVA+qCx87jeQyd7jrnQu/JE58+c1Gi
         CY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169966; x=1793774766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikrSiZhzBMBxrmeIgAuxyX+6kJMDsb1nA1v3nDc7WPI=;
        b=s8Z8Pp2oaLAnY51h8LQ8FU7jXfu5F7ZjQ/T7Nh5io7q56a1UWULP1wrXsIo9D0yp11
         UUjcycJxK0HSIpyqxGJVjbmUUnGX8k/p2AceyeytWMs1ap1bQf03MaFaqaHiiVnywQSG
         u7BTBEew4PG5FPXjNxGb+ntEEUdjvVDSTqJUYFqqpLBxjm+aGddh5JYZSKeguzLwexuR
         teZx1qQJql06QJciyeCDFXpf9Ik0+yzEkvW774LgwPQdaRko6eMJmG3XuabJ7FbcfTDm
         SJ4PSH9PIKpjVF7WEo+X/jHX0guuJsGLdqQovWZPTEKlDffFhy8v/wQUayT+OT+RhzOk
         hBpg==
X-Forwarded-Encrypted: i=1; AKwUvByS8OEtrsHgTnj+6/Ih3GUenxeh3ROJOV8deTL/bZQBw0sej+Von2AivWnIO9umzm+FK7+eNQ4Sy97HoL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrB1c0Bq5XvuJEHRkkp3AJLEpRzS3ssRngm3BxlISIzUxKOp3Z
	NcgJ4+Olai+5QFIMp4ntVNo0EGr1G21BcqmTvWd+Vj2pwvk3i0rQi7vU8gg7bGtCwFf/hHPQVs7
	ck3vmSBZfP4ShXo3YH0vpA/8f0jig2wgVpMzIBgSeNPWEdIORcgcvoK0iIhJ6zC/pUSoZSxTYVT
	o=
X-Gm-Gg: AYBFou3/kROs1UPQ50mX6Hy4AfLybbdO2HhRQETsyJyC3JVmRifJccwhJgSLGZQApo6
	HAzZA9GXUTzZ4VjzzpoAE7U0vItMk8FvVXMORlEJnPpLEz/HoyKxQqW1rRluXC7uHHtw1Y/9VxX
	GoKhFM82VoXWOmSFxwjcLEdIh56E0Z0RVwfu8NodYTKdmsrhwwH5HytwXtr0tP2tQI92UOFltDS
	SJ9nH9U6/+46nLxkvNzPxJCw4wRPci6sJQ9+SQLYYk9Ii1gYGfbzdIKrNtbP0leoT+gcvv5/L7N
	S7gcl8X3+MXYzFb6qppSgN2IVtQRKoo4NhWXI2jqX9dbiAoTXICmOCFqUb4imDOl5LDdJHgCuUa
	iM+mFMSPb4etqwsRkxk2I136+H/JA5yCrq4kWQrp6gF01lPArJdjvgENLx0Uo8l8TNrrmSujYHp
	/v5Ve337d4a2OtikKEXJ7F
X-Received: by 2002:a05:6830:1214:b0:805:98ae:2160 with SMTP id 46e09a7af769-85ab97782d5mr1620822a34.2.1793169965787;
        Tue, 27 Oct 2026 23:46:05 -0700 (PDT)
X-Received: by 2002:a05:6830:1214:b0:805:98ae:2160 with SMTP id 46e09a7af769-85ab97782d5mr1620806a34.2.1793169965358;
        Tue, 27 Oct 2026 23:46:05 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1fd30d98sm860727a34.14.2026.10.27.23.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:46:04 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:45:50 -0700
Subject: [PATCH bluez 1/2] obexd/bluetooth: Register profiles added after
 org.bluez appeared
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
Message-Id: <20261027-fix_obex-v1-1-3d91aed181b6@oss.qualcomm.com>
References: <20261027-fix_obex-v1-0-3d91aed181b6@oss.qualcomm.com>
In-Reply-To: <20261027-fix_obex-v1-0-3d91aed181b6@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: ZRv7R6DchFriOagBupMeXLtTx7SQAzIq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNiBTYWx0ZWRfXwNpl328ujMBI
 rrSSsBTvvyouFMkJwF8+C8PcVVWLSy/ji7QQWvpR67z4H3+FgAtBw0sl+QiKNQlPaEKGRWxknBo
 cK1HwHGndUrgiSs5Wnk1xHGb1+EfoFQ=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae19a2e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=R3qYbWmKcKoroIU813UA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: ZRv7R6DchFriOagBupMeXLtTx7SQAzIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNiBTYWx0ZWRfX67s9awZYUHF/
 cY3uVHaDjyT9BLIfcw9ceCxm22V5jXcHb/RGT2S3x2i+tw3DL6igwiUdChAzKOH0G9R+gFdKsig
 b/gmJVJb+wuah2AxmfxE8p/BMM1XxXn749f0xIudMwvHnDFSob2y2HnitUiAna3xeQ0bQUfIbrV
 sINY++5pyv2lWO/J5HulhfDTsE3at5hf4brwB7XLoS6rPWbIHHQPh5N2ONY0mHnSZ28ggB4Qg6L
 aX1pWGDh5X/sSbBPjgWQvvnlgThMhcjJC52bz7bu4HviLrvjwJLm4uILE2ABvEnSmTB+Tn7+QYZ
 gzeL8z6UTHAorjTG7NaAARGFOafgNC1wSkLq6Q3NbNZSQYcstaZx0wL9XqmGNtkH4x3n1e2MnW3
 xNqgZHySJeMQFdlRvHYsAZ5TUWjjYAdYAINiHk/zuYEhCuzSNSlUcUgSTvY4K7FlxDC9ihtc/Nn
 Edsk6yUshVtBjV/gHDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280026

Issue:
After boot on Debian, bluetoothd and obexd are both running but none of
the obexd server profiles (OPP, FTP, PBAP, ...) is registered.

Why:
A race between name_acquired() and bluetooth_start(). The profiles are
only registered if org.bluez appears after bluetooth_start() has added
them:
	plugin_init()
	  1. bluetooth_init()           start watching org.bluez
	  2. pbap_init(), irmc_init()
	       e_source_registry_new_sync()
	                                sync call, fails on Debian
	  3. name_acquired()            fired, but the profiles list is
	                                empty, so nothing is registered
	obex_server_init()
	  4. bluetooth_start()          adds the profiles to the list,
	                                but nothing registers them

Fix:
Register profiles in bluetooth_start() that name_acquired() did not
register, if org.bluez is already available.

Fixes: 23b28ab759ee ("obexd: Port bluetooth plugin to use external profile support")
Assisted-by: Claude:claude-sonnet-5-5
---
 obexd/plugins/bluetooth.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/obexd/plugins/bluetooth.c b/obexd/plugins/bluetooth.c
index 3af1b504d591..b70090971119 100644
--- a/obexd/plugins/bluetooth.c
+++ b/obexd/plugins/bluetooth.c
@@ -45,16 +45,17 @@ struct bluetooth_profile {
 	const struct obex_service_driver *driver;
 	char *uuid;
 	char *path;
 };
 
 static GSList *profiles = NULL;
 
 static DBusConnection *connection = NULL;
+static gboolean bluez_available = FALSE;
 
 static DBusMessage *profile_release(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
 	return g_dbus_create_reply(msg, DBUS_TYPE_INVALID);
 }
 
 static void connect_event(GIOChannel *io, GError *err, void *user_data)
@@ -315,16 +316,18 @@ static const char *service2uuid(uint16_t service)
 }
 
 static void name_acquired(DBusConnection *conn, void *user_data)
 {
 	GSList *l;
 
 	DBG("org.bluez appeared");
 
+	bluez_available = TRUE;
+
 	for (l = profiles; l; l = l->next) {
 		struct bluetooth_profile *profile = l->data;
 
 		if (profile->path != NULL)
 			continue;
 
 		if (register_profile(profile) < 0) {
 			error("bluetooth: Failed to register profile %s",
@@ -336,16 +339,18 @@ static void name_acquired(DBusConnection *conn, void *user_data)
 }
 
 static void name_released(DBusConnection *conn, void *user_data)
 {
 	GSList *l;
 
 	DBG("org.bluez disappeared");
 
+	bluez_available = FALSE;
+
 	for (l = profiles; l; l = l->next) {
 		struct bluetooth_profile *profile = l->data;
 
 		if (profile->path == NULL)
 			continue;
 
 		unregister_profile(profile);
 	}
@@ -365,16 +370,25 @@ static void *bluetooth_start(struct obex_server *server, int *err)
 			continue;
 
 		profile = g_new0(struct bluetooth_profile, 1);
 		profile->driver = driver;
 		profile->server = server;
 		profile->uuid = g_strdup(uuid);
 
 		profiles = g_slist_prepend(profiles, profile);
+
+		/*
+		 * This profile had not been added to the profiles list when
+		 * name_acquired() ran, so it was not registered by that call.
+		 * Register it here.
+		 */
+		if (bluez_available && register_profile(profile) < 0)
+			error("bluetooth: Failed to register profile UUID %s",
+			      profile->uuid);
 	}
 
 	return profiles;
 }
 
 static void bluetooth_stop(void *data)
 {
 	g_slist_free_full(profiles, profile_free);
@@ -441,16 +455,17 @@ static int bluetooth_init_cb(gboolean at_register)
 }
 
 static void bluetooth_exit_cb(gboolean at_unregister)
 {
 	GSList *l;
 	(void)at_unregister;
 
 	g_dbus_remove_watch(connection, listener_id);
+	bluez_available = FALSE;
 
 	for (l = profiles; l; l = l->next) {
 		struct bluetooth_profile *profile = l->data;
 
 		if (profile->path == NULL)
 			continue;
 
 		unregister_profile(profile);

-- 
2.34.1

