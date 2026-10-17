Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D323EAAD
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205028; cv=none; b=bDd6hGMSHwGkuLhI4shMwZDLcWRFjeMEUO9uA/vJcg+qiRyDhmpYHqoPzE4Vbwv+qfOUDMyC5UEJ4y1AJCSQjLtwXWoA5eMbEsCZXcSeZ78Vuev4tdLh5AiHSmRObCCR7ePPUDjosOsV9CpSSFc+Aam1NTwBUw6abpxxyeMUDu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205028; c=relaxed/simple;
	bh=TKeWP2gZ4ypXDdjxEZDA+RfB8dA7543LL3hNL9UwqaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTsj2pS6RtJ3LoHBlaXk6WCkTKVD2fQLa+k7A4Mtxrl7BugEi8nD+Ddq5GL5z0Ztf5Lte0Caqmrgwnvl+89MWk3qX4KMeTzYyOE1SY0IUZf6wSHXOPLh1ZOywfxfefnnPwBE5+Rn2iBk4PMRSo8eKwjCitjdC74o6BZ/9CfmLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaRx16ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+tDqD+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaRx16ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+tDqD+f"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFHTr3627050
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfe
	VM1HcCDg=; b=BaRx16ueiba/Pe1aG3hn7gXuvZ5SPiV7JPNsbAudENzaFQCkdvF
	issFFq4S7ZASAMJImvoIB9CssvLDRF/m4wLs/24ygeA+w65MqIMM0Xai7Fud/qJP
	7WP8H0fkr72csFQ1eozMMdhDP69+suSnqr3gSiOeY+G3muvgSyTo3N2RO2guZxAZ
	HZyvwuDk91v3zbFZublKht+5xuhC50E12ZmmAgeuUXRbuLuTR3A/e3GxiVb8yJQO
	tSvPcNdNLqwMXF9USGqN2Awt5Y8fAcWXCb777wzqSmyqGc9tzIpHC5/2yxtrwiaS
	T1UgpjcR0Iy/AyKWx8TcXTGDHgiD6d7GJaw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yukr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:43:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so566363eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205025; x=1792809825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfeVM1HcCDg=;
        b=W+tDqD+fg4LIIKua3PZZJTKIT51RLi8VL1JE1/kPP8TqTVMQeyTnDup8Yx/IzJ2mjn
         KSkUcSuIqmX9Vc7kEleIY+BkFdNwHgtKvFtnduDuO0Hb7nAPLhnhldD2zRjWJzeTsTDF
         e/HukZMDXnzpI8H76KzqAf721UfpWt7QeWKlEEy0hC/mE3IUo2JnOPBQ5EEPREv5UkxC
         +qPOyBL0BlOfa3odC3LBk10J6RM5gzKpyFTZRmLwB1sL6NzbCyAgTOjn2uAh5Y6yV7kS
         7c4Md9yJec/xeIf2aLj1MQy/mwY4NuF0vBzwa8i0zFWGCy/1jXrQt1L6Pjqd1RD+0Gth
         2waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205025; x=1792809825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfeVM1HcCDg=;
        b=oXR5RLVWAL0BRWK4NRpkmUko5JbhqDcUzEE0N8Ge29MblvRcC91x5iARJL6G/zmNfQ
         QlnUDPPP/6RMOadmZaG48I58LqZbQlCNVJXYDTS8bORC7sdEdEtE5Pw9dWkvO+dbPRBX
         BuBhWZCYHalTjfIlcploX1VsFgVOhYqJO0EUx2VFbydIs52FMplFk2JwTMjVVQ9KIOsr
         mdJAyAwWvSmf32GjieofcXmDl9akn8G2E0AHU9bn3bUZ9Whm9lKmsz/pCE9+wcbWaTG5
         X2GKNv1JjNzK2XzQz7Oc9exCZK9zCyRZRWszz98ppOTe5VdYD4AaLcKILIiYnVoOPiLA
         P4qQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4hCvPVtBefWrgC+89KYQ7TJ5ev0+uTmhEL0/1ndsAvozN9MkljkH4sSX/Wv9OPgviJFIxX5jQ7dSITuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWDasihDJ6jC6uQEYQAgGJPiVYQ8z7wnDCVnQtKPtVQXXWH/ah
	zMuGC1Q5vAa1u4/Eiu7Hu18AJ4NfjqU5wKQWlc66z7xLjNymIGg0kZXgNa9bykmm4wA0l+6VcQ3
	SlkZJnSpa3TS8aDheBcV9pF0UnWl/Ztxi/uHj/sMiAsQK0zAsjccz9XRQCEDp4tnKjiQ=
