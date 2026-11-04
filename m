Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801072;
	b=Ior2SXK3NJXYM4R6NobStQKezKbDNQcz9B64U3+VZGFqRt+cxM9UW78AGr1sTJNCkokI
	 Tw4Rq5mheeaDsZJF8Q785qpYPr/+jp0LJ2ZQfuEH0OiOjbgXgQcvSk42LV+JU1eiEzzIq
	 nD1skXuAK0H+mlD1XteHDO20/xHQbV1KesLqrKuj3mIH/Gzmca8mt1WRK9F6wPKi1uoSh
	 oboogvQzxbMO2ckrQd5vWnSGjS8qgQx1yKK9CMkyuo5+MTV6ExtvwvW05GFqk3psd0OKP
	 xddSRDzw+BVNlFrjHyDeloeG3ELfJERP02A8oXEoe2dhDES68j+O/d3GZKoM3amqBlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
	b=kGX2vvxQHtuY9XjQat/a85DG9HKtRqOuAA1yohLAFEIaVIwLCO5Ygy8DE1eFU8Q+UHE/
	 SA9BpfyxpZaQ2FBjUOA5ssB3k0YyTox2lRsaHSMK35yMs6ekHpH5eG0spFLDbrtYt8B4B
	 6H9cxkHTWPXXFOaL/Y5upxBc9/nlvyaTf3Vm1T7b0o2cUyEX165biz+B7yoDaJNPTIfhl
	 /MSd45S8ZH88P/jEFoZBnETOMpG6Ba42D7Kidz1RLDpjQQdF7hKw+jXEV9LYyHtYiGaX1
	 cZwAFdEZXFHXjGGzx1/eUGWRsOlNbiVsK1wiYmGWKPVx/GuuQVV2b3+UHqWMG11x+Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOgz3yJ1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307D606D815
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F307D606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOgz3yJ1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZrlF1700251
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=; b=W8TE8KXWhAa7mSse
	KqJyND/Uo3fINN8csA0WHZcbmFl7o58YkQE6yUYKCSKHoncFZiEhoUB9yB/IcGpY
	lv5bJhF9J6qBLZIjG8jyykN936enW2UF1OG9Uj/4xGwFwk9jUQRRtOjGGqWzsmpa
	RTf9H3EWCGZa4z70OSauZu9/CtxDdBs/ZCrm6SH0ojWgMurFD9Y1jLXJnR3rqlwz
	yj+YdduA/Cu6kaCsFKOTCKzuYtUr1TmmfvVVGEV5NJz/s43L1P/VdA63capDaYVE
	WxfbYInzK5O6PFMX3QQ5vxuGTY3886ta/cwtsQh0Man9dDcVV36m2GvXwM41XBOP
	zCge3A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pygm6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:04:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98304865f02so649094241.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801070; x=1794405870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=BOgz3yJ1/5c3CstAfICtLSmp56m/9Gj2CoA0C1mYy1dD2rZuz7ppTds2js9js4WMjo
         +sYVTr/DlznNMrFr0BzaGj8ROx2m4+6hY3XME6EAs+2ZmJThK5ZQmplcSAsniNaHBCiW
         HYrVXTgwjh30nvoEquncraiZD1dlpk9J2uZgFqDo0yhthpRagM+RDH1ffmzgZkkPtOSt
         2bASLpbt5z3pj/3wY/fXO1PhuwYcGE3brAp4WAq9J10rVcyptHvL/3bOhZycP8aVXjLn
         m7eLCsNpQvSJq2SwmrUHxbhqZwfplNcTSrMPHvEVzhDX45qom3XhimglnlxZoSJzNw+2
         Pi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801070; x=1794405870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=UKCqz9LblbzRij3x6Ny3VLR3WESRVMpnv0eoGc0oPIQxVXnq5/+Yz2fkUfD4f4DfDI
         PzxZxlW2clSFEwVHQWmBY8ENBFSHvK8bywCtYXHRuVNPAv+h22XgBHi8g2XvXCRIkkE1
         zKS8fZxhQhUN9hA6RFJwv0l48OKOvAf7E/5nlAcam5nXcOoFXzphoavFCOOqjDgDgxGl
         aW4SOwVbWgMoG5BxI0FCzmEYcVGLIrAUQW0AjWui0z6V/Gvh1Xyx9P+d6bEYbnJEUwWy
         9SZ0KIdcOp8veR2iwP03rFs8r+CDNpqvFATD0vnwDc76vSUw/cvk6Pc4xI3WYxaF75IC
         53Bg==
X-Forwarded-Encrypted: i=1; AKwUvBx19vBGjkJ7zTP89AgOJsB7TGN1DQlILAeYXwCej1nAAV4qt8BsRxXu7tSzONrCwalP0DqfXY/lQRrHVSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z87Jf2uQ0qE5098A1j/+AXLESerLGuLr7WulLPgFE8gkR8ylbnI
	Z+yWWdpatsskAo26rccm8wSERqFS2+Vk/pi1r8X6CQMGzlXcikr0m4bQKGddHjNXb1wpmlP+h9R
	aMPf3GHLSXxNV15AGwGqRxuStdsL7lp5tKMeMG1+zP+AoTwSot16ezRAQCm027RrCP+w=
