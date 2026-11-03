Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708487;
	b=Ts5M9EmI0gZwPhGl2PcN5JmE7tS71aeHZD9hEPMmPkzJsSsVrmK9PHVHf0Emm3khkbax
	 Y6GPQcWmWfSekmIh6JxOxh2oCihJxBpiRsQZ6lVAerzxwEDLc8TvBAJbA80hvSygDgxOL
	 fZw9NoJoXyFjl2cqs9s9w8DnnrVAbgEcj0F8hrKbhVBmAFBB5PTosPEZTkXLNKbGAsAKr
	 HgzdBxgKTBC6RtVFPampcwGc+SRZfimZnrwQkZ5IcPbs5WaHVl8V/Bkodsumr3OZjiYgG
	 JqAVdvZr4JmYHxzaeKCAkxpHniZ3DnRoOba6LEjrAF2nMB5acF7GA22Y/isTLznbWSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
	b=ASl2oJxRNajFkXWgxCwKFSaQCAiLFkgFu7k66pddgc2IT4QB4w3aaf0WQZl4D3Xyif6i
	 xaXozDod6cITO4gSlPCJ7ZMpbQ4afIT+jbtmAcr2B6f7CCM3WoojkKxZQ5ip7PIMs7b4c
	 p4QB6/b87LTcZSAoL2zbGdLdCEDEYjVSHhW+8e1fSt0XxW0I042CGEHDc8o+pAPE8alah
	 1sAZNaXtlKS2ZPl6nmRWlHfnSoMYkGoKeEVFQlzVcA1JHegaG4hctIniBJ/ymDOQr5Xtf
	 9RSVY0XUp7NmBjS4/+6zVtf5p4wxiKviJ4HtYyaj9kq/LTTNHjFMSOc5f7dVHHu6hXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpq2XiFz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TXGp1+sJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC918606D811
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC918606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpq2XiFz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TXGp1+sJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAHQR2522092
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=; b=Tpq2XiFz/sYIaNfA
	ckdJVcZdjS9R5OqtPDq0qBO81VYeaV7/eGD25CVdaWyTCTJlRrfXCUHkhthA+6uR
	xggXakYej5aJSzr0ugh3Qjs0ys8zGzVpH/fuadQyxirhl3gTRuksL/NIw8inWEje
	KTV21/wSRMcu+d4SMUVYhZn5Y4s3WhNYEsh9rHXwo2GecwbfRT18Hd/rQTgjwjTS
	yXpB2t77k7G8KkPLhm+vzwDRrMfR/vGks0WTCkitSAz/O2wHSy58gIDeS2AP9ebZ
	gDgpSh3FwxFmdZ8nCXXIK6VSPpbfrJQIE47I8lcrDLxsuSFtWjciX3C6xOBlTi/z
	Wl6wsQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jkp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:21:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99859876e19so15501241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708485; x=1794313285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=TXGp1+sJIOSer3uqzcVXKWnni0J4IfkuKW/ZG363FlQIw2c7B3rmdhfg6REqib6zb2
         UtSdPKIBxzNc0DSGrcv0l60aI+GasNyMY5tBMX0R9tGZmhuSMjUXEETpNB3zq5E/8q/R
         3DwehlPZn+8FbakmFEkql1tZiRDABCBtyiqxtS+iGE6XNtMeoa6AuDCo3C8qMNb0eaQ0
         MWQZEokLG8aNuh/HlbbNXu6CSXBmXsOODm0e2ho4Slh5q1u5PDtfwOBzlFyriNIu58bX
         eAj2ASVD91OpNTkYmlyrO/UvxtMeLTsi7WgfQIjVlv7xzkqXPwpqVvUdoFP0Cu77zzZ9
         DTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708485; x=1794313285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=ksadgyWqr19t9wKBovRn6U/NGkwJd/AzrZLAXb96mM4qDZJeBUE0/tyWMAGnGeBs0J
         gxTh3JxIjxsiOCi2EI19PSg30lehrregKpPDmdMAPVtrQZW4nD1nkFoJFN61GuKB31Pl
         F884IzAGxq2oL/dIAitaFXvsv1vRalDwEV5vHDy//DVBwlFQ3exLxMNGWNPDzSCD1Ckr
         MhN5ak1KrRnbUWaQ33yoaTr1MSI8S61574AD7MFKBeWY16ov4oDgwtG/10OfNVlxUH8J
         Rqq1EToplAD1KoCN6RBPTpExry4gX8MkFlu/iEThg+apD8tp79fw0LgaJzsc1CLeZ8KH
         NpWg==
