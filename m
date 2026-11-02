Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616411;
	b=26xympnV/3AU9A3r2NlDOxBcJO1UJiQ8PnEheGaUrv01sEjMcZieaRRdxoN3SXTFkJoL
	 aeFHyvRQMoeK9vefXzFxVWnsGAovdFAc/vNsvQWrofGt9yGh+EjuQNbrxYi/2jT3duOZH
	 lIDOgQRakUkUNFM8PZ/pNaiaViaOBGiT3uy5IhxzT4H7oeiIU5Q90DfED2VduZ4hNS+wa
	 expWFV+2frtbMN83wedMXourklWf0vZXEiULaKDSgnKPyN4RkBAi8uHhLMjZLfnhJ2RJc
	 4exWxfthQoukPtkHVt9os/dYowcmyvziP4GL/u3nm09hPIHe09x+T/h+Dxr1h1fVVZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PwmRt3IOansPwHbbHlBlofzHt6xTpC/snc5JocgBEmY=;
	b=cvok10FYIKVQS1Xf30ByXzdf60Bq8RyKyWcEBcVPWK8W3bvu1TUoiFiWfidFpiDAnQjF
	 NzBKP5XhipACPFs4ghMA/twoAp7YufusbCcKzOzShZdd/M3MMorqWDQkTH4XsG8564abV
	 JkqMw6oec9AtA9Dw6vq8LXjdUzI2QcfCZ62NRqjvKcnRH+BvSpd8t7nbfKTAVATcpRHDc
	 D0lmM6b+qVqeQ5qwY/FmLFNDfP97qfQSdUZFbKTblqUQxnwmIu13kEeKZkFdWPIs5NIwY
	 iBy9ua/KfrIThHCqXCtzzK2VG/ENwbL43rcO2lRbtxerGz3MFZUMz7SKrStCetIY9aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DEEZ9UZ1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJAED34e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FBF606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FBF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DEEZ9UZ1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJAED34e
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A9vS4039353
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PwmRt3IOansPwHbbHlBlof
	zHt6xTpC/snc5JocgBEmY=; b=DEEZ9UZ1fdpSwGAl9GJtblV5POyAL1/kkxVS6c
	MaJk6XMIe2TAmywKKusjNG8olu2+IGgke3mfJFDutZ0agkkZbpC4hcngqeNU5JQh
	wRv0qFxq8lBH2cnMgOo+TIGKBZNXsLRSzhl2AfqjmO4oHA9PdYANlVkXNNEqiFI4
	5zMrDjqNsTEH26Qdhivvdm7/V/j0Wq9r12ia2AE5gor0m3ZiRfC7zB7XS6q/7qBv
	vgO7FkORyV9ihWMGNIPBBYV5qwzFeJV9zdQ487Ort9KuC8Bd8Q3SlsFwBHPv4Py3
	HZjaHdIrV5EcfXli2r3URtMKHDf4Q3WKvljwjhDZdum6fygg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18quh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:46:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so274046085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616409; x=1794221209; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PwmRt3IOansPwHbbHlBlofzHt6xTpC/snc5JocgBEmY=;
        b=JJAED34eNzFqd/5Wi4Hh+ISFIJNSYQwl26h/zqwuEIz3FtBWi9YbnaFS+6zcyxecra
         6fawxzmQhg6M/s0odLmrZjS+aGf+Kf74avtAQjhvG5gDzb2LnmHxNafGf7yupErq3Z3v
         xa1mj+R7ZPgWq98mGB3aRrpARPYfKdCzgRv7g4GBmEBgaHwfCGm20Ri3ClV+6M+It6CT
         +pd6LaAtVx2g8QslV2E4p4eQ2SJsIw4qL6abKN2SasPmONe6427VgzTeaWQ90R/GicRH
         yg6uQaZgnihpYIEHfo8E1K2eq7i99uUN7+wFp/yO7xvOayFC1Icwo1eS5bVnslRJ1Uze
         ZH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616409; x=1794221209;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PwmRt3IOansPwHbbHlBlofzHt6xTpC/snc5JocgBEmY=;
        b=r0uo7cabs3SwImqTc7VanjfUWYiS6pL/bHlsyMMQ2eZPiwcoDagbbfXbZ1d23VBn9z
         YCV5n11IwjFxCOa+SgNMlYLNuG118vO/V4+PgxXj85yfsXyThHtFr8x02QuAaD0Vvm0z
         M/W3fJq5A3IXZsRGq7wax3nCv6je/jsDJNHuamUKQKJdLsGOjqtvSWHdswbVQfMA4CU9
         Fd53kblM2W2+MpptjgmgY/QJC+RYxJy1Nh+w7rGb+g1F8P/DYHq/itk34SwwGG5NuhJX
         NdfoUAovR7d2rm6eWjJbmPADX5r969rkkM3ZK7pZh9SSZEs1CopaAOGm3DEZ5bwwQLzJ
         cw0Q==
