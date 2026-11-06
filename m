Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952017;
	b=yYxdA/FiMR/TpBalNDnioqnw1uv7TVQOwJE+fh4BQUyWZPB0x6C1FT2RVM32qkZqC4iY
	 hLXQlNXhCbSX3RRhHfQ1YHB+tpzPOreJLAQ9uI7C2Je2YCxiKm5t4VviKM2fu/eODuijw
	 IbzifGXIo190OE98Xuh+ace0mIB6PbsxsKoNBioqE92KHEb0DTrIsQnz6J0kZQz1GUyzs
	 X2nDYBQH4OPCjkUb3mBu8Lx4Aj2Y5DdfJITUkVBMqvxqHOU17rY0bvatlEao0URZZYlCz
	 5SKTZ0tur2JjgVCsWY5ySgfpyB1voOUcetcNuQnf7Hz7ECZxZRrZIMgyhDbwrMz39hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wz18nwrA8O8X0KkP8lXwj4+kriyIA00I4MM2Y2HUmjI=;
	b=wTUaCgQZbG5e+1R+u10ozeb0CLV5h9q+dZJC9E7U9GOO3x5y7PqW/22FRZclZrgrFNAi
	 v8TaIHTV/8rF2ZVfgew5mtPqWtHDzVBeorJ4b85luycLs5EEYS1n41m0iK3EzhzaRFEJX
	 ZHbOeqdqcYYJJ313Gtb1PtR+bVFaymzwQTB9nrf3XxTUgvUPAeX3LpphkrbXWjbjDa+9R
	 Oeh12icJCBq+nK1/SIC2f2vZTWNdCAengjG2NYRxY2a9zkDM/7Q8J19k+8IossuLnobr4
	 V1vGgboRMRUW/Z3mzmJ5TBUSKZzze+/K4st3dY+5Xk+y+IOFFnLFMvMXu3i5+NELQGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NiBcUJvz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IiFMkgcs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BB60A5BCE
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988BB60A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NiBcUJvz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IiFMkgcs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RR3O3907026
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wz18nwrA8O8X0KkP8lXwj4+kriyIA00I4MM2Y2HUmjI=; b=NiBcUJvz3w7Incup
	zsFQhO6umthTu08r6g5kpkl39FFNxnYrPwujrGZx98OyfUnoaF0+kUgS9yS+A9Sa
	Mbt87Gh6667VauGg0OWC8+2HBs5cbyIs0CcxTOWGNFvEniTdz9qnxptFxw8UgqFG
	M6nyZchDM+JEsGeQ4XB9sZz8teI/Ke3fMzPs4gHbzXbyMKBZIYAfiiyj/jOP45i/
	E+xtHoqMUvZMiOlBddFAcGqw/QGWa45ksdUIjNFYila9QdUdZeqrI5+Jd+bkk6ra
	hDaOVjN1KhLY5riMHwmbiLgBF2WxJan3hmKrG5X6QRuamEC+laG7giw3FhAk4k5k
	hRuJhA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasqn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so571461b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952015; x=1794556815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wz18nwrA8O8X0KkP8lXwj4+kriyIA00I4MM2Y2HUmjI=;
        b=IiFMkgcs7v+3TkzS2HkCKikBofyNEphJ8RwzP9GHuvCAlmUsCTYlMDr0TjRHfvgcZJ
         fc32W/tjYllyUqcdiTj0TvRLUckhPTlXZ10f9ot6xqM7kMWCbGnJlgfTX3lGqeKp+zS8
         6fiJSVJuiUhCvASsbKAER5IYl8x8W9mQcZ1XoH7rjr7k9TkGJ/893FPlZTzNb6uNLIOg
         nBb/jkAzmkoAtjY+ECsYqjxUCJAKxJO3G1Gx54y1trZ7TJdJdTg5mIVQKgDIAilP3yHp
         XZ90Qk+S0E55QDe9O2fHU4EDdJKOTz7dM16SRP6lY+kU9DQENOW7sxSpfPp4PxCGRkxG
         1T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952015; x=1794556815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wz18nwrA8O8X0KkP8lXwj4+kriyIA00I4MM2Y2HUmjI=;
        b=y4hHe7CGn0a9J5SmvouLwyY0EzLcqmk+Cs6Og85BXlG+iToznEguq1Dnf5tELa3C75
         3G8hYegm3omdsz0TWEQiqYonH0/4FJcPht6NNEMtoKUmSs/jdHggIK2+dVkJUKkzvdol
         jjtIKq5sWZLqPRpcmOw53I1ueb6WZvU6MW8RynlbEIV/Pla8x1d2zffYBB2E46JGpuzI
         bBqKkIw+zCJnNJJZ+308JPKgP5xfJ8leW2Z7X9+hAd/dsOiEvq38wBhQKsI92cb20opF
         zV5ciTzisll0I37zMUCNkxnE89/Nw5NYTwAMequhpiOBbhM62qqZmVgC+gnjiAdtj4H7
         ydZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwPfbDU3YImoO3mU/Z366aXHde36zNCkNPXyP7OoWzk6NM/sdG8F5JUajgRpFBXjjqxp0C5JQDCokdDaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xbgWnTYeYoNIa8ZrUPHo8zntqTAUcTU4Ub3TsFFEgcGFiQx6C
	t4z3y0IDpdyOg8v5A1lK1gxdMBqAC4Fr2CLvsSw8Mk6psYxzDp5JJ8ao1qc4Z895Mj2Oyu2Uz8O
	JLHaa03o6U7tklUSdPzfVY7bqDNhuis1R4JRIgAuslmicffsFokFhFebPm+CBOh4jgtE=
