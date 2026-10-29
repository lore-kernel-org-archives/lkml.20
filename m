Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264487;
	b=cOng+1AurnfhQBC9eV/91WQZ8/I9OmKh3+I3epqAJZdZnqRa2uengixDPARQ6Km3jy2x
	 fA7TxRLD5VBDAO86t0GtoV1ZycMB1aaaAeA4KxfeYcR3vH+SmMdXLTdVJxFfyVlYmXz/T
	 o9PDRnvGkfltBoO1/mY1dWi4SpJvY37KSpemGzFS4D0RtjjHOMc2OEXr/2G/SyQca5uo6
	 w9LnQ5aFfH2MHtQgOAf4MS2rf3V/L4fzy12yo7CTKhnofMEKjUV7kG3WO4wqBGl/7815+
	 cNsT0jmplsxWxyCxJMpqKhbWXcKpgKXbn4IRb2Br/R+Kls/3u6Erxpj5W9592xljDEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
	b=YQx9dK4PugsCgZadELyYwWzTpGRiOFNx6YHosNcnhnMOD/twsRo3daoJgqybxCO+i3uN
	 XPyw1UXW3YlgZ97kgmHhwf3/FrWEJMbvq0+VOhOrNnNz3SExfm2jwF4KqkFg9Zb/cBt+h
	 5HLhDD1KjrwmYQNYWuKcyYHavr1QVgBqd0+0HORWdskrky8zg3goQgJWyTrXHxtvrwunw
	 3+cN+0r2fGcIf2phUs1wDFZwEkdqoEfN8xvFIspa0kZpH6A8rql8NKvDx2OeNMER7CiQ9
	 4spw89kV1vTCjc0OCdWJV82xn+2mFc7v5sFV6TXomjXJJFoBavbkicxOV4y12yuGf3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+ubSU34;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QV6od4/5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A0D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+ubSU34;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QV6od4/5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8viwK690552
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=B+ubSU34TnQmuqRf
	jUXoP6JgBr03nskbsZWwAdWWZq9rE9HnL8IdPQhFieB8jO4nLxj+z3SjdEgYg3rf
	Zbm/1TlJN38AuDcQ3nG+SdmrdvFDUoS/hdtYMU1JUihyMbbKiC8c4vv0CSgezLeK
	OVSHeDstB7ytpTB/VuklL9JHWoA+xCa5faXM0NPaync6ur05YARM1rEda8628Y5y
	TWxy9ZWMNt3mSngWoe8goa8ZSBazScNs5XetO7eSCCjyY3u4aePg5IKH5Rnr58p/
	gAIdrrcCHKAyVEDmM4sx3hnlxzVsK4rFK67J4g4uQuHbRJ/fMq+1aEJho4A3ZNKC
	uDHmnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneuu46h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:01:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1590880a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264481; x=1793869281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=QV6od4/5vrMieBEculNjxyM61sQpSXO78rjIMMai77uwErtyaacHznpWifG85Cu0bN
         FJuyaHnVHpaZ9OC0X5fPRncZlZ3HXUlxHUxNkbEWoiIrizYt678ZvNxaQ5ycaUdfSQyo
         Ki3Wc//wquNNxQ5smQTxdtwo/izOsnJhxDe0SjSwVgs01900ZQ5CSr30C2M2Evenf7/F
         gJ+wWwBVlt+Pexd/5hL+bFxTYqngMGuZTqlOLA4lYBIx7vhL61Fz46eaE5+YRGvfXs63
         xrIdPInxcjH7Q25UO9xR8MHAdyF91LS/jzR/pLl1iqKJRuPp+l447XOyZQqJzSN2tpod
         KbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264481; x=1793869281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=d9PJ9PUB8pvVOpbCmy8qD8D7SemREeYJvImh0GwdBq+diKVTxcfBBH+wLX14bFrFXX
         0eXOg7WkpYExWODNXCOA6SSiz5DzfyW5j2hxe+Tv96UMHe5X4d+v2Uf0ff/M4zzl70M6
         6+hRezf14oADWHJdGjPyiU4VWp+erKOMRjHhc6A5EnfH+DNMmZO1naApihjtL9MekQ4L
         cjZ6pCGI6k4xm+3xvjygoHgmXN65KFkS09tNShALU71CItsMkM6uIKugUymShCP7vD9/
         9YG8oOLyi1yaIcHoXfIE3qJehPu+NdIXUcaCdSaIrcncR30Izjiod9rsZk4IwPpHnseS
         nufA==
X-Forwarded-Encrypted: i=1; AKwUvByiFreuQiGuJ8FJRktvDCt3EHeL5IfCpwgoNxbhduy+5TEVHrX9s2p7n6m01AyepnmaTStOcZNzupJvbCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Epd8zrFjd8cVY07mNpxM63eHi75f40fcqFA+yXFA9rYgCCDA
	rM6ENJLqGjGBmj3UTj07gONl6Fi4Z5FkF6ehAjwmzoUgSB06AUMZBY56UPrzrVqw6EUIH+NT7Yd
	RQUKJml6/OYlHOOheVW4YJC4wIegrzLvcW+ZZIB1dgE6Ux8CVVJ5mS/f8x5YOlHuEezU=
