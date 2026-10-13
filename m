Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043E47F770
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885502; cv=none; b=d3ZKmrCJWeZHole9E6sCDrLKV47jGy/PZxzLDAceRka+xhIr6RGgPQqnD26tENwQ/8cUnaIeE/iGey/CO1FfLaZRrB16MWm6VFQnQoDgSFC5pshvYtp5aKOOJK7Rpqie6zLArpYbsUeQNHolYemZmhqBL8VwmCgePzd9Od1010E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885502; c=relaxed/simple;
	bh=EKtM1ReDBXz0qFhsomvF2hYpsKSPwG7AL+SgEjlwr4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lT5YXRsKHP0r3EdO+DuJsWh3kXofQCgGSN6lA6p2iemp1/DjxibgBEEMho1JJ0+RGo97qY2FJ2FN9bmoIDbFz4blbyNg4mMHPmI/dTs+Atr0hpR0s//aGWTm8JheJfmc5iJN1r9YcBhSRSAF9DQwZpP0tpkxV6fQHdxb44+6kCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ScbbaKlY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=US8MqQt9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ScbbaKlY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="US8MqQt9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9OXfS173325
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=; b=ScbbaKlY/WJbg9al
	3HGeZHZNGMsO75eoEsVbaN+zvHRLiSaQcgtV+pKSxStmt4C5pHr0SECbPYotpKsi
	siB1jS+zIiJJ71n4y39ArZpKbyahZuebdM158o1aAfeuXq4P+idtxawnvNBuNm7Z
	QUF2JLVKYrlIsYcs0MhQNzACOm54x6LhZlDj7qPfSO+w5F3BgRwJhV8gTMw2Trbu
	KhujpEmZ4HGe3BemZnm666YYKsN6NettgjdsAJkpgwsEF7tfN2DtC9OxQS4IcCYj
	qirpl+xW469/FVrhN+b2yS1K06D2VuKzHIyyh9kaIxNmurzN3yrbeErYZLHyoSvJ
	L/ZigA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqsc49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso487334585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885499; x=1792490299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=;
        b=US8MqQt95RottaZhzaXjkt1s7nJAZ3HnXdyABxHqmgel7dj71HKxUopo9ojtiOf+2G
         A65lSjrsp3Hm8b0C2doO7n3BrI6mOrl/0JO7hfMgP6gqstLw0mSztlnh9CDnYP7/wM7v
         ch32wYgbZxmBzTgK99+3esJaqb+KGigWpgwcyFl/zCZA4623ZXiKXm/pxGyLDylI3FQQ
         CtQq6BTS/xp4MMye5L+nJinYv0QVvzarrb2f0RwUTmmfOP3KqxegQ5McnlCfaK4zB+TP
         n9UtAM1Huv3u6qBzig9eNWyrWU3pJzgD5WKlicnG284As2nvcUlMfvFMV8mCvx0Z+MjM
         qdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885499; x=1792490299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=;
        b=zgDCj22t5PLXLF8l7xEQhntNuH43L8bx++tit5yuHA0ELlM0yo/EOapy/tJU8tn2z/
         AcKrdKzxg/RsjlZ0M2YE7rb4qM7mtqufgevkWvIyRhpCGgAjZhNxrKiJLfr1wCS//3Kd
         WJHKbTpTr6sCc2nQA4qEHOuz3gjRTK15soqbeihiIPP/7Xq2tBxldSrgNXaS94uKtmvj
         C0knFn0hrb9hCKsY+ZkqwTj1hGIV9kc0YdBR/S8mjv3yc4jZ15NmhDTJvL1/i14ILeAt
         cY5k73gpo8X13X7ClMiQjgZNtQqqpxitk3Du7ZuXedVTyTiRDZjejKoE1nuKsaFf4oL3
         n5yg==
X-Forwarded-Encrypted: i=1; AKwUvBzjyv5oc9OjFNX1SgAS5S/gC6SGQuJGbO9AGydaVyOE/bxeTneZ73HylWeV55Tc2ZvGyHm+vpD8h941/uU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKga3RSrnD6shrfZ2k0ZS8Dg3acrwPvF+m5D8qIYEGRREIpgXa3
	NnLLipgWzambu3mwnd9GGjaBozOyrklRo1jkwTTYusN8ChJKC158Kxcq+DzlrSH4k3Q7nuRuUro
	JIccxgaG2kWKSJJDCKtgEL4tB7P9A/fUuVVG5uYn9vVzBlzjGzGH0uVoJwS1HwPLGlGs=
