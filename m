Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264527;
	b=natPZa3uhMN3hLR99x1eaTbWJXWWaiZSoCQ1KxXo3DzuSWN9yZ4CR7CRIH6PHoBXYaOH
	 LJDOH7YrU8OWXAvcqkOyRnQqGZxirhwzjOAVLvmxMX9Zob2j2KjABfKhtV3UAX17KhXhV
	 ZmpSMF/gy4jVY4clx0Ov0iV92gkN93/p/35pkqGheM6VNJ/dvDixKaZqmxCg0F5LbKRS0
	 lER16vudSV5akZPIqxq9Ir4zcVWewM1RXmhTOjbOzyHltEiVYpV91/JbEFYOTJZP1nfDS
	 qIy4CMHZWIJlGjVp/Jrb/3tXb5dt5a17dtySNLIYQ39eXXowhW6bRhrAoAYwO600UTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
	b=vMNXdJnunMZkZr7ie7Hs4VwhjqIJwX+Bx0IC9frFpn0zY+7hKrLtmcz9NxNBvQ+1tyWS
	 isogA8CLjMVgK5ISiYLdHMHf/2uv4ILf6MZqivH+iFX5NupchRB6WlHQxmO6g283MXFBR
	 y8eq516jWX+DgTYCLFLIWfM5D5MxxMeOiNHtxWbrb02VJxhK92UkTR3TES8zi6NoJi/Av
	 7iNwD0TyyEf6oIBMcjoXNBBb6LKC2i3HLau5mh4hc2uqLuWrdQRoA7lFi5TXCNYVnLfIE
	 /ssVZvGTOMXu9+2Up32GVFT5AX8t0B+nfdeh/fCEN8zHpVFjtaBRkWZBxbIcG+70hXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WySbZcI+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O3j8TvM5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BF606A334
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475BF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WySbZcI+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O3j8TvM5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v8ZB2725018
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=; b=WySbZcI+8afrzpQk
	ML1Y7Q7bN5nEfvXGA+Jj9n5kryGtvJzhklTEoJVHe9P3fQDJ7mfXqurHBecdUlbH
	D+k5LTwoBKvoxsmkU5GB46KyyPJJO/M3ojDgXutVYOZoB2YHNk+9nmGpRstkV1uK
	GMd2sS3+bz2POenyn4tgd0abhzKcwZYnRWcwL7iBToTEMF5ong3kIRi6GsjIq0Jy
	71lUD9JiNcV+Id8yAU4cwEcsdY33BV0ipLrjcJhVppUQrJLH7UEUzvdV06jvBwGT
	EG8i9WuymuT2CS5nUdSPVg9HrROSD/EItOcs9SLfpx8BrrIxGGoexZy8dEoWP8qX
	5KJf8A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8wdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1170697a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264525; x=1793869325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=O3j8TvM5AR7F0cqFa63ne+xcbRkMS6bCkiTCtn6GyUDs9NW2H6rsA1OFNJFObkX43i
         GVTj7DhRtP5l8dqNh1lDOUdmCon7q01CP0PvH6IgduNAuUE97pRGWFdkfg4DRW+KWiza
         jSxs8wW1SC3sHW2hjUls7mYDDTKWhlD0Uw1bfklbw8/TmcctyHfEtvioSrxbiGf4h4XC
         ejAqDSXDch1Mw0E+XUi2+jeH7+9bbPNvrmDklor3ue0OZx5/R0VUY6leGIKLsfWSO/ST
         sJMkLpLdAJM8AFGVAf1Fod6LXx70aW9k7S+c0D8EC2OSnf4PqMLVpkjKRb2zw5dMZylh
         dJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264525; x=1793869325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=Fca05XPWPaVKiGFaEbAaB+lLgGbNmrVzMB+ehHx0wuZjPE1kRPUISEZy/L1UierXLS
         lwcJ61JbADTczMw5HLr9d75P+OXRj5qHEJMtXHvFJXt99IZFTZT6GX6aIpv9jE4JT4Az
         Jht3WZp4NyE5UZn/Am323ewQPv2df42wnow9UKEVgCfnCC4Jrpl3xFXGevAz7MnHVOsu
         VSXoomhHwwoYqEE3coVMCWNlUED/O6TdLGTdIdH+Ko8sYpOuSdymOzFOg2rJ69Jr8H7e
         6Wm16defJxYcbZRj0GT3WHSY82uuInvnKX12fVWHQZHo0Lg2y9h7E6laLOpd2qZiELQY
         qoSA==
