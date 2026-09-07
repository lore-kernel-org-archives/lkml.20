Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B0919644B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742713; cv=none; b=ZbVeKHhNatp0GlIut73BddPpMiRTFgxNvtErHEqpfNB6kijZLjWwBeVM5TDJg/f614GGOAOtt+1GGvnMJTQsT0axawzYS2gRUuj4CL4Ec5L60idqPAf0SRG4rw/UKTvGABIQjeHC4F6lwEE9rCPXnxZgzGtXb/7HHAPQ1Tq4UHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742713; c=relaxed/simple;
	bh=+kF1yGBNRDZ5yZTJZiQkov4/yAZ0AolojLlu5FiqQ1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2r68BF+bddYhueEWjewg8KjBqwTlOAeIrLibiivDdmDeCTYf+nwFztrzoEb/PawKq6eYz3xO/FQPE5YXmW9GbPxHXJ3IiiJT5QDgrqYE5tmo0Qdd0xpty8fnrOE2QLA2YwYWIewPxQHGAc5uPhX9CHhxCoxqs3V7AXLDThP2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=prXyj9ns; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KD6dpEOA; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="prXyj9ns";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KD6dpEOA"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6870cjLS1361048
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 20:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KcXG
	YtUIwF5Or/l7KChNhyD2RuvfOjRJMWTdTN5AEIM=; b=prXyj9nsU1fFjQrHlArO
	MvkFGxjHNzpXIokGq+nbN7wW5gY6gM9VFj849owjTEySBNpNdL4z/dsqATOt/Pbo
	Egr46IXmNLjSHcH4iBkEiJcqXXgSNjYzqEKWa7usyrZ2l0PRKJ9/b10OZ3GndrBD
	Ov92RyhP7OA2IUvRy/+uERdVTxUQ3ZL6u4ptS4YEF9j7/FjoH66uBm28MAMQuM8O
	bVIJsGdjxRm0RTvDyu4qTUVpAhjRBTDGW0S+K/Z+QmAjc4rai6lcbJSkwsD2kKin
	8QktMJeqzaozfQg28K3ci3ArSACAC4kVG/Eag2bz502pVngOkD/rM3TBkLtFwexC
	yA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gh42tubaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:58:28 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so26299061cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 17:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788742708; x=1789347508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcXGYtUIwF5Or/l7KChNhyD2RuvfOjRJMWTdTN5AEIM=;
        b=KD6dpEOAS/gBM3cSIVY6i/neOcbFcH8XtMOTlppbVejgRGFtv/UEA/2Ko2P+RaexMW
         6l05RUbHlqj39TmGqEZaocZ36U2WbNAUFt+2uP/uqSVdqvvPoJAAT209eufptMO4He/o
         7HHYrOJmAw9iRYSsGwENVPWYkjhe1GLWBn4eS8nRK1B+/iMy+I+uvR4I2LkhScveDwUH
         Uiterh8rtwgfZEOQz1my4Gf6S0V8vSUcKcErEAhzXXu4POd/OUuHRAKFlMSACUtCDF5P
         cSqSMeINZ2xJYM4EzfVnrm+/1/i7dxKK0ZyP/XEyfHUy/eB1ua0xn7Z8nZ5pXgHTbTZz
         L+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742708; x=1789347508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcXGYtUIwF5Or/l7KChNhyD2RuvfOjRJMWTdTN5AEIM=;
        b=aeGBQQqR1/TP8gIWC1MBq38G0avZUpWuDgvCchxjHvqBCdE7TS8W91NmmrRwM4Hul9
         bnUw9FHGQVKBDuHxdklRM6e/bpa0tmmF12zHTU90zkc3oL2tkknZk6xvpkpNMJRqzhXv
         Rgv9XR062sTs74lgIWAFwihLIUz3dFnei3XmEP2JtCOjPNmlKQ//YkkrmPje1vF+eXao
         TUUpJBslHW/iAAELvbiLakjpXytLEBDMH2piSjmrCZJ/31LKXk1vRrqdwBQbGkiofYfc
         ITY6Hnnl4rDdy+yBMHMdIMI1ioFfolZHlaf8SyUWSZp1UrIFY7Uq9MBeWLfb86TGrbzE
         /WIA==