X-Gm-Gg: AYBFou0k+WE9NZIQwWbetl4b/hZL0kvLPwR+9V+IHmJLZSz/G/yBZWcmZlEGAeubRsf
	AHcg7DqaIjhUO/YcZuIzes6JT7aq2PGciPpb7TEI+Ih/B6x/ZSXQf7jx7oujer/CtCzRkGO2dal
	izzxAdwUy1zJNOm1bBOq8CMQQEAKWL8Yj5U7agPs3/6QNLNavHn/kouX5GbXWJMPw2e87i5MbVE
	E2AZWyRo4Mrsl+LDRX9YENSa4k7WcA6yLDLRPaOcIB83cd7M6MUGAs4iB6Qwdsk48i1wooNk8oW
	h5ZZCk4fN3uHVZcXz7b7YPsvZh+JY79QK+qsJipX2Qwe7YDSTprgbmuIHLv5sGHCiBpCDQPDp5G
	/YrMNgF46mA4cF4MrIkwPmLbjsneI
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1839629385a.50.1791885498597;
        Tue, 13 Oct 2026 02:58:18 -0700 (PDT)
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1839627285a.50.1791885498138;
        Tue, 13 Oct 2026 02:58:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:36 +0200
Subject: [PATCH v10 07/14] crypto: qce - Use a fallback for CCM with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-7-57162a38a554@oss.qualcomm.com>
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
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EKtM1ReDBXz0qFhsomvF2hYpsKSPwG7AL+SgEjlwr4o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgChmTz5vlTcgTqMWYmz8l/ZOHfRBfagEfhK8
 5WgIF/kvZiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AoQAKCRAFnS7L/zaE
 wxLrEACJEdhFtig+pc/1kwrh2cYoM+tGC4xjnIIVhtJ1BRUIgolI1fmJUrI3jPQlA1j+KaK5C9h
 +CRsDSDIwVCAHNHIp9nh7SeJpHAVQJ8c9AQhwUZzT12/csduaZe2/z2UDiuHkjMe31VYQFwXGjv
 tqUZQ5cqpK2WKeVK7xukJ/k41c1rUXHYYWeLxxDjyP7pDHzhZl5OUmsGR+cP7VvK3ITpS4STf2y
 dwXGGng7VyEiifRwkI1N1uVeThcNBa+YMy/KmZ0XLc0XuQ0L69BVtgttaqw3+BLGHEJzFGC82fn
 B71Kn38fefC4NItCG1YVHLLPrfiSxNV8QdZACN18blHjc1j0hEP1Xs3dwhl+SkSsLXvGtvozp6c
 PID1UYyK1wofzaWY16Taw4EIHtrxowLCXL7s+kqfYixx57iSwa9c+a1pLZGD0KBC3nsWuBA0a0X
 IwS+A2DmKIwS0IqFQs+0KzIFyv08sW3jPMXtwxTVUDpa9HwfiJvrxkxbPyxdBKD6HstbySHaPlm
 8NyD+esHywIFTNn7JN3z0eXTNY4i+N/B/ZRJ07BjQYXd5Xigk9ZlA+fMo3akY9W7GMkGox4Btsf
 NkKt5OTOaCkvNhbklgTytloYHk7QtNfAKJSn2vbskvT8G8aggK9HtWwhcDja0P+u5e5jKQJB8p1
 UVLiDmVBvOaxDeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: yNawObEckjmuYjicNJqnpvmJGk-I18L5
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace00bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX94mEP+7wvHsF
 r8USwhzrQeFzvymlIoIw/Cof5cI0nvYjw6WI15SdC3DulB8DgAcBVsjsUAjP2uvzLPslUIj091s
 18UHAHyFYXlcxSqTG6ZA+f998u+MU5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX5ZuPYAYwGr73
 9EbJD0Zwo4mPS9zyDpkjk4qDbWBFv0Xgk/GbMJ1l5VIShVZBfkJgvd7p9wcTnqkWmRzJ6CK15EL
 87cRPVb8dlfSPQWIEZ2UsiXaKfvlOmmJzzU63uioKK79/UjLzYCutWC/hynkmvOOeOpW5OcKwxr
 jCVH888o9Fo4LEoW1nVwfEWfIAQ8A4dMorupycvlEla57FdxFoZtosMSJGt2XtrfD06mJ6Lu5Rb
 C+1bDlADDQu2asPtxNSG2LUMlmYg9+0Xi3IujUkUcqbxlcJ9RcQeupIhBCGR3cZzcANlZ/Sknb9
 YHN+FPZ/Qa//kE6se2Xg7DBNCMdgXRhwPLMI8kl+ZGYiaaPnx7fGCzKWP9ofPqMAud9/BCapsd7
 DFKjJNbaJHZv/SUJEJrf/3Ami40g8628XnUxaVqMxkJIww2BlHE5o/MXnV7QR9+jPYQDqxnJiIu
 ZBtdBRY8n4fl6Omma9Q==
X-Proofpoint-ORIG-GUID: yNawObEckjmuYjicNJqnpvmJGk-I18L5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

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
index e0061bfab216861444e36700d6530e7a3cd347e7..02e1a7684a7e51ea7ccba0660eea97a17589c3f2 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3

