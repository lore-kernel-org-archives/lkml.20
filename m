Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584838;
	b=txoYhPY1JKQgUVcu9Q6xpPx4ILZzXstlivYXqPYFGMeY0umHPqEhLk5DOURIHmHYI17R
	 s0AiHoa7ktz+2Wesq/OlupY7uR20vngI9VcsLOEpbgrLQEth3xL02d43g1vOzEMoB5sai
	 TSgxJA4E+YHKyUKiUMvDSuXlew73TiMXgQ+CO82oXu4Kiq/LMv7w2ITWqtOBJyRL4Cglf
	 iPkUsBOemOdmFeE/KfRRwP5fr6+XSVzUrp8YyMloHpod0PWCefYvCue8USCI9hi5tOhsS
	 iIyBZC44KnrReDD1ofDdD2IuuNO5dM/KzTY53tEQ964BSiFFGLqGP87acI3dfIP4CfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
	b=tnWF1lTQSUdRV1xfCCdRY7RWmpmQFlRs9BfgYz3aHd4WC5xXF6fz+acSmsGc6pad8NgP
	 ZKkl0EhHyv+hzIePUnd1u/ulI84hDBUo8cNcUjxL5KQOnq5GGZK1lYq8zgHfpKbM2N9+3
	 tu/zU569QI5H7AlofvPlzbW5CIJOeEt0i/MF0xonE2NADGkrF+s4CgNCXcRceu/358G0C
	 a0uDLs37N8SUhY7cmWHl+AxDVEnzlDhXDAsZ7E5LP8FylXsqYjBkIjW85BaqlNr6NSCC1
	 9LgjLmMZTJ3uPpONLcniFlyQD2eXzCr2vbfyfvl/X2+UCTAEndNHeY1zUVyRfR0WKhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NLY/vC6U";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8S5p3Hr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B760A260C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 880B760A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NLY/vC6U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8S5p3Hr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5kI551880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=; b=NLY/vC6UFdPSWPIL
	p4VuKR9WB8FhyK2z/Hb8YO/Q15QPvEpzmV+qoty7j3T8ffY1EsGlZGEeqhsqGet6
	8cbFxWjaoz1Xtnn72WbqqV1KRIvSY/BRiM7bL600XVSn2ofgDt7h0pS3xw9inEuG
	z3gaa5i3POevKkKfAswF8aFJAzhM+8948D8b+rzKktSQKQc+cBy2BB+BfogS9eDk
	y8vLf4RE8i2GyMfhNqt2bK/skmbosziUtrvgMrHBlHEbUNvNlkv186MhR9nCP0Uk
	kcBszuNl0agn1VDAMCrfYlzFIgqf4/MnEVDgsZew1P2tY5l1QMGboAlehFd4mKmb
	Qmw7Ug==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwbpaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso359083241.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584836; x=1795189636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=A8S5p3HrkoweZR9fSwVcy64EZPgoYraM1nXBTC3ZBFVTHqch08RgzluMNrdt0y0bih
         6ip9Uqsb5DVm8grrl1+EQpPJdfUtPM1gKOCqGTetVSFrt07jo+Wd3w/H2/HUzmbKvSsj
         61ijKYGbbTZI8A9UjAkAS172g9cP43dqN1utx5m9NFCVDv7FC2C3MXn+Tj7+fPq7UOrJ
         8nu0wOCc3u1m8Ei4kQq5hg4U5GaLTvN4+3uCKE5Yra+8FZZ2Nclfbs+EIqScOQAzVYUx
         qvD5+dzshEh64WVDQLKIes3hRiqQbz9oGIyjtlT4qYuo0q7sWOs1dn/S7mOPQfkpmBYl
         6bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584836; x=1795189636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=Tv1ouoTMs2rUN5d74QcuDQcYHYy7YkzbZGQoKH/fVNgPCg8tPzzackx1q3KnxC5Mvd
         KzvQiJiJg5QWivmue9ed3YWvNyZ0vclN/jDOzxdlmFKFeeN1/QoLCre9ZqNR4C5Od+fW
         l0q8KsG1aWG3tXAB47448kjsDvXLOCshUXI8xxe5OCodBXX0RvKf5vlkKQbSVMK+e9hf
         3XhkW2CtX3syYTxgKSxaZSt8PelZFqTaK5uxYQRNQ6uRRxMAxOtIAOoG8tw4VFu4XY4p
         jQIix48wWyRulkGxXcwGmYTai9PP3XaZjh+oIpj2jqY9y/u57TMlufiXO8Whmv0PWhLI
         4RAw==
