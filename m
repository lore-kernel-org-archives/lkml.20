Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55949B5CB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995517; cv=none; b=HzeX/MIU0+kObge9JHj89Hwu8RNyVdhE4uZkKweNa4edpbBrhdFQY/JoHB0WCYpLoTro+tzt0NCRrF+EstMulQrG6j2gesG0n3ACNReQsbRYBxff07b7/KDHTvvQ+xczazAe+WQL1r91krF3q1EOjavDP0yGRlNOyEsf8CbJ7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995517; c=relaxed/simple;
	bh=4ckCKtue7afXVQydUT++m+321ajwNqqOnFRqUpdzDtg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AqweBFfk3yJ6BiHV71TIwyRaB3YbFVAk2wm6DBCMrzH9Iap7qcsdcN5wu4CK4xxrwOeZUm8X+1yHNuhCfw2AQ9M9itLN1xheHBkRcNbPmZXKj1Nl/BtrJTobxvdUaqKlfnuXqu1TYR7MpdLP0eDx5iPzbUBLB5DPsSKWvTWivOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4dQJyGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsZjZoi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4dQJyGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsZjZoi4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4lrV1129676
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2BtxAAtC7hzWMVnPPwzGW2
	ohbZJK+yghma5dKi8d/Fo=; b=o4dQJyGcUcU9icAH7gsWV5lBnXXiKNpGTg6Xdl
	2jnpW8h+qGUrO+MRuS7y6awgGpN6xeCTLDXZf3Gok1kWRLKPAKy3Q+uBn6MdAeYT
	vmhzd6trf0t2QuLVwsqouxR6Sp2slZq4OavFQnvTVQV29RMznPOcjKuPvldT2cdR
	QhkXgrWRb3PIZIRyC+uoUBstTtsw1aCddZU1Lcc6zZ62mLNtDKnxH21xVgA1YvDR
	Dyhxb5n61jL2zQ50RVVKiJZJiRpb1VSht5/wentyKx0Hlwu4Ih31ySrCfyDx0dem
	ZhxyxPOxCPmsnPc7r7Z8YIPKVNFmlhKycBEl/SL3IpI7FQlg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgdhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:58:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a9378b844dso86812137.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995513; x=1790600313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2BtxAAtC7hzWMVnPPwzGW2ohbZJK+yghma5dKi8d/Fo=;
        b=ZsZjZoi4chp0W8bt44tqWGwRYiXzET1g/lkLaYTYAZw5DwsuHlo+eioYHoSVN8QNtz
         cNwX5SHA0jtHsbZvE54KozvpUmcO33SpbB/PqYzN2qnxRjlKWEyrmZWNsFgE2dMeZFuq
         7BkXNUv1gatmqwAQQOlOoN6tUV0FR6i9kTwMNMlQ29uptpHmgQbWF6ryCTyum9jACPJo
         A5J9wNsAtZWCyi3M8R/FkjpDoSiG9UImc+4tfwCN3YE7x71tMscbkU5zh8YEiHB1ENBR
         EEBFcVTfIytw+3KJ8o6NYCgUqVd16uyjKBeq7quYS2ChLX1yVC0e3yWFtQhTgHMw5/jC
         F01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995513; x=1790600313;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2BtxAAtC7hzWMVnPPwzGW2ohbZJK+yghma5dKi8d/Fo=;
        b=ToRfrKysAQIbcV9n4BCflNDOqTm2ww6eiwRZJoixt5qogG9t9E7AZ2VqKHOuAiLneG
         gWV8mMMNZFaTSIj/30WSPoC/hBS/O0UqG3Kr120ILa5GcVZxRapIkON3PANefiofP88W
         EUuIEZ2HuABKDqum2atDyuU+4Ks/eP9HctfbIBGNOO6+/X9kYI1Cu5ZcXWQPtw05BhkB
         w6tzWMXX0md5PnqmwAI+OEVubPTdNyNS4NrI8E0nhci+yDYbpQO/Gle5nY0sjGoNC7ve
         3+eYekd9k2ilK/GrevjaKqRcAwHKVCQxwNhE6WkRPC3F+fy7685ui/LrG89O/TQ2k6xh
         IuoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeIMQ1DVwfYZD1w/zWwLeoympid06/0jwn7MxYHAbdqGJ6g5G0Wm0JGM/3R1h3pGvlupmV+XxCQsuTm/E=@vger.kernel.org
X-Gm-Message-State: AFuF++n+oRHIpbB7wTIUWZsAqfMppOHuRIXUwmxyDxr+1QWrn0ZgKe8R
	h/IKSc7u0QVou9vnRbMw9zj/UxiuhtAGwBL5eic8/B/FzTHs9y+rTdSeCl08TTdbAUFTSHWuO+B
	cTHotV+Sg0nGhKrlCnL5ZAqTBhBxGqaxc5oiEUkf2ddrFHFpAdQqH4dR1lLxgUZutvaQ=
