Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E849BD63
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995529; cv=none; b=L/n7hXrGAP5xSqguzAZ/CK9Z/S2RoY5NaZukck3e6GXwOQLy38EnMy3UN8nuNjgZZjP84yZ4a3Vf6Om7y3/pIG7QLOR9wQm2ex6jfe9i2M+UAvvq1YboJLYgF6FxF6ldYsTNPB4K48zR3MG8EYX5PMZiBljpSGLbNx9WC7FiVnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995529; c=relaxed/simple;
	bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCAWb421hqQUu0U4Ylgr9IMSA6gcSWAD8eC3q42eRMu96f6uLma1DUpKL8tGbzHpRkSmvHNGPTvzvVFR86b44AnKrWUfq5rUtKv2tC2R7mMpJwo+tfMpsYtyql9JRU3mMAomnzMJvtif6XRbLA5gt4BodS14YrFA5gETUrnH2nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVEXkp5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGRgRUUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVEXkp5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGRgRUUB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe9JW419325
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=; b=XVEXkp5DAQtxNROD
	8TUtU71YXwpf5AycTK20Vnin9/bmIE1pFVdqOj6JCgTTLfymuAhL5Pzw+gvXXPfa
	6qBZwmjjnMS2s6SCrmbzOTnrTxuiKZ2FdszGwgydzis+PRbZNe95gzgKPBSueEp1
	LQW3i/XG65L5U3adB7WGsd8r7FBsDx9fnvnYqojixuaj/LUDGxa/WNJmwB8wWnXT
	PWWlKrNGr8MoI3ba9qTOMfR/Lwg/T2IEgENWgbmbe6qhAugJQaj5XOKOCvMWi5Zt
	T8STT/fy0abCjMBkoFRQ7ae5YgkkSQ1oJ32R190Np8rIFLL41qHUuFLLJmyJeoUO
	xKtKrg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq9bq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:58:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso3211462241.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995526; x=1790600326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=UGRgRUUB9+jStogZu2EfFRe991iBMg1vmQf/dqki3HRku8pilfq/muKc9PqeEvJH6p
         rg1JyTnPxf6+TdFxzDsqdFeHGE47WXb2NggO0lmt7MmW78PgE7vqFrF6HN++sDOcUtTK
         VU1YlVj0QKf32eyCohXk0Ja+mMtvm5rU4swczNZaJcgdVPStrC3EXAcPj4l8ketmhpeF
         F+JDPzP8FBpRfocARdzlTTUMZ1PwdR4QOfLbAGoq+gCWJqj3VQ5iKICm5+JFBjV3m8TG
         8pekeHXQdIfOvhAKvHQ+xTJ+j5mh/Wqey3llSMf3VFyQ5hY8M/gI9PnidmZrXvI0IRSQ
         qQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995526; x=1790600326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=xlniVNuuWQ45o7W3Z2HOJKEkrDtWRc7paWJVMSNPFonZu596iGlRmuBnZZSM4DqgS6
         mDXRpMD8O6layNXq+gfeoA6sV+00poZ98235l10PTeqWWhEEcmTB5QIvoUdWWqdab2wC
         H/W7d3VjYZA/bb0d29depewyvaMti7jy3DA3ZeoZ8TaYmnCQvs4EJbQpaT8yRe7WyoFG
         HB4XY7oGF0nkp8HFkrbN6hOJwPDz1kM9IJorxav+bgtrrccPkv/FQFB3fuhDPNNcwBVK
         kdc5ux09pMdn1g/bVNAut5XwLI/xR5VUEOSDCM24UXnM6sJ0TNbG/vg46LGuLIi5uPG2
         fbkg==
X-Forwarded-Encrypted: i=1; AKwUvBz/d76VvpUPGc+I9ybyMNIlZVglEgcVCEDx2oniEBA0IGLyH+KMEFOmTnVdqfVJab46olEYEN5d3qO5imI=@vger.kernel.org
X-Gm-Message-State: AFuF++kWaYGahsafQk6G6EOA3GvOLJsQRBGLprxVPsa+ML4/yaqjSskv
	yiOkwQareqNY34XHAQx/PJIiFo4zy1rz4/1J0dLDTjDTbEy8HYEzrJ34mlTZu1cp+E31A8NvnP2
	nxPgjAtG2lw4SXySXU+Bl7KFeb2wzQDtJi+A2aCTduqw4c/T3VZGNax1Jxoyah3gcJ2I=
