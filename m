Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8155C332
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957450; cv=none; b=r0LGq5CJ0uZly6HapcDlMKgYnKl26jWpvuYYkJAREK9grLVh+6b/puoWSc79Yd92n6eKSKZSnYzMRdLRGMXN+gKRZvC42Y6nNgtXwC4Cs8qSl+wJ7APAZRW+QmZvZL2YYbPBaAyYNpzWRbMA80kgQf/7dqQpIWx6FJjsNhZL9bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957450; c=relaxed/simple;
	bh=Qv2lflH6YpMRmCWBAa2RN4e8yD7dg6y3jZkOloHx9hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQQX0A5swYoEHCsPNBk3Wv+zM2O/QZpR4hvkqwiDRgU8PwrrF8+KdbXHtqOqNA1VDZRK5rqkJ/ZphyJI8e8FD2fdxUcxRoLKqVnLaCaHHdQo/oW4cgIpex76wqXeJjfpCWtuUmpO7Gu2xLaTcvLfv4WWx5pGVZzEOWo8qKm7LYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dwm9N7Hg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO8gM31U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dwm9N7Hg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dO8gM31U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoV1T2698515
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffE7yM+yBd+rWRItDOzR+dZhkdj1+8iczv8XL0VmG2Y=; b=Dwm9N7Hg36zec/+W
	7oFEqtFHu6E3zU62Bl4C2shKxe4e9bRAlxnnyEfT5264LOWIXQHQUYhuADAbRvWR
	XEarkoeTSUogn2UMTxcwLg3980to6OuI4GY9ztz2cytBGAMtE+dzrR2P58OHQrOd
	/QFmBg1tz9NksbPjvYQtAUVIQimwvDNGqvXsw0WBNEBdksXuWifvH5wZ+AW7dHW6
	z2/LA7s5P5dNckLYrNvkMCq05kH0HWiWL2w9ebXfwCQvwO6ntIfx9KgGN/rWjjw8
	E+L/kx3UaOJurUel40qO+/KHCSMMENH2SRMY064WFGCE7YQ2FgeSEaEq5XhX6KRE
	vkqDnQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh059e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:37:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78bb7517525so723675137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957446; x=1789562246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffE7yM+yBd+rWRItDOzR+dZhkdj1+8iczv8XL0VmG2Y=;
        b=dO8gM31UBsXSLyp0AFKdY5TvhR+e3nw28vXrxnXkllrAPxlUPtnQcizHq0Jxyuzqzb
         J+SL/IRC9HkAqTPJYG/+Iap2V72m9JvV6aIqv6SYwq3G2IyfzyEVOAA0ljqcO/CR/HvW
         7BS+ZFuPerSypCVsrHlXowFMzCK6CSP3B/fOU0HymOWcFqMXgPHpNyYGhOfMJ04zrHAg
         K2vtLGMsFpryxfLuU2Uk7fm8mT0x8zZIVojOnGMr6Pa655a/4/70SiOnOctYdTUFLoyP
         QDHONM6eieD9v7zVPYayhuUUfbvvaS80wfgPnKtrFNB6zy5qEXqHT+yNtwUSaGimth36
         lbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957446; x=1789562246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffE7yM+yBd+rWRItDOzR+dZhkdj1+8iczv8XL0VmG2Y=;
        b=NBy6fws0fQbFr2NxuqsRlQ86oKru9Th8FECTuY/umOTiAhEpDjxX0ABCoqOpTAh+yC
         vqzCbKmh4mvbuS8U7+OM3k67fSPtMwwggpgDRKSBU8haIAFr1bVWbllZ5t+mSuckgdBT
         4KZuPLv2uq0+qveRcMCkQWsTofmOzvvumaRq8CoV8ex90T2yX9Yvh1TrxCMq/FlHNag+
         qcmayJcl+6sul5eciArBL75O1/F1vEFTrUFtDzjhWISb4W7GjjCf6LYq0WCmWTfzkMAV
         1hkMEg6QZNS2HO7wlwbiEipJr0STZRtQ1E7VDKpDlrKA9acdWE9ZDQoXUcQEn9GFfcap
         7Mpg==
X-Forwarded-Encrypted: i=1; AKwUvBxj7t9DLDDvwWsZ+SCX3nCHvY9QDp0ze7Eg6ejagxkSx/LmpISFSLOqn4+bpeLHtLkZk62Ko9gMpp8aEPE=@vger.kernel.org
X-Gm-Message-State: AFuF++kjEc+rKbC/imx3SP7m0RW9SupgKuK3sKn3ncPbiwhVCvwbLMuo
	poKU5PjKOAz8RhLoFsKAxDXgrWSuCCKA+0/sHzA6gEqIF9ACv6MaZK0dcub2IxkijsVILtBWuGW
	wKuopl3glhNAU5sx1pKpZ1wND9lpZgxB+GyHkt5u/MGLrkPCl+4BGDX6w/PYOvBMTTqsSyVMFaO
	4=
X-Gm-Gg: AYBFou3ssSGC0tRkZr1tPLLse9h/OKPPnOMMRftfFoli9eyS/2o2U4lZynhaZwuAAW/
	BukCtQjAeBXpzAySHGXDqfFzSNj/1LP6TIO4xdyzE0+DK3xU9qIRP6fwbqFBwZvnJy5kk97hGOJ
	6LeJmvhEWd5T1Ra4uREUReuIZE61Y5zpzPa5GpQ+geRXF2B18/NquVco4a98qcoICfvX3UigVkk
	Z6bePIwQ2EhbJBgwVpq+1oa6rORcn4gjsvoeCkJ5li5Q2HnKqC35GrupREwG52iOHBpesVGkMwt
	I4osrzOUUHJ16DPpAI2z3kKwtShw0doT5CXGwp8C1FLBft0kQ09ZNo1Dy8xDHF+GMJqdlYmP4fI
	7+Qn8pZTMKiD3/46RQws7P+45nYBb
