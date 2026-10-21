Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585909;
	b=MvOufI2kR3tNdnTbhR+NlaXXVHN2DuObU1n54rVE9e58/hJhxt+5VUZeXMXyc+uU+wwl
	 I7HKlARIdXrmtAB7y7NUPVxlzcfA40sjTbOa4QliG2fvgAizFdHJl2os8nhY7nHavnRtf
	 MSBlIMk4PEev2SaJp3XdYhZMF++7o+iauccth76JEanMsjFCX8xkhkeyt7izIevDZ4UQQ
	 bbnVJ9DDy+9klyW+CmAfj09eE0YUG5B9cDgQVCMD4L/2HQzbQQM73NqftCQf0UuFuuD4o
	 0BJhFhShb62U14stKqrIW8KmwrQUZfw6mUoemPw1nUuyrvEsozVOEo4utFYFMsOgdDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WbqwEg4uriAOxuSoWSa1/zg/VGqHBjEoAgcLsd/IJdU=;
	b=kNKcfxJMstF+oWhVxrx8OmPltADb+agEXzEVq6CpENedng3ii0Vdwry/rZJEEWcnVgUC
	 4iTzqH4DWZ/C3byXmyiIzwM43XrouqKPag0xfxC3Bbnhq83faUk2Ibq9PKF13W9M0UJFR
	 nwQA6HkAf2KSx+jmLctnyhAFRZ7/Dr8XjlfnrgIVxBSj4HW1+ZhSIv0uaK0fUbbirEN2A
	 fotFNgo/YbRsOMpp+UHmB+CWHQALxwSicyt9imZxUmbhRJQwWnTJ2h0AU+Tf26mDMT3Qd
	 8IlvZj8yNGpfm0Aou687jbZzYviYnTsJAq+hf1q539gLFP/rDnd33u8y4n2XjOnTJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrS1vvNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRsQKY5M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B4F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrS1vvNq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRsQKY5M
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfwxH1599786
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WbqwEg4uriAOxuSoWSa1/z
	g/VGqHBjEoAgcLsd/IJdU=; b=UrS1vvNqZ6vkYKEcWRZ0iouif7we7w2poH3n+j
	8T5pZ/Aag0R+/gIQM/RZTPrrxdl0tB/bVRvUXfpKIJWO/NWeoFxmacrD0rXJpb1w
	rXorEXGDrc+TFrDcJ+O0aNgPG8//gBgFk0OBqPxqgQ9eFMZ+6jTJ66mVV59nY1ql
	H4D8qlKsTJpsFnur+oWfTf4zuRx50/4tmHNXX9xvKYmsN/cncUzO00zi6z3OyAsE
	7vCBDjXIJP905yWOicSa0xsbmI3/vfBA4IW6ye6R5Aw9DUIlXMppk0Ow2Ir6bWtE
	4NdRRoypXyfpZ/V/3V2A1axprl5ab7KZZReMEtfgvL66/U7w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugduj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:31:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc3a482af7so545886137.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585908; x=1793190708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WbqwEg4uriAOxuSoWSa1/zg/VGqHBjEoAgcLsd/IJdU=;
        b=aRsQKY5M14b6AkD64cR9yIXkTDnS2H9rXbOJmqjKMZloUsJUyw9gwof72ylk5RAaHG
         VbaK4ppaqigKqvjjM/7eQwJO5rbkz4wCO7db0Yc5n2v3CuGRNvc7119+Kr49ZHDKSorn
         u3bs3dhaObTRp/aAFUn+zIwueE8N3eSzjjkwH12pnzXRPHXcAJ3aU8DF1UhXQTntbbXq
         +4nPbecyl2SRqXQQYnIAc0Rt0ehiubiSctgKZFVEiR92ZiEVu0OYdod0w8lfIhZzX3xc
         6ArNrMotraDM9ViDTbYt/apkH8idqzgNdk/tXS/1OMymGs464Wue9JdKOdVnr6RsxKl5
         /rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585908; x=1793190708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WbqwEg4uriAOxuSoWSa1/zg/VGqHBjEoAgcLsd/IJdU=;
        b=wNrdRX6JDL+IHkwJPxwxsG6L0M9AGkkSToan/dYpMVc5SYLlOx+5g7Jo1ZuD9s627F
         f9K1bHWg5Lv2SfVs/AKpAyh1kOlPkUYFwKf7hMN8pSrUyXem21AeOqtQaxNMTd+hBCmZ
         X8UhraAJzzvCU3nAe9Vj0Z5HBLsI5n0iNIhWdgYddtcpH60jfAWsqOFqBVGwlR7Pv5Mr
         /rkajXFik/5to8uOUpWNKqUDF4U3M4RiWiJnAscKDiw1cpcq6qxZhx+CNbCHfkYF9j7D
         rDEUaPnAwhD2be2zHPZ9cM51R7d1mzAdNeSZINMIYmcniCfajrlXqgAhkVHwF8iBDoNC
         qnkg==
