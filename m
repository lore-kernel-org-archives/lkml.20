Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584830;
	b=tdRHuMlJXcFWdl9xX1vGqWGtj57XMEsoV2et5D0V7Yq5dpTvJodc+xt/gJtComexGbUa
	 qrpT6mv6ynY6ths/2qTL2OTVUaSeiW2Iea+2UlrS4+x/PP0jXSsLklL1fBWZqm5C3zhsf
	 JQ5katgcp1YUcz8YtzuLCSGOrhNdfH7VY84EiT/06EOU+Dh87zcyUyLHDhltaWNqfrrAJ
	 nxLGGPC9YGePXEJxEgBiNgazWd+5QHhgwh3t6L1EUStJbtfQu10PNh9WiO/BGkh4di32c
	 YSTMlKXFZhBteFqws49gnffhNCO7+p8dO4FSmgs3bNyAmTCKEABRY0pTcYiy0HiqJrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LhvoIjPwf8qgSokp0XPAMhIk3AI3O12ul9x+XjikETM=;
	b=z74MbAUAUu1n0DQIzwyU2NreQVbkAwD8g0Htavebs/nMPassT/YLni5s+4oS1untsiJ0
	 VAF6uBTrUCfj8gBmBA/NYMTWBem6Anb8WCzNWqkAy2JwSTiY6ze+sl5OlZeoQEt4hrrfQ
	 VCsL6upa1g1BH7e9Oa9cdtAg+3SKET7ipu8CYqpinHRhx9bjTNEZw6M57kH4JNsl8OkOU
	 JAIzhnSBP3SXipMbjuNatMCSgq2PWQgdNVkEW6cUuh+Mbh1ZkBCI9Y7lnGuAnZC2tpaw3
	 GplDghqpw9GAdCFFrRzRZ8B74L2A5ko4BPx04qqXXvRPZ722Gs2R0XlQlezRcPALeDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CXdqUjNd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uygw0GpC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B7606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3B7606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CXdqUjNd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uygw0GpC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRb1L2638613
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LhvoIjPwf8qgSokp0XPAMh
	Ik3AI3O12ul9x+XjikETM=; b=CXdqUjNdwxfkESc6nmWW9DKUrkFP4+VWDxMyIT
	5zzkDzxJlvdNGzHXqnGzmZ00HYGZit8pVYaM0vt741QDL2k70Tojlp72dbAANGqs
	wiy8BWIYlEoRmlzBTPoGDwizSxMEWU9tuHtAXkjNuKqkmTU+sjVWQPAoBptzXTyJ
	/5DNwvl4TO/BmJ8Ljd7MVy6JFGHypREnTuPgghIGuirod6Q2Whauhbae56WMq3Gv
	+HSYrZrsmBfXXAtmmDDb64gRmMO91Ermzbwlsq5op84HwqWYIQPME2Oo8SSwK93b
	zHTDm3LbTUtLXEt7vennFsueax088RWq2ATKTaAj2lwKlCqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9wn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so122801485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584827; x=1795189627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LhvoIjPwf8qgSokp0XPAMhIk3AI3O12ul9x+XjikETM=;
        b=Uygw0GpCYYXyTg+C51cVM166KOnBOyByo4d9miMO8nK5amviyccPWpqfko32don7iF
         k2RE9Cq2+MTaY/BOWPOPqbB4CNEPi34wCj/MWuzRO0tTEXKwYhWhtrHNMGhho3p8sUbR
         QFiD4jBCPXUcBVn2zN0U8HNdUpIrTa2MLSe+lDdFsy5McWzbeXIJXyHC4oNM5El9OrTU
         TwRK7XX7CAm+/RDTHGZ6gICnXKKPYwPigw+2ewdzCStCwLfaZBq0rRVm6i+1yqMFvc8x
         LKQWKqn9tmK7XiIFTG7PRCT1tpKMRd54z979xDdjqLPjRsul7z6P3/ehE4ZVlgFIjCwr
         521A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584827; x=1795189627;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhvoIjPwf8qgSokp0XPAMhIk3AI3O12ul9x+XjikETM=;
        b=jE0/kbTCbZdsBhlOP3zL5FMNHATT6LmpalXnKSj0QKb79bclmMVBOLeG10RX3gQSpA
         hnb6AC6xvQbPUdP8KS9cjaTCqGJqhPJWb4ff/mGYi7BwAY30PCdauYg2HKxxShBoaBVd
         +SBJs+hQUAvIuKsTgL/muhCJVqKXrGwFlMlskhGke1NROFHf59mtvJc4RzF+kppqO3/r
         ktY6KB3bqZqo2SH1flmQO0LzZumHXXxqrM7oQMEYEJGYvXYw5Gh4IFbJnL2sOJFB7vFH
         aHOOvjWgpYi8lSEAYKSzvvIdCfmchMjgdtlBqCrxKU81y43FSjI8XVKS4vNoNoLeoiRC
         uUTA==
