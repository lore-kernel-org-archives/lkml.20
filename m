Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571876;
	b=B6CxgRbgYrDB9Zu8hMwQVQumYWtBlZdXOx7ywvEE7/gj+xU4DWeQLACd8JaJ367jCakJ
	 hQeOZmkSbikM1tieYb1dUm42rA3afnPSJRrqfVmf1lPeDKeeqdkqTrms/sF1GawMDKHRo
	 U4Fu/ZCYbLOl7dBfzxQ7tuEPZ6x05BsJeyHwD0zcHacAPf1j+qlVEyF3p+01LBGOXcHSZ
	 tZYUHAkquIidIpROef8T5cLdQMmHgQNcmBRJdlmZBHOlTCzHcsKQStshQs8HP4D7jw8pK
	 8HalBjhdFbVcPuCOT2aAOPkD5avSq/N6yyThfZTgqIF+xLlSr2CkdIueK/Fbk4z7E1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=;
	b=wpgeTu+XdmIBAGABLtXS7QJDGGSS1Q5XKGs4ZCZJmKFjZzP07reYdICO3F9B0ILXb4Rr
	 jzGfolrCO2OFdueGp6c4zqNUccR/LRCsgceKnpLOzFZnbnKvaIoccfPxx+EXdQLQYwgwo
	 BJXBiggfJNlcnX4eBomxTa+Ia2RgZ8euh3OjRoM7rh24aeus3UmaQT8+ILObJfOHmzg+B
	 JaHOAYUAq9pi8rQlyzPpAIBYlE3Ef7BJrd9VqGaB3EQBkV1lpvI2uGUg7CDNiNPIV0vxR
	 Gy+b2bkt83Z5if9HJp4zzjlU3OVQaLN54d4wbSXjEnCpmqj6CeYX+oiDXuL84Kdamaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DR3HzIQo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TYG/uBKE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A79606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A79606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DR3HzIQo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYG/uBKE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK9he733016
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=; b=DR3HzIQouOOfoe5r
	IBUOhBoN8Vpuz/QW0gjucKvMJ43N8EGZaAWMhAde0KMDKQk+EzPKY5lM8/ibtsUE
	oen98avJK478Q7gQ5004BuMUXvCKIj1GMAGO6fOOyF2O4/AMoI+M2fEyoFbWeTFJ
	+aeKm5+44BuSuk1NHSEQoXUzYDiXEpJ3yVevHNOg6rey/qXDuLldYtHRu4Lt5lWc
	QlEp/R1Cw8UBPkXmK0O5JFNXc0Ku6tN/+lYW6h1bMVPSjKd86NNDtHUykyDo3BFB
	xWRmbj9DQqGTvOoY5bgU1IGB35fH4tIeUFyiYka4DmUlW1jyHkuRsYRAJ6C6QHaM
	45FA3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7v9gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:24:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so10460289eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571874; x=1794176674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=;
        b=TYG/uBKEOXHdMfnhncd7y22OINsDqxyzmJjGGJ0cBqtSHqzy45GcskSNP/wASu4X+h
         b43KQm4lPpp2t3gARHnB9OT89wQxmAe3B4JKmgkb3teV5eGE8fHZ9uMo9MVVncRXb8/g
         T1njQCXczNeIPVhmHvLkQSZl8za77knrPd5GS4yo4Lx9impQBXwkUyaIFiJVh7CsEbit
         ElXCQHutlmrS0y3EYgAMZnBA+1cDqAPd2z9t/BjJQoh1jVYp8J5CZsp9a9LGpfWpAsEL
         BHsB3TwFt91/AqmUnzakTRMUoGONUCHYVClsypThoEf5FgqzrV42fTi4HyX8kDvp+jnP
         m+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571874; x=1794176674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=;
        b=aJZf17Hf/DmsiIk1PzE1XW44Do2XJhYU3VSFaAsZx7dl3C16M87kyhoVStwe/cxKft
         3Uhqn50beoW7ZFmebwS4F79CxLDAhSP4+e0grhLEHIrZPNCEqyva9yanSUPBYs6lNjSR
         Q6WrQTPMiYIUjT3kIiwUo5OInApAznRV7YPM+KMKx1HrjNe9LKMFfXbac1Sh5H180d6u
         9nKyo29auAqA7CKmz5PrWjKk9OItyW4aymhTswaTxjcLIqcnQiW/orTyS2Gaq9+MF81M
         EsL0GCR3ywmGSRqDxDc9ElLgfB4NSkPwmrICQRAs4to/1nDZHcdry3GbgPyEdYkvVowz
         /HSQ==
