Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597964052C4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492831; cv=none; b=d3fl+60qsF61f0gGcW9u07BL8xozPXcZBeqfz0eRSGYOtwNeROTa3L+VLQ5kOAkhnMAEB5JASqJxbXj1sI9rkHRHmuiQHE9ys96XNfZ+UqfFTP+lN3hCMp7lgAe4QczqChRwvCbHwnoPswvvW6lVtRWbaYAN+hEHRbRLBuL5Mmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492831; c=relaxed/simple;
	bh=dbvG9K249lCyefMM14BZFhgNNJ3r5ozhGD93sWzhaiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YND/UXMkEZdw8mc6ICjAiMCQGqymfiA9dMA86mgHoNn0zmwcqgrurkj4ngv00r5VByXhNa4ytRSQ8mK+NEirGQqDKgB5EqKXHtil+LgVZmPfsx8YEA1QeQVBTT/7wHwLBbVrbqMFxLSjPIWZvmM3MlKxiCap6UNG4j0MeJ0qx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifTziyLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVyCOEGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifTziyLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVyCOEGJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAQV4813414
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=; b=ifTziyLKh9qzhc1M
	h8KULEL9XrG6sJ2Rxlru+TfiJczyUGqhJ13qjf7svvEAifWQjljbmR47S2Hs37ba
	n/gsT3aNTx7fenoFUw7v8edZuhLjxq/u4FzY6RXGs3geaSXMOxDBbFAzIpgimX+J
	JLOlG0YiSh//NFveu/QvVtQOoYJ0E9JLDWgio2kMxVb6nTyQAlsaEbmHIiyXwzpj
	NA83F6w9ZAw53xoTmE67j5FTiUasg9hygKStaKkM+nbAbYJiE8NX+O74ah0Hm3sQ
	aRFUnezZsufP6L4iwstUQISsY+4g1tutYXa8eJeDeCS7WJKNjFjOFZBOQrjxbuJO
	bodP/Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc1fa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:20:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77969cb40dcso146312137.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789492828; x=1790097628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=SVyCOEGJIBDg2XTkofHZXr/BLJBbWVphhtZcmznloxlpAIaslQQotGI56V9N3YYIVq
         hncVdwhMOEqHKB6KOMAYw09KuAU7kD0RMEiI3G6GGrSrMgnJSnqWU/W6WxjjV65Bsz31
         iga5A7dTyIz5jTiYZGkY9l2nY9nAd8RLTJq0A0StUzeu1BjiHWi7wcOM6v8nASD5RhGY
         Zp50FkTh5fR1xOZtuYk7qmmP4OlTzC8AMwMgUhPv6zqoi7YULd65LX27O6ltvCUzSRvB
         TXm9QvlgwZVeciJ6Cahdt+Ysly2tGjlcqmRWUs+jUwoR9svwaY7dcNMowbIfiZoUFV9R
         oSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492828; x=1790097628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=hk7C9KREgEAXpm3Ps4Bo3PNE2TCVJxPBvhIiIYl1JPvv64Rtmdi/MPvmfW8751T6fM
         z3ohVd1C1yMao/sOvv/Ht/SMnVn49hC6X6WgHf0q5FfJu4P9hqYEo6mRpDE7Z6fWPhoX
         LbnsDFgup7d9V+63xEb7ShIq/BJRCPv+Vh7zYuey3/P3NmKkKZlDupLUcnsclF4MO55U
         XdCHWBgY2n3aXnR7Y+CdERWn5Rckce9SZQ1ZqfKQRpaA0ghbMlTUt5hxrcX9SMwYXuVK
         mzNx9NRGJ55uZDNUVnT69ITMGNrd/ZTWyoYVGIyl8zyo4fV4EwlifMzJXV3b2l58lI3X
         fZFg==