X-Forwarded-Encrypted: i=1; AL+hErEWwzmqcQUekwFm4OSp3RDwiC15OsY8F23/YPLQSixFcQaIWSbLeZl4qIQTn2wx0DdS6zqtP4gxcAP+Q70=@vger.kernel.org
X-Gm-Message-State: APuU4Z+opF2NgQR5v6bogyNx0hTo7Wb1h2pnj6VC4h8831FMTj+2jTdf
	HWIBz4nGYIPPBvBZENljoa3951d1mp6ixwkmuCdwAoukaDycHVns96r7flz3LydREUlELZYJ+Xy
	nhXOP81kP5sFlBMF1q7K64B4S+rmsyTlEvrVN87QsqUCMZIcuuS9HsA5axjuVEoomxig=
X-Gm-Gg: AYBFou3JERTkgPnIwcpZ/PDhX23OUbyO1NMpeJ6Ml/PJHaBs67lHFL5dWMKxPbrSjGW
	sNUI+cPyLnLAvrC0PLvpQIQJAwwrVLgE5y5siSGQahOj05Q44A24AA9nlPWgKqCslGc8eUe1bAo
	lFHugbAOszqYlUc5s7tXdXP0JdohwqGzPRUYJg9kFLPjZTAEhA3XVpI0XRAMZRnYbNygf2/R2Ph
	YT/FIbuQsfW9oBRm2hn9hKQP+q57easAFtjR4D/TxhAKabfWv8bKTnuH4wkmmF6m2ZvbNmhj+2U
	9u2fNH4jAUM1SZzt6QwuAiT9kdOS+bcLmiQMLujQE5fHuXrpnzw8psDIJEX5ar9u2j2DTXKCyGz
	z9HXblHR2C6Mfu+nHyZCee6iAYe2+IP25rw2ayUMn47YVdgdJ3e/z45B1WNGQPB5m3bGR0SZx5H
	lvdA==
X-Received: by 2002:a05:620a:4448:b0:949:3017:1f91 with SMTP id af79cd13be357-9494bc117f3mr479649885a.48.1794584827190;
        Fri, 13 Nov 2026 07:47:07 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:949:3017:1f91 with SMTP id af79cd13be357-9494bc117f3mr479643985a.48.1794584826652;
        Fri, 13 Nov 2026 07:47:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/10] gpio: make gpiolib-shared more fwnode-centric
Date: Fri, 13 Nov 2026 16:47:00 +0100
Message-Id: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPUw92oC/22PwW7DIBBEf8XiXBAQimMrqvIfVQ4ULzaqDc5CX
 FdR/r3Yvvay0qxm580+SQL0kEhbPQnC4pOPoQj5VhE7mNAD9V3RRHKpeSM0dT8hdkBdRArGDnT
 GONOuNto1HOrT6UzK6Yzg/LrHft6KHnzKEX93yiK27R4oBFf/By6CcqpBnh0IW0urrjEldn+Y0
 cZpYmWQ2+sAIdwfpXY+aOTLJKCbyee2CrBmepCE3IpNkJLZn2qri40LIBN1o95rpRrNep+ZGdf
 rN2CAkUXsPwrm9QdzGO/QJQEAAA==
