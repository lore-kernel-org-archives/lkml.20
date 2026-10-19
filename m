Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EC84F85AD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417714; cv=none; b=Es0TEk61/eD2h99Pa7wUGDNjuSK1csKly3kGGQcbkpalhxeT0wkRrzfI3ahf54SUSKm/bFUcgUeXrNuPhhZ8DJlkggib2oeUJ4ScE5YAMwiglSRyhqR/PsoJ552KDx9TAa2DDZCELI6KZt7XNv1wXuCi4X0yjOAf6mjL6ONgYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417714; c=relaxed/simple;
	bh=4Da89M3KYk+MUTlXl4U0p4CK2jrKgzqnU4AawRHAVfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBcWwNly25+vIoqzkXQg/pUARtkad6xJaNYB8CqOSKQGHPuFpXi6wmM2BG9qXyzjLG3ZDB7IozO44YkQD7tM6eU1YDG/8HVfGA6LALao2Rq/VE/MC2ehl7m8gdgKL7VWPBKNLvJ9kmTVXAEujRNghFnPe8YgbSJAWW68EW+l8XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCIB2Kc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WpmtDnnf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCIB2Kc8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WpmtDnnf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JCsYPd2483567
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o9BDH63wczIj2YAI5qdwIKZTFwks5QWcMeHl9cdUdl0=; b=bCIB2Kc8YwnJ0ofR
	kxLYyZ3c7O3T4znOVPakq+qrdvTxAiZuuIGzx1r/JCE6O1r9eLtNRAzOZcH1w0Ao
	S5G9uDkCcGcsHO6LIkeibUjYTgIta6RmLhrq52waHKzraxIZn+oGgv3EwpFChZj2
	YwiJlDN45g8dqZon5C+308j/ueyTSQ3pQjldVCsT6vquw6qHyLs9yQycPI4Zwo+0
	5nPOuRdYI9/net2Tqz/JG23b3N6I+i4dtwaLKXS05AqGiXvmOtqVelBW7h7YZZHy
	yK4/LarHYZqzOkjrsqNVkEPcOmDqvnhZtB59glUOqbb8/LT51cX50oCOBUWN7CO2
	jq2eTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfg7b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so424303785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417705; x=1793022505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9BDH63wczIj2YAI5qdwIKZTFwks5QWcMeHl9cdUdl0=;
        b=WpmtDnnfI1gNrLSzycEfvIKVmUOmQWYvkI46xRD2zVtus1qQU2+XjdlmxZnalrrewq
         hiQCUSMhalu3+GPPQEbnU/2laYD5IJy6Lwr1cxl9phbqPVJ93IjpboGxqGCHlznj5sdw
         JeD613IsjDFGb09hFMSXdibGLI5phBTKzVTo6i86ke6jESaargLtl/Pw0AnhFM3i1xrL
         GlR/UBfKjam+EsJRueVNx4FboauP4qb4GjsqAfSdITnurmDyGOMwRHg9zz1NdiRb+Ozx
         9bFexnsQgYMxYXjjidUErP/Gtpu4k8jqW0TbMlgmDbaTubpMAng9VyPLsFXVv2/kXoU7
         8wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417705; x=1793022505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9BDH63wczIj2YAI5qdwIKZTFwks5QWcMeHl9cdUdl0=;
        b=QAZZz+zRUolmvVKRa/WLnmqf8Wm+a/be1o0uXcjcbf1b1Be4iirbDPeFOHz6/+Qu6Z
         hRID6hRGhEPULAAmz59uQqrjRl7w5Y16d7UonmOutLjYupJXoM7Rx2xdKQEty03Fg7r/
         doBYt0N3tTOIo84I9/2eVZpCKhyxrUELI6UEcYVzc1c9G2sAha/tXyFGysYqOjkadknx
         30y9PQ7f3lC2BZnY0Lf4ziQbjHRnSIPt7nIjoQfhdAgS17M0NXuMeYUYPBzm3MgYh4b+
         mqz2Vf/CdthFy3rYYrMLvbEFmwfOXj2G7cfV5MYoL2F5Ssm8W7vKCAdfH/kWpHSz7X82
         oBrw==
X-Forwarded-Encrypted: i=1; AKwUvBzYIDyJCtWc8HLn6unKVohf/RIRmuWBTRU2wkUYuYU97dLhweiw+fBUExaURIOPEng18TPgbDQ4Zp8eCe0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL+Z3M+1IMmV5PEhD8cSovUsj/jZToXDM1WFot4M+2lieiBG+Q
	WPMPLxoSsCByvL4LAf15+CDTrIH9YmK3xVSlQjYfcWDg5Z+3Pp+LUoLWYnGX6KBOOVCYGb8I486
	Y7Z/kWrXy0ehE5thCoyU1sefjqjQKPcQXt1ht9ibvDt08nrYU6PwM091EPGaKDK9STys=
