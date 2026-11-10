Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304877;
	b=AYn42H6+h7XKQMwAD+XjTAOJymAupRfOcf0BzF5a4k06s/J3/ZPCHxBrdTkln1I1YP1L
	 IJVaWsrRohem3TphQsObBF2Y5wttksGAO4bdCkRhG0j+ayHaIjq6QHEO4IRfFzB4AXi7g
	 Hv1OpjZwb4npCXreDlw2oAUn4Jgc5smeRMjgq7BVCQHHdopEcHaiC+gZygIOBTuws8oMM
	 EFoZZyzEs6L66eF7mbL4Yi1n2/yu3D0qmSwtp8amyUCDJVbN2wVDYdok6h9vm6rxETFa7
	 AeP+fX3iWplgW63B5zpsRTqPApYvMnDMaSBku7MklPwpWobsdGNUdrVSWN2VqVYtb7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tZFpc/WkJMO9wikzVpCrn1g7Bbk+kpMUXbvDudScemM=;
	b=PCIh1c7ZT1l9MmEonS4zxs8gEzzhXJr4Dd1g1wpp4ZrOoGJW1shzeoQX2t3fpjq9xvtg
	 VP0OcUjGEa1tgKxp7IB2E/KegS3WFgKWy9KvM3eUvHCVcM37/C7+zhsZykHN10p3MZEXw
	 JNh6zkDnob7HPK+xlIj3/6E/4wi3K5B9tqlQ53eddbmDMYSgKpkbt1kAcQ9EWJamPCTot
	 l58FNYup+91u8QrocYEp5Zn8faCwGa57aWercgx8mIwcRY9ku2m8h7Lk7JoEZk/TbXihq
	 4pqJBNud3cB4m47cLCgZNLidPa8i354/uZ6Ym2Y6bXZhJTJouI60s0WC//GGRCcL7Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWEIKgPU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnIlr7x8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655760A2614
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2655760A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWEIKgPU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnIlr7x8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l48e1154995
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tZFpc/WkJMO9wikzVpCrn1
	g7Bbk+kpMUXbvDudScemM=; b=KWEIKgPUzPqZa7IlXVpBuHgmrNM6zSxuRhm0PW
	8vweXNxBn1LrryqNnsraBaKJKIRWzxYfit10cE9hkr+DkR1QzgqdhigW5oNIN+Nn
	DZWfsy/TCDi+cgRHele+/CAvPJlbp91Iz3NeK8f+0rEHrX6L0OjGuQaMyfwNQ8bc
	sYgxZQ6wXZ1cAdgI62H0EmiUul5PsEiN3UEfnjHm4KVMliS0Z3PS/J8/E+XIbfPc
	IEfzWbep4Fr9DipxUclVrpXEmPk0EF9aPLtGmxUCYqXthFGgCaUNo/qDgffmEbXA
	xRaWAZ9GXMmsKER/crHL9TluLT7ADm/FOMNBGzPREALgO9Wg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49k6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d12c666eso389954137.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304875; x=1794909675; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZFpc/WkJMO9wikzVpCrn1g7Bbk+kpMUXbvDudScemM=;
        b=jnIlr7x8+rR6YtmaFc010dp2hNyxjv/aFI98ItO5EK6BeG9RHobc2pDMhkM12Jv1u3
         PnzrwgmcIJGypmubT+XnoPvOYy5ZBibXHIZHaqKzxJl7usxuqNMNiK5/r4phHA2xmFjf
         walrvHvPcgpstIUeEJJCZBe1vZfZ01ojWlEMwX0ZC3tRvvk1ZC40eaK3SE9q8gzFsKqF
         A6malFBtREX3bxFjTigSepTBrOu6/KXcheoDmIYgbOb5GLdwKY9qCqiaNMuw8RDwhC7B
         LRBmdQMYRyU2T+tAJ5eT+5QaimPTKR8+1CKnD7rYm5TPC4jSvweB9377xDsX2QJVjFEt
         XZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304875; x=1794909675;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZFpc/WkJMO9wikzVpCrn1g7Bbk+kpMUXbvDudScemM=;
        b=i51ihX/wFU8UqxTa3CEmwVqdy5vftRXvlynyBuP/58+01PzSrfpCdr1OjCwSvrfFti
         i0CAOytTtqeFPKaG1im9gYWOxGKTyCO02XzCxoUaqgYu9hOgEc+xyKdrAEl0BKixnBn7
         BxAG/s8xz53yniWW8uTwsckbXnO2VhPydNCEDVJ5fJVLskbPCI2xhGS8a51vmcndM3GA
         VBWyQORoO/jB+1p4b3/Lu0qwJqF+6SWcSasEYYqaCRBl1Mj+vMMWgL6zfRZv6XLG9ejR
         X1KduupqeKKj3MMgfCgHUM/rxSFLA+7mZ1nJ4XLqRYT5/IdvMNAmBEoTW6Wt8X88r4vv
         d73Q==