X-Forwarded-Encrypted: i=1; AKwUvByzsOAqgNIfajJw+eJcN4s52mdePHmze79UMbiqNJQBtFQ9YCagzBsEqeCQbuVMwkZ2OzddmMxdZToqLQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOiTOf364SpzcunuG/uvP45R08bh2DO3B+SFhI2zo2En0tHOpO
	OVhQ17+CfZXo4QZ3wJN8oALBdfgM+L6MRGZYLsdrv1GbCT2vGis/E2lMbq8CYxdczV1RLkfY4yW
	aubW7HVvf7kWS6+ZyNfDYxrIw0peTNW5cMLtWlRKBU6jNstOR8iu9rF08OmFe/5+a/ag=
X-Gm-Gg: AYBFou0zoUKMmbszAwHlz8bzeMdvzIWI/2cBfNsGU4/RabuoezVB59/b7AMXgo80jld
	mchhbdY/f74UjT0Nw/wLUSCi8fz4HfcAyRQ7XN1gVeo9Ly+bHvwBD9JV6sFyzA/vpljElsTrfL0
	CmQPcR7Bko9AMD5OQdGtkPTaWvhsqNPLkXeXcm/z2gXjdkfmPINuZrW0BQnnqb3tb3KEyuTUbAx
	B6mLngE6kif4vas07PUY9E/u9PIH5kV2wbZwipg0KzVUyJmkV5U6RP4Jww8KASaMV6DbSduEy8p
	hsejcL+Z0T42iRIzfEwKEogdQEkJBwAC6o/yTQfMyN2Yp+qn1MQZG8bORFtaKP/lS6pQUtRhXUq
	7Vf3DWFN+Nq+Ae4uiqTsYn9xdmMQOEoc5543jOngI2ZjigMQpQKAaFl63Nsb15V8UNy0v2KnLq9
	FfPBsEMQ==
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr13321971c88.22.1793571873340;
        Sun, 01 Nov 2026 14:24:33 -0800 (PST)
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr13321942c88.22.1793571872650;
        Sun, 01 Nov 2026 14:24:32 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:24:32 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:30 +0530
Subject: [PATCH v4 17/25] accel/qda: Add remote memory mapping to the DSP
 address space
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
Message-Id: <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=17614;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=IY8YP1W87/PSOoOD1olmTGLDaQ/HCpg3z9eht05ezIY=;
 b=n4Z3LYR1RSpuI1/T/wnDcSRFsqZ7ci5nEp71N9Rd+L8KQ+c8QxhNnm2+4jE0ASlg94hRq29FX
 2idyv70a+A0Cnpln14IiLgbOIchczjkkXzAldDXnr3QBwnnfKZRiRbF
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: YnkLBB7g10m4ylOIQt36MAcA60ct_-pk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX9ODBs/JyAqdQ
 bmXJcC2/Pnuk0aplmPnV8JtyeIf2E2Io7GmAY2jgVfKi/dmUSXwdSvLGLZxAGUfnMk393IFwkpX
 XcifiZTeMtoO4qAtU7Zpt5YO6dJqYnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX8Ig/HEr6DT7L
 h0kGbACqG5TcKoIsXd70hZDH7hezDItphJTdUs148qUUZqWUd9Xzt01XKUjt5Szk5BLW2MQZg8V
 XnnZ2e1UHcPC4WylzigVZTIFuOrr8cdkEQQjA9e7HFozO+7N7GfixNjUnORJlPvhysYfr91yXpW
 +E1RRqkv2WZSJaOXA3pRnX0EQTcoYNKZhJuNnKWBrVrsleZD7x5IyVgKD1VYVcudb6rO/bqGTWd
 UlLai5J8Ozo9/lhhrDc4Ma38TKAnFgrz+fQN3w9S3St1vhZ93ajUgNUMy37P1R4mBwueqeScHFZ
 TvXmaTjWb7qU0aVcnopIpYMd4tUEgdcw4XmM/nEGuJWKSiQaOdFmWSpa6secRN8XKUdNI1+5nsF
 zYTJpfmDcBfce3hgZ65Gg/1wRismARSLAAVdA45njXc45YIRs4Q0FCnDeXbkElySW0Ksv8oqGxj
 E+UDO6fWYyoyL4LX8cg==