X-Forwarded-Encrypted: i=1; AKwUvBxPhB8YIjPi0UWtunKnZFdaoggJz3AGPZJY6NMc3IIbn1iB5xt9cPLl9NE1ubAAHzb/rkXwdn4Hs/lm9fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CU/SebvAhw0rmn63YGfekjkL+d1H311/4HMUZ/rrGaeSJAeeN
	35m84Xnmi+eUbE3Fe6A1VouOGyyWZnCaNlCiskt7ChVToitiMelNbR8foGxkTMWFo7sX4YRLnQq
	Nl93PNKMUCV5O+LavhuwISS7ZMNt4M8w79PLxB7vTosWyho/9wpbF1BTZrLr/CjVjnGM=
X-Gm-Gg: AYBFou2at+Jf7l726wVbNpKT52uwWQtnH42OWfZ+kvyijdIiNLTNCSOKkhhbiOtCmUJ
	BwYSq0bDOLhm0Pj4MF5ZhX9EXozIsrRNYSGs5UQwRoaKM9CnMSE1fPhBZCF/CM+dZcijN0bqhwo
	Ye2T2WMjtLvtEmA35jQyNQkQoeAkGQP9GXathdCRqJ4j5z40NXvUSYL39F4nRdIkFu3iEd1Xec1
	YRnOX0vNJ9Tw2kpZ5mvEyEkLlc7V2MxHXy8sSX/IS3dlRzZF57D/C6AZLRvjR9MOgfSUA8LRhSO
	0c053gHI/0XapdLfqNwpX7TFjd1Z1WQSYvZ/ovhrP6jUVRSnrKF9kTZFHJjTSs39wLBtLs/h+2c
	MIuVNsaAGdl0Ta1z3Eg9Bsm0K87QygGWofseb2uxhIMkDghT/JaXSDHfZFk2hXyjB5emexu/BT/
	dPcg==
X-Received: by 2002:a05:6102:604a:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7d072237ca3mr4251029137.5.1793708484698;
        Tue, 03 Nov 2026 04:21:24 -0800 (PST)
X-Received: by 2002:a05:6102:604a:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7d072237ca3mr4251021137.5.1793708484152;
        Tue, 03 Nov 2026 04:21:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:15 +0100