X-Forwarded-Encrypted: i=1; AL+hErE1rMlzQRXt9ZAp2GTCsxUnFY6K3R39eMXEtWO3OXhw2XXCk87h/hxYlBinbs+8FEFnSI5QoQ/fGT1ThtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uYq+19xycNgY/Zj5UVaXTQVCYQmF4kvqespgXS4Sjof2wtHAT
	O+6hIsXsfjmnM16MmgLo9a4kxDaAvTmh3lUErn1RiCDlC4uIJ1tpjOSvPlu0AbCBIi5e5JEEOZ4
	iu+c1/xB4Dv7lH9SR3FQ2CxynptRDfYei5gmwxf9LJ3JoKblVwsZpwRL/DDqTNDiq238=
X-Gm-Gg: AYBFou2NvOaM875JlFbpgnSvjFk1Wxzcgil+WvzJWk6jmRuEnqnUVZ0hegA9cZ3688l
	oZZA7ERwaT7L0G64UHT8aFXWVH4xPCK9DfOJvNMQs62Zf4BX0uSt5iN0OcbWGGTBotKNCgVpXmN
	Mi+ko97TfB39+2vo40jaSpwIL+mlLy66Moi87CTY16Kl8EyczPAtNpxlzKD8JhuVWXrfSvN/P+M
	70kdkco9u7Xkz/jaEJPB0+NPUezB3dQDEvzSUczyfrIGshxkJ3T2QeSGMIOQANZ+UQIzM9KlImH
	+kJzCx6Ma3QYRFdu1gMB634mVAO1kO05n4DabRU3RYP9m4Snwww5D589b41/ckrovihCYD4fY/v
	P98V+j9n2xQS4Bcr8dhBOZLdQcRV3TiH+EbLQdQkYDR6TP9cTKtjBIbwUUMCWpbXPG/yrdDX5+Q
	mzWRZ1ED67X0b/+M+XLPjCktlVrrJKTwGH9JBDeWFjgWB4d5eVVqX0ZTjZlKt1DYk=
X-Received: by 2002:a67:e706:0:b0:7c3:9daf:f949 with SMTP id ada2fe7eead31-7d301c09231mr582039137.30.1794304874961;
        Tue, 10 Nov 2026 02:01:14 -0800 (PST)
X-Received: by 2002:a67:e706:0:b0:7c3:9daf:f949 with SMTP id ada2fe7eead31-7d301c09231mr582034137.30.1794304874388;
        Tue, 10 Nov 2026 02:01:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm62237715e9.1.2026.11.10.02.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:01:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:01:10 +0100
Subject: [PATCH v2] gpiolib: fix stack out-of-bounds access in
 gpiochip_add_hog()
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
Message-Id: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGXr8moC/42NQQ6CMBBFr0Jm7RAGaQmuvIdhUWqBieBgC0RDu
 LuVE7j5yfvJf3+D4Dy7AJdkA+9WDizPCPkpAdubZ+eQ75Ehz3JNlCnsJpaBG+ylwzAb+0Ar3i/
 THIdYnKnRRemMUhqiYvKu5fehv9WRew6z+M/xttKv/VO8EhKaojRtZRVVWl0lhPS1mMHKOKYxo
 N73/Qui5ZMzzwAAAA==
X-Change-ID: 20261105-gpiolib-hog-stack-corruption-431b647ea556
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2554;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v/8X3F8vcqvN5Gf9Fy76dzQlU9NwDR0+nvzxjnY/wHE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8utoMgN6tcgZ9HyTE1Rqqepa8AIQhBKooR35c
 jOZjVKqJdSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavLraAAKCRAFnS7L/zaE
 w6caD/9N3J6gWlPGfFR35AFO9PXblHaJnryYPrqM8XEwwAbXM+UvFVllzkTmbBQIXGBoEJGqz51
 MJGZ+Z/mVhS0Sk5vHgJHCHfoE2m2EA3P8nWIJ3H9yaw4cLXJNIcgJBeUQoyXgT5Lbj4cSxSS0MM
 d97/agdhWd/Tr53U9yD4weX1W+yPo9ZoJfH4Mq6f3hs7PC0eDOwlVf2FfcNrUr3wuydqYhdK0nm
 6wu2N+bFcNHFSNFtAA0n7Y0VfgJxWGQNPoAydVmU+qcio66PqJLduaKJVh/DKtGi4s+gaRn1F3Z
 gHFLbP1CWPN/0hzrfNc4s4UquUszPq1Bk05WwgXHozpke4iBBFmihaMKDPxcWeCoW3K+y+Hf3vr
 4rT/Zkbq//6L0VXofN4DeLT85DtVZ6MkNxxRF/G4Tae3NGen7X18sOJrL3LYUzremWIVbumFsME
 3nvnkHPDB0mZ8GtsMIyIR8sx+iy1LXcHOBxiFJB/rautgDGTv6jaaxVjwcSrvquABlCSZ59/j+x
 GFuNShbbSzxwaJh2CNcNYtYmXCNwIUi1Sz49h3m2rvRb+TKy7BVMnKIMMJhIZLDP8BT/IYYV6Do
 y2CRmDFI1N4vxKRtQjKCHMGbQANriue3xu96KOJjEjFyvmqvVgDS09sAdoMZBCO9lD1UMsXOH8M
 UVClq9i/nvcsoxQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXxcjLPr8IyiK5
 AsZwhwMYpottSbERajRYZckfo0GcnjX3sfrtGL1ahdiDn2GN62B5W9qFhKUEIKvHZtQwRvM5M2k
 gjsRPr2TInOV9Y55r9imYivw8MFyjR0=