X-Proofpoint-GUID: YnkLBB7g10m4ylOIQt36MAcA60ct_-pk
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae7bc22 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-75RLJru0wMfK1LY92EA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

The DSP can only touch memory it has been told about, so user space
needs a way to make a buffer visible to it ahead of time rather than
only per call.

Add an ioctl that maps a buffer, named by handle, into the DSP's address
space of the calling session and returns the address the DSP will use.
There are two flavours, selected by the request: a plain mapping of the
whole buffer, optionally at an address the caller suggests, and a
mapping of a region of it with caller-chosen attributes and a buffer
identifier the DSP tracks.

The length of the mapping is checked against the size of the buffer, so
a mapping cannot be described as larger than what backs it. Buffers are
looked up in the calling session's own handle table.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |   1 +
 drivers/accel/qda/qda_fastrpc.c | 190 +++++++++++++++++++++++++++++++++++++++-
 drivers/accel/qda/qda_fastrpc.h |  51 +++++++++++
 drivers/accel/qda/qda_ioctl.c   |  25 ++++++
 drivers/accel/qda/qda_ioctl.h   |   1 +
 include/uapi/drm/qda_accel.h    |  36 ++++++++
 6 files changed, 303 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 983c6a3dcfb4..7f19380701d9 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -125,6 +125,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MMAP, qda_ioctl_mmap, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 35ce60f3de2e..744d7317cbe1 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -3,6 +3,7 @@
 #include <linux/bitfield.h>
 #include <linux/capability.h>
 #include <linux/dma-mapping.h>
+#include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -251,6 +252,9 @@ void qda_fastrpc_context_free(struct kref *ref)
 	if (ctx->init_mem_gem_obj)
 		drm_gem_object_put(&ctx->init_mem_gem_obj->base);
 
+	if (ctx->map_obj)
+		drm_gem_object_put(ctx->map_obj);
+
 	if (ctx->session)
 		qda_session_put(ctx->session);
 
@@ -326,7 +330,10 @@ static struct qda_gem_obj *alloc_kernel_gem(struct qda_fastrpc_invoke_ctx *ctx,
 	return to_qda_gem_obj(gem_obj);
 }
 
-/* The context releases whatever has been allocated here if a later step fails */
+/*
+ * The context releases whatever has been allocated here if a later step
+ * fails, which needs @nscalars to cover every slot that may hold a reference.
+ */
 static int alloc_kernel_args(struct qda_fastrpc_invoke_ctx *ctx, u32 nargs)
 {
 	ctx->args = kzalloc_objs(*ctx->args, nargs);
@@ -337,6 +344,8 @@ static int alloc_kernel_args(struct qda_fastrpc_invoke_ctx *ctx, u32 nargs)
 	if (!ctx->gem_objs)
 		return -ENOMEM;
 
+	ctx->nscalars = nargs;
+
 	return 0;
 }
 
@@ -613,6 +622,37 @@ void qda_fastrpc_flush_pending(struct qda_dev *qdev)
 	}
 }
 
