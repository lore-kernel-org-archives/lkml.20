Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635813;
	b=a8N8EG2Z/5Hk/DfuZIwBw+vcLTMj6/jls+2Grw3hNC2UrY4dfAWpLPyYcJuoOZNtbi6N
	 vrGglthvx2pQ3zmOnj5EeIwCYPGY7LgjI8jiZKl6d4exbl9ElBzphyayhajonTmkIPuL2
	 RKaEUfcd8X6zsD2ONieqIu07fbnuaJ1xVXZyzjjcYvj6r5JKlNUD4Wovqgyei0NOBJRS5
	 f6WmNQB+sETnaJyuJMtRswpWOkIJVrtW9xsPR8R4aSeDyK7e3Y5DyYvty21bdkbJnoFT2
	 MIQdz8l640CzwR7deklzPNrLJ3f5O6DltCvl7Hnv+SfznQ9gmbhmA8EsLVg0HUR6vxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K1G25hLX5Ki186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=;
	b=0M5QDbpf7rpiWUCpx270MCHazS2KiEzLEy/3GVAfrGTX13+rpF4Y3Det3QrtX+ud8Dnk
	 4oOKndkpNsShPaiV2waqXzEdTnmd1TcjCYzCodT6jOLq8wUvPp/eIdwu9SbudaJJS8fcf
	 9kV3rbE+rbF/UVJUMEZlEjwsq8k6Oel/IzwqaEt099/fMbMVhNe78yFQCxKIhN/uKrxL0
	 HhDSmcwtAt5QgIWw8BKn6cPEBUZc5BA8LyTWypoN7NDUW7LRscH+RvNTlbq4YvdFyX4kf
	 hYHOmS1Ay9pDmJ4tQ8nGkjMyoJSI3goFFABfV5XuBlufYBiRDw7TXA1htf/bvS1bmZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nZ/6DMHv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ppff7d5N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A360805AC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19A360805AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ/6DMHv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ppff7d5N
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpZ4f4034202
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 16:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K1G25hLX5Ki
	186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=; b=nZ/6DMHvFOP6HTIDfQjspkEVds1
	69STLXYocEUwu8Pn+QVDmBkvH8Z0bQJsV6nRgmmc0lYllnlyCR+4eQ5Uz9u6VHzC
	fSKOMvGiCXb/B0iyuxgnxWTbQASTuP4Gm2IiKGKqfW5/+CGYerefgsrsfs8HtBKZ
	oKqVg9si36x9J8TOSw64hyXhcEQSksWW+z0o41e7ds9zIsmNkPpD65Fo+NPinisV
	rDGLmHe1RSKmEkscUE+9xd76obBTe7vKYXktvOLh/chxncvmdwG1rxtF76sTvi7K
	FnKV3W4rRgG5WnHCmh0nHhxqnLKMiuc+647hv9V4zXvbCgGqpcWRmHwLE0Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfea2w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:10:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a08903566dso2976738b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635811; x=1794240611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1G25hLX5Ki186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=;
        b=Ppff7d5Ni9FpYVTU68JaX1rQ/KZFliTRS2VCAlmEfLLqxz50OvY/dSgeXZx10Jyk1C
         zADS4lGdfO5hTRmc/bdw6+M8GBp68iPPk2irHEq7rmK4xXC6KvBR/9o38I5lFX9qJkU7
         /pTVVXFyVy/qEj4CWHBIxM22ntpuvIIzIJiiDAPrfTqc0b9xobqaKpWt9JWDELZbpvZE
         2APNOEaF4Ba1zpzyM6Uy1uE3uvqnwINAJc5xra4/1LrHHu37e6ENDOkfYAdCXKYlMEEW
         o4GUjaweA6a2M/ETPMxX8IXhttuGeDBkokERAOFZQQ2Ac5QctTvqNddPgBGdI43i6x7f
         uu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635811; x=1794240611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K1G25hLX5Ki186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=;
        b=r7vgYbhzY+v1MdTqBfy8oAq8n0BmuD97ravQ3gj9bdOgcqtZedrllJYpJswNiCLfwp
         zBBVlJIq5WCIr6dIR+jPhOpC/I2oY3PZRacECwFazp4Ikmd5vIJ2+2cfKAo/wCb1myZJ
         Yr9ypts3Fs4iT8TOIDEWJ3LYSYZEQS4a3aHcyU5Rk36hnAHFcakdWz0zrUx6ICjv4dDK
         949bApReXl0nrMgZ18RWAqFdq7+ZzRfys/0pM3URfWchq9/HuHIob7Ts8UX9zPfBRmDL
         BFd2vO9DFaB9TwUO//+qf7SQM/4mRIXhfNK8U6d8UzTzXwcHenN0RO3N//e4zj9nHQhN
         wz9g==