X-Gm-Gg: AYBFou0JLQilkadpZWbz/6ZZH+x4q2Ain9hW8xhZR342nv3OnHaKYkcCB1XResGha/e
	4CS0zteSrueTqveNbWbUbziosUsxthd4ScEQ8+OFEhjfcDbWmZQGqsZE+7+g0FYMHFBQJQnEmq5
	0pAFCRclgkBjsy2uf+M7i24phSvBsyQGPs/F99gAvKVHyUHVkw+HXB1n0ae58dUA5ni9/mwS8Y/
	6t1z3iSbKWFx5+8pR83E9kK9cvVScWQtmQSRcFTn4swWEKgyHhstWBpxFfJNd92S/IcjO690V4F
	MoAOdN+qqok829/egWULqU+zYtxM5OzJkk1IkxiQgxK886J163Fu79GweTIPalUK84BOktVdinB
	VXQsUDqyjQld72u4DJGwZbNax6wPAxqM6Xeo8tz5SW+Q9S+02eXWMSKOUXUxmdyBbxTDi6f86yP
	xIBn6jKMEOWrnp23v31ciXNyLyI3f5z8eSYi9dvm8ukBg1YdoUbZ/ijHcdPCCGGzvu1E1/
X-Received: by 2002:a05:6a00:889:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8b37b5713b4mr1677975b3a.27.1793952014492;
        Fri, 06 Nov 2026 00:00:14 -0800 (PST)
X-Received: by 2002:a05:6a00:889:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8b37b5713b4mr1677927b3a.27.1793952013977;
        Fri, 06 Nov 2026 00:00:13 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dd36d3sm354529b3a.37.2026.11.06.00.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:13 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:29:42 +0530