X-Gm-Gg: AYBFou2KA4xfDz9+/TQCTW/v7CXWOvL22xsNqjPGdyC6e4hi7JRvCghhTbmJNTygZ8R
	ydPy7UZetpenODAlsjnLjcXAmjxP4icRvejyslu/IbLD26iwbJMcZVHlKmU0jlRKgcqrzHXKTSf
	987HTAFjbDdAx0pNGP1SpWjYxtE6HIQZhGoEZ1xMm9WbTI1Sp8wbi/RHgmNEklUo7F/exz5cFj0
	COHIFI87X2oCumAauGXH8xS13tXk/y90BaHhEokbl0zW53g15IrqI1AOTNpReZ3BQZ3ErRtj/SW
	Tr6DVeFqCJWg6R+mdzhI9F/56+UsT2bD759VriV751VLVMh1S1eyXKZHURSEgh5a1M6Vqb1ZsQ8
	z1y/3yGc0ipQxcvBHRGCu1RxjOTQBWqXfANBncweYsanPJGSP/gIUILhIqiACLGBCA3PUfYmnJS
	ZcRA==
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944329e0c.13.1793801070110;
        Wed, 04 Nov 2026 06:04:30 -0800 (PST)
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944269e0c.13.1793801069615;
        Wed, 04 Nov 2026 06:04:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:47 +0100
Subject: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUearllheTUa0mAxFBQA4rgfpmwyh1HyyvDmdireIIM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSMudMNgYFqcJmZ0DLcgsCP+qirtdi2op3S
 //eoHjcXWuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w5yqD/952xG+8H9EKe/LRTYijZFEaI7dbjICEKB8Nx0sjEwcYjqdBdkX0oHDq9Q/140tjPQSf+u
 qUdmFsX0hn6S820xkPwyyBg4+AE0oQYD+GabGX23mtxW1HzzaXaX0EE/EIO7Rgq9eQxtDqbPLK9
 kbqiniYPqMBbaBmtmjWgVwuJ0foj+FXKTtw95VwYd95a1/fV+cGb3OXffG3FflbxIXHVxZ0p9IH
 VA0B9agIHy8sRzm+pJKufG2sd5PGB8NLotn+zNMLTJbiRvJxXO/TPluKWty89//xYOQt8gr5jvW
 0OOIVr+vnBwi96VTpN0KBoxhE2acadMuU5PVAmFNNpUdiialK77WyltSv20jRrG3mzarDMctQL4
 /rI3XmjAyOWxrgQmoLx8REtpu/BbdheaZTlXUee00w49zypxx6QxsnzhRvYoUSBYAaDy2Fc1esh
 OSuUqmpLnhRVF1RfozKZOKpUgfq3hoi6R144EPidufa1CVMmfvk4s28C8diZQb706YSNBPlJCsj
 x/Zi0ljFw0fH+hlrBrb2K4PBvX7HduzJCxpPIbR8V4SzAaS5Vp5jrhJhlDGzDbALi5G7uE4CRt5
 QF3KnUhWpvDRhzBn+K6fbv8UXdtVrrFfiVnhJE1I79zRBKUWOhJ53fubnCpzH+/9Kit1B4lUnbx
 gRgmnYNRA18XMmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb3b6e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QAC4ccWuAPOjo8k0q0QA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX1Te7W8BaSWmB
 cN+cU2XEmAqYmkThvHFzC+yM0Lg9DQ9J8KDzWCQBPiGSKheA6RyfndZuCN8GHUnW1EDfuH+ze6m
 djkK23gbDY8PLLbhzMiXJ8/XgfCWOa2DfiiEZ+5icUAA3ambVji6VVg75j5pmH2b9bS5mMcW3JL
 2NdkhwXxlt3I/eIl9VUcRkP8/9aqL7Y1RQDeg4VrPRNG8E9mc+5UtW9RvQu9PgwwxVLvqva5UMu
 qDHZWGeXOG7OIO+GUbuHmk6VmUKQMsSioQqk5GoM1QgBdLRdOYZ50200p0vmnkQjH7GrN1p/gtO
 UBQInCcA27FBo/801BAUU4jc9I/QJRVjieLIcHZImj+G3A1f7wA/W/SDvxShl0SwG2wghMOqKyX
 KuaCm6ys5QPfmaPV78Hy8/4HhYuYmbEtGFuvIFJ+zjydo/wiA1wJsASZoUzaQJdC+aJa3GlOr1W
 xz2X+mXtJu8wILwLqyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX8069+XSRSfxT
 MbVGQtkTiCB+L1VFKDnAZmOMviX8P3/8p2ptCuCur8gGuCveJOzd17oiZraYELEnC36nkRZb6PI
 2bcoD2SH5Jmk5+hBQgrfj1HIf/nzE7k=
X-Proofpoint-ORIG-GUID: AaQpaimxLIPMY1gk9FnwPGPkIb7BaGJ8
X-Proofpoint-GUID: AaQpaimxLIPMY1gk9FnwPGPkIb7BaGJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f61848801ed497702c6cfe501009904c49d..16c9c307633bdc7c9343782b1cd3bdb845552c6a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -28,6 +28,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/moduleparam.h>
 
 #include "of_private.h"
@@ -1120,6 +1121,34 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 		of_property_count_strings(node, propname);
 }
 
+static int of_fwnode_property_get_names(const struct fwnode_handle *fwnode,
+					char ***props)
+{
+	const struct device_node *node = to_of_node(fwnode);
+	struct property *prop;
+	int count = 0, i = 0;
+	char **names;
+
+	for_each_property_of_node(node, prop)
+		count++;
+
+	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for_each_property_of_node(node, prop) {
+		names[i] = kstrdup(prop->name, GFP_KERNEL);
+		if (!names[i]) {
+			kfree_strarray(names, i);
+			return -ENOMEM;
+		}
+		i++;
+	}
+
+	*props = names;
+	return count;
+}
+
 static const char *of_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	return kbasename(to_of_node(fwnode)->full_name);
@@ -1712,6 +1741,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_read_bool = of_fwnode_property_read_bool,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_get_names = of_fwnode_property_get_names,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,

-- 
2.47.3