X-Gm-Gg: AYBFou1NQPSLWjngbzC8rKVpVrQUyP96UfS6tfgaPGZeRi9DllBxplc5Few+nq89wvg
	t2SdQgv8UNxT2M4/gaS5Zw40yOHBOHG+sac8UouUOUGWgQFIBYllZYlEuSu0HVI0+2ff5fXBPvY
	PNe6lCrcn0nle4szcFp6iDYUPj9rfasTWHh1LI8sCfNhrU3rqybGJ4wTintUjM3w9yfsRlA0u4N
	dd61vHTe8LPtrPCXQ1Roj6IYWeo8VXXR6Zl4+Z6n06ma5ku+7MqooOzrGW4hJP3fBYYhOsVpAcM
	qfIvnsBO2GEoTeN8PNJvna5N2YBVOcKTfpr3V4Sefh6vF5qtWFVRcFWgdAX/Vfc9MKSg/jjUjVI
	ocppthsrS+ngoiuJ3poLZ4EHuozo=
X-Received: by 2002:a05:6102:370d:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7a55b940987mr4241088137.11.1789995512971;
        Mon, 21 Sep 2026 05:58:32 -0700 (PDT)
X-Received: by 2002:a05:6102:370d:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7a55b940987mr4241069137.11.1789995512495;
        Mon, 21 Sep 2026 05:58:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 00/14] crypto: qce - Fix crypto self-test failures
Date: Mon, 21 Sep 2026 14:58:09 +0200
Message-Id: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEpsWoC/3XRzW7DIAwH8FepOI8quHwkO+09ph0o2CtS26whQ
 5uqvPucSlNzgAvSH+GfbXEXGaeEWbzu7mLCknIarxz6l50IJ3/9RJkiZwEd2M6qTt4CSko/MuO
 Z5Ix5zlIPQBQBaTBGcOHXhPzigb5/cD6lPI/T76NHgfX2nzM1roDsZAyDUqS8jxrexpz3t29/D
 uPlsudDrGo5bCVXlQ4sYQhw1BFjoNiQ9EYCqEqaJU09L+qdssE2JPOUXGerkmGpt6StIlI9DA3
 JbqTGdnadyRjnDKEhGxqSe0pD/QOLYynEYwSnek9KV6RlWf4A8dBPpy0CAAA=
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5447;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4ckCKtue7afXVQydUT++m+321ajwNqqOnFRqUpdzDtg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnnUXMt/LWS8nXrb3hV45sSyKphl1RVONZCc
 psdVWhx3MSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp5wAKCRAFnS7L/zaE
 w9ebEAC1wkocPN+TnPJ03l+G/80kDpN4jMjUD04CWDsVPgSc0RJwdQ+UD1BAk0W/MFfNP/+R4w1
 flhnwfAM8Tn7ft9Z5lkpmiebV8YPmETsTICiTuMvA0uWpEKOa0SVk7HJDrfP85PqCbRdPqe9e1r
 IO2fV09igeIQ5pvTf8R9Jxq6mYNrdb0B3FWRU3UsCOvStS2vuHFMk7YVO+8orpY3NYJLFxU/pLH
 s0Ghe7JF92ZdhC1jvU5gLKIA20w9yFnxbKoMza3go0FZ3qH9EQqRD/F+HEaos8IMvHJSVcgpOrU
 vocdnCqIB9jYR8Q076VcW3feqoNZNKrY+OG2mNaPSOV3wFcyUQOgvbNm0OAJqkE1qMLZgeLtDDk
 HRZCxz2e7epzr8SIj0Kzhb9trYNyzMmp68nkzsyla+tGn+xJU4+z55usBy7Zjps02oqVAIQSxDH
 O0nPNJUECT4sHnXWQlQQmuMMDZgISDu7yjWz1VVzPyZu65uoBVqw8M3Ny/KwrwgeyDPAGUbEKGi
 fxnycoO/SGAvZoIWOmu46erXm2DnWb4ptxI3ZU3aqJx7Xj2l2SUgYdPQytAX8evn9vKCSYPvz9z
 CbLp37FM+m5CNEsFYj/KcAVdVLhOO5RcVzInrmfq6kdMxdbrGvChxldNdn89TN/UtIbbuWTXHZ2
 SdmRZkUgvFY0RkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXzloYz407X0sl
 mU8MWAOKk24ruZrNbWfwiL2vXAAVt8x4jr0QOxGzk8HB7tPFsSIKB49jsbBjbfJrlKB9pXd0C/u
 HR1p9/bBYalWpSqz/ODarc0rim/3KMo=
