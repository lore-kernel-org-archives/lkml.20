Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894753932C3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736836; cv=none; b=OdV5nuNcz9OvFB5ldU5UgTI/IvgmMs3fp6cxZpkS9Zo8/Qp512DNsNlrpsf3Z26SYVxkvJxuE8Tkwg/8r1RxwMF1G5n4difO4/BGWCVIreaWAS/uBi2dLCtNxSEGBXn0mlHmVEyXirJOlzBuFPp4kyR+AvR5rL5GsORkvJOiXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736836; c=relaxed/simple;
	bh=fl2r+8a2xtpStWjKAM/CG7r6RFTLhoxGHg3SHqUnoYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itBUj43shvFY2sHcN6F39sTE8giakLOPn7S5iH/9GVKrnOO3xOxO2cvPocOtJd2dueuy5IfOp/vIualkm4seE8Q2c1dJwsmM5vPiPYVQ3tT2FsMaWZ1Vlu5ID4TNOA+sG80MS5MHwaxcLMm3wTORqwn9gVmxH9GhqAKVvSWekEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=RzkDe2OD; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=4aP7qitq; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="RzkDe2OD";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="4aP7qitq"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686MaUol385989
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 19:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=gpMW
	L/Cjdk+ZEFD4AGW7GUSxT7u9SlshyJIxvk3dD0Q=; b=RzkDe2ODxFYQbHqJ2M6t
	7zrTnkYuj95QV99sp1EBt968bZZ9Em39UZxf15ScPwprQwCON/0Un8YoUCMntWhv
	bhjvcYBQ5oYOdxXy9xsZfBTvjPWj6EmtdbpxPLsV+Zqg2uDK79wxzk/roPSFvKdf
	ZnO/iE0kyRJFodtC+HQsgMUeb3YrM9LMi3Y+D3CPIUbFX2ykq6zyemNlUsnyCXHL
	t+OajZL0n6H4Bmk140MIdH1WyxL15OQbz/z/hAgmPgFmYR4A7dh8OEu+tLPxn/aI
	ygw+SZgB8STGktDggDk3xLrhxB4Ac5aGz2jPqGZwttOGCD8Flb20/1YGMFvhZN54
	dA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gh1gs3e03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:20:33 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso269819085a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788736832; x=1789341632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpMWL/Cjdk+ZEFD4AGW7GUSxT7u9SlshyJIxvk3dD0Q=;
        b=4aP7qitqI25J4g1gNUZjM69GBO/Ce30xW08hag8ahtn5/kTEOvXdtt7xq3kqPEk7xq
         ERwwfbm7gFzgsmcytweHf3r+nzIzTyZlXYRiAkEO5K75zU2d7WBxiziw6qt5xamsxyrH
         uoIKJQHxppOv+qQ7UTNJY6IZ2dRUNnP8y2pdsOfOUehWf+TOscvLruFGMNgTicR+z0Ng
         hMyYfKEI/FqtUa35avVljeJ13VIJysHWuQ5YN01OEMWPt+ZRtfdE+++k3MKNj3BC4KUV
         E8IRifeUmqbLYTj1dtqy5zZ94pAP+Z5ma7DJ/7YD9HliytSvnoT8L+S91DzBsFdV0fgU
         2e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788736832; x=1789341632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpMWL/Cjdk+ZEFD4AGW7GUSxT7u9SlshyJIxvk3dD0Q=;
        b=jmHMiaGZ4HLsmVNjiwYrb/RQrqy6qbCW29gG/nYmXYSoQgFvCr/NmOffD0WY5JPwXG
         hBLxVZWiSotEWpTBIFa4Zr/YRcCR6BeYiAMU08g5H/6Y0ojlQ7oaszymNfd4oyigKWHo
         tBYABq9QOzxPni+XLOv75Je7iiDmVZGBiQotSZVxqpa9vU9c/CXAjRw2vYu7eJZyWmGf
         dTGkGKo/fGhAXo7TF0NTEUlwcMteIPycFOmY3JTSxf4y+dy2cGLsplIVR/Sh4vS77Ktm
         XhS7dgDRJ9LCY6lKp2Qi2SmtYjH+hSbtXyxRnYh4G/d7Y5qUvK0le/BhRVVPTIqi8eJ/
         NHFw==
