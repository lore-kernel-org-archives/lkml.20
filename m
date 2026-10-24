Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837833;
	b=d9fIUoam2wRNvMLlEYECUpqmazIvr/rTHsUw05HKoNdZRSbIvGwSQtrqrg7MRUMCcmY7
	 98YdCDnmeCFLNaNnc0Bi5BIta1FjyPcwxBi9Ex2MMWJ6V/1jiOEfqP5yEUHwCaI8ZygYS
	 hjYI1NWEN/M7tm/tDqBGgbSo8V42r9eFV2d8U8WtV/FMm6tLmak6z2gH0wZ9YdnzIUsum
	 Nk9/N8jBdxrA8dM6p3djMtL/uC/o+GPc1ijoZt4t/wIC2WuN1Epy8KozvE+6MI/L45nxf
	 hpxJDMzSnfIdXIgbD8JLgEJx+IHbSaVsX355/sa5mk9umLBU1KtOYiGgBX9SkqJunGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=;
	b=Dh42ih3gBP8QrZI4bji/L385Vz9CvRnCXivLoBhcwGuMmvesZRA8FSQe8ZetmXCD6fXT
	 0dWp2rtvREyz05w7rSkXzRcM+QcKK49URFilnRqI8kdI3HRsFIYV66mb1LY5c8pzPLHLE
	 CPt1n7dhWGed/i7AA5JeafyZEpVIp3kk8nMD+pA6VJSxohKkfM8aUahEf9IZ8frkhII5+
	 3WIt1nJ33CL1y8kUBxqVifJmBWl0FQQXtaNv1jgwgG504wxnrMU0RtS1B9rTj/9FIbGo5
	 J7XbaAyjtuYCZxPuS9FYaPf199nMXhWFqkpPJLe1KoDVblhEl9ddrKUPUf3N3pk0iWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hulvCuGj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G6KdLDTJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B6606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hulvCuGj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G6KdLDTJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8ojV92218331
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=; b=hulvCuGjbJz7dhCV
	NKTJ4uLEBNyHu6nmZ7t/Ra617NjmCzM0qLJIjbK8tXsjE7VqNY/4SjGCDLvWT2kk
	ljOTO5iVNYyKEfPpl/Ba3hB9gCc+5KHsY07aFKoENc6fdd4+haPYjHLvI1Kj7Myl
	ziuuSLZFlvYpQiX5F11XSxIqfQeFhmxw553lHHOie1veXSZCMBgUvrl/wwS0qlSh
	OEdx3qX4z4a/IQVrdrCODbkWM9DOZvdbdL2O++5oOjBBi6ysTe6N00fHyYPsF+Tq
	SFk1uabfQcfCo1bkbOQpLc8i50zHfXWLh+Ra8Yy/oCqRieOJbHB7GsVZHPnuxOef
	ucbACQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgs1nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so1364329eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837831; x=1793442631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=;
        b=G6KdLDTJWQ6wNnNnz9Uc9P+aaG/LOg1Upj+vbV7RaVEXWicWiFTzjSPNR/HrwD0WCj
         eJEeDwMMxZS3JlkmjU8e3E8alGzn3D8iAqIje7104Wj0Hg02/FRtEfZj0Q6PsU3a1wRI
         mkIFtVQ76racTegw/NTJTWah+bJ3ELPP3naeACA7jgKw5zHP2Mm5JaH7lhE6K67s8s2R
         EkZv3o/NZ96UrMjvJbgfhg8FAcP/6q0uBYtWcXb273OSlDfv9THDcDOcYn/yKGy2VIiw
         rAhlesoX/if+5iwtKNggDxPnDmh5VFbtw6Tm8L6yvyOkbXby+hKM4HjjSeriB3xthK6/
         QFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837831; x=1793442631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=;
        b=EIhWGZLGgnUY2lHv1YXpR+1hNjMplM5C9TNaR8rZjErcE9KXlxdR2xRXrCyW4fHhUe
         xUYTfzvcSIjiZSgiIuelxshJF82nXZaMlmAPZ6MHJWDA9UnboD6Em8mPuUfpg4Mf2lCp
         Rs+VQrEphxRJ6X06/adgKyhIExO8lPnP7giy1JwnX5mfVrQXmPeeN7nhbYaWtBtFrWqE
         x057JWgQW6xO7XU3WCYzqLqUQ6YK2HUoPVLGOE1LhXLN7CNPuxhewKIVUOAk5dmWNwZo
         XeaIzSOIiGMcrdQXScD9mjf3ZG8JgjqTcAyh1ERL17kjbfH9Xs4NcO1SZ3fcpLH+jv3g
         Q83g==
X-Forwarded-Encrypted: i=1; AKwUvBwSa91NofWt4D7CPlOBZMrlZhocOclTOvgdC2yrWUaYM08RCznwugArnxbtD2agngijHQBvX0LnmjG/q7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk1k9e8HNo4aCDHrM5zuTfc/jdBhHAARdDZcd78WFkSbavlsLS
	SpYI2yuPgRm1kA9dl6w0gHK/ftx3LKFudaQRlxcP0hIdOodXNkYvXpNeHXcdHAPRCS1XDLYVHMS
	nPTQAk9amqdCpDZyYw0giwn6ebCiCmTOPx/8kfx+e8YR6eR3EAdZzzXAZXF23xLXQWz0=
