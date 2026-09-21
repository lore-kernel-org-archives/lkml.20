Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6A84A0129
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995556; cv=none; b=pXv/K52n4hM+T5JwFhGzpMOhfCq3Ed9JCAuUdlbP5k5R0wn+GIoUjUsLiBPDpxgO7+xvOKH1TO4nUICNitqkrDpou846PKuEMFFyQqFKzf8VFP4Z3PbFZ4AaE8+QKLQOH4XLSz/iCiwjQ+SAZ7qdnIDcey6zTy4lYjIqIK1dxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995556; c=relaxed/simple;
	bh=bCktZJO/8gfDzHepvow51xjIR0hEa32X9sN/sjtpGu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bw0wYUo91B8fn4SQkRQ08iR91WZSvWSWGq7WoE6tKplU6Pf5B2CrEt5Ns8zgdT9oPQrycTzDFmHqjOP8X8u+cEP4kSd0Hf4qHQAix1lKJFwGrRU0QvpZRK83xS3VBdiR715wfsz52ME5ewHFqsEL28Ch/xxBFnVjmYJni5x3Yb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIlCNTc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpQ3d9wX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIlCNTc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpQ3d9wX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAduH7287294
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fr7NjoMI1iAMhi71+eGjCtTauKtots8MRIQ3wqCQYTU=; b=YIlCNTc9ZHZ6JPEw
	7WVp4mNAxf6tkdMuXBiq1ybVwORfnzkRrWCYQN1fC2Z+JTe0fzTcW/CWlOryoRT0
	SFmt2s1xF1pUuK6KuOJtVlPs9IAwE1ESS8QrpUzBpvLVjAlemKQNWd5rC0JemLSo
	akv342/WG963XfiZnWxDvaTzMRJCd48Wv5IdOc1W4TNHIOHvyx1zv5giRIQg1oGG
	xis28DH0bx6HVGP8uP4WWBOF5KA0UAyFsHAjUXbYZxc2GcC8tdEh1buKfGVca5H1
	/FYq5Xar32WW6l6gXq7BLe6WpYrfgrbgkCOdvduMTRoi57NCmu4BRJThrvxSvtt1
	LxLhIw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj154f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:59:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fb21aaad9so2849212137.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995553; x=1790600353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr7NjoMI1iAMhi71+eGjCtTauKtots8MRIQ3wqCQYTU=;
        b=CpQ3d9wXt/hw7taf5sGlLOARZ+MMoovNhj3SxRM7WxDtI3+S7kGbpVeClGX28Qzt4t
         R7A6I/8oZRiPfiXB8pWi6mSbLZvcAKbCK9OIbiexDY6AuAVgAVuukgYUa4ONYuRVeZbn
         eFE/3yVC1HzTimfOO1IgYrWp5g1T5tI2159OWLpfhbtbzJ4iOOvypHRq0mhR+FxasG4T
         b2Lz2jBrmnkypUuPXlfFLBRXXJ4ZMDsZdQlNeZPvBRAmNN8RSsaQvrPtSDDKMCvrnruz
         3SmR5lax9wJ84p5vgCq/iTtse+XmXJ+LK3onKMxyreQ3rNuSsq4dzg65QP4/FBT7RoTV
         bcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995553; x=1790600353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr7NjoMI1iAMhi71+eGjCtTauKtots8MRIQ3wqCQYTU=;
        b=jdt2ux9BXyblyDBAH39bXKYSJhHS4iMfAI9eYbqGB+PpIeE6Q9x85iCRthzDD6e2bs
         a+0NfOhmtegs4wJQTiQTwMtzTAqXVkaapMiViM5vdJzrngvZ8o1bf1NrnfGyvn1Pu0Bs
         uVC8nN9R8fvIzVnHSLQXX0DPqObprXxbzGmwju28ayA9G8DsISwqclLk+AN8o87/sfOr
         TRqIxkjXwmF3ono45jQMwN6VRnGZvWI1PjZSzwXmJc8AxhU1NdwcX16EpHKOvjsZmgkN
         pCExTtci6Ye65F8k7AIUorPB/1ce/WPScRNZ9S5f4nU5zeADJTxhwxmfnysXhzUDaFRu
         wBvA==
X-Forwarded-Encrypted: i=1; AKwUvBxd/WCYvxlj/HuuWFCVw6rb7OynL1hs2xc/c3IkXRCMflUlOpOfNzDzyt4tbHtRs6ytpCZrIJfz6FRXvuA=@vger.kernel.org
X-Gm-Message-State: AFuF++m53cbdcR+SjjkT5pw/6gDQlrUMO+t2dR7VBKaZQS6iVDXAgM+D
	SVCEcIrvJNOhfJ1bkHbICtCM4tDbs+895aTLNkkkf4dj8gc6xpruISr74/xVW7fKCl6xfZfl/Za
	w+yi7mRzgL2VoJ3YF7N3gTVnpzlUjqx6YPfxnXFlNccf+TZbTr+dD2W5lR+Jum36OQK4=
