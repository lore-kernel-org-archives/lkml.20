Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422958;
	b=rRGs47UQVKXPkJMRkXwL2/z29xAy8JV7hoke7Dxt7zkU9tYdmuZ8Hk98+HZp0dmweE3y
	 JyzCPgo633tVk+5qtF98oQUt2/57xubQm0KZ4EEvcoECmCHvQweazjthXeGon0Z3Oxf9S
	 jlTGeUNnGhfgGbuB+TZMZdMMDiEtzVE4E+sfXmSXQ45Dt0MwZkmysgbk8UZ3u3SOgVFVt
	 bEBZTuYCAe4OZEpjitYLKi4ti0grY24N65pLixNe86sqPHq7mLCsCNRfhi/TfqBeFm0Lc
	 kPowEI5SlV9oSngJ/OmE4HiLvZ+csbet0WGc+hNlh6C2Gy9HTE9sSFBtS9vaHS0S7LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J4Ga1rbHmKdYQhUZOoaJMNQmLpbXZtVoD3zwv50WgaU=;
	b=hJH1p8LpD5zlEoovfHQzQWzaLnqzNfXNQp1TXYPkaNgEiDI6DWm5x23ubFbr9G04oDMj
	 Hc38Ipzrh0EvuVbGHuIU28tjCJ9lJxqi+k3bBNxXKQyqrKAIZNpJ2qfOHSr4bFt1+/xtq
	 cRf2TKiI0armo6GjlcD8bQxgCX99/jhOb8vXaDTHzhCF93BwSHjbJ8Yjeb68xKkRZbvdP
	 6V6OmAsK9TZGLN7Qwsn8oX7bGVaUJOk2WclZ8j6ZIeQWDb95FtMFL+x4Fzq8cMH0PU/kV
	 tzEQUN/fkhWvNDY+t4Ry15A60cUH5ESlPaKUs9Wutw6Wt31jxBARN/gkltaYe5EtInw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=h5IH7KpR;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="c6//eHVL";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E142606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E142606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=h5IH7KpR;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=c6//eHVL
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYC1E822080
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=J4Ga
	1rbHmKdYQhUZOoaJMNQmLpbXZtVoD3zwv50WgaU=; b=h5IH7KpRpZA1Pz+tX49I
	g8COd6fGJpu/k6rBo1S03wf1FwwLj3VhnvZoD4p5Os/it24PeBCYoGYsWeRpgJ4t
	sQtpXJIMLxoNQDIQSHx24wlfW+yTOgLXx8em9bO0aau5QdptxsXBhaNWVIwQJ0Dp
	UkVVmq++wnjQAewUFCBPZrkXh6wbMhRsO/kS7PWFqJyI0HG59MX6hWKdPAYWjT4P
	5v37iygGYFzcSJ1GdY6aL/2xzLbRm59Q/6eTba8BPb6SiOOMICSbKcd7acUNR4wv
	scqdEQo6xeu6s9AiTl/4/wlOozbqKd+2u9sYY4OA4bi1Vc5ET7o3D+7JKPsXAYIM
	Cw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hvmh5c3kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:11 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f03ea17f4so21421316d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794422950; x=1795027750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4Ga1rbHmKdYQhUZOoaJMNQmLpbXZtVoD3zwv50WgaU=;
        b=c6//eHVLgk/W9TBq9NS1t4NV0FFWWidQzcGU7fJKxIbwRNvqUWTGQ4NaHQq1W9egum
         widPIQbZtOAmRYFshDExSzOByxSqMXNB/MfeIiFpJQIkTAnvGEJSjjC6VzlBh/88In3M
         ETq/fJEGzKGPSF9Xw15ItFY2QUlnnVtH8XrQYkWm/RGS0osSeZ+phor/GT79Hi5GzRXm
         IBJsuyo9iA1/ry47nMd9xjwNou36Q2d9Umr4Cg+Q5Njt2Y3cg5w16tk+oOF/xxpyggvH
         UkcZJ8MBPiHBye/NKAckwfldi6FqQEdRIHv5IXezMytD1WBVcWizEIGzOdmQyM5+MAT1
         39Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422950; x=1795027750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4Ga1rbHmKdYQhUZOoaJMNQmLpbXZtVoD3zwv50WgaU=;
        b=lcvIg44FQ1SUfIUFGP7YLmJMsm4Ec/IyuU7Z7OK6eW0SY0z/i7No/31y4q1Qb82nS4
         7ZoPL4R1hV6RQrr3hGyByW6foUeQ8ExXdJeIHAtn7pneRahk2GTAtYfb/BN5r7J8t8vA
         Lv3OKHUXtRI4LeRAIfiTBZ6pcHTFWxnJsIuWCfBX+/X5qDZjIrnIB91RnK/H//URJKS7
         DAeBD4bx/S5Ll3QPJzA6XLYAy+K6h72V+28BliKunrrpRMq/oqXj4ekEK045gEItCGRY
         4cdXF7UXo4Hjg99tJxNkSPmokR8lXkdhmsfFSi3BQWIeCXS3YpjPUVK3VBZqvBdDU8qF
         +t9g==
