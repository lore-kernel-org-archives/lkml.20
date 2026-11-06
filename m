Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963618;
	b=oQIGicfC8TTwyebXkFTv9X+NX3XraCuo8o2WM/R7IYxE2KTljDSqqi07Szo6zE4bDFFN
	 vMdsO16qJZ/wOnHcQujqdih9KKS471j9s7NhgbyzobxrRqt56WyhVRnravMwdcvSW81h1
	 qWOVQnClZ2XpOny21CdgaIRLb+xefNt+ROKjXjEomxftDdcvCTPItNL/aiJG0BI4w6iIt
	 RynLtnEX2HguDKQaVvBWzUlRbGY+k4U+D/SjmgHsR70kJOSbWhJpVgHufMNe2IgTBGIU8
	 og/FYCDvO+CZelua9X885otk76L0QLYxmwBoPpu7cb9/7q8C6N75TJ3ljEEI3S+D9zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XW52UdCrmkSU2CFHGJcm0I6RcRFb9njYbyKT3jvjP+k=;
	b=pusji9DklLuFgVqgegi/ReSLa0Ccb+9Hb9kkKVJMnHAe/P8DH30+sJagvF2MMWXtmmZV
	 5kHB7+xMC2q0B14T7mcQsFHGfSXkQ2kP+6PgA04CHxQg5qS5Vvg1GuSdJcOaEU0jbhUHu
	 phPDn8Z5nsM1gZVHPDlWt3SPOGuSgOjZjLiu9hRlrVABGF0TRC0AYtpU+orJ2mTO4NT0N
	 6mNX/7WWCywcaef7UM+z6GZ66+rdm4IKEeRkbijKporPpzAPnyl5bjfK+A9Y6uRohRMcP
	 8A0+XtJZy+q4HmXTqWQe9kk5D8vPCadC4j67LmeNU3Lh0q9WVZGtScep6ZTmFmpG6vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jPeFjlND;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FUTDjyft;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C7606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40C7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jPeFjlND;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FUTDjyft
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP8ue3129211
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 11:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XW52UdCrmkSU2CFHGJcm0I
	6RcRFb9njYbyKT3jvjP+k=; b=jPeFjlNDRAk41JmbgZciWPHgR3+DwR8XKFx/kt
	NHUj7NwJ6Q3h87H1/Yf8Q0W5YuO0rBlD57t6SjlBydmh17WkCVg6o+h+4XBJ5ozt
	ye4fcl8OEO/kg2GaQvTOjkwVGRfyeJufoljilK7bJDNUrXKirmrA+QfAEu7OfpyB
	3Hn2DwpE0DF66iDHgKc4t/N2FupwYNJnxMkdT8ZErhYXT+hzG900ALKieHW2UbTe
	iOAxWp2cEjQTLiffgeJoWQevf77WgJoAurK8H5f9bMy/RHySNybuP1GxOLIqxi/a
	RsU64j9YdzXqNvpo4O8wRUAE4hwntSiHCywNylgin0gUTDAg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9jfnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:13:36 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso290326241.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963616; x=1794568416; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XW52UdCrmkSU2CFHGJcm0I6RcRFb9njYbyKT3jvjP+k=;
        b=FUTDjyft0iLd4uwL2P5wvXBbUSnZttUA+bPvryV6OcPlfR/igitrZVyOPWKZ7iKFIu
         DddNP38qDzbdCwSQJoPc0pa3UiJ0SzfU4cUTFddzXJ0z9KC6P9NMe9mXpradApdT/RXF
         uRop1mTXysySszHJ4sbT+z0ooLc4pupQDpVURzlS0ccCkYEWQnMtVsGDi6xBZ/mf2epI
         h5TFMpjgCgjxyEn5RkWtSv/Aw9ZhBh8NEFhqyjJREAZDRckzraum/vG6drD3j+poPzFm
         vXdW6sLqgCQTAJLpvBpE12PaOj63CFC7/dBgKkQlZs0/ga2q5uUZ1VZ7RXws0gxLDeZT
         Yg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963616; x=1794568416;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XW52UdCrmkSU2CFHGJcm0I6RcRFb9njYbyKT3jvjP+k=;
        b=AgwMFwaKMgcXUoRPVufnS8samWDx6wCii73Zzf9VdECDttYL2JFZ5FPkAn8hxcWrBW
         sJo0Oq9ACUpZtCkaii+ZKtZWSCnfzyZebD2wAipQ2VHUTtMxgBkIHRW5zYPQXsN4QE6q
         LkRp79Wx6fQATgVxbuU9Mhi0RPDc287whORqPaWbKvKWZe4l7Y3fYvJMFCEAZpU0E5DQ
         vGFxdDbIZY2+qRHFZ9U9OclTQDarvcwigs6Jukzdo2qmfDcdMhCXmwnvni53x5ysdF7E
         5ltqN9pMz7BVKpte1p+VGO/OCw9QFjVWLUJReJ0PH2fW2CJbcZ6Vb/jV+Vo3YcxXMjOw
         4GFw==