+/**
+ * qda_fastrpc_return_result() - Copy what a request returns into the ioctl data
+ * @ctx: Invocation that completed successfully
+ * @argp: Kernel-side ioctl argument buffer owned by the DRM core
+ *
+ * Buffer arguments are written by the DSP straight into memory the caller can
+ * see, so only the mapping requests have a value to surface, which the DSP
+ * wrote into the response slot the driver built for it.
+ */
+void qda_fastrpc_return_result(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_fastrpc_map_rsp_msg *rsp;
+	int idx;
+
+	switch (ctx->type) {
+	case QDA_FASTRPC_RMID_INIT_MMAP:
+		idx = 2;
+		break;
+	case QDA_FASTRPC_RMID_INIT_MEM_MAP:
+		idx = 3;
+		break;
+	default:
+		return;
+	}
+
+	rsp = (struct qda_fastrpc_map_rsp_msg *)
+	      ((u8 *)to_qda_gem_obj(ctx->gem_objs[idx])->virt + ctx->args[idx].offset);
+	margs->vaddrout = rsp->vaddrout;
+}
+
 /**
  * qda_fastrpc_invoke_common() - Shared tail of a FastRPC invocation
  * @qdev: Device to invoke on
@@ -890,6 +930,148 @@ static int qda_fastrpc_prepare_args_init_create(struct qda_fastrpc_invoke_ctx *c
 	return err;
 }
 
+/*
+ * Find the buffer a mapping request names and describe it to the DSP. The
+ * buffer is held by the context until the request is done, so that closing its
+ * handle meanwhile cannot free memory the DSP is being told to map. The
+ * region must fit in the buffer, as the DSP would otherwise map past its end.
+ */
+static int setup_mmap_pages(struct qda_fastrpc_invoke_ctx *ctx, struct drm_qda_mem_map *margs,
+			    struct qda_phy_page *pages)
+{
+	struct qda_gem_obj *qda_gem_obj;
+	int err;
+
+	if (!margs->handle)
+		return -EINVAL;
+
+	err = get_gem_obj_from_handle(ctx, margs->handle, &ctx->map_obj);
+	if (err)
+		return err;
+
+	qda_gem_obj = to_qda_gem_obj(ctx->map_obj);
+	if (margs->size > qda_gem_obj->size)
+		return -EINVAL;
+
+	pages->addr = qda_gem_obj->dma_addr;
+	pages->size = margs->size ? margs->size : qda_gem_obj->size;
+
+	return 0;
+}
+
+/*
+ * INIT_MMAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_map_req_msg)		IN
+ *   [1] pages	sizeof(qda_phy_page)			IN
+ *   [2] rsp	sizeof(qda_fastrpc_map_rsp_msg)		OUT
+ */
+static int qda_fastrpc_prepare_args_map(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_fastrpc_map_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	u8 *gv;
+	int err;
+
+	const size_t off_req = 0;
+	const size_t off_pages = off_req + sizeof(*req);
+	const size_t off_rsp = off_pages + sizeof(struct qda_phy_page);
+	const size_t total_size = off_rsp + sizeof(struct qda_fastrpc_map_rsp_msg);
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MMAP, 2, 1);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 3);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, total_size);
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+	gv = kernel_gem->virt;
+
+	req = (struct qda_fastrpc_map_req_msg *)(gv + off_req);
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->flags = margs->flags;
+	req->vaddr = margs->vaddrin;
+	req->num = sizeof(struct qda_phy_page);
+
+	err = setup_mmap_pages(ctx, margs, (struct qda_phy_page *)(gv + off_pages));
+	if (err)
+		goto out_put;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, gv + off_req, sizeof(*req));
+	assign_kernel_gem_arg(ctx, 1, kernel_gem, gv + off_pages, sizeof(struct qda_phy_page));
+	assign_kernel_gem_arg(ctx, 2, kernel_gem, gv + off_rsp,
+			      sizeof(struct qda_fastrpc_map_rsp_msg));
+
+out_put:
+	drm_gem_object_put(&kernel_gem->base);
+
+	return err;
+}
+
+/*
+ * INIT_MEM_MAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_mem_map_req_msg)	IN
+ *   [1] pages	sizeof(qda_phy_page)			IN
+ *   [2] empty	0 bytes, which the DSP requires		IN
+ *   [3] rsp	sizeof(qda_fastrpc_map_rsp_msg)		OUT
+ */
+static int qda_fastrpc_prepare_args_mem_map(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_fastrpc_mem_map_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	u8 *gv;
+	int err;
+
+	const size_t off_req = 0;
+	const size_t off_pages = off_req + sizeof(*req);
+	const size_t off_rsp = off_pages + sizeof(struct qda_phy_page);
+	const size_t total_size = off_rsp + sizeof(struct qda_fastrpc_map_rsp_msg);
+
+	/* The wire field is signed */
+	if (margs->offset > INT_MAX)
+		return -EINVAL;
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 4);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, total_size);
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+	gv = kernel_gem->virt;
+
+	req = (struct qda_fastrpc_mem_map_req_msg *)(gv + off_req);
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->handle = margs->dsp_handle;
+	req->offset = margs->offset;
+	req->flags = margs->flags;
+	req->vaddrin = margs->vaddrin;
+	req->num = sizeof(struct qda_phy_page);
+	req->data_len = 0;
+
+	err = setup_mmap_pages(ctx, margs, (struct qda_phy_page *)(gv + off_pages));
+	if (err)
+		goto out_put;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, gv + off_req, sizeof(*req));
+	assign_kernel_gem_arg(ctx, 1, kernel_gem, gv + off_pages, sizeof(struct qda_phy_page));
+	assign_kernel_gem_arg(ctx, 2, kernel_gem, gv + off_pages, 0);
+	assign_kernel_gem_arg(ctx, 3, kernel_gem, gv + off_rsp,
+			      sizeof(struct qda_fastrpc_map_rsp_msg));
+
+out_put:
+	drm_gem_object_put(&kernel_gem->base);
+
+	return err;
+}
+
 /*
  * INVOKE_DYNAMIC: the argument descriptors are supplied by user space, which
  * is also responsible for having imported every buffer to a GEM handle.
@@ -953,6 +1135,12 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 		ctx->pd = QDA_USER_PD;
 		err = qda_fastrpc_prepare_args_init_create(ctx, argp);
 		break;
+	case QDA_FASTRPC_RMID_INIT_MMAP:
+		err = qda_fastrpc_prepare_args_map(ctx, argp);
+		break;
+	case QDA_FASTRPC_RMID_INIT_MEM_MAP:
+		err = qda_fastrpc_prepare_args_mem_map(ctx, argp);
+		break;
 	case QDA_FASTRPC_RMID_INVOKE_DYNAMIC:
 		err = qda_fastrpc_prepare_args_invoke(ctx, argp);
 		break;
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index a5bd7661c26c..1bd696baa95c 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -45,8 +45,10 @@ struct qda_session;
 
 /* Methods of the initialisation handle */
 #define QDA_FASTRPC_RMID_INIT_RELEASE		1