X-Forwarded-Encrypted: i=1; AKwUvByuQQZNVeNh9L6SNDbAbpxIyZ4cpW6Uulo/QfZsX0zIW01vIfIkhxCMB/48BbYoxjlmnhOODDSUOhYKT/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOB4gFUqGadgpBStMLzb8iMuUg9uKo5acPUIoTZj0P8KXI302L
	qgRsDoTQEeVgD2Sbwv077FI14ulQUjRUGGqVkQsQ2SXOtV2T5vh8p+DkWd3YXVN+Mv8VaQKmEs7
	Un7t9lKA8OlqtebTH4m9hi1YcTLIkgSxiOTEI0gsz+Ww8b7jgtsxPcuj8slUzkwe4dCk=
X-Gm-Gg: AYBFou0363gfLGy02IW/1r44UHA5bqKUiqNo2j1FmzbID1i93T1UMaeIjK7FT6skfwX
	C08D+YaazX5OCBD3of2/s6lhlxRQKKoBWdSPo/BtkViMtp0wxF9zAaoN1PJkRpKvY5a2WkvDV3K
	EEN68qFPG13M44LWaoVCVJPr7rqOpj/2LPninjEM/zjkGhV39AW7H4gC2VMh19B1N2hS4KLYczM
	6AKuKbplREWK2tkhmgkRTFBKE9SN/rNn4v0UhyI1ezsj/kAVrmAcSfrsZi7zstxzVkwmv+0L/eK
	QUdg29kOY+rPQDwPLjLXdZ6V00d414MEVRRM32uecV+qRWGZeN/HkvY5hGHMs5OElhjA00xOk6S
	13V4iAWW4p/vc0o2+3IXsyLq8GdTLrJpdFym4x14hspZvjLn12VjH/SBdQQ==
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1504885385a.56.1793616408285;
        Mon, 02 Nov 2026 02:46:48 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1504883885a.56.1793616407523;
        Mon, 02 Nov 2026 02:46:47 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm501926955e9.15.2026.11.02.02.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:46:46 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 12:46:40 +0200
Subject: [PATCH] soc: qcom: rpmh: Fix use-after-free on timed out blocking
 requests
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
Message-Id: <20261102-rpmh-timeout-uaf-v1-1-f1fe9d38f1b8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA9q6GoC/yXMSQqAMAxA0atI1gbaKiJeRVzUNmoEBzqIIN7dq
 su3+P8CT47JQ5Nd4Ohgz9uaIPMMzKTXkZBtMiihKikKgW5fJgy80BYDRj2gLXVdkZJG9BZStjs
 a+PyWbffbx34mE94P3PcDd6Y3kHQAAAA=
