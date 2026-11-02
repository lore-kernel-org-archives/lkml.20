Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620149;
	b=djAay8CJ1uU2mFlXsTNmSBUzYd8M81Dh0uIRs+2KjimY/obWFnkkHbkHaOjm/Rr4zg4b
	 n5pfhY547+USSmJ+B93lug6p+8FNcOpSk2cUWdArPxPz6O5a8W6Nk+9fhe4ipdmsDDmj5
	 4gfCoW6LvAvvBpB9heu+vIynPPQYFMyAzYJAmj+19nMQZ8mijPRS7vdFTufAb2JiFshh8
	 QOUyuqfGaxJa2GvikzThTyXpDFFLZKNvf7bbI2w63kLR6WLlxmaZUg8a8J24CLNw3l1qO
	 kcDvCCj9VXiTgnDbmJ/OrgZgHows0WzO+rJcVdH6VHIC8zMUfw6rHpxGWkkOial6RTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
	b=yQLgT11pa1zuT6t9ztC/b/6mhR3MNSQN+f5A3o/lvpZy1O0vajHpI4NNpXOZOVZKb2/M
	 JJtYrnxtLI6IecPmWZxQgPcsTnIe8WHcWzWEJqxblWveIZzGCT81/h+H0TOvavlzD1GsF
	 mRYIikGOTFfgWjwxmrSwpzMC2N/V8NKHEq3sDnf6o5n48HPERWyI8Y84B6rHuzNSQZkl3
	 HSoLCfRr48wMcAKT7HNR4RZYYlcempvisE0QYctQHdeQ1Jv5wjA4ENB3vfKbFft4ASEhf
	 SBA2rtEgMFSdm6qZ2mT84XtP6ES4O+9dyIT9aJM/PRXyLOvKOyibiGjth4qYwFEJjlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+LxwsAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nb2dzrSB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980960A2607
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7980960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+LxwsAK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nb2dzrSB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1Co2466144
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=; b=M+LxwsAKftmbCDgt
	MMYasS/rNqZr4DJEH/TR6oFS86p0asQzK3QUECCQyn5da8o1q0bNg7uvsWTSlBsd
	7jxX0VAjNSveNXJEPxbYM2v8CSxptrmLGwY+doGxR8Sa2A01N8xNyaTNtjGwO9AM
	kFGM12CRGAAbLZRYPgYMrKV2sRKvPj4FnUoizGBKjR5t6eMIEdj6OiGrgIMeBXJd
	1hB0umMpcd4j6yYt1sz0Jz5C8kUwnpvAMY6OBRRsUjJ8fFAZjIKyjKIvy7nq8xcP
	jNPMz0SJwZo0R127gYQrm1+pmMOQGwXMRPX7O8XSAMBEaIUXvN2Z8RR0xE4WkJA5
	cHlXdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhmet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:49:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so513009585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620147; x=1794224947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=Nb2dzrSBhdSVoCuSKrC4kvkIIzt6aSLsSoCtQR0RvaHGqmL6F5+g8HW/WTLAVj+JC2
         DiPKCP3R5FlQjM86zGHx4tNCl5DGV/Oy+fAZGG5ZP5WGl+oV/OmezwxbzKLfq+w4qxMh
         pjnsQTGxJXfZ938/b2L5G2bT4B10SUs1J7eyf5mZbxdos49EWapG83BtRHswF1DOsojs
         Z21Md4Urkszt+aQcUhY+kydFMrGefn7VvCRb9X2HArRCWRJ1P4O/OaGeFP7DIUi2l3+9
         ZWLtyZpmFoRRmskp/mcdUZgWcnWueaENn6K7F7O1Mtp/w3Zabsl9z4M4zBY0hrufPCMn
         ERNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620147; x=1794224947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=vp5FaSPJUAFMqw8lUALlQvfIGpPYEK6nbckN+m13U0bSEw5sVYsJpbmKL1+d6pcdHx
         vdO8vpWnMShHNpCIiS6N3h/wvyAmWXu/xk36xRKMlQGsG45hFC8vZogqpqN/FkEpQkM6
         jKv1KQdjV9g8c27hOM97/0mx3pJAdnTci/BoL6v6OrzG0GkAwU7Rm561xo/jScqH+upx
         IdKP4+xcc2AJrp54XuMydp7USl8EpzSHYU6fDJC91Htp5Pl/b3M8sXHYf5U0Aowrl+Uo
         +0k8/I46NdM5/r62wvUSHjYh0f2y04JBv6+1YjGCjnvzeUM4sZgVUndhv7Ep9tQ3xsjs
         VF5A==
X-Forwarded-Encrypted: i=1; AKwUvBwRvRqrsRU+IUeOtA+f6GTM85qn0q4dK26L6LwN65LMTIlV7cNsjQqk0jdDkQUwRClmkuecvSpIQJEifGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYItcmY2Lw+C+0CzI9DzSSzVhtvx0MrjNlh79jMH3bizVbRQzfF/
	rCfRHqvzoCYxpaMkU+ydGSj4ZTDgbE5QHih6lhCzd73k35HUEM1EsiBrxIopd8nH05TryBxtKck
	DVuX108GvZYtUqpi0emEIL0PNIUcRp0GYbG4UYI36dGcj5maQs4KfZkRvRIaNtIWVnBw=
