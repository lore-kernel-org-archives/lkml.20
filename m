Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797963;
	b=TC7NXDNTW6D1o5SjNrwccI8I7FMyh04V1PSk3Us9JXYm3eTb+Z2oiukIXXaqmDewicuv
	 +rr4jTQZJSWjTaXKhamOe0i6RufF94rGk/e6DBnr2Rt90xJJmhe2+pQFEe/U09M1DNziA
	 8fwvzIE+YPQ/d0LffU6wINnvMzqE3vDD3TVYNJXpFwYMyQnJt6nqn5kQUDrUC7KZ9xf7x
	 rnrtZs3P19uiDurRHcQnFc65HlfDew2+0GYrgC6uNxVtG2YDRDePJqQh2+FR2uPPaUIQH
	 pgtZ/+rKoRMzflgVUlttAlDNvD7MslcInXFeP4W1oKOzdyF8QPisobfjBYRgy8CIAdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=;
	b=zjJ8iWmhKUdo5WzlDGQo9ugafBhdZEBLqMNjzSQoxMN4Jpz9Gw+Aq65fFvlmrJdpg+50
	 9NPt494VR+UYhUXlClRma+TlJ9Jfo4Ar/qF2RUFbQ14911JS0h+Ngbi8r97flA3OXCMNC
	 r/zQO8JM/3L53RopjM9nUnswIpP5P1OCcoXyyOGz4dJ+0rt/EqkbrqfyWaHmx+acTSHOC
	 ve8w3BJrR0b4Qw5Rcnx1hPDufYG8RaPLu2oaDQEZ9ngHGZ1IkiUtbvLNw7mk24vkYxrPj
	 bKmcI2RgHfLGaCb/J4SMZc2+q1WGYy3SRQ/rx4H7Q+fzIaZl6VjF6cg3BiD474l7ZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tf8SYeTQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O29SumbX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB21606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB21606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tf8SYeTQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O29SumbX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvSfo2964014
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=; b=Tf8SYeTQdKU/p1x9
	LUs2p0qlQ8PHEy4xAaf6997i6QkTGmNoIcnsOujVth0yszkij+32PGdB/q6ujVRI
	4Ffsn0/tGNlCw0T2aDzasCOBZNO9OEUm//P+/nxoRozNR1tj0bWI/mAg1otfAGuX
	Rt1bYgTK6bX+LJHoFZw9Z8Ottqt4oMa+wvQsT2F+Hd3Ulv4KimGxGiroACIN4BPt
	uPs3foOFQ0P19MgvK4h/gEVMgit6zoS+M7iGZIQh/VHzU8TD0pDcYlb+3udq6rEN
	Pd42N9R4OYymE4N9w3BllRf/GPt6UYysWgyuQNj7BCEl0Zg7lINTwGl9bhYyaN1J
	3Q9+OQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc9cqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:26:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so94990185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797961; x=1793402761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=;
        b=O29SumbXjCZFUj6sKK+EZ+IFeI/Lmieu3wKWMZsXpM6w3BJNixVXaexHWpisfH6S0h
         2eElJggX+DJ9tt1cAsFpfibaZ3rsPHmZEUJC0LHz62GGmKt+upMRqJiURxBYGpFgrVu4
         TCzQw1Y8RiqBLU5CtSCOUSGHR2ZUv7vylEhbOPZCn3M7jR3I1jh1Jl6PLK7xzSFsGMPg
         N7CjNtQDxqpv5LMAp6KNqGs0NG7xz4Bz5bZzL2XemKmyP6uiIXhxtvMgLGEMuUJH3hBc
         /3m7MhSxE0W8rbmIUiAldZwpWcsypiayfjUlcDEB93/XIEI8AwtFIjRkASumXcyL3/b6
         MmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797961; x=1793402761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=;
        b=feMAc2S1hYFwsfqbFAWjWGZ+xtVOEAp2171rNvxzoAdmGSU4Fd6swmchcYYz2dliw4
         kD4UViuKev5Mu+bB07DAHkXPK6pIy6S5q1i3p9JB/IM4D2iIbVlC0W/ST/2yRm/SahFN
         wWvFLE06U4QuEDb0AcYNjeSxEYxH3LMENtgahFwzPxg04doJgLCzT3mdftPHyjXF4z63
         WUxbvo1AnIfaqy5CFWmNg4MumDoyeqEqKCynvZ8oFQys23kGUEHRg77g3HtNzDb83ulm
         OOAsLtFYQvGEDaGy6s6Rqrxb/1wFYLZmvyMxs8a+jPKVihelaKPsDV7MfP8HuzzAI3Lp
         dDvw==
X-Forwarded-Encrypted: i=1; AKwUvBz1RXSkbFRkM8FVmxrqf3n7ip7Yg+v86ynvyohg0GsbkbVyH7dGJlQhsk1vTkcdKaIaGGZDruWk1TDlNjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtS6VU74TUrG6nsguIuOGvcOkp3YzlwsqQhUmOcd+RtasGj0sH
	KfnVd+2mkY6fVdjlRNtKI+wwCxlJWXniKF6OUI+S6z2Ep+PsA6oZ2r37aqEdceWlGkr7POBfWlF
	EN9t6jASVV8T4xoqvnQwCK7vzNtlWqJsIiOLyLm8Nvz047ZghLu9qp20UwMPAA+36yo4=