X-Forwarded-Encrypted: i=1; AKwUvBxDoeivuy4yj6y9L0qaW0G1AYDErBk2w5I1rZ5JKzJtOi3YbhBOy1BAUm1scksnpA3b2x7JhwtIX9rRrVo=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Ek1VzJJY0LbqdRvwDkkIvwtl+yYh8bBAgpTVxHJ4MSvmaf6g
	u5N4iU9MeOydL+10N/olMj7SZVdglIYc5U81sZWdjA8sp9uwfbVWiJUj0smQOU5t/JiWZ1fehCE
	U2XrFcTGPdu2r6lSx9ZkDywwWS8AE22URMSMjwjV3zdtN/r9xZeNrmKvopFmBPnWYY+U=
X-Gm-Gg: AYBFou0NYKKLVMlgA4Rl9gfhxkCOpzoyLsfB+gSZzkx9Gtd+GcoDq8c9O7J/zMixuR8
	QwhRugzaVVa98+xgC9pRNirNMgLhIZMg/NRoS3U3cOSrahQW12KEz0F4fVhdylrKGrTr3viNy4+
	F/Gsg3NlHAANWAgknd4ZKZvDyLvR5p+Zff5J71b5kC+cSxniGUl3qKhNEQhhsDSsiHhUbFxr/6t
	ppoxkMr2lBf7LyR0aDwajhkRn7NJWRcPK8Osh54cHhAar0jJCT5tL//q9ePrzL92TZ22ZQp36Ch
	4gx4opSOJO2jqYBAZn3go654hTX4uMsT6fKKI1HNgPIk88r5h5hZymGAM9jawfgqIv0pzmWK+4l
	1H1/95qsS/C2CPC7I37RdVA==
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506277e0c.3.1789492828430;
        Tue, 15 Sep 2026 10:20:28 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506244e0c.3.1789492827984;
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm26023a12.21.2026.09.15.10.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Message-ID: <e55093ff-0441-49f0-9d06-6c100c8107aa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:20:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/22] thunderbolt: Try reading host DROM from device
 tree first
To: Sven Peter <sven@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Joshua Peisach <jpeisach@ubuntu.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfXwsy31opneXtf
 /ZUz87+e6+L453wOkZ6q0LC87f1HoppmEj3bhq3g1tyKAIg3zO45rUc40Qi1ItgqmjjQPUMXvBp
 W8c1Pt/D+2zuS/9jgP6WbIptXseDug8=
X-Proofpoint-GUID: OeN4EsDbFG7vkblaefVUE8LvQCxaMLwM
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa97e5d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=fxJcL_dCAAAA:8 a=i--5ToJz1EgYGg6QIxYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: OeN4EsDbFG7vkblaefVUE8LvQCxaMLwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfX1OSsowt1k3lN
 TmohHvF2xucpauH1TTfnsfN5hjvqacd60w7+H+tlVY841s5LwUdWAIOKgcvqM8N3xHDLXz3jXNs
 IoT0nvDAAa4pKpK8vLtaEvYXVEYXKaTmeVbCTTYRbSe9Zafh5LkvUJqrJYY5zS+zGoD1jMbAPjH
 Oknm99QESzEeA4WEudkyxzSnp/UM0NQZuXQ5yjqprrWdYMdUUH86g/y0SC++VOBQeNEaYKjJ0pO
 A+PGAdpQay+fp2XZCyVOPHybmkpWhLkLhmrtSnYOjn83KMEe6MWNz1bK/dRXDLdDwX/nhvdRK4z
 1L982TnUBVSxidVHw1SthTbScN0pRvlOb1ULwBhT0hiYKfkVId7bQZvBC4OPVr2+a6sRuU11G7l
 JgJk7VuHIQ+ikusZKaNjKAZsKoBbD1pf1DRlqX5JLv9c6OTUtc4ewZFwa+FXNwGDsAYfyyweRRf
 Km+CxmJQKmmuZ8kPbqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150253



On 9/6/26 8:36 PM, Sven Peter wrote:
> On Apple Silicon SoCs the DROM is provided by a device tree property.
> Try reading from that property first.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---

[...]

> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}

I don't know how prevalent this property is in your ecosystem right now,
but generally I believe this would be more fitting as a vendor-neutral
property.

Konrad
