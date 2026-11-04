Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801074;
	b=Jqno9LtpgxfRC37BysOwVKmdako7TxWbrwqx2KD9rznwIuxv/N3/DMxmTzq++/xKJwex
	 jV6thvLdPBYWKesj2ykipuIj8JvoQagM4FX8r6bhk3LjTWHxRPc+cqCoqJS2xqy9Hhwat
	 TRkWc5bII625KjLNFy3k3r8rKDc7btzlc6HH3idIW/P+6lY4seYIGg9gOnDDij6vXbalV
	 ubLzEvx13GjCcmnsN5SdA36AS640kkDDZlBYigmZCNG/aDlUyS2NVk+MVZAvDj2o7gNTC
	 gJJgfGYEvfYb+cET6dy+kyK4ELocP5CBcD21XZHDwRDtjTTDtPF6z/ae3QxU4mEKNTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=mKtOlZ3vyLPsWhJWLUFOtsRWKjQdq3WmwBLI6WtMOWwgKB6xOFos2f1UdbQ5sKWUIiLM
	 PHaQGBYi1uUGgZKG5V8plbquXT+OwMsY4dgl/I3OfeaotzovSkIZgmP57YIRN2bXpp19N
	 flIMvOGIXeCzDteAgF13TfcDo9PbfCTDniAbpciw+cwuuyB9Hr47x+kkIFxII8j0fKUqP
	 S/Vacb2r56ErcN4p8caWawXFgLvBFBG+PioB3Q006Sb6qn5Fqet54zFtxHLQ4Adl41HiB
	 6lGO52kE09gA2Fvn3nCWH83zErfMGzoEahYEFE63JQlEeAz9UYotS8MdVQ6xNzuBUlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCpwgcqH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0365aqH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52312606D81A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52312606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCpwgcqH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0365aqH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaOhF2310758
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=cCpwgcqHhX88zqxe
	wKpSvCBv5dquXNMbyzsRpkUZKkkHfISr3zrtgx/n4+6juick4N4OY/MXhKeXLaWD
	97DesLv3ibhadPjc61dojFlEetb+3q724OGWzkhy1fLVQFyjuf8J9wb9lar3Sxv6
	qLtGuiDDoGpZdGDmxWmqhCHno2Ji2YMdQzo3JjUD74A8Xbk2pvBamVmkWzba/sqB
	XJsq6dJIIpDVA9ymxqpSig88iIp16Sl4HicVJNisjPRNS8XJNbP2ueCOP0A63c8E
	Bfrz3Peu1JysW8OEh8myUkzbUFp49cW/rYLq2ucaQtaXEY+N7BSXAxpuYiOgVr1M
	SOtMig==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mv61v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:04:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae356241fso207037e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801073; x=1794405873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=a0365aqHaBRWDdi3PT5jwHd8Utm+7NqTnV5RZT0jlApJ6F0W2Fs+ioT3kTX4EX3dbZ
         MsTWygcCT0aG/nuZXYkAbEKZfHha0NAlIVLudEu0iVq6qoWSUkIfCy5hGcAaiqjPs9rE
         8OG3EVBlT0hpn0zExSxfKSFd/Vu8AapLytHtJM85F+ExgFNpzsvmAaMoocYo1aVkp67r
         Uq4WMP6zJ2RkQxodokMOea2nHmfGCZlgOdwAya+d3W1YBfFnaSHCX4iel8xWxoB7Zmik
         vMPign0/8MuKQcXQnRe7X+uM76mvJ2hU/qVdM2YlSVZhMVyY9gL8OMKPiLZ/dEPp8j8C
         MyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801073; x=1794405873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=qfJnffZyGDtXp5BPI8MehyAA9oqx4q1tsFtoZOkrCm4p1xn/uecTLheD8nJAeGTJzJ
         NQBtTLBBy3dTva+rs5es2d0Dl4ZOBr0YSYv3vr7IqODLr3EVNCRK4XVKbKCLATOcLL3N
         C400gSPAsmL8cu/0zS4MFROo949sXPhww6PYz03w+6jSoivWK5GrulD+FIpEGyWpJ+5m
         kHvHCgKmglXz8FntNeT+z1APvuBLCwtVOnDXUj4ciStdw/IQwziGQ9sl5eD5WubflDkt
         ARQBQldB7/Y+4UYQDlFQZTTRpgHAHI3AhLCy0uFnbwQBbOxGGmfVOJcUNP9lg6O4jDq6
         wtfw==
X-Forwarded-Encrypted: i=1; AKwUvBzburTWCvURmVDv5EwBYScDbpGYk5fxcr1jBFWFtnxSM6vy056V6ZRLiLTJxPBegXR6uVgRK3kkIPvAkfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1wIISG63v6esSJ2OFNUVOg2YqvEJugY6tVyQrrlST4C0DZTiE
	0m+ly+GUKvEXJDXXQX1i+6f+nSfBNJkKOnWexFij/TC5J9EGfHYqf7NWESUSi43pxOvqbSJRf05
	YJQlA8Mksg3l//F3LfCOEo+9V/bCoQxRG5SwHMcY3OP8IAlEOi2KgQV0YsLNeD94n71s=
