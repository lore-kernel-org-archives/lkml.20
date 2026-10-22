Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660171;
	b=hbtkiqCwOZTzr7wv9APcKZlWCQbt6tdkbjNCbw0n+Hv7sUm+jWnHr/dqh48OBQy/UhOA
	 Sc7P5S7JUQukuGnV+EgvsuA4dClTTWhMNSdxbWYt6ZIEOr4Bx63+jJtxIwdVusrSENsC5
	 CgY9tIshaL7gKRRwAvbXDWGBVvc9M3VHkcTW2aNwfxyWjnV9YOcLGAoE2VHK+Rrez1dQB
	 oZqWLjQ4X/oaKEDvq6yVDO4avI+b6+gUdVIr78pfxO/hvWVrFKnEIZRX1/HXK3k9p2BxS
	 0ENKaEIna8iqB+iM3+47Fnuk+08zIqa6mW/dJhsDi056BjTwhRThV6hDxktEfBf3Y+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660171;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j3WJZdu5775elj6uuKLwnG5OWtcyQAMV793EswPClxw=;
	b=xrTFHNtvZSVSMIeRf0zmMekOjrl7tHXutX550ncnzhy5IEfIQO0QNnNBVSnT5Hv7GfSs
	 NlOAowhFH2/pZhB3kXoKWg2prrjQ1gT+ighq9/+fTR8lEKKOg0fZRzw3PwST4eugu3Nz+
	 n2KfIYgJHVOF6gCButg+uKDmCn6L97rwkz5pb5U4KOwW/DQKch0IXyy/kx95zFpIyo5fn
	 N669/Uv2XrnJthKbeOJmceYXF1FM9MNB6sITD3Y5RHemAuKxc6BTXJKme370xgy9WL8XY
	 nHt6yZ9xmfSSk2fqYprEyglIhY+5QeCrv3Cs7ZSrnvTSflrfaE0qE56SsFOjoQy5o1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sok4x+qO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U3TGMiHe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE38F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sok4x+qO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U3TGMiHe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xsMe2172035
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j3WJZdu5775elj6uuKLwnG
	5OWtcyQAMV793EswPClxw=; b=Sok4x+qOHyVxuPipE7GtNfO1/rPu2zg79DNu8N
	hnplTNRMR+l5OdyGhr1eeeGo5Q3ZjY8oZtB3xF17wF99fhHKnihjZqA93HKg1IXn
	XuFboaCcdZKCTRGO617gnO8qFLmOgDMt9fr3A4rPtt45Ra+0e4jy/JtjaPTr6IZL
	avn71avb6o5huyFX2wJozZeuctvcpKUllYJgMw1uoZzVG76uILTeu50jul9GISA3
	OWSJTiXw7SmlZUy7nl4W43bsp63nYHqw0SEIpKE2ToYsWfmLHZqxIgzIdjy4TNNP
	xT80qtksputk4foZPzsZkJaV/C8HW0wQ3HqkhoJArnKbjWnQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahkyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so3813481eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660169; x=1793264969; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j3WJZdu5775elj6uuKLwnG5OWtcyQAMV793EswPClxw=;
        b=U3TGMiHeLmNtePntlLn0jtbc8ydMq1mGgx+56FWS+bz9AORyns/4Tdvq8i/y1Wym8o
         dSDXNlk7lQW648OTvgMlP3uVSUaubrUXZQzo7pvdPYTbXdp3ytVBSoPJdyyeLVZ3AyIT
         8wRUik1YJxYBmjTE+Cu0FoeaLIEnYqYy4DzAoPdH6c6mx/+kynC9/Xbzp6T+QqUy/qWo
         HVCIhfl/kkthXDSnneZrn/HIGkL+hi5AHMTpHiWpOJf6IPc7oibE60KvwWElexiHxyUl
         yIEF2SOylP3xyJUXBpmtslcVWsovXzDwZTg46JGZ5omJd8CEOj/y+q317Hp1GMqHviKK
         T8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660169; x=1793264969;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j3WJZdu5775elj6uuKLwnG5OWtcyQAMV793EswPClxw=;
        b=kwLVmpz84CXyf5+Mlq8wVafsOEfzOqgeCvMrRCMLaVMuyAGxyZayxKHrQVKWmozFEs
         5cVyJ44XCl90OuU/4Y8D2lpaTWhPc09bdiO5mv7j7AubNM6WUFX5ws6l/X1lbejFSzP6
         GLIqb0pX4quwgCn2LSy+mrV3pr2U6glcEAKAxGkIxbpBzLGxq0TBQW+PiD3BNGtQAKv8
         42KdghuiI/IkBpz9/OBOweZjwuMEVfiUmSzpCGZ4kUIgOjkq9ybn+pXeLYwXddoL4h0C
         WgJ3AeZcl8/qHhjrA7BlXWMMfaXdOdY6X9u/QJfNOq3x34C5w3YKnqRHt9W9tVx7D9Ij
         r7iA==