X-Forwarded-Encrypted: i=1; AL+hErH7BQ5w6oBtIc1zrDIyiD0fVvctrGy7p+7aPa61ahw1kPZG/FTiPNe2tUdPQXkWJNtAch+0sXRVVMHEqkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HtNIv2llniA3Ho2hJVJ8r+plxpl0mYt3ehyoDOhaAjZdWdQXT
	7fessScMEPZSz7Fy7p+QpdHMLOh3V6089GXQR7wzIC9oYD/3mFqSbDKdeByENaeckC0FLAyv1aG
	dTd3xNmVRycpA2OshXAsGiWGhV95Cw4ajPjAO/OWDg3p/BwgtqvT2o6ie4UWsAQ==
X-Gm-Gg: AYBFou0e6XPSM1JRPFyO3dUx2CuiGMuqKKUyvxiH4+nanHaL+xA1cTFvII67SwKtle9
	kh3H/zx4SrU0vb5f/l8RD3kDkxMGXYevr1sh9SMqsPUwuQcEQMSlDUzhgGY2VHP/SGkba8luSbL
	o6VvqIF98jx0UpItBxRA2YkjJvMAd+2X3R2ZYMxp89IK/CoizlLkpjokBOsA5jEDBrFKT0Li3qH
	FhL9UxOzMzHy9zamiQCdpybqw4twTqT+DhvsEVcfvAQUqle9TSJRWhFoAnlNYz01G7R80jTiN8a
	PC++3UFFFqex82pVKfLgS2su5CwRqe0i1x/1GeTzcc/73OmlXAjtTs0H9/iFc6rHJU9aRV2PDnc
	KuDBlEND/owPDri4yF61GH4fsQhVFkx8f+DTmVMJmAOhLg/uLR1SOxz0aTWCZDlk8xvwZHI7y1i
	r2tv5JXIc124z+dCL3IAOHBA==
X-Received: by 2002:a05:6214:498a:b0:91e:beda:6736 with SMTP id 6a1803df08f44-91f041cf344mr52702406d6.47.1794422950319;
        Wed, 11 Nov 2026 10:49:10 -0800 (PST)
X-Received: by 2002:a05:6214:498a:b0:91e:beda:6736 with SMTP id 6a1803df08f44-91f041cf344mr52701966d6.47.1794422949627;
        Wed, 11 Nov 2026 10:49:09 -0800 (PST)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02ca953bsm29259076d6.26.2026.11.11.10.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:49:09 -0800 (PST)
Message-ID: <92a1dabf-2921-49b1-8565-b758a27c626d@columbia.edu>
Date: Wed, 11 Nov 2026 13:49:08 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scsi: scsi_debug: wrap around the store when zeroing
 a reset zone