X-Forwarded-Encrypted: i=1; AKwUvBxVBh/sMyyFt1tDySijYoGmvYzSRGGDtngM4gG+WtFfRtY4o1wBM8EmgES6YIh1OHPHEYTqlNi73rDLwuY=@vger.kernel.org
X-Gm-Message-State: AFuF++mCvSlAdZiYwXjnMYXVqMqrntIuafameGAyxcHPiint8PexbVZD
	Mh9AeAS83W03Tb46W86TqvrleCupbHITD0QrQ0WE/f/Ppt6sdpGvFlzOI/LP7G5Q0FZ05hRhvT/
	DRtqY54cAeXdZqLcixN6vlfvCODOUzzvK0ax5onBLBUfKjaL3O9IOAcIn/AMcAQ==
X-Gm-Gg: AYBFou1O4DMkxjjDZ12DtvuWru9AnRTqd5RQy/Non10lubacS015aqumV+Bf9bH+8eE
	Sy/tF0M5jiZyYQ8aJyczOUZ1bTD/gZdNbiD9jHF8UoGKkpL+ekQ1u9GxqT9UanSh1THkCD1ttTF
	MEiDmyrpacIeL3zGdU5gY7Lf2LedA5wZiQRxJW79akkzL+9ZgjjuELoLblED5EcaArwEjzlEQRu
	aXtKs3/NPK3Sh+pnseaZS231/m1dmSEhrHNeYsSpzdoP0iiSPWM91wG6fI8vvgguTvRmoe56efz
	oS1ujRY80CSQQcurPGeG7GJ9oaRs2xtiVK+Iah7ECSN+pJzDzkFse/gHhH7i+cR+RssuhI69o4Q
	TgtvCUB3EX1LMEWWP0SxIxurAnLor+R7EXYR3H7BT2Td2t0ptgg==
X-Received: by 2002:a05:622a:558e:b0:52e:22f3:80cf with SMTP id d75a77b69052e-53054956db4mr213446001cf.32.1788742708190;
        Sun, 06 Sep 2026 17:58:28 -0700 (PDT)
X-Received: by 2002:a05:622a:558e:b0:52e:22f3:80cf with SMTP id d75a77b69052e-53054956db4mr213445621cf.32.1788742707603;
        Sun, 06 Sep 2026 17:58:27 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040693abbsm79644906d6.37.2026.09.06.17.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 17:58:27 -0700 (PDT)
Message-ID: <4450baf6-a8a4-4081-a409-c3206722d2e4@columbia.edu>
Date: Sun, 6 Sep 2026 20:58:26 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] btrfs: rename io_ctl page helpers to folio helpers
To: Qu Wenruo <wqu@suse.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
        David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
 <20260906-btrfs-folio-conversions-v1-10-834b9d7b06f5@columbia.edu>
 <3f82fc56-b621-4d94-9079-b4984dc3823b@gmx.com>
 <ee1e1ce6-123b-4f98-bf1c-ef8e5d892baa@columbia.edu>
 <e1dd5a75-9a67-4bc6-b8d8-bfff79b5b907@suse.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <e1dd5a75-9a67-4bc6-b8d8-bfff79b5b907@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAwNyBTYWx0ZWRfX0LfMwYmkSZBO
 NEohDdGavE5HomgDIvYACX9pJHE9Cj9aRJMlvf+Y974tdE2CLhDoXHSEa6drL0P3IiMh3dMmSTS
 DmrV6TZ2Pp9FlaPxVDIIVIOsuDmfIXSu8Ms9MILk/UmZpsqZ9nrZ6ZtQzqrdvcmXRTIJEyi9mdo
 pUxxMgDjSozsDoFwhJWnVkpE/dOiqTgq2g0EMXKHUN6PX+tbpOaAKYLBHUlZvG3e030B9g0J+Hu
 6NY8yTEFZiQi+Lgqe/hSHBHxa+9vCvDi7VsFljJvlz/jSVMfDOLx/uqFA7KwWkVmi+lB+c6sgsU
 vXuUd4np4KXoFwNgg1omRnfMlIe6PL77pEK93vJBkXrUDje5KYEMhhKRXyOA4l5DbGelMm1dZPg
 cJkLa37xrhqzQ4KDq6jeFSRRdv1uMVpoPGW2ieT/KZGPTAk6AKfTQ7WItVsb0FzCNh4zU4NZdkp
 H5Q23FklrC+SOY7OksQ==
