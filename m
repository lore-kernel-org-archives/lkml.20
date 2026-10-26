Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021855;
	b=tsGTKpMhT0PivqViM5luTcMMhpyXwGYrrxiyFixWy3Ct+u0B6zRfOM/rMCMt+Rx0v935
	 NeLhbkV9b4F1iTD6KAfbVoqia/anPbsMh/uqewtNSFWBoVxXbfkT1a7+qUC75hwRToH2n
	 S8lFXGhQ/gvYdr8udoBkfh4CBU6YD3x3UbyxS92j4P6Dyo2HQ7sFTC16cl4OwTye4mqlo
	 MpuyP0BvqLXlsBFcCE07dunzZ/PnkbKc5yPc0EfSRZWTv9lG8Tbn+74GxkFytO2vdRXNB
	 auDfBGdM1MMF5Lc+/A+jA7wbF4jiJ+Yzi6J996ZThWH2cQHzZ4ifbWbUSOEEfyfD0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
	b=bmPFRlh9D5frSTxSug+ACnio+7sPG8rzLn6XnHctdq1D2Z302TAM6QMQP+FG5XbTLiOq
	 I2a9kgeJTw+rg3W8VDpNSul94RNZwwyVdb3qAcDg4NrCijz2rWtbekIG2fyHNp6PVdmVV
	 iqzpFIjrxISmuDSDnr1nrzd/RHNu31+FU5Vy1/SMayYxd4XAwXC2BPLu7IQdHqDRu5Z28
	 P3hQU9fp7s5J7D+oSdrLXC0831J4n22F8X7PSur2Ia/yJRnDN0vIeL2din1Amb55ee6Dq
	 oUDMHvmXOykTHbgfkN42dpJA7Pe2AGzJKF8n1nQE4mGT2ND8nM7tCyHfC+HXsV+PM8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3k46n22;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvXfRc5z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0360A5BCA
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B0360A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3k46n22;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvXfRc5z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtRNf3348753
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wv4VOK5tSeL
	NeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=; b=h3k46n22ByleTTBjAatk5nHKhfn
	mSErQvjO2BJ1GLoMXmQGlmXh0YlMLpVyFxYVvjhPnlw68JorQGRuCR9imJcovWFl
	1MUQh99KoTxOyu0xznDLWKRO/G0c4JPqPoh/huhtyeMux0JE7NeIGZbzAtviJgVz
	2bMTb/BZnajRG2motYniDz1lgJ43z7kH4sR1e27es383SRQywNSmfHn03ONSpgYf
	uKoXCG2doEFrhyaU4srFmZJ6oj0kF6nsE940bcYtnSrMDMKJ7V+CCiEpLJBjvt3J
	gADx63Gpwq7pudHNZ13zmeZSymsSQ9NNxTyLUV3lLArFcf1xcKuIy5iT04A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xr5gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so606930585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021853; x=1793626653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=fvXfRc5z0sOFyFsUM6Vpo4k9ekEfk7ofOeWNPxYeifPyIRn8Zmyl9clwtEYz480Hdw
         1CSLpPvM4/1ydYmsd2svvxWwnnB9k4bPcPqWjLqladb2hyCkyt/iB2tnoJlO7yi6LBU6
         vmEUXhdEN8vRzDiD8tZ9NjtEo0849MP7NCkRYuJ6OrbGLHLXEoQagBPshulSVIgmxnIe
         weEId3f/f7scp+xT+KTRxbz1gAyUHaYbMY3komKpSpqnNcV64qEfpPDQ1PpbgOLZZCqv
         IPm3IWb0KrM+pWEB/JPs4871jXRTp9wlBAtkCg1+5NJ6hNHbL14jxfIf7T8z7jCMI+KL
         HlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021853; x=1793626653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=pCBukkvmRzwXNTOOf4UhWqjDEmfpCaS1Jk07gmEmuFI131iRvcVeRqVnPniIlN2n61
         oE0N9+RkBuWVghx2axFZAjwg6mgtB3DRu4MgHiNG3et625S8qUEFK5+90HTaEqtX+Sdq
         LfzjODYYa3C8MFO1aQKlkl+/Jv3WFf8HCmV5ib1KYGmmR8LWgmzSAEdwa/1GQC5rCXyU
         e9pM0OfB4KSum6U7wyHZdNncb250Nl32fjC3KUBRnnUVtk5xQASkT4drM7xWUxgq5TA1
         k/WKDB1V+4rRQWWEGoo0jQPwyk6c1plx0EDnQVNPV11mnHPyNfO9/uWJMFK+LkGfn0C0
         TO5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbwv1Pc4uy+T5FsZFIzQweGGcklbLjeNO/FRPIoYQ/hyVkakjMZJQC8MTBWcRfd1G4UXthu56E5VsnHvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTT93CdQijQajuNdj/sVVFLzeJa7ef9aAJ/cBba4hTVQyiLec/
	s56GbWI+8Xtyik2OFmfUEiT7bO5qklNArZnxadJJ5gNn8fNwe6V85aF5FXVM9AXpHk73r99YCpz
	Cvu17hiZpYSAQ2bHshA4ZzEjbF+7TIJZ1E9BfVMhrw7oYD/jki6e8ECuRID5Q397xNfmGhSgHU6
	iQog==
