Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908402;
	b=zJFv0krlxwMmzMicKx/kYzvh0slcr2T8JvKwvOFdq2XVkUZQEUuYTvmmU8NlBUmtsc/M
	 FwXWOBVhQBNmXXbJgR3ikOZs+aM57Qty5AaIsVIUxgZcDpU7/Gm3CSGd9z7aZWN+KJk97
	 SCA0FRJE0EpyfrBAHdkyitn2H3yT516zoUex4nLZ3X+sNUEZxhre4xpIgaUPiPmnUJ+7v
	 0D20U8+V/8ImPtXIFiey/KOmImZ4ywZloGxYEV9FOQglcV/F1f6Ua3oAgn4QqO4NmxOq8
	 bbIX9jo7ln1kS0ERicDAWwUX1IKzXSg8e67nU+61VA1PaO+fut9PWaANEbIWSZhF/wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908402;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=;
	b=0QftOoPXYAgOWkJFI4TkYxG4YENij5gBrmulhHX+g9lhcHWPIqFEpF7Jt/FZAbXbGHvO
	 Tgdhcfaap9goKYWQxiCLjfQeNZfPSCpGCDzVaOLRDejuhb1RGWjXmJvS82ipQGyVfVRc2
	 wGjNDUH+ZT5zlhk3jMP08YP4yude3cc6kPbhSVhRYoVqnwmLGlnSBDPHOHAN/N/9h6Cmu
	 uZISugfiiM8cea7ybUsYjOMEcmkURY8r+cdTsU6j0DZ8siL9Ozc9BohtGhaeJnIi/B7ee
	 80s6jVr1kBRtDB2ceBhFzoxY6iYHqh+76d+WiQH6LC02gbdYGONXuWyidQOS0V6GceQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V19wbvnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sovk8e4e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16075606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16075606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V19wbvnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sovk8e4e
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8WtLr3624157
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=; b=V19wbvnD1BZG5TbH
	vgajGS4YB7fiIjwUpJ/5fHnF/EXTc0jt1jO92Kq1zizBG6jgB0LWwq2GUzpzyite
	qiAzIFismlNhqRPoC8Tc5Vp3ZnSuk4Vc+CvHq8F98nx+iQMI2E7+inoYJBCDFqBB
	alV6ja8wD6cG8VcYD+jPgIWj6z8lOARDEjmARANLZAFtufRxORKOQ1ePBm4ovEeJ
	KQLVIlJY7owkw+VbEElMCkgXeMwiDR2AU09OBZ5+zmKcl45WyAoK4kQHyk9/IFLt
	aKbuNbIaW6NnJBTGz9a6Vx1HeSvxJkQ/+4kcGvtAD2AMypq21lPTHbwIERpJRw4O
	wy4Smw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejwju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:40:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so2611240a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908401; x=1795513201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=;
        b=Sovk8e4exB84jEqI/komv8rPaU1DQ0B3P9n1g9ovYOix51mMGoVGh1k7Y6uDoZa7Qj
         lRawGQv90+zvhaj4YDKPLyQ2ltgEEoEXfm7ZiEpGK4C8OPd1hPOM9IjTZCoVwXEhVyF3
         7tx3jhSzu1TT/t237+Igm+G3ZsDd8N8mPF811Kbxfp0HMeCzrLg68K7bHA18Ake36Q15
         Wk+KuL6OdTnVpsb0jyZ4D2rb1dgTqJtqNqelwd/EUh7pQ2fcoqmbaQOt+yj4ru/TZvDC
         nsdOf0N85uOFk+ZmhiVL1oWfCi2VpqwNAmwBGjSdLsDEClaHdNtHtIi1iESIO1UKQLJ7
         2vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908401; x=1795513201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=;
        b=CPaEj+ufOX8oJ/ZxT7LkJHy6/r3q3jdOe3rDxMO9teut2ff8sEIxs20G4ZYXTQxBZB
         97NU8NRreC8jBIF8wyL4hWPkunmG9RMFUy2dz3fCsFUn+aVp+a2TAd5IJ0/3HdMdxBo6
         HTuoRePyCDm4sUKqkIfGVf3drI4WkQW0QMfPYmVXflntzSly6WSIRG3Yf9NaDgmIEteS
         zxv1CPkBFY00EDyNsFx0EFCP4+FlEbDgGNQrqtrs9KR2JZa8j+e7fT2yK4e+8c+Aj4nD
         CnAdxAEzkCeKZDI46yjwSk8ys849RJSzlnKYHibi2KgdGf1kIW2pTNDWIngyZ9RaSQaE
         528w==
X-Forwarded-Encrypted: i=1; AL+hErGc/xCCs5kh+mhEKem9wtrsToRBTwHoC2t+kdoFnP37ZMyKBSyIuoqkYb6+cpUTJVpr+B9MEiGjaGpooVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MhKTc6gjbPNYKuqfL0PZLuPM2bBDN+8mh/XK/H5GGlUIIC8kp
	awi8Le7HVucAQtJag4gbtoK51seImgQCOMibDw08MebxGc/LPV0t+5BirCHbb3FC5QkKFLrY552
	NN3i+eKC6JHC6xBjCDWQ1iJOLt4X/aKzYhfE/sCTTplQZcUHLEiP64jvbGgTk2tDufKo=
