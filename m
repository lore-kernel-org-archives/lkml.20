Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614750;
	b=5bB16r5nHczhOBjxSiiAxmCmKsFkR1mQpSHgEBiNuyp0KSb94lG3MoxQ29DjKiO1MpFG
	 Ql6BmF/4BVfVDoXL8gQin8JHhHcReOF0AQiB6ICOZLt7/krWXwamxk1LFbeYPDnD66Dca
	 Tu6iuPtSaZit8K1pT4hw3ovm0y/z3CdNJuNhgTTSiNtJhV9iZQ9pnDMLmVF23So9wo1Js
	 onafJepcX7/T7tulRIwFx8nAuBojg8OjahEMRtKokbU9TiZJSuvA7hAX66VpGR5TtpMgM
	 uDinw6aFL4oBzhEC41J4B6eQZu8hzf0Olfx97q9JhdrNZd1IEolPwjUxHHQyd2zgjNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=;
	b=r/5uGqcVc+IlAjwMz26BfL8J/fIW5AiDuxVjyI1s8siYMuH7wpWaIujXnwkS9MR18Mgt
	 Fn/X29BGepfH6hdxTBUwY25gH0gz/RhKMVNjJfnnlgSUKj+LdLMEBkDgPHsN71obr14tG
	 G0JvQNuxVDe2gkpWRSOUldjde3xvlzESq81Lx+AMy1i9R6V5JsZocZ/ArNtn4I67Zwbll
	 Si0e9vYxj8Z1zWTrTAmhB2IyF84LS8ohWFWe4TY+PnqNgu+x9vvFTCjlWFze5Xs3GiYj9
	 skko+rCgSk1rUu1PU6pO/5Qfw2VvGIUbk1tZnJnqp5LSslxgcPxsUniTu9N8dY72a1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSIKFOcV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFSUsd9f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21560A5BD4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A21560A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSIKFOcV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFSUsd9f
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMKf1821198
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=; b=LSIKFOcVDhUFhFMI
	n85hxlOArubogdlY8kBs7n2ySka0qSIx1AiPrh65og2URdLqVxH7hpi08NyqwJQI
	AFdOr5j3Cay1m4VOjAIdZEFjwzdsff3YdogJZVkCO8aNApQGxmq+jQBEwsidNJBO
	pEXQGJ7lgwy+RF0N8ACLLGdjyHyKIHMOz1lyMyLT27YersKaGvZv+o6MJb/6F+l8
	oHRg5QAi+SHBEWMlS07rGCuFh5xGn9ETDO3HqdILP5IOKJz2gdOZ49vv2HUHvv2F
	78FCyI0WciTfASgNK0TNbadnGacAmvXnCb7I90UezYUakN7y2ax78p6owJqgsdUk
	ItCArQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h6am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:19:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so571541885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614748; x=1794219548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=;
        b=FFSUsd9f/ddb1CXLDeWjIAA8GvtJNyh0J2ylXL+AJ+hLw+9KDnEY/nX+mAx5Qee1fk
         /zq0wOa/GUExUOP/zN7HpsjMeJT5+AHepPau8hQIuuZXoJByaZE7JGQoDzsBxkcDM0Gd
         BRQVU2R3r/iv+ahfcnYWYNPFvS4GJMH5xZ/BhkHdSVConbF2Sf8eE9w5sVH7kLQcrTyf
         jdN9vRQ4urV8QK3ryfN++dMaEzsrimTP8nr2jOP++hOPAcaK1AnFL8gK/g3bGM4Tv+Z5
         zO+ZdfjiCGoDdr9otu6NUDoTZAa6bVIjvq+CDq+IDM8GbA4K8em6LKUxTwuvhocyUoQS
         1nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614748; x=1794219548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=;
        b=JIcq8od+bBSTOQtua5p3wvrtbKaccL+AjuNuLacWK8J577eQda1Fyv9PjnNmJ6VBQN
         Vw/kPlgbyQLw/FQpt/u7K02mj7EMyXXZsfzdvjpwYuIPp/ZcMyZNgn3Lcix+bqIpQc6O
         iAXy8i4H/IOCm4/rpJQz81CjVQJmf+EQdz2wUd+3gvRyJmYTAdniImgs8IesS7gtMCpw
         ZWeQBv+l6zJZcoA8jwL2RnfIeObaHxX99V88eUb8K3M2zvzhf+qpX8i1KBZyZvcpqLqP
         /s2qhRAtjSQUl4HOc5o9iQddLkjTsr3dVSEiKHXUg/mIT9F28zM+PKBkpsDbmJSqRYeW
         KL0g==
