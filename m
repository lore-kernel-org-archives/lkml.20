Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453A4D0A16
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217010; cv=none; b=QiVqaT42KklnH/1bsiWDfTmjodnyI6V4PaGdvK9eGwczOyqWcxNlrkYhxKjwoZPOw7s0UoMj5pVqYMMw+DDQ9DSJ98CA7ACECTRifw+1tpJVoKPLsphLLihfKtZWWqZwYKJAKtfax/CGR3wE7frOy/5Y5yFNCQD39VMD1HH7eBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217010; c=relaxed/simple;
	bh=rlLYG6jqv3PimpyLK1/8g/oAhJGjh8GkcrmM4+65O0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUpamRa8BVuEtSynRaeAhGlFSyYig+PipdAoQl43Nay6qye7RQ5YVWkQCSu1ey8+NhjLdI1BErS2HUROTx5j6bctHo1rWqhzQLeyfrfImDT5ajTYrItzFUdbIfbEU+huf6X51yA5SyO4UMwgcgElALGuMhBSLjxxL83OIqAiRpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFmv9Aek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RiwIolWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFmv9Aek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RiwIolWx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP1Xq1195630
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 16:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbICt7mq9cvO53jr/TjOqyTHGzuqZGS1C+bnfP8hMfA=; b=dFmv9AekT9ilee3h
	Q3nveQkdbJlIPmH1tso9H5cwNl3V+rb6Q8h2eOFR8Zq+RoOlupkHrt3B/quA3jFF
	QZISzQrk2OW5KmO/iwkrmbTlSy3kGVAmFNl/h28QikmwdGZfC0/X0ouOc7U2son3
	/Rgy/eLcmqYmpDYnvCNVzYfQChzjm3dLbRA0alJyn1RMFUOy9HM3LC5kPmZ8oWW2
	zZD86uLBRWao1MwQ3TX3lGR3ymnRGVi8Ht29BAw5asLxNw/Ikz0LeVLmZg1eBx91
	uMizdNp9tgOfL11FgqpyjQoTkqMSOYEC87isuT/idcurVu2QlXNvQG/TANj4A1Da
	sH9K4g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfmk8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:16:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2ebeaa0a4so18119605ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791217005; x=1791821805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbICt7mq9cvO53jr/TjOqyTHGzuqZGS1C+bnfP8hMfA=;
        b=RiwIolWxS6YXnyWfYlFR0tprgRryR/IxKTF69zTTyuFWiEG0eqnsw2piqpKJi3odjI
         qN88DCB95xbSblJmJcrFeFbcQLG+SBcbM715cENUddA6EnFdAEfF7uG5INHLWTRXsrsc
         ar4R2Lu+/kaEg25u+EqRos6lU3PPQbgbky3VhkKt4aZ1FU+iXTurBlR6a/7z6W3Zv3G+
         GirnatPwVBqrEQSsBWUW6xBzXDMX3RRGqYUp7BNc4PUIBSUZAT3bNXF/Yi4lIXzpRF0G
         37BkhgCqo5JJTnJQT9xqGMMAi4YnLz2omygnY/ic9edqtNTpJwX6Nja4NJisG0dugZi7
         WbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791217005; x=1791821805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbICt7mq9cvO53jr/TjOqyTHGzuqZGS1C+bnfP8hMfA=;
        b=oEJ98l+aZNWHvdNepmzM0Sg1TgVjso67ZdnWsorrIF6rL4+QiRfE15L3pMjTQno0tE
         I1aQGBuRa2981vAuiDEU41lE5kaG5G2GNWNGz/zPMJxeOPi+eO6yl0WZ4O5TSwVeVFUs
         2/TNgtw+weCFjwF4Is9rAnP2F7y3DXZIphV7febkqLRH0lBTcEw+eni2G1JKiY8RioJh
         6g+HruXzExUMXm5YZ8++/VE/WYjGqWmR8l73mogEDFjMSCiVbd9iKvxiZEmFkLwOwL8o
         ZugY2/FntDyTYXk3RaZ2SRasWuwh+tOKtWt+Dx/e73XCq0301Mhg+rrhl7o8D0G2S0Sm
         m1LA==
X-Forwarded-Encrypted: i=1; AKwUvBwbZgVTn1yghJnjWq/JXI/DcWDFx3aqky3igM97PlqcthBbhBFcddM8gq8NSneAtuV0cVcb+NNK5gHHUP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1ORO09Ic5JnA29vzTTRu9mpIoFNEWEjtlze+HYT8/+4wqgwZB
	+QJ/QZaRxj5G5xcShpyBfIe7JohLGy9APfWRvhwQuiZbxgGC2EwTbRAemDgvdNG5NB6dWwDG1H/
	Ims2xyzAfbFcYi4uPjxPyTpMi8u3IEc+c9cF+s6hpOHB8UTZI2ugZfqj71Nrf7o+wcQ==