Subject: [PATCH v10 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-2-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pBmr6hTIjmoRjtYdJqbTh0DkvQI3gauruJ23Msg4kXE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+LY4sMbwwarcwBrGKShEWRvWdQAw2MARkV
 O60DXJAGdWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w8qzD/41cP1pMeLXz+bNdgKbEux0RbbgSa7D2hSeZkuoFUQpaaJ7bWCzDW91zjmymYqrFfIngin
 pPkmTDopmqLPlTynEazDrsF7WgcT3eqzzaixTqtmoSuFwro6DCMLarw45/cL6sAV1XKv8n43OOq
 rhqYQQWQyH3ZOuMahszLa95V7W3rL3nv4eZqbLq0dO6idKB/+U7h6lBYmjubXEy8JyL9QBxQJof
 D/5TWHOU201lS+Cyd3Lw1UMDklUZoGW4Bz0qyGV+fYCqmTg9GE4d5rWrRnnHzxNBg0tmXHVoNYd
 9nq20fqYrknva5gtOxCZ+VeovJxVIxSzYZFHlceExjGlqN9QqA57A8rOpM53+w4TuMB/GsUno4O
 UFfdqZugXxBnVSWjgtoVvAU1JLDqinxOtz7EDK8MAqqESSq4X6+oVYQnckac7LZT0M9nKXgTn1m
 rY9U0gKQotn9OBOsAwDKdAjMoALIk65B1971OLgHGNNnGuDKDMrM7Y9r6/KIjNEOoXS1Ykv8w4/
 YsRp3FuWg616kysmwL0jM0yMB3SImS6YA/L8ExbuBi+V//4ruHu98tBBtTFl1LSPUha2+gi/Wf+
 c63XR8Og5m8jTwDcGEDMkuBw+55SS/aYLnLp0GPDuZNcnHgYAAK3Ld+xPw19o4fr2h4nQy0vU7q
 BB2Z3MJ6itdMZiw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IiLUCvIRrruv9S9hV7fo5u5v1a9yGjCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX9GBm8JWt9lc4
 4NU31WYIdM9QCRCcbUiDE0P7OeqZdY/A9iZ92nkNvwKnFK5TOIPrJ4tkzKV0MBJxLptE5mtn5pb
 iTR6u6Gilm3oT+pphcjijkTXIUew3FhRZUjpv9psOotBbGsenFUGwOtunGJSjEKO4uuFIe/5ty6
 RTHESa7IczNKI9gfacwr60QI200L7Ozva5v4bOzInZ2ztWNgSn/Qidtg/Dr0OwK6WLaI6khG7l1
 /Nghxh056XvVnMtwM9qyOJeYOrOvtD9YaITlsxQjYVYNAPrBN0LmERwTRCWTG7nZb+mYJ2ue0NY
 mUDYwf81VI0JYkfgPiWXkHwQRfDwQI0KyIYVQU1IhDqk8xvOllXmoLhdkoV0gSFVeBUizlH5ZJ3
 OYj94eoGPSncwZEN9fdpn+KZ1clcG/6ZmRZvWrMyPR+7plUDlyARteyL54Te2MiKto5yhu/y2yE
 ddbxvwbbuHhJEUY1INA==
X-Proofpoint-GUID: IiLUCvIRrruv9S9hV7fo5u5v1a9yGjCy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX1Kdb+NIBVoeQ
 INwHyWtC5O65gJDA4aSlgIw27RZn4HFd/ha/m5cax4P77LD062zX46gRQpZnuHlCUQHKJqocb+W
 amEvQz5+Yia9A2fDmeC97H3AxyOzQGk=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9d1c5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

Move the per-entry part of gpiochip_setup_shared() into
gpio_shared_setup_entry(). This is a preparation for making the setup
all-or-nothing, which requires handling the failure of a single entry
in isolation. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 112 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 64bb450f0a8461d214a45aa97e2474ff0d1857ce..c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -538,12 +538,71 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	}
 }
 
+static int gpio_shared_setup_entry(struct gpio_chip *gc,
+				   struct gpio_shared_entry *entry)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	struct gpio_shared_ref *ref;
+	struct gpio_desc *desc;
+	int ret;
+
+	scoped_guard(mutex, &entry->lock) {
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can translate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
+		desc = &gdev->descs[entry->offset];
+
+		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		ret = gpiod_request_commit(desc, "shared");
+		if (ret)
+			return ret;
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+	}
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
+			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
+			 ref->con_id ?: "(none)");
+
+		ret = gpio_shared_make_adev(gdev, entry, ref);
+		if (ret) {
+			gpiod_free_commit(desc);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	struct gpio_desc *desc;
 	int ret;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
@@ -571,54 +630,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
-		scoped_guard(mutex, &entry->lock) {
-#if IS_ENABLED(CONFIG_OF)
-			if (is_of_node(entry->fwnode) && gc->of_xlate) {
-				/*
-				 * This is the earliest that we can tranlate the
-				 * devicetree offset to the chip offset.
-				 */
-				struct of_phandle_args gpiospec = { };
-
-				gpiospec.np = to_of_node(entry->fwnode);
-				gpiospec.args_count = 2;
-				gpiospec.args[0] = entry->offset;
-
-				ret = gc->of_xlate(gc, &gpiospec, NULL);
-				if (ret < 0)
-					return ret;
-
-				entry->offset = ret;
-			}
-#endif /* CONFIG_OF */
-
-			desc = &gdev->descs[entry->offset];
-
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
-			/*
-			 * Shared GPIOs are not requested via the normal path. Make
-			 * them inaccessible to anyone even before we register the
-			 * chip.
-			 */
-			ret = gpiod_request_commit(desc, "shared");
-			if (ret)
-				return ret;
-
-			pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
-				 entry->offset, gpio_device_get_label(gdev));
-		}
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
-				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
-				 ref->con_id ?: "(none)");
-
-			ret = gpio_shared_make_adev(gdev, entry, ref);
-			if (ret) {
-				gpiod_free_commit(desc);
-				return ret;
-			}
-		}
+		ret = gpio_shared_setup_entry(gc, entry);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.47.3