X-Forwarded-Encrypted: i=1; AKwUvBy/65QwOav0n6VB7EzRUlZChsgto0qO/HKn+3qO5AjVxGPYyi+2Tv8QbtGydH6DkoAEGjr6iCQAkHN4QJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFzTtZMYryl493Xy8ZrdI+83B8XfXM9rndSckbH5hnL2rK0a8d
	xvqYhkSaueEKgEtH6LD8GTckRwjVPzdPpbdfToCg+H4jSBwqJeQZDfflKVnY9MC2q5J7eIjH9Ys
	NEyxHrUKmI4L6/ZuXe1H7+7gUG8180IGHZl7BWMieHcBhH2+nNtHprq7OLAeafOpmqr+qs4SxzA
	E=
X-Gm-Gg: AYBFou1q2icnRj+wdddrrZpjgEofrOpeGplHGeb7iyiehE9rEffm/zk2frRMtt/PWS9
	GhWIfIdPxm4enEijXze8/46WOrjzwwZt0aQZlJRkAc9M1yb8rwmg8GlhHSVI9aM8J0joR4NYCtB
	kj2QhXYY25QsmASpGqMR7j8vVcPCCuikpiIUUiZrrIiJhLmifeyBhFsqbiCFKlA9XDa4Vw02gD0
	RhnmgIbGDOryRsxw4LiXvaT5J2FthTxka2QtQH+9/vRXTj8UMEa3xTsp8JXKfn/SMg9xgFri+sH
	ZElH2SGXgCd/3Z1BOgpCMGpDCmEWIVtFqcy7Nvy9/rL3ASRWgPR2/oJIjQyU1OxMKdCFilCIpxu
	D/NMhlwkM6xnDYYec55cB5M0bZvlk7uMAUM3igRQL4ERC4O2qGwtfqbGbp7TSNW44/ZWa4ojRBJ
	0+eg==
X-Received: by 2002:a05:620a:4509:b0:93e:85a5:226f with SMTP id af79cd13be357-9442180d5cfmr1646705985a.63.1793614747629;
        Mon, 02 Nov 2026 02:19:07 -0800 (PST)
X-Received: by 2002:a05:620a:4509:b0:93e:85a5:226f with SMTP id af79cd13be357-9442180d5cfmr1646702485a.63.1793614746966;
        Mon, 02 Nov 2026 02:19:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:19:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:18:55 +0100
Subject: [PATCH v4 4/4] firmware: qcom: scm: introduce qcom_scm_bw class
 for bandwidth management
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
Message-Id: <20261102-qcom-scm-code-shrink-v4-4-21fdbe876883@oss.qualcomm.com>
References: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
In-Reply-To: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4633;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+3lajlbu8ozVhIJLWbDtJUWTidf6wZo3cZqU8xT1J3g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GORB82yVG5+ykQEh72GlvJn5IIy/+kXclXUr
 JcPX9dhpVSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjkQAKCRAFnS7L/zaE
 w/oPD/9oukNGaFDvCjzPzak1b08+FzenmRijWRWslZE/oW0dKAV2HxBBvAK7SY27u+50VoYcBYa
 BnfPDlx/D/p2CpW5U4aVO/+pV84CIpMLT5bb7PQBYt3y1OwE7xpvuEmcHfIlv9QRa4qjpRpgKy1
 AO4PV0IEaIxOFhJlio4ibOTjzSmtdReKb/k6N0IKFFBKB4u1aXq3T+XDtreNAdVIiP0iX/baHZS
 xNoy72p9io94eny/czTBHhPpMgoUrMzxiewbok8JO/bRn0KrD3TYnLyr859e/dajWGMqC6Mrx11
 PBzBZok1Hxqpb3xp8+8fWfBu9v8HmGcXAiYonY3D0353xx+MlElpB/n4XVSfZ+IjU6zPIXWgE9z
 kSzyvKMvKRoWgqvycNz/N20PCiZoM9x+BrXhq3KtLWcAN91nRkpkSfd6CLAfx/52G8X7jdItOTm
 enoJ2hs/H/WKIx6h18rRnQlE8WfDuIOYmVDsDAzZwWonJj5bLg3txBP0eNg6umr0GO6ho5I+K5Z
 hK816QUGpjzAmJONGlzIWZaIi+gnPQgdU2yuPJM21G90VpS/80Mc35G4ErlhjrCepk1QlzYB6qh
 wVfQiX+8up6voJ3wxdyuBPT9ceBJe+AFTrJcO92TX2/1CiZpcrDxBoyuwhQtFn2HYdfFAtR5TAy
 h4ZCX4ViFOlhE1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: VPLiFRgcYfaBL0CXFMMAIX2pCfUaW__1
