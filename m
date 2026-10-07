Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9431645516B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362706; cv=none; b=PTtoDelX7EktoCnEKD0Xc5NPtV6G7EhkzFQMw37ASuJQMxmaub/vH4snywrK9iibjbYideJaO+xoWlq2EoZ8ZjEkppRr8WMrN/MA7Krh3OMFADrPiAA6bV71Q4fVlieYzhBkk/VJKLU7ouCWKJQVTF86zJZIAOcKjaNqA2+KKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362706; c=relaxed/simple;
	bh=roGZaZ99uCnKKTamWoIkIriGwomWEy6esyHVfz1dG7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SpFEGBMS9xh+8ylR9y3o2Lu7p7tjEGmd8uGF6Ow1KdrXKRjzCjmsiM/9WRhqt2w+eCr8stVp+mRTBGXj66ys8wctTLCP2DNLVU0fBIn8Z6H1JCiYGD4akrFQjhxdGYJA82eJk8Z6p2MIw+M4f3mxVd64vOWe57Aj7vKbMd4qDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pogUkvGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3Mt0Rso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pogUkvGf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3Mt0Rso"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jop03686172
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 08:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlccGoJu5Sh
	8UcW87OTOUg2Yc8FQiJCvyD7DYkY7fd4=; b=pogUkvGfEg948zlTB2IBNAzfnwn
	aDMDoyAAnvFd1u62vcpjdOQQx0m6pcBiJjA2nZBQ7+5xkexUKkUvowpaD5xBwDFZ
	AkiKgl+f4Zgp6Ja2bIXyrC/t6t9GtZ3AGYClskhnrndSqa9QusVJQHgHtEjQL/tq
	Ivk5xTjhdIRY0rVM/LP/smG2FHlEK/8K/eQwjx7RqGa18oj2wIwwg5SnzpHakO6y
	9UI6TU2eCVUvUm/jicNt3gjP092A7GsT9OcxefOlXkJH60Lz+FYdmsJoSu4CjakG
	47b7Wix6i/xB2+8Q0IsqU3Ae0ycARKwczjHVBNzLhU4mS9a2+BezVmaS8Pg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609a6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:45:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc44d708055so4855107a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362703; x=1791967503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlccGoJu5Sh8UcW87OTOUg2Yc8FQiJCvyD7DYkY7fd4=;
        b=D3Mt0RsoqJKS2xjuOcpAaYUtwzofRwRzPfzLE5SaXFwCY7AnSDFl8FUqKBA91ZL+cq
         tADRI5r83LdE3Pm1KCtgbyVQob9Fuv/1GXU6IpD50ABlp7c4907WCv7+hbj8buomTMTo
         Dky6lpatEkrGRiJBG9ZkDmCzME5k9aizcUzP6G1QyK6EV9EjAq055VxuPi3slocPgp71
         SXYllsOM3g8dQ4/r5BY5+2IukhrUdOFVHJHVhlo/HjjAx2HC8+yeSvFqyomn8pwclPNY
         93nUS9BEXUaMq40vP+cigZlGgZP2pPz6Aikn+SCBbyMYJTGTu5tz9a1Pv82SIUHe0y+L
         l0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362703; x=1791967503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlccGoJu5Sh8UcW87OTOUg2Yc8FQiJCvyD7DYkY7fd4=;
        b=bZvpj4deNGAt/aY90bxEtGS7/n6UKmh0RJ9Itd1gG1MjC7vZvVOrYhQh/vRg5LoalQ
         ERurjdWH4LFAr/jWYB/ZKqk8mIBpUQ8jXcaNhe/haavz46HY1Ug1EhUGLtAtM1aiGv7T
         +IJDVRp9SGriTiTmDvdohHBQJLbwzSmEQaoj+u0lt/3ReQlTiB87LdeJoUHvYeZ9uiXa
         vgQ5lRXbLRYBUP3ZRX4GSolcL10OQK2ULWVObhA/dzsJmYrIkx6m9/9kVgafWLNEKvT7
         S7YgAYn3R5h5jic2bOsASWcgCuuYmWYSGhQHRnHjdQbr3dX1Gi6D4Rum8cZhtQH/S9uz
         zTRg==
