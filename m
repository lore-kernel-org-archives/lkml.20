Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801065;
	b=nu5aglpz2JbxBjidzo+dJPb4Z5Dd6QcczVWR3gVFl9ifumPKgs7H33GZqQXOz7CwCFZq
	 +icCAYIa/3bEz3ASeQpxv7OGKLqtYPHsYJ9QGG8twaIC++SL+BDO8Ui6GM177j3n/PMgw
	 6rGc3AREuSntzzLLmYbUIXUnCjWt4XPwdNrLa/IREQ43TrmJnO1fgIMSMEkvWugDmqwPT
	 xMqj7xc3AoI6R6BLta7ZGC52Ni1r8amrRElNozUpooh0esH7XrFSL6TrveEKlvgwPk4nc
	 uvC78O/na/SaQuaTQJbcbXS5fU4tAj9nKZnDBzrQHGu+gc9ElNzeD9rn6GSCSg2MwMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=aqn7mXZMQPMMhWR3Uhab6mKTbHbIux7b65D5WWOoFV515cggm3tqxkJWSY1+KFw2qVwy
	 epZsxGlMqzERFh6icwl9ifOpwb1EB94vGHD5Up5Ue7mjTOuBv4fwBA39Q49JM12r5EzuZ
	 sauE2LH5aui5cSXLQHlAneeby4oaWu3fIhSTRcW7aDJRvrGyjpMHeCtrAIyRUIIsqHWi5
	 fAcNW7nJjhB11/+MoBnJUhhzGb87PfcNaLy88h5Bk4Y/lRvr8LCD8JiiL6yBv2Qkc4isx
	 Yrkv04R9/V1LupAaq4rGJTVyEm7UQEM6Ak8eMCHzKIqQICRT+ihiVFdgz/TnvBXbftg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lw7Ijwjw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213B606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F213B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lw7Ijwjw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4C1RBN1764274
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=ZyMWzQsB8somTKQ4
	gMi3RoSQ0KBzQTZE959mdwa0DCr+eXsvWQEDJdWxLa7xLthPcip4E9US2RhNMUWO
	vPOamxpI7QvNV51/ZY8ZpCnK/10yZlknDsWdxAzy1J6UcIcgAivPuTHQK+lgPg5Q
	PhPIaSavgqP12V00C08tkIK3kBM7Td7NRc+pKl5bjpgs53iwESuA8GApOxK3Fo5f
	TH1Zqaglwa9JC2cChxqY4URyvZkKBs+gjb2u2M/2c/bNR5Gu5giyKwkGrAM3gRjt
	ZTWTtuVKqwXtUxboWAGuTMnYMAjgK7eApbNceCSHyq02GsYomazYmOBkFyUucd/H
	+4Az6Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn0f3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:04:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec2ea00c42so565498e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801063; x=1794405863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=Lw7IjwjwbyDdLL1zDhlipkDiIL4B1UIHTWQypEGAmDbK9yCIoLEjpiaOqAbE3+P45N
         GS9rbn0Z/RM0g0xwqWXSLXpSgEOeXE4yIRmHlsw+WHoVvebQaH/bvCNE2nUKizWRDuH/
         +A4SG/xIoHOjgOiuGFUqKcAPUTh8+iIXleMxBb+eKxO22KDrONLgWnh6/4FoSxuyFDEi
         oiaCiuZqb7dvoAEo/ydU7oH58XoMhAys/CtjdSrjKBfY7Q9XaslinORWC9XINlxKpfJm
         TDzm4LYbkeP7qzkZNJjkGrPiJqgZTSnV23XAvI0wc1GuPWui+MAxhHBco+0szR1hk6DA
         I6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801063; x=1794405863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=lpzOG94Yp1XSrSuleTcOyiVyHRLh6Mb1y12CTYMji4gq1wOsh67NzTzPx8XGohSmCL
         1km0kFd9XmHWEUA11USpKHgM1iPiK3LmgFzpCMmCGG5eSPZt44RB8JXeYr1Tx7pyfCeT
         YOsFNGMshTIqwkeMJF7fc02CFP7quNs1kqiEAxgZLXgRK9VxEbAnP6FrZf0d4/Xun8pF
         kjuU22Timk+OSClI23Yv0vCi3x0Ro+SKocFsG++DBAri9opdmugamcDfw+TbBjVblk5C
         iZ6vfZVXnMfOH/WEOZB7T2OaErCwjKoPNhrD/nqVYxJ7TgqsQSjxFjKA+N+JRdJAiwOG
         LXqw==
X-Forwarded-Encrypted: i=1; AKwUvBzwcaXXvFJ8CPi7GuPN+AqcxCfO7K7YPPxyDTElyS33AlP1IYRcVPyXsTH/JXPpq85h0xROj05VO5NYyPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dXRDtJVzJ8k+Nx+RwbxfGWAhbLjDakCIhNZBb4K4FO/Xxvhsi
	dnloMpnJPXfmP8MIuLfm4ziDcw1Jf6u59ImpE0uOJU+Nk9kBscIeb3/pphMgdOjaQTPj0cjx+qX
	JERe4clzvLbRuxdDYi2pGYxnuC+obQ4Ckz7ng5u7pA60DV2VPGPQz1RPC4gMgEGpjx1U=