X-Forwarded-Encrypted: i=1; AKwUvByJxi7DYYuc3cydYU4huwmGZz/TyiOwuCSpFjlpvsh9l8OI7Zvn+0R3eFTpD8tEe3F9nZ3e97A/0kSyIS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJju1v3vRX0ZuAQeRxH+vB0hPGRq/fd3pTIpAnO9odfiLEG6l6E
	gTQtyNUV2LqmdNAVXjKrdSmSHWCnvB2ZpDpiEv/jfvFJ7//oF9xHnRqOJmmdOQQq0kNGJIXxPha
	DEbbNTWsy018MZkCXX9Q5M+fygZMJJU+m/4M+LpN7LR2JUuGBzLRmcEdiClY5egL4ZPg=
X-Gm-Gg: AYBFou2M13tI4SHZDmeIBT5hmDW1B7TknDAi6GimX7E3SEex+Z184vLmIu7DznBaO22
	KElV4WME5YKZnkewVPXct0ThYp/0K6zgUGjeLScF9IM6QCeynmSrWRjBYQMisqRqzPQL5GX5edi
	XTTzREda3BksrNIhjUT3dHHLeV5F0OpRLlsNT3KYdKgZlIiHperapN2ypPmBjevsEbRSerKIfPE
	beU5ghHAH1MIR+4pe1Ej+waySrCN7PmsPxqnvFocQmVERDzLxO2mhbKUuAby4VI7+uEwlHVpw3t
	QgKyNr1Q412/tEdXVQR0WSwIH0yEITlmY6L8cZ0+e5lGhNqM0BaYml6NzH4lRCnAOGGhh7KOEeA
	fW0skFL0ob5fZf07xIeajER1PeNrrHY566sbJcrB+KY96QhMtt+repZkK7XclsIZ/b9jwjQvJqM
	hJ+Pl8XccgLCjbKyEjNjfQeA8=
X-Received: by 2002:a05:6a20:7351:b0:3e2:28f0:b360 with SMTP id adf61e73a8af0-3e913590580mr9379210637.0.1793635811191;
        Mon, 02 Nov 2026 08:10:11 -0800 (PST)
X-Received: by 2002:a05:6a20:7351:b0:3e2:28f0:b360 with SMTP id adf61e73a8af0-3e913590580mr9379200637.0.1793635810795;
        Mon, 02 Nov 2026 08:10:10 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364902dasm57218a12.20.2026.11.02.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:10 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm/gem: Decrement loop idx if handle lookup fails
Date: Mon,  2 Nov 2026 08:10:01 -0800
Message-ID: <20261102161002.497152-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
References: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8b5e3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX82nW+H5O7ndt
 6qG9CvoC/C/w+p46j1bZH4sn5+U3gZXQPJ5/5S04Jt86uXSpeSOrpi1mp3k7nC8jBOKoBL5l1RM
 c3aMMZbm0IovxGm7Zb4fSxuV0g/JaeEX+azrYhRvLusGA3o+yaY88mX3N8O2Kt1YJC50MWZ+vzC
 04XCAhxJMFgllIM2dfO6/1gdlbR6qKVNOmW+9VxBtDWfkSXPq84Xeu1fHZGefaUXJnkIDJLKMV0
 5jdy8mdmA9vdJlif4jaax8pQXDf9WtDELp7W4SIcqq9mah09mPEydpj1oDZjSDlDn4CVQUqQrJo
 vP07J4ZK7jr4pyiArq8e98VvVZmTYNIc3bEm5Z44hfX+un+WaRXdhKLDk1M8hYayJKh324PTzTX
 sLCH8ueMKC04rHQxSefYUMuPOgxl9H9PYBv9U2rk3j+xen2mwytNKRunVv/yPPbKr9hjVLvLNmu
 29aMDPE1WbI4IyVWogg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX8C5HJLB5XlY0
 rwWAAkRybuY6jNraI9M6shNE5w17ADd4JYt1XF7NIJC9V2gZr5bWjxlQnVx9ghic72eDO3oZg+W
 tszDxEN/jLZ9yIK3T4vFAG5e7mZuL5M=
X-Proofpoint-ORIG-GUID: s-MhfSbNHxYaM7kC-_iR-1BUvOQQ1i7H
X-Proofpoint-GUID: s-MhfSbNHxYaM7kC-_iR-1BUvOQQ1i7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020064

In the out_unlock unlock loop, we should skip the op which still has the
gem handle instead of gem obj ptr.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 922285537dee..4413db0644a2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1110,6 +1110,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		obj = idr_find(&file->object_idr, op->handle);
 		if (!obj) {
 			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
+			i--;
 			goto out_unlock;
 		}
 
-- 
2.56.0

