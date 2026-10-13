Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D34D487C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885520; cv=none; b=Mf0G4hWAjqo1SJgZuh3J2GrPXkOU/xcGiiJMT1/0EXmIlku2VasYyC3JskwrAsXd5JQut0HsgAKXKRTKq9Az5QMrgKDDY/r+fsZskP2LTvTuE8MN86uB4Ycjg1f9pCBcLq4v21ykd9la9g1F2YVtmNn2T1TDkoysFrotu2pEMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885520; c=relaxed/simple;
	bh=Zej6tEVXY3XS8Ou3kHT610dqMJ17NrWOQ8e38Rvr3SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USHIrlfA/KklVHHMw5e2KcxCwNJI8EoD40e9hmEL+RTVy3ZuSXA9pTmvpZfN1ENfADRfrWuzI6NmUvEDs8SdEAifULjoUfA6ZXMWW3eMmlLuzWsq3IgelGXNoNL2hNiM5lz8Ni2lT6MATml1V74h5hwe5j48KMqV4FSfR9OYsjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoWNrP8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyRnITmO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoWNrP8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyRnITmO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CW5G949569
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=; b=hoWNrP8Qrro4vjAy
	D42R+iPg9d9TYtbC1gV7p1dfbfgD82DSfB4y6Bh7fjpJkkeLxLvJF6IJS7vTI1Zx
	Y/mh4ft1dvhtImbHiHgqNCZYgwvxEnPlfpf/2jCj/brRvGHaUBRcutPmsFb6uaco
	KKZvhDoxrL1n0ZycClYcR8V1iyew42+9WegB3jbLUszA7RN/WgOt6K6LCSANZjcb
	z4kRxivrfYZ//zMctarzoo/6MkgMfkK8OQfev1cuU/UfOBOc6UGRd8jTcEtfJNB4
	nr22oI4vPZ/VJBxU53vFFBWTh5FwRTsZ2DC2ZEnsvfGyfi2sIXcDObAJI0B5Qce3
	Ukqmdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628x9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso487380985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885517; x=1792490317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=;
        b=gyRnITmO8/h64cM3BTd1Cjb9idkfwUAVAZcqhVU4Dupcs6uu8TYUqwjbz5DGNzVyMD
         +W/ibQ0BueXoFltvl19FO3r3DmSxvSIUotq9mI8rm0Nm7sk5vUCzfB2R9SCFtdwQ8Mk1
         /OveOqaSkOLo9vqA0Y7QJrkVMTyS39cGotkLP+/tThaDwp8mf8gpn1lzApOfD54MYBKF
         OOBGzRqFtJJTfKElgDyDdM06yfev832gs0wecreegnn0HncL5L65JjgAVCDO+6XhRr7d
         NOA566grzZEOuetq5UE6JoJf6ppWY+8YWGpJMaHxl8TI0aKbC4eOeblohu7ZC261Z1HO
         c46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885517; x=1792490317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=;
        b=EvhngqtvoYfkxqItvg9lrq6RopZeigLZg90nHaAKQILKEsLfFohy2HatEBSqmqEWbW
         YrU7ttuyK1469YPW5Kryqim98emF6Brz6H2wFJhUjeEMaMUfH6O9pyVDs6tJgHVdEC+h
         MC+GY3ILDKz+S6nTSh96CrXkbB4Zt7ultiClppVYj6J/MgwVSvKHfb3ndjUjbAkG2B9D
         IiIvIsQOEN3dV0zoJfTdLXSOY1HzKXRetdnOf965R9hz+1imB3mPMqImuit3FjxVLQO4
         0P5Ke/ho981dNVx9+BMWhiZMj1aHowgx9yope/rLfBbzdlffNavN/+wFRUQJxXDbPfdY
         Kevg==
X-Forwarded-Encrypted: i=1; AKwUvBxPcrfmf6bdOu67z0mwK0eud/1+2Ibn3bST2twW4XkQYCiC2vjN2EGOGyupO65XCaPSD/h0MeSHs40/oRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcboBhuMnueUgzWi/2EHt6fvN/CygjiGI6DRORne2zhSQUW0me
	O2asyTx4ik1wdAv7C+fx1Y0NqLCZt6TQIFaEo3UjbPrVbjoiXkWFQq0DvEAJev8gbFzxGnnVpfR
	59oabu8+vpTNMKiOHK2YEBGX5fXtLGY5nLL2m0mS8mNRXs+Lz705VrvGJlrv5O0tx+cI=
