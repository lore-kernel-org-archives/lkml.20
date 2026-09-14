Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B564A214A84
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354421; cv=none; b=OKC4l2UfmaBGNwrOe9wQMFVq69dlG3w6lEnEyorboWeBIkDEZ4EqMhdDcc9mXUQYvrIOtSfUUMXWSWdHhl6v7BybV2fJNpFjKA5Gs6e0WS1+acYJnX+tG4QfdodLQbJk5o6fVxFVzDXgHeCCpeqUtsl/M/wP7wagccWcvIsomHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354421; c=relaxed/simple;
	bh=icPOzgcWIvuw0uTvq6ks5737DnbhG56HAut0RUhgDxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGYj+aV0ERNzg9NxLuhj8/vTAvPETdObxKd2Z8Qqhla5Xiz2e6UUyQXYckrPD6XfMAFe2dLhEhOQ5Sj0zbtdvcU0qFkf6PQJ4nk0SHMugBt6C69AVw6r2npbmeAh0fUprPlyuDR11z3e+z6/2EiVp5k+9zjkNd79EN5tQy3WuIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNSopEAl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dixh3/YO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNSopEAl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dixh3/YO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eZ1W4040699
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icPOzgcWIvuw0uTvq6ks5737DnbhG56HAut0RUhgDxM=; b=GNSopEAlHUVgeNFx
	txa5Pxwjvy9uzOTJy2QEngWN/vWQSQOShQuMiDUnngLtLo3mbAR4ymb+KDyXHkke
	LtApvRrypIJFeluklsLGH6Gwc9wOhxt0fpGMAhFAgbxeKkqY2o7999XROjTY50TY
	dyOsAyBtwkyFRyqeqclAU49GjidPs6uq/VSUIQjLE3SfgbE2y1+oPQw4fGiULZjt
	WOFoKMXzwogBMCEQouoalpAEqu5vjz/oUMVUlFWLYodCOQAVl8EKBlo8NaZHEPzV
	gCsp3WNZF9+dGmCczDOgcoOGenrNNTacNsKAndgzbEwi2dI8aTOLZkrtdHTMNo7o
	SFripQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmrp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:53:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d0e306c7d0so6391105ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789354417; x=1789959217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icPOzgcWIvuw0uTvq6ks5737DnbhG56HAut0RUhgDxM=;
        b=dixh3/YOAeuCgOQgRuFfxZ5TfnIJaLc8NnMjcnDtGFbtarkw6fS5t2Yf3gOHplRUo9
         FjVAYbZDD+olh6cj9tCugAAuIODNNQxgeo0JCHAzUx+ri057czFkceJ3JxkPCdZ/2JZ0
         HMXAEo3d+5WJmIakhWGXEWyLb0YfusBcJNBgT4bQDcaOwXSK1ck3fuMgnaLCME/+t95Q
         PEqJ1kr79Zj3e6ebd2rRPzhpUKarqPp5sGUdxisNRP8+DnPt4GzdF4h117DqgWCyECi2
         Z1Q1tGc4yACJZni3IkMgMQ7sn4V74pk/cHI6fmMhXv4DcHEUTegJU6oR2IWivWeGdRt1
         zECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354417; x=1789959217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icPOzgcWIvuw0uTvq6ks5737DnbhG56HAut0RUhgDxM=;
        b=GGpYeq/HlcEY0XX2eBkwe5GQ2qo6K/esTvm59AI5NAx/jGVzPClmJTDsyemQMonrS+
         /0bgNY2H8anZjjaCYc0JGlSNBpb27vEbWXC9XI+jbjCEfmWXfMdk6syAdH/fwcKwNNxY
         W+piiDSLnwJFuntT4nZnxX18lzYLnNtjrtbsmDtY53SgpBqmdW9ihfOTr1C/3INa3oGY
         8cmzfY4hAL5doQvhUj7iR3zIZdPYGf31KMgj7kc3IqBtKVPFjz9HyppU8Q6iZkJCSVX5
         Kv0H9I4E6SyaC4XKk8aEuOggIQNCXf8nPeHpDM8lxkW8sIrqK9vPCL+87o4Ejdr/UZrM
         /Dqw==
X-Forwarded-Encrypted: i=1; AKwUvBxpmX0Rh63vKivHl6FhqVJ5PtuxOKDIwamXCPh+gsO3qpBXxgjbpexU5xGrneVfXXHThrn2DoSaBgQv7pU=@vger.kernel.org
X-Gm-Message-State: AFuF++lViKfwDHkQk7gTD4E3YDBhE0wkPCHeZExI17zpW13UQgIKI7L+
	IllEN40Kv7zp1Yw7NHdOrTPwNqAVVKEX+RBXZQCYUY2Ib2gB9dBGny01Xj+VQYQuwE81Ty3yzOk
	ngi2VAaJNZJ3ETxGseafELGIwu/PV3FjnGFYiBvtJn9g+8EweDwFEMLrUEnJ/b52KvwQ=