X-Forwarded-Encrypted: i=1; AL+hErHB1fKJqj0+ar4FE+LRCv2U4a/EFqU4HL16RpmoFhXyYSJBPr90v7DbsDY/ZrCjhA5ef9FA17GZ/prsOn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KbIQ8MjM5WerSoENbGhantlW10akbuKM00HnKYiE6z1tcbxGp
	/dVWmIcoz/fYpuEhT5Q8G232yJaCXGcR510yE5a4mYlGcGdhgiRfInBm0eT3vRntoX/4R4EghR7
	1UmGp/HUZbPK+kR1BQLvLca2wbkR+JCav/HqgHNd0yPFSd82rDuz2Au1ftDJBNdF5XuU=
X-Gm-Gg: AYBFou37tfvoF6jVgipQrutO8Dn3YCtB7VhmJMYokwPFhJ9+dCIfV+LPf6ysi+CMB2A
	hTKFyt3kIk3N9Fid6iPi5h2ej4nnBzGhi/9kKLKoe+nYJzMD5y7bhBAoSy4aw2TN7IhpEyEjDgR
	GUuT69XN/uWTZMvDqvapoc8SdLBIrblp7T8x7d85AGD/4bxsaEejYeBm+d+Hjd/wIXxHRzZ9t4F
	t4aP3QCSzq/XLMXWzMPjQyFZdiHmgbXHCnxeAEGQeaqHw2bHbwu+CDPUlHD5RRM6UCNfXPfzlDX
	iTAHoV6KEoxlinpeA1hoK9+JtxEnsAAz472mL0Fa0vbZ6vYhAYkVHd9uRsYHOrNkt8D5gL0braj
	EAX35Deuc93ldifV/QfkDgoWNLLCpY9T/HhtrIl9d+RZFdB7RfS6lcO1jLBQrRg8D7pb0W60JaJ
	dKfw==
X-Received: by 2002:a05:6102:2ac4:b0:7d2:7c63:5a0a with SMTP id ada2fe7eead31-7d64d81ed4bmr742240137.23.1794584835853;
        Fri, 13 Nov 2026 07:47:15 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:7d2:7c63:5a0a with SMTP id ada2fe7eead31-7d64d81ed4bmr742210137.23.1794584835226;
        Fri, 13 Nov 2026 07:47:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:04 +0100
Subject: [PATCH v2 04/10] device property: provide
 fwnode_property_get_names()
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
Message-Id: <20261113-fwnode-for-each-prop-v2-4-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ssHUbGJUv/2LRpy7w8mqQGXezqPHplT3SIfG/I3JPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3krpOKClAbu3U964h+rH2X0ixB2Nc5tIAu
 D1HPNHlv3KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 wyJsD/sHBaqOSo0qpglm1lDpBjqLOhjTWvMwspCeQI9GNapX22PUDm8mXW5WQoKw4psBnw9cuzc
 0nrZL9Gmub/OLENXT/bfx4KthbEMQmPsPQErvYDIfX7lCSRngLwmdH4O8YG92QcXuOX+p+qiFcm
 2r3/XNj8KVbfELIqnk6CHmblpwEhCjIvFX0xiehBl13c1b4VbS3O3kw/ZBcpgLnaQvSuAaL8O78
 Hn7I6YUTFQ+EQ3Cpf5ZP36gRBEGLooRL8dPNBrNeYmrwzgUj+R1E0CZ0zh5IlkyYHyKDgHVotNU
 PKon57nrlpfLSxoZlRy/lvCbj82aP9TGq3ghWMENbN3M+lA/TrjYAVz68WUgR/j4RxHg8Nng4WY
 zNEbto7zdVoBV1z6ZwwaCAGJTQO6lKJqSBG7fcd3hZLDnYNfLI55UbYDbiJCB/2zE2wZcwTjD1v
 /OqRQVDjunBBgaWSkdwF0ZMSxaP9G8tIr/de/fWeu7CI44oXCSwQjI9LJhVkAIzMHXEOZRNtt8a
 n5PFCd2Tv8O3wIi4GVjrCjPxykirYx8nxzhElCyqUModmXjTQZoxM4ILU/FVpJxNXF8kiYBRjdI
 vzUzMRH+cPc7jUKpp3Iz0LoO6iojzwuwLlI7DIv+hI/Sb3zZP8FiOqHxwmXT6m+V8VhftgdlYdu
 rejIHYVPUOLvL9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af73104 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=kmiii08LN68srmAI8Z0A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: tqQqH9xDpmPz1OVUodeavUDZmbfEF5Jw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX9TKOPKOg7CKQ
 O1wz+RC8iZLIP9UK1M7rRh1nOTju3FPaivIBeRdrwp31akoD+WoIJXhc2GBtUxNwQJkLK2hQIDH
 KKurhq0AbqBATUQQOaJoWOc9pHx7ACfyq8c4Co3d5Bl4pcWd9v1ab5j2CyLeGjIo4T1lW87nY06
 CPPpPJRPRkYUq3Mxljf6lX9q1MBiGNsIklb5PqSyiO365iDXj2F/DnknVLzF4bDIGgNgUWWBxPO
 FUWD5fR+1TL3lTR9671Mf8u76C6TB9UgYL4D+Ej2gk23YhnSq/X09ZQ0dysRmQqjqQLNb92lH65
 2WQGdMwidthPmYgXdX9RrHgkt1FBSv81L+BfthqPnrhtoAPfHsg0vqpTZFYc+pmcvT061bnIYm1
 ey4oKa58a39MtR0TngnbxGqmv3dC2iW17pArCizbciYhbtC/WjZV+ln2KYwxSta4mFcFcjVt5uE
 FDsglZSlrjfoxa6YOgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX+EmPhFCm4CPG
 LY3PIjBCXHnUKYMmlncT4R2tvHUSDJArZVh0NgGuCljcmwfDXZKLENLjO6WV2eGsTXryVr3ZQuR
 jlduw1KsRmUAqdbS8XOyUbwvYN65kxs=