X-Forwarded-Encrypted: i=1; AKwUvByquwcTuS1eJ16rzoLaizEJbPNA7yiy8qVZqSiQZBQ+5N5JYgpyfDSkrj2K0YP29g4SIAMqjnuUFcmTjf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFwkwcYwTuzQX59XHAm8YO1s6VO3H95tf9/77HFFuf9Pt9xymo
	XOxCRUu73cJVUybjD3ohVm/9KC4eT4ahPf4SuHJ1/s/xQmrHGno+XcUib6PJGBE14lZcy4oFv0r
	jaBHjNvKMPm7PgeBnoa3aOaIKtKC/CnycpnkqM+wCXVT9NU0OWuq2ctzmLGZ9mQqCK1C9VevkDD
	o=
X-Gm-Gg: AYBFou1INgsrBFmN2KfEcnzV98Q9CwNcjWnrQgzpqJfJvg/PqUB8tj/M+71d1iUMVxO
	zUDIkCaNUKUh5F+qHZVLV7NzvpLDsolHpGCUmFvhDVm3FafXHmHI81bUfvS/4jmA59658cO5fPo
	ync1WHInBYy9KCs6w5zmeygabGuB+BtEbFg+IGBS6fTjAEMIcRa1X30JGlpcufSeXTBWJFPgt9C
	PAyqsd8ZVZZhoYRAG6B0ayj0cfgbfXqTo4ImLtop8PAobqXb5U+9YhCYfNpL9m+29hzE5z33Mpv
	gsv8rnt4W0TT1JG9seJyD7B0mxbRlek97X0Vj43z5UWstQC64sxONUWyu7yQa0a/tDWI4bTZze5
	DmDddaqxX7aog/IH1WY6eX/KupYLB
X-Received: by 2002:a05:6102:a4a:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7cc9224b4cbmr775130137.0.1792585907779;
        Wed, 21 Oct 2026 05:31:47 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7cc9224b4cbmr775092137.0.1792585906450;
        Wed, 21 Oct 2026 05:31:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828caesm4933767f8f.29.2026.10.21.05.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:31:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:31:41 +0200
Subject: [PATCH] gpio: aggregator: constify struct configfs_attribute
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
Message-Id: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKyw2GoC/x2NMQrDMAwAvxI0V2C70NB+pXQQqaRosYNkSiHk7
 3G7HNxyt0OwGwc8ph2cPxbW6pB8mWBZqSqjvYdDSeWWU8momzUkVcel1eg/iqkEUu8eON+zUCI
 hpiuMyOYs9v0Pnq/jOAFLiRYWcAAAAA==
X-Change-ID: 20261021-gpio-aggr-const-configfs-attrs-791fa0afaea3
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGNQ+1+orONooRcQilPyAAvS5ifjySAfgqXH+Vyi5BM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2LCw+L1fo2lPEMA4YWW04Oj8DHtGseGN8AH6P
 bK2t0EtncSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatiwsAAKCRAFnS7L/zaE
 w/uCEAC8boE0PP9MJKGq5k7d8QP+PpdLUvKbY65CdSeAyWz4U61sXYvC9X5onR6T32fGjc07KPF
 I4QuQESgJiQPYdXXg6p0ZOvznV4CrgCDo9v4YD9LRjAtZcXJO3GE3p/H04rQErAqzu1T/vY73gf
 pMqZerMm6fmewMmI8+8sIs4zxvv4HtnFGb6cP3qKj2lWFLD4jca87L6ee8xsR/P3ReVuc8HG3rz
 KHQYa8q6jFaHyWNtBSb4FFgX46xWVbx0iicKKhfejkR0YmGKE1Pb/8zaZdABjeOtwxw3m5NR35U
 RYeVr4nVtT/DuSEZ2VgcaT/gnh9VRhLVHJmdCp7HVve6avHXiViAXg1yBhdnf+jnfNnmyRyU/b0
 ghcAIGLTw321qLXP0wNjtDuxKpZsxN35ezi7TwJPFpf4Wvd7PLZTM5oLmqS2SAwuYNPujjbOA3Z
 ceksu14Ec414WGc4w1wxqw7oYHcPXhGYRhqWVZQCpZ8CGWx+YOBHnSbm+SVu9zuauqLtkSlw3um
 fvIv1IHJaNjNRmAqdhD7HUYNX2x3LriHXgtue85P8GIh0IkG7pg9cqfVVenWJxL2O+aXndHGRxk
 CNCHhETgjU1pP+ASr1PRcjx6/IKBibhhf3YagLinwk+HSE/WRussc1m67GjOVkp6Ym83TvbDlFE
 mNFyUEWAeazYiaQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8b0b4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=54L1yxgrCAR3b_WlaP0A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX9F08B44crjYA
 5WvvpVVmSWTra0TXj4Gs1Ve8W4VcLnlWSCBWVZxYgzhiUa7OhQtyT8vaAJ4ZPWgSNYHN+moRJws
 gRDKGqICcWMkq2nqyBTULUPrAMkYgrA=