X-Gm-Gg: AYBFou32OqSAA5PK4cOjPzkQeYaIjPyH5FlJejsLc+Ld+oODX97YiNbeQO+e9ACxdSm
	Tmw6+7hqTG7NdO0eVInjsYMjJO714Ok6urlvvsctKNMLBcFB6jtqmwGTtIosZVjQalov36CX6Nw
	IglssbZ13EqsjKoC/Ry3ybQ3js68Pq9OyHiiznAfPNlYAB9MIly+j3nMpLEA8bVSLa+2Jsv0jAM
	7ojW3uqU7yx9FumhXjLFfd8AP67Uq8tTEwnpB3/X+94PWKrv+85MMzyEbOGDvWwZOey50992vVu
	zOMrXN0riXzE8lVyg5a21DJ2RhhNf1suj0CJ9FgBrec1WaIuAecbHVZnfUDXd87SrRnmLpfFMht
	nO+h0YGDjwmTOR5sBQpGizCMiTM19FqI3j+UW4ZbtojfCSzrVobTfNFyC/Ck=
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr2243471eec.7.1792205024579;
        Fri, 16 Oct 2026 19:43:44 -0700 (PDT)
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr2243446eec.7.1792205024034;
        Fri, 16 Oct 2026 19:43:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/3] gpio: shared-proxy: Fix line accounting
Date: Sat, 17 Oct 2026 10:43:32 +0800
Message-ID: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4RSKipYqt-fkqwiafUILPRsyBP_2vqrd
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad2e0e1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wt_9iJvwzTYOAWNau1kA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX4bhVdF/oEK6a
 DinVLyOmmpOeMfu6sa74uf2xliJHbt2LtISOhkgVIC/ml7T2sacSnp2P7aVxONCgfQWpQF9Hi8g
 YuN5rKR7aX7q1AEMjb1E4mBhSNl8OtI=
X-Proofpoint-GUID: 4RSKipYqt-fkqwiafUILPRsyBP_2vqrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX3A4+ieFh+OUy
 9cBMIFrUy0I9btCHgW6o3SEusz1OblfNiZ++r9/T3IknX/TvUkWq/ZeImwNEC3Y2NdWxQ78pB38
 F8CxT26elmoqdv0bZnFDixKmYXeyN0W/cNCQGfFd4RCqPK2AsgiUEpQqFB6A/yCLzxyD85OjahB
 CYrbkk72RbmxRu3vbVLxZfOU7Cln0YXq7t9Swvip8kWruPEthCmD2cjfiLRWiLtUMSnqK4sYYL+
 fQ4jTOg0NEI+dhU07wVcCAqqN4Dy+rboqNtr1FyD1tgE5kUccUJGFDZqo2qMHscNfPG2K1mPr9u
 hOb9SMuYIXHlxR5rYoxCzu/iAO4l/qMWztIh3iioISzE/iROcPeJgbyK6Z3kUTtz4GX6hkL6FDw
 YadgPEfyjFd2yoRoxXtl+EFwDdVfQHRwQakPKK/yMkybjRIcXgOzm+ll8U/1zYp2sn5hGy4kGrL
 q/a8CUJcGh8pxgCo2lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170010

Three fixes for how the shared GPIO proxy accounts for users and
votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Patch 3 fixes gpiod_set_value() to the default value doing nothing on
a line that was requested with GPIOD_ASIS and left at the opposite
value, e.g. by the bootloader.

Changes in v3:
- Patch 3: New. Drive the default value to the hardware when no votes
  are outstanding. It predates patch 1 (Sashiko)
- Link to v2: https://lore.kernel.org/all/20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (3):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure
  gpio: shared-proxy: Drive the default value when no votes are cast

 drivers/gpio/gpio-shared-proxy.c | 91 +++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 80 insertions(+), 12 deletions(-)

-- 
2.43.0