X-Proofpoint-ORIG-GUID: fsrBJseK2pf7rYyXCi5LU5aIP94C3qNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX0spH2YxUQYjy
 GUjNyEsdiXKSVv0fsBd7fwIWZDDbVaP4smWD4PW3Iv1krQ3HQs4xeNfdjf6HpJgJt4VWQ0pVJY2
 t5rdAkQSVGWeBvUR9UHP8SUSSP9lKvys6J5obsjA5ELeFG3oyl9WbNig/E32kRKv6wZsx9FyHCe
 hSFc3DD2tbLeeHVj7NUYvE5ASd3SFQx/wCcPOXcnzx39vVcCyNoGv76xK0lfA+ohIWcm6sNu62w
 z742o16D6rjY/TIyFEnfzYq8aScJXgf/F3bGYc5ZheXEKTrf34XuegTHRNCHL4JRwDoAra18yfl
 mx8Z976vA3esHB8meAiGEic4zubsBFTUP7rhT7qlPF2kLyrIHfgaMefTJkZlIBxOTqyZP60Kd7r
 Slncq9pWOkT3BQjT1s14/kQUA0e3h/nocZ0pBnCbacai+txNGjwSVuMezFGw9fy9o6eFZEc65Jt
 KN81/NH2x4gbOSblHlg==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2eb6c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5PSmYxW4pD4NZdMEaB0A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: fsrBJseK2pf7rYyXCi5LU5aIP94C3qNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

In gpiochip_add_hog(), parsing a device tree with an excessively large
"#gpio-cells" property causes a stack out-of-bounds write when populating
the GPIO specification.

The value read from #gpio-cells is used to copy the values into right
places in struct fwnode_reference_args but that struct's args field is
an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
make the loop write past the end of that array.

If #gpio-cells is 0, we can trigger a divide-by-zero later when
calculating the actual number of hogs.

If #gpio-cells is 1, we can also perform an out-of-bounds read of
the "gpios" array.

Reject #gpio-cells larger than NR_FWNODE_REFERENCE_ARGS, lower than 1
and make sure #gpio-cells is larger than 1 before checking the
active-low flag.

Cc: stable@vger.kernel.org
Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Closes: https://sashiko.dev/#/bug/linux-fdec1c0e-c6e3-4eb6-8746-d68a3f951374
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix a potential divide-by-zero bug too (sashiko)
- Fix an off-by-one bug for #gpio-cells == 1
- Link to v1: https://patch.msgid.link/20261105-gpiolib-hog-stack-corruption-v1-1-a47af9c51965@oss.qualcomm.com
---
 drivers/gpio/gpiolib.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9282d9874e1109b7f030a3e83598ad016c2bf629..a11e65be476142e082ce76ffd2788c3cbe82d08f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -986,6 +986,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
 	if (ret && is_of_node(fwnode))
 		return ret;
+	if (cells < 1 || cells > NR_FWNODE_REFERENCE_ARGS)
+		return -EINVAL;
 	if (argc % cells)
 		return -EINVAL;
 
@@ -1041,9 +1043,10 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 		} else {
 			/*
 			 * GPIO_ACTIVE_LOW is currently the only lookup flag
-			 * supported for non-OF firmware nodes.
+			 * supported for non-OF firmware nodes and it must live
+			 * in the second cell.
 			 */
-			if (gpios[i * cells + 1])
+			if (cells > 1 && gpios[i * cells + 1])
 				lflags |= GPIO_ACTIVE_LOW;
 		}
 

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261105-gpiolib-hog-stack-corruption-431b647ea556

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