X-Gm-Gg: AYBFou16+esKYMJzDdHCHd7DVQC/eSl8bzvI2VTx1vtl2VlLB28x0tfCyNBvWjPgP9r
	Fm7oVTRHrhNeRBXwUrStX54vGkyWX0R4Ps5fqmo7LAg6Jswkk8ETZH9FKwhkZ5YGXlfR3vE5gak
	oTCET7PR3pQDCI7TTcvlTdAtOWIxeOBjqPEde6MvmuryZn/SPpVMmb5QQr6UBIIhYxspAHCfjpD
	SKHdC9vSPWDmj+eV/atUZB1GempL8ksJaxzQSga9Bmm7dj6OQGtK6mWOrrFkd9uSeZQzqmx0e2/
	c3/HrBLvZtJaGTPRf/G3O/wC/xtzxsUIZ5tsHYySQiTDoDQjC3wl9msAIUcMUgZp5fn/oOucvvX
	ydTGqGsB5He02stGLbP1hxmDEs4k=
X-Received: by 2002:a67:f7d7:0:b0:7a2:7d1d:5014 with SMTP id ada2fe7eead31-7a4e1abc3c2mr2942551137.16.1789995526286;
        Mon, 21 Sep 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a67:f7d7:0:b0:7a2:7d1d:5014 with SMTP id ada2fe7eead31-7a4e1abc3c2mr2942535137.16.1789995525893;
        Mon, 21 Sep 2026 05:58:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:13 +0200
Subject: [PATCH v8 04/14] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-4-107537869a72@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSns+PyCyJuRQgL1Pq4op/UdD2lRhm347xN8M
 V4UnHO2zsuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7AAKCRAFnS7L/zaE
 w3FDD/wNFoyQNr83Tn26infnX20bDnq0HWlj0p9hHRyFBsmTz/Vvqh9gZQPoBEBJgM/gpxyuUto
 Zzc2LTGEeKRGbUHDqZ33V0j8ztXUomYGXIuMc3poo9qY719BaNA/cvaEbO5N4Tfaicjf5NoMFNg
 CvvSdWL3Z2qW9vBwmWkq8S3AdncjKl1yDtAkP1UQ55PQuWC8juErb6ITmTlZpg7GX4FghRV7+E0
 cxtAQyuPeIV53SRAEnxI+zL/uL1A9N+6V0iuFBg+J4cSzHMRRUAW/WhL/n7nXgp923MSdjwsqmO
 AAoYOTVzifI+PCEEmTrqcSzZ3pKpKS7WZun0Mcb366pE3AHdyTSVnK0kbLrTPlY4x9gqcCjTUG2
 kEbRUB7M+DQa8JNM/GD2YAg1HKG+3LmsywBDfsNmN15jIN9zqQc9EjsEfa4YdEBCqfr2DLHk3b+
 5QirXJjWmr91SHvrhXgnzEPh6FXyoUHFW1ncogy6t+KJFPLFf4d04PcXcz7Z5IdcD1mWm/BPNjB
 BF9rqSi8bwLSO0/QNm3QGEZmdOAM2C3W4ml8d0dE/RXdWqD4VSiqTHJMBfru2rOm42wihsRsaEY
 HnyqnDnZ65h+u0G6/8yN+sRXFqYNiNNZ4sQzkJ7VJlUSxV5PkLdZ0Vy9FCe55iG6UyLqXm9U4nL
 +OefrVqr8uTL35Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: FTHoDtFjOvrE4BdbEALhwEhmpVCpgkvj
X-Proofpoint-ORIG-GUID: FTHoDtFjOvrE4BdbEALhwEhmpVCpgkvj
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab12a07 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXzFLNS0H5pI+f
 gQKLusMFmyz6cXdHmwU0hXE8I7JHbpF8bKuk0PvACCSh26q2NZeGCZeDIgt8sQNVg+C/SFsGSLN
 AED9+eSdY9Gcj/exXLq92rsa3Kfs3/xr8MXHq2IJMH0evp1Zd3u2vDaC9o6o26+oH6dneD2uqF5
 BPghyflo/Q8q1nFaQtFy7v4AlHOENHAiRWSPkuKKHKqCWaRo13nSxztVLdOjvaov9dYUPIzlvsu
 bg/PsAFz1zmiweZl58yR0VU5D2AWu8xbeKgLhVLz1nI4StoevU5A6t3NVKi4EXabYh/eXBCqmma
 a+VSaa6XQCroDS5nFhw3eVF2VzwsH4S6obrVrCj+M90u+pwyneCmxAiB6IXhMSnhGLkhENuN206
 copYKo+KPMIEmxYI2AHkXvoSvAGoly0FktsBsBf4F5+07VZr4iviC3R70he7CBr9VpD8nenIBlc
 ypWRSKEzBwQBL10F7Hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXwf3ZtfeGGBV+
 fjBreDGHD+GCrVylptvfFn8VDgBEVnihfGrpEHlRQ6IZ38Ooix+zz4QxZhLudu08XMp+gSZ8+nj
 9FvZXJ1/8wyFEcg7QkVcztDP1tOnd78=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 0a872beff4807e6e5af612e336630ea7a36e203e..e2ca2f7a6eea1129edb724fe30659d55aaae8190 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -259,9 +259,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3

