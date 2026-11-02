Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614744;
	b=bUVpM8VoJAb7DZ0FGcN85RcgEIevoLDfb2eGdLf4RSInxuC3hMdNPsaQssCyxs7beoYs
	 +SQqRRmrKibITzOJc5aLYGuMn+FHAypAE034TvPN3SN0byIKTkVhY9LD0aYtzCb/Rp3aQ
	 eYe8V3fdxKMTA6w+x+wKEx4hITbeIZs2/AwxsZv+asl0XCCYTayvDJNpzIwLExv92FfS1
	 EaWyX3fjMwN7T2lTejp1NKjvL0phP+bZbXSVjWbcPxijcEkwTZXC4JfnCukZ8iP6B2opR
	 W7DaqAf4xZJG0I1v+o2HuwWUIlUCzZU70mbCaD8hedalIR6E4uqeWAPPhEJyIlMz1sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
	b=dp1+uctmloShcLp9dshWIrhMbB0jPf4C+pTEdy4Wjf6pgYc0BvYwo+WLJtGAlGoqty+o
	 uZjn5yoP7vjN2IcVQ1+SfVsHUq7s5Wy/xnWx10vRqW/yoJVZbpCqPmhV0iAYSKJmy2vOs
	 p/wKOYf6kUJdxT87pJPBLAAse1oKeAqp0TXAGjHxI5DjK5cxXYRG/YSeD9E8IoCf6J4bi
	 nrEywoA0xXnPnAZRu0QK+AbhfBry5N5RAfFy2TVEed76K7BYSyWaRnWVHzbN59MQZDxZG
	 kBKUGD8hMD0tWaoNFXTL+RhMnjbCx/yp0mHsgtZyxD98z+AADFHWZqiOBBTTKCJbdRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQTXXxos;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epVwx3WP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDA60A261F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DEDA60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQTXXxos;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epVwx3WP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ATM32361264
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=; b=OQTXXxosWnRZ+8HV
	D92T3JsKWJqxk6GwpYeEDK1sGVsqn3Vjs/sK1D4+0Ite+FlSGxy3xUVcDSGwu/fu
	+Y2HwCGUwRIZj/tTCwTXXvjEOGJKpBCt/hM1y+OTQLf5qqDahQaETvY2J1fYxW8K
	sAbrBAw97tC4jOX9ZPAxq1opMd8B/rUhkcprFavx7nVkV/jdrXfz7YlnZjJcQBrz
	6OqsR1t82zaEVxJczRWRO3NPiM87msiVnONHl5d19iL9IcDYppSIhOl5fwN2TYQe
	7+9wmyLqgvgpiFqkt2VFVl/77tjbd2iNN/PMqGEnWat8ynHZVZfcy2+2sHWfcmVU
	KhZLNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7xbj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:19:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so309445485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614742; x=1794219542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=epVwx3WPKFCN29GWEoi4Y8R//YRH9CdoFdZjkeRrl1kgQf0klQPUiIYB6SmFHaNvBq
         ovpCn7hdgQu+BTiv0Eilh6HRiljDNZm/Q31AEBsEiZFVU64YpFWn4HDgpvNf6XQsCR1F
         ZlwEiER7VOHmI/VgZux9DEztBgmuuU35bmde7fzh+GI5dLAnLGnBfbrmlA3+z6vpaCBK
         hlDzJ7w18lCqy08i+BG2iyySA4wEbnD+7Hihp0JKi2r0S+i0wdKzwjgPq1CLT/EjIJ22
         PpN0/hj576kz6zje7O+soLHIUt0p3o2K1jdzf8Ae8lL8jHMe+QE+0WHZIrX/L4uKVxPH
         zRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614742; x=1794219542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=Hofb1TBkKZkzXD0dQ38h4hB9rcMd/xV5apCq/y5+IJWerEen2cHZvSmJOhVnPfw4t5
         OazC3zSh+Cw2N+cHGAhBNGAeP+/bD/nX0MseK9YrmJZipTBHu8WWqkPJrykX1L2PY7px
         0QtIahqEC3HzSX21KKUgLX4NOqKsB0TXYDPNd1F1ANW1ovn8sTNtHj5T8w0HY5viI/KV
         3DhvzwL3Va7gbQPmZBPmILIgs3IfgZRJMy3cpCwPDYJcHtwhgpB926XYz7y/xWXoE4od
         A+LpsgAKI5+0Sc8dL5u9bHzjIWUb5LOsCIZJVlIVsENVw62MmBy1kJKf8G3zaBj2uPc2
         KulA==
X-Forwarded-Encrypted: i=1; AKwUvBwb7/GXg3/QVXoUu7Fg6fgwFlVsxL843yjV54v90ozX07H7DX119KOamhhtO1V+9oVN2IvnXlMGt1Kk+Sg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyJDl6/CVElAEMy6zal5z7/6QjDwCQ/YLnydjRz44uu75T9nDo
	4V0JlKCRjtERtFV2GonJ9BQsevbHQ1deyZbsZa0f6yiKdSy11iK2jnyaKxPA/dNrHIIlliql6GG
	0bsvWAw+gJGX8aBvweKsZWVI4eOARU6gcWjAV0/XsX2KCdCy3KaCzGoWKmmi6LgyOQ90MdwKyt9
	c=
