Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636546;
	b=1ScRBmmHpke6kRsAa28hAxAK9NOadAtC/TRVMUVu/NpVh9R3zqq0iSuKAVR7FXmg94p5
	 mRchXBCg8U41enw7Az4vJBDTxTm4558XWiniUKUbSyYlfoasJq/m65VxD7qDUjn/Po3d9
	 GH5dCqmyTRammA0ecjR+iXZJcG41VjPUpee53NKEofLpQ/7UP3A/0tI5OA3Uck9cV+ZoA
	 LDY2Ud8vQTjQBdbLS9zNePefqVDDvK19KvFeMbQYDNgvk8bHpm48NCqc1eYhz5f4SnKad
	 ukk2aIEsNaG842Z8KqP3kyLlTd8OjBVd6emBsnoi2E3zmjSYgIkcWNhPjBI3iplXGMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4OsuM9apoqZE7bpRFpKXdoXy2y1FoU/7d0f47HGR6Tg=;
	b=YHJ6o3cck7tuJhaygWkMQ5018DXSMGi+ujhQvemgImKTzO7J8BaaRGLUfKftQKE5Ycx4
	 iU44xztd+54JtfgfhOy0S9pFRLXTdu445RvG9frauDtgKHo2PU/5bRhqkWU+9jbKyn8MM
	 ixbLyrcVOlT8kTiD90WzhjkceaH8rMPQjzPshZaBqv2zLbzPaOk/aAF0BHBlQYoQcZG56
	 wzMSA9O6XNL6kKIpk4yojKwBJL2W4xKU52B7Ss2zWEEsYhAYFHVF+mjD6+4/S3OYZPsbv
	 eHTozRk8/NNOTxFD3guVoSt5GgZITdnsw5ISQ3P6QzjtuWrfj/eyFVK0HzRWTsrwnVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7Nixanx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BKb6v1PG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B66606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B66606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7Nixanx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BKb6v1PG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1iJQs2820825
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4OsuM9apoqZ
	E7bpRFpKXdoXy2y1FoU/7d0f47HGR6Tg=; b=I7NixanxowPcgaV0ODpgIzjjkIu
	fKSD60Gkx2hC4kPyZxVSkLO23G52PVzlAUktWNQP56JJ7u+ZrHY6uJXznyapXgcy
	5jNteNPRD8B/29anyczmyqvSgZpDjR+OQ+KpFoMBSY1VnZZar9FF1EetiSbICWlv
	g0It0ayVEsQeI2y0Cku1An+hxC+Iv7yDnzE5BdHPhntzPazP6yKYS5be5hJIDVpi
	m2LaMCk4hH/m1cJ3H9hUiVMDrzNrYUe+oWZ2CNtqjU2k0t1+kE/FuS0k/Y6r71i0
	nOx2P7q3dI/+pHgDXAKOSVCIJymLHmDrpj2k0R7zJRC+cHjMS5taSewH4IQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bg9nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:35:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso2196474a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792636544; x=1793241344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OsuM9apoqZE7bpRFpKXdoXy2y1FoU/7d0f47HGR6Tg=;
        b=BKb6v1PGLnOM9dAam89XPa3c6Det9974cbUEVyXUaP3LhOjy84hgEA0/2leIcOFPq0
         kqA5q9R4TEzPQh3PmR5VgD/YS5oVL5HRXkDeVouOPF6QtFAAkbAvkJR7W/F7VV9a0SDC
         a6M699vzT6U03SKrJ6uRY0BbrEdMQhh62dxjgYkwmGjQhvUKKi7p9DNT5aJx/AyhDBO7
         SWQ4ebK/vGVd+dXBAd3YPY+DEpkzvmf1XEr0Mr2w4j8jvvvyqFRgjIr39x5qv+AE0XPO
         aESsDdu6EFCc4GIROEGyuTeMzsh7yzgHAxyD+v7OtyBOWVWk/xlJKBEH4y9OrCi3tUQd
         08HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636544; x=1793241344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OsuM9apoqZE7bpRFpKXdoXy2y1FoU/7d0f47HGR6Tg=;
        b=P6LGxD12WwM/DbrMrlMuB00VM9tc3rRKBmJ7OBJxSU8AsLRS9hHkTMuwDN/7Gn639M
         m1hvA6ErTOK+VZSw92k/YPob/m1gU0MUbxnunipq5Awefv1icHdMzOClDg4Kb7a7zAa9
         9Y1auKWZltYPkpTzQp4iX/KBb7z0lXA6/Wqdm4A+neY+kTgC0aF4Iz8rOuFXvklPAC8C
         6+hKc1DOet0ffbi5GpnstVgr/shAFy+Kjd2cCAVn208kCQ3IOp0JaK8JSgz9XWRYza9q
         hPjkO+5/lTvkSKYScEOU2pdkub3w5gxc4NghXbwA5HkqZ1csEKcJyTooqKDwlTrN3GmZ
         kdSA==