X-Gm-Gg: AYBFou0+Ga8rk0mx0uakev3PNuIreg8Js2gnxVS1XsJuRO2qbUHMgE+cXRIk4s54pjq
	K9urgIcravLEVNFNyH2Uogg1NlnGPytTMMa8q9pK6u5eQL+jKgPew5GUviADGz2CeT9+O1ICjxo
	CAla8nBCSPiQroTE+XybpFljDNH4IJ+Yk/w4mg0O+8nm7iTsAWpv7IMxV00D/hXQRQ96sAnZNKT
	riWCRyCX6yKsok3518By/nSn5xHeDl8dqja6UhNmsi/46CTpIZlK6YvpaILH0JCQTgMuTT4qhyC
	kfCRRoEXFyO5p3VKLOoJh+FI0lIz1AyIEQQwEToRxElpFkP8Esdmgw0Gpk9wFc1adIthiYIo2xi
	phwAnLROG3HMJtMRiQPyrMf9WciQ6P5W+ydlmEg+3YvL0nSlpdPoNnK85U++h8kK0xcVjPD0XbR
	0MxuevnJKG
X-Received: by 2002:a17:90a:c886:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae57e2b795mr3492886a91.7.1793264481357;
        Thu, 29 Oct 2026 02:01:21 -0700 (PDT)
X-Received: by 2002:a17:90a:c886:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae57e2b795mr3492841a91.7.1793264480794;
        Thu, 29 Oct 2026 02:01:20 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:20 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:55 +0530
Subject: [PATCH v27 01/10] power: reset: reboot-mode: Support up to 3 magic
 values per mode
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-1-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=4572;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3jZJCDBmdKair7R/qKaAWXxKmatvkMOd5u4ong8jp54=;
 b=pwt0UJhchuo9nRGpdPR4BB+yIn09z57FaxDRxlb2ix4AAxBac4tXKc6+sgbl7Lmrp1t16D/Mb
 l1rXyaHrrKtDBUIJR68JnHgXfn60pn9DJIDCO7wBnMbX2W5pYeUyOhd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX6zwZkXnjQXO/
 lLDqnInnEpJnxQF/sVtuBPqkd75e5pneKcdplPXlomtpWS8sFRyjCq/hiAWiSHFO3ekNcqLUMVZ
 TYL30upEUhliYyTn9XgAM7hu5G/udl/Z5HPzdcp2pHXJnmQuo9Fg4jd7NrHTYeZFf+Bnj6DusUE
 DCXsKqNk0ObrLuQ0XjRudMsCn9rimp6+zEyJI9EI93nzvCygRU8XYsLYJpkphd6BoQA8CNPym7x
 aLgJ70ouERV8KVjQGVc5wNWcLC3628fXR2pM/Sh4vAvZj8+EXCbSp6at4NCZ1p6uWyh05wdLiCe
 1lGX8vYYsgPzPxdBEGt2n9bI+Agv5v7EZLqsMW6K4PXHRLz682ir/0wc4e3zlDjQmFavyxrM/Kn
 W8wiHDbTNFkGCjIxGAaZuV1DiQbfP1W1SjJTPeky03n13yqJr7qLCgBXPekDXp01fROIQZUyMwV
 A04/4zwMBUk7kI3U36g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX++qkoG/Z51Q0
 6G4V9sKLRHNzwb0CEZ5ifKkps/+xw9P79G/UTRb3kS2cSBG4qAVIEehF30jZTCSNg6m+Axeo4b2
 GxIeRDogGV5ZXEvzTr2iEcDQ3z2jrCo=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae30b66 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_usNffLPL2KliZ4tEdwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: L_iaebVWcX9XJMn3impoZEs3z2hG_CYv
X-Proofpoint-ORIG-GUID: L_iaebVWcX9XJMn3impoZEs3z2hG_CYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
cookie as arguments. This cannot be implemented via the reboot-mode
framework, which supports a single 32-bit argument as magic value.

Extend the reboot-mode framework to support up to three 32-bit arguments
as magic, per reboot-mode.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 46 +++++++++++++++++++++++++++------------
 include/linux/reboot-mode.h       |  3 +++
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 3611bed341e1..328fa37598df 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -20,7 +20,8 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u32 magic[3];
+	u32 count;
 	struct list_head list;
 };
 
@@ -72,8 +73,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -84,11 +84,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd))
-			return info->magic;
+			return info;
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
-		return 0;
+		return NULL;
 
 	strreplace(cmd_, ' ', '-');
 	strreplace(cmd_, ',', '-');
@@ -96,21 +96,25 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+			return info;
 
-	return 0;
+	return NULL;
 }
 
 static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	struct mode_info *info;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
-	magic = get_reboot_mode_magic(reboot, cmd);
-	if (magic)
-		reboot->write(reboot, magic);
+	info = get_reboot_mode_info(reboot, cmd);
+	if (info && info->count) {
+		if (reboot->write_array)
+			reboot->write_array(reboot, info->magic, info->count);
+		else if (reboot->write && info->magic[0])
+			reboot->write(reboot, info->magic[0]);
+	}
 
 	return NOTIFY_DONE;
 }
@@ -173,16 +177,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic[3];
+	int count;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (count <= 0 || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
 				prop->name);
 			continue;
@@ -194,7 +204,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+			dev_dbg(reboot->dev, "reboot mode %s with zero magic values\n",
+				prop->name);
+			info->count = 0;
+		} else {
+			memcpy(info->magic, magic, count * sizeof(u32));
+			info->count = count;
+		}
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret = -ENOMEM;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d6..29ae39935d69 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,13 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1

