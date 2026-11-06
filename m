Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979096;
	b=A5vT+UXM8W8VQYQJevTZxCKms4JCtaxWU36hOu5ICpsie6I6RKAhdJIpNLQOnatqUFus
	 U/5ujowCFoxOAyoJk7G/6SWfgJfpMk5tmZJ0c6+EjtiyERAiOWomNGHqu3zSJnleCMdAi
	 eaqP9wHKsmvR5ecYJcjnkKlOonGhD6Tjhv+CDU9R71EAmd/LgCfXvp7L6Z62nVqQ0VNmb
	 YPiyF/Ep6QwveUps4qe6s9y+2AfpsaCuHBdB3FFc2enmgcpYHMu+rrL4h310w0lh6vkeN
	 fEyX8gMvVOTNHwS8vfU9JTM7Q3RKOLmN7ShS3Y6IGsFYPiCESL1W//tqT8K5/9nK7EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
	b=1BtJoMbN7DQ1q5X/8GmukkDxWjC1Df3BdINTIKDa7ILahM+vB3497Pw+iL9ZMZm8T8s8
	 Rt4yB2hISfN19qLNQW92ZGf8UBztRQ+ch+0wfft75Ves0lng9285L7ulueqvxzrTdVJYW
	 M5dn4rB8oQ1aNzfHLQRgDDIZbn6qGT9ZMst02PIXEArtSKnKTRmvnfTxbUt8mDUT6M8uQ
	 wws2TYMygTYbh6TPkx1UbsXSDY2+BYh/mqgyRqe5yntQdJzWXr3y1LNgi5c5mARlVK4Dq
	 aEowQB45TGgEYp1fuY9KLgfhoZ5Mjp7BD5mzA5kk215BbcbB8B1eMk+OTRmEExtLEMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWpjwBaE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRKhn1vT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953D606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D953D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWpjwBaE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRKhn1vT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExuL33722890
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl
	2ScC7y7M=; b=lWpjwBaEKXb5o6XpgJVXUazxxmUjLCzISZPNG8YiXBFQLgzJG+W
	y3C9r6cVlMMa9RNfi8xOpVQRDWcalIqn70FUa5oz4QWR28Bheln38mNUh/Z5iC8A
	7vyFwSkEUBlPp34MOEdQvP15FdHzJINEWeDsJBwQkGzIP8m7/95VIRJDoM3pqxbE
	i1VhDTQVpHdibAbp82FWgGAzmVgMmbPxWVcq5UMs+6SYX+AymRHtnPn3VpccFQpk
	x15GEefyeV/3VIuOs7DdNIXeYbGjBrw0RaWcbLcVwiy0nyH/iNcDox1meULAR++p
	EAJjrStumLyrFFINzkLN4gvcwAf8VNpqvXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9kbev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:31:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso971500eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979094; x=1794583894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
        b=fRKhn1vTN0Iumm7bTnmiq+f3Duq6spQsILkyqn1nGc1r6umvxQ+BQsgRRz4sKfoBo1
         cTUoAwldoYWu2AFvABamdJWrmWR4+kSE3Swz6v5jVY2rqbhz6uUjZVgH+KNh63Q842jH
         mhZ5iIv/fOTfzcBBfERMB4/k/nestjIUpW9Y478LIEEH/lN1d1dyn7hEl3yVfpj0StWD
         A7Rf78Rcg6FD3YHF4EgFyUPyMlNTMwfPKPKWK2ZPJNiYnbC6UMPis2VNiTGxSztwk5hU
         HgW52l0i54zn2YtkjP7wioCeu8tBqOvEwzunsR7V6i4pOVbjnxarHD6F53eyak9dnX24
         LcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979094; x=1794583894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
        b=iVskG3gaEP633Pm02c8mitpC7zdgja9R1DtLteX6+z/9uwVxFn8+UZI6/dDmIeh216
         Vadz3VaPU0IX+epG/mPmylrAoX/6jGTwTeAXQJRqNCZnolWPh2aNw14PWyILogVrGv7j
         mchjV8rbuMz+NgxzYmD5APo1e1eDeWfDKaEGUyW2l/VvfP/TRjtTHqypejylCwr755fW
         aaJxmScCpxdqFfWWG1wHLOi2yQySD1sdv5LjfREdUl43r73eq7qrUSd+BTKGuZkFr00D
         FCWjeLLexQlpy6t51zKv8b7Gk/EyfRxyIjDrRTxTxcShL7tD2aAsE68xKIVOClyUNnI1
         yjhA==
X-Forwarded-Encrypted: i=1; AL+hErG4kU0vrMjt1De0u10BnWUbxntZxz0qWcESD4f+tZwZ1ZaKy7KV+zs9/5psX59EZOUGIjR1IvSo6GWsdBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MGz6QFElcm4WfwTTRwrnapvAXYwYB5Vt0FBejN4p6rT7HXInH
	NdjT9MlwbSXyyPaovrOAzOM7LSuVlJDhcf5nE99s1Zuv4SZWJUh3B/dpXkP7wVKICojQjgj/FQm
	lsypxKPJSoQ2q2hbjWFZurHs+YSjYjObw0yCNrlRD2rvVigqpyaHA5Ni4NyBVWPhl+9c=
