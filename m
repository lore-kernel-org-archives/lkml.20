Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9E38BF75
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975062; cv=none; b=kQQov408OFXdzV4klQTxDNjqiuXE72dNDUWq7HzoBGL1E2Gxsrz9tS//oOASzWsOAU+BnaLI5SEsvkOOE+ZLfBbaOkBioJTxhqFACsMm0OQZMeYWPU1R3HfheuPmLYsBppCDOLD1b13Bgklrwnr8GXM+o3vOXpxegWV1oea/q0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975062; c=relaxed/simple;
	bh=7wgB8LKz5jCOpkcEQsOMXq5SneV0WqtBZHXILSLMHtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGMFL3E9HVREpplm7n5WFUbVprKXn/yeS3QMrPnDXJAfo7nSDAoXyD0SmRVnwqE5fAP5MOBQXvV7BSnVkfxZyLfgZ/cFwchM+1gn62xlvoY4VLu85cGlBr1r7G+Fj+Kynhv1qpNQKOkCtqYjpH60qgWKQs/kN7cUkZrlnzebYSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KoQ37XJb; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=wrbId78m; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KoQ37XJb";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="wrbId78m"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689HSA19676238
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=AAj9
	+Q3qh/LD3sL2Z6dNf/Zk4ftasodLwoHwWP4PwsA=; b=KoQ37XJbw+9Ia8qZX3Y3
	Gxy4sFAbira3lDq+/ja28WTMAB8meJ0Ji7DP4hG5H66c+C2HJLUHEWiNJUP76+da
	9v0k7B5zZTNKhGROzKTB8QwJGpt2S3xrgeBZ93CZD/HLD4+Sv5Eu8pXQ81+kiRCt
	zrheAdat9HhucfbOevAwg4rn+3aIDW6XkZ04yx8uoFNl2ELJyTcE51TGmNI65r3V
	hGiDcPk3Caj5bMRk4Jq+P9z7cNZ8RgSj6zCw7fmDLz1cRhFvWZFMBbIHoMTwaGwi
	dQPXXhbypgVJ0H4b//bnjB4qbmnhVraVf1X7sgBTgkm76hRapk9RXYPeNYqlZdIG
	mA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gk4k9c4s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:30:58 -0400 (EDT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so122201987b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788975058; x=1789579858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAj9+Q3qh/LD3sL2Z6dNf/Zk4ftasodLwoHwWP4PwsA=;
        b=wrbId78mZxEbbjDfx7XM18bBXo1EGvDG5j6/2Th/kVwbi9uVB381q8TTnbPB38cdsv
         Zoi8/ixyRcIAWyiVFF5YIGBXR3i8/M874vV8rBLAEX5d5mTk2Sl2+JhjR9uyKU53JgB6
         CFrlGwOqUii4si9pdrdWStV9te/cXCO6XGZvra63KzMamGPOgXaPMzt7hfW4EYa+wNf3
         N5JVXqjDq70syeFg3k/u+O+9XRno6WjmgNj02Ul5z5Y76jT/jtqVJIk1bC0BmafGex3a
         +HU5k2unLyLjDQoCZECOGhZaYpvL1nDpTfoaWeD9pPdGm2bITwWSnkoHKqNZecxnt/F0
         vfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975058; x=1789579858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAj9+Q3qh/LD3sL2Z6dNf/Zk4ftasodLwoHwWP4PwsA=;
        b=a/wxKiYy9x7cGDw+Yx0p8DGmut9D3YVoiTc0Z1gJDl/2EcQWJaD+ppgxr6jOh7od69
         bxv1Gv99WlVcxs4PLEtE1/NsAdJhYOOu73zrYa6wSXdDeJEwUDqnbI13UYGrEp0hPckZ
         sZgNIxeFgjWUUFi5OVbzDGjI8nR7AyejdTunSz5nM7CK2E+Lzfmy7VEpmGhbs7PCza1G
         yxOZQBT0r6WwB9C0qk1x5CTP6wQMdl4g7wL/j4pchgYt2yXlpY/kY3k8srZIil1E6wlc
         93S/JKCuklarxcwt9tZiKjqMRPtUwQNHPhO3qUqdePM1qaKU4nLJ/eljZiEd1EhhLFF3
         v9Tw==
X-Forwarded-Encrypted: i=1; AKwUvByJA19BamFgzkGhCTc5oWzGcJqRGrTT5sdKumknzFW5tjtecEz5jEO3AfK+DWoj8SUcklSoOr6stMSu9Ls=@vger.kernel.org
X-Gm-Message-State: AFuF++mUyTAf8k6Eo0lKCi4OmjgldLDM+HnUS7+UHIGIZXG7s+QI+IOf
	38PiRqXoe8FadCotOEiQEoYr+4rW2XiqyeoXBY2u6+lCWGyrYrISjeFgq8VhC+ygUR6AYvEY8zO
	vt0ypcZ7FwtgCphgDQO2uwYO71ELrAu+m4bMBnbAL9hK2Zi+T6p+4JKD/X9V+1A==
X-Gm-Gg: AYBFou210jRnOoykyIbsFHFrTRhSAPHpXQBo2otHsORpUuoFmEHV3wyU7uL0o6g8mNK
	2Eh5QgOlsGs1U0wogAt5riQwaryV1Cg+QOra31aMJcatSvLcUvFpQ+gPfvUWIobqTDoRVhLeh0R
	objIupYO0VSxbPz2yFghl1W/L12on2qkVyZmCM9VNTPKlXvbOmwVdTftPQ4msTIC7W6bo0ADt9f
	5xVKcn+7Kxbog1/r7MlQT3TjsGjVrZr3JRfU9ZOYSOucSp8IO6lRavJisvcuFwVYCCBkv+vVXLp
	up888hD24fifT+Ti+QktEOlTmdwdRNowNhOFC/Zs8WzcAOkBquNKqafdtnaSZXpF0KJSQDpEoAr
	0QMJusRlRy/Jv+hgvInP8/5S2PJqoncbzE+Wts454mOe/cjsL24wZ
X-Received: by 2002:a05:690e:201a:b0:66f:c1bc:c08f with SMTP id 956f58d0204a3-66fc1bcc8dfmr8361866d50.87.1788975055714;
        Wed, 09 Sep 2026 10:30:55 -0700 (PDT)
X-Received: by 2002:a05:690e:201a:b0:66f:c1bc:c08f with SMTP id 956f58d0204a3-66fc1bcc8dfmr8361429d50.87.1788975054060;
        Wed, 09 Sep 2026 10:30:54 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067b099sm149064586d6.28.2026.09.09.10.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:30:53 -0700 (PDT)
Message-ID: <69c5a700-c509-42aa-a308-0a4ed70e0dc1@columbia.edu>
Date: Wed, 9 Sep 2026 13:30:52 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] btrfs: convert some struct page users to folios
To: dsterba@suse.cz
Cc: Qu Wenruo <wqu@suse.com>, David Sterba <dsterba@suse.com>,
        Chris Mason <mason@kernel.org>,
        "Matthew Wilcox (Oracle)"
 <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
 <f4a415f9-1e3a-4b26-a2a4-61bcc98eb39f@suse.com>
 <20260909140351.GL9053@suse.cz>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260909140351.GL9053@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5NCBTYWx0ZWRfX3heT4omuqILT
 xLyxwYg6bsIBRjs++s1bZx5AiwhyR8xJeRrwxNBWeB7bG3jU/bJ5Zv6PaqLT+ebGFYQJbuUh+uL
 3ge9jc5Z/hAjM2Ap6KZJQqTxJgICjl/UEPZq4hvISPyTDlHlnuTi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5NCBTYWx0ZWRfX+lG1+zv1eOPA
 MHC96a1Ajuxi2nFtEzu7a/kseYkFYH4T+6YmSC1kmFSdaQO7cL2H7iJe1ltiuPTf3/OiO1YHGLx
 PkiBRMaYl4hin8yhRfhQr2b2ktS4ytH+d5X1HDEtveLF3BwZ+6M+JagZ+WFUxAVNRTQF4Eiu6uD
 E5UxjWka+92u3oZ2NEw59rzmRcGw+66cmlcN9iIgNjnn94rpa7o5V5aXZu0oCLrmkDzAi3eVbfj
 RYgtCunuv/VfJ7ZvflH4Bz800g8xmQHiJ2Ux/FyolnghmCwdfW5M4N8BRLFX5wWxKmIZNusyhLZ
 EkFuQdyHlf+tkWQf43IAJdmDMxHlzImCttqc8iWbWA4uMlmVjhA+Y+oUBSLfCizs45VcQwtH35Y
 u7Yr3q6Izb4S1QEbuaeJXPTgpqU1zjySDHxf3MuEog6zEHFTjBepYNo53/XUIFWcHirG7YKvmCz
 K3DcawYEjp9lvFmCDcw==