To: Damien Le Moal <dlemoal@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Douglas Gilbert <dgilbert@interlog.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110-scsi-debug-zone-reset-v1-0-28cb9184b5ea@columbia.edu>
 <20261110-scsi-debug-zone-reset-v1-1-28cb9184b5ea@columbia.edu>
 <23a6d8be-d4af-4cf9-bf48-8ab7272abc1e@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <23a6d8be-d4af-4cf9-bf48-8ab7272abc1e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfXyJYeh580Ga0T
 KvnLUVa8WyfdUWgNwJqTdN8G+MKytTBUbk20oIwniYfbhXnHw437aTTtR72Nq7JtgBSAngl6dWW
 rh9YAMIvFuo4EnSIer3yY44cpOdJYlWsPGfXvxqL113PdB1xqYAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX+Iwr1cv3/vDW
 XoHLIC/HuZQ9ctWl3xSP+3R2gu2KbRB/DFQ2PSrUp5hNay1q4WfrH40MthhJ7p4cYvEbMUxijKa
 GCsEvesbQrWwa/klmWarzEzgMtlGcnI6jQscttoCuM1c2VNs9wCbe5UiHUx5zZrI6P/XmHRf9ah
 i2NfI44YsQwlnRckB4engJqeUft7wZ/1QP1FJ668d6HWaQDsImTaq1wTEUZo9PfYwGBQWhzC4qy
 r27bFg34NKUg4NZF0L612V4hEksTXfjLwmdGNibydz9eDaDhk1tCc8Bjm+rMQWc5Sn2jos12syq
 bdTaB+JYXNsUbrm9EGmoEpatPobxj2SvnHDa2cMzj/WPFEenmrHewZrbjMw3LoiCpdzcUXFA5nP
 jeZF3L51RebqORZ36V88vf+HDsdcVDNKsuUOhkFm4Z99R76EYhyhAA7ZudHHXLP4meW9iceqlcX
 xYqYkmNH6D4av0GGaLw==
X-Proofpoint-GUID: v2Z8exUvOldt7-eVhr7x0ub_hXPHmF3Q
X-Proofpoint-ORIG-GUID: v2Z8exUvOldt7-eVhr7x0ub_hXPHmF3Q
X-Authority-Analysis: v=2.4 cv=UpD2pOwB c=1 sm=1 tr=0 ts=6af4b8a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=2mWc-iygpTBTY5flB5EA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=10 adultscore=0 suspectscore=0 bulkscore=10
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=10
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110074