X-Gm-Gg: AYBFou2aQ5QftNT6PTw9SORMuS1AYqh+7wEIjqLAKu0/k+kZh1EnKdqDvk0VxsnKlAi
	+Aw7yeae7gHnEUhJ6b4hGS6ZsbqiIhTaOFpLCYvJ5pz3wUjnuoYuor1cnvWP4ryDdIxNo6kd72K
	lSX8tzyTtTgwicHwWrqnS++obFmdRVOwzkvD00ZG/N4OXmhMhNAlId54eQVa2snzEnGu6TmkIwZ
	ZFarClfgzkdx0FiPvW3aAuiBkZBnH/JrS01kY9qlj/8TTCEtNfSGD2VVJ0sJVzp8C1n4DX/Su1S
	FItFu0D86Jyhbw2nw2pxEOQ0to3hBQxvzXoWPCq/sirsGw4s9plyg3DY7UDrVNpTlimMiJqcI2O
	z97K39VzIbGmqodu1F8cEKwzt
X-Received: by 2002:a05:620a:6841:b0:93e:6e6a:b686 with SMTP id af79cd13be357-940ef999dfamr847560185a.29.1793021853121;
        Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6841:b0:93e:6e6a:b686 with SMTP id af79cd13be357-940ef999dfamr847556185a.29.1793021852652;
        Mon, 26 Oct 2026 06:37:32 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:31 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] media: qcom: camss: factor out the VFE minimum clock rate
Date: Mon, 26 Oct 2026 15:37:21 +0200
Message-Id: <20261026133726.3249235-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8pMxFa8XgnYFeEhlImRqqY2FtNg4votc
X-Proofpoint-GUID: 8pMxFa8XgnYFeEhlImRqqY2FtNg4votc
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf579e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=ezZDx3Tf6p_-T66H79UA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX18HcyXxpR4jp
 A/DSPLTRu9kXCohgl9MdpTjezCdanDfOE2Xi6zy58J1ARsMArSii1AHsJfom+zr8kuRLeihR+z9
 7SHvGoj96R1mNoZDzdRJrc1puxy4ol7nqsZlenu40TTDGekXQQCwA56opoT4kI95uFTUEEnSWgo
 QQYo6yM0vRT8AVuaYmRVQFysBrqEgltbH2yeypuQo5KRtY6qDi/cedMIayOSewHMafZab3mtWR9
 5wXKhW9+0MxsxwiXvdFF2Hor1sIxkmnzVYijdrCPfdL9ACWS0hT2F0+OQNq6F6/JFPr/fob2avx
 hMPPm5dfWyKjBc/g9rEzlIfL3nRbb8KJs/15BjP0er2Sz9J4DGnxL6LM8+Bg2DXB/nT39yWbzFm
 w4ytsHIdgLEN1ywFsIVYCiH6UYjElNK+nV6pyj2BMOOD5AIaf1IQ6XH4yCcBH2J4JK2aNP27ME5
 okfsoYTKlPJ2VWhi75Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX/IR+TtrgT7gZ
 jiADGoEmHCenkfv+V5TnINdAWFxbUxat+gnNfn2wrRvkMnDUE0j/5mecxsNVju39LoNwd/rUqh6
 RqvkFuh+rC71oQ31ZYVjRWmkkAY1eoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
minimum clock rate needed by the VFE lines from their pixel rates,
inside the loop over the VFE clocks. The result is the same for every
clock.

Move the computation into vfe_get_min_clock_rate() and call it once
per VFE, so that the clock loops only select and check rates. No
functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 108 ++++++++----------
 1 file changed, 46 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..59be37f83df3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -935,52 +935,66 @@ static bool vfe_check_clock_levels(struct camss_clock *clock)
 }
 
 /*
- * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * vfe_get_min_clock_rate - Get the minimum VFE clock rate for its lines
  * @vfe: VFE device
  *
- * Return 0 on success or a negative error code otherwise
+ * Return the highest rate needed by the VFE lines for their pixel rates,
+ * including the clock margin, or 0 if no pixel rate is available
  */
-static int vfe_set_clock_rates(struct vfe_device *vfe)
+static u64 vfe_get_min_clock_rate(struct vfe_device *vfe)
 {
-	struct device *dev = vfe->camss->dev;
 	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
+	u64 min_rate = 0;
+	int i;
 
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
+		if (camss_get_pixel_clock(&vfe->line[i].subdev.entity,
+					  &pixel_clock[i]))
 			pixel_clock[i] = 0;
 	}
 
-	for (i = 0; i < vfe->nclocks; i++) {
-		struct camss_clock *clock = &vfe->clock[i];
+	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
+		u32 tmp;
+		u8 bpp;
 
-		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
-			long rate;
+		if (i == VFE_LINE_PIX) {
+			tmp = pixel_clock[i];
+		} else {
+			struct vfe_line *l = &vfe->line[i];
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
+			bpp = camss_format_get_bpp(l->formats,
+						   l->nformats,
+						   l->fmt[MSM_VFE_PAD_SINK].code);
+			tmp = pixel_clock[i] * bpp / 64;
+		}
 
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
+		if (min_rate < tmp)
+			min_rate = tmp;
+	}
 
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
+	camss_add_clock_margin(&min_rate);
 
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
+	return min_rate;
+}
 
-			camss_add_clock_margin(&min_rate);
+/*
+ * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_set_clock_rates(struct vfe_device *vfe)
+{
+	struct device *dev = vfe->camss->dev;
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i, j;
+	int ret;
+
+	for (i = 0; i < vfe->nclocks; i++) {
+		struct camss_clock *clock = &vfe->clock[i];
+
+		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
+			long rate;
 
 			for (j = 0; j < clock->nfreqs; j++)
 				if (min_rate < clock->freq[j])
@@ -1024,45 +1038,15 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
  */
 static int vfe_check_clock_rates(struct vfe_device *vfe)
 {
-	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
-
-	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
-			pixel_clock[i] = 0;
-	}
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i;
 
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
 			unsigned long rate;
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
-
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
-
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
-
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
-
-			camss_add_clock_margin(&min_rate);
-
 			rate = clk_get_rate(clock->clk);
 			if (rate < min_rate)
 				return -EBUSY;
-- 
2.34.1

