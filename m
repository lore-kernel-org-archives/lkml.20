Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659494;
	b=gwnmnctc+verF8xOUDdZmdrBsZvSUBIiuregqBmHq0LOHlf14fspeRfbmIkRbH2iR5Ug
	 Xc02pvsTSZjU/L86/h6vIUUclbfZL5+XIaSyvp11kXUwJSVQ0OYf6/EBrcbtuo9w8ZIHf
	 b2m2AmXD2WYYF5O9c11GpZQ/CCR6gZB1Op89CLi8cw4xLuYgZQ31tQXrwDn73bwCB0ba0
	 mEoQUWgYa0bADEI/Dqy72RbSxXlzjt2W8azks6oXe4+UZXB6lWyZ+V+hpKGvLzjctgXBa
	 ieH7xDwVky9lgpQBR4PnQWmAgg7a+I7IFqB5ReDMfXTNbu9dGZN/Ok40tpdtKXQWVvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QO527nYtTVDs90AOOrllvHVE3JmeqiYYasfYAtNl0pA=;
	b=2U3QKI/KFXM6VW2bd+5pvsxyDVuHFQKjrQzhsPvouciJOARxfiXaT5nCZwU+Fm48e4f7
	 4NDf5iS2tCu/vdVEmsBOrIQ9PLSh8eWmELaGvSeazLThsw5+tzyOZYb1Ol2HfHpbdt8KN
	 3sZQhzdJV7SIqMz0LHe1dSU+xhbgWDgM8yfwfkvQTcPJaTEpI+7tz6CbVUayOdTGtYFrX
	 AbBLWsmAajc05TfbZvlDaKvsPo6lWMuLeSel8JMJ1Yj/SH3qnj4v0/pxtCAVTAx1UH5g5
	 TamCLmg6aR5bNy3Il9wJDYXHJ1wL0XribOtxjK7p7p8nI/p4vIjxyir72eXgclqfbYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OU2u0yMc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZJtDvPz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48944606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48944606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OU2u0yMc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZJtDvPz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Lovp3194764
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QO527nYtTVDs90AOOrllvH
	VE3JmeqiYYasfYAtNl0pA=; b=OU2u0yMcCjXeVr2aEGKLhp0GG9aqjJVIIykiyB
	268zsJMc4AOwDkgLypGfRIeLJsgBKna5yk6GwDPHTj4IHY0pTBmeUqMaV/8ykn1E
	nnhvj7+mhfb2cd1QqYZ6iVYfytN26RwqfhreReiK8u8+daj9nGWem3BMF/4hKVKC
	o9xm3wUsM3qh4BCICNkWEpaffCLturelqpHKNefmyNi1bJ9QOSrqFdkKvJHWlIpL
	CvyV9qY0VLiSTuMIWt2byRg9XrXcYddEX00OPop72W6DiKQJ+mEnb+k+KCrMNxSa
	AWxABMpl8xFfjkFM+Bz1d18L01aTxt24K4vIhD4jeyb6G8gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq05y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so136910385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659492; x=1793264292; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QO527nYtTVDs90AOOrllvHVE3JmeqiYYasfYAtNl0pA=;
        b=XZJtDvPzYzdVoujf/4Q0UREwX2RComHAt056FtoDn3zSy4YvcWeDps4HixvQyLN8uT
         q+ZhtaMhuHpCpyKaiEaY5GvNWPsG1ST9O1BKHFMhSk1I2aLpVReryXFtXBzfPCbBJag/
         ++GxV8gipNmBBeNArqkvU6FaeccVqzkyXJAr8JJrSq8Bd5vH+oUAzPbh+58DQJZRGOnU
         44V7Xo4K8ZyP7601r44iqzA0xLxCi/ABI+KQiU5wy9msd/XfBRdw6cxdvzD0QDzFCbwg
         u62RN3eK8IwJZYJRDLP8jqz0UNUmekztvNLLmXNqhtivjHplaGRbC87l2txkixvitN9k
         S9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659492; x=1793264292;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QO527nYtTVDs90AOOrllvHVE3JmeqiYYasfYAtNl0pA=;
        b=XIWS8NI+jN6OvyE+6f+YVD9vh1IzJWdUagbGx6Ij72e/VhbXffZpcXTpex/FaUsTLc
         Bxe+Eg23zbe6igNaJehKWyxcqivBTEBA1cbC0GS3Mn5nFGNmJmjIoYgB42Ap5RCO+zZH
         0yShlfGfsnZNqu7nClu7JBVmOz3qXlurl5qR/7tQhykMLGJP/GghPeie4HRcAA8S+hSZ
         EOF42uPOsEeSzRINxgagib7LCW5MaRcGVQ3qKh1IanJWtoXWh2ejsMn6cERop/5ZGhkm
         RTihnoPgRXmtva6721jgxYxnCZInlwIE9iuwvy20F8L/qLNAxCHxLxO/Urauo9EsqbTt
         coQA==