X-Forwarded-Encrypted: i=1; AKwUvBwfFUvJ6RAB1wUx0W8aPlSExrYKLauSqOP8BZ8p/ED2LxKIjor/5yPF0lOIvSYPcwloCQovteQRaStxgoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpc81+wQVpugBlZQ9CXrzSf8N5DZanjmwQglCZLNf9mnQyeoLM
	kTSkramSVaYzw20e22waObgPcnUP+6/f1s4FURlgls1KBCNTHMz1TDj1AhLN6HkjlIsGDCidh1M
	iPf/0kTiG64WkR/4WdRp02qos7H+aWjEfS3EcpOqy/4GGtppUk7AnleXbtYqnbDHc2Uw=
X-Gm-Gg: AYBFou3tM4g8Ns2C5s5Lfds2gF35wPPlvrR4mC5NkAd/UGPRRzZUWYoQBPT1/+7PJBK
	Gq0CkmPTUBw12P80YHTh4FwhBV0E6a9TjGxaFXDjUmTp51Wrv3ZTdp9/oMshx7i8BCf8EJ6mcht
	5oJmcMnwDK9ViIO8jCOIHiVbxu3yKLqKAP9PUNS3XhwQGroIe5OyRuOvFTNc2GylynZSrIpBd2N
	yoweFCC513uJW58aXDyhs/BzDgnF8VOLSPkbv5Qj1iD4ivPsdQ6N9NtUt14WN4+jLgrStsKfi7T
	u5gTbq+HYFf3rm0R3Ah2ASen4BJW8e2JJZo20MKC1oIkRaHJ9y0/wkX3yMiUcAEFTdgkpG5uCIc
	kbYh1W66ShOtBii8RxYRdFR2Td5l7r/NC
X-Received: by 2002:a05:701b:428c:20b0:143:54c6:6a5 with SMTP id a92af1059eb24-190a7e0c231mr5790185c88.37.1792660168780;
        Thu, 22 Oct 2026 02:09:28 -0700 (PDT)
X-Received: by 2002:a05:701b:428c:20b0:143:54c6:6a5 with SMTP id a92af1059eb24-190a7e0c231mr5790148c88.37.1792660168220;
        Thu, 22 Oct 2026 02:09:28 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm20475694c88.4.2026.10.22.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:09:27 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v2 0/2] fastrpc: fix probe-time races between rpmsg and
 userspace
Date: Thu, 22 Oct 2026 14:38:46 +0530
Message-Id: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ7S2WoC/22PPW7DMAyFr2JoLgPKimXLU+9RZNAP1QhoIke0j
 RaB717ZGbp0IfhI8HuPT8FUErEYm6cotCZO+V5F+9YIf7X3T4IUqhYtthpNqyBansvkYSrZEcT
 0TQwKvTQDug5Ji3o5FToW9fDj8tKFHkuFz6/hH7ta7eTKhrBMwMR7AgayrfXWVq45j+tBdZYJf
 L7d0jw2Q+xDROxs3+mzC32MtQvWeIVDFzpnjI6SpBa7/zXxnMvP8eQqjwC7q0SU//6zSkCQqtf
 BKDc4Re+Z+fRY7Nduf6pFXLZt+wVfI7UNPQEAAA==