X-Forwarded-Encrypted: i=1; AKwUvByux3MGLKPcGoXQMS+VxzwuIoXIv1WiBOeYQlXN+Wx9J7Hnv08DABvP3FY8Frm0LHX7qAioZ6zCVTn+//Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZXReI8u3T7+ZXiXA/BLKeQ5oe/KOeQXPPI5ze35WyzOLzbj/8
	NJ4MaSJotQBm7CneGHyt+4NRJNFFH0QVcPWp7hQU1ZEd5QeQnhbCM3Va18NiMSNsyrHIbzC1p2m
	8Nr3ZySlvYANH/gbZdiZTnOWls81nqKlNdlIAUdQBThbOQVfmfGIHYOW90VZPe1ObrnY=
X-Gm-Gg: AYBFou036UZKiDt+RJr7ENw9fnNOPeeH1bq5L9rCLfYGHpRzaNQFs/Q6pOiyuaBm41N
	1cP9WfPusmvwEEikcvhHEGFkn6Y6k6hB0nBaQ6CaDoXvwMul0PENIVBx4yDGEjdJhSQ6rv6fndQ
	Qr+CMJvjE/YbouY4AtEGLMlXC8gqsUUJAjjD1J2jbqZx1b9mlgpN4T9HQTDgpj400MT6aSaES9b
	JFyaw9InZR6znAjNpNURj2AqZUrgXXTYSAmf3WQcg2U7/Ygv/SeBztiCVBgXbMccTh0aRIRpHlY
	WJltuEHt26jrtM1p3S6DdV+bshDQCc1gzdBR7xIRTd4FL1JxlatH6mNMvPrNhX0yCpTZx2wbfG+
	IQEsbm3h+qjuBR9KYq/JPwhdLtpMD9wb+V0Q/g8t3RnobDKL92deHgK7LlfzHBm2haVkoclId
X-Received: by 2002:a17:90b:5908:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ad86f44c42mr3219174a91.10.1792636543644;
        Wed, 21 Oct 2026 19:35:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5908:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ad86f44c42mr3219156a91.10.1792636543226;
        Wed, 21 Oct 2026 19:35:43 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada488550esm1959935a91.3.2026.10.21.19.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:35:42 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v2 1/2] misc: fastrpc: wake poll-mode waiters on SSR
Date: Thu, 22 Oct 2026 10:35:30 +0800
Message-Id: <20261022023531.465-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022023531.465-1-jianping.li@oss.qualcomm.com>
References: <20261022023531.465-1-jianping.li@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX/FhNStjdA8i8
 J+4truH/OZI6Gyvw+mbWw+JMJo3nXVC/tK3WPQcS70j0oqoLZ9yGN1Y2xMCK34ybtwm5CBSl5wc
 2jqTMlppfdqloeh8rZzmlzDKUEwl6wYUwahI33NN1NI05MCw2dn+4QKP+HV3emcgwFcpgZzsI8n
 8ttzf46YeaS4qYmj1PbIU+BtRSUma6tOoHhGdQgzuRtiE6AJd98NNxxM1H6wwmOvWozAln6hvLl
 JjspLRkqqsZS7IUxLFEBl9kMDGyJpDAropasdO+xqvlE5H4JNe39dqqhKW+8oAcxkFNG7RI2sy1
 +6njtNZ2DiqJ0FtLzp8wBxyN4eRw8DgC8nfQeAGMyGnw9dkhV4/7wC/17BiAnostpwpSELSb0R0
 v3qJO7aut7m+03iNbcfc5QUcyMUKmlit3Fion5v7Ncu0s5gAJAqfdhrc87zEHB2gc7Noo2HGHL/
 k8O98IU5wkBqC1IB9GQ==
X-Proofpoint-GUID: k6rkBONjzthfrxeLwttNGHTcVdgWq1DW
X-Proofpoint-ORIG-GUID: k6rkBONjzthfrxeLwttNGHTcVdgWq1DW
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad97681 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lWAaA6wL40FgRWs9ITUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX7k4bfdkjn3bk
 GCXRWT8D5fiC5m7oyWbDBZtBiBYL3an+GXRBa9enKqfL62ssJdCs+OouQ4sxRwCcKMrb7MtkV3j
 8WBgiFua/9lIM+cltMlzxuEfzxwtK/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220010

fastrpc_notify_users() sets ctx->retval to -EPIPE and completes
ctx->work for every pending and interrupted context, which is enough to
release a thread blocked in fastrpc_wait_for_response().

A thread using polling mode does not wait on that completion. It spins
in poll_for_remote_response(), whose exit condition is:

  (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done

Since the DSP is already down, it will never write FASTRPC_POLL_RESPONSE
into the poll address, and is_work_done is left untouched by
fastrpc_notify_users(). The thread therefore keeps spinning until
FASTRPC_POLL_MAX_TIMEOUT_US expires instead of bailing out immediately.

Worse, the poll address lives inside ctx->buf, so a polling thread that
has not been told to stop is still reading a buffer that the SSR
teardown path is about to reclaim.

Set is_work_done along with retval so polling waiters observe the
termination on their next iteration, exactly like completion waiters do.

Fixes: 96e62cc0a84d ("misc: fastrpc: Add polling mode support for fastRPC driver")
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992ee..d201f26d8e46 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2663,6 +2663,7 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 	spin_lock(&user->lock);
 	list_for_each_entry(ctx, &user->pending, node) {
 		ctx->retval = -EPIPE;
+		ctx->is_work_done = true;
 		complete(&ctx->work);
 	}
 	spin_unlock(&user->lock);
-- 
2.43.0

