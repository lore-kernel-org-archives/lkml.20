Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623832;
	b=pK73TcZTUXIzd4xAbIdw4MHoahyTC9WM9SluHu1XXQzT2UDo+cZzE2DKUdTZxbDNFHK+
	 5PsxYGZgXoCtAMGdCi/SJU7azzisa1OzwRksRqoRmB5a88q6mlhkI2/Ck4by9ASvhLEhe
	 WV8Td9kp77UDnd9jFT0e/9dESDoeMbD+DBt42xSupLZCHrz1LqoDqIui16q+uovl7l6NW
	 ghNOuWlt0K+Q/gBPeH3zyJa974IswtClVXyNm48ORlByKH97M+Ai1STTaR7bMhask0CCh
	 juol+BvnoD0PnIL2DYV/q8o3UU2caWx7Uxt96zfEaE5Dfqyc4hj+JhlAja+20fEPA/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
	b=CJip7mJVICFtXfP4mPgSsooPpBuqlRRB82Nrb9JvISTGCyQL048Kd7VhGdETESNsZhkv
	 2pJi5zrIhZFaUBg8O9JiU6aWYP+wnLsrjv2GwtTIKFzJZvRQV6/aVU9fNOQyuxbQ4wy+f
	 8PHTDB6GhvsIYCx63b0Ai1UECMeMM7a/X+DdI39Db5cUqdbwDy8St2a5FnwZQQZdd0AsE
	 v3KMDag4Xc3WCgpzczY0JTGV4C+/pzYRuzU3NdaoVNT5RHVGjCH+9q7n+uHPtYduQ0TXS
	 IC9u3Txja9psPVWp1l7n+/4vZPDJDNBi/Kga7768NiUcRCAZnQjJ4OXiuyqO6AGwI1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRgVKmrz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8bX7V6f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641A360A261E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641A360A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRgVKmrz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8bX7V6f
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4LjP2616184
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=; b=DRgVKmrzQ3nCUmKD
	8ij9enGNqQBGcCxPegiucxXLdYbHjRGNXgVlzuSOmFghzG7HqIgUovg7bcsDjnuJ
	hAHf8/3jvad/IirpMnd06YR9arcdikvrWk0cmgxAx50H6EEQYW2aJ/uwOckZNOoe
	ZgeiVEsapJMavUH3IBsA1wQSfVwvDWP9QD4uTy12L7LKOEfMIxXknoTHtkPahvhk
	uGdHFsH7Xm6SRmERLPFE43dFtZd2pHSIIq2LtDqZ4umshzTDnvg6SEDvs74ttUhI
	7T3sEZ2aWFL2Pj9R3CRGOgih2qiIrB0Bpzgx+r8J+hon1baIQEhg4f+BbNEgkzTw
	axXgdQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgc4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:50:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf634a101fso2596484137.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623831; x=1794228631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=c8bX7V6fC0WRVlAxF2fF9xj26XK8EUECYssMopoe60RAu+snTVK4KpDUbk6kMLpcNf
         wjrs2KcGsRE5nFLT0MvQu55pboHI1qLJ8gsNQo/eioZpP6Pi2GrCjjbhLA2iLoeSJOJl
         NippbYPL5mIBaANd2pOkZ/Oac6jJt+tnYjhXPsWFXT1YjxSY+uMK5juRtGn03qnOkNRa
         U+m78mTojKPJ+ybnzKxV/F2FJXrAK1QFHPsygIWwagVqs2jJdLeTTC1JUYPqNbQVbam8
         sVWHTRIJMHRiXRgdpJfpZ/x8zctXq2u1GgXh3peLnYkOJ5yjBSop++XBvQ2nNyEYvVg6
         fpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623831; x=1794228631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=O45/Bce/ow+V2mWkSn1cGovac4H5ZZme07XadUleFCn1IMrp0rrNq4g9d3OaQwRtCT
         2ofh78VixljnZyph3KmErbagkd4s6adCJLLywfmQo5MXmS4r8zguH3Njur3lu9AGVkbl
         QV43YDKLTpk25Wt0aJaQXM+Sx3/8oAnw+JMrL7cQF80aTjOrQGs8CaNis1LxK2hNfs5G
         Z005YaYnKiqlRKXvMD1bqewpLSah84OkpfPJiXBUjIFxkFY4ITEoTU40L/BsQYIsEIZd
         RiTjrdNj7/w33y0QKyvsDcz/UIuwGrIrn+Zi7XcWrOkWwRKmKojHBFwAmF+ORks9Eo/w
         WYSg==
X-Forwarded-Encrypted: i=1; AKwUvBzg8AXc2SlAPME3lX/Esh9DEIfrI7fgwDqyclwyLAZwXD/z0nDQXotqmgex4y/rVN1FrL4Py+HBUWf7+FY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+baFlcoLdBD50GjISXlqnmm7gp6F9P75MZa3h4X4U5sXg+FPdk
	h8NkBYhPXicXo7B2ij8Ewmfbi7RhPz+uRrcqB8oSVG7S67YvUstx7q1biAWZ7+ehMziA3OM7EC3
	pTbUTMMPmo3uambMns0YFtajGE7LLNPY52atermra80uY3Of8tgbt3cHCO2iD29NkpjM=