X-Change-ID: 20260923-fastrpc-probe-fixes-30c1980b50e6
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660163; l=1910;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=GFQalxNhnzpwWjm7qg2xNhpXW9tdjjxqTNEL/AZf5UM=;
 b=QbQSyyVdl4WlLYx8U2VU5VSCc6okBD3GFA81JkdZS7FkrpJp5C7ukMRM06GCf1gxI48cZynGC
 1mR5saLcRfgAHEHis2LoIX8F7z/NPrUQYV2Ly1h+RU6Svnjk7MlaVCO
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: _ih0assdNDdYgZlcWfq-cE5244Sa-VbG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX+Qygi0bGzVlN
 6RjesJ3B0ZElK/PubcSKs44quPfoS97W1BCa2TplvcHVJvbxxx87QcfWV9/E711c9Z+TQVL502Q
 w3Ug/l59mKPWFrLLiERFIrXTr55gkI4=
X-Proofpoint-ORIG-GUID: _ih0assdNDdYgZlcWfq-cE5244Sa-VbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX8I6P4a1Eoa6i
 PwCNHX4+glNjAiJHhHS5myBol1lrZnqSN1WdIAyjj/9jFkYdSSrMN3+nSAvnHanxwIMPtCjVJ/K
 J5Q73fEVvZ5mFaKPaz1BAt51OgtEzTMfKUs9sQYtFN/TMsxBL9jNayIA2N8/R3ylTnZEQ3guI/m
 yUCJp5SOyQPsgQqRdUZFwmHTkET04eMdgn+D5nR9LZlG7L8CmiOhtfRVl61OpRAlJwItDvjdexf
 rPB/I4msbkjF/Bgs3X5PuMUKA0Uzp6l+iDj3zlG2sOJE+dsR4WvJiVNQsp+txnABMEGJqoxAoo6
 jJrMFhz8Te17gOKSfUyMZtBWhpFmAZabLut/+sM20ZtXV29WaS/DO3+x0ZYdDy3POYcYs5zmQ0P
 QQH/NhmgYMaa1GN0yhAqfFQgtC3UqFlgJnkJLAtK2oMuCVMxzhFWL4EX8PL+risAJJTjjsrQeuW
 gCKK4oTzjHib0j3yZmw==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d2c9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z9hRlnAjW1SqKzzyvooA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

This series fixes two races in fastrpc_rpmsg_probe() that can be
triggered when userspace opens a fastrpc device node concurrently with
the rpmsg probe sequence.

fastrpc_device_register() calls misc_register() before the channel
context is fully initialised. A concurrent open() in that window hits
kref_get() on a zero refcount, and because fastrpc_cb_devices_create()
has not yet run sesscount is 0, the error path calls kref_put() on the
saturated refcount, triggering kfree() of the channel context. A
subsequent IRQ-path fastrpc_rpmsg_callback() then dereferences the
freed spinlock, causing a kernel panic. A NULL dereference in the
fastrpc_device_open() error path when cctx->rpdev is concurrently
cleared by fastrpc_rpmsg_remove() is also addressed.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v2:
- Add Cc: stable to both fixes
- Free cctx via fastrpc_channel_ctx_put() in the probe error path
- Clear rpdev and wake pending users there, as remove() does
- Move fastrpc_notify_users() above probe
- Link to v1: https://lore.kernel.org/r/20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com

---
Vinayak Katoch (2):
      misc: fastrpc: fix NULL rpdev dereference when session alloc fails
      misc: fastrpc: fix init ordering race in rpmsg probe

 drivers/misc/fastrpc.c | 95 +++++++++++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 39 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20260923-fastrpc-probe-fixes-30c1980b50e6
prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v6
prerequisite-patch-id: c8b4a3873f9cf0d69beff0f608933ae83faa4c47
prerequisite-patch-id: 05d9299adf4184e0e56d97dc063ab5bf227cc5a5
prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