X-Gm-Gg: AYBFou2SN2k45dqWLaX4Opt7WWQiQ40+SuiIjRpnYOJlHDbGP4i7m6dGms9+7qWigi7
	9gDK99y0q/4QI8+QaOY+Zq/u+ayW94bXSVN7iuzGHaI7jjmXgdwDGqgQ1UOcA2e/SofUXbpVLo9
	JCfGejpUVETamM0qhOWrrfQsSXnJSh9x4O+2lBWChXsAlWdSWPvKbTJ85+HSPVG9si7+Ibmu786
	R1uGLArGg6V52ppaDefy/rapL/8Jvriw3yirKLi5E/PmlHLXn6dtWfy/ESTzGMGLzDeVnjMPn05
	qfkhuPb9KUIJ6ioPW8rN2vs2lDL+2ZC4AVibnC6vDfGTqSzblaLeHLc/tYizT8soAMiiLcGvoZL
	6Yfl1fH9cpMJhZ50vD4N5frGPBb8c
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr1746256685a.37.1792417704797;
        Mon, 19 Oct 2026 06:48:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr1746251685a.37.1792417704178;
        Mon, 19 Oct 2026 06:48:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20595574f8f.15.2026.10.19.06.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:48:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:48:09 +0200
Subject: [PATCH v11 2/3] crypto: qce - Use a fallback for CCM with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-aead-v11-2-11c55cc7a695@oss.qualcomm.com>
References: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
In-Reply-To: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Da89M3KYk+MUTlXl4U0p4CK2jrKgzqnU4AawRHAVfk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1h+hxxbP5TLmg+guVtwwAV1Z/viK6g+mJwxGz
 3YEt+OUdjaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYfoQAKCRAFnS7L/zaE
 w83oEACdTr55eATu9vC0zIWQRAWflkOCGQQ0OTUZmNsYmqleZkTfOzeJFIG74bPhTqQpYIZgFqB
 Ct4lKB5b8W3f0Z4bjGVqGRNWBvDU9isJdWhmfoDpqD/J/l1Hq1Q7+QVivpXQ9yaFMb8Qog6mPP5
 xnvNq4Jvdarr1ssr/CQGl4EMUJpdIpJIM/EaxE0EFeAZ4yfomZtGIMr63GRUQLF1Oz4LyygGFmB
 DUnqHjMsVt+aVPCdjDSER9oFY2Z2e2V5gg1QyTFRYyyWsWVUl5zZOnG1YEQniDGHKwE9JSCQOqX
 7UKHo/09RZhEqDOf/GdJS3lrT+HZHdo996BufTKZeYVd5S0+f+LarPNcNaKjX0meAUA5Yz0VX9f
 BiD70KLo2Wmwu4ECBldVBQt2dL5UarWhgVasMDHq/Cg7NPWw0iecX3uX3EDerz9dBn6RywjbOiH
 E48+tY7NIR15+VJV1d5hrpkN6LsijnBM6ZwoLRLp+IVv5qvDH/MMCLSRc+HzSwMqu5jarsmJjBA
 6SsB4TNagSKST299WROryEx0QEZmcLGdfA0/W3qPz1tV6Z1FtaA+FMeE4FcRd66JdBHmwA5N3yc
 VG0+TlWfIesqKuRflwJ2v9tif9ql8adQ3Fs1NfS2lQnbvNmYoU2dW+nyLv8idYxMELdZadrY2hl
 0z49ZvKlYeMiD7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: lPLVpY1OvfXNZmB3lTclcSb0bI_NawYI
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad61fa9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX6lqFI6RcZGTR
 tM9VMZfJCfa2tRaZrJ30ItAINsaEP/Y+UVJY4OG+iNXoX9x6pX+WSFrVqehBXbSiQJb16xQOLp9
 3kNPCvaAO7HKrSAhjJ981TweygbgqglzPxN6S5nB0V/VInJFOTCviLMTHIBb38C21peJQ6knP0C
 23vX5zufXgVh4nKbKiDAyTNVvcZhP+fXCCcGNOhyC3IjgWQ1NE4OGEb3qpICjG4ni53DJhH98aw
 yxjZU3YS0EyidqIjDE5wjp3Qlqfufu3Q8rbM0woGyBSYzAysjwa3x+sO07gvxHEojASIGAm1/KB
 y1uYknrnADBb61a8EzFIjRZRwgTu/YOr7KrXq13hCkgEdJHdztOZFBuBklFGnZcXHHYDHE/uZlq
 nhunmL64Ug6Jtmy9dbVlP5US+Po0FM6KYFZgRaSDVaOS/Cf6Sg/t7Fi6raOZAZOkRb1ThqF8NCS
 cjA1CgSzqTIWslD35fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX8cejF4bB/YEA
 QyKJuWxY4EzNXw40lhjEVJ5v+VdeLKjrXlQkss0ouW4U6dqRNP4cQSNBL4dLkB7J+dFu09S0ja7
 PrCmNT9/Izjtd/QvtSFStxb8bgqWPSs=
X-Proofpoint-ORIG-GUID: lPLVpY1OvfXNZmB3lTclcSb0bI_NawYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 81c1a9598474c7c1623e71a9eac876fcc0c111b4..f34e4feb3004d9bf63c2c8b2aeb3975d86ac486b 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -515,6 +515,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (fallback) {
 		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3

