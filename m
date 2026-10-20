Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500443;
	b=bwdlNRMFsOn+n1JL/he0/4zhizM0DN+B2nyUjrK7Q7zLmgy63Q9HYxVQKQNAE+5nl7UE
	 jFFPPrRomaYz3F0hYQVK28NPhalfQACRi2cidFG/df34G10Ot4F2FxssX340PF25SiJUJ
	 sNhYsioeZboVOPs8TwAjeAlbveQx6PM2oNfHNiKlFVnsW6kIe3sD6153DPR09lbzIQTgA
	 VtYEHM9Zi+OPsx4b65z7i63MYad+5d1lYtOK5/xwBFOpcZ6xk/cFXU47x//4r+YFmPQTv
	 s49NlLlhy915gGD9Oz86DzBrOxt81dXSEo1OreISWhzZpSCEP6+73m8KVpLY8eUQWNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MBZ9SltNnSEtWttBakHmryjxyNCeNxHEQsRo4iElg+Q=;
	b=a7iMKKM/upYOshPC5xYilDfA7v996YUKauYwGvFpUvyHfgJN8yhNS3eh3iF4Ujev1mNC
	 nVvxTYnafM3sPRBuBdrAV3yr5XDp2iV6Ov/20gFABAa9Q3/Wzf42Qaw7qy5x1wbLMkjc+
	 QpaII9lwsNIBG+aeO3Ku4ssa+7d40pOeGvWguwUq6IFmVNey6h6mhIn8BoTYVEHbHy9+P
	 h4nrOYPXEZJYAd52L0aWAVtg/J8XtHlv7LlqT9CPW1MfChH5OSV2MPR+tAlXLCK46DZHg
	 tvKHhpjNn002u0hO5iIAiAoReoL+QNF2JVX3ASURiqADGC+Jy0pjmyjLSmsYdRhtilw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a36XYnRr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZoeRwSob;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9D860A2605
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9D860A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a36XYnRr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZoeRwSob
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx93o419896
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBZ9SltNnSEtWttBakHmryjxyNCeNxHEQsRo4iElg+Q=; b=a36XYnRr7DAWLo/4
	rN6kCOdoa8cLS1ozt44HWJVnQJOLobAB92/kAecm1eEP28BpaBQqCBmNKf6zn0zN
	8/gOiWE4VN4Cn4xfnkZEV0WcG4gIk1Po6ZmfF+14PbhKwE7XH/3FBjsIW8jaWedd
	dMlN8eh/V19GCQjJ751c661blOVhbCw7I26hY5/QzzJg0oyuuVB6rbGkq33oEYnW
	Jfe0kSysRWw3EGPY7BIyYGwa/6vPWKtKBUIRTE5LIjxl1WOMvtnS9K63atHa8Xo7
	7mJUZl2NHUrALmLqJP4O4sL7ymSVv8OrO7CQW5HfE3vb1YsB2ChkcEoMyRnXv25y
	PhYfiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stf8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so376314885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500441; x=1793105241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBZ9SltNnSEtWttBakHmryjxyNCeNxHEQsRo4iElg+Q=;
        b=ZoeRwSobSeR3Bmy+sPSG63v9hvG+BbGKqhU4IIs1gZGeegjjcqd1pilqQcQjT76a8E
         RgJvRVnAc7Fz0OYGVGJ9lJVzh3HpW5j8CUBb9/UMLAMmMd3AKfdSeITmhpq+ify5OvYw
         aXUxuRiHDBGURM/HgxlXnPv7L+LPqVhJJkwIw8ueh4URmWs2VMl+Dh+0wsjUowAbhq4D
         VJJkhVQGNIo7WklgDKYoaqpYwewGd4DqOZL6p4l+ST9jRhZ21PX9tTeFYQdKlblkztes
         BOTSKQMIiM1UEmejJiMQMP28Om7huCKJzGYgiVaX5goK7/gZymYH28skZtOkwrsf1TwO
         cUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500441; x=1793105241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBZ9SltNnSEtWttBakHmryjxyNCeNxHEQsRo4iElg+Q=;
        b=tFBAwYcOh8c2fbv2/LxCJphYzHYLwA9aS5qlR4GcjIbAT8q6jdAcQbhouOg/p6in4G
         QU8XufqszWlx924p/EMEEjwdqFnTey5rHx24hmR+ObgQvTS6NZN0+X+1zrcRM75+7I85
         lWX7RY2df19jpJ9236XOwunP45JKklxOf04cH3adbVzZ70lT9k1v/WJDUvoojaC1947Z
         1Izr1wQp/T1RmVxl/x71gasHrYeAn54imOkvtKOWI/vg2RfrJSbcs2gKMZJhw5PpY9AD
         3+tnvZDN4Hhr2q+l3Tkh7dQdPER2ymqeNF5QL2+vilaXBtwbIUcPgf+0fRdz+s9uib1O
         I0oA==
X-Forwarded-Encrypted: i=1; AKwUvBz0YHGz1jAu8CzQATeFjoGo6Al3uSPILo7VwbF/s1ze4gCsjpunHySLmVzq81gpOPP7UlRDb/iOUQrqruE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF73fIgh1FZivTJz4SlIOIxTtnzkpjCUBwmTkJO8DzkZk8WNSk
	gPFT1OZVJ6IjYsoX7ia9UFvVyU3DDGBD4kg2wUqsBkNqoDSpoWmoeufkl/3S0orp1iwl3X0SGB7
	A2IFMbb+wScjdDtZCXq5I/mbmIlw8CQ3ZcQPBk9dx08mNOBL2XPsLdZACPhIyIIZ+swQ=
