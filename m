Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834846;
	b=5WxtOM39cGLdX5ih67DXNY9lvj3ElZQgifLKW+NNnIuklqqeo5n6uSETuv89T3r0kZS5
	 DBOWBLrxg9Krwfvarh2AFf91BC1U2Z2DRpGIBW6tBghO1jy6dgggX6uhxiT4bFR6Oq/rO
	 Rqq36xCHHt2I0Fw/YWIu0TfDhLmlEtlSOv/VuIB4f6Q8TvcyN+v0mpZeKu34Fajk5lpam
	 YSWZn1y8xhfhwidauzc8Suq7jjC3sEwaqpq/mpafiw7IFYV4gc+F5nsUiOjsR9f8oXDlk
	 EB9ddo5V3b+gkDmboKVlkn0oPJYSbpntmfRYdkujMmw9oJGqQb3npCDQf7KNtHD7dXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
	b=coivvcRi+H68iUV4WuEzrdjM7434M9E3PO0m2zi0oU1iziGNcSmPcRU/CKP5xsn5WGDh
	 1Ib8kYdLLRm86GtLlIrcaSLF9X9vTOTbkJr8qUWikEsDfzToR2CZwt4hobbCld0s0a6jw
	 kamTtf8c5lGLkStB7y40PJPzaemE+sWh6hbDZuUksryWnlmlKDATfUWkGsrgy+4VRjt6j
	 C+gjENSBZt/LyIOxxcHYFAYf3d0tzzxo8FPobDdxJNmBsGXE9aPZ2WdF9lQ+8eWrQ7FMX
	 F5HUzGhhKBQvJLB9ndijq7Yppqs1qm81ZcIqWdUbcfmWkYrPO8z/8qnTIIHTw1brOnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbJGQHch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3Z6gIhi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D0606A336
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C82D0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbJGQHch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3Z6gIhi
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o2Mu2217146
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pd4mEHoCoIS
	2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=; b=UbJGQHch/Jkcy4/t23CmRiCK2Ac
	SSpuxv9XNcoBWBo7US9DhAM1m8RIGyb+a7zYKoZ52Z1VGEgm9MKMmEr3OlGkQ6fg
	Rvy0SnSDdMbj4KRbt8ao2jCy/PhGVEAHCD3t4Po+oOoU0eH7pX3GAXx7L17uxGSX
	fNhIVBc76cfuSYw4OINvIyxiKI9RifKLzM2h2GMrOqh2g3jv2NjRmNInhLVPEDxM
	ZlWns0GrxwuWnVjzyhKQlwdk0ennMJJOmhOvpZlTQVX4J17My+eB7stITF/WHfjt
	ioPUT/abCck/Ak4WQTkhVkW5vNQCF1c1dAIiipRihxdK5e7vSEgZZhf9p+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgry7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535066512b0so21359071cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834844; x=1793439644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
        b=T3Z6gIhikalRKvDpEg0mKZEonTRfPsXKJaT8McKP/bZZRFXjJK/DDbkhYBI0OMyM+V
         IXLvAU6RTkfGM5Gx6xu2N4Vb6L1M3xu9m0wT9I3QTq675CM0l2sEBF5pYtHBl6+NM4uD
         MhC5gQiwIkKrBJxdjGCKQ3URkZhQj1uySx9NeokrHiEjZVRPkwl/eYaZ6eAkGg6OAySv
         STpCC+iHaqbK+BldOopGl3t3u4HUMkcD6oQQXJvFgXuAHkdX4/JcSa7ho6/gjItx64t9
         d+06qBORRiohGVT1Zqs6ogLLUzDSkn7br4Pw2Rrv5O5cFHENQr+ro8gpUHg9tXRkWDbs
         Oddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834844; x=1793439644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
        b=Eb7XzpDv+1TWkdtKZnPA4NXvY5oh3c6HUGhPvoOMCCobDk5pQKxg0wIi/O06WuPyH/
         sceD/qJj9dZyo/4lIanbLUDPXOoeF8o/QAm6sI0+Ro13BMZ3NAOTKP3j9hilYsR+z4cS
         Yewz4Oz53QpTc9IgWYhJirW8dF1mfek6J5FnA+zvGMp5XaEp7or8yL8iQS2odIFl67V3
         dwekLX1PrVn3lbJbuZLyW/dZaMW2M+GqY9yzI4m8C3HmgKDtQRfAJZLrI33FbsdvMFeC
         wK1g71gUI38WW31GfJ5JnGk+oi5Y1LVHK5A3eVOYonwO1Vdxsh1Sd7Gph7ac7HGwcTAo
         J0lg==