X-Gm-Gg: AYBFou3LCION0QGi4vs576tQShlT+Tsf2y/6LSUYva2NEAOi9MNYKZhKagjoC5VKGMr
	+jWagFEdg5bxZq0Pc4CR+HcoypfhNMYIgqqZGKqSNXxqw9uACpfE7GXsdX7sJoJaswIN5FFFWU1
	IHguiKWfKwXeiF0rVbPcrkspWLqAm4dVQf4shEs9HnMn7qAWgIA8OZVyxOMf76ublFM9ov78JhK
	x83yEPMFDQDIbemJRsxq8FV25VsOcZfwXLLphD98uHQ4f1OvaUT8c5wUaYDJm+TME0MyIy/553T
	yB6EiOBXLk68Sb6USIntAxE++68DPpAotV37X50VA6pEy9C8iBGBfeeNPPhrgXWmm3RpgP7vM1a
	8EVyooO52BGqrQhZ+JzF5ceoUtyQoPARaLCQBj+0oJBWLW37MM2LQ0MrUAe54ztfB1bRV92dYVO
	GuBg==
X-Received: by 2002:a05:620a:29c5:b0:93f:a7e:e0f0 with SMTP id af79cd13be357-944217ddfb9mr1461647685a.82.1793614741774;
        Mon, 02 Nov 2026 02:19:01 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:93f:a7e:e0f0 with SMTP id af79cd13be357-944217ddfb9mr1461645685a.82.1793614741324;
        Mon, 02 Nov 2026 02:19:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:19:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:18:52 +0100
Subject: [PATCH v4 1/4] firmware: qcom: tzmem: guard against IS_ERR() in
 the cleanup handler
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
Message-Id: <20261102-qcom-scm-code-shrink-v4-1-21fdbe876883@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GORwqy4LnEmuymOUm2dwDXAAEEhJD02b4iFh
 /H3vtSRjUSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjkQAKCRAFnS7L/zaE
 wyiID/4troZ5VHc8X/zPxpUmMptQgLakn+XRYU+xwRfJ6N/MdOUlO37B8FYqOArzC26EXE98hU0
 rb5KfEbRlu1u6PdM+Rms6FFIpg94vNTKbave9QEm0haogIFnhZLa+VOXOzBto0pyTNQMqGNSicU
 VDZuqOaJhhHYFmz/YBA23cHvE0EvuMNX+O9XgS9x9nYI2JXGMUP9XAh3JHMVgD0m4APcJkGmsUo
 mUDaH0R61TsVcUP0uWp/4xTYKjBcuYhG4UWnxDmI0mVAJPFaM3a++VIyqiGt/uRbsHuyBYaaCHm
 Zo+6h2GKCYI93AaTQvoIEP0Mfh7wG/X/Trh0TNqfLIgvAJp53+cQxhBOAWAUSCKH3rQCy4qkgHb
 Ad7fUwqz5iVLQ1qm7UKK9mtg6qh/Trqem3pnciA+Ehobg/CNsIwm69MxmvJHhlawEbUbJ+l84lR
 SIVQPN/hHG3DLL033pe3HfeXYeZvnbhUYqeez/fFmiB1qOLcqwVIC4E4IbEtUDdr66j+uV2YeTE
 ePlqYQPWvIeOB6jnX2A3T4ztprby2M4/HVFzja23znR4rXM2SXZN8brc75ZW8nuiAO+ga9MFzJ1
 pws1kDjZDHyzGBdg2VgYSN+O8sTdL+1hFHVpVDPR4C/AjVS9UyXK4UVmnKKNV5BXUCq31n5yQ1i
 8WG31yFM6tTbMmg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: MdQC31hFWDoMveLBMooYKDxNqQYTklKh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX53P4v4ct4BEU
 ArQ+7gl0Sk2XjpAgYy5BzydT8ss2VsSeD7gra6gb6H2usaD4BubU+Q6k6Sugi4E1zf91/LbU9dN
 xWHl0aQuNGPoTPiPq4t9W6wUVoIAqb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX6pv7jfFbTCQw
 DYMy5uDasv0zUZum9QIbN5YjmmpBt+FD9frXzkNWj8vabDr36kCrJolt1xdLKc0HHh4dC2pwOVO
 bFPhJaga7JFdJVK7pIjh0p5jUg2dx5saAc6oC7nN7omuzSC2I5h/VZJdGW/D+ZOGTzZDETKmS/X
 4fInd+Gn96kT+iqKbbJ+vaoX4fJ6ZN97tUkoTMl3mlc2HtQFDaWF3RdL151waZPaqcPD7/PGuKx
 r3tmEkUwiBV+OLwTF1/8zR8oYDUWdOyBatLrEWQk5y6i6QPeWUMSsPLzWte/+BUQo9uCNOORmAT
 9fJNHCLrYHcVgvPVyGBtWpNdRkEkaSaiChzAZFnuqk6duSAn0sYnEa2941Um/Mga+O9ViduS2+a
 P6CMryJAiA2Sk0naREPejJDm/TSyvIdSA0b2d1XiRUbvOvAR3SxeEpXjDxiEwVoHQCKAQklXXg2
 kUq7jg08pv71eHhtlfg==
X-Proofpoint-GUID: MdQC31hFWDoMveLBMooYKDxNqQYTklKh
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae86396 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=PGwebHSm6yYtckILb5AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

We currently only silently skip NULL-pointers in the cleanup handler for
tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
value so skip it too.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
 void qcom_tzmem_free(void *ptr);
 
-DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
+DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 

-- 
2.47.3