X-Gm-Gg: AYBFou3aGc6i2z5Wkeb9jEOanioeaC/AyNT47V08Bg6jNhpQofHFDPRkqHJmuaqxQfC
	zd8QaF2HkF1a4d5yExEQ76lr+JKOa7UpWH5ZEXKvOqmDcaQfU6xX5Gk+aHuorFpnDzmMEnlkmXR
	e37iMZgGI7lukQtHr0dEss5FwLIQFjdmsgDzPGOhTm57hqpZUQjrtXA/mIvgts5+91L2tdqSS34
	58k8dIqPcx8quUGMuCqUD9ph39WqR/508CWBJVBFXT3mWgnNQCdYMfMCOa26NMkUxnjCZqQc/aY
	LlGiMMaTglVgf4HSHwcbuORH6hzs3eqauQT9+s+P/sDFtCwDGujMKjZ6D2/Cf8rtmYrSt/QyiOa
	k+QLb8lK04sdKxxx4fYDwDY2kggmpdMqB07TKabi9hfEh6ea7UV5j5BQ4q339ABYPdQ==
X-Received: by 2002:a17:903:32c8:b0:2db:7799:d2f2 with SMTP id d9443c01a7336-2dd6c6d26dbmr9161975ad.2.1789354417142;
        Sun, 13 Sep 2026 19:53:37 -0700 (PDT)
X-Received: by 2002:a17:903:32c8:b0:2db:7799:d2f2 with SMTP id d9443c01a7336-2dd6c6d26dbmr9161655ad.2.1789354416739;
        Sun, 13 Sep 2026 19:53:36 -0700 (PDT)
Received: from [10.249.22.197] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab37sm4193190a12.11.2026.09.13.19.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 19:53:36 -0700 (PDT)
Message-ID: <6e3de792-85c3-4264-9d1d-cdbb8f6ed025@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:53:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] Bluetooth: btusb: Add support for Qualcomm
 multi-subsystem QCC2072
To: Pauli Virtanen <pav@iki.fi>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
 <20260911-btusb_qcc2072-v5-4-422754f4e938@oss.qualcomm.com>
 <7bfc5ec0438b830386ae2899756bb9a7c4b9e123.camel@iki.fi>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <7bfc5ec0438b830386ae2899756bb9a7c4b9e123.camel@iki.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2GnfTGNa7EGH3R2v2bCP3t86E_AftIEj
X-Proofpoint-ORIG-GUID: 2GnfTGNa7EGH3R2v2bCP3t86E_AftIEj
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa761b2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xph3HbxepIq20FQ0PPUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNyBTYWx0ZWRfX/3ZVMMJYKFCs
 ggfsrdFwJCBKDWTcQ0hHVAmNg/HZNS4y/Vcq74pRL2+VXcunha4cCwKiJG8nJmKLGZgEOEHuWfq
 AyHbPt3vdoby8HxgPF7GdAOGT7Ll/jE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNyBTYWx0ZWRfX175GcF5yfnlf
 Gb7N19baQcdSPR1+xF/LlJ17g7x3hCmutwuie6bNDM8YhWpZbo9fxwdUgTFTay09T/Hv1BcohYY
 k+2Z5r2ZJ3pBlM4s3FFsxvMfYsXEMaPSOJD5lhVbdRWQCNjfLnUePt5+YhLpt8E/178E98zK0o4
 KNulyQnw2L/cQWK7Iz0vbzv3h1CBYGVUX5ve18UiLfog96zQRq/IkkZXAkbKeo16rQM+97JKFn7
 womiLxAYmKKtjJgdAX3hCLVCl6KqH2q+fH1mB62U9MDlzJZtprvg075FYkRyQgEqtK2JlXBMoiW
 fNbV8+zTKDJw8htdeulikRoZoGHQ6ovZvRou5N3jqZcEj0MYIgHn2/G/2ouo9c3JN4XAW53/uOi
 rslPXRscp3AF7RrIYsmMIovGR8tE2beP6xAIGdP05HnB8Zn2tIzFCDNGv2QfrobeNl3c9EFv7Eb
 8zdYOiJXQUNk6USwVIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140037

On 9/12/2026 3:56 AM, Pauli Virtanen wrote:
>> +/*
>> + * btusb_qcom_send_frame - send a frame for BT or PERI
>> + * @hdev: the HCI device
>> + * @skb: the frame to send
>> + *
>> + * Implements hdev->send().
>> + *
>> + * Return: 0 on success, or a negative errno on failure.
>> + */
>> +int btusb_qcom_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
> This one should have __context_unsafe(/* conditional locking */)
> annotation, or no if (need_lock), to avoid warnings on LLVM 23.

Good catch — fixed in v6 (below) by adding the __context_unsafe(/* conditional locking */)
annotation, per your suggestion.

https://lore.kernel.org/all/20260913-btusb_qcc2072-v6-0-137898715844@oss.qualcomm.com