+#define QDA_FASTRPC_RMID_INIT_MMAP		4
 #define QDA_FASTRPC_RMID_INIT_CREATE		6
 #define QDA_FASTRPC_RMID_INIT_CREATE_ATTR	7
+#define QDA_FASTRPC_RMID_INIT_MEM_MAP		10
 #define QDA_FASTRPC_RMID_INVOKE_DYNAMIC		0xFFFFFFFFU
 
 /* Handle the initialisation methods are addressed to */
@@ -149,6 +151,52 @@ struct qda_fastrpc_create_process_inbuf {
 	u32 siglen;
 };
 
+/**
+ * struct qda_fastrpc_map_req_msg - Request to map a whole buffer
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_map_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @flags: Mapping flags (cache attributes, permissions) */
+	u32 flags;
+	/** @vaddr: Address the DSP should map the buffer at, if it can */
+	u64 vaddr;
+	/** @num: Size of the physical page descriptor in bytes */
+	s32 num;
+};
+
+/**
+ * struct qda_fastrpc_mem_map_req_msg - Request to map a region with attributes
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_mem_map_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @handle: Identifier the DSP tracks the buffer by */
+	s32 handle;
+	/** @offset: Offset within the buffer */
+	s32 offset;
+	/** @flags: Mapping flags (cache attributes, permissions) */
+	u32 flags;
+	/** @vaddrin: Address the DSP should map the buffer at, if it can */
+	u64 vaddrin;
+	/** @num: Size of the physical page descriptor in bytes */
+	s32 num;
+	/** @data_len: Length of additional inline data */
+	s32 data_len;
+};
+
+/**
+ * struct qda_fastrpc_map_rsp_msg - The DSP's answer to a map request
+ */
+struct qda_fastrpc_map_rsp_msg {
+	/** @vaddrout: Address the DSP mapped the buffer at */
+	u64 vaddrout;
+};
+
 /**
  * struct qda_fastrpc_msg - FastRPC wire message for remote invocations
  *
@@ -226,6 +274,8 @@ struct qda_fastrpc_invoke_ctx {
 	struct qda_gem_obj *msg_gem_obj;
 	/** @init_mem_gem_obj: Memory the DSP loads a new process into */
 	struct qda_gem_obj *init_mem_gem_obj;
+	/** @map_obj: Buffer being mapped into the DSP, held until the request is done */
+	struct drm_gem_object *map_obj;
 	/** @pages: Array of physical page descriptors inside the payload */
 	struct qda_phy_page *pages;
 	/** @work: Completed once the DSP has answered */
@@ -285,6 +335,7 @@ void qda_session_msg_buf_pool_destroy(struct qda_session *session);
 int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 			     struct qda_session *session, void *argp);
 int qda_fastrpc_invoke_pack(struct qda_fastrpc_invoke_ctx *ctx, struct qda_msg *msg);