X-Proofpoint-GUID: VPLiFRgcYfaBL0CXFMMAIX2pCfUaW__1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX0F8zactXicaq
 20KtAnaAxqDKOlmlb8j3ASRzq6pG/9SJLpez/wCdciPqWddrjeltwQbdBcCkDLW+yf/ydOUrhUD
 ZxGnplBY44fPXZbKLZebFfihjdUDoho=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8639d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jpxe35GwxECRtIIZr6QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX+E5Gy1CGk2m5
 gLhIc7/CQ4EYDUJRM+1Yc5018mSlvsCYazrlnv6RPE+Xfb7j/Dz4wqLJPjNIjh0ply3vj5iYxXG
 CoZI+TByCMjY9GKj0XNpXO+ZIEBAP5dnk4JoOFDGvXBiY4md/ksnNCY48ROYLAlpRfKzMQ3Bcr6
 ASOY2e2VjfZK1xrIEOHLtDZuxRhXzgKsmkjn5purwZ7QIZx/LRWgY+X/O7JHNB2hiJ7Py28zGgW
 ofPSTcY9taZMvy7HdwVSHzqzy+R2nIbZC3U8RIw7NtHi1FxLAbKiVGrbMrW7Qk1G1VIMQ0nhvf9
 dUd5Ze0uphC2Yq1DgaafA7lUcuFln79QI3NS8Dsa6zXP5bHe8hdOGSnYt44JSyzDV7z5vsv4ApG
 1JJ/2+mt/Dkd6bPLyKveU1MXwMlBX/g4pEtQ7M1R+TGxp8M6oqBDtmfkwxHu93TFnxCOfWN6uZJ
 nZamPkyOlNAlHSa5IyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

Define DEFINE_CLASS(qcom_scm_bw) that calls qcom_scm_bw_enable() on
construction and automatically calls qcom_scm_bw_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_bw, bw)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels in cleanup path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 67 ++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 40 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 28fb80a8496fe9a613228d4fe3acab9de2637634..73f8868c7bffa2a7149110c8b201d5e3c5c3c807 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -244,6 +244,9 @@ static void qcom_scm_bw_disable(void)
 	mutex_unlock(&__scm->scm_bw_lock);
 }
 
+DEFINE_CLASS(qcom_scm_bw_guard, int, if (!_T) qcom_scm_bw_disable(),
+	     qcom_scm_bw_enable(), void)
+
 enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
 static DEFINE_SPINLOCK(scm_query_lock);
 
@@ -594,14 +597,13 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
-	qcom_scm_bw_disable();
 
 	return ret;
 }
@@ -701,12 +703,11 @@ static int qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -770,15 +771,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
 	void *tbl_ptr;
-	int ret;
 
 	CLASS(qcom_scm_clk_guard, clk_guard)();
 	if (clk_guard)
 		return ERR_PTR(clk_guard);
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return ERR_PTR(bw_guard);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -793,10 +793,8 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
 								  input_rt_size,
 								  GFP_KERNEL);
-	if (!input_rt_tzm) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!input_rt_tzm)
+		return ERR_PTR(-ENOMEM);
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
@@ -811,31 +809,22 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 							     input_rt_size,
 							     &size);
 	}
-	if (IS_ERR(output_rt_tzm)) {
-		ret = PTR_ERR(output_rt_tzm);
-		goto disable_scm_bw;
-	}
+	if (IS_ERR(output_rt_tzm))
+		return output_rt_tzm;
 
 	*output_rt_size = size;
 
 	/* A zero-sized table means that TrustZone has no resource table. */
-	if (!size) {
-		tbl_ptr = NULL;
-		goto disable_scm_bw;
-	}
+	if (!size)
+		return NULL;
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
-	if (!tbl_ptr) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!tbl_ptr)
+		return ERR_PTR(-ENOMEM);
 
 	*output_rt_size = size;
 
-disable_scm_bw:
-	qcom_scm_bw_disable();
-
-	return ret ? ERR_PTR(ret) : tbl_ptr;
+	return tbl_ptr;
 }
 
 static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
@@ -854,12 +843,11 @@ static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -927,12 +915,11 @@ static int qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }

-- 
2.47.3