X-Gm-Gg: AYBFou3cUg4JNFaIYsU3pwAMXvpMatld3dqyvm4SRx9loOe9Ex2Aj2/OSiq1zeLEH3G
	hp3C/zPXyUemkZgJv9tg4RWrNjg8H2fZlr5ZU9JsTS4LfvBkSpF8yJyOmrIUPHRUOxIyYsDKlET
	9U31Stodj0GX9RaBuWSD7pALfPU++u8zWtaYDjKFPNG6/RikIkJF2IUOUc6WbgrCkRJgMyHbvrQ
	3kzfNIXHxjIjsYrAVHBXe47MbxFwHbBIDhR03hepIEZ5xoP52xdUPZRtQ8vc1hOxBpXZGHiSBpU
	G9mLtY4Jj5TWeTgYAC+geQFGGJdjB2j0CRjDCHEEgR5w+F1Zx6sZ+mOE3XY6d94uCd+Y00aiO6k
	DPt3Y13RXv6bGNnE/nwQJvFKnL+Lv
X-Received: by 2002:a05:620a:1997:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93f29d4e1acmr1847487885a.40.1792500440838;
        Tue, 20 Oct 2026 05:47:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1997:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93f29d4e1acmr1847484885a.40.1792500440391;
        Tue, 20 Oct 2026 05:47:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm6544253f8f.42.2026.10.20.05.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:47:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:47:03 +0200
Subject: [PATCH v12 3/3] crypto: qce - Use fallback for CCM with a
 fragmented payload
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
Message-Id: <20261020-qce-fixes-aead-v12-3-77a2e09abd0c@oss.qualcomm.com>
References: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
In-Reply-To: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AsBxpvoPqBx8HskvDXDG+rPpRtLziH3BRXM3FeA2dBk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq12LL76Dfs7XlcOj9kts95kgKasuDVb03TksNy
 aS3QKz85paJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatdiywAKCRAFnS7L/zaE
 wy5ED/45pU/hGaIXGKuq+YmcyCr6NvMBlU130xKNXPmOd2rIYdd3uTlIEgv+TG/Zw37DRsx4IgU
 lm42hZLI8S4FvC8czY/bsjC+yvBv9QIMeMGQSirTPk/PZIV/mIZqWmgf+dcYYBQdW3s1jXxvftc
 2JgdT33jadUiO39cJbVEMbIVEwLr+ejcAa2bqAkNAOYKiXxy/h7ccvSB9PKTEMBaBuwI4EIkDGw
 jVfs7UoE2VQKeShPKZ2N7EVeRGusLRVbTDdv+lUJH1PdINQQwuXfM8kVKHgU7/Y+mmrTO8ibdcB
 MH82L1y69BfaZwP/qOpDI4eKgP02YIqeGdAKDR0Ov9Z7ygZNGW+EGsii+3SxirJUGir/39ojsq0
 GJafh/x5kdscIlu0Vl5tAWDM7QFONJHjtExhJb/HzHP8iiHdFSoYzdK5nvfQ/SBQKQeuJ+2Ex9d
 gGmayt0eH/t3WoUH1o/SGjERHQy1AU06iGk2Nzb3lZpQ5uuVfCmku4UfUi9lLx8f1dXyPrqWKAu
 qwDzz5YiO6G694xHfzE8I4gmbvnz2ancToowKcw9R0DKWGs/KSq1ALenGUwv/VmM2FqZQT4r8wn
 YzpsYGPj1Bl9sls1/3YjV5b991rfqn2ddrwGx1CUnOENFNXiqmkl4ztpv/MKSZVhD/GoAkpEji0
 yo9IhgPLxXjCH6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX122DUIwV+sDf
 mHQWN6GxZAOe3BxkvyHHS03MO9FtRcXH2fTslJ3gwyT+8LraukLcagO8g+X0tust2/nbfX4YJa6
 3J3zsIBIwu0SlGxIMdKxx4ZPoladG//Lkj1BncpvUIPssw+hMvw9z5FsGZYiVzi+K9C2xE3xv9k
 nV4quRIbXaxmqbtGDDltWxJqHqOI+4GLzdDbFx8aXpG/Nmo0QvGnzX/D2fTeT59U5QD1b81WFGL
 a3ipSW42PWD9NbdIbD8SE3/cwBN3J0ykpCAgLrRdMVoWI7TnEKQbY7NdXrpinHLYPiTYEvQMIC+
 FE8Sls+wCAOLw+F2V6DNmOPb2Q0TdeJYsbyvNMWBoiFPecguRu7REMpGglSYuMzmLhhWwwvqE1l
 y0F73BmIUnsGvgn//J1GSkAV3bZgWwahpUvDtSxBX/Bz65vPUHhOxrBjvqRspxZuDQ6IieaDmYu
 hYY6aX312BFpInFWPXA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad762d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t19XAmwtbQeRJHHBnL9dAGYawNpuUdzy
X-Proofpoint-ORIG-GUID: t19XAmwtbQeRJHHBnL9dAGYawNpuUdzy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX0BlZxmwvyTxg
 SVMWRMUIFn6KceCIVyCGuzCj6/qnO7TuNZ2s7BySTa5m3bjyl2VQTvbgRcmQ9hsSYPdX1XtzoUl
 GmJC6bwc2rSU+snN5shwugjk+6WxgG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 19d7e92aaeda0df1072114fa0435dc40e1eb6849..8ce1a9f3c9d80ba46d5c074cc3ef45c69acf52ce 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 	bool fallback = ctx->need_fallback;
 
 	rctx->flags  = tmpl->alg_flags;
@@ -523,6 +524,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags)) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (fallback) {
 		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3

