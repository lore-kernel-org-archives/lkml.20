Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506893;
	b=OhR8otJHcLtMJG7arkOJ1O61Fgwfn2Qc15O1XXbJ41/3FSpMep7GGpGX4D95A/kF0+JN
	 0EII0qUuG1VJTbOwx5og9lN1OGr642h2NXxL2ENoIIB/gS3RVN0YY8pjptL9+VrQ6NuHE
	 6Y73YTWfrivG0l1FxqnyKA1r/RyMQ6ysNsEoq9eVMzVjG2b/CGUKhmcahctSImEy763V1
	 6hHB5JCQjV+wMp2zJ/2jPZtrCS1VuLaHMJX8jOplUZ/V17TQzvQRgRPozQvZ1UWWKKy1q
	 esrJb/jcSwMoG0epTg37aBnPc4BKKHQWiDTi/A6zjVb1HBMTykA1mYydltXNNfNwLxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iV5IC4570htMmf/TYzTVv5ulvmPQnOzI5m6TeTHTPWM=;
	b=tygSZn59rB3czw+XiEDQzYIK167gNVdpFHOsWJcOd7zfOG0AaSVh2rfUcUGyBZHXNdzO
	 icWpfwUauDdTG5444keDfnj2o1+IWIC12dl8XvwqIk9qyYnQO2DJceQtCzd3nvE4DruBZ
	 AuUYQ33GVB1ZUk3dB7bxrd+BwsabSi10T4wr+OiSu0h6KaKziIIUEg34g5TwhDH+CzXds
	 V7qAvtSkx5QFYIBiIy7MkcGnFLdEkNaqxypRANnyOL+jeD+cyt5gQy1BpPAillxXU4XXD
	 SSlXHNSivtvvIG9AkwNOf7ywB98C+WQWCaX6swaXmEjQI0TqwstDteylY3CdhGgijVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2bOP4e8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hnflRbl2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE560A263F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DE560A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2bOP4e8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hnflRbl2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA4AP1575199
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iV5IC4570htMmf/TYzTVv5
	ulvmPQnOzI5m6TeTHTPWM=; b=c2bOP4e8BAFqPBODvxrc22Y4HxIOrIgyOkzYVM
	YX/d9k2TKAypl86nl5sUblE836Wrxw0CVNKNlJide2xdRYJtup2KW7/k4O/bGU0B
	S7nWbeY9lEB53iWuUlMsR37qUfoYHdnoUSyze39tfMpULMUaQ3P+D9rXFOvFl8ez
	081k+mK7UuI4pkoSwhvqxXF407Pqg8xs7z9cTbtq7etnW84MamPWHLTThF4B0Atk
	It+UeeHp5eb5rpGwIUwbEHDBKE3pyA8r6I4Dym1ygtXyIze97Rxk3bW+rii5rJVI
	dAvbuUweI3G7pMtY3NkMCoKj8TmVIhKfdr2Jc2TL89K0A58A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2xam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:34:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso144786385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506891; x=1793111691; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iV5IC4570htMmf/TYzTVv5ulvmPQnOzI5m6TeTHTPWM=;
        b=hnflRbl2sAPQP5aKdQ3va+YXizS+2yd6ZL4v8YVW1Y3E65bYXiD0PCMxCTO03Q9kJ2
         wP5u5Xp/ti9dJD/F4lNOUNeem/Di1E1W+0XWRh5XJUEgqMhNlrlIIK5wrA+gSShJkGSs
         aD/EjqnUjN6Qnxlgh3N+rjwmYFXKX/cJVFXx2UeW5d7ddI/2geffErktPbVdo7UjEEg4
         J3GoILVYmFTAN43sz7vENCD9IVUuy/ZWGmrr8i0CjJI9t/fW8lthIMpWNSCQ3qe2/OXI
         0ZXnZaVOk31I0ewl2nnITnxENOhA1pcGS8SOzIZPCcxSb2fIBGQCr2tIAeYWJcqIcfX4
         5uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506891; x=1793111691;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iV5IC4570htMmf/TYzTVv5ulvmPQnOzI5m6TeTHTPWM=;
        b=OQ7h9hGXVFIeKQF6Gcg7BBMnerFazkETMcoT9++bCGN+p8Ue/w8iJUQFcErGA30wsT
         wrcxpeV+tL9qm4fVQE8BoJsh/JwA9YOV88FoFyJ2gGTY7+x4E315gG4m5jWVmaNO6sTW
         10se46WVnjRoHTnMI/pn8cbByw1YvNTPRvzy6wWYQ6GFmsEjv6ziL0e6yJ+HLHXqucSX
         u9rFZYc3wrZd6fR0vFv2m0EWPn6zUEVh2PvwW+QtSKhAsKWQyTOSH2n3Kq2l0o1AelKv
         Kx5te1rVa89BgJhhmF+HCkVNi+VBvjpAP47xLV8+nt9J7HcTtZ+xisGjaPqe6bBkMGgG
         KggQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEXrALpIyRiJOSVdFP88bYJrBwMVUs95yRXCPVC+2T0kLsq7UbKUNXwILdW19sIW2PUQcimZ310rIakks=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7lClNYCa9URvVjXns/r6pdvPMo1dIF+Z8qpSNWN3bJ9dKM1N1
	RB0XGTvF/vProV/tl+E5TUKD/p+sl/eyBe2lBn/5TmxnSMcsxBTqc5BEWyWaAPRvnXvcGXvlXhD
	OrfI+zpAqTv21lkpkOySgrSDB4zAW81UBdJ6upkMglA2vuwqBtbvh05JrBYnmGSqWNqE=