X-Gm-Gg: AYBFou3EYAi9hcp+XANSEnSQ4El6qEV/ozaeo+GeRaXkJPbIKt6lCG4LU/tSVZxh2ko
	BZ1r9yFHuLtNNAaLRGF6N/6brStdPuP30UizLZzCvM1dlERSABWiRpLn/FveXm8IKyWdfg0Xfc/
	M1qzPwyl7Y+1b0xiYXRkJEkXnj4+7ttuXP/P+VKKHrL2V5Rf+tjZUjie172uztkbqqXT4PcBsjq
	AdZteGZGqBHHBOWg9YaPZ00AHbYDoDTVipeg4g1OY8JHbwi5ltpOHxT2JQMCdPPW12jzisPVdqd
	gxSP7MBHhjb8x1kwmO5jHB6Jk5M+wuFRR55Ce5D4bj2/WLO2FRnD1QfLIRlQbWcqHKlLDWr7y36
	kqpFtOSJFnJiLPMXuRfp3pZA=
X-Received: by 2002:a05:7022:5f04:b0:15b:1959:15e0 with SMTP id a92af1059eb24-199344ccc36mr2134262c88.4.1792837830622;
        Sat, 24 Oct 2026 03:30:30 -0700 (PDT)
X-Received: by 2002:a05:7022:5f04:b0:15b:1959:15e0 with SMTP id a92af1059eb24-199344ccc36mr2134207c88.4.1792837830034;
        Sat, 24 Oct 2026 03:30:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:07 +0530
Subject: [PATCH 1/8] drm/msm/a6xx: Check BX dependency vote index
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
Message-Id: <20261024-assorted-fixes-oct-v1-1-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=1147;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OZgbZXRHjUVB0GyiAJm80VqQFl7KVDIkYEEZVJ4qf6U=;
 b=TZ+QZM18swWiIyEvnvhoEsmwG62YMBd4y5BPM3aJPn5Qe55JxWuo4bjV5cDhPB2ekv9NOHM2/
 ueliz1/ELAzBSCzQcN+6erugr+JWjcoqmwQ6oKnDzetS6RrPHB53BQy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX3mllc1txVX+n
 77dLw0HHmbcWR+FPmI59d5TaQ5tey07e1iGmAV8RCjlM5GgMlLeCWIkddPETxzNpKkPGxON5RGg
 rCYPrd04s0bNFD+xd9rS6GklxsrVJoE=
X-Proofpoint-GUID: bGPc3v1E-hKElytowe-GvknJ_eKeMMPr
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6adc88c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=UiV5_Nx6FN_ZUZKxJi4A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX67mJNCLjupK4
 ijiEMd47BLv4MM8jd70pMmGZCMDajgnRYFyDVmE0jTD4z+HZhtVrfjNOOoncaYWKbzkLONQouJL
 sSd3vnUktk8D9pAGgzGhJBlup5KDgc3UVY6mdzPZgj2xJjcySZqksYxqT85lIYEele4Ql3A1YiI
 ILa3W6CKopCy0ka2yvKzNCWttUpoGDCu3JdaAbZbGL6OHl87FSIyOKJtrIviaidqj+664d9hf/s
 BV7ogQ2GeI8/6tREoMD6Yykf6ykUWTI/BotQ7D8cJtHTzxsXZ6JyzlFTnYByGwEsHDwZw+cb3RX
 oOjd7fdl0f2dAGXMrEOOalNhfocT0Alzb7RyBLBs7628UJVQ/HXVJ/FEMNpXE6VjfD2u2hj2x06
 b3Wi1MK4bcvF+jrwHIN59AWQlAXr8wOTrHVKuuo54seUf3Okf485chy0eApPFM8cL52H6YXbquq
 iv7Skt+ZHKpCu2yfM0Q==
X-Proofpoint-ORIG-GUID: bGPc3v1E-hKElytowe-GvknJ_eKeMMPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

a6xx_gmu_rpmh_arc_index() returns a signed error value. Check the result
before passing it to FIELD_MODIFY(), which rejects a compiler-propagated
negative value as too large for the field.

Fixes: 020b8eaa1db8 ("drm/msm/a6xx: Add BX rail support to GMU dependency votes")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610070334.bYvBJSpj-lkp@intel.com/
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..9e02d6f939af 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1867,6 +1867,9 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 		 * back to the highest BX corner if none is high enough.
 		 */
 		bx = a6xx_gmu_rpmh_arc_index(dev, gbx, gbx_count, gx[index], true);
+		if (bx < 0)
+			return bx;
+
 		FIELD_MODIFY(GMU_BX_MASK, &votes[i], bx);
 	}
 

-- 
2.55.0