X-Gm-Gg: AYBFou2ZpnVukFoF0KW2rjmwI97VAeYjN8w3YXTeaWzSooCxycfBtvDNyu0fvjjdGFA
	6GJNMkyEuRqHx6fS890tChezpKun8mwZxe2ymVH5dJBSF4/kMzNBCJuqOjJMfPybxHlT/0gvC8p
	z5rO8DDX9MLVKDb+1aAJRzyRzfL9Bg8IWJ+behZmus4vtw29Ofsm5NjoN0K0s7758nGjqeuajGq
	tIGakfzbkMMovoUWkTYDL2oKpQelyFkWCIBbeIrXQtGtEB6aF1vFushENE+6TOHEgxXfZgojQZ9
	3Zfdy2E32IuWFqKKapqh/m3XdAyN2ie2oUoATdNQuzVlOYFdj1ggflnf49y9MUwx8IL+WtvPbz7
	yYp3IYS2+OPIZ3x9QM8UjBrhCv+eny84cmv+yBkH1zXD752yZtups39udMw==
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505386485a.62.1793620147372;
        Mon, 02 Nov 2026 03:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505383685a.62.1793620146775;
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:51 +0200
Subject: [PATCH 3/3] clk: imx: imx8qxp-lpcg: Return an error if the parent
 names cannot be read
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
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-3-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2uPBsKkTO9u8MCGSda/38zqhRD7AFxl26y3ujADk3+8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HiqqN4XJosCAMvkcauXt+bMtOzQ17SPXFOX0
 6cQ/pXmdCGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qgAKCRAbX0TJAJUV
 VsHLEACmDvcbVJdkVpIlT+OZGgqy2hYn09SA3vioW2L1kBakvGxPfl9NjLAnwChWcC9Bv33IIkh
 95VCogjvOrGTj1FdqY+5TAD7LGjqWC9Igznipko3jsFBzF2kijDRe48YiabcbKptsuYY9ZNmwQz
 aWTHHhNVwUqBRiTw50TAS+4Ub5QoLOC+oYQjFJTMILKnxn5rxBPFAO7nOjWtmBa1IYDTbR4r/Gl
 iXNeHn7xMSDIEZriXFQ4xh2XqG/pIveaOHcVJFJotHelNEk9H5G02wmxSb9ITz9YeFipBJ5DzJG
 fc+KTkU/iDdiNu9evpAbFbi1mJo1KVFs4CiXUAzUNAfqQkTbJsqqZfctHL7QIKVnQGZu4uibWL9
 FyE9PqsYgsyUsdNUDMswrfxqMGD0AlF/GfGcjL2cduQ/gfFaa9Pdx3mqnK9Dbbwp6+MFyf8Udyt
 ATJ8jEphUlHJ8s469efSVk2I8mdjNs6+M18BoWAwyrhYULSvDUJnSmi+Fd3kt0gIeGTVc9s680R
 XDmgpw4k0EBvp8ofJ2xXnb+CfiEilzUBY5r6F/O2hSmiUnjVDFBS4GhEcQR+6hoY+IARJdw/2iF
 SoHZH1Ssld8sjQi7vY+0HskfhWLt/O+loZbPpOdQYlpjXjDpMzzX/NjAG6jQ1wke/2EknoASr8s
 UpdTSlJt4iskH8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: S46_STCp9ENT2gDge8FlMm13BWW6nqc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXyB6DcAVf1MJQ
 FMdL7TeDXzMtcRVWNykFOucWhvd0rxZXhChGSfRWmazyCEMXezV7CQYo+5Ao8xyy8Rx6IK1DO2c
 qV36v80tTMfYrZ2zvrYhBrJIrD2Kjt55xEluBm/tWzKugiZtKbEZGJonhhqMZrSYVxIQGHRiAg2
 Rz6+2SbrCoAUpxKE3ruPapSnFVsa5x7FHmlH5Mcq36e6hAOOj8qLdRjF5hAiUPRBSLQWNw2Ze+Q
 IKMaHB5sFd45c4TaaS2Lgviqqw3KCw5q+YxWbW3ZFWY2VtYsP0REy33j2mS8t0Z4bR8Yh6IF4ok
 WIt/t4EM0JnLXHQeTwa8CqI16pth7xnjJNyjP7gnbfrFWdcxYCuNf5CWqh4pYfzA/9ke0jdUzM4
 fmFWKPXQjeLc4IOgMuXvqQ+EPy2xsMRLgqCRRvV8kDv7ZmlCv905JJIiDV5y42+77vsASOWJS7d
 cnRUFLclchVEoEF6qvQ==
X-Proofpoint-GUID: S46_STCp9ENT2gDge8FlMm13BWW6nqc6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX1sByXS6Tr5Sv
 8Xclox3/XrZE1Cz4QyK4WtIuyLefjUMe1WG9uPITw9Vdn4GNxlmK4zL7I/f8uy8S71Lx1cux4SV
 X/QiSwGya+b/FXWzIKfVHfDa8Rq6+kc=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae878b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=hWtwQ3EaNFkubv4X:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2Br6plB5rF9h3W9bKjcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

When of_clk_parent_fill() does not fill in a parent name for every
clock, imx_lpcg_parse_clks_from_dt() returns the number of clocks
instead of an error code. The probe then falls back to the legacy
binding as it does on any error, but a positive value is not what the
function is meant to return on failure.

Return -EINVAL instead, like the other parsing errors do.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index ae8cb5408246..4070e06f9c7d 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -231,7 +231,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	ret = of_clk_parent_fill(np, parent_names, count);
 	if (ret != count) {
 		dev_err(&pdev->dev, "failed to get clock parent names\n");
-		return count;
+		return -EINVAL;
 	}
 
 	ret = of_property_read_string_array(np, "clock-output-names",

-- 
2.54.0