X-Forwarded-Encrypted: i=1; AKwUvBwUjxLXg/iqKjHjOMb6NVyMgh31mv4kX9h+F9W1oiTGL1Nj3+uoJzFOmQHr0NxaiPJMvmt0eaiVJOq28Ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ITEbm+KCuzUYZlMHmq1SCTZE6oInhqF/7BMIbUnkJWd8195wm
	kRExhcga335IDNe1uhlSmiEd1DIEy9eNm3/rO0EUm6eW9gPyUBnGnCpGw+0nm8pLmdKt5yjwt8y
	/YnrCTpfklB4KslRRTPg1UT6yRizZKwS2NRsUh7s16+IxVwVJmxjP7GnGtDXPBXG/B8A=
X-Gm-Gg: AYBFou397MYo5FOpLhrtitdR0PgHI/BVy3p1S8Ra0pPlGnJjTV58qxBcvGgFsFgj+0z
	vtkvWHsgwSvz/GbTN/cnekoa60lWcVqZOIJL8XqRIsVR/x8L0QhfpRGOXdmumQlqwKOTNFMtDts
	81CF+VFiViUICNzcrfoewITfXxhyn6eSof13kYIz8xKBtJvqzZ53GE1cYOkDhNaHk5lNXklNYDX
	o0fKEc/MZ+aRZSmlYTAYJeRb9xWI6ufHu7g1oRSssQFoPuu3hFUPI79DDGRJxEwwJycBtKhMWaU
	VXH2a9yQvHmZ24o6Uy33W7YLpg1QypnFr1muvtQqV/ntCOYBPMLrMjvStKrCdCPIfGaF8SOzy6a
	kGdw3KGW0n1DrzKc30oS3W09lBkRwxMIEuiv2+ja9ow96IpNj4UGMcaBFfk8LuyXoy2xfBQGNKg
	BRVQ==
X-Received: by 2002:a05:6102:4485:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d2a15427d5mr1236232137.8.1793963615600;
        Fri, 06 Nov 2026 03:13:35 -0800 (PST)
X-Received: by 2002:a05:6102:4485:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d2a15427d5mr1236227137.8.1793963615130;
        Fri, 06 Nov 2026 03:13:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm3183154f8f.20.2026.11.06.03.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:13:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:13:28 +0100
Subject: [PATCH] software node: make swnodes hold their own references on
 parents
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
Message-Id: <20261106-swnode-kobject-parent-ref-v1-1-77dbd7213dd0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFe27WoC/x2MwQqDMBAFf0X27IJRatFfEQ9Z89puC4kkQQXx3
 w09zsDMSQlRkWisTorYNGnwBUxd0fKx/g1WV5japu2NaXpOuw8O/AvyxZJ5tRE+c8SLO3GDDPJ
 8WAiVfi1Sj/97mq/rBnbpwBhrAAAA
X-Change-ID: 20261106-swnode-kobject-parent-ref-3bd9b9b75aeb
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2682;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DgGmt26jdiGxwAImE7adK1jqciOsosJz/aF/TrpLB/M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7bZddfcbboI5xx8Dq0fYn9wm1w6F0bhJ4f2/m
 JrO6JnrpDiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCau22XQAKCRAFnS7L/zaE
 w7ExD/450rySapmcw3fHkBw0K+oJ+u4K6ueGWCBEvXXacPV8DfV/CRsPh0/Pa2+h0EOzqj24Yst
 gohwb1WCCO8jICdehQPDrWPFTAoQvjHLiJSHucLL0+uBv11+LJWrsYETVaWSubOFB3IdVvvjibo
 gHPuIB4NcBhFvNVNjzMa1XsOHGkRc7+KGnaBaAYEupV5xkxwQzfHnTjMdCwRgkmNb5X70SNRHCe
 Mpgq4vZHcGWy7BgTySRfnzCxhQ5HON1EKvdt29CIFaL11Epn3p2TjRyOxn2+mfdJCFftOudH4gq
 8fZ9Ig7/MTfqsoHjgnhAvigafOahtC2ifpEEp1wqU4xrAIO0JN5jTsSlm9cFHJzNL35kp2tc9Gi
 zCc8USU/ClhIKjScsBGqNBEqicEsME3M11o9si9EkpV/vk8VQL6Hjt34kwzgewZhipMkXPAe/bu
 Kgw1D7/ZttH9u7pGaX9E4lxmaymhCX8SkRCtGU2cGZzwTXLlAe1qBGhnXMstDMBaexDQ8489cvJ
 8dJ+3IimaWBLGSAuU21qgeW1CcL+H//JJlWfz+YC0dzgoKrKv8PT0iKmLiEeceBKpE6Od2+dwJX
 NbmzFRLozA1pWS7z2m4svnafXoGFF3KZSc/s7SRgxp7eWDf79DVfF1ywckfILDVzpiIgMCjMB3Z
 vo2GWcI/DKTHegA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 05Hn-aMiHmEBpwm6NVFpVaAqwMFgTY_R