X-Gm-Gg: AYBFou13y3vwe6Whr20c8p7AhH0XMQOA2Idcj7JEHOL5/PO7DcinWFl2+pz3huYGQ+k
	CjmJXBG7trDQmco2j8D1h67TPuMPEmMFKdcJOJAotD+Z5SjWsgOKgRG5Ij9Uy9EhUFYy/koL5xT
	GGAi+qZuMxLgwWoN/8av+ti4knCVIstaDc1g/OGE+KcG1wrhA1607QUMA3k8IVGVJcwzJCOQwGb
	BHt/hjgncZGBViOk3vMS3rf71x8Gss1IooyUyn6XLgB/SaVt9Q7MT5kDZfdw5/dz1xjmHXgPhMh
	jhUttUJD3BDjFYtw3q/l6iNfvIY5VhEdcsZlR5tP2ucEX0/WkCIDRKbJRFfrft/tdPeQsRBn2VM
	/q8cKn8fMv071qsJXwnnj5Quc6lnnaIyG5gDrCACm3gJ1z/c0TW19267dhQ3MSbkkM5uxjZSAP7
	uigrp4RAQ=
X-Received: by 2002:a05:693c:68ca:b0:36f:5822:4bb2 with SMTP id 5a478bee46e88-36f5822944amr4017425eec.19.1793979094037;
        Fri, 06 Nov 2026 07:31:34 -0800 (PST)
X-Received: by 2002:a05:693c:68ca:b0:36f:5822:4bb2 with SMTP id 5a478bee46e88-36f5822944amr4017399eec.19.1793979093356;
        Fri, 06 Nov 2026 07:31:33 -0800 (PST)
Received: from QCOM-seNJUcZa74.qualcomm.com ([183.82.133.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm13618197eec.15.2026.11.06.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:31:32 -0800 (PST)
From: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: qcom: iris: improve error diagnostics
Date: Fri,  6 Nov 2026 15:31:22 +0000
Message-ID: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h_Oe_Dikh5sD48uSNbz7veWmEoBRWPVl
X-Proofpoint-GUID: h_Oe_Dikh5sD48uSNbz7veWmEoBRWPVl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX+w1QJjX/c/lX
 s5GvCZh/ZUAqbzYa5Zv8CJWMP4R6Gnfdv92q+WDgOhRrbMfDfv7fAmWmCf2PGausGRbmTar41+5
 Gi3z3TSlhQUyCqgxANXmKAqxN88kE2w=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedf2d6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=4lT0C3RFl5dsjxM0/Vd6wg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=wK5rk20clm7eK2MKA1QA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfXy9ApcQiIuCFJ
 kq9xvaJvOdBqzXtfLXCok5Ao8BJhskwX2JmO1vB6WWQALNVWfe+caLlh8lRbGIYjcsWs/dlJwYn
 6lcI96Pcc4B/rDZDsTcIYocEPq9XO9wUZtOjwqxqlaDy6JBhk4pmyCll7BOmmfkv9jme3AfF6of
 WhxGKSR6uAzY0qjy2V9pQUJPLpkiDzs67XC/o7UH2HRQ5C65uvUBzY/yTEKQpDkTU1Kw9/zYjlm
 3LDI6KWSeLMcq+EpGIEzEImNBVuAaImG7PVk4IEmMGQvGbASEg0kqnJCIkAo8bLdp2fCPDY5BDN
 q9OALVUdNhT6PXVu8sgs50IjffyH4RISBd2pUsa58B4nYShVtaOzWruimqMtBsI7JfHOP1edTmY
 SJcmcy8aJYVmyy4BoX0vD0uxGjarQXidLEgd72G9VxEcQ0d7ki4QX3M1GShPiy2IxPGtgq1OL6X
 0tPkAorNoieyHvdzpfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060061

The Iris driver can return probe errors or enter error states without
logging enough context to identify the failed operation or firmware
response. This makes failures difficult to diagnose from kernel logs.

Improve probe error reporting, include available return codes and status
values in existing messages, and add focused diagnostics for system and
session failures. Report recovery failures and provide debug-level
messages for successful recovery and less actionable events.

Dipayaan Roy (3):
  media: qcom: iris: improve probe error reporting
  media: qcom: iris: add error and status details to diagnostics
  media: qcom: iris: Improve diagnostics for system and session failures

 drivers/media/platform/qcom/iris/iris_core.c  |  2 +
 .../platform/qcom/iris/iris_hfi_common.c      |  4 +-
 .../qcom/iris/iris_hfi_gen1_response.c        | 16 +++-
 .../qcom/iris/iris_hfi_gen2_response.c        | 15 ++-
 .../media/platform/qcom/iris/iris_hfi_queue.c | 12 ++-
 drivers/media/platform/qcom/iris/iris_probe.c | 95 ++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_state.c |  5 +-
 drivers/media/platform/qcom/iris/iris_utils.c |  2 +
 drivers/media/platform/qcom/iris/iris_vb2.c   |  2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c  |  3 +-
 drivers/media/platform/qcom/iris/iris_venc.c  |  3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 19 ++--
 drivers/media/platform/qcom/iris/iris_vpu4x.c |  4 +-
 .../platform/qcom/iris/iris_vpu_common.c      | 15 +--
 15 files changed, 141 insertions(+), 58 deletions(-)

-- 
2.43.0