+void qda_fastrpc_return_result(struct qda_fastrpc_invoke_ctx *ctx, void *argp);
 int qda_fastrpc_invoke_common(struct qda_dev *qdev, struct qda_fastrpc_invoke_ctx *ctx);
 void qda_fastrpc_flush_pending(struct qda_dev *qdev);
 int qda_fastrpc_invoke_legacy(struct qda_dev *qdev, struct qda_session *session,
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 99b8a2517726..cd3cea72f50e 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -110,6 +110,8 @@ static int qda_fastrpc_invoke(u32 type, void *data, struct qda_session *session)
 	if (err)
 		goto out_put;
 
+	qda_fastrpc_return_result(ctx, data);
+
 	/*
 	 * The session only changes once the DSP has accepted the request, so a
 	 * failed create leaves the previous process, if any, as it was. The
@@ -172,6 +174,29 @@ int qda_release_dsp_process(struct qda_dev *qdev, struct qda_session *session)
 	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_RELEASE, NULL, session);
 }
 
+/**
+ * qda_ioctl_mmap() - Map a buffer into the DSP's address space
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_mem_map)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_mem_map *map_req = data;
+
+	switch (map_req->request) {
+	case QDA_REQUEST_MMAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MMAP, data, file_priv->driver_priv);
+	case QDA_REQUEST_MEM_MAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MEM_MAP, data,
+					  file_priv->driver_priv);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * qda_ioctl_invoke() - Run a method on the DSP
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index b2c7bd25b138..afb3ed0e132e 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -15,6 +15,7 @@ int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *fi
 int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 75e67c5f5923..bd2d0f4308b1 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -17,6 +17,7 @@ extern "C" {
 #define DRM_QDA_GEM_MMAP_OFFSET		0x02
 #define DRM_QDA_REMOTE_INVOKE		0x03
 #define DRM_QDA_REMOTE_SESSION_CREATE	0x04
+#define DRM_QDA_REMOTE_MMAP		0x05
 
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
@@ -29,6 +30,12 @@ extern "C" {
 #define DRM_IOCTL_QDA_REMOTE_SESSION_CREATE					\
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_SESSION_CREATE,		\
 		 struct drm_qda_init_create)
+#define DRM_IOCTL_QDA_REMOTE_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MMAP, \
+					 struct drm_qda_mem_map)
+
+/* Request types for drm_qda_mem_map.request */
+#define QDA_REQUEST_MMAP	1	/* Map a whole buffer */
+#define QDA_REQUEST_MEM_MAP	2	/* Map a region of a buffer, with attributes */
 
 /* Query type definitions for drm_qda_query */
 #define QDA_QUERY_DSP_NAME		1
@@ -137,6 +144,35 @@ struct drm_qda_init_create {
 	__u64 file;
 };
 
+/**
+ * struct drm_qda_mem_map - Parameters for mapping a buffer into the DSP
+ * @request: QDA_REQUEST_MMAP or QDA_REQUEST_MEM_MAP
+ * @flags: Mapping flags for the DSP (cache attributes, permissions)
+ * @handle: Handle of the buffer to map
+ * @attrs: Mapping attributes (QDA_REQUEST_MEM_MAP)
+ * @offset: Offset within the buffer (QDA_REQUEST_MEM_MAP), at most INT_MAX
+ * @dsp_handle: Identifier the DSP tracks the buffer by (QDA_REQUEST_MEM_MAP)
+ * @vaddrin: Address the DSP should map the buffer at, if it can (input)
+ * @size: Length of the region to map in bytes, or 0 for the whole buffer
+ * @vaddrout: Address the DSP mapped the buffer at (output)
+ *
+ * Makes a buffer visible to the DSP of this file ahead of the calls that use
+ * it. QDA_REQUEST_MMAP maps a whole buffer and uses @handle, @flags,
+ * @vaddrin, @size and @vaddrout. QDA_REQUEST_MEM_MAP maps a region of it with
+ * caller-chosen attributes and uses every field.
+ */
+struct drm_qda_mem_map {
+	__u32 request;
+	__u32 flags;
+	__u32 handle;
+	__u32 attrs;
+	__u32 offset;
+	__s32 dsp_handle;
+	__u64 vaddrin;
+	__u64 size;
+	__u64 vaddrout;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

