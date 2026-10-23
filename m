Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775618;
	b=YhhK39JisHhxPNRXhF63YxvbRuZOkTe8rC0RlK1NO8ELjfZiI2Chzw1fQpf4sRGtDrHD
	 mLV9+STtvrewpeiaiFzldAKKpA5s9EIDDcFaJ/kVj8c7Cv190XpDTgjDpuzT6RfflSCEZ
	 LzeoRMPt6+L5beOPrSGix859XgVa1ZG6uddjgprv2ayTj/JfEqcLmO31L7rT/2YGR6SN+
	 9PO9Ufmlv2vSWl4W0hgD2ygZAt0zuZbOG8GzNKlSmDDEwYbVhBgw+WZqHZFmmSTUZA1d/
	 fm5Cl4EAEcX3fjsSRn4PhRUuoCfRN2t+z4dFtxJQbatm4rCMOuOmYclVMoXarelWJGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
	b=MgqoM/peJ2e11zyN8lkVfmm8rq5+UaZjp0JZKDeWP7kJP76kE1YuWOzs8OtvsOIMkdpn
	 0hfbh5a/C+8aORCn1WUUv1lbu+8xfEVX2xBkx7q5miAcgwRTgSxrHqbHKaGZNBLZB025F
	 hOUIMyj7wXl+6MR21zAxaS8bnrJyXaZpSrx8E9S/mvbPA+ovhGK6PlxdFTsFEjc/2gOnE
	 iNPBO3791m+KTGkjLmISuqenvML2cfzH0dZbQypi5ydSEoaC4CMon0S9GX90jpXodI5bN
	 Zc2sFxcmf1iRVipCFzTu7XyDwo9fEXpwvJWLu8FGua2Y3P3PV9+dnq4vNB81xdpyHfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lh1J3H32;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVJhbyZX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B91606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B91606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lh1J3H32;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVJhbyZX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2qpD3228252
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=azg3XSvMykp
	TDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=; b=lh1J3H3233uDUfWpmdbmM52osDB
	lgKjpeS2cteLoji4ZRksboUTQKKycMhktVCqRUkY74qQ8pVWeUrB7FVfKxLyvIUI
	Hk2mt/QgnOj6wjliwkUi0mb8kNFHJd/EN85aYyFZLz0gQwOloJXdvS3xYX5vRSf1
	pO+NTh78aNXjkjQ3oHILKZIb8uhvwLOqcH8hR1dtLM7zH5rG7tQG601QgwovAu0t
	+AH6MlgjbmhsKvvbXr6UcOrRvKNrr/0vKUoxw9aql00U5T7h27i+7Jv7lQ8hxzIu
	2Unk/a/bxaPflh7gBsBr+P4PRdPEOYxdf+u8tUBNpP/V1YrABBo7+54vkxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart091t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso140655085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775612; x=1793380412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
        b=YVJhbyZXoLA1coUNuoHKBti8dh3bsGg1rxa2kSnkljc6VWA9A1CiNLsnQZQ5mBZ6co
         2hm0K0bQXkvWHtpj6O4l3IZVNuj4IzLYcpbbsHonajgh/fTUqs7JSCcNfcBcl+LQvgDq
         tfw35qVZUgW/OKRcvKvteyJFkJPJDAX3AYowmTB1K0WvK7f1PVgKqTaVbqNsltJSvQ+I
         lfPKyyCXKDRRUc5nSnyyZRNVFZ37CPjbX5uLntrFKYRKjkpr6YjEmr6i6u/r7EhPflTc
         Yjv/pgxVaI2b1uzPZ9ts2LSDZxpAi5q3MCVN90SloIX8ShC0X3H+yVOOIu3I1qn+JnxE
         FUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775612; x=1793380412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
        b=V76C0llepvbgw5CHg1f18XOxdNfe0jKWhaeiuV0V6ApyYmZOi3ian7nDlpOtyyPtBn
         tn32nEKVjHvSN/4bg1qsSeKyWXhA9KpaLaYxxpVqduJ9mLEmKlgOdV5VrJi/z8x18Omo
         qPMdWnfzyoV2JgS5z6TjrKk161WiQRmiCYN4fcdLLiwpfDhRzE857ueWN/mGAEkeuO8B
         zuByQ6mSjk/exEBEudeITbhhZWL0/dZhgovUXccrkngTqKZmGLFK1LzeX/wpeYNiF4/l
         BQQ4u2BClkoxMKuSF6Ov2SPvOlvL2jzyHFTD7P0gtqrtI7u2/Y55aL0LhurTJ5ftVSsH
         Qpvw==
X-Forwarded-Encrypted: i=1; AKwUvBzqhLzvf1+jS/Esxjh6GzImR49lFPYWQCSGCekxcz4drlb4egreHcEitpTGccH2Lh2Y9ACSEm5+iVuPYIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjCYo42SDPZrwfjp0XljUoiSRBlQ2Ts16JYwmPrxnKNSW7stut
	/NDb7WndM3lXJaK/4jhs3rxyNVwXgDvSmGB8oE5CihIPPhuo1KvR3rOFCAFoUZUmsiGGcFygr5Z
	sOMIz25fLGQXQvZCsbk04dPEQoLf0WDtfBP/93zn4+VJ9ePrVYhrTl6ZQ3G2gx9qgQik=
