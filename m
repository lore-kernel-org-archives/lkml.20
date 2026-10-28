Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198688;
	b=X46/T4me5wsjVhi4682DlCFZTGuMnReLTe7iblIhDkBS7q6AB6Ow7AFvfcRJKAbW+QJk
	 SgkpT22Ms3lJt5Zsz7IDjQtTpt7ouuMZ4wAOk9H/hHYo/GNU8+oAdVtMT67GZMJwhAN4C
	 GoEVXqKeSFqxYrYt3ZfnZ5VnJUlfq6EYajnU78Rym6wpiAKF/xeLG3Lw3mpDXv/bNM9MW
	 zrlHbb2HijVGdsxGa7FhBmkETahwpilGI+UD1FuHTC7VRvqy+JU00ypzYwCsRVL9HEKra
	 RKxhMNZLPDEEWPu3dECQHhB+4ILq+W+n6rTO9ae/Px5itrikFZIcRkzL60895bR2aOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1VGCv7JfUH9OkdO/J1SJa3KIwCJqL5RZG3qCKIoL3KM=;
	b=yu9uj7Zw02ao0cGZA/fdhGXWw4Z31zqDh1BjdE0ecTa/xEies1G7jmin/nYfDu7sxp4p
	 fMYifWJ6+FL5HN3XnfLp6+Mb0uPAwB+ITIYWtJtU4KVOr+u6WGzXjr3WFPrqizxzpKZCq
	 QRPYIFKNb+UP5SkQTgbmVsswocygerc91AFd/Q0smuPbQevSy+HqAVOXlqE+NWj2POBhp
	 OphUMVbHfmRVaHhPl6G/vYc/U6X+/i4F5ikOOGnsF4M+KP90jYeR3POeLQHuqPU2GU2zf
	 AyRynLUcUTAv14MNAYQwgBXRBUFhvY4FF6HS0jrOURiFpF7c7Z0j4DljTaFvgQGlZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+s5IBPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kiZuFAM/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D62606A337
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D62606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+s5IBPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kiZuFAM/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4Qe2082635
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1VGCv7JfUH9OkdO/J1SJa3
	KIwCJqL5RZG3qCKIoL3KM=; b=D+s5IBPhzqME6b4L2CuLW2PcnqqjN+RG6ls+4S
	l6ktsboJ6YtuQkbcyLe+ohyXEhnGwN52qxEyW/Tb3VEfsD3PeMpaa9EdJGRjGaD8
	9iq0QElnKBO/iU3syqrIlc5VLyJQBBapFZp02D1Tcf3n9DacAIgIcSFNKhyN4//Z
	HI+NWv8cffZQxFQdL71hHK3BGR6fVtqUtnkXdJltqN8BKi728YZlzaB45krkm+7D
	G1zPDH8UxPwRZ+p3RWf0VpZut3owzOyyjdNrGlggHZjCpKDmq7JIra+YnNYP0aXu
	VgWeKa+6rcqKMxFU0uyE1Cqyv8uJ8sgLlpTrdnuvAtt8IllQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpvh2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso406282385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198685; x=1793803485; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1VGCv7JfUH9OkdO/J1SJa3KIwCJqL5RZG3qCKIoL3KM=;
        b=kiZuFAM//BfvvSCulT+pflJ6t17qHc+aIrTtwKcAYtq4OXJJ1nZ6z2ZWLx4ZV8SDqo
         +wLbQyx35RiIBPkBwvJcbFMoiXcL+uNrwM9Ti0Jj+HKanOcTuiGK7j5xBTjm0aAVJSCS
         P02aoo0unpvOKM5EMBZ2OnrYrBmYmbcC6OkB/x3MwJJImu45mGqQoMW62cp95kfSTzSU
         i6iV6Wxr5NQSxojfwULIjrGyM8nlAHelE4WIY9rD8UjiJv+3yRrogWYznUU0JZLlb2qM
         T9GVUTNRiLLuNBl/nqIFYfpapbWhEshcq4L9+0ok2VgfWPuOfKhtb+1mGOtzrB2F1ogH
         Vd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198685; x=1793803485;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1VGCv7JfUH9OkdO/J1SJa3KIwCJqL5RZG3qCKIoL3KM=;
        b=j3GHFaral9KXSNBncJw2wFczvse3fFUXY1Ra0dtSjXSIzwy5SnTH4ZJ5N+X3NcOVQJ
         hnVpx1YT/4Kd8+bgvRznQCTa9xVaEzVIrWaLvs9r9ZudkWter/AE4cZcYbWZDJx0BbGu
         dhJ4eUdthSY7WPKZgV0IDVcRWR3mz9ILtbItuD2u/P3M0TyRdjOkfHcB0JGabZlEUR79
         1jOXPNTntNO+BDvOiw9AnI3W7kITASeVzL8CWeD4KTTMnRYAKBsiHqKC6ziUkjK2hdHt
         PbtU93RTDVqhzdXBmKOlqj7knazsElq7b8YAgk5ymMz6l/ulEFNzrzW7J+qfH/jtaBJI
         6oAA==