X-Received: by 2002:a05:6102:8309:b0:790:322:8a36 with SMTP id ada2fe7eead31-7900331d5c6mr736914137.8.1788957445747;
        Wed, 09 Sep 2026 05:37:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8309:b0:790:322:8a36 with SMTP id ada2fe7eead31-7900331d5c6mr736889137.8.1788957445220;
        Wed, 09 Sep 2026 05:37:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm36317328f8f.20.2026.09.09.05.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:37:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 14:37:07 +0200
Subject: [PATCH v2 1/4] power: sequencing: don't call .post_enable() if
 pwrseq_unit_enable() failed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pwrseq-kunit-v2-1-ef496afc89d2@oss.qualcomm.com>
References: <20260909-pwrseq-kunit-v2-0-ef496afc89d2@oss.qualcomm.com>
In-Reply-To: <20260909-pwrseq-kunit-v2-0-ef496afc89d2@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qv2lflH6YpMRmCWBAa2RN4e8yD7dg6y3jZkOloHx9hc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoVL8+nCqtB133ENfnVlGNNxCsHBQMrD5YTEX5
 axDTV5SkNGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqFS/AAKCRAFnS7L/zaE
 w+fjD/9GSPt2ty3DyQWiuSJkVfBGl03keOCQsVxAgXFij3/47xs+tjLSWP5cb2ZIjCY+mX04tM2
 2R9/vHZRV/zsuqoWBnCQUk7lyATOXqq42Nf+zjzshhY5pv3W55QlbYg2Y7Eu/+Y3z9sRJj7OXEl
 4fWFDJNVCYzCYSi8pws5daTYzRTU6wqw6P6jRk/IcxhAUH8yuwVNJTrxoGf8YVJX7DFoVBIqXn1
 RLKTgvtoH4ItoCFMNbLNN9OGDAvjl2xv/xakoqgUjZRXJhzpLscqExTDXM343IwNC0xM01sdseB
 d+0UhK/c84fV4eQe6zWRziRCZObpU3eAZFcXoDaVR3Fon7hoFOi9YRI1Uw3LO0NeVZt8WGBI6iS
 H9DQvmgKXsOY8glC+HrakrJdBmjPaCtnYJBIAPStaGgsuskm7sywSr/pwZN6pUATnVQ11yIunKY
 w1Mfp8DIxE/cSmWRxMVXT2h2/zN0zFvUZdEnGrAyNY+HMWPH7HrP+dii9Reyi4Pm+yk5DW9yp7B
 LL4fjUJdrvUyF9gtFX9JC1C1ismDI+fIr/9tAonDZMMb/9vdPc/UnLZV9eYSI4pH1CYNQwveLJn
 OwNTut3BGNgIGvxqpwuhWEp5zz1ErgwobeHBr1ggylfVobJvaELTA6uktNaZac8F+OZCw9Ff3cR
 bmZgMoj3fJaJtnQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX4dr3NYm84NJT
 b7Gh/EN8gY7JTg5AaM5HkUW5nP7tQujENzbSuhIB++jEx86mFDt/fpE7XSeYuj34+LWnaiGQbYF
 MLtlEkQVVKdiaBGBOsTpH+Az0c1hRo++Py1UX5DnX+8nWdUfQ9FBwjp6HJYoeJZjdIwioQWK7F8
 qgWN3B10rTdj2ogvbMMKq2C0daJfJnBjOX3OQKEbu0qr7+dFXYaAAoLZPWoWrVxGTiLiJRowAeo
 HUFvnEL3uMAvhT5rrNA+aXiS1q2xLDQ0HvXFQJwR2sdx924dxXOUIkwnG7/QNgm6D8kJ+XBgJW/
 w44ql4PxlMDmgsIm1iau//zsZUG3jO5NdBdqSxIUNlVbyT1jJzGbNKAbUtjSzfOlcn6Myzn8UX6
 pa7rl9s7UKV40cCC5uPwF4ckKmFYdoWgOprS04s4KIZUtWzFHJ7gOX1QV+uXIz15AQTTJMu9vsh
 4kCty+CvSV//eSAI2fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX8bO4k5Z7sVKa
 S7iBi4EFu2XNoLjaMGGRTHblxVy05ZGwS6QDENsPaAQNqf+L+zEgkJyuxNp1q2tby6gRaHKxHy1
 8JDz2sr2Ss+1Clq3OaHK0cwvoEqDGjc=
X-Proofpoint-GUID: 70wFnuKW0eKhmLEfRPygoaBZqOtItjnm
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa15306 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Trbc2l1I1fXLbfWOQTAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 70wFnuKW0eKhmLEfRPygoaBZqOtItjnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

If the call to pwrseq_unit_enable() failed in pwrseq_enable(), bail out
instead of calling target->post_enable() which assumes the target was
successfully enabled.

Fixes: 249ebf3f65f8 ("power: sequencing: implement the pwrseq core")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/sequencing/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 0cb71efbb268b351607ccf610cbf0315f35eb3b7..a26615b727f6fe8e7cdc3ab1d3f362ba2f1c5684 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -912,6 +912,8 @@ int pwrseq_enable(struct pwrseq_desc *desc)
 		if (!ret)
 			desc->powered_on = true;
 	}
+	if (ret)
+		return ret;
 
 	if (target->post_enable) {
 		ret = target->post_enable(pwrseq);

-- 
2.47.3