X-Gm-Gg: AYBFou1eA5Bh2lVd0YTkh43XwmzIietZHDhn2SJmHIfgp0Vor5MA0bvoFDu8Lci+hXe
	ON0TsPV9RFhJjZg2uyl1oF3HRoNhKbQSVz6Hzg5UZ10isMRBm5DPPniyPGOMPmoq4bvoGT3Ufh4
	rHbZ9h0XzMWEZ7zGjqIswtoRleB+mE/iRibsIPnoyvVxvKlEUN84lrI824PchHg9wumLedLD+Ug
	ztcLVVe3j/MI4NZSfbv88VswdHjTZvm5O/2BKqCn3/Hv1EdhcjZPWstxoaUwxUpPu0Q4jUkSA0l
	fFMMpPK9XXKO9ibxmViijIGK43w6gl7A4ERLti3JYf7JQ75iCI8olJENzpDD2uxQha2TszLPQ9j
	7fQTAylV86iWYPnjGGkh/oMsNbCVPvG+5/UYIxrgp8Wp53VUv7HgtXXXWqjnsGQxLaRCCvC/n4g
	pQF8dY9JX6Em0n
X-Received: by 2002:a05:620a:3726:b0:93e:fa30:f1da with SMTP id af79cd13be357-940ef8f3bfemr86922085a.45.1792797960628;
        Fri, 23 Oct 2026 16:26:00 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:93e:fa30:f1da with SMTP id af79cd13be357-940ef8f3bfemr86916785a.45.1792797960036;
        Fri, 23 Oct 2026 16:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:31 +0300
Subject: [PATCH v5 10/10] drm/ci: mark pixel-format tests as passing on
 SC7180
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-10-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=clQthlwXzRhi1W3zRpYrUTaCyBOJES7iCNAqF5m45Zo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+ztkv4NiwBFqBCDxxLRw9rvtynMFjCU0KE3s
 6VAiCiEaU6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs7QAKCRCLPIo+Aiko
 1dW8B/0bQcLFlB+5tLCLM9nYzJOPpsrZrQa9AsHn+vKjiIP2KxVZXJA/E8U3lyX0K4fD88A71Ne
 E9kRm0YSh0tOXWaewb+RZVtlzQb+1JypXYhNReacBAJFlZkklzs3jQPmLMqLuewfqbGIE0Dq5zO
 5jD/So3gHPJMKFmtjYDLbqpWOHHrlEtSvFs6OcWGiifutSPM02wZruZqmfopiC8AiLblKgJTyAM
 NAw9KO/zXitLx+OgUc3xwjMgDqBqsRXwdri111IDa06lNlsqqHsqWniYGjZK75sDpxh4XbKdqZY
 xOH2m7GELqW5Zp9CC2+a6rJqXBtawww6aoJC2OtivEv1B2f5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX7dk37sSu0F5I
 D+23e1pco6c20g8dW6KSrcGqIGUKktPd3F1jGNhnucStcGJDVtK1DugHz+SbEDbxyTKJ+btuE2r
 G8J6BscwfL1MFzF5xApJwJNHAqAOjYDljctTSB2Uw6v0KbYD9lFG1t69kkx8lFmEKZurVPjgFU3
 VvOcp1MDEL63J5UsjMoyJgAdalwa5aNBvSylweCUDk7V66dxoFX+0PBdBQpBTBZWS9F/FcCcpku
 ZbCQjNPBYzTG0vpY78RQlSXnso39MU1vrp8OMrVyjehVS7EDaVFfxIJKLhhkAsO4dCsG/nuTQvu
 6uKrXxbGV2N8/vVbrX3mwZ8X2bbjtQDie9oED5jfh/leyn2PVTwJl2YuFrAnHrTGUyaKXV6W/cz
 tq4SmZV7RUHjg+9moJ9djl+B86M3+m8SS++CPVTASuErAxjL1OWgeFuv18MPbTF30twXebIWHXj
 K09EfPzjnX4os0GTMiQ==
X-Proofpoint-GUID: E7NFbQGulM5iyo61CfdWwRYj23bhXWBy
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adbed09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fLdCUpYKHvtX-iCVteYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: E7NFbQGulM5iyo61CfdWwRYj23bhXWBy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX9D6Dt1g2bJTk
 Ei6cDQKZI1ixCcMRrmB0q06i8ONVXcIZNJiZFChKCNsfGjIokpa8/bdmZ5qJF14TvyrYqr8siV2
 /98ON9gvjaxFaGfELtSyBDydIpvGWfI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

kms_plane@pixel-format and kms_plane@pixel-format-source-clamping timed out
waiting for the first CRC once the test had set a legacy gamma LUT.  They
pass since "drm/msm/dpu: only reassign resources when the encoder is
reprogrammed", so drop them from the expected failures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail

-- 
2.47.3

