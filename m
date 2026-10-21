Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592652;
	b=s0PsR3gwqQdQ5QzaisL00vazJsCBU7EsPowf+JhfLRUyJ0iHi0H7TGtumR2MMquFssSD
	 PSRDBJqcoE3XlXg6zr5K+NdGw5YFGlUaGMsIMbCS8J6/iQW36JY6ogAfyprBEOQrYTd/j
	 DEwdlTGXCWtjoBtKfLrhIo8teIo624t/d3dgGZcLRm7UY59CRej6bDCAPTxAxAj3H4Ysx
	 aVtVip3TqNGbcczDAxJ5lqwy/wB65PkIzaxe1LwaSGpdugESfQxuOAD3emy8TaYdA8hHy
	 SJhETS4WwoeVJiPsRnySsQmXwwMe5cRq54M6eaUEMftoqs/L2AQ1N6UhvVw/CMRUQmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
	b=t/97N8iNS/uzwBveIDdm52Wilo1IOibcXzlbNOOW9ONxwnRnfmqgla+oCbq8NXBgvEWm
	 fr6OLxcV53tXrg6GZybBDxtVm57eVEwamU0YioiBNrem55YsgnRUh9ENMghjRMIeCR8NM
	 aun+367GV0JFjx3jWeTgmVIfndCgmx8RkdnNVc5t9u16NkGtZJYOBVV7Y/XCWjXeglf8f
	 K7VN8L1Pu7nAth+D2EOZg04gYtI4NQdumUT0Y9W4DNeWQcoZ81wnsJSDKDtCMTsh2sHV6
	 mAOgRdd818POm69vYPzSrxKMcFLbVETFB/CM3m/TBmELUW2JzptV4nUP8BlBfdamhbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCvjqzBY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SL53nW4D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E1606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965E1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCvjqzBY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SL53nW4D
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEEnNC1932986
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sbf2G3yrxB/WPvimhAHZox
	oMp/kII+FrDEZzGcm5u+8=; b=HCvjqzBY35z/m/+gpGWlok+0616SZOhmSAwntX
	8p0j+35OBgvq0ZzmYwywD0CST/t/EHNNjCVW+zqgKogjR9kEmePVuomMpKplZYp0
	bWzWZmhN3qx8upZFTisjmnoHSxQxFta8VtiJBAP5asrmqk3wD/jBg0lDEkXEXnbE
	jBB3O72QBJ9vVmY6KmtJGbolEa2PFf6ruSsAO3r61bZd7UNxs9Bjx+hFn2/W+zpN
	/FwuPbYULFkYZL+2ANgfU4QG7VJXpjDsvQz9libolilGynR4go2PssJUexEkQpeP
	MC2dgn8U0vRVv4Rvbov629iyWV1KDRnUJ7/kzIBqpTSjj+9A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugx45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99063f4065eso166462241.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592650; x=1793197450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
        b=SL53nW4D9sgiVmY3FpfNglwNpC5Q0Q9dGI6szGIQ/1UaD1oknr08K/nj93AuP5hyyH
         0AkvDMnEn1fnUtQwOTvB7SMj6niMTLaXfQQjWdJ05lAO/z8Ct6yW+PltRXC2FScP2GmJ
         hkLMUrnEWb6uKdWC+ouAJ1lgA+jwSG6ubFXv5iMF50fgGEAP+RpuaL0rWKHiLPwl7q3l
         h5s4MFTiX3k7ggHSiKbZ2vfnTYIN34i2V+Wz/rHzMVVEP8MGKoT/ko4Lfc+tRvLoctOD
         kJ7aInYf3kwsbfsI+Bxxvi1koVK5rzX+P7pFHR1fsVstG7+6JV2JLuZtDX8ISAPtgrrC
         hSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592650; x=1793197450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
        b=st1mMjYq+M4hsqC98SKiaRCUof7f+CGwwS8Bf4CL1PDelFF6hWd987KvoFhwe+LJL3
         phiDmIEsqhvLAfROk99nkrqYoRSkTRRJ42tl6jyX3sfYd9vcklo2uy4jHJDmE1weGJG+
         hrbMIibywPzdml2XO8WnNcGBoi/4Bbv/1CIoRk0T2VAKGC/s73NtZiiWzPhQeDBfM5mw
         tgxTcMkk0TC0C4UoRpsnORIMbeZOq3Ck9CWlW21aMPhlLrl0WObbK0TwRLMC/gUexWoH
         uYaMEOjjqZ0Y05cjMI8maaP5aTqEneVV0VNmO0gO5D+KjUh9Aug7i67m6+/rLtCCWt/4
         GP0Q==