X-Gm-Gg: AYBFou0ayEViCa7WmUQil/IbtkHqd4SbwZPtwPrxzDkTYhNF2lBb6xb+EMOmxR8WAa5
	OwgOthOor4tIkR2wpycw0NWx3gFr2bHFbGCVfbSZ9yROmVl9sWxN7CT+cFZiPt7OMuhhtKfRXyM
	pLYcF8ZfD+lxkRkvgWXTfkfn83iJ5sDqDLwB1SV8D3QM78dgm2C91muVcmnE+9kPtYCtiZNvgEC
	t+dPOT+n6vM5lc7x5w31PG7EVMqJUuhJfl1xaej5bxkdLnYC49f3vk+6xyBXiU4+iC/D+divhJH
	QMqiyqzZR4QRXJQ7m4hTAqWzz8k2FZms/zbZHwrCeFsQyMq4pRi1c05sVXnMQzSaoANXHA6iBv8
	wlnw+v5d9JOeA
X-Received: by 2002:a05:620a:6011:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f6f9e0c43mr534099385a.64.1792775612076;
        Fri, 23 Oct 2026 10:13:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f6f9e0c43mr534095485a.64.1792775611626;
        Fri, 23 Oct 2026 10:13:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/7] ASoC: qcom: audioreach: fix module cfg blob size handling
Date: Fri, 23 Oct 2026 18:13:10 +0100
Message-ID: <20261023171316.819857-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/ldd2N3VL6Uj
 fcsWBDkhH8zbdsCYLPlLypwKncFKQ9IbADXmrDNNByl4iKDo7KlNBgCL7UluDYU6DBqFumoGUCt
 2bBTA6Tem2gC18oID+W8g96FmfOFD/2NsIyY1ZUTjhy/Hqp+OEKdwfROflTlfLSCzafZVIqCN1E
 YHXNYCjoCIc9n4jIwt7TIyE8ePyqX+KGdZwyIktMBVgRw4pjmGTIvH7bW8XHSKa3d0JSSSKPAGt
 9AnX0rx4TYtZpbxRi1Lt/c8sKKQrUtHmU8uLYc55peN3dbXu8d59OuBogIUxPejSnOX0+qHrYbW
 s+MsN1EfBXJGFouWmPMdKHXqrL+7s6oc04GTcNx2g5us+4Pebw62tu0MhqtMLGEqyvq5XgZXsfF
 RefN3oX6MifezP1yx1gnzAbbO8kKykmfMtdyNUZD167zF0G7UL/9GrkNlu8Mk0cPix+By7ofXxs
 lUN064CJIGVQy3EtcsA==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adb95c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Fq9-307z7DJWB1LruX0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXylRn+wnVTJqM
 g5Tj4QShJSNV9HpwRiXfDxxl63rr9yOHKVN9Gm/E8xzZ+258krjRGPjsnFM8S+PXRJy7Bm2UxMz
 usc3aG+kDJFJwSF5CO2qAC82n6NKy+M=
X-Proofpoint-ORIG-GUID: piwJ5gQ80cx32dauwleEM9TC9kBKKqVH
X-Proofpoint-GUID: piwJ5gQ80cx32dauwleEM9TC9kBKKqVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_get_module_priv_data() passes mod_array->size, a byte count,
as the element count of the __le32 data[] flex array. The allocation and
the copy are four times too large, and the memcpy() can read past the end
of the topology firmware buffer. The size is also never checked against
the private data it must lie within, and a zero size makes the loop spin
forever.

Convert the size to a word count, bound the blob by the remaining private
data and reject a zero size. Also check the returned pointer before
storing it in mod->data, as an error pointer there is dereferenced when
the graph is opened.

Fixes: c7ed4c2debfd ("ASoC: qcom: audioreach: add support for static calibration")
Cc: stable@vger.kernel.org
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index faafbc5c0ad0..612d8f03e6e9 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -312,22 +312,37 @@ audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 
 	for (sz = 0; sz < le32_to_cpu(private->size); ) {
 		const struct snd_soc_tplg_vendor_array *mod_array;
+		u32 array_size;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		array_size = le32_to_cpu(mod_array->size);
+
 		if (le32_to_cpu(mod_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
 			struct audioreach_module_priv_data *pdata;
+			u32 nwords;
+
+			/* size is the byte count of the __le32 data[] */
+			nwords = array_size / sizeof(__le32);
+
+			/* the blob must lie within the private data */
+			if (sizeof(*pdata) + (u64)array_size >
+			    le32_to_cpu(private->size) - sz)
+				return ERR_PTR(-EINVAL);
 
-			pdata = kzalloc_flex(*pdata, data,
-					     le32_to_cpu(mod_array->size));
+			pdata = kzalloc_flex(*pdata, data, nwords);
 			if (!pdata)
 				return ERR_PTR(-ENOMEM);
 
-			memcpy(pdata, ((u8 *)private->data + sz), struct_size(pdata, data,
-						le32_to_cpu(mod_array->size)));
+			memcpy(pdata, ((u8 *)private->data + sz),
+			       struct_size(pdata, data, nwords));
 			return pdata;
 		}
 
-		sz = sz + le32_to_cpu(mod_array->size);
+		/* a zero size would never advance the walk */
+		if (!array_size)
+			return ERR_PTR(-EINVAL);
+
+		sz = sz + array_size;
 	}
 
 	return NULL;
@@ -611,6 +626,12 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 		return mod ? PTR_ERR(mod) : -ENODEV;
 
 	mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
+	if (IS_ERR(mod->data)) {
+		int rc = PTR_ERR(mod->data);
+
+		mod->data = NULL;
+		return rc;
+	}
 
 	dobj = &w->dobj;
 	dobj->private = mod;
-- 
2.47.3