X-Change-ID: 20261030-rpmh-timeout-uaf-d4a86e21c0bd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=16061;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tPM/rHv6eEPj2jnLyc7UF94ZJFDd2kyN5G6sO+infmk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6GoVrDqH11xkLXycctoWfqrcoK2gJ3FXKZBaQ
 JtwGLKpj3SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauhqFQAKCRAbX0TJAJUV
 VsjDEACl0nO7H9OpN83wXvwPEPhTU473E1uEzXPuJBJysbGmNvBroE8PaAQ9iiI6z0i/rfDBVtM
 zOZj9lLCfjH5TKSGlocpe8x7lfXAwLH4Da+VMmpW65YY6t9tOAduIJZMhiSR+hxgZkvEWZxwcpb
 RexEuIs3Q/pJAZf1rBz33iljhNdOMuvomeCfwapRXfzD6LKzU+kJTumeaYTzAKNLOCmE1Qhi4il
 s/JljJ81sWf92LVZCat57jxw+/LJkGCC6bZFR4IQ3k3TfpD2mWCxEg9qIhy0Mg76Sa5KkYO+RpV
 PFM59UllBw38yU9fwjZKcZ+yN+TOZhXDHbiqSIBN/aUjAR9tqogUSJMt/MxpIVUWB23C9XKnGUX
 f/r/Zq5Gu4yoT/R3u9KXkHLnaw7w3QyQFoCREMpV/3qbbJDmyM4ERqmsfygMLufl9ApP7CE5R4w
 9LJnijiay0e1loH0UWWzr7HzVmRPNbTzaZuFdq+e2fQjzIWMVmVOP341Eilb9dpjgEHRxtor+ub
 BqsiRqgmVjpFPMdDjnbTYM1teMWW5u0b3ZcjAvrsPG27rfQNGh8q1RL71bSepfsxDPPYmg/XQxd
 rpuqJLtsx1k6xkHbKckuv70b4PxUVghzujyuoDb2evnC31olpK2EaR3rlOUsT/v0r3L0vfQFq2v
 KNouSSuwjem21MQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: PWIoqa82ASUwJCmhuV2IZaop1KfT5mzX
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae86a19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ESOdgCjWaGF27uZwwWQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: PWIoqa82ASUwJCmhuV2IZaop1KfT5mzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXy9ef79yoQYM+
 OSRleXU0IXvT9DYK2EjbIc2AvUnBZUC7uCwCFcVSSfRM9yajDPTdd7j6ekSznIqiKjWZhT2q1FX
 2zJTOIl029hTyIWOYF8RrTbifBqPGj6RMdSCySkPzgZRlBQsC0jBhyVXG9Lg9pNM1zKwaBli3rd
 m7v/4x2FOzLRAZnKUBT7XZGHMdtFZUmTJYVj4UJPDm1zE54n0F2hh6Tgc94b1i8InNBGBw8ZJfa
 1R7+vltu0bSi70e0LSeIsKYrE0fwL07h8fwEzcUo387FN+SxVWzwkrOBBpffHszpqtwyu1E8rGG
 EGe6xO+NZMZY665s4qZkWGtK2sqvvwfKaVLXwkgYvp+1jGoiO2Uy8A4kyGNEZVjTFN/lhIdxkpe
 Z74l8Q2Ko83BkehY5JGBzDAwBU0Xg3Q8a/Yxek+U7YvX/hjWE9NaxPEVp6Z6A1d76m5aA6Yz2De
 4nb/29hSbxGJ7YRslhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX0puCVstH/O2z
 h44GFVFWhgpk6HNljrrc23yMHAhFbpTyrrUVaefUfzXGcjdKmvmLarkntxz+eY5GhZekCFkv0GA
 +cPfzd6SKQxlJJp45XC4nmX9DdPCDTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

rpmh_write(), rpmh_read() and the ACTIVE_ONLY path of rpmh_write_batch()
hand a request to the RSC controller and wait for it to complete with
wait_for_completion_timeout(). If the wait times out, they return to the
caller, while the request is still owned by the TCS it was written to.
For rpmh_write() and rpmh_read(), both the request and the completion
live on the stack, while rpmh_write_batch() frees them on its way out.

If the hardware completes the request after the timeout, tcs_tx_done()
fetches the stale request from the TCS, passes it to the tracepoint and
to rpmh_tx_done(), which then signals a completion that no longer
exists. For reads, the response data is also written into the stale
request first. This corrupts the stack of whatever the timed out caller
went on to do, or freed memory. rpmh_write_batch() even documents this
with a "Better hope they never finish" comment.