X-Gm-Gg: AYBFou1AVxCHPjGVamxrLrm8VxTCNcBEjr4haXSYo0LB0To3nykjpeRxZxibUN33QwZ
	53rEHiP9eTVYg/5zX1+RjUajujbHvN0ij++kL42ihPA0eoqK39Vq80/9zACKoag37tDXjOXrNb1
	ANLXB78sKULCWVR1hyi14hJcV0JCuF4iJBHyuPzU74XsWNqTt94QiDyp0vMRQnSyavk3GTrXNBy
	S5k8XBLNDZI22wDk1KzoqtkPwBKAuVsGWgMwQUdbbxiO1zkZKXQGoq6iOwwi1vx5PBOq2aEa+7l
	rk3HbStGEIUGBD4f8QFPB+11KxdkvCATuo0edCOTppvzlroHiD3HtxdLj6VgSqITUqNCbaHA/YE
	I1VCmfotPW7f/lcpWrlWUXqhUEgUg4zPbEbGiMlwRA6BDMZHOBppehgm0dQ==
X-Received: by 2002:a05:6a20:d74c:b0:3e0:d508:59a6 with SMTP id adf61e73a8af0-3f7a71a6635mr11751762637.13.1794908400567;
        Tue, 17 Nov 2026 01:40:00 -0800 (PST)
X-Received: by 2002:a05:6a20:d74c:b0:3e0:d508:59a6 with SMTP id adf61e73a8af0-3f7a71a6635mr11751734637.13.1794908400074;
        Tue, 17 Nov 2026 01:40:00 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160bfabsm5299078a12.4.2026.11.17.01.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:39:59 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:09:46 +0530
Subject: [PATCH v4 2/3] misc: fastrpc: drop the DSP-response reference on
 channel removal
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
Message-Id: <20261117-interrupted-invoke-v4-v4-2-2320a8a7eda2@oss.qualcomm.com>
References: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
In-Reply-To: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX4sd9CfP+20Um
 KkEzLALQgZI39kLeBAS/fY9qZOhKDDrmLUhHGN8FZ1WG/TUD5Muziv2JS2N6DcCTRXfofhJXrB4
 n2sS7wNkT4YCM5urOxvHH+0CQbG02d4=
X-Proofpoint-ORIG-GUID: eJ5Qz3GtcR9ldGJN05kp8ECczGDpQRiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfXzBaitJ8QlUzJ
 /RXb4lLMeugxAXQyOnR5wAK9eMHCUorsF4oz7IvO+M2NQE8M9I08eZZjiTHnG9TTpbcGGLkBsy9
 mlp6u7GjgBiVDJ+p4UO8OoPoZZoChSSxb1U8SJMl+uGWMf4u1oeibbQiV/davJF8wvtdB9HBBEh
 45H9Evht1ydvvq4+CiPGMEQPj4HoUrHxnuAfglGL4Kiu9fS8DlGtWUUb7VbUorWtJs7S0lmswUZ
 wjHDlgqOeqOFqYx0Vu8jzOQwq5TgXAa7AGnKuQgC6WMGctlqzMjD8vNm64wocFkGEL+CBzpPxPR
 zVTCKX/JMzAfqeMryY3gAmMn3MR2UBDhyyWkQDgSdIQlf9zd5FQhmgan6ZuHAiI5iP00dR5JNo9
 H+Q4dzG0vRF0NFWLQIsL0Qs6M1texsz9B3WP2RJakqtjbyBps6cjhN81kH9lS5QPUSdktmSYvLp
 k/YBWIGk01MxqlAJ2hA==
X-Proofpoint-GUID: eJ5Qz3GtcR9ldGJN05kp8ECczGDpQRiZ
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc20f1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lRMAZjgjxHAodmaZVVUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170038

fastrpc_invoke_send() takes a second reference on the invoke context
before calling rpmsg_send(), to be dropped later by whichever side
consumes the eventual DSP response: fastrpc_rpmsg_callback() for a
real reply, via schedule_work(&ctx->put_work).

fastrpc_notify_users(), called from fastrpc_rpmsg_remove() when the
rpmsg channel goes away (e.g. on subsystem restart), only completes
each pending context with -EPIPE so its waiter can return - it never
schedules the matching put. Since the channel is gone, no response
will ever arrive to trigger it through the normal callback path
either. Every context that was genuinely in flight (successfully
sent, not yet answered) at the time of an SSR therefore leaks that
second reference, and with it the context, its DMA maps, and the
reference it holds on fl and cctx.

Schedule the same put_work that a real response would have
triggered, exactly as fastrpc_rpmsg_callback() does. rpmsg guarantees
.callback and .remove are mutually exclusive for a given device, so
there is no concurrent real response that could race with this.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index bb0c304196..c5c3679f87 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2835,6 +2835,13 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 	list_for_each_entry(ctx, &user->pending, node) {
 		ctx->retval = -EPIPE;
 		complete(&ctx->work);
+		/*
+		 * fastrpc_invoke_send() took a second reference for the
+		 * DSP response that will now never arrive since the
+		 * channel is gone; schedule the matching put the same
+		 * way a real response would via fastrpc_rpmsg_callback().
+		 */
+		schedule_work(&ctx->put_work);
 	}
 	spin_unlock(&user->lock);
 }

-- 
2.34.1