X-Forwarded-Encrypted: i=1; AKwUvBxnH0BwOl0soSqKO7HGIStxVBSCcFmskWp7sJRC+iwPchhmUCIc7kmuXCKH3D4BqtdHNd3P/HCGmGhygRM=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqWfdOc6EcmLUVxgZMKTJPMVjZrpzCxRkJK7Q3MLpoOgGibAR
	MpIA+Hg1YQ4Hw2QBreLfTYmItyCPs185OVV1M8w5If5Rl7qMItP9hH9fGV2Qx/362G1zPitQlD8
	cf/OdMue5pcEKEyHu1FVHTVhSWZ5q8NiwmfrKIKVZnzVZMC8G7vYj3JgSb6V/I4d+SGuGM1d+
X-Gm-Gg: AYBFou0ucKvafDkLv+dG1wy0vEqbk3IiPew2YGhYHd8U8VXBMNKA+mIk5l/RsBFpkAN
	CXiS2GihhPPe/VBo6HSBGoxhAffX9RMiriuhdF/IW8fI1u2hbO/O/k58VP5ZWI4XS/xgnSrJxtV
	XvLyzFnnDWal6KCz3iPM+XZTXLO3X2g3vAPDVStwBpeg7Dlw819p6z4w9/+HfKQvbd1g/F2NHHr
	eYhyD5wvwM/SKUKr+4LShQo6iJdvUasp1152cWfVNSbszyZnWpQf0OT7Cqv9TbYiHex5be5IqmU
	Oaju23PBEfvdM0mXymW1NBqrSG6KL0zkUr91s1Ldg4UmMWqFl4tMqTrzvXfOj91uQczxHSJZkYY
	SsXo5eu0pD960LT0BfrrZWqSmh/E7fsWnu1sN0i0WhTHpYFGyU6+q
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr2077106585a.7.1788736832435;
        Sun, 06 Sep 2026 16:20:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr2077102485a.7.1788736831849;
        Sun, 06 Sep 2026 16:20:31 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9399429b97esm448496785a.29.2026.09.06.16.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 16:20:31 -0700 (PDT)
Message-ID: <ee1e1ce6-123b-4f98-bf1c-ef8e5d892baa@columbia.edu>
Date: Sun, 6 Sep 2026 19:20:30 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] btrfs: rename io_ctl page helpers to folio helpers
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, David Sterba <dsterba@suse.com>,
        Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
 <20260906-btrfs-folio-conversions-v1-10-834b9d7b06f5@columbia.edu>
 <3f82fc56-b621-4d94-9079-b4984dc3823b@gmx.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <3f82fc56-b621-4d94-9079-b4984dc3823b@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VUpngQsAkKLMoecTKF5WonwYSHRHUkEu
X-Authority-Analysis: v=2.4 cv=HbQkiCE8 c=1 sm=1 tr=0 ts=6a9df541 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=D8pdrquyRDvW2m9hvRsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI2MyBTYWx0ZWRfXyTeNMW7X/dod
 MCV4LZpmkbCFkWhcESmqtq8dCiDvbjsHozfaU/cC8D/+rUnYCx8VXrU3Ji721M9tqjLViAJPH6i
 GbLkfmsnYnZW73mv+ynSoacOd2RYiqPZ2AO826SOSCOj+i8ZeZ2G