X-Forwarded-Encrypted: i=1; AKwUvBwK5by8IdbXd9cf8BSFMz3+NU9dujPohFawN9bfazk64h0z28b69PXwFH1D2U93ozbJSkNyxOUexuPortA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWGAhhBRoxFQeRB0U+UuN2Mv6p1zB1mgoJbJ6DHumOXgepx0An
	8ZJy+vuO59wKw6LcLX0FLWgalQgd71qZYbqw7xoe3MW0asPoJqYpOE4gTuvNkpq+qvefmk3ROWN
	z1WnmJGtnbHY6zcyLmX7de0MjC+UBedaMQtCMsqY2/3yKQBw2YOAkdk1YHp4/4jm8OCQ=
X-Gm-Gg: AYBFou1uRJvxmw8kxsZEevhA/3UN/R0AKRxTAywlxgRLZB3Le2ogVVJXtAjAWItgDmT
	bIUYy4TZNsPr7ULaiujUFA8/ldqqD/I06UiTfIqo82o09wIBOQ3dxaJpGooYh2A1KFVTRSPFx/I
	VTBanjwB26+mT2aWbiGMcEUCngqvtOrDi8/T23MdtcwiDh5gHPoeu1iLZ4wJQ8JBXYxAgrEfP0f
	b6JS66qXBeYjpUTqNo9PJVwNbvnWCUtSGI9enwtS/YlsjxD3hTShJlwoFsHz/goJJlui1Gxu1kq
	qwyNvPjuLpmkJ0NgEURszi4PzWuYwxeJy9dyweCOc3qWnNToJrxoRvFVla0HoXHykQX+Vq9i+AT
	3YYa8eDWuxYPPBOS9QfsKSckE5Yb7p3ArB2H495xDFv+2pk0TYeQY2Y0p/Sb7VnkDkv+LlaupL2
	qz2Q==
X-Received: by 2002:a05:620a:414f:b0:93e:fcac:a91f with SMTP id af79cd13be357-943f4c0c5fbmr869371785a.37.1793198685166;
        Wed, 28 Oct 2026 07:44:45 -0700 (PDT)