X-Gm-Gg: AYBFou1y4lLQL6T90IphqveY+wF6iT9aHzlGaW0H8x8oUaq5dLqA/tsExrQc4Rg6aF6
	Pl8Yz848wekLG/enw8surTF/d4oO4U5YNvur0ALDgjtBVvDz5yLpQLcqt4sHM2Ul7G+TqhwKfr/
	LD9QzOviptYxlaNnFOpa8u5gyN4oAsLVcM5dD8eTLru7W+6A6Ha3HuP/xSDZLNCQWT4J+5Kv1aH
	DbdPGtBbO8srrh+BF4LLY0qOYO5PmVYTeswXRGAnipOb2pbMoQvzc5FqFsr5Y24t4YGqoBlgg3H
	2q8bzjMVuib7U3DEQs7GaXBRfij4YoWciGo5CNL3aH/H0gOBGHG79JWmkSLMn8hvgogKU+kWNfR
	/LW9+y5ANNbBHhiNaKWb12rRPpDkG
X-Received: by 2002:a05:620a:8016:b0:93f:2e81:2217 with SMTP id af79cd13be357-93f4c9930c6mr338956385a.36.1792506890760;
        Tue, 20 Oct 2026 07:34:50 -0700 (PDT)
X-Received: by 2002:a05:620a:8016:b0:93f:2e81:2217 with SMTP id af79cd13be357-93f4c9930c6mr338950185a.36.1792506890157;
        Tue, 20 Oct 2026 07:34:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm6766443f8f.5.2026.10.20.07.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:34:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 0/2] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Tue, 20 Oct 2026 16:34:37 +0200