On 11/11/26 4:04 AM, Damien Le Moal wrote:
> On 2026/11/11 6:23, Tal Zussman wrote:
>> zbc_rwp_zone() zeroes the blocks of a zone that is reset, using the
>> start of the zone as an offset into the store. With virtual_gb set, the
>> device and its zones can extend past the end of the store, which is
>> only dev_size_mb in size. Writes wrap around in do_device_access(), but
>> the memset() doesn't, so resetting a zone that has been written to can
>> write past the end of the store.
>> 
>> On a device whose fifth zone starts exactly at the end of the store,
>> write to that zone and reset it:
>> 
>>   # modprobe scsi_debug zbc=managed sector_size=4096 dev_size_mb=16 \
>>         virtual_gb=1 zone_size_mb=4
>>   # dd if=/dev/urandom of=/dev/sda bs=1M count=1 seek=16 oflag=direct
>>   # blkzone reset -o 32768 -c 1 /dev/sda
>> 
>> The memset() starts at the first byte past the store, in the guard page
>> after the vmalloc'ed area, for the 1 MiB that was written:
>> 
>> BUG: unable to handle page fault for address: ffffc90002c00000
>> Oops: Oops: 0002 [#1] SMP KASAN NOPTI
>> RIP: 0010:memset_orig+0x33/0xb0
>> RDX: 0000000000100000 RSI: 0000000000000000 RDI: ffffc90002c00000
>> Call Trace:
>>  zbc_rwp_zone+0x1a7/0x2a0 [scsi_debug]
>>  resp_rwp_zone+0x19c/0x450 [scsi_debug]
>>  schedule_resp+0x2dd/0xbc0 [scsi_debug]
>>  scsi_debug_queuecommand+0x1286/0x2950 [scsi_debug]
>>  scsi_queue_rq+0x1d74/0x3200
>>  blk_mq_dispatch_rq_list+0x3ad/0x23c0
>> 
>> The command never completes, so the reset returns EIO to userspace and
>> the device is unusable afterwards.
>> 
>> Zero the blocks in a helper that wraps around at the end of the store,
>> and that stops after one pass over it for a zone that is larger than
>> the store.
>> 
>> Fixes: f0d1cf9378bd ("scsi: scsi_debug: Add ZBC zone commands")
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  drivers/scsi/scsi_debug.c | 26 ++++++++++++++++++++++++--
>>  1 file changed, 24 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
>> index a922c8318a2f..1c27ea0f9b69 100644
>> --- a/drivers/scsi/scsi_debug.c
>> +++ b/drivers/scsi/scsi_debug.c
>> @@ -6612,6 +6612,29 @@ static int resp_finish_zone(struct scsi_cmnd *scp,
>>  	return res;
>>  }
>>  
>> +/*
>> + * Zero the blocks of a zone that is being reset. The store can be smaller
>> + * than the device, so wrap around at its end like do_device_access() does.
>> + */
>> +static void zbc_zero_blocks(struct sdeb_store_info *sip, sector_t lba,
>> +			    sector_t num)
>> +{
>> +	/* One pass over the store zeroes all of it */
>> +	num = min_t(sector_t, num, sdebug_store_sectors);
> 
> Why do you need to do this in a loop?
> You can certainly calculate the total number of blocks that need zeroing and do
> a single memset, no? What am I missing here?

With virtual_gb the device can be bigger than the store, and writes
wrap around, so the reset has to zero wherever the writes actually went,
which isn't always one contiguous range.

For example, with dev_size_mb=10 and zone_size_mb=4 the third zone
covers 8M to 12M, but the store ends at 10M. Writes to the second half
of that zone are done at 0 to 2M, so we need to zero two ranges.

But yes, this can be done without a loop since we have at most two ranges.
I'll switch to two memset() calls in v2, like comp_write_worker() does.
I'll also change the fixes tags as Sashiko suggested.

>> +
>> +	while (num) {
>> +		sector_t block = lba;
>> +		u32 n;
>> +
>> +		block = sector_div(block, sdebug_store_sectors);
>> +		n = min_t(sector_t, num, sdebug_store_sectors - block);
>> +		memset(sip->storep + block * sdebug_sector_size, 0,
>> +		       (size_t)n * sdebug_sector_size);
>> +		lba += n;
>> +		num -= n;
>> +	}
>> +}
>> +
>>  static void zbc_rwp_zone(struct sdebug_dev_info *devip,
>>  			 struct sdeb_zone_state *zsp)
>>  {
>> @@ -6629,8 +6652,7 @@ static void zbc_rwp_zone(struct sdebug_dev_info *devip,
>>  		devip->nr_closed--;
>>  
>>  	if (zsp->z_wp > zsp->z_start)
>> -		memset(sip->storep + zsp->z_start * sdebug_sector_size, 0,
>> -		       (zsp->z_wp - zsp->z_start) * sdebug_sector_size);
>> +		zbc_zero_blocks(sip, zsp->z_start, zsp->z_wp - zsp->z_start);
>>  
>>  	zsp->z_non_seq_resource = false;
>>  	zsp->z_wp = zsp->z_start;
>> 
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
> 