X-Received: by 2002:a05:620a:414f:b0:93e:fcac:a91f with SMTP id af79cd13be357-943f4c0c5fbmr869367885a.37.1793198684668;
        Wed, 28 Oct 2026 07:44:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Wed, 28 Oct 2026 15:44:36 +0100
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFQK4moC/43QzU7DMAwH8FeZciZTnK+2O/EeiEMWO2vE1pSEF
 dDUdyfbAfVAKy6W/pb8s+wbK5QjFXbY3VimKZaYhhqapx3zvRtOxCPWzKSQVnSy46cxJl56lwl
 5+BwSEj+n9HYdObXWBkdHc0RidX7MFOLXw355rbmP5SPl78eqCe7d/6gTcMFNg0a3AEjgnlMp+
 /erO/t0uexrYXd8kr8gCAFboKxg57SwLTSgvF8B1QIEtQWqCmpjlAfXYCvCCqiXoN4CdQWlNMq
 h1SagXQHNApRiCzQVDNpJDF6YDpsV0C7BzR/aCloX6rlEAaX5A5zn+QdJbE7JXgIAAA==
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ScR6v3zGc5sgWN3scfpj3rC1MZqUhcrSV1NpKyIndZM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpXtLqDD8WtmFD/K1mLY5HVnxuKxP+bO+dFz
 itqcoFb2TKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKVwAKCRAFnS7L/zaE
 w2tlD/9ahytrQljPiCNGMi1MUb7AAc1VmfVW5a9aJJA4fcZxtaWjvYn2g3aFPKkQZEcIwnoyiJC
 FrSKqIwpVaTPPcDTQNeyk0vh4mbvd5uBfc9RgOaqMVFDGdg1TqCAfguT4fqbe4EWG5nLhLbuXHn
 jKaJG9QwdPJRp+oveie7Rkido6hJTs6mN5TCXsmr2/HkM+ZcmwwY7Q1qjnLx7RWRqKiOMqNDFKe
 YW6Oea/7IE59voZH6lBHW+6V0Sy6nqADBmG9YEt1LGWoFZZDQT8/4HBueja504JftqoiX0ksOS4
 RlhUjJ3DCYnSn7gnk764ogWgLNtC+08emJiWAbsThgtU0Vdc95hbNyNujrjmRKcFi5QzVUSXyjD
 WRl1UKGj93b3TMrbnfPpR9t1dpesigTZp9FrSXUV9e4IuXOtjs5V72Frw1dA3tKU3yNs1LmLK22
 ccq0EAaW/YAsly59xhM9zfFoJP1HciQKJhYPeUiMpJBRqNmPnf+8vENWirKXgfMBld/30dosGSs
 bVFmR2+3c+NChizKoEWRIOFf3JzFvYPsiqxTkDs7p8M5z/tBfVBtKzhxXF72LblzNyIHFM4ooqo
 ki6WOItuvzi/q2bT/7kB7zVgG7UugYftQytwFxxq/Pe4B5c6rWwPkCYo/cBvVOQ6McTrLTrzzw/
 153XpBCnejt47kQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX4aZiWLtnMyXV
 1vjHrlN6Z/UMIMZ/ceRmUUnx9WEW3rRjFj/GpB2cWDdwH4iR/wGfBeWNxjDueovR969PRIMuC4e
 etw72MpMKLGQ2DxGXutuFgQMSdx9fe1Pc1dmNvKf4VSICbAMGCkB1fy80IquyczpKixn7W4x0Jk
 FwpL6yVCX+WcXxNTAy6nO537pOs7tIV9TuFaBkt6olkQnHmGzfLjEsBcoCSkJCtc8n3iNs6tBa1
 O/wX25YIcAEO2VMy8jiuFay1jENW0nwB0KMUgORdrrnqJobOpGFr6EvI0ythwiZKEfz76HVWe+e
 NCDYOQnfM+XDKui2IktlKaOICjAU8OgTrUtXK305I2F8kwyb1QadBdsAF/GUoO2QBuyz1thy/Ee
 QPqvAvf2y8FGMt2MFX9kVHERpHys07F7sZzOiRuXpEVhxA5PbRqajPIMbhwkYswNIAmsdnGbhcl
 dyuHfLDhzeAP6alB/ZQ==
X-Proofpoint-ORIG-GUID: OEwDpFj3L8PDnA7wEuhkqdNJOFOm0sJV
X-Proofpoint-GUID: OEwDpFj3L8PDnA7wEuhkqdNJOFOm0sJV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX2MqwudS95NWX
 xWFt1oyLNBfvtiHb6OxhJdSk5kWb7DR/fQ/lSKfYd93ZQLfTMjHJHJy4AU8EvFz1OsYvfsePwHY
 0emBGHftLCbabu+VJiuH6e3p2p73b/M=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae20a5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=bfS4HX7CHEhzqB3VPikA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v7:
- Fix race conditions in teardown path (sashiko)
- Don't allow passing a NULL fwnode to gpio_device_find_by_fwnode()
- Link to v6: https://patch.msgid.link/20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com

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

 drivers/gpio/gpiolib-shared.c | 315 +++++++++++++++++++++++++-----------------
 drivers/gpio/gpiolib-shared.h |  15 +-
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 196 insertions(+), 154 deletions(-)
---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