X-Forwarded-Encrypted: i=1; AKwUvByEPuShsecrmVJWq+cnSDenhJBprHBQTZICeikQAEx8sY2XNZDMqgi7ZTq5xFfbv6rI3kUeiR+h0XvRHnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH+FzBNE8Lsod6ZkeVN7PnT5EoeCY7hbGgCnrNQ3z/lBSfhQtp
	e9pu4vHcsZAhatOwHfbIBJZHitGe8UmV5pWL6BiFDrJxMN2mxgF2KRK5xVUH7bGmslqmtyw24/b
	fxxh+dCDDBQjIqVKBg4jD2+LZ7S+6do12k0WXpeFv6qGQTGqhvcHfhVN4Uqd8lUUNRb0=
X-Gm-Gg: AYBFou3JTjBfvnZ5GkGh2WFJpOJv3ekr8lUyB5e491bEUoDq69r+p16M8u7UfkoWoYX
	Nr1m1H1Z8VOGEDYWC2oK8auVWZfeZgzxQ6ZnqN4aN7GO57DtTXn/18SRq0shjyXDAaaLZzU1FK7
	NcMBcakQ8GXmz8NfRlmu/PgTczwElbYBeyyxfz9zkHcUkjXGDR1inhRPxJ891RVnR8Oz9DbdmSU
	lmC0gQE60kCofW5TponbbW//cR3IAcMBuG2siq3v6f6e3uudOhwTLG6vaHYlbrRTTcNYLFS1nga
	/sJfrz1UXgK70ZdABvbEsfl8Nme9gKTdXI544H26MkMfXNMIedZ2ui+z4CGwM1zDDtegVFRf247
	ybdy/kUbXWCLRAlHHPm+yvkYwIXIL
X-Received: by 2002:a05:620a:1a26:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93f62720fabmr279113085a.17.1792659492381;
        Thu, 22 Oct 2026 01:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a26:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93f62720fabmr279110985a.17.1792659491909;
        Thu, 22 Oct 2026 01:58:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm61625525e9.4.2026.10.22.01.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:58:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Date: Thu, 22 Oct 2026 10:57:58 +0200
Message-Id: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABbQ2WoC/42OzWrDMBCEX8Xo3A2SLMt2KKXvUXJYybu1iH9iK
 QmFkHevEvfgQwu9LMyw883cRKIYKIl9cRORriGFecpCqZdC+B6nT4LQZUNoqa2SWsPiCTh8UQI
 X5yNNMKCjAcgicmu1YWpFDp8iPb9y9uOw6kjLJRecV1M4TAR+HsdwzoV1g8zGs9GVK9lXilm2v
 qoVo3LsvCLXEJoHeqSU8DlsX7yuu5Td7Eo9wlWBgpKowlJ2jeHyfU5pt1xweDTu8nn7C9VuUUc
 fTj3FzNMgQRpL1lHruub/QC03QCTsfmB1jZpki66T/hfY4X7/BuLcpP+eAQAA
X-Change-ID: 20261022-qce-fixes-broken-label-e6aaf9624fe9
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5024;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SNlakgImLlcbw4lKkLUFxbVJiRFZnmaVXphjRpLOsbI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2dAe2pJqVxkEm4b2mWoDo1IKaJf9K1BrMJhNQ
 1kyGvBGXtOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatnQHgAKCRAFnS7L/zaE
 w6+wD/9Nd2W47YsN2c1SSQoz/R+eOj3lGaQahRTEn8V1hk7nF2HMnLHMD68je3vNQ+M1rNvH3ty
 YWBpygNlaxtuDszgYjWEIq3qi30pARHQJYWlssCa0gV62LlXyIx4zeELh+z3yAVee0P2sdxmWvh
 yckABv43A0Y0XV7JzhHjJGCXrTVbpE0/LAJ4gOXk/XpAqH9IQw95Bv1YVSWwD9h9P5J13RaaP/x
 0vIo1FKnPxIkYQKappjJwzldZcAuW4KbDYum1CQ16lux09p/dWfZXQMNB/KmTusv9iejdSb8T9n
 Fo6nE6gkDWxDHcaCVWyzLS3ZZESgkcdSxF3tkfilVAADaICYWHwUqgeS97/MeXy1PcJN1y7cfnr
 fjsye0kok0iKIHSHaHjSAlQAPHiwk4HJinm9gKHGjLCDSsiCwIfuJn3GwXPxKjmU38tJEzOR7IV
 zoiWke8blR7SpUp9D3C3iHrRUtNGTvgChaC/x+Bp6AmDp19uuzb1mLa59Sm0GySXw3TFuFXhECi
 IT/t6JG3sO2za+cAN8mJOQPBligwHuKPkDudwTa+RVMtLf0IAmf8XKmqrO7RTLyGh9FHJw/KtAR
 p0FwukgUlgqkpEr6XWRXj95twhM2CTZ4h0eNCJBHv2943UzvwX6Go9ZFWG9kU1DBzR+y82TTiPV
 hlkvdt0QngffRdQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: uMgzcbIQ8BJk7M5bXLIx1HXUVawvLQw0