X-Forwarded-Encrypted: i=1; AKwUvBz5c6yRwoVcP/2aXgQydqpTRcm9VgC7Y7vJpw9cIidfPOzUBRcZxJoixuM+vCAQXzm8Dxh4lqZPFuaoSDo=@vger.kernel.org
X-Gm-Message-State: AFuF++mOyhhhOELyTqHzTdFhjsWMZxSfdjCGeJeCC0nCEgCkSiKvA4Ev
	oSfvCeHnerPBUdeMB9aw8Ar3/UFsEAZrxU8PiMWLKoOGSMcjRDptnQITdIaK34ynY3YsoRBcuRp
	t7umjlrAzvnDQOoLB1P8gI0z2b2WWr/iphcuKlQlpPiSNEGiw7jyG3WvyzlmF+SDpEf6E36tupf
	A=
X-Gm-Gg: AYBFou3QX0gX+gHv4p2bkpWXfOmSy+pwMpAas7zqrQGs3GH+PS+jOUFZo6KI23l6A+e
	KKF/JsNPSCa5wA2onbDMKVgy/+NF0cRyQB+fA0LREhTuN7Z9t5Qu0eJ6MBJGZfKxwQeEpQS3jih
	xVUwGon7dJuJVeiQ3WfH4gz5wrwkTDkLnIQZiQGO61kRjt5Z1QQ1zU/fX2tboUvTsRneoCrkF2k
	Y65+uwEBeqitu6jcx6sIuybNyh+3TwcylyMmZewrUeVcPn2GjudIxn7cGFcEEBRPyZUeXOao7vg
	5pESurGMtK2cakzthRjB7rATHGBs9dvDXOP9eVYcoVThWGX44kxlmhpojFg8Grf9WTm11gY+QGe
	NWvFzi24DsgGW3YM8M3jjhdCi+xIBfqPl927dQRBQGQjf16cSsllYqrYi1rqWs5RrWZpCu0o=
X-Received: by 2002:a05:6a21:32a6:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e1340952e6mr1635442637.43.1791362702876;
        Wed, 07 Oct 2026 01:45:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a6:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e1340952e6mr1635424637.43.1791362702508;
        Wed, 07 Oct 2026 01:45:02 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8b0616esm1075091a12.6.2026.10.07.01.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:45:02 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 2/3] misc: fastrpc: wake poll-mode waiters on SSR
Date: Wed,  7 Oct 2026 16:44:46 +0800
Message-Id: <20261007084447.922-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n5vdenC8Zh3P9irmrvdGLCYAy3lCvCbV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX+GaSyIQf0d+R
 KANMD13g8/OWJp2ORkthI40qz3buMOwHpaMJaqga08gOntZ4UvSa5GhU5bI+iAtEg1Bir7pjWrf
 Fhbc29V/WnnZ7/pdX0JqS1fdzJxDayo=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac6068f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lWAaA6wL40FgRWs9ITUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: n5vdenC8Zh3P9irmrvdGLCYAy3lCvCbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX729d1ZOK2NyY
 1FTqkO3a43wgQXo2j2/SRDi9fKBQESurP9RJuEmrgO74aLebdSHGPLoMG6A31Bavx8Sw36o9nw1
 ASUQ7cPpln+hnJ9ykrTjRxU1pRj7JruPrtPyBs9wml9gj7pbHDEl5gsWdpiWzQgVLyuPP5qOAfL
 75FfSH2STwN0fRl1SuCtPbxHpxI2W0dEVx/5HeFZ88G5M0ruK+LqTu/2d68BLTIyMv5DomY7+9g
 UgutIAJ2LV4VmAROl3C5K6N7A0ywuGuk6yewUcjwHBOlfrOIhlpDBn/+qofhVnfN1SGenV61B0K
 9ey6sXb9DXXEJSz+85IsF4Vn1Erq0s1Vx5k7YBTn2TD8jGMn0+PDpJFeKS6921mVsPWSIAyD8gF
 BqFqvZhcupSXHImXRTRyAmqUwJGJTxGNzJ2z6se9jRWUleJGnAlnIkMIxR2nzELnIh9vPV0ft1E
 8Vt7vbVH0rQz3zlO8GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070034

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

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 05b2e7e4ad3b..c54c450cb571 100644
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