X-Gm-Gg: AYBFou05w8u5oQWLWpdUL0HE4yEkNGtbLhdU25e6tkQnUV4nAnudw4ztH2hqmD3IYjX
	RLE7NP29HwqNm1QMm//j77R0ngaOIeTjibAvoiy+NKn+HKIwRh/EXdEXnPRyvoe7chW56yry3UI
	cFDSqQ0BW1do2u8k+btY07l3diT1wepN1hK/5aqgRxzEp3WpF1WCJD1d5kK5fwRE9kYaBSplUll
	WBUaVLa9lpysGVdxcs0XOq+YxqFcL6b6q9oDjALK9RgZVr5RS2kKdlc/R23XKhll0jtqim5butW
	Jlpw+AcpOHCyHr8IyPOvIah539kfCxEm2dJ9NY8MlDgI9CXlmLiOZhVZNv4gDdXZRXFdYOfTaDy
	5TYGdQTK03vKi1qI/aChE612bR9tnmwbWr8Ag1RsrxOJV4YeB7IhPTybC0UR/22Y5lQEPhbjSTl
	vudTJqYx/nPl2dHBkP
X-Received: by 2002:a17:902:d60e:b0:2dd:ad74:ac2d with SMTP id d9443c01a7336-2e5105a5a0amr66701195ad.31.1791217004642;
        Mon, 05 Oct 2026 09:16:44 -0700 (PDT)
X-Received: by 2002:a17:902:d60e:b0:2dd:ad74:ac2d with SMTP id d9443c01a7336-2e5105a5a0amr66700915ad.31.1791217004005;
        Mon, 05 Oct 2026 09:16:44 -0700 (PDT)
Received: from [10.50.23.243] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae51asm10191485ad.29.2026.10.05.09.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:16:43 -0700 (PDT)
Message-ID: <d90da428-8e4f-405f-968b-062ce136657d@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 21:46:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2 11/16] wifi: cfg80211/mac80211: Handle
 UHR Link Reconfiguration frame
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
 <20260924-smd-v2-11-bb40094da1d4@oss.qualcomm.com>
 <616e0013e78323cbd6a1a307cd40d59b1e562373.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <616e0013e78323cbd6a1a307cd40d59b1e562373.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SY0De9eVGI4Du6-Fs7rDmFTbSzLXB-8K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MyBTYWx0ZWRfX+yWmBsIzDz0c
 XsO/awvwPfBS2uHm7YJp7dsrxP7zhOGgJP5AuhoSiYAJQnD2CmW+3J+irl0GoTcUqTIfD3dkteV
 8jIuAkO3DUkbT7TK3SNHUJruEg7wHdc=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3cd6d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vuaycF0E-hVDLVIvCLkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: SY0De9eVGI4Du6-Fs7rDmFTbSzLXB-8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MyBTYWx0ZWRfX+RLVU/jXD8nC
 ZLKcFogLJYhPOeAyGIkkzXnemu7NyYA/Tf2EpGNsKyFtq/Gffi6oNyItxJj5EaTeZqlP8ALV5Qs
 BF4XcsqKllcu6RZnE66+alj3ojMeMBJqLpmlDslRxo+QyxL6lAG0yItXOx+6JtHAlHgH1m1S84Z
 u+T7mdDZ3KOohRLXz343ixDWCuWToTctz/u4dm13SKUGknFJfq18+EULZV3adbW1lW2wgegr2U6
 gC1jBwOi3TXuSlq7no3rdbrTy0W3AYLhqDCq7RSNUDesDPkfzL3rV7ip25ZJH2a9B4Y+jrgQmpE
 GhVstesCIitwDjcQPmppKx1jXoBjG8UE9ri9EkdUQeGCuPbP4Gigh4PavWxXoVP/n27n3av0DwT
 PTsoXzO9TTeDJS/mFbMEVpemZB9MAPSVzE1deUihBwNt7a0FOY+zSDK27H4H5LGTN9We//viCc4
 jLnnlbXbnP7TEi/LW4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050063



On 10/04/2026 03:53 pm, Johannes Berg wrote:
> On Thu, 2026-09-24 at 08:10 +0530, Pooventhiran G wrote:
>> A UHR Link Reconfiguration Request frame (ST Preparation or Execution)
>> triggers SMD BSS Transition on the current AP MLD. Userspace needs
>> reporting of the STA's dynamic context along with such frames so that
>> the same can be transported to the target AP MLD for setting up the STA
>> TX and RX queues.
>>
>> Reserve a field in ieee80211_rx_status that enables drivers to attach
>> the STA's dynamic context to the corresponding frame. Since the maximum
>> possible context can grow too big, attach the pointer to the context to
>> the frame. Add handling for UHR ST Preparation and Execution Request
>> frames so that the associated context is propagated through cfg80211 and
>> nl80211 for userspace reporting.
>>
>> Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
>> ---
>>  include/linux/ieee80211-uhr.h | 59 ++++++++++++++++++++++++++
>>  include/net/cfg80211.h        | 13 ++++++
>>  include/net/mac80211.h        | 10 ++++-
>>  net/mac80211/ieee80211_i.h    |  2 +
>>  net/mac80211/rx.c             | 96 +++++++++++++++++++++++++++++--------------
> 
> This change is big due to argument refactoring - better do that
> separately.
> 

Sure, I will split up the patch.

> Also, I think better to combine the whole series a bit differently with
> cfg80211 APIs more isolated and then mac80211 implementation(s)
> 

I will reorder the patches this way.

> One thing I'm missing completely - which is why I was looking for the
> rx.c changes - is handling of 4a substate frame limitations?
> 

I will add the sub-state frame limitations in v3.

> johannes