X-Proofpoint-GUID: 05Hn-aMiHmEBpwm6NVFpVaAqwMFgTY_R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfXyxKYILRl0sHo
 kEt2d9+Si7W8f0/EJqXv5aIqufaYUrwLDM9YZzLP5dXGtEFhoidotgRmIWKOvdZOt9zlsa4zL/Z
 Lr2QLsJ1LpWolIx5AH/Nsn4CZYoK96s=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedb660 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gm3xcvSgROcOYQEXUbwA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfXxAJWcMiQCMJQ
 OL0LFOeVgiQyu5Ib49Z/Qkdvgd8fWRtKQxr6sOjcsolJ4fr7ELkYmKCjPZdppaRvaIVESokW/yF
 dqQWYBEoXVtagAHHg159o7zc7A0Pt3z+Jpu4QDCzrrysKjUW8Lf2Lrrgjvc+Y+iWQjfwQgL2xmc
 qJj6VMf5jN8hhSmVz6NU+U9+AeNeN1hO0nVjtRfqk2/jOs72AHIJwJqGDfvvHazK/V7T/XwaB0+
 kcahfYhTfyICzomppY2dWGT3GGG1f4WtTveHRE1JmukYrpjosXrRW0V3OYnhvU3nLilK4nNHxeb
 lHi3q9IQRrTdfgVzuIQMf8rGfzYumJc0qqRWzm7yKDS3wSD1dnCOtQ/YomsT4CTLS/xJ4x+k93M
 30n9Kr4qJWCEPCEIxN1tSHTjYmabJMjt0OFCSNSGZYG27i9BwxYru1a/DIdsu8q5h5BXUJKSur5
 j0YUV/JiZcKgvMeIdtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

In swnode_register(), swnode->parent is assigned before calling
kobject_init_and_add(), which normally acquires a reference on
parent->kobj via kobject_add_internal() that is held until after
software_node_release() completes. However, if kobject_init_and_add()
fails before acquiring the parent reference or drops it on error in
kobject_add_internal(), swnode->kobj holds no reference on parent->kobj
while swnode->parent remains set.

With CONFIG_DEBUG_KOBJECT_RELEASE enabled, the random delay in
kobject_delayed_cleanup() may create a situation where - when
unregistering the child node and then the parent - the parent object
gets released before the child who's left with a dangling pointer.

Acquire a refernce to the parent swnode when registering the child and
drop it on child's release.

Cc: stable@vger.kernel.org
Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
Closes: https://sashiko.dev/#/bug/linux-82933c14-d212-49f1-bd2f-d4ab1e16fed7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4bbcca62bbe67c3390693500b01ea..986dcb933d2c9274e9000968f115d7fccc2d103f 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -843,11 +843,12 @@ static void software_node_free(const struct software_node *node)
 static void software_node_release(struct kobject *kobj)
 {
 	struct swnode *swnode = kobj_to_swnode(kobj);
+	struct swnode *parent = swnode->parent;
 
 	fwnode_links_purge(&swnode->fwnode);
 
-	if (swnode->parent) {
-		ida_free(&swnode->parent->child_ids, swnode->id);
+	if (parent) {
+		ida_free(&parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
 	} else {
 		ida_free(&swnode_root_ids, swnode->id);
@@ -858,6 +859,9 @@ static void software_node_release(struct kobject *kobj)
 
 	ida_destroy(&swnode->child_ids);
 	kfree(swnode);
+
+	if (parent)
+		swnode_put(parent);
 }
 
 static const struct kobj_type software_node_type = {
@@ -885,7 +889,7 @@ swnode_register(const struct software_node *node, struct swnode *parent,
 
 	swnode->id = ret;
 	swnode->node = node;
-	swnode->parent = parent;
+	swnode->parent = parent ? swnode_get(parent) : NULL;
 	swnode->kobj.kset = swnode_kset;
 	fwnode_init(&swnode->fwnode, &software_node_ops);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-swnode-kobject-parent-ref-3bd9b9b75aeb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