Message-Id: <20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP1712oC/43NzW7CMAzA8VdBOS8ozldbTnuPaYcQOzQaNF0yO
 hDquxM4IA6j2sXS35J/vrBCOVJhm9WFZZpiiWmoYd5WzPdu2BGPWJtJIa3oZMd3Y0y89C4T8vA
 7JCS+T+nrOHJqrQ2OtmaLxOr9mCnE093++Kzdx/KT8vn+aoLb9j/qBFxw06DRLQASuPdUyvr76
 PY+HQ7rOtgNn+QDBCFgCZQV7JwWtoUGlPcvQPUEgloCVQW1McqDa7AV4QWon0G9BOoKSmmUQ6t
 NQPsHOM/zFeWCZye8AQAA
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2206;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1qTQfTc7DlnheHuZDLA8d7w/kP4QXobS2I4ynd6aLKs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq13wCF0rugBnn0c880cGcyyHolZ/jLyQL9JwJa
 88MVeD+mciJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatd8AgAKCRAFnS7L/zaE
 w8tQD/9Z9DaMCfIvA+6vDHbcAXOyb6swLln+QkTx0gwVE4JdvW+m84BjarOz2TKcKdnTTuMTi3N
 2neMzly5iFms2lfwmV3OF0kObpyWgO9gyKVuszrY/jE7+wSV3oGTwR+W9HKJld+KL5tt+U+CdTj
 wujpiJo5cHJOfy7xXV6rbCfZkpS4Vy4orbMvDChYa+qgOS2j9WCVvNzTyLIihQdmmECAYYLLcp1
 Uflyy+n93PE4eC8appRHQxyg6JL5lfpe82u02JTIaU8gQgo5924i2KdA4wVhmoC4QECe8Eq88dR
 mLOFMQPG3sVvOFyT/DGVWGIkfjx26TbR9g68Sj4N7C8JLxkh8oqA9a3OK6ClmoYQ76FTNjgFdjP
 iUGzQ4eenb3uJATDC7cv4m29QEjAh3VHjkLXGGp/Okz8VRU1Aizs7/1isLx1bsjYsehqLORcboj
 M4kqP/j+qTKUbrJ9tTJeD4F7QdIuu0tATQ2dHk3YISwahWmbAe5c1ruVwuSVZzrCgVp6i6kx5Wp
 ve8n1Wi5dI4e08sYOIzJgpOm0U4l9FgOeBqVzSJkpoWKlpeSpmUOICQ4vYez97SzjWwfHCC7Ywr
 ykXCoj1mizVv6ApaCGDQV+gMVfPHdBgeDm8C/pRXn4kWMxJHptnIUVBDOAEY5ulr4oOUR7wJ7dJ
 Sc8MNrawDr4JZZw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: TViFrnEneJwHdU_YLmIEF-j_pDXI8k4h
X-Proofpoint-ORIG-GUID: TViFrnEneJwHdU_YLmIEF-j_pDXI8k4h
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad77c0b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=cYHgvgXoKsdrWYhR6y0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXxQ6i731C/tX0
 CydyKD42ybGmsfZqbpxIpww7ZFZR97taP7ZXIkP9ApqJVqNVwBXsZcgHV01fGCFkPJt9Im4nmgL
 G5yPpus+lnbFhg4lWpVG+9BmV3+t3bmX0QHXICNVTxJa4ZA7G1Xz9KbJ0AP67ptI4gBnThY8EhW
 5uKf6MgNQ680v+eHdEjskObvkXvxTf0phx8KggxyIol9SrPWvzHkMvD10491AErPX2MOWoSG/XS
 IMV+MfCmBpAyC8OPjqJHfWBV/ajcYWy8pdIfVF9xwDYLVTakaZO2HjFnupBBT35twNiUj4W1Tb6
 uOqy9QBdgJfgLa50lLGZ1y/HYcQwvFik3NUAf0YrD0As6smzC5YPqD6HfZ/NtwVV1d6KVfg495b
 s9hELtZP5yzfzgpwTNLJDkaM1lTEfzZda9NQhjpvBQdrX0wwytfxV7Mb7H+uSPN0uxUHhN3MjBk
 Sx+9/3Pxd/Mb4YNfQiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX+BMTPmEveHY5
 gpSvJ/Pws7fhpgtrQIXUAtRLciMGz5hpQH6iyAGQKIaJnv5zf/9ws5r1dqwsaVco7aZOIXMPAiH
 XbCJF31cQdEHGyYV/ZknHp0deYHTQx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200057

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (2):
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 158 +++++++++++++++++++++---------------------
 drivers/gpio/gpiolib-shared.h |  15 ++--
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 89 insertions(+), 104 deletions(-)
---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