Fix this by giving every request handed to the controller a reference
count and by embedding the completion into the request. All such
requests are now allocated dynamically. The controller owns one
reference, dropped by rpmh_tx_done() once the hardware is done or by
the sender if the request never made it to the controller. Blocking
callers take a second reference for themselves and drop it once they
are done waiting, regardless of the outcome. A timed out request thus
stays alive for as long as the controller can still access it and is
freed by rpmh_tx_done() if the hardware ever completes it.

The blocking requests are allocated with GFP_ATOMIC, like the ones of
rpmh_write_async() and rpmh_write_batch() already are, so rpmh_write()
and rpmh_read() can now fail with -ENOMEM.

As a side effect, rpmh_write_async() no longer leaks the request when
caching or sending it fails, and an ACTIVE_ONLY rpmh_write_batch() with
an oversized command set now fails with -EINVAL instead of sending an
empty message. As before, rpmh_read() does not warn on timeouts, since
reads are known to time out on some platforms.

Fixes: c1038456b02b ("drivers: qcom: rpmh: add RPMH helper functions")
Fixes: c8790cb6da58 ("drivers: qcom: rpmh: add support for batch RPMH request")
Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c022766a-a45e-484d-9293-4587d4a4438f
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
This overlaps with Maulik's "soc: qcom: rpmh-rsc: Skip read requests
on unsupported platforms" [1] in rpmh_read(). The two are independent
and the conflict is trivial.

Prepared with help from an LLM-based assistant.

[1] https://lore.kernel.org/all/20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com/
---
 drivers/soc/qcom/rpmh-internal.h |  10 +-
 drivers/soc/qcom/rpmh.c          | 288 ++++++++++++++++++++++++---------------
 2 files changed, 186 insertions(+), 112 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 39441a25af9b..9d49b304ba17 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -8,6 +8,8 @@
 #define __RPM_INTERNAL_H__
 
 #include <linux/bitmap.h>
+#include <linux/completion.h>
+#include <linux/refcount.h>
 #include <linux/wait.h>
 #include <soc/qcom/tcs.h>
 
@@ -59,14 +61,16 @@ struct tcs_group {
  * @cmd: the payload that will be part of the @msg
  * @completion: triggered when request is done
  * @dev: the device making the request
- * @needs_free: check to free dynamically allocated request object
+ * @refcnt: references to a request handed to rpmh_rsc_send_data(); one is
+ *          owned by the controller and dropped by rpmh_tx_done(), another
+ *          one is owned by a blocking caller waiting on @completion
  */
 struct rpmh_request {
 	struct tcs_request msg;
 	struct tcs_cmd cmd[MAX_RPMH_PAYLOAD];
-	struct completion *completion;
+	struct completion completion;
 	const struct device *dev;
-	bool needs_free;
+	refcount_t refcnt;
 };
 
 /**
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 360242a315e3..9c307e9594bc 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -24,7 +24,7 @@
 
 #define RPMH_TIMEOUT_MS			msecs_to_jiffies(10000)
 
-#define DEFINE_RPMH_MSG_ONSTACK(device, s, q, name)	\
+#define DEFINE_RPMH_MSG_ONSTACK(device, s, name)	\
 	struct rpmh_request name = {			\
 		.msg = {				\
 			.state = s,			\
@@ -33,9 +33,7 @@
 			.wait_for_compl = true,		\
 		},					\
 		.cmd = { { 0 } },			\
-		.completion = q,			\
 		.dev = device,				\
-		.needs_free = false,				\
 	}
 
 #define ctrlr_to_drv(ctrlr) container_of(ctrlr, struct rsc_drv, client)
@@ -76,30 +74,28 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
 	return &drv->client;
 }
 
+static void rpmh_put_req(struct rpmh_request *rpm_msg)
+{
+	if (refcount_dec_and_test(&rpm_msg->refcnt))
+		kfree(rpm_msg);
+}
+
 /**
  * rpmh_tx_done() - Signal the completion of a RPMH transfer.
  * @msg: The request that was previously sent.
  *
  * Called by the RSC driver when an active-only transfer is complete.
- * Signals any blocking waiter and frees the message if it was dynamically
- * allocated.
+ * Signals any blocking waiter and drops the reference owned by the
+ * controller.
  */
 void rpmh_tx_done(const struct tcs_request *msg)
 {
 	struct rpmh_request *rpm_msg = container_of(msg, struct rpmh_request,
 						    msg);
-	struct completion *compl = rpm_msg->completion;
-	bool free = rpm_msg->needs_free;
 
-	if (!compl)
-		goto exit;
-
-	/* Signal the blocking thread we are done */
-	complete(compl);
-
-exit:
-	if (free)
-		kfree(rpm_msg);
+	/* Signal the blocking thread we are done, if there is one */
+	complete(&rpm_msg->completion);
+	rpmh_put_req(rpm_msg);
 }
 
 static struct cache_req *__find_req(struct rpmh_ctrlr *ctrlr, u32 addr)
@@ -175,6 +171,9 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
  * SLEEP/WAKE_ONLY requests are not sent to the controller at
  * this time. Use rpmh_flush() to send them to the controller.
  *
+ * The controller's reference to @rpm_msg is consumed, either by
+ * rpmh_tx_done() or on error.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 static int __rpmh_write(const struct device *dev, enum rpmh_state state,
@@ -191,13 +190,17 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 	/* Cache the request in our store and link the payload */
 	for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
 		req = cache_rpm_request(ctrlr, state, &rpm_msg->msg.cmds[i]);
-		if (IS_ERR(req))
+		if (IS_ERR(req)) {
+			rpmh_put_req(rpm_msg);
 			return PTR_ERR(req);
+		}
 	}
 
 send_data:
 	if (state == RPMH_ACTIVE_ONLY_STATE) {
 		ret = rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg->msg);
+		if (ret)
+			rpmh_put_req(rpm_msg);
 	} else {
 		/* Clean up our call by spoofing tx_done */
 		ret = 0;
@@ -223,6 +226,83 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 	return 0;
 }
 