X-Gm-Gg: AYBFou35+ezzPMYCtIF6R3EE+fhjnD1EWz5hMZz4ETV3P3eemNpgHaHs2X7D62KfTZc
	fESZCxnz3gvjh5wE5sqlAKFEvg98LXMgIkb4Q1Xds64jtLXSwBmt6T5+AQ7tMP+p8e9yltRQRNJ
	xdFlssM/iAMrTS1iXd8cByp+kXKGsRCh7+OjEFc09NoUVmyoGnSdd8f3ZVDJ+DnnmNcgkKEaHGQ
	PxuD8JF96lIfgta5VBjNEh7a32Bvm2OzQRb6ANAfjmASKioJAUNjq5QZU2op5sGz9CNRu16e1BM
	Ij8Rc0g0bnemwQ5gfu2jIy2Pj9iA5tzkNz8bf8zmv7G2NfWqNnUDBjxMiU3E0Y9R7/y0oYa7Leh
	k3Vz3QTsRdVOkb06JyDL7UyVU0bE=
X-Received: by 2002:a05:6102:5089:b0:7a9:3b76:61ff with SMTP id ada2fe7eead31-7a93b766357mr830001137.1.1789995553214;
        Mon, 21 Sep 2026 05:59:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5089:b0:7a9:3b76:61ff with SMTP id ada2fe7eead31-7a93b766357mr829989137.1.1789995552881;
        Mon, 21 Sep 2026 05:59:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:22 +0200
Subject: [PATCH v8 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-13-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bCktZJO/8gfDzHepvow51xjIR0hEa32X9sN/sjtpGu4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSn07cNNi8xasmcFS8fkVlOEvKupnwcDN7voH
 2lwurq97d2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp9AAKCRAFnS7L/zaE
 w9BeEACwNMbLajj2JtvYEF8mbMU1mEIIcPSFF+0/wUMsW/0tRO661SvDjdjed7qGZWxuAV7X47l
 ExsQ8lo3YsGYrmVSORxshTz+LPppkAaeFJRedUrZxGXnnzlPr+ZKOnKXH2vkdzDbgUQPTzAldO0
 oJG/P/1LUpLofDDeBWGN1ZiwiEOwnpvB6c3Nrt5XGM0tiq8STJHWL4HxCDQsjOJlP7Fhn0JH7Dw
 5pZ9G/GTnSe+o4fmzsyfFk1WKQgNapClgDv8kefAIRJXDGHriTsiVxsXt171955S5agxjx6kbAY
 2oKGSltyMKOkItJPKnHWkW5qrt5sqAtNg2kRFiD8HEcmBqbWNGz8BZhKpgXy3ML8jLdQy2yphBY
 iiGC+Vqfk+SXVifz7WJOT65up4oJ6f17o7wtO5/eUDsZar5de8+ZoxO3X0y5yVGAe16rekitTQH
 khIOXnud93SABrJapqTwahU25PamwkQhG1iFTDD0UrEyV1AW+a/aZb8/9tj8GCsTEr94xULOQoV
 tSLu+VrG5e7BJE27X0tiBVzH6HxuSaXam03/89m0Nb57ZPXCBS6bzJDEC4Nqjd0wISIpA+pFnkc
 ZREkzh7gayZ77pqlubs+dPG8d5Q+/f4oV2j/01hv0PqpDlhxSS34gVgvZ/PRm5I/ITjWcxe1bmq
 BzkHeGc4I6mTrtg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfXzEywi9RxBDk4
 ZacDajcO+pzlzL8rcmkSxkC4Hqzz4ceiDWs72QmrAO773LS8+C95qktE9hQEOPFXMa7LFBVamgu
 wC7StC612ZMRo6IHEpgGNm3YcJKEaQU=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab12a21 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 7Wf5FNb5kYPWIhhu6I5ij81VFWZw_99v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX5qWohsZJXwGE
 SniWr4f8LQjqvFiaqt2p3u8Q9xadZhUkeXYys63VGmzoWgtPHDqVKNH4dTy/xvylT62p/ZTzRmL
 dI05yGZE+owokKHlYJTAH0fEtwVY+sy8hQaLTt+psju2kyDpJXNDIZlh1743cXPMl9fc7K/OZhV
 oWomPxkqOX9J+SdiQRpiQP5DpbisAakx6mgdQsQk6l5aWGHX2g8Pak8wfZWJitBuxhMYle7LuT/
 sb8TRqPt7tbyE81+7Ubpey5iZ7YufHcmRagFxxvrOAH1lMqFvO+JEMVYDiQlv0HojMuRK8lAXPc
 q1ZxP43Ccw+qeYEuzCrhkjBUbZjRhrflu5FCpoxR0eNpErQicW/4BAE3tAGcv77lOhhx7mL84qu
 1l7Z8VJwHcyWFmZ7HIobQVE4QhlTpXjDDGAjRzw/UdrgTJ4METV0EuYRwuRmnrNzoxKvDUKwLVN
 GnGsdla4ApcpyGsl7HA==
X-Proofpoint-ORIG-GUID: 7Wf5FNb5kYPWIhhu6I5ij81VFWZw_99v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210189

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 55a2e8c3ae3522630df8c31cb2b7c7663e973aed..360d07bfa39a824d13e463912aec15f6fc58e5f2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1671,6 +1671,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1957,7 +1958,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3