X-Forwarded-Encrypted: i=1; AKwUvBycnHpn0W6jnbXUEwH90DiN3AIn/lK0jE3kh/vYc1DP2oLSxeyn2TnR3k51Y8jn5zVwMUWBN8UWJq4gNfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8oiN5W5j+NGN9mXiOabEWROMCRkpMz9J+Po0IjEwIMtWq9T05
	u+jFTuVyEIP/UWEZuJTm4bkeRkQxf5xJw8rkX70zXQh0JTtneGSTAOlXmXehAJEaIpwvr2hWqSn
	DF3eVxT70qrJ3hNSULFdlbICyQDRQtl3QAmB6QIyNb1ivdaGkaQPCAAMaxwfAuSZaj3o=
X-Gm-Gg: AYBFou0RMbR5WbAiuSulgt8/Ed62U3H+52erl5qWUVN6ER+KM5bsXp6qqzxPpjobEzS
	8nGPFfPkeKUqo9PmbG8wQQEezSLK2UAsPd9sZ56a5u7MGBc2jaSRxFiboIkR9QCcIL6+VB2fJ9B
	Oap7tq4Lbd02XdDP+QLUDvN5uXixlraDLv3ZzkqTIi3aaFFqCwoNkXCH4nxuOsEsbiZts7suII/
	CPTo7Tpg3VndtvWBk+vhgcS5YP2BZpJc/1o8/8xskPnh4+iHSJcMUZtt1Mx/OM6zO+MXPSdAAqE
	obC7U8OVFeQXCDNev7s9nXB/8V0EjTdkXd/FocF4pjlX3e+sVwy4O7a065vLFJy9/dPM8tEldnq
	+B4v+hAxSqntLCI7KowhUfIuNv/1Ue2OOqZYNMramDTaY3p2Bb7fMFEUBTNldOo5SgH95+LU85d
	nHJnxGj9mD
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869166a91.46.1793264523888;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869128a91.46.1793264523384;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:59 +0530
Subject: [PATCH v27 05/10] dt-bindings: arm: Document reboot mode magic
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-5-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=3109;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Cocw8yqxYsC8f+LcKoCIzML/tmVX3vxCTN78aew4Vgg=;
 b=CndWAYSCONDUqL9nIiAiDUAvZM2ja3u7IKu76ZeNE5zbHXufpIJ6xe2m/zsaMxyDqVINOzfbE
 TQ6JqtfIfTAB32c1gOkFYjPzY3i2fxEW1DztsF9Q+t+7i/D9Ommnj0f
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX0JlLWgQ+lHsk
 3u8WexV/ctFB5AtZ1sWf6cJjC6Bzp017EG7pxJCS+lTW/9WiUfPSYxo24QqsVl+bhlp5krueSCs
 XEzrIPIG8VIHDmibZ9pwt5AODXBWlay759+3cgHq+WbFP8cUnqrbdXnMS2YLTs6c/1hvLu001v1
 zdtaUyyI10o8AvgQyXaJz8T3RXAi97FpPgKpd/O0Mp3UdRTF+bQsQ3CL6yjtn95jPw1Qxi2+gxJ
 BzqIzwTDe+/LPpEPXAcD6qkD06eUJjGtkRdj6CunxwL7Hqb8OorzNqV/No85JsaUVmeT2FJrDMZ
 4NfHf2Fio1zbGIIuOsyOW6Ifur7N3MYulqRHl+994CWbJfh7ZHkslEGthxHM7BPKiHF/wS/1xib
 ZZAHCI8LobcfjKWSViA4hmOETN/pgJXo5bm7t/H6fWrzFds3jao7GdNTB1X87aSkskgx0n+v2+a
 hvLm+bGQ2WGGOnqK/Og==
X-Proofpoint-ORIG-GUID: iC0FdEwdrgURAmnyK2_RGwbXiL3MLDJp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX5qm2dbEv3Owg
 T0q2Lzrds/yGKab6wwlTz4lZbzTeOEMduz8MD73ks6S/MzL+E3TxR1qhvs2oAjjBwie29akJ2NZ
 gkhySq472XgUcY152/5JWSiHWxxK/QQ=
X-Proofpoint-GUID: iC0FdEwdrgURAmnyK2_RGwbXiL3MLDJp
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae30b8e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZjyxHfqtAiH8XHGUigUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..82ae25e7a338 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +170,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +302,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