+/*
+ * Allocate a request that can be handed to the controller. The request starts
+ * with a single reference, owned by the controller and dropped in
+ * rpmh_tx_done(). Blocking callers must take an additional reference for
+ * themselves, so that the request outlives a timed out wait in case the
+ * hardware completes it later.
+ */
+static struct rpmh_request *rpmh_alloc_req(const struct device *dev,
+					   enum rpmh_state state,
+					   const struct tcs_cmd *cmd, u32 n,
+					   bool is_read, bool wait_for_compl)
+{
+	struct rpmh_request *rpm_msg;
+	int ret;
+
+	rpm_msg = kzalloc_obj(*rpm_msg, GFP_ATOMIC);
+	if (!rpm_msg)
+		return ERR_PTR(-ENOMEM);
+
+	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n, is_read);
+	if (ret) {
+		kfree(rpm_msg);
+		return ERR_PTR(ret);
+	}
+
+	rpm_msg->msg.wait_for_compl = wait_for_compl;
+	rpm_msg->dev = dev;
+	init_completion(&rpm_msg->completion);
+	refcount_set(&rpm_msg->refcnt, 1);
+
+	return rpm_msg;
+}
+
+/*
+ * Send a request and wait for it to complete. If @data is not NULL, the
+ * request is a read of the single command in @cmd and the response is
+ * returned in @data.
+ */
+static int __rpmh_write_wait(const struct device *dev, enum rpmh_state state,
+			     const struct tcs_cmd *cmd, u32 n, u32 *data)
+{
+	struct rpmh_request *rpm_msg;
+	int ret;
+
+	rpm_msg = rpmh_alloc_req(dev, state, cmd, n, !!data, true);
+	if (IS_ERR(rpm_msg))
+		return PTR_ERR(rpm_msg);
+
+	/* Our own reference, the controller owns the initial one */
+	refcount_inc(&rpm_msg->refcnt);
+
+	ret = __rpmh_write(dev, state, rpm_msg);
+	if (ret)
+		goto out;
+
+	if (!wait_for_completion_timeout(&rpm_msg->completion,
+					 RPMH_TIMEOUT_MS)) {
+		/*
+		 * The request is still owned by the controller and is freed
+		 * by rpmh_tx_done() if the hardware ever completes it. Reads
+		 * are known to time out on some platforms, so only warn about
+		 * writes.
+		 */
+		WARN_ON(!data);
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (data)
+		*data = rpm_msg->cmd[0].data;
+
+out:
+	rpmh_put_req(rpm_msg);
+
+	return ret;
+}
+
 /**
  * rpmh_read: Read a resource value
  *
@@ -238,22 +318,11 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
  */
 int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 {
-	DECLARE_COMPLETION_ONSTACK(compl);
-	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
-	int ret;
+	if (!cmd)
+		return -EINVAL;
 
-	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
-	if (ret)
-		return ret;
-
-	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
-	if (ret)
-		return ret;
-
-	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
-	cmd[0].data = rpm_msg.cmd[0].data;
-
-	return (ret > 0) ? 0 : -ETIMEDOUT;
+	return __rpmh_write_wait(dev, RPMH_ACTIVE_ONLY_STATE, cmd, 1,
+				 &cmd->data);
 }
 EXPORT_SYMBOL_GPL(rpmh_read);
 
@@ -274,18 +343,10 @@ int rpmh_write_async(const struct device *dev, enum rpmh_state state,
 		     const struct tcs_cmd *cmd, u32 n)
 {
 	struct rpmh_request *rpm_msg;
-	int ret;
 
-	rpm_msg = kzalloc_obj(*rpm_msg, GFP_ATOMIC);
-	if (!rpm_msg)
-		return -ENOMEM;
-	rpm_msg->needs_free = true;
-
-	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n, false);
-	if (ret) {
-		kfree(rpm_msg);
-		return ret;
-	}
+	rpm_msg = rpmh_alloc_req(dev, state, cmd, n, false, false);
+	if (IS_ERR(rpm_msg))
+		return PTR_ERR(rpm_msg);
 
 	return __rpmh_write(dev, state, rpm_msg);
 }