X-Proofpoint-GUID: Q0elDhe5Mp23IxipGYs9BWAWowTCuARz
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab129fa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=9xMiekJfADYskRgvD40A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX4Mt694yT01Pj
 eZDZNwbLZbfbfVdD2vZP2Qchw47H/9PQpMkth/wjRxQ+PsLqfrxhPR/dXokjUt5ycn/Gb6yMG1C
 KFjPVgURtI8cCP1vOB4Wc3D2z5DiteoUyRs+c8sZ+nKMhBhyU2xh6kwNIDltWGsynqmsFC157Ab
 HDl+wFak4fgY5n2vWcZcKWoqkDlHDeTPQw9lQCOt4RBchR4F6i5nHvgp8ppx/0tzoHCm9Hea1C3
 G4hcYitu6tpc+jQ+yX3SS0O7JCvYnQEuQOgpTS1Bs+AAG0H7xIy77NJsfu7H4gjPZYlpjrqIXkJ
 S73TAmnRQi7kGu0VU0LkU8wgv8WIJhquieTstRjyO9h71gEO1oj4yIWjIrjZrxT5Ie64/bpjIvQ
 kelSYX67fP5UeQwobsyYnSGh2+p6BM+laCoiLc5FwpYgQaoCVKVPyI7jBfxCneN9RopElM4UjR/
 5UXsTMDWpKmftlMTg4A==
X-Proofpoint-ORIG-GUID: Q0elDhe5Mp23IxipGYs9BWAWowTCuARz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187

This iteration - in addition to the previous fixes - proposes to split
the QCE driver into a core part necessary to bind to the QCE DT node and
enable runtime power management in order to allow to drop the
interconnect votes, and the crypto part registering the crypto
algorithms. The core module is then enabled in arm64 defconfig while the
crypto part stays disabled by default. In addition: the actual
registration of crypto algos is gated with a module parameter that
default to false.

Note that remaining reported bugs will still be fixed in follow-up
series. This series addresses self-tests and disables the algos by
default.

The QCE hardware crypto engine has several limitations that cause it to
produce incorrect results or stall on certain inputs. This series fixes
several bugs and adds workaround allowing the deiver to pass crypto
self-tests.

The failures addressed are:

- HMAC self-test failures for empty messages
- AES-XTS returning success on zero-length input (should be -EINVAL)
- AES-CTR: partial final block causes the engine to stall, output IV
  derivation was incorrect
- AES-XTS with key1 == key2 is not supported by the CE
- AES-CCM: partial final block and fragmented payload both stall the
  engine

All fixes were tested on an SM8650 QRD board with
CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v8:
- Add a patch making the crypto driver *not* register algos by default
  but only if the user explicitly requests it with the provided module
  parameter
- Use the "offloader" name for the crypto IP instead of "accelerator"
- Fix device module table issues
- Make the core driver use a list (despite it only having a single
  member now) of child auxiliary devices to register to make it clear we
  have the intention of extending this once we start the work on secure
  media playback
- Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com

Changes in v7:
- Add follow-up changes converting the QCE crypto driver to auxiliary
  bus, adding the core QCE driver under drivers/soc/ registering the
  auxiliary device and removing the BROKEN Kconfig label
- Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com

Changes in v6:
- Handle all zero-length HMAC finalizations (like imported state with
  data already hashed), not only the genuinely empty message case
- Add an additional patch addressing the fragmented skcipher payload
  issue
- Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com

Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (12):
      crypto: qce - Fix HMAC self-test failures for empty messages
      crypto: qce - Reject empty messages for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use fallback for fragmented skcipher payloads
      crypto: qce - Use a fallback for CCM with a partial final block
      crypto: qce - Use fallback for CCM with a fragmented payload
      crypto: qce - Only register algos if the user really wants it
      Revert "crypto: qce - Mark QCE as BROKEN"
      crypto: qce - convert to auxiliary bus
      soc: qcom: add core driver for the Qualcomm Crypto Engine
      arm64: defconfig: enable the Qualcomm Crypto Engine core driver
      arm: multi_v7_defconfig: enable the Qualcomm Crypto Engine core driver

Kuldeep Singh (2):
      crypto: qce - Fix CTR-AES for partial block requests
      crypto: qce - Fix xts-aes-qce for weak keys

 arch/arm/configs/multi_v7_defconfig |   1 +
 arch/arm64/configs/defconfig        |   1 +
 drivers/crypto/Kconfig              |  18 ++++---
 drivers/crypto/qce/aead.c           |  44 ++++++++++++---
 drivers/crypto/qce/cipher.h         |   1 +
 drivers/crypto/qce/common.h         |   1 -
 drivers/crypto/qce/core.c           | 105 ++++++++++++++++++------------------
 drivers/crypto/qce/core.h           |   5 +-
 drivers/crypto/qce/sha.c            |  70 ++++++++++++++++--------
 drivers/crypto/qce/skcipher.c       |  62 +++++++++++++++------
 drivers/soc/qcom/Kconfig            |  11 ++++
 drivers/soc/qcom/Makefile           |   1 +
 drivers/soc/qcom/qce-core.c         |  92 +++++++++++++++++++++++++++++++
 13 files changed, 305 insertions(+), 107 deletions(-)
---
base-commit: 3fe766c979aa6145d9a72533ab32b9da30070767
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