X-Change-ID: 20260916-fwnode-for-each-prop-d7a6f90e7338
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3990;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pLIlI74EKk0YI7MaPzy0iJBswk4SNJ2VXVWpc/TRWOw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD2JMfefMzgqf2gQI9HjEGkS03S9cU/+15NM
 rjVlFW/aLKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9gAKCRAFnS7L/zaE
 wxq6D/4xjxqWZq/YBLoZmFR+/rPVSoOwX8rkCks6n/OX3Jp78z4FF2adFhLx8bJ85Oku2/BISm2
 m0RUgQdn75xNST+tnoX5HcmYJUf9nUSGKP3T+L8P3rrEs5OnL4TKmPZXyNVtEq061edragWxV2D
 vfxLRfqfi7lKeG/PbEZcXRjHi2UqY9D1mMiU8me0zhg0ImJaediNulfKFjUF1Y73AeuvZmR6i4w
 Gob+FXXfoBEnFp95jPNEvvHRYhXdIR8SHZpbFIeO/7mADCMgnvCQSMd8jWyGUh6RieF4V88REBA
 hHtGU63S6UYK2MkpWdLHPPnopb0XTokOHJilHGLzNiyAEgmpIrtDjBMEN7VzbYz62y0cB9P1+xR
 x7uTqVCf9uwwCd40S53BeI0oxF4V3QJzlN2E2+zZaIsogr8xdBTnJhJe0VGPqNAan07bORhfS1q
 VaiuWXjNCRTflQk8sZN1TTPvDbb+AdUFBQl2NRiZLmicOVRCTVQspSV9zguDKhOa5BP/cZan7Ix
 H41ArOd4d//xYhalyUpxpFArnnmtHBX5/+4QSfi61MxWo1vukSRKdmbH79qduBXtA5ICXeCG8th
 dCpmdUvPCMKmQd7XdDLog0WiuOIYXKYStd3asW/exPaOEffaSzlDW839ujQevrvVhUZgOELL53A
 0wFciXGXz9Avuxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX3h2OWL7BHFA9
 9OLjQRIH0cZUuqYW3W0kLt1JqWz/wfM9D3aIFTKdhfxLsYHJTf2OCn6i0hV3gh6HU35qTnIqkaB
 HfTl23dDH5vXrrik2i1vIEMHA16DbbReI6aEAuHO0s4se1WSUdwS/UtA0xCak5QHeJie9w/2T3+
 0acD7t8IL39bzkKcx5fHvpRA84o60XebrslDyJ0/FYO3mlwLRNchyoFFHy5Ip0esvzLGp2jgF3B
 OCF2JUcRbgfSnwlMHdOMuWVH0h0fPUcEak9FHiVHxA10qknPEfEXUGAOuPLzXo/rLfQWEY2fjhB
 3QO8z/WVIQbX34giFi0eAuqEM/COgGJagpTt+GXZMWoe7rt7ep7EdJomMHgSwTXIseO2646BjZw
 nK5be/C6unMyaBqO9NAtlCKYSm4lnk4uluS3UiiY2rTwKj9YrR0wI8wqoe7fQpzS3gMPefN+eE0
 RtUmIQ/rY3u/uzXQsGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX1xo1xjHhMtkN
 3qc1Uld8x288366UiKaemwMMHvzo0Vq6PVo7x5zevqdcHNfh2nL2QC/PrIO8S9NGqGXT9TgeEEQ
 T5FBhGr6USnEbm1yk6P/XKDdF6+3f/g=