Subject: [PATCH 2/2] pinctrl: qcom: Add qcom,remote-owned pin configuration
 support
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
Message-Id: <20261106-egpio_fix-v1-2-569d220a4748@oss.qualcomm.com>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
In-Reply-To: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793952000; l=6925;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=4drWwfN+U3k3ZppscLnAKNQYBioRifWtx61RTk0WVUU=;
 b=R6ncTicqxGeWhlhsLkOL1JiRjaKrqFknbU8YKDkSKUh2sGXmZ5gfyHMOwGipbGPqzWqgIZ4sm
 XBTzJo/gXu8A0pC6NR5hUKnBVJWwJntcvOT7ts75cM2R5hjPMHaWYUg
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXzh8gxKsn/+Ic
 FIsc3aYPRKkrPAUdUkrdOfs3Ld1lKfMGQE7lUc5T0b6fa8hM5lbiQQqBMnciaqeZP68OHzUmBZl
 3AdHbtOtTxpNsuqs56bdZS32U+TfxzgWrn9omJjZ9uG+5LHaxglLGzTkXTYM91s3zL54BIHnxrt
 cQu+1LoRNVyFpSISNuqdnv93cCI+OaaOm4JtEQSs2107B4dcndk6cN/tZj5AAk9TEAte+OROb/L
 t5y84WKZJFSgkNiyve3GsfDvx5YQenl+cIR8PzMxWnlk4Mwj5UqnzVnXwFFXW2ti9DkFex/oxRj
 5/z7ZZhqs14giJ8nkfh5oskOiPYH7ugj/pbey5oyfwN5IVzDGFp/4OX2qUAhtQO89QgmWH9YH7i
 dvcqJJPSAvqM8vusC2JfmOQjRTOG2EnHM5QsSCWNGZ9IgfuJiDesVdTPRRFH60HTqPBMchpRyJq
 rEncgkw9e1JYouck2dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX4YJ11JDaWihq
 VTMCNSa8CIebfndCNlfT+ld/Z7KoZXVMAci3ZCXtOL9YsrUS6Cu0rFDLSvjtrLhGxfw5hSbzEa2
 rC3VfODRLqY3clPP2k8NDatSvHg2h0o=
X-Proofpoint-GUID: va11A5PgRg2ulx742_fDTnJfDXyljlxt
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed890f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J6oVEZvgg9VNJ-PjDz4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: va11A5PgRg2ulx742_fDTnJfDXyljlxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060031

The eGPIO support added was incomplete since pin ownership is independent
of the selected mux function: the eGPIO present bit only describes
whether a pin is capable of being owned remotely, and the enable bit
selects the owner - 1 sets the owner as APPS and 0 sets the owner as
remote io. At present it's a mux level decision by setting the function
as "egpio", APPS releases the ownership to remote io and in process
cannot use it for any other function.

Add a driver specific pinconf parameter enabling the "qcom,remote-owned"
dt property support. pinconf-generic falls back to the default value of
1 whenever the property carries no value, and an absent property is
skipped entirely. Since pinconf-generic emits the mux mapping ahead of
the config mapping, this is applied after msm_pinmux_set_mux() has
set the pin ownership, giving the intended result for a state that
specifies both a function and remote-owned.

The hardware programming guide(hpg) explicitly mentions that the egpio
enable bit can be set independently of whatever the function select bits
are set to on targets which require shared ownership while the APPS
continues to use it as normal mux function.

msm_gpio_dbg_show_one() printed "egpio" and returned early whenever the
enable bit was clear, which was sufficient while that state could only be
reached by muxing to the egpio function. Ownership is no longer tied to
the mux, so report it as a suffix on the regular line and keep the
direction, value, mux, drive strength and bias visible. Pins muxed to the
egpio function reach the same register state and so print the full line
too; their mux field reflects the previously selected function.

Fixes: bebc49c1e5f6 ("pinctrl: qcom: Add egpio feature support")
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 81 ++++++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 32aa7b919e24..4d96260f9909 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -48,6 +48,31 @@ struct msm_pin_state {
 	bool saved;
 };
 
+/*
+ * Driver specific pinconf parameter to hand a pin over to its eGPIO owner
+ * without muxing the TLMM away to the virtual eGPIO function. The eGPIO
+ * present bit only describes whether a pin is capable of being owned
+ * remotely; ownership itself is independent of the selected mux function,
+ * so a pin can keep its normal function selected while being owned by the
+ * remote subsystem.
+ *
+ * The "remote-owned" property is a boolean flag: its mere presence releases
+ * the pin to the remote owner. The default value below is what makes a
+ * valueless property come out as "release", as pinconf-generic falls back to
+ * it whenever the property carries no value.
+ */
+#define PIN_CONFIG_REMOTE_OWNED	(PIN_CONFIG_END + 1)
+
+static const struct pinconf_generic_params msm_gpio_bindings[] = {
+	{ "qcom,remote-owned", PIN_CONFIG_REMOTE_OWNED, 1 },
+};
+
+#ifdef CONFIG_DEBUG_FS
+static const struct pin_config_item msm_conf_items[] = {
+	PCONFDUMP(PIN_CONFIG_REMOTE_OWNED, "qcom,remote-owned", NULL, false),
+};
+#endif
+
 /**
  * struct msm_pinctrl - state for a pinctrl-msm device
  * @dev:            device handle.
@@ -328,6 +353,10 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 		*bit = g->oe_bit;
 		*mask = 1;
 		break;
+	case PIN_CONFIG_REMOTE_OWNED:
+		*bit = g->egpio_enable;
+		*mask = 1;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
@@ -424,6 +453,17 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 		if (!arg)
 			return -EINVAL;
 		break;
+	case PIN_CONFIG_REMOTE_OWNED:
+		/* Pin is not eGPIO capable */
+		if (!pctrl->soc->egpio_func || !(val & BIT(g->egpio_present)))
+			return -ENOTSUPP;
+
+		/* The enable bit is cleared when the remote owns the pin */
+		if (arg)
+			return -EINVAL;
+
+		arg = 1;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
@@ -536,6 +576,29 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			arg = !!arg;
 			break;