X-Proofpoint-GUID: 6P0HL-5KelT_hqay3_vFPdNXJh_GF1vj
X-Proofpoint-ORIG-GUID: 6P0HL-5KelT_hqay3_vFPdNXJh_GF1vj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX6CXG+ZlCIa5i
 Tb4071mW5yWO/AXjjTYbWTlY6mQS6y0hMoZh6uuXX57sbZtZ2hWVNW+3C+PxoCzW3dJZ9x9B5eL
 vdcsqEJcl+FzxgkQxAaBScNGGXLBxtRe+Q9oimsD6qu6fJIZHcYQ/dOLg4H3dOmy3q4ckyPoosa
 DreYD/mveaINF8cL5pzKkNCxIxpXA91rWHJW/k2MUFwChYBRNCM9LOYSR4HhOUyshanbIxNnSRD
 Dk+1eTuzvJxhaAlNnbsDeSy/viTI1wn0PO2TKeB2JIpzHpu/C9l4c+mzFLAdsu1KQJxZ4n3t3t3
 DCmEH3mIixkxUZKctJEopaidLoYDeARa05KhUXpOILb60QU++9slAmy4Wz7I887zqJFWesVAgww
 7Uqnp6HHh/qUleB6syQADA5XAHSXnQvM8uujHs+AkLNhj+6QuUe+AzmYcBOjsKpusE7/Btu/BbJ
 xwCNsB6Z4jj9k3QnFTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210049

In preparation for the constification of configfs attributes, make the
existing instances of struct configfs_attribute in gpio-aggregator const
and use the new st_attrs_const field of struct config_item_type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-aggregator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index b0b65416d74dc13266ff3cb23e1b1f8fac1b892a..be9cc7954238da92cf769bc290265e985c7488a2 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1147,7 +1147,7 @@ gpio_aggregator_line_offset_store(struct config_item *item, const char *page,
 }
 CONFIGFS_ATTR(gpio_aggregator_line_, offset);
 
-static struct configfs_attribute *gpio_aggregator_line_attrs[] = {
+static const struct configfs_attribute *const gpio_aggregator_line_attrs[] = {
 	&gpio_aggregator_line_attr_key,
 	&gpio_aggregator_line_attr_name,
 	&gpio_aggregator_line_attr_offset,
@@ -1222,7 +1222,7 @@ gpio_aggregator_device_live_store(struct config_item *item, const char *page,
 }
 CONFIGFS_ATTR(gpio_aggregator_device_, live);
 
-static struct configfs_attribute *gpio_aggregator_device_attrs[] = {
+static const struct configfs_attribute *const gpio_aggregator_device_attrs[] = {
 	&gpio_aggregator_device_attr_dev_name,
 	&gpio_aggregator_device_attr_live,
 	NULL
@@ -1248,7 +1248,7 @@ static const struct configfs_item_operations gpio_aggregator_line_item_ops = {
 
 static const struct config_item_type gpio_aggregator_line_type = {
 	.ct_item_ops	= &gpio_aggregator_line_item_ops,
-	.ct_attrs	= gpio_aggregator_line_attrs,
+	.ct_attrs_const	= gpio_aggregator_line_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1315,7 +1315,7 @@ static const struct configfs_group_operations gpio_aggregator_device_group_ops =
 static const struct config_item_type gpio_aggregator_device_type = {
 	.ct_group_ops	= &gpio_aggregator_device_group_ops,
 	.ct_item_ops	= &gpio_aggregator_device_item_ops,
-	.ct_attrs	= gpio_aggregator_device_attrs,
+	.ct_attrs_const	= gpio_aggregator_device_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpio-aggr-const-configfs-attrs-791fa0afaea3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