X-Gm-Gg: AYBFou1i/BYM7UjjYbjHRkZ07E65fo3g7aStR+5PNS8qQzST/1fpStmuRqoHelJvKWc
	UFTmhTgRhkP0i7ko5kbz1nGsBdQCIpnLeGFxVfPFZR+a+lOYGNq0amtnIJmqX+0/Y+uiWqo5h7z
	EUh7lqKEuhx9XdSsGgE7rbxJR5QuO3Qu3eTJcGjokoXLgHrF1ZZDr53DVc0w9eCQkZekns8LdgG
	nuueR5K129Ys/3D7+IckPDhyUxtoycF0HzLXcwtjI5vyLoO27y7crr5+LaiYJPDRD9IRt5g80Kz
	7p7A4dEPDV9fARDLWqbSmdGKlYyIzLF5tZhfik9dv0wIa3euE3A06IEOhg3Z9rV77uDRzaUlZNR
	9fieYWpBdnisla6AzB91pPXRX74gPGi4FLNM89f9cc6WmCSG40XdJSIflEYxmzQ1b7l+WQ7vWZ/
	dmPw==
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr4032165137.23.1793623830580;
        Mon, 02 Nov 2026 04:50:30 -0800 (PST)
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr4032158137.23.1793623830044;
        Mon, 02 Nov 2026 04:50:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:20 +0100
Subject: [PATCH v9 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-2-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pBmr6hTIjmoRjtYdJqbTh0DkvQI3gauruJ23Msg4kXE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcQbGDlWObuvqS+ty1xvhXyP+5fx4AA3JhIh
 q7ikzqGFP2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEAAKCRAFnS7L/zaE
 w8BrD/46FTsLpK2zfYL3VWIQ2Nwkpwf0z0XrJzv0eU6MIDFY61NXMDRaBq3mruymrJQw1MKux6C
 8Ouf1xVYxWyiLMEh83AhXcbBj/Nyjlnd2mxTdhKgdzO2ZWwHS9mxVE1wejH6qSwjBlo5WBDXQCw
 RcGdXcyOHBNYiS/YpyjILgG90ZSqGFmWgBooF9VJXsKyDXvYWGIfHzGB136mid8rlfPnQs6Oh2v
 xaZhjc48m2nc7xbg2NXEAl9an4BbMq9twdNweXnNedJCQBmESHQfLZscN8JYxbJs5BlwU6C/4Dg
 4jDJxf1WooIxtpbsj5pCIX2IJsv+E9bUQ4NMmQ/nro3TR/11PlpAq2+WAlxs6DCIuRWFMtzSFUd
 jCO7IEdIIAo9BhEezEEPa/TIaXBoXEutBQcZAKmSwGdH/cYn8wVjD9ftsJ6mK8PXmNxGEAhKf2L
 ym/pjkgLeyndrz/2YegLfErZlyo5LOHY2K0n+kSTXF77fwA+4R/Ihh8d/E53l/Eru2BfAGfBXaJ
 LJHlr18Ab1BdbN9zuk1D9Fxb/0C1eWQ4CPxovC7SNsjebXhe7rqskOAdVnnUWHCBNvIC1lvwsAb
 sA6Osz9KASEo2enHoi7kEwJ715bQZ3KtH1DsJyHP4ZErhr2kJN3lCE0yCjGUZCL+1IAOuX1UFxF
 PZ93zSGhhEiVFRw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX7xfwYjt0CVRq
 dksFCdrbEf1SKoOsE2ebk3vG7mIa2X5Swkq2Fx7gtE6ig2tY70f3fWbOHhRZVB9p8J+YirvdpLM
 cRGVhqlj34cQxL7ch3FT4iclKslcXVRXr4h8KpBHtNWrjI3cKSbPEOqADtNDz9SYC7PlFviQEoX
 dVkzaDWTRDTa5vgBqliHBrrf0QMx1jnslyyTkp9Vlu3LHKShUMx7RIq5AjxEbPe0JVzrdOgQTqL
 wN/VoTanMHk5qLzP4WtC+/hPOkdzqEZAfXi4RLWN9/XX2thvIeVU3uu/8DUuyKtUAq5LqgQZI2P
 mbep2beFuWlA1eA3Zi6fnPcEWQYKDHfEeGVApzFuQSmyDgjXJkPZ6NkfVhrBWkFkibvVLmC+pAc
 tnLZJM7c5pwcV8Vz/zNJzgePvPQPpYO0VyKYvitSpReTkdVRIWfhcETNmKxzV9BeDE4Jv1K1iwo
 oyo3aIEXzqg0XIQyriA==
X-Proofpoint-GUID: kXWama4Ii8_-nbRIQgSHwnRZ9WpzK6l3
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae88717 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX2x5H+hmFNVTo
 wghGA2GOvHFo5HWlI1RQm9BTIMq6eMOxO3+ZeYsCFwruFZxYhWLLA32TTNWYb/q3wdZ9gl7A1XC
 vyAjwhJrmFg/uPuOJ2y4RCT1B82Y3X0=
X-Proofpoint-ORIG-GUID: kXWama4Ii8_-nbRIQgSHwnRZ9WpzK6l3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

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