X-Forwarded-Encrypted: i=1; AKwUvBytwSwu46fLdJRLsg7rXqGcs8XbNrrzSkLT9qJ6qjNeLXrICY96VNnNO5thWSYejtDzKA600gf+5s9ANcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7oeBaGItQYccLBIr4Jll4x18tep+TFoaoXHbV/1wLot2dFY2J
	fXoKxVq37AfIGdxq8Dh82CWRizMAw9SexvSPAsaudB+kHfusaHdqTDSO9j2Pc5INZaz4kpMuNYJ
	uuEJ4el1UNOgKzw+2/tQm3Jj6c3kBDSaBl9+m3HC3cE3n/3OLBGbNcIPFt6KqFBEWPmDOkTtBTV
	M=
X-Gm-Gg: AYBFou0Hw0uCwQOH0Po8PIl6WYf/YPlV/aUp13ZgHKMhoOBIRfl9oK13GGxjiww5VDF
	GSTUW6ZLYfMQ6IMQZJNedxuI403WEZdjl+se6hLiDslzGcZlHPVRD3n7fkXWn9K7EtbzQsDhnm2
	7HQWs/vNpnlarlr2ZmduDpEKW2v27dgtIa4SRTihDghdt/CqxryQ9YxvkO3mD2idP35JBWMvHu/
	cK9AOZRG6hihBI3TsbqDnaT7gqtIF6LN0k8x837VLMO2YJtm7aMZ3KG8PuB2sfOsEbO0ug6gED2
	EQIxeXSOCSVvW+aLVtFkIQ8qpVFg7r/SMrNjExvdKGqP2qIb/6TqgXR2gN4e7zlYaDRGI19TuIK
	IZc0+hCJUDUGWnyuT6s7hu7R3licS