X-Proofpoint-ORIG-GUID: Vjm4pjQeFr5edn1rSAZUQ9Ll3PBs1XDA
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af730fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sw4_LmjLfTFoMrZgmVIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Vjm4pjQeFr5edn1rSAZUQ9Ll3PBs1XDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Currently the code in gpiolib-shared.c only supports OF nodes and uses a
lot of OF-specific APIs. This series attempts to make the code more
generic, ahead of extending support for sharing GPIOs to other types of
firmware nodes, by defining two new fwnode operations, implementing them
for OF nodes and using them in GPIOLIB in order to limit the OF-specific
API usage to only a few places guarded by ifdefs.

The new fwnode APIs are:
a) property_get_names() - this closes the gap between OF nodes and
   fwnodes: OF nodes allow users to iterate over all properties while
   fwnodes don't advertise all properties in any way at the moment
b) count_references() - there's currently no way of counting references
   in an fwnode reliably: using fwnode_property_get_reference_args()
   does not work for empty references (e.g.: phandle = <0>, <&foo 1 2>;)

The first patch adds a CLASS() for string arrays. The following 6 define
and implement new fwnode operations. The final patch generalizes the code
in gpiolib-shared.c.

Merging strategy: patches 1-8 should go through the driver core tree and
be provided on an immutable branch to me so that I can pull it and queue
the final 2 patches via the GPIO tree.

This series depends on the series from Alejandro Colomar adding
strprefix() as indicated in the b4 tracking.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Integrate the series from from Alejandro Colomar adding strprefix() into
  this series as a b4 dependency
- Reuse the existing struct strarray in the new CLASS() for string
  arrays
- Make sure that props != NULL in fwnode_property_get_names()
- Replace string.h with string_helpers.h instead of including both
- Tweak the kerneldocs (Andy)
- Use size_add() from overflow.h
- Mark gpio_shared_fwnode_traverse() as __maybe_unused for !CONFIG_OF
- Return early in the OF variant of fwnode_property_get_names() if no
  properties are defined
- Add commit removing unused leftover code
- Remove useless alias variables
- Link to v1: https://patch.msgid.link/20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com

---
Bartosz Golaszewski (10):
      lib: string_helpers: export and rename struct strarray
      lib: string_helpers: implement a CLASS() for string arrays
      fwnode: define the property_get_names() operation
      device property: provide fwnode_property_get_names()
      of: property: implement the .property_get_names() fwnode operation
      fwnode: define the count_references() fwnode operation
      device property: provide fwnode_property_count_references()
      of: property: implement the count_references() fwnode operation
      gpio: shared: removed unused field from struct gpio_shared_entry
      gpio: shared: generalize most code to firmware nodes

 drivers/base/property.c        | 115 +++++++++++++++++++-
 drivers/gpio/gpiolib-shared.c  | 242 ++++++++++++++++++++++-------------------
 drivers/of/property.c          |  41 ++++++-
 include/linux/fwnode.h         |  15 +++
 include/linux/property.h       |   4 +
 include/linux/string_helpers.h |  12 ++
 lib/string_helpers.c           |   9 +-
 7 files changed, 315 insertions(+), 123 deletions(-)
---
base-commit: 161837d37055642b03475137461d4438c65dbddf
change-id: 20260916-fwnode-for-each-prop-d7a6f90e7338
prerequisite-message-id: <cover.1794574496.git.alx@kernel.org>
prerequisite-patch-id: 6c8ea11afdfadea1c72457e460596f9140195f8a
prerequisite-patch-id: 81834766a605fc75e62501a8459944c87aa7848e
prerequisite-patch-id: 49110713d1b10ae2972ae738da383215d9be001b
prerequisite-patch-id: 97bf1ce8e594218715d5df30711d0523c7f07bc5
prerequisite-patch-id: c94cdf0377763fbdcb942add8a058161503f9024
prerequisite-patch-id: d0e6af689d680619ee07aabb50635328052bc9af
prerequisite-patch-id: 1006c25c87a8e46129fdba68822b9592c3f5e0e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