X-Forwarded-Encrypted: i=1; AKwUvBzujEKhVE37WGzmpu99P15KuS+vKtfMltgjjgfFbsw/nCoD3LftoNvLSz+PYOG1l5ubsLcrvXXwQk79UKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcFVWbiWBe5s6sFpqHvwRZMQOkNCD8Olq+IFRZ1YoDTNPhXSRs
	vT/S6xkT4Lphu7t6vzBYR99sU4cvvUUCKY3E5SWyt4YSYnemElx697nZxDDrNXAkkGcCdB3kNrZ
	M9mwmjBfv4QIzV0rIBE7Xq5NaoCC37DmGlpmvz2cGCG2Kjm3TvTs+uINaZnxYBdPnq9s=
X-Gm-Gg: AYBFou3mE1UC0mXMZmmWblAlSke3xRRxNf3tyAVehAAUQZCCU5LmXwQ3u5RVyfBotof
	kp4Ce6yo9TNTa1kPdrHPu4tlpZA+AmLcv17k4+J6YriLE2lYrbL1rz26IDUgV5QUt5tdw49WDRN
	BnXYhFjLZRJo2f0iHAo2sNSiPOkmP6Wi/cggHkVFkasgGdm0Pajo+dGe0N2JxzL1N2nkjKGPc+I
	B6Ekfb4qe26Z0wFfuyb98LDDAx6GJGjrBLUyMDAoAeWIkgPrfblCgbsMBew/SBha0bBw1KIXi4y
	2JfoysCaIC9tFcJ2B0/SEW/twfzWOK29df5EBGKXOjJkOW1pdt+0Kzw4zZ9HicYy0lD8gbW70at
	efTuWbnBUUd9DtCykfuKtflZh
X-Received: by 2002:a05:620a:2b4e:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-940ef9457c0mr190202785a.65.1792834844176;
        Sat, 24 Oct 2026 02:40:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-940ef9457c0mr190201385a.65.1792834843748;
        Sat, 24 Oct 2026 02:40:43 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:42 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Sat, 24 Oct 2026 12:40:26 +0300
Message-Id: <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX5lT7CHIj0ST3
 n1I9ybaBvGTa6Jr0krNHUisSKoOCLQfEIShhBNN5Oy6xlrZBYcQlXLxiLD9xWKzXxvuo2HVmpoC
 YdzsZPNBwVxdGpEM+z/6YY/raYCIu20=
X-Proofpoint-GUID: 5wh_7nSwXHYI6y_g_OLgmHjw5rjcxaue
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6adc7d1d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=XspRBnjjJwGwxb89TBgA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX9iqRw+GofLR3
 aSuX8Wz24SFHLrTvqQIY8WBQrTpAVThoadUGLaqPqsi5Oa0ZnrKcavmycem750LOWTtx15jCZ8L
 QPwJ5nmmvENDfTIqlY/P79DPPuSDr1YUVlfHEFJf3jdycSQNRhmi1xKm+w+zTGSkohzH008bCIf
 vcTWEskfDubWaYh+CQKhFUOL7KPRIZ0BkUwlvCpDgyL9i1fAZRJLx3CLfEnVTj8liQii1HV3XZJ
 mKSn3EyTNqu3PZMGkYYvosNt2w04B+DiDtYqRT+DWyTAjK5fQGhyi4pSUWXEFJOVFcYXYyzdyki
 r1CdOrGlTr6TUU287SDWisdXwYRBCgd2kwjmQBKg+ij8alHw2if3hbgKmfZBCS4HZ9G+PQYjYwd
 aDZo4TgaVR7oVrTeo5tPFOWdoiIIltEpQiyXfOT3XERVBZGHFQuIrKcX7qaCB3wca79Pw1Q4B7C
 Vwh1rxJB692kGAd90RA==
X-Proofpoint-ORIG-GUID: 5wh_7nSwXHYI6y_g_OLgmHjw5rjcxaue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
in both the VFE and the CSID resources. The VFE only enables it, as
vfe_match_clock_names() does not match the AREG clock name, so its rate
is set by the CSID, which always selects the lowest one.

Match the VFE AREG clock in vfe_match_clock_names(), so that the VFE
selects its rate from the pixel rate of its lines like for its other
clocks, and drop its levels from the CSID resources. The AREG clocks of
VFE0 and VFE1 share the fast AHB source, which then runs at the highest
rate requested by the two VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +++
 drivers/media/platform/qcom/camss/camss.c     | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 614497235eb4..948f0e12d542 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 68b43a720869..100612d97fa7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
-- 
2.34.1