X-Gm-Gg: AYBFou2l+kmw6xv2Job5qH5zc2CeAQlfWkDhOtcnKm6/NYHYOmFxsdiJda8bHCIzz15
	GAAYPRUgYQpE7hABhMufbtCPiv7Z30cqS/lYyxUUuqtDfILZgn7aNx7lc2B0F+9sBceQZ9usYB0
	lwe/g3QZxgQYUCHdH/8VEbsg3JCZTWZjEJe8ehxpHmzoQH7qzpL53ACNEerXmJHOSmBEgO5LLdT
	SfT5EWpisplKi/t+4bKCt0Km2CaEVzYoHy0X45/yF2OtBEbvxAtFkMmAXG5ainyS2WS57muzOV6
	Qbjexs6Hgd5E+qu0Qiq6qFhujOk3psuHpDKuu9vEcBBi64tMcx3qdW2XSep1SZ0gtmWXizTdiMm
	zs/Tzz1grd66odrlfS6+cpWvcAnDzO/YkIPxYPWWEjSP+XP4R1+NZpsBoBekTzxffgoQDtfTrjJ
	NSag==
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr6418942e0c.10.1793801072585;
        Wed, 04 Nov 2026 06:04:32 -0800 (PST)
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr6418906e0c.10.1793801072076;
        Wed, 04 Nov 2026 06:04:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:48 +0100
Subject: [PATCH 6/9] fwnode: define the count_references() fwnode operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-6-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztS2SsNdvowGbCSji4kZOTwDRHFzVi2ScCTm
 5DN09+/VD2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w440D/4vJjAqKGaTW6L9NuB+kiT9Z1j8j6GncKaGTKchN0TnH5ydAEKWi2Qizwxyo04HcaKr+HQ
 4T12cK/xUvEPrxrLPLy97ZpWxLC21qJ8sj6boM1JlVC2V+5QXDq6339woLssxJ7Y6M99mmxGNK0
 UVXhqSSv9ju6n+VLIppKzuq8CuwgL/VzXfTB7aHz/Cd+Xsz6lX+uaTHbSXBUKrANZ/8mc1Ah4xw
 LlE2LnTq7wisxno9g2y0vYQQIjSRHTS8THzfXWP1S4wW8tgjV1Pmq5QMK//1ycVjqLfir3viFE7
 Ff5OJTBBHCIPAMGZD0VdZybYCipsP2yjNt2Xhg6oFBqu9GpuuyiZ0cBuPFlWI3AwbCyBuM9QsVR
 eFk7uPyVIeuDQMf9MKYHvjKHoyUkDCJCc6p9uaA3hHhKcwSapv0I+gfJE/eojzptJZJHKvxyNuG
 +lG49XDNmu5UG/YjkNtvw8oay7kbYHBQicu7eEdg0fwqfiaDIm61T7X0PQvffKbI0/5Okf3t1Vr
 nKclDroDVSiQrwB2nDXnE8RP4n1FAt6bjHO2txCMTh1Oox5VR0B9mqCeH+xVxBJ9XFUPD637HRS
 yYvDvMriOT/0YdbwaG+p/rLaUxpahQjMVuGXSPkPEIzmD00ie61X6oRcCr74MhpYpDJ3ZwS6fzb
 fczhOO0ijZqWZzQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: MzZZHdpEzPeeD2z3UgeQodTkLihcv81C
X-Proofpoint-ORIG-GUID: MzZZHdpEzPeeD2z3UgeQodTkLihcv81C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXytUo74TFpiqn
 vWm5tsb1eVKqpSRD8IoAjNSGVmgJRBspW0PcuaVZQqPfNwbmQm0q8Ztn67I/NMl2WmJKEqM7Wpk
 nQxGK0oE4PQPuUVUFicKhEoxHOWEPNuLNbBueBYMd2XUW6uZ3++qrb8To3Rk0qroFmO0FjUkArD
 8zJo7tPLufcSTlPDF2kUdeHzmBILy2fsJ394c+NmUKLecAFNLBX4vKvaHySGZHN6G2SUwFagIc/
 VXE+rShBJBvRr47sg3jDu19n+joluHBOcWWdOXdrTb25K0snZQ6HvkrVdHvL3YXQThgzroGYye9
 PeD6+17DHSuX6lBVxScZuZXI7VKCW0JtD5ym7vA6svf0dEFaG2CAxS53YPAvfv6ERqNA4aUye0p
 d0mzouhsHu39kozJpH3nEPzDdq17LI6LNPJfIVe1MZ1RHGX69A10EgipsPj3Ez4G6fJthLIiTGH
 wUdBtOQ+zeoIL2wWr7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX2w2M1LUOcWb0
 uWzANqPPP5ln7QNc/cIrWr8B+RUhh1tBzZk3Nq1QSIXofJ02VAnuYQ5DrP+6Ir/vCdasLw14Bge
 Wswu5OIrS6n/VZxdfsh8tP9rirnmdOg=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb3b71 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Add a new fwnode callback allowing to count all references of given
firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 2d7e0b9245d445d473c7317bd27058abe5750b40..15acade60564ddb5f5a48f2235b626466d77dbdf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -137,6 +137,10 @@ struct fwnode_reference_args {
  * @get_parent: Return the parent of an fwnode.
  * @get_next_child_node: Return the next child node in an iteration.
  * @get_named_child_node: Return a child node with a given name.
+ * @count_references: Return the number of references in a property, including
+ *		      empty ones. @nargs_prop names the property in the
+ *		      referenced node holding the number of arguments, if NULL
+ *		      the references have no arguments.
  * @get_reference_args: Return a reference pointed to by a property, with args
  * @graph_get_next_endpoint: Return an endpoint node in an iteration.
  * @graph_get_remote_endpoint: Return the remote endpoint node of a local
@@ -180,6 +184,8 @@ struct fwnode_operations {
 	struct fwnode_handle *
 	(*get_named_child_node)(const struct fwnode_handle *fwnode,
 				const char *name);
+	int (*count_references)(const struct fwnode_handle *fwnode,
+				const char *prop, const char *nargs_prop);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
 				  unsigned int nargs, unsigned int index,

-- 
2.47.3