X-Proofpoint-ORIG-GUID: VUpngQsAkKLMoecTKF5WonwYSHRHUkEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI2MyBTYWx0ZWRfXxXbf3OCLVa0H
 FMrRXixl40FJ/pb3e8c2QJNqQROnObD8CP6frbR30PpeZfGbfNlTVV7HKsWLoep/TeuiaaUanuO
 8nSFYyWHumkbJUPYwtVVgMhmJ7Z2l+lW4IpxCnVFXhL0QqfAp63Ks2iYeXfOrp/0y50Ma56DHwI
 KUdrEbckn4Gvu2HkrqiOSJrVMnBpbp3c0G8H8SSzHFIevkonZrtoDC4Ej+ngotXr0KzYmKsgxj3
 8B17h+2mC64HqbkQZtgE+Ox0d/F2BKovL1E3ECA/d/Z2eybzl65JiaT2L+VuvmWw1sHY7b49thL
 yBS/1lqhJ8O8g8Djz3S59EAwAMxlpLx+S/UNd3zsxYY+U+pL5Bg2dy4vuNtq7Fg6kwXBGT6rcPC
 vHK12gXx3cXOnXke9rXmpjZhJdnaLwrO1tC//EjlFiBrRnWKO/vnqirhi54m3uImQYlmQlgezqI
 6mhSzeUTW84MqC833TQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=10
 priorityscore=1501 impostorscore=10 clxscore=1015 suspectscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060263

On 9/7/26 2:12 AM, Qu Wenruo wrote:
> 在 2026/9/7 07:59, Tal Zussman 写道:
>> These functions now operate on folios. Rename them and update comments
>> accordingly.
> 
> Again, v1 space cache is fully disabled since commit 545e560a5b0f
> ("btrfs: disable v1 space cache"), it would make more sense to remove
> those functions other than doing a rename for codes that we're going to
> remove anyway.
> 

No problem, I can drop this and patch 8. I wasn't sure what the removal
timeline looked like and wanted to keep things consistent.