@@ -306,21 +367,7 @@ EXPORT_SYMBOL_GPL(rpmh_write_async);
 int rpmh_write(const struct device *dev, enum rpmh_state state,
 	       const struct tcs_cmd *cmd, u32 n)
 {
-	DECLARE_COMPLETION_ONSTACK(compl);
-	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
-	int ret;
-
-	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, false);
-	if (ret)
-		return ret;
-
-	ret = __rpmh_write(dev, state, &rpm_msg);
-	if (ret)
-		return ret;
-
-	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
-	WARN_ON(!ret);
-	return (ret > 0) ? 0 : -ETIMEDOUT;
+	return __rpmh_write_wait(dev, state, cmd, n, NULL);
 }
 EXPORT_SYMBOL_GPL(rpmh_write);
 
@@ -355,6 +402,70 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
 	return ret;
 }
 
+static int rpmh_write_batch_active(const struct device *dev,
+				   const struct tcs_cmd *cmd, u32 *n,
+				   int count)
+{
+	struct rsc_drv *drv = ctrlr_to_drv(get_rpmh_ctrlr(dev));
+	struct rpmh_request **rpm_msgs;
+	unsigned long time_left;
+	int ret = 0, nr_alloc, i, j;
+
+	rpm_msgs = kzalloc_objs(*rpm_msgs, count, GFP_ATOMIC);
+	if (!rpm_msgs)
+		return -ENOMEM;
+
+	for (nr_alloc = 0; nr_alloc < count; nr_alloc++) {
+		struct rpmh_request *rpm_msg;
+
+		rpm_msg = rpmh_alloc_req(dev, RPMH_ACTIVE_ONLY_STATE, cmd,
+					 n[nr_alloc], false, false);
+		if (IS_ERR(rpm_msg)) {
+			ret = PTR_ERR(rpm_msg);
+			break;
+		}
+
+		/* Our own reference, the controller owns the initial one */
+		refcount_inc(&rpm_msg->refcnt);
+		rpm_msgs[nr_alloc] = rpm_msg;
+		cmd += n[nr_alloc];
+	}
+
+	for (i = 0; !ret && i < count; i++) {
+		ret = rpmh_rsc_send_data(drv, &rpm_msgs[i]->msg);
+		if (ret) {
+			pr_err("Error(%d) sending RPMH message addr=%#x\n",
+			       ret, rpm_msgs[i]->msg.cmds[0].addr);
+			break;
+		}
+	}
+
+	/* The controller never got the requests that were not sent */
+	for (j = i; j < nr_alloc; j++)
+		rpmh_put_req(rpm_msgs[j]);
+
+	time_left = RPMH_TIMEOUT_MS;
+	while (i--) {
+		time_left = wait_for_completion_timeout(&rpm_msgs[i]->completion,
+							time_left);
+		if (WARN_ON(!time_left)) {
+			/*
+			 * The requests still in flight are owned by the
+			 * controller and are freed by rpmh_tx_done() if the
+			 * hardware ever completes them.
+			 */
+			ret = -ETIMEDOUT;
+			break;
+		}
+	}
+
+	while (nr_alloc--)
+		rpmh_put_req(rpm_msgs[nr_alloc]);
+	kfree(rpm_msgs);
+
+	return ret;
+}
+
 /**
  * rpmh_write_batch() - Write multiple sets of RPMH commands and wait for the
  * batch to finish.
@@ -378,13 +489,9 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 		     const struct tcs_cmd *cmd, u32 *n)
 {
 	struct batch_cache_req *req;
-	struct rpmh_request *rpm_msgs;
-	struct completion *compls;
 	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
-	unsigned long time_left;
 	int count = 0;
-	int ret, i;
-	void *ptr;
+	int i;
 
 	if (!cmd || !n)
 		return -EINVAL;
@@ -394,60 +501,23 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 	if (!count)
 		return -EINVAL;
 
-	ptr = kzalloc(sizeof(*req) +
-		      count * (sizeof(req->rpm_msgs[0]) + sizeof(*compls)),
-		      GFP_ATOMIC);
-	if (!ptr)
-		return -ENOMEM;
+	if (state == RPMH_ACTIVE_ONLY_STATE)
+		return rpmh_write_batch_active(dev, cmd, n, count);
 
-	req = ptr;
-	compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
+	req = kzalloc_flex(*req, rpm_msgs, count, GFP_ATOMIC);
+	if (!req)
+		return -ENOMEM;
 
 	req->count = count;
-	rpm_msgs = req->rpm_msgs;
 
 	for (i = 0; i < count; i++) {
-		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i], false);
+		__fill_rpmh_msg(req->rpm_msgs + i, state, cmd, n[i], false);
 		cmd += n[i];
 	}
 
-	if (state != RPMH_ACTIVE_ONLY_STATE) {
-		cache_batch(ctrlr, req);
-		return 0;
-	}
+	cache_batch(ctrlr, req);
 
-	for (i = 0; i < count; i++) {
-		struct completion *compl = &compls[i];
-
-		init_completion(compl);
-		rpm_msgs[i].completion = compl;
-		ret = rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msgs[i].msg);
-		if (ret) {
-			pr_err("Error(%d) sending RPMH message addr=%#x\n",
-			       ret, rpm_msgs[i].msg.cmds[0].addr);
-			break;
-		}
-	}
-
-	time_left = RPMH_TIMEOUT_MS;
-	while (i--) {
-		time_left = wait_for_completion_timeout(&compls[i], time_left);
-		if (!time_left) {
-			/*
-			 * Better hope they never finish because they'll signal
-			 * the completion that we're going to free once
-			 * we've returned from this function.
-			 */
-			WARN_ON(1);
-			ret = -ETIMEDOUT;
-			goto exit;
-		}
-	}
-
-exit:
-	kfree(ptr);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(rpmh_write_batch);
 
@@ -461,7 +531,7 @@ static int is_req_valid(struct cache_req *req)
 static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
 		       u32 addr, u32 data)
 {
-	DEFINE_RPMH_MSG_ONSTACK(NULL, state, NULL, rpm_msg);
+	DEFINE_RPMH_MSG_ONSTACK(NULL, state, rpm_msg);
 
 	/* Wake sets are always complete and sleep sets are not */
 	rpm_msg.msg.wait_for_compl = (state == RPMH_WAKE_ONLY_STATE);

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261030-rpmh-timeout-uaf-d4a86e21c0bd

Best regards,
--  

Abel

