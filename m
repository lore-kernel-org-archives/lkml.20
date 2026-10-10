Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B335A398
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642027; cv=none; b=VHtSQpOwanPzPzw2+KryQtqIF0UxXacUsO5Ha1cSUOIVj3+8DDYNT5juy/GMjWwNWLsqVQzBT7jsdhRahcerDHDu5YfJ+rVkN9Ug48cGUvXzluaZmszHxiFj2p4CQ79PH3+KEbOUqkcbpJvEL9Zl08vCyVZTblU7hyyIIjOfUDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642027; c=relaxed/simple;
	bh=LgCaoq0Mq7bOoSDD0CneHZ28v5XxRFf2k2HljvJNgic=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RC8R35ezX4ROJNbLFUPaCbioJZj8HqvCOBB+NfYhz7seliDzhlu8+t/3SnFXBnoT50V6wfGS8vIO0Yr8H/Rdi2g3mm9uHpdT0GpnrYwR096jLd7MC711BoLLGeGZwBBJjASXYHbjJE0HWNmCK/x0xqCdppiXEtYyRa8MwDKJaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaTvxilx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoqJ/k3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaTvxilx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoqJ/k3y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUSEd3357748
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oC+rCB55Y+ms9o9sEXz9P3I2QSJAwssjs+A+Zu1eIcY=; b=aaTvxilxZMQj8/Om
	6iUHA5NTX8zkG8NDrpJ3pKq822a+k+ABRfoeSZ1IwluD5n5iiatC7OC5ZzWX+f+A
	PVHYDHwG/hyzooBswj5MUn5Pg8AtcaUL7TaGz5+3j4tnehz2xqLkbHQG8M/2URmr
	ef77SsYAF52z4oWP4ZhPqcyUBJjfLSxvAgR7oYKuVcShXLvgRTTGOQuAtCFf9pQ5
	29Bj/rrGC7b5fdv9kUtU99Y7ngCXdwdxQD+ckEF1ixnjbCN7Uv7YExyiFqoZaJFz
	7LSPmPGvV5fHJO016gvGPsM06Qp/l2qoq1rBT0EQzwVwl3IS/PDKbAUoQEsejBGS
	phyQLw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjh1eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:20:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so1667590eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791642023; x=1792246823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oC+rCB55Y+ms9o9sEXz9P3I2QSJAwssjs+A+Zu1eIcY=;
        b=PoqJ/k3ya5McZ3As695h40QDUGl3Hg1JjsVP8mKW3FsfGptLJvE9v647MG8fmpXECm
         4QSZ0fkP2l3cMsWfqUQLMt1fp/43mZMNVkYUjIWCRJ+3K/AMoHYsTfwL6xk2i5KOukhe
         fh1krbDFnpNmfFy32VZy7quoeD0HTonv3KUqVLGme2aXzDCGMcMg/oWYHkXc5ataz2Sn
         qCO8a1WGcYMRykXxHmHPbsxZhOaAGbPb1V/q81Nscu9V0qRQLCwOxOhsrKACGCTYNQ+v
         3QcXB+nhXrz8TZjl6kzed6OjYNXt2ZV/9/dPX92DLrqr2r9xGNPRIpIXxgI4HEAv1LvH
         lJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642023; x=1792246823;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oC+rCB55Y+ms9o9sEXz9P3I2QSJAwssjs+A+Zu1eIcY=;
        b=Xkug9UN1K4wEHeknrHSmzPIUJUNnByDDePZXN2COe7eA0V9TTeURa+hdhzIUHQFYvQ
         8XjEH5hmI01+HYEJx2yuwUKZY4YKQTgaEtqD9maGdLCZmncE1uhKdbXvpuqgrjnbGh+w
         HdyqompRuO5McnuXblje1ZqMkfEjSeecWwrhWLB8iBBx0WOsOEOjX+Hmb2gmYp6kiarz
         4j0bWGxgB+i3K+Enu5t7jd3TwxWlARtmUBdXXGzAZct47bykBY8tDWxVPLOpcn2hF+pd
         J/gTLOprzKZKFtZ1Fslx0IyjycB4TWdSrWCh4MopYdaG94i12PFz4eJvdzcAZJckWC9S
         pV5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpc1slkimMdgESnOsQLNKV6pOEksPz/YCr0sNmfG4HM5ttxEdkp9mg6KtFb6iOxgNtPEATXcvccGPhrbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx6ucdSxNMTxGuyDBEGvSBcTaecRriY4nGvdL2P6pOxY9XIF/8
	bQD54i66pkdMsi299XhFOK9kN0+1R/a815CMMYFQ/2kg+LkZm69UbGQ4SqHUGXiqRGnTZ4u/G7D
	NEXlG0FdW1wC985T2OLb0+fM9mnt8i5bECzDkUm+HWfkNlMzq2HdJAsZ9Q5RUSy5jFME=
X-Gm-Gg: AYBFou0ivwSJFhIMuaoNrKC/0HuRJnMs0b25SdDp80k1tlOHkN7kvouax4bf/ukaTh5
	beQ4kG4mztwKahyM9O77Th1nOmOGi7KOhwI1B3QQmElienml66SUrmH7667dDYUeLgJfcXRHUbu
	TYRDn8+B6vzf+nJGfP7uh1nezBu1bOUhdJ81fLoerDDOmuzQ8IPPTUWVZuYD+avvb87Rd3+JLjy
	Dtlu434FDP3aZCNNrcf4NOn4kSypH06MYJdo5jP6a8LJbvYFQSY7SrhG4PxguPer76UhwqrYhfR
	5lZ0plWqqOeNmNk14XKD5hFFUa0nNNH5aG/6LCFEHhK5qkxPt5rLRjihVDpkmrWIocKV8ha4+Ya
	Npfj6ui0UA/oCSBGtlFx6cIUP6ydSs/LLwEg/E59f6N7jhIlUvF8oteWU4Q==
