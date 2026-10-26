Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052122;
	b=NEDCmCjzTukY5Fato4pNu3m7+yzlwooGCHbFp0P8+StNBO9husyuIGBF/ayZwIvT7AN3
	 galHuJFew3vyBHCll9UR9TNP2rJhQRb3zaN/5ZqpoH0s5PnQkLKfEmRwIM+rrii+DvvYY
	 8DRJlklL+oDziK1iTwxBAaOGIr4Oeo2r8vwnJkqAPnvkOILJG4vsIMp+VnGvs0m+wxyAo
	 O5pMoiaMsMBbjkGgTFpQh4L2FeX0yZoRCqjEMw6kHp8D20HOK5j7cmXouvdn/7lfe63V8
	 JbBgbQ9wXxkKYnRG6TH7yrHKw8CNwZDjiTzfk2zMHid7XhFrRU38s2eC/WHgCYXU8xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=;
	b=qu94YBzgQDu+8MTFsL9+Hjv66J8bsPxspWMGs1DCxQofc41NKaGEvQy9e20LXavpoP4F
	 gOmP2L4pQ1tCYYxzyvCjEg1FZZ3Nj2Ci+I+A0Xjn6TCqrZkTwx910r4+JPXd/iZ6Yh3rR
	 TQrClMWzUqzm6MPl9853oHD5Vxl2ar/99RTvFK4UDbkbBu2sjG0epvIqkywrAnHK/Frry
	 quFSZNWMSMcwwI2gU7XKkktS4kiEpZp/srgg7DZ1J/V6yi2qpM+aK2qa0dZfghT+0jfOz
	 UWsNTOc6f+N5JHHHV5bsmwl/LLQNEaJjDR5gm6N+79piXADhXbVUNJWefLE8JG6qf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jgac6jl5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MgJ4Xsjq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A0F606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A0F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jgac6jl5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MgJ4Xsjq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoLS2488562
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=; b=Jgac6jl5zny6hx6F
	VxcULzScJn39Uqi4GE637+/ATcF7fRDsezoEkZRmlhlQMYL2YN7lS610IJVowTHD
	Rs/BkFidwqfrAnupV4B2MIm1lqjEPvMI1HsRIpApMOcEU2IkfYz138CHkS5Gz/Uq
	0P8GxbJkAhDvCYVrdOtKkhkLN3umkX+TbGir5ywpPaqJrO9hzhGI0BHJ4Mwa+Gmg
	2Dcz85r8VqK1oNswnumytf1DaIKB4EZ3IwOu3c49Ouez3QGCvGVMcqIColgVXX5I
	yvl6uQPVSOr48okL1i3i2oBPIcoJjNPFBJdY7MWuJMENd8pzLM74MtvxXEIBihoO
	zDuqgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf2neb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:02:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so16447113eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793052120; x=1793656920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=;
        b=MgJ4XsjqUpsg8IqO6rtIUb9Ijjil7XAwX5+CiUzmFE/Ay84Y8oLQBnk2n+GvonXCcy
         mJ1s9QG00ZOMPa8QovFpxcCv0twEkWj943PgtXyovGXS4N9IzHhNWrZbeIV+jFms3FBi
         2Dzh6rJkf/ES1oD5IFLHA3ryNyfC8y0YV3bqlSudTyhHEAOaoyWEViELGC6Hzaogkani
         RxcGx7DwRMJhayqDnP2htUBZ2SrAfHw3dp7oxPpY11Hyir+DOTJadOim4PiH72FWhrPM
         zEHmQZkWRvLrlOV/S0I3Qby5RAGdaeIFjX7yPNpcbyazAjqlu8lHe7eeWeLgEOSZRP66
         D7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052120; x=1793656920;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=;
        b=a7PJJhDiIrgzeFi28QGY8b2XaYHk4UGuYhMnem57qjZmZN1v3hrvXPfg2cj9Ehfo4W
         fFgDny7FKj6OqX4gtksLNITPgy6kTpB6/NDeFtT0OVT2jKBvZVWgMJXkrINzMOqDZpKZ
         DTXT3LoH3POxa2paj9HwM9HTbBk8seBZ2K54WA4HokWQXM54cVuyzNH49pfszXetQupC
         o2vZUHYPPOhmMbVjUKLdSqL5pYI9POdJhFg1FRRLXFO9pYnWI+0gwz3+mB4212VFHJN1
         dcvUVspefGn6aLtWoo0I+fs5LNOAZr2FeBCWqhCTBso4JUtkQASwfe1dK6j1XNJcA9U6
         7YXg==