+		case PIN_CONFIG_REMOTE_OWNED:
+			if (!pctrl->soc->egpio_func)
+				return -ENOTSUPP;
+
+			/*
+			 * Ownership may only be handed over on eGPIO capable
+			 * pins and is released by clearing the enable bit, so
+			 * this is applied here rather than through the generic
+			 * read-modify-write below.
+			 */
+			raw_spin_lock_irqsave(&pctrl->lock, flags);
+			val = msm_readl_ctl(pctrl, g);
+			if (!(val & BIT(g->egpio_present))) {
+				raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+				dev_err(pctrl->dev, "%s is not eGPIO capable\n",
+					g->grp.name);
+				return -ENOTSUPP;
+			}
+
+			val &= ~BIT(g->egpio_enable);
+			msm_writel_ctl(val, pctrl, g);
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+			continue;
 		default:
 			dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
 				param);
@@ -676,7 +739,7 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 	int drive;
 	int pull;
 	int val;
-	int egpio_enable;
+	bool remote_owned;
 	u32 ctl_reg, io_reg;
 
 	static const char * const pulls_keeper[] = {
@@ -703,20 +766,15 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 	func = (ctl_reg >> g->mux_bit) & 7;
 	drive = (ctl_reg >> g->drv_bit) & 7;
 	pull = (ctl_reg >> g->pull_bit) & 3;
-	egpio_enable = 0;
+	remote_owned = false;
 	if (pctrl->soc->egpio_func && ctl_reg & BIT(g->egpio_present))
-		egpio_enable = !(ctl_reg & BIT(g->egpio_enable));
+		remote_owned = !(ctl_reg & BIT(g->egpio_enable));
 
 	if (is_out)
 		val = !!(io_reg & BIT(g->out_bit));
 	else
 		val = !!(io_reg & BIT(g->in_bit));
 
-	if (egpio_enable) {
-		seq_printf(s, " %-8s: egpio\n", g->grp.name);
-		return;
-	}
-
 	seq_printf(s, " %-8s: %-3s", g->grp.name, is_out ? "out" : "in");
 	seq_printf(s, " %-4s func%d", str_high_low(val), func);
 	seq_printf(s, " %dmA", msm_regval_to_drive(drive));
@@ -724,6 +782,8 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 		seq_printf(s, " %s", pulls_no_keeper[pull]);
 	else
 		seq_printf(s, " %s", pulls_keeper[pull]);
+	if (remote_owned)
+		seq_puts(s, " remote-owned");
 	seq_puts(s, "\n");
 }
 
@@ -1778,6 +1838,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->desc.name = dev_name(&pdev->dev);
 	pctrl->desc.pins = pctrl->soc->pins;
 	pctrl->desc.npins = pctrl->soc->npins;
+	pctrl->desc.num_custom_params = ARRAY_SIZE(msm_gpio_bindings);
+	pctrl->desc.custom_params = msm_gpio_bindings;
+#ifdef CONFIG_DEBUG_FS
+	pctrl->desc.custom_conf_items = msm_conf_items;
+#endif
 
 	ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
 					     pctrl, &pctrl->pctrl);

-- 
2.34.1