X-Received: by 2002:a05:6102:2c81:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc9263c60dmr877611137.15.1792592649566;
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
X-Received: by 2002:a05:6102:2c81:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc9263c60dmr877598137.15.1792592649043;
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Wed, 21 Oct 2026 16:23:58 +0200
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP7K2GoC/43NzU7DMAzA8VeZciZTnK+2O/EeiEMWO2vE1pSEF
 dDUdyfbAfVAKy6W/pb8840VypEKO+xuLNMUS0xDDfu0Y753w4l4xNpMCmlFJzt+GmPipXeZkIf
 PISHxc0pv15FTa21wdDRHJFbvx0whfj3sl9fafSwfKX8/Xk1w3/5HnYALbho0ugVAAvecStm/X
 93Zp8tlXwe745P8BUEI2AJlBTunhW2hAeX9CqgWIKgtUFVQG6M8uAZbEVZAvQT1FqgrKKVRDq0
 2Ae0KaBagFFugqWDQTmLwwnTY/AHO8/wDVr3zhg0CAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1KuafD+EQPH3mdB6XnrkI3RAJydayvPTvSwodVvmMGM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsCe0HAnTl2+WybK4TohjALathuCERDtpeJp
 QQPWJ10H/6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLAgAKCRAFnS7L/zaE
 w4spD/4wYvzXkDa/jMjCnPdbV1e8047b6IzaUbYz7M5LwoT1Zl5X3NhkGQLWf4QeV4QH4ccxiT7
 kQu4pQ1iLcUkRh5mxEYpwgMomsSB+8KD8kGCoMB4nCqXJW0luA6OfTQLpGfesC03Shn+2xfb6dQ
 JO5h+Uev+WofgkB1djtM45Ql3z7Ee6oFEkq6574LorpZPeFeXEZC/TPBHbD/e7hdhEyq4W+TI7b
 J3j+Se0hwPotuHK7adh2jQxn/tEDY2RLXL0905Tbi724eS1+RAGTI/NdYugPISIra9HCTBh1WAZ
 gNmubKxrqQLrO3RtvW25JTjIsVIYrTzfDl7wosjl3i4s/+12K06nm5vt0p3ZRl8V8kFxaEsnL6n
 TmEEzVVl5JIJhdUN9NJOimHI8lg6mMHO0TOvvlxHAj0MpPQBzEnQczfKNssRut0TrV9wu5UaA59
 ItEu/0n0iBDLE2sFY5TdIlxnxV+Lpm+QT4eywcxrlB7FHMi73MpHQfQtkz/F+otw0+SKSyfpWKT
 SOIYOwTSLjSYv1QCdizdl3on+18d8RTCIP1aT3DMMjRbBgzU//UTAkcSjI4IKvzz625jfgI3j9I
 a//UiyCQHZYk5Ef/PzUt+kDoRPEPqG3mv3MM52jUJlHiVMOwoolasYv2hZJAB/3FFNYvMwBVFwQ
 FK/G1W84Kv07KBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8cb0a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=CwMrYGdqEC8KazAlSEQA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX+4jERmORYIMV
 G8aQ3fBWyud0ykJmViSMEApiUd+4G+RvxQwhewhAomRF2oqRrgzikGlmg3BEFa7uWyYxdYW12Vh
 6htB7MPEvWPkRz020bvhseNISJ+DgCQ=
X-Proofpoint-GUID: 5yNKVlTVA_rxebKoK3-6XIwaDEb73H-t
X-Proofpoint-ORIG-GUID: 5yNKVlTVA_rxebKoK3-6XIwaDEb73H-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX56eTMJ+QKyqt
 RjLfSQ5ltJHLDp8RffjqIsj/5fTtKZlBkV0TDaqzmGFQhe74KIKsfnB+6ZgO2dbEF0uLUlR2V1P
 KIWkX92tdSoIK/V9EFIm3HP9mKmhTOqk+xsjAi0O5k25wjjKSugKb8ABDjuJpUOm5nXU+JqTe+p
 3VJoeN5tH3IpHgW5KETnKjB0arnQqfJu8J7A9aB5SpfG7bBXH/0F00DKg7tZcUQ+G3krY7fZv3x
 +mK5BWeiPH/wwSPShtoMJQMIln8BRtluaScte0Zhuxu0rK2W6w+a0F7M2wc+ODUdJZ5bE7CglGq
 H488ZTWPk1IkekbVPzBtizKJq0Vfj7LnPtjD5yyRLQb72pOTw0DW5TVtY7/Fx77DMv/9EBynMHi
 gsv6U4PAl2uhRaOVxmg9FPItGWZSGrdqIqsDZWwREC3tWqANSUr00IDy2CLJpmIUyG2xiUm7SnG
 3jVzEZWjtzZQZhhHFnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Add patches fixing the error path in shared proxy setup (sashiko)
- Link to v5: https://patch.msgid.link/20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com

Changes in v5:
- Drop fixes already applied upstream
- Check ref->proxy_dev for NULL before dereferencing it
- Assign ref->proxy_fwnode with the shared reference lock taken
- Don't return uninitialized ret from gpio_shared_make_proxy_dev()
- Simplify error handling in gpio_shared_make_proxy_dev()
- Link to v4: https://patch.msgid.link/20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com

Changes in v4:
- Fix arguments passed to ida_free() in error path
- Fix memory leak in error path
- Link to v3: https://patch.msgid.link/20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com

Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpio: shared: factor out per-entry teardown helper
      gpio: shared: factor out per-entry setup helper
      gpio: shared: unwind partial failures in gpiochip_setup_shared()
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 300 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib-shared.h |  15 +--
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 181 insertions(+), 154 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