X-Proofpoint-GUID: tqQqH9xDpmPz1OVUodeavUDZmbfEF5Jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Provide fwnode_property_get_names() - a new fwnode function that allows
callers to retrieve the list of all properties of given firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 80 +++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/property.h |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7728116e296872b7ea4d4475aee72d95edf63eb6..d3c54c3d11c42ba4aef68687fc27291c7f33beb6 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -11,11 +11,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/property.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 
 struct fwnode_handle *__dev_fwnode(struct device *dev)
@@ -542,6 +544,82 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_string);
 
+/**
+ * fwnode_property_get_names - get the list of all properties of this fwnode
+ * @fwnode: Firmware node to get the list of properties for
+ * @props: Pointer to an array of strings. It will contain the address of the
+ *	   string list containing the property names. Must not be NULL.
+ *
+ * The list also includes the properties of the secondary firmware node, if
+ * any. Properties present in both nodes are listed once with the ones from the
+ * primary node taking precedence.
+ *
+ * Return: Number of property names written into *props. If > 0, the caller must
+ *	   free the array with kfree_strarray(). If the node contains no
+ *	   properties or an error occurred, *props is left untouched.
+ *	   %-EINVAL if arguments are not valid
+ *	   %-ENXIO if no suitable firmware interface is present
+ *	   %-ENOMEM if memory allocation failed
+ */
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props)
+{
+	int ret1, ret2 = -ENXIO, n1, n2, i, j, count;
+	char **prim = NULL, **sec = NULL, **merged;
+
+	if (IS_ERR_OR_NULL(fwnode) || !props)
+		return -EINVAL;
+
+	ret1 = fwnode_call_int_op(fwnode, property_get_names, &prim);
+	if (!IS_ERR_OR_NULL(fwnode->secondary))
+		ret2 = fwnode_call_int_op(fwnode->secondary, property_get_names, &sec);
+
+	if (ret1 == -ENXIO && ret2 == -ENXIO)
+		return -ENXIO;
+
+	n1 = max(ret1, 0);
+	n2 = max(ret2, 0);
+
+	CLASS(strarray, prim_props)(prim, n1);
+	CLASS(strarray, sec_props)(sec, n2);
+
+	if (ret1 < 0 && ret1 != -ENXIO)
+		return ret1;
+
+	if (ret2 < 0 && ret2 != -ENXIO)
+		return ret2;
+
+	if (n1 == 0 && n2 == 0)
+		return 0;
+
+	merged = kcalloc(size_add(n1, n2), sizeof(*merged), GFP_KERNEL);
+	if (!merged)
+		return -ENOMEM;
+
+	/* The strings are now owned by merged, only free the container. */
+	for (i = 0; i < n1; i++) {
+		merged[i] = prim_props.array[i];
+		prim_props.array[i] = NULL;
+	}
+	count = n1;
+
+	/* Properties from the primary node take precedence. */
+	for (i = 0; i < n2; i++) {
+		for (j = 0; j < n1; j++) {
+			if (!strcmp(merged[j], sec_props.array[i]))
+				break;
+		}
+
+		if (j >= n1) {
+			merged[count++] = sec_props.array[i];
+			sec_props.array[i] = NULL;
+		}
+	}
+
+	*props = merged;
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_property_get_names);
+
 /**
  * fwnode_property_match_property_string - find a property string value in an array and return index
  * @fwnode: Firmware node to get the property of
diff --git a/include/linux/property.h b/include/linux/property.h
index 9143fe4f5c05179e595ba875aafbcb006a740824..a70f3c4c087dd85390951da950c3632f89c6cfd1 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -77,6 +77,7 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 				const char *propname, const char **val);
 int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *string);
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
 

-- 
2.47.3