X-Gm-Gg: AYBFou2gm672WLwl5d3m7W3j51IKBbfpU37Yw4NAmd400lTfd3nmWrt/UWXSQyDRbIX
	qnXN8a5m9amuFCO4dnH6uiy+RzouFERK6smCmNBMN+WS2KXfVuHwrutBsp6eWmWwJ+zkb40eBf8
	bwa3uvOQqAc62I9W77qaayYH/mgLpMSobzKvtVwQ3bOCqzJBhqjCiYY62WjfLSFuSEsiSvnmUSX
	UWgoyqYvLbq6/xBE64Z7OH6locnj9o6fXJa5rxFghKS5+Ncc/pF4o2nwpKhkHJukTfKL+TFxPWX
	rB9IvG5fP0OJTd92yG9I1IKoge4OM32yE6cRsX4Iedi6sti6zpbUazbfjiAXZVMOdg/VFOmEtLv
	t3pW3dsztb3vIGwIQvcjhnAEIi1Om
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2035737185a.4.1791885517141;
        Tue, 13 Oct 2026 02:58:37 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2035735485a.4.1791885516739;
        Tue, 13 Oct 2026 02:58:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:42 +0200
Subject: [PATCH v10 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-13-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zej6tEVXY3XS8Ou3kHT610dqMJ17NrWOQ8e38Rvr3SU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCll+EhDulWQ9W02Um2eDa39pLKRIykk64ph
 aTz7hktzNKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApQAKCRAFnS7L/zaE
 w8pLD/9hCBxRLV50KkpLeMAITMx8dGDibLyEG097kwDGhfxQlV23KclhNzYiItO/lr8jVCjSwr+
 MQYDa245NgGOr5FVSFtBno9ifIohiUETJExmq/id+drO4MqcLBWT3MB1t/X1RPZTEaK6aNjLH6f
 u7do+pA8jgZI1vhRNteveR5Ba3DvUv+PvYugpwVCzSTzl59g1c6yai0PdCMixYPoWNllIOWZnCH
 fYIlmQp1WtqWjdMNBde8pIC86ppgFpklpzG/23wNmAHKE92ETqBroL8fxlf/j4niz/RvkpAwPXs
 FDJxmX7/qmSyqkf9WRIatqDzKcrfMos7cA2otaiWV/H6eLOJwfZbzckwbqC2//+1fNY4KgaKwpI
 n/vEElQihitwhME69GTu+ffO5lvuqIPlRSMIvBe2ffkdXM4/NSiEf7P/yZuSgpHEdeIGXzVKhv0
 aKbmK4fI5b6JzjLX5vMXQrfTsyuIUmmRavsqjaeDHQtMLB450+7Hz2wKJ+TEpgjc6ymw5/CJ7iy
 AcGqVis3WjJdU5sweCbWbDfl9MsgTQC8JeahCcu6yDpy6xwYv/1GNpPBEj9pTvvr5Uue0z9oAvb
 cC2oTHnJ6bB/V1aoZHrr1s5qeBSEG+xdhgj912MdWCs0sR4QscI1kk8l97hjurQcRBNHltMruIj
 +WEle0qHgQqgTvw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace00cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX4+r+BTDgCALw
 QPn0VtjuH+HNTl3pXMJ/SQv5xjAPcse90TLLKY6Ayf/KZvRpqKK8vT/2WkqgRdwdpjDMMhWvMeE
 yWmQySG6xJGmzx62tvxZ49A/tSowCzA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX0ri0oFhCpPge
 hQShLKfJ7gq3revyvOaz1SibpcPIs7dNuLaybr1vVCk5vK4m8sdkoKvHOmNP1xBQah5U9rd+wkY
 W7bQujt1BViDI2ELQx6iH+q1a78GxI7ashcID9YOtx6AJL9mQuwosbKeb//AGon3icEeF9KZgpT
 kXvxQ6abVurDGQ7jZ0DVce8Kg0xyJVHkkxqI6HuRxwDC/II/fZmpZ2D+6H6lXIKFjh2IDVqRDsp
 op29hQEAQHMm7uVoxDF0TVydP2ULPk4WHWP49HugXcX/TZjjxlwI5ppkjBnHZZOZXZWM90lsCSN
 kY7fWmz5Evsf6LbpmE4VEI0ZF1OUAYsIPnIqL8fz3bMaBjzL8XGfL7UtmzmVsih4bif+WvqcAXz
 t8xtau2sXyOm3O3ShDwMgDnamLPSWrM4JFJpV3i3ep91xaA5XpX6lJb+qKOsZCl8+seFjHUshiC
 fbZUuhIFbbS6YPqV7Cg==
X-Proofpoint-GUID: fE931fQxOTiwdcp5HGWk7v-sjZF_Gw_i
X-Proofpoint-ORIG-GUID: fE931fQxOTiwdcp5HGWk7v-sjZF_Gw_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e80927f87ff26fe3f51db6409f509fb99ad614a0..760f9e9fb2ae13392563ade5de871a5e882d195d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1663,6 +1663,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1949,7 +1950,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3