X-Gm-Gg: AYBFou0FXFb42+ZzL0nxmrwgO28bcvOVSS7FbW1oXF+S/McNIli35K6i9oNCPjaVHhu
	IWUNvRwqJAQuo1AAVw5ysx8uBRUe23O3lNEXo7yXUPRWwwvpElN0b2RwiVLK1p2qaxlsQz/4sCE
	yPJgIkQGOVkQuDDLoSlUnRsxF+Qxs5oss8J06L6I16kF1KDybc7XRmugKFu0doIuzs+Syvunyyw
	TGa7995HPr8nG3HGdXVJ1yh/qtu69+1+LThPdmIK5M7zlHNRnHwuhx8ysYuN5EIpB/Ygo/hIiqE
	n8enT5qkxNTmy2zObZukBMZ9DMP5SVKft038wRPosXWOcxHsW8Ve5wadto3/ZZp/1vVhEkfEsOz
	jag7FOmCgZ5zwqlz9zwxjz8loHh1iKn432L2ldhaYD/YM5p2qULESzr/btmn9KqYkFDNdb2CCMz
	vswg==
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306384e0c.15.1793801063004;
        Wed, 04 Nov 2026 06:04:23 -0800 (PST)
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306326e0c.15.1793801062468;
        Wed, 04 Nov 2026 06:04:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:45 +0100
Subject: [PATCH 3/9] fwnode: define the property_get_names() operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-3-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSRKXWWkliovY8qVo68abtoXtQZqXdDFLls
 EQ9sf+1SpqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w1S6D/0b5eyCDtTat976om/WwrrkmeCrdTpgbsGvagClks0LTeShFP9+nuPD7PIJzrL4/pyP4M6
 osTD1xtFE9oFRr/JKicYaJUhGNjvhq86+P4Nk0irweouqKLqlsQoiqolxRUCRRKWKX/JOFw5UPN
 HwY2EWjrvKNLBv9U6+Nifpym/U8hKQweflNnRfIXMu5yaCEGnzB13cNCoSr5HL1f//BkvCEHlv2
 OPsSAXEeenUZz0HAqp1+xs49AiwTwDocOsc2pYSH5fYgrlshGj4oIr539GC3P6v8XvTk5ciwE21
 8rqNr1cD+xfY0XRI7qsGlSTq5nHwIkmkZMmzCZvCFemTxiQ7z+VZ7fi+sKJOjXXDcDae7+6ti9f
 BKhxyuCoZ9ZUZEjD+bi6CaZy0KjDzBI7MkJ6QkbfHnxjI6f7HBgQw8Az4RIb47ydJsP4RSSktaT
 ycW44vOZJCTTGF0I8DXuOsC8RkSLV5XQYK9ZwB3eg2w1ZK2577lrjRb28GuXgAwUP0K9smBW2/S
 05FciAVt+9P1WzFmvql+IeSba0EOXnj6DpiZDE0L7EjBVvDlAxtiJTyKlAfGM9HaGAZtOew/agm
 7GEz4McYIbAFzg58gtwRtxBmmwapSdtihU3Aq16E+xr+ZxaM48Qkdrw6gtBtwvCisnZthkFavFb
 VxhzvSv/E7NtLnQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXxevL/iIbWDvz
 9Y5kuvrefDBS/cp+mm0ANqswSlnBrTrXie+ZmT4YPDM8qeGjsgKHk8jiozkC3MpA+A8xkSvKk5Z
 8P8rkI5eFLueJ86ehoFGP1GHSHYZC8sfzrIj8w5T/yn6JEE+e4OqODVC3UWxbF0EcfAOQlYEuj1
 96LOiJfHmDJfzBCbq5vr2e1SoYijDLGZKTAuxIHEcjHm9pexX+qT2bbcB3oM/J9hh8QgEsh8H5Q
 mYwOYKqAaOYIwCfERceGI5FTpjnjNEj3DlLA30w2nquoWC6Ej6C5LMT2pZA4a4y8yJX386QP9IO
 YTnjLdzLDkvRSG9dVLr96jKuIqD5OrKrWTNfv04swNatr9NbClw8cWq4ggToZr6xoavTob5kSQ5
 TyXP4EmwXEmnwVw2SDRR3UwkO9JrMWveubHjyyghrPc9deqLgLnnjS4Q45bLr45RYBqsFbgze2B
 KikZyhcLV10UaYzK2yw==
X-Proofpoint-GUID: YO-WRcpOOIQHhsDASPXpNwKg7Ek8PfO2
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb3b67 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX03N9SfLNP+a6
 uks09MijcssXsc64j/EEIl1MXiik+SdbyDGmI90f+0ltU7I1ckMVLYlOUbdk3/zSW4ZY+IPHc1Y
 yaj8C+P/riM1/CbGaIEkmSZpn3Ve4xE=
X-Proofpoint-ORIG-GUID: YO-WRcpOOIQHhsDASPXpNwKg7Ek8PfO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Define a new fwnode operation allowing to retrieve the list of all
properties of given firmware node in a dynamically allocated array of
strings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a9dcaf7e70765637a0c33af2ae0ac541e15752ad..2d7e0b9245d445d473c7317bd27058abe5750b40 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -125,6 +125,13 @@ struct fwnode_reference_args {
  *			     success, a negative error code otherwise.
  * @property_read_string_array: Read an array of string properties. Return zero
  *				on success, a negative error code otherwise.
+ * @property_get_names: Retrieve the list of all properties of this firmware
+ *			node. On success: returns the number of properties and
+ *			sets *props to an array of NULL-terminated strings that
+ *			must be freed by the user with kfree_strarray(). If
+ *			there are no properties, 0 is returned and the props
+ *			pointer is not changed. Returns negative error number on
+ *			failure.
  * @get_name: Return the name of an fwnode.
  * @get_name_prefix: Get a prefix for a node (for printing purposes).
  * @get_parent: Return the parent of an fwnode.
@@ -162,6 +169,8 @@ struct fwnode_operations {
 	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
 				      const char *propname, const char **val,
 				      size_t nval);
+	int (*property_get_names)(const struct fwnode_handle *fwnode,
+				  char ***props);
 	const char *(*get_name)(const struct fwnode_handle *fwnode);
 	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
 	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);

-- 
2.47.3