X-Proofpoint-ORIG-GUID: uMgzcbIQ8BJk7M5bXLIx1HXUVawvLQw0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX2XBGDy21keis
 Ksvq/R69bt1IyKsiPG+t8CfySni212cG6Y0+sL+ZiiMnHmQJqfmuUjmYWqiAgPpffEn5OdcPuWF
 hNBrWSYNiCMtyyDMvIj0uEr0gx61N80=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9d025 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=9V_34UpJrwX9EJPKeM4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX1l7d1aKW6L2L
 vvFw67KdvlXmz/Zjdx/5uv6CSWUZTp38gy57bfNuD3klhvKA6HPCLAr0WPy2VBG1ky7SQXPSf9U
 yLJwM/pNNaZrTYEqIhAfitrhr026mUurqniVt/jVUhMZgicIb5LkogPHo5N1/WXYQfvSqLJi7UC
 ZK0kTcdYh701jZ0iBTY5G2/YS52k4rOr7nAtEojNyslMyp5UdkB44pbhBhWj7lUS7ZMGIfpqzjh
 G64GCXg0szgl9BwpGetZyR5Nf5eLR/cDGhVWmJIkdii+R4T692I/RHI1Xr8oJmpFTkJZfZnf0lv
 YcrF2JUlXxldu0yi7iyyhMGqHPNrj1Ah79Iz9i4ZPXE0vFDkWiv9Te7b1gDNlHC9Ank4eH6XGeN
 5jzdG5XLxARx74Z0Z86QGrlek9xG/NtPgkNaOEFPB++PYc8sN+NPmjUVrTEEDVQuu4oytD/2Cy/
 KE5wGNmR0RAjaglk+6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

This is the follow-up to the three smaller series fixing crypto
self-tests in the QCE driver. It makes the crypto algorithms opt-in via
a module parameter and removes the BROKEN label so that the driver is
built by default.

The dependencies are:
- https://lore.kernel.org/all/20261016-qce-fixes-sha-v1-1-3ee5a30d84f3@oss.qualcomm.com/
- https://lore.kernel.org/all/20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com/
- https://lore.kernel.org/all/20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v11:
- Split out the patches making algorithms optional and removing the
  BROKEN Kconfig label into their own series
- Link to v10: https://patch.msgid.link/20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com

Changes in v10:
- don't pass a NULL buffer to sg_init_one()
- fix byte order of the imported hash state on empty finalization
- don't recompute the CTR counter in software for every request
- reject skcipher requests with a too short scatterlist
- check fragmentation for empty CCM decryption requests too
- don't use a static loop iterator (duh...)
- initialize the return value in qce_handle_queue()
- Link to v9: https://patch.msgid.link/20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com

Changes in v9:
- Rebase on top of cryptodev/master
- Rephrase Kconfig help text changes
- Link to v8: https://patch.msgid.link/20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com

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
Bartosz Golaszewski (2):
      crypto: qce - Only register algos if the user really wants it
      Revert "crypto: qce - Mark QCE as BROKEN"

 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 drivers/crypto/qce/core.c           | 12 +++++++++---
 4 files changed, 24 insertions(+), 12 deletions(-)
---
base-commit: 178aff4cf425b3fc51ff09c571fa1bfbc1eb8ea4
change-id: 20261022-qce-fixes-broken-label-e6aaf9624fe9
prerequisite-message-id: <20261016-qce-fixes-sha-v1-1-3ee5a30d84f3@oss.qualcomm.com>
prerequisite-patch-id: 7c93b8489dbf6d4edf932389c4c931d897f38ec2
prerequisite-message-id: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
prerequisite-patch-id: d3f97f2fcbc99093e51f4b749eda4c2d0cff4e92
prerequisite-patch-id: 7c4695a73eaad5db182edb09a608c6bc51883c82
prerequisite-patch-id: f3743392de54aa4ce3da76d11637dfeedb922b3a
prerequisite-patch-id: 02e9caf718743f7860aa19031e6809bdd718878e
prerequisite-message-id: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
prerequisite-patch-id: 4764101927c437b38d71379f95b98c82a20a48ca
prerequisite-patch-id: e918a7b007c3a1b88b526fdf7865b811155deceb
prerequisite-patch-id: 8aba9f114cc43e24c8568caf5ca4e7bb82e54b67

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