X-Proofpoint-GUID: 6tZ9E57fGWDjBKfK8Wl0PmCxyvDqnIIu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAwNyBTYWx0ZWRfX4zUk0/JBuk/I
 ebEYMrW6gwYOmRmUixRQQFC0clrgVgbKSMU1xfMbVV2G4gOF1OsIUbBPxpi3L5WPhLwLBR79zFH
 V+rFnwdT66iH8Q1KSkPWUgk/3uRO8ftyL44t6LjxsJ7rfq8vMq9M
X-Authority-Analysis: v=2.4 cv=DrhmPm/+ c=1 sm=1 tr=0 ts=6a9e0c34 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=ScJvdbBUUHuM5FusFdgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6tZ9E57fGWDjBKfK8Wl0PmCxyvDqnIIu
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=10 impostorscore=10
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=10 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070007

On 9/7/26 3:23 AM, Qu Wenruo wrote:
> 在 2026/9/7 08:50, Tal Zussman 写道:
>> On 9/7/26 2:12 AM, Qu Wenruo wrote:
>>> 在 2026/9/7 07:59, Tal Zussman 写道:
>>>> These functions now operate on folios. Rename them and update comments
>>>> accordingly.
>>>
>>> Again, v1 space cache is fully disabled since commit 545e560a5b0f
>>> ("btrfs: disable v1 space cache"), it would make more sense to remove
>>> those functions other than doing a rename for codes that we're going to
>>> remove anyway.
>>>
>> 
>> No problem, I can drop this and patch 8. I wasn't sure what the removal
>> timeline looked like and wanted to keep things consistent.
> 
> Would appreciate a lot if you are also interested in removing those v1
> space cache code.
> 

Sure, I can do that. So patches 8-10 can be dropped from this series and
I'll send another one removing the v1 space cache support.