X-Authority-Analysis: v=2.4 cv=QOtYgALL c=1 sm=1 tr=0 ts=6aa197d2 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=VwQbUJbxAAAA:8 a=5BRWRVQc9f5d6B_jiFgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: 1fj0BWoVHI1447zUSk6swEfTZV0Sfsf_
X-Proofpoint-GUID: 1fj0BWoVHI1447zUSk6swEfTZV0Sfsf_
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=10 lowpriorityscore=10 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 bulkscore=10 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090194

On 9/9/26 5:03 PM, David Sterba wrote:
> On Wed, Sep 09, 2026 at 03:40:47PM +0930, Qu Wenruo wrote:
>> 
>> 
>> 在 2026/9/8 05:49, Tal Zussman 写道:
>> > This series converts three areas of btrfs that still use struct page:
>> > 
>> > 1. The extent-io tests. test_find_delalloc() uses the page APIs, and the
>> >     extent buffer memory checks assume one page per folio.
>> > 
>> > 2. Compression. btrfs_compr_pool_scan() walks the folio pool as struct
>> >     page, the last use of page->lru in btrfs, and the heuristic sampler
>> >     is the last caller of find_get_page().
>> > 
>> > 3. Super block reads. btrfs_read_disk_super() and the zoned super block
>> >     log comparison are the last page cache lookups by page in btrfs.
>> > 
>> > Tested with KASAN, lockdep, DEBUG_VM and the btrfs selftests enabled.
>> > xfstests' compress group under compress=zstd and the btrfs group both
>> > pass.
>> 
>> Now pushed to for-next branch.
> 
> Tal, please send the cast removal I asked for in patch 5 separately. Thanks.
> 

Done: https://lore.kernel.org/linux-btrfs/20260909-btrfs-heuristic-u64-index-v1-1-8606b3c89807@columbia.edu/T/#u