X-Received: by 2002:a05:7022:e886:b0:151:8280:2c1a with SMTP id a92af1059eb24-16a630994cdmr7542081c88.42.1791642023028;
        Sat, 10 Oct 2026 07:20:23 -0700 (PDT)
X-Received: by 2002:a05:7022:e886:b0:151:8280:2c1a with SMTP id a92af1059eb24-16a630994cdmr7542034c88.42.1791642022406;
        Sat, 10 Oct 2026 07:20:22 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm14807311c88.20.2026.10.10.07.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 07:20:21 -0700 (PDT)
Message-ID: <a589a7aa-bc52-46fa-9975-a20b6003352e@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 07:20:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] wifi: ath10k: avoid IDR mutation during TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Michal Kazior <michal.kazior@tieto.com>,
        Kalle Valo
 <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <20261003092104.520135-2-yaojiale02@163.com>
 <2e271ffa-99b7-4c1f-9d17-96242a51d22b@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2e271ffa-99b7-4c1f-9d17-96242a51d22b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NyBTYWx0ZWRfX+AcA6MnN/VqX
 IoNrEfOiHPDuuakE+8D4kZFGvnPfus+S6Y9F+KBTyClStfyE29p0D+FAQinRMITjwk2IduhiXe1
 /6d/owl5ZUzyf7pF7TTQl3n4LKXlsongZcT9w/hRnQwQIocJ0Kk8Oa0mEvVGbTvunSMJZd52aa7
 YEiylxwFbVLG8az4k92y3Mkee0D+m3DsoO7I8jJHslQF/2syQpWF6i2NIBVF9qwib/Db9Ez8kpT
 SQhEFfx48IS2/mWsSHs75Eqrd6na8Bh04HN0/Kao9MnIbogTx0Ti7w9I8BYoCjC80OvwLWrEfF5
 j/D6uDX6kJfczsEno6lfwus7/O4cKkfrG//XoPzQGz25c55uJ1OIBF1VrSkkm25F5iFT2D130Pb
 kwAKxXvEEiQzgDBp+NnZKW1eVobKLGgX3k33Z+M5br9pMAf/0T9//phScfO5LXzPuJEt/C6/7Z4
 19NdpLtSbvqLab0b1Zg==
X-Proofpoint-ORIG-GUID: -8283aWpXg5cDDdUo4Bw7AazTgoc6Y0Y
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6aca49a7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Byx-y9mGAAAA:8 a=o4UwFHox3xQ5qkXPmxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: -8283aWpXg5cDDdUo4Bw7AazTgoc6Y0Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NyBTYWx0ZWRfXxm/vpUMnwska
 Ji9MPuOLnIi4kgCUjBiS1VTp1snKds2JnrxUp4q77obg2TdwI0PQJwMDNweLQjT07aosm3p4aU2
 A9lmPLIeRkIxwK9I+cM6Eus/7lPeDaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100057

On 10/9/2026 6:31 PM, Jeff Johnson wrote:
> On 10/3/2026 2:20 AM, Jiale Yao wrote:
>> ath10k_htt_flush_tx_queue() walks pending_tx with idr_for_each().
>> Its callback calls ath10k_txrx_tx_unref(), which removes the current
>> entry from pending_tx through ath10k_htt_tx_free_msdu_id().
>>
>> idr_for_each() keeps radix-tree iterator state across the callback.
>> Removing the current entry can therefore invalidate that state and
>> make the remaining walk unsafe.
>>
>> Use idr_for_each_entry(), which starts a fresh lookup after each
>> callback.  The current entry can then be removed safely, while the
>> following idr_destroy() continues to release the IDR itself.
>>
>> Fixes: 89d6d83565e9 ("ath10k: use idr api for msdu_ids")
>> Signed-off-by: Jiale Yao <yaojiale02@163.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/htt_tx.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> index e46f579d745d..9993c5a2f96c 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> @@ -535,8 +535,13 @@ void ath10k_htt_tx_destroy(struct ath10k_htt *htt)
>>  
>>  static void ath10k_htt_flush_tx_queue(struct ath10k_htt *htt)
>>  {
>> +	struct sk_buff *msdu;
>> +	int msdu_id;
>> +
>>  	ath10k_htc_stop_hl(htt->ar);
>> -	idr_for_each(&htt->pending_tx, ath10k_htt_tx_clean_up_pending, htt->ar);
>> +
>> +	idr_for_each_entry(&htt->pending_tx, msdu, msdu_id)
>> +		ath10k_htt_tx_clean_up_pending(msdu_id, msdu, htt->ar);
> 
> my review agent notes:
> **Actionable issue:** `ath10k_htt_tx_clean_up_pending` retains its old
> `idr_for_each`-callback signature even though it's now called directly:
> 
> ```c
> static int ath10k_htt_tx_clean_up_pending(int msdu_id, void *skb, void *ctx)
> ```
> 
> The `skb` parameter is completely unused inside the function — it's not
> read anywhere. Since this is a `static` function no longer used as a
> callback, the signature should be cleaned up in the same patch:
> 
> - Remove the unused `void *skb` parameter
> - Change `void *ctx` to `struct ath10k *ar`
> - Make the return type `void` (the `return 0` is vestigial)
> 
> As-is, the call site `ath10k_htt_tx_clean_up_pending(msdu_id, msdu, htt->ar)`
> passes `msdu` as a `void *` that the callee silently discards — confusing
> for future readers.

BTW no need to send a new version to address this unless reviewers have other
issues -- I'll make this change when applying the patches to my 'pending' branch