>> 
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>   fs/btrfs/free-space-cache.c | 78 ++++++++++++++++++++++-----------------------
>>   1 file changed, 39 insertions(+), 39 deletions(-)
>> 
>> diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
>> index ab933ee6f19c..73cfc1d1a5c1 100644
>> --- a/fs/btrfs/free-space-cache.c
>> +++ b/fs/btrfs/free-space-cache.c
>> @@ -406,7 +406,7 @@ static void io_ctl_free(struct btrfs_io_ctl *io_ctl)
>>   	io_ctl->folios = NULL;
>>   }
>>   
>> -static void io_ctl_unmap_page(struct btrfs_io_ctl *io_ctl)
>> +static void io_ctl_unmap_folio(struct btrfs_io_ctl *io_ctl)
>>   {
>>   	if (io_ctl->cur) {
>>   		io_ctl->cur = NULL;
>> @@ -414,7 +414,7 @@ static void io_ctl_unmap_page(struct btrfs_io_ctl *io_ctl)
>>   	}
>>   }
>>   
>> -static void io_ctl_map_page(struct btrfs_io_ctl *io_ctl, int clear)
>> +static void io_ctl_map_folio(struct btrfs_io_ctl *io_ctl, int clear)
>>   {
>>   	ASSERT(io_ctl->index < io_ctl->num_folios);
>>   	io_ctl->folio = io_ctl->folios[io_ctl->index++];
>> @@ -425,11 +425,11 @@ static void io_ctl_map_page(struct btrfs_io_ctl *io_ctl, int clear)
>>   		clear_page(io_ctl->cur);
>>   }
>>   
>> -static void io_ctl_drop_pages(struct btrfs_io_ctl *io_ctl)
>> +static void io_ctl_drop_folios(struct btrfs_io_ctl *io_ctl)
>>   {
>>   	int i;
>>   
>> -	io_ctl_unmap_page(io_ctl);
>> +	io_ctl_unmap_folio(io_ctl);
>>   
>>   	for (i = 0; i < io_ctl->num_folios; i++) {
>>   		if (io_ctl->folios[i]) {
>> @@ -439,7 +439,7 @@ static void io_ctl_drop_pages(struct btrfs_io_ctl *io_ctl)
>>   	}
>>   }
>>   
>> -static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>> +static int io_ctl_prepare_folios(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>   {
>>   	struct folio *folio;
>>   	struct inode *inode = io_ctl->inode;
>> @@ -453,7 +453,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>   					    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
>>   					    mask);
>>   		if (IS_ERR(folio)) {
>> -			io_ctl_drop_pages(io_ctl);
>> +			io_ctl_drop_folios(io_ctl);
>>   			return PTR_ERR(folio);
>>   		}
>>   
>> @@ -461,7 +461,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>   		if (ret < 0) {
>>   			folio_unlock(folio);
>>   			folio_put(folio);
>> -			io_ctl_drop_pages(io_ctl);
>> +			io_ctl_drop_folios(io_ctl);
>>   			return ret;
>>   		}
>>   
>> @@ -472,13 +472,13 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>   			if (folio->mapping != inode->i_mapping) {
>>   				btrfs_err(BTRFS_I(inode)->root->fs_info,
>>   					  "free space cache page truncated");
>> -				io_ctl_drop_pages(io_ctl);
>> +				io_ctl_drop_folios(io_ctl);
>>   				return -EIO;
>>   			}
>>   			if (!folio_test_uptodate(folio)) {
>>   				btrfs_err(BTRFS_I(inode)->root->fs_info,
>>   					   "error reading free space cache");
>> -				io_ctl_drop_pages(io_ctl);
>> +				io_ctl_drop_folios(io_ctl);
>>   				return -EIO;
>>   			}
>>   		}
>> @@ -492,7 +492,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>   
>>   static void io_ctl_set_generation(struct btrfs_io_ctl *io_ctl, u64 generation)
>>   {
>> -	io_ctl_map_page(io_ctl, 1);
>> +	io_ctl_map_folio(io_ctl, 1);
>>   
>>   	/*
>>   	 * Skip the csum areas.  If we don't check crcs then we just have a
>> @@ -521,7 +521,7 @@ static int io_ctl_check_generation(struct btrfs_io_ctl *io_ctl, u64 generation)
>>   		btrfs_err_rl(io_ctl->fs_info,
>>   			"space cache generation (%llu) does not match inode (%llu)",
>>   				cache_gen, generation);
>> -		io_ctl_unmap_page(io_ctl);
>> +		io_ctl_unmap_folio(io_ctl);
>>   		return -EIO;
>>   	}
>>   	io_ctl->cur += sizeof(u64);
>> @@ -539,7 +539,7 @@ static void io_ctl_set_crc(struct btrfs_io_ctl *io_ctl, int index)
>>   
>>   	crc = crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
>>   	btrfs_crc32c_final(crc, (u8 *)&crc);
>> -	io_ctl_unmap_page(io_ctl);
>> +	io_ctl_unmap_folio(io_ctl);
>>   	tmp = folio_address(io_ctl->folios[0]);
>>   	tmp += index;
>>   	*tmp = crc;
>> @@ -561,13 +561,13 @@ static int io_ctl_check_crc(struct btrfs_io_ctl *io_ctl, int index)
>>   	tmp += index;
>>   	val = *tmp;
>>   
>> -	io_ctl_map_page(io_ctl, 0);
>> +	io_ctl_map_folio(io_ctl, 0);
>>   	crc = crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
>>   	btrfs_crc32c_final(crc, (u8 *)&crc);
>>   	if (val != crc) {
>>   		btrfs_err_rl(io_ctl->fs_info,
>>   			"csum mismatch on free space cache");
>> -		io_ctl_unmap_page(io_ctl);
>> +		io_ctl_unmap_folio(io_ctl);
>>   		return -EIO;
>>   	}
>>   
>> @@ -595,12 +595,12 @@ static int io_ctl_add_entry(struct btrfs_io_ctl *io_ctl, u64 offset, u64 bytes,
>>   
>>   	io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>   
>> -	/* No more pages to map */
>> +	/* No more folios to map */
>>   	if (io_ctl->index >= io_ctl->num_folios)
>>   		return 0;
>>   
>> -	/* map the next page */
>> -	io_ctl_map_page(io_ctl, 1);
>> +	/* map the next folio */
>> +	io_ctl_map_folio(io_ctl, 1);
>>   	return 0;
>>   }
>>   
>> @@ -610,24 +610,24 @@ static int io_ctl_add_bitmap(struct btrfs_io_ctl *io_ctl, void *bitmap)
>>   		return -ENOSPC;
>>   
>>   	/*
>> -	 * If we aren't at the start of the current page, unmap this one and
>> +	 * If we aren't at the start of the current folio, unmap this one and
>>   	 * map the next one if there is any left.
>>   	 */
>>   	if (io_ctl->cur != io_ctl->orig) {
>>   		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>   		if (io_ctl->index >= io_ctl->num_folios)
>>   			return -ENOSPC;
>> -		io_ctl_map_page(io_ctl, 0);
>> +		io_ctl_map_folio(io_ctl, 0);
>>   	}
>>   
>>   	copy_page(io_ctl->cur, bitmap);
>>   	io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>   	if (io_ctl->index < io_ctl->num_folios)
>> -		io_ctl_map_page(io_ctl, 0);
>> +		io_ctl_map_folio(io_ctl, 0);
>>   	return 0;
>>   }
>>   
>> -static void io_ctl_zero_remaining_pages(struct btrfs_io_ctl *io_ctl)
>> +static void io_ctl_zero_remaining_folios(struct btrfs_io_ctl *io_ctl)
>>   {
>>   	/*
>>   	 * If we're not on the boundary we know we've modified the page and we
>> @@ -636,10 +636,10 @@ static void io_ctl_zero_remaining_pages(struct btrfs_io_ctl *io_ctl)
>>   	if (io_ctl->cur != io_ctl->orig)
>>   		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>   	else
>> -		io_ctl_unmap_page(io_ctl);
>> +		io_ctl_unmap_folio(io_ctl);
>>   
>>   	while (io_ctl->index < io_ctl->num_folios) {
>> -		io_ctl_map_page(io_ctl, 1);
>> +		io_ctl_map_folio(io_ctl, 1);
>>   		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>   	}
>>   }
>> @@ -666,7 +666,7 @@ static int io_ctl_read_entry(struct btrfs_io_ctl *io_ctl,
>>   	if (io_ctl->size >= sizeof(struct btrfs_free_space_entry))
>>   		return 0;
>>   
>> -	io_ctl_unmap_page(io_ctl);
>> +	io_ctl_unmap_folio(io_ctl);
>>   
>>   	return 0;
>>   }
>> @@ -681,7 +681,7 @@ static int io_ctl_read_bitmap(struct btrfs_io_ctl *io_ctl,
>>   		return ret;
>>   
>>   	copy_page(entry->bitmap, io_ctl->cur);
>> -	io_ctl_unmap_page(io_ctl);
>> +	io_ctl_unmap_folio(io_ctl);
>>   
>>   	return 0;
>>   }
>> @@ -797,7 +797,7 @@ static int __load_free_space_cache(struct btrfs_root *root, struct inode *inode,
>>   
>>   	readahead_cache(inode);
>>   
>> -	ret = io_ctl_prepare_pages(&io_ctl, true);
>> +	ret = io_ctl_prepare_folios(&io_ctl, true);
>>   	if (ret)
>>   		goto out;
>>   
>> @@ -869,7 +869,7 @@ static int __load_free_space_cache(struct btrfs_root *root, struct inode *inode,
>>   		num_entries--;
>>   	}
>>   
>> -	io_ctl_unmap_page(&io_ctl);
>> +	io_ctl_unmap_folio(&io_ctl);
>>   
>>   	/*
>>   	 * We add the bitmaps at the end of the entries in order that
>> @@ -882,13 +882,13 @@ static int __load_free_space_cache(struct btrfs_root *root, struct inode *inode,
>>   			goto free_cache;
>>   	}
>>   
>> -	io_ctl_drop_pages(&io_ctl);
>> +	io_ctl_drop_folios(&io_ctl);
>>   	ret = 1;
>>   out:
>>   	io_ctl_free(&io_ctl);
>>   	return ret;
>>   free_cache:
>> -	io_ctl_drop_pages(&io_ctl);
>> +	io_ctl_drop_folios(&io_ctl);
>>   
>>   	spin_lock(&ctl->tree_lock);
>>   	__btrfs_remove_free_space_cache(ctl);
>> @@ -1280,7 +1280,7 @@ cleanup_write_cache_enospc(struct inode *inode,
>>   			   struct btrfs_io_ctl *io_ctl,
>>   			   struct extent_state **cached_state)
>>   {
>> -	io_ctl_drop_pages(io_ctl);
>> +	io_ctl_drop_folios(io_ctl);
>>   	btrfs_unlock_extent(&BTRFS_I(inode)->io_tree, 0, i_size_read(inode) - 1,
>>   			    cached_state);
>>   }
>> @@ -1297,7 +1297,7 @@ static int __btrfs_wait_cache_io(struct btrfs_root *root,
>>   	if (!inode)
>>   		return 0;
>>   
>> -	/* Flush the dirty pages in the cache file. */
>> +	/* Flush the dirty folios in the cache file. */
>>   	ret = flush_dirty_cache(inode);
>>   	if (ret)
>>   		goto out;
>> @@ -1402,8 +1402,8 @@ static int __btrfs_write_out_cache(struct inode *inode,
>>   		spin_unlock(&block_group->lock);
>>   	}
>>   
>> -	/* Lock all pages first so we can lock the extent safely. */
>> -	ret = io_ctl_prepare_pages(io_ctl, false);
>> +	/* Lock all folios first so we can lock the extent safely. */
>> +	ret = io_ctl_prepare_folios(io_ctl, false);
>>   	if (ret)
>>   		goto out_unlock;
>>   
>> @@ -1443,10 +1443,10 @@ static int __btrfs_write_out_cache(struct inode *inode,
>>   	if (ret)
>>   		goto out_nospc;
>>   
>> -	/* Zero out the rest of the pages just to make sure */
>> -	io_ctl_zero_remaining_pages(io_ctl);
>> +	/* Zero out the rest of the folios just to make sure */
>> +	io_ctl_zero_remaining_folios(io_ctl);
>>   
>> -	/* Everything is written out, now we dirty the pages in the file. */
>> +	/* Everything is written out, now we dirty the folios in the file. */
>>   	i_size = i_size_read(inode);
>>   	for (int i = 0; i < round_up(i_size, PAGE_SIZE) / PAGE_SIZE; i++) {
>>   		u64 dirty_start = i * PAGE_SIZE;
>> @@ -1461,17 +1461,17 @@ static int __btrfs_write_out_cache(struct inode *inode,
>>   	if (block_group->flags & BTRFS_BLOCK_GROUP_DATA)
>>   		up_write(&block_group->data_rwsem);
>>   	/*
>> -	 * Release the pages and unlock the extent, we will flush
>> +	 * Release the folios and unlock the extent, we will flush
>>   	 * them out later
>>   	 */
>> -	io_ctl_drop_pages(io_ctl);
>> +	io_ctl_drop_folios(io_ctl);
>>   	io_ctl_free(io_ctl);
>>   
>>   	btrfs_unlock_extent(&BTRFS_I(inode)->io_tree, 0, i_size_read(inode) - 1,
>>   			    &cached_state);
>>   
>>   	/*
>> -	 * at this point the pages are under IO and we're happy,
>> +	 * at this point the folios are under IO and we're happy,
>>   	 * The caller is responsible for waiting on them and updating
>>   	 * the cache and the inode
>>   	 */
>> 
> 