>> 
>>>>
>>>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>>>> ---
>>>>    fs/btrfs/free-space-cache.c | 78 ++++++++++++++++++++++-----------------------
>>>>    1 file changed, 39 insertions(+), 39 deletions(-)
>>>>
>>>> diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
>>>> index ab933ee6f19c..73cfc1d1a5c1 100644
>>>> --- a/fs/btrfs/free-space-cache.c
>>>> +++ b/fs/btrfs/free-space-cache.c
>>>> @@ -406,7 +406,7 @@ static void io_ctl_free(struct btrfs_io_ctl *io_ctl)
>>>>    	io_ctl->folios = NULL;
>>>>    }
>>>>    
>>>> -static void io_ctl_unmap_page(struct btrfs_io_ctl *io_ctl)
>>>> +static void io_ctl_unmap_folio(struct btrfs_io_ctl *io_ctl)
>>>>    {
>>>>    	if (io_ctl->cur) {
>>>>    		io_ctl->cur = NULL;
>>>> @@ -414,7 +414,7 @@ static void io_ctl_unmap_page(struct btrfs_io_ctl *io_ctl)
>>>>    	}
>>>>    }
>>>>    
>>>> -static void io_ctl_map_page(struct btrfs_io_ctl *io_ctl, int clear)
>>>> +static void io_ctl_map_folio(struct btrfs_io_ctl *io_ctl, int clear)
>>>>    {
>>>>    	ASSERT(io_ctl->index < io_ctl->num_folios);
>>>>    	io_ctl->folio = io_ctl->folios[io_ctl->index++];
>>>> @@ -425,11 +425,11 @@ static void io_ctl_map_page(struct btrfs_io_ctl *io_ctl, int clear)
>>>>    		clear_page(io_ctl->cur);
>>>>    }
>>>>    
>>>> -static void io_ctl_drop_pages(struct btrfs_io_ctl *io_ctl)
>>>> +static void io_ctl_drop_folios(struct btrfs_io_ctl *io_ctl)
>>>>    {
>>>>    	int i;
>>>>    
>>>> -	io_ctl_unmap_page(io_ctl);
>>>> +	io_ctl_unmap_folio(io_ctl);
>>>>    
>>>>    	for (i = 0; i < io_ctl->num_folios; i++) {
>>>>    		if (io_ctl->folios[i]) {
>>>> @@ -439,7 +439,7 @@ static void io_ctl_drop_pages(struct btrfs_io_ctl *io_ctl)
>>>>    	}
>>>>    }
>>>>    
>>>> -static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>>> +static int io_ctl_prepare_folios(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>>>    {
>>>>    	struct folio *folio;
>>>>    	struct inode *inode = io_ctl->inode;
>>>> @@ -453,7 +453,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>>>    					    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
>>>>    					    mask);
>>>>    		if (IS_ERR(folio)) {
>>>> -			io_ctl_drop_pages(io_ctl);
>>>> +			io_ctl_drop_folios(io_ctl);
>>>>    			return PTR_ERR(folio);
>>>>    		}
>>>>    
>>>> @@ -461,7 +461,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>>>    		if (ret < 0) {
>>>>    			folio_unlock(folio);
>>>>    			folio_put(folio);
>>>> -			io_ctl_drop_pages(io_ctl);
>>>> +			io_ctl_drop_folios(io_ctl);
>>>>    			return ret;
>>>>    		}
>>>>    
>>>> @@ -472,13 +472,13 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>>>    			if (folio->mapping != inode->i_mapping) {
>>>>    				btrfs_err(BTRFS_I(inode)->root->fs_info,
>>>>    					  "free space cache page truncated");
>>>> -				io_ctl_drop_pages(io_ctl);
>>>> +				io_ctl_drop_folios(io_ctl);
>>>>    				return -EIO;
>>>>    			}
>>>>    			if (!folio_test_uptodate(folio)) {
>>>>    				btrfs_err(BTRFS_I(inode)->root->fs_info,
>>>>    					   "error reading free space cache");
>>>> -				io_ctl_drop_pages(io_ctl);
>>>> +				io_ctl_drop_folios(io_ctl);
>>>>    				return -EIO;
>>>>    			}
>>>>    		}
>>>> @@ -492,7 +492,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
>>>>    
>>>>    static void io_ctl_set_generation(struct btrfs_io_ctl *io_ctl, u64 generation)
>>>>    {
>>>> -	io_ctl_map_page(io_ctl, 1);
>>>> +	io_ctl_map_folio(io_ctl, 1);
>>>>    
>>>>    	/*
>>>>    	 * Skip the csum areas.  If we don't check crcs then we just have a
>>>> @@ -521,7 +521,7 @@ static int io_ctl_check_generation(struct btrfs_io_ctl *io_ctl, u64 generation)
>>>>    		btrfs_err_rl(io_ctl->fs_info,
>>>>    			"space cache generation (%llu) does not match inode (%llu)",
>>>>    				cache_gen, generation);
>>>> -		io_ctl_unmap_page(io_ctl);
>>>> +		io_ctl_unmap_folio(io_ctl);
>>>>    		return -EIO;
>>>>    	}
>>>>    	io_ctl->cur += sizeof(u64);
>>>> @@ -539,7 +539,7 @@ static void io_ctl_set_crc(struct btrfs_io_ctl *io_ctl, int index)
>>>>    
>>>>    	crc = crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
>>>>    	btrfs_crc32c_final(crc, (u8 *)&crc);
>>>> -	io_ctl_unmap_page(io_ctl);
>>>> +	io_ctl_unmap_folio(io_ctl);
>>>>    	tmp = folio_address(io_ctl->folios[0]);
>>>>    	tmp += index;
>>>>    	*tmp = crc;
>>>> @@ -561,13 +561,13 @@ static int io_ctl_check_crc(struct btrfs_io_ctl *io_ctl, int index)
>>>>    	tmp += index;
>>>>    	val = *tmp;
>>>>    
>>>> -	io_ctl_map_page(io_ctl, 0);
>>>> +	io_ctl_map_folio(io_ctl, 0);
>>>>    	crc = crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
>>>>    	btrfs_crc32c_final(crc, (u8 *)&crc);
>>>>    	if (val != crc) {
>>>>    		btrfs_err_rl(io_ctl->fs_info,
>>>>    			"csum mismatch on free space cache");
>>>> -		io_ctl_unmap_page(io_ctl);
>>>> +		io_ctl_unmap_folio(io_ctl);
>>>>    		return -EIO;
>>>>    	}
>>>>    
>>>> @@ -595,12 +595,12 @@ static int io_ctl_add_entry(struct btrfs_io_ctl *io_ctl, u64 offset, u64 bytes,
>>>>    
>>>>    	io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>>>    
>>>> -	/* No more pages to map */
>>>> +	/* No more folios to map */
>>>>    	if (io_ctl->index >= io_ctl->num_folios)
>>>>    		return 0;
>>>>    
>>>> -	/* map the next page */
>>>> -	io_ctl_map_page(io_ctl, 1);
>>>> +	/* map the next folio */
>>>> +	io_ctl_map_folio(io_ctl, 1);
>>>>    	return 0;
>>>>    }
>>>>    
>>>> @@ -610,24 +610,24 @@ static int io_ctl_add_bitmap(struct btrfs_io_ctl *io_ctl, void *bitmap)
>>>>    		return -ENOSPC;
>>>>    
>>>>    	/*
>>>> -	 * If we aren't at the start of the current page, unmap this one and
>>>> +	 * If we aren't at the start of the current folio, unmap this one and
>>>>    	 * map the next one if there is any left.
>>>>    	 */
>>>>    	if (io_ctl->cur != io_ctl->orig) {
>>>>    		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>>>    		if (io_ctl->index >= io_ctl->num_folios)
>>>>    			return -ENOSPC;
>>>> -		io_ctl_map_page(io_ctl, 0);
>>>> +		io_ctl_map_folio(io_ctl, 0);
>>>>    	}
>>>>    
>>>>    	copy_page(io_ctl->cur, bitmap);
>>>>    	io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>>>    	if (io_ctl->index < io_ctl->num_folios)
>>>> -		io_ctl_map_page(io_ctl, 0);
>>>> +		io_ctl_map_folio(io_ctl, 0);
>>>>    	return 0;
>>>>    }
>>>>    
>>>> -static void io_ctl_zero_remaining_pages(struct btrfs_io_ctl *io_ctl)
>>>> +static void io_ctl_zero_remaining_folios(struct btrfs_io_ctl *io_ctl)
>>>>    {
>>>>    	/*
>>>>    	 * If we're not on the boundary we know we've modified the page and we
>>>> @@ -636,10 +636,10 @@ static void io_ctl_zero_remaining_pages(struct btrfs_io_ctl *io_ctl)
>>>>    	if (io_ctl->cur != io_ctl->orig)
>>>>    		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>>>    	else
>>>> -		io_ctl_unmap_page(io_ctl);
>>>> +		io_ctl_unmap_folio(io_ctl);
>>>>    
>>>>    	while (io_ctl->index < io_ctl->num_folios) {
>>>> -		io_ctl_map_page(io_ctl, 1);
>>>> +		io_ctl_map_folio(io_ctl, 1);
>>>>    		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
>>>>    	}
>>>>    }
>>>> @@ -666,7 +666,7 @@ static int io_ctl_read_entry(struct btrfs_io_ctl *io_ctl,
>>>>    	if (io_ctl->size >= sizeof(struct btrfs_free_space_entry))
>>>>    		return 0;
>>>>    
>>>> -	io_ctl_unmap_page(io_ctl);
>>>> +	io_ctl_unmap_folio(io_ctl);
>>>>    
>>>>    	return 0;
>>>>    }
>>>> @@ -681,7 +681,7 @@ static int io_ctl_read_bitmap(struct btrfs_io_ctl *io_ctl,
>>>>    		return ret;
>>>>    
>>>>    	copy_page(entry->bitmap, io_ctl->cur);
>>>> -	io_ctl_unmap_page(io_ctl);
>>>> +	io_ctl_unmap_folio(io_ctl);
>>>>    
>>>>    	return 0;
>>>>    }
>>>> @@ -797,7 +797,7 @@ static int __load_free_space_cache(struct btrfs_root *root, struct inode *inode,
>>>>    
>>>>    	readahead_cache(inode);
>>>>    
>>>> -	ret = io_ctl_prepare_pages(&io_ctl, true);
>>>> +	ret = io_ctl_prepare_folios(&io_ctl, true);
>>>>    	if (ret)
>>>>    		goto out;
>>>>    
>>>> @@ -869,7 +869,7 @@ static int __load_free_space_cache(struct btrfs_root *root, struct inode *inode,
>>>>    		num_entries--;
>>>>    	}
>>>>    
>>>> -	io_ctl_unmap_page(&io_ctl);
>>>> +	io_ctl_unmap_folio(&io_ctl);
>>>>    
>>>>    	/*
>>>>    	 * We add the bitmaps at the end of the entries in order that
>>>> @@ -882,13 +882,13 @@ static int __load_free_space_cache(struct btrfs_root *root, struct inode *inode,
>>>>    			goto free_cache;
>>>>    	}
>>>>    
>>>> -	io_ctl_drop_pages(&io_ctl);
>>>> +	io_ctl_drop_folios(&io_ctl);
>>>>    	ret = 1;
>>>>    out:
>>>>    	io_ctl_free(&io_ctl);
>>>>    	return ret;
>>>>    free_cache:
>>>> -	io_ctl_drop_pages(&io_ctl);
>>>> +	io_ctl_drop_folios(&io_ctl);
>>>>    
>>>>    	spin_lock(&ctl->tree_lock);
>>>>    	__btrfs_remove_free_space_cache(ctl);
>>>> @@ -1280,7 +1280,7 @@ cleanup_write_cache_enospc(struct inode *inode,
>>>>    			   struct btrfs_io_ctl *io_ctl,
>>>>    			   struct extent_state **cached_state)
>>>>    {
>>>> -	io_ctl_drop_pages(io_ctl);
>>>> +	io_ctl_drop_folios(io_ctl);
>>>>    	btrfs_unlock_extent(&BTRFS_I(inode)->io_tree, 0, i_size_read(inode) - 1,
>>>>    			    cached_state);
>>>>    }
>>>> @@ -1297,7 +1297,7 @@ static int __btrfs_wait_cache_io(struct btrfs_root *root,
>>>>    	if (!inode)
>>>>    		return 0;
>>>>    
>>>> -	/* Flush the dirty pages in the cache file. */
>>>> +	/* Flush the dirty folios in the cache file. */
>>>>    	ret = flush_dirty_cache(inode);
>>>>    	if (ret)
>>>>    		goto out;
>>>> @@ -1402,8 +1402,8 @@ static int __btrfs_write_out_cache(struct inode *inode,
>>>>    		spin_unlock(&block_group->lock);
>>>>    	}
>>>>    
>>>> -	/* Lock all pages first so we can lock the extent safely. */
>>>> -	ret = io_ctl_prepare_pages(io_ctl, false);
>>>> +	/* Lock all folios first so we can lock the extent safely. */
>>>> +	ret = io_ctl_prepare_folios(io_ctl, false);
>>>>    	if (ret)
>>>>    		goto out_unlock;
>>>>    
>>>> @@ -1443,10 +1443,10 @@ static int __btrfs_write_out_cache(struct inode *inode,
>>>>    	if (ret)
>>>>    		goto out_nospc;
>>>>    
>>>> -	/* Zero out the rest of the pages just to make sure */
>>>> -	io_ctl_zero_remaining_pages(io_ctl);
>>>> +	/* Zero out the rest of the folios just to make sure */
>>>> +	io_ctl_zero_remaining_folios(io_ctl);
>>>>    
>>>> -	/* Everything is written out, now we dirty the pages in the file. */
>>>> +	/* Everything is written out, now we dirty the folios in the file. */
>>>>    	i_size = i_size_read(inode);
>>>>    	for (int i = 0; i < round_up(i_size, PAGE_SIZE) / PAGE_SIZE; i++) {
>>>>    		u64 dirty_start = i * PAGE_SIZE;
>>>> @@ -1461,17 +1461,17 @@ static int __btrfs_write_out_cache(struct inode *inode,
>>>>    	if (block_group->flags & BTRFS_BLOCK_GROUP_DATA)
>>>>    		up_write(&block_group->data_rwsem);
>>>>    	/*
>>>> -	 * Release the pages and unlock the extent, we will flush
>>>> +	 * Release the folios and unlock the extent, we will flush
>>>>    	 * them out later
>>>>    	 */
>>>> -	io_ctl_drop_pages(io_ctl);
>>>> +	io_ctl_drop_folios(io_ctl);
>>>>    	io_ctl_free(io_ctl);
>>>>    
>>>>    	btrfs_unlock_extent(&BTRFS_I(inode)->io_tree, 0, i_size_read(inode) - 1,
>>>>    			    &cached_state);
>>>>    
>>>>    	/*
>>>> -	 * at this point the pages are under IO and we're happy,
>>>> +	 * at this point the folios are under IO and we're happy,
>>>>    	 * The caller is responsible for waiting on them and updating
>>>>    	 * the cache and the inode
>>>>    	 */
>>>>
>>>
>> 
> 