X-Forwarded-Encrypted: i=1; AKwUvBwsoTEArgIhRh06JeEuqo3l3cu1bXg/nKI8kb8r20l1VNmltNuyByI0PRrJ7IXvMowD+5Mdu57GID+RzxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuW0a0+nAxnnFuSQfqlugx64OOD0wZEDZ1ZLGX4H1Xs5VeGCG6
	ZEkhVtERzcdnTgxlHWd6dbGh7gNvsBT8wFyhhiYpyypwn5wH0241i3JneRc1vi9pkh98tOplrd8
	GFCbmWnfSZ7bQQM37ICs10egmUKpw593sxiVb1TBqQy6IcSs6I22O5sSEkwxqRAYUBk0=
X-Gm-Gg: AYBFou3hlmNKXkhTtjjSpwfUczOzFK3ne2yEDqVRnWXOxIGaTOdnLA0miHWgkmWQZsa
	PTx2oxuCktr9xldUB6EJgzWm7y8yo1c9gqd9zmr5x7uPy+Xedp+X8ufPRJhE222osTrkdfjzLZk
	OTTSsr/0oHsl6fgqcgeqD9na5ORw6GUKUq4x+IBVJuvHKPFJgqUO+FrAQwVKv2BrBqlJe5GiSq4
	JA9V/qgP/HNkLMleVyjMKXpsC/d+oj0vcW6ezAC4UGF3jKjMqYSV4EOuqenFODW8IA/fozgVdCS
	IHLT2KE50UUSIcMeeqf40AhlDOXFfoH+mwDvNNXdoj3M4qlS8p0kqNRUhhxASeKTQwAAIuiNytg
	+H91s/ZD/rCoFU4TCUs4miXeuOebQV5qti2QTPANZpgNSii2vvjBa3A==
X-Received: by 2002:a05:693c:638f:20b0:36a:eea:df88 with SMTP id 5a478bee46e88-36a0eeae085mr1359723eec.19.1793052119840;
        Mon, 26 Oct 2026 15:01:59 -0700 (PDT)
X-Received: by 2002:a05:693c:638f:20b0:36a:eea:df88 with SMTP id 5a478bee46e88-36a0eeae085mr1359691eec.19.1793052119045;
        Mon, 26 Oct 2026 15:01:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm8443486eec.6.2026.10.26.15.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:01:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
Message-Id: <179305211811.3326479.14875064682698836541.b4-ty@b4>
Date: Mon, 26 Oct 2026 15:01:58 -0700
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
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX9xAEJZtyQcgI
 Hj2DMAAIWyac5YoGkbj2gvtDLqOzLudwsVXrywKZIBxmAQtWcQVC+TNMC11fpvB5QjBbMY+yXHK
 GSX78VFlchelcffiIM1sZ1TSqQtjFxI=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adfcdd9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RqEOnMJ171x9OPMy2F4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: d_FOO5pwx99DJfMRon5cBXT1G_xjJubP
X-Proofpoint-ORIG-GUID: d_FOO5pwx99DJfMRon5cBXT1G_xjJubP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX8mSLEgDK5uPK
 xolAiA1xq8E/Js6i7bRUW429YpxsXEpHb0+jJkyXGzogSy1kJJnFyhForUKnn+oWxbhmq9NRaVq
 lqhZ+R4ZXJQlIDVc1BTkt7sp5F6YnbUwYkV2wI5/V2awgflUMYtZ2I6yMXtxEiuxTNN71eSrHbY
 z7okfsz7uTowHtlhi9PvSBFq42Bd3/JSRPC7ZGSyjF1lpVSiF3uW20AiCRWDz82rZ+ezDL9FYQW
 rIEQAcB66gs5ug+i0sp0QrPG4nkzzd3NWuKInusxR+PKCv02X6hcxjO1CJ3KX4uLH6XQqquKouK
 yJWxKpEqeCam/Bwb/rbYsSYM4PZCICXJPhO+W46JPQEnFJwN0eepDESjEi2ySj90xivO6EJu5Gh
 q4hW1UByeUWahWYs6bFbql50beLDFMlkrB9aUDGOatMvQ3D2JohCbqVa+M7Ut3TOw/ZYRLlzykt
 TfJYncy9BPqTpsVo78g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260087


On Tue, 15 Sep 2026 16:00:53 +0800, Miaoqing Pan wrote:
> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
> succeeds, on is_sta_assoc_link verification failure, it takes the
> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
> the dp_peers_list.
> 
> On the next connection attempt, ath12k_dp_peer_create() finds the stale
> entry and returns -EEXIST (-17):
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix failure to create ath12k_dp_peer on MLO reconnect
      commit: 8b6b871332b5078342b3f809d35da7e68f6f9c9a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

