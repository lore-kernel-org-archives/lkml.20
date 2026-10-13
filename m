Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA83F4DD7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910001; cv=none; b=h7teEAMuuMdaHq0MQJDe8ciHWjigfVqJI/ljszRS/Ga+4PalZI2CIqKsG/lE1K6ursNC3+JJ+/JwnW/S2cYGpSg9yH9jAePUh6Usm0wsLhNM7NpxB7jJukmINMesf9jKSxg2vVO3hwgGwBlj7V8ZuHcqXC49+CYaRHQV/xCugoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910001; c=relaxed/simple;
	bh=1uNtoEPn1axBBTz/xvu5DMTLl85+9t1E0I35mjRxhXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REdojJB2P/K8i+1FEIE9jAHSGVIvj98usTIAvOrx8Zxs9Q8uejfOdKmuaSb1/UKDm3e7R9QLQ25cmjMQ6kCZ8BWEGeoDjpvl5+g1bAEyUXIObZ1N0/wUkNqvsIzte551pqVYEQ7C1eevc3iKe5JOOQ5r516SSl/ZC0miWulamjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ts9r5Kt5; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=SkbLOIUU; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ts9r5Kt5";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="SkbLOIUU"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DGY5UZ3289932
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=YZtt
	3JvqXqsF3YecFG5xLUkWJg8SzoyuQA2ME3mmpjA=; b=ts9r5Kt5EGrbXR38GXpp
	ZnPuX+JbNirHfeJ4NgbbHUSviGCiz9g3ml1b6yrnPpZMlzOjOfar5SnFRmC9ntd+
	eFu3OjVBKjxqgkXkv4/3+oiiz1Ui3R0+t5F4NvUjry8kG761lc/kp9qbUZvBRNce
	So5UoKtNfZuhSresZUJSxcTrU0fzyk+jBOVVS6kRsLr5deg8zK3qf9/PG4zBgejq
	FAQzASdmU8GSbxLgV6i8MUU57EBe5WRaX/oxUaDNgrnILg1bNpOhx3Ohw4giHxUk
	PoYyOEhTJojgrMVNWtGG/kax1yeS9s3L2ePftQhuijDL97Ms/zV6TJJYMwF8ejeT
	qw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h9qgq8mjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:46:31 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso108256906d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791909991; x=1792514791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZtt3JvqXqsF3YecFG5xLUkWJg8SzoyuQA2ME3mmpjA=;
        b=SkbLOIUUII19jQ1Y2vmuIBCWufE00OEcaj+gzMsC7ysPZ+rHeaL5GmlhGbQ/6/SHVS
         Z4VDwfvnzL2FwvBp2LdSSw1nHCsU3WCBE6bp9EnOymBgFfw9BBik7g9C9mtiw5hgZ+KX
         PeG31J1P6ofLRFGsDS43v6iBLKs/KfkzON23OVY964SUTn761VmJHzE2Bx+nfSKlatia
         NaCgPWAVFEU+0dcIAE35cEdA/LrDNlY4pyh9u/a6vtvmFOQvZffV0pP0yg4d0RugolB3
         PqQDFFpJmHfrq5Ay8846g0ooCUieP2wlfjiPLGoTMNs+fI9yTt+NZLt7RkrCV6NNbu0A
         H5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909991; x=1792514791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZtt3JvqXqsF3YecFG5xLUkWJg8SzoyuQA2ME3mmpjA=;
        b=Xe0N0q9YZaRTvvRMBFs1bJP7v3o7oz9SGXsHAIeqJUKszmRhCeYcPZ33WAwZAqzY3r
         Ad1WSb/zerjH6hmHy6KpEasAbvlAZDcYLkRXPcPI1g4ZRNG11JlMs1i7+sbA9nfS4ZIF
         Q3MiopEQgCnrh4NJE5YVbAwh4dMo7lk1/uKerymE8jTOHsXjWn54BlfttfOITS7FL20b
         5/HzHtjzXcNkihKjaFr1/Yz2aIkMdFuTGmKjFdTjj0xB/dRHkU0xPRgP703Cv940BrxF
         80FFW3AxjBTD5xiRC4i7kYu06ycJ2CiLaLc5Gz1fUxRoqGGSDnkwImtg2Hzmeae7ZfDp
         c+cg==
X-Forwarded-Encrypted: i=1; AKwUvBx4rXzf0cb2wlZ/c8Y7WIssfLAwcsk9oJEC6dnsgqUFONRhaQrGj6d7RniaNjMqHHouNnQuYAVf00LlA7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIskDDGZfVaN1QJI7Hr+PBO9ztGIP2Lsx6Mbape6tApAlhIGTMv
	RkshdxtQ9l7aR/q+ANk6I0sT0Sfh7/R+mVaN6nJSFAsRvKncqL8rROyngwK1KFRIvc/VrhbOeBn
	DMdoRFNtaLdu2IU/Y3nprVH71HO3EqKPBVDXusAJE8jLgeL7Qy4wVFsSpXgkhRw==
X-Gm-Gg: AYBFou1ZP1tdB+UQ/lhiS/TiXJpz39IWMMd3ueGCyeIOceyUvf63ImhKUVzVcUD/lGk
	19vXQHkXePvdv8sGqt4+vvre+3SO8by+BUHE2xp+3tGQUC8SD3R0MTGNcg9Uxawo1kFI8r5Ro6Q
	itoS6lLlPfas8C0p7EtLvAnsQHwpLd6INSB+U/20IzsB9JjVmglVV9ti4VFdlqRrNI25ZjDjnbj
	C7aQ5kkmAIvbQ/6GLrRxMRi3Hn7p+csGKbpQBYdHf7LdfQ3VSVbIr7EqUzVHMl0XHi0IO5nNIgQ
	AQG+s3wZhVU9THJoKgi2cu8jdSRvFAdSxefHTPI/956GWN6qMp9ssJUTex+9FcPnDt6OFcPLi3o
	+MWH3S758mAdM+AI4d6nF4C5loYZUffLO7TSqNPfbsOMcOQ==
X-Received: by 2002:a05:6214:2524:b0:914:507:80d2 with SMTP id 6a1803df08f44-91b55540f93mr229040356d6.33.1791909990987;
        Tue, 13 Oct 2026 09:46:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2524:b0:914:507:80d2 with SMTP id 6a1803df08f44-91b55540f93mr229039816d6.33.1791909990385;
        Tue, 13 Oct 2026 09:46:30 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b92b86sm29693496d6.30.2026.10.13.09.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:46:29 -0700 (PDT)
Message-ID: <4f60231d-5f3d-4094-b578-31efa9d088c5@columbia.edu>
Date: Tue, 13 Oct 2026 12:46:29 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cramfs: convert cramfs_blkdev_read() to use folios
To: Nicolas Pitre <nico@fluxnic.net>, Christian Brauner <brauner@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260906-cramfs-blkdev-read-folio-v1-1-1be99a82be55@columbia.edu>
 <810d7901-b897-4880-a8d4-d80fe0f8770b@columbia.edu>
 <eb5ff8ee-cc80-f8f8-0602-ccb9ad4a1b12@fluxnic.net>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <eb5ff8ee-cc80-f8f8-0602-ccb9ad4a1b12@fluxnic.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfXyV8V3asjqTXq
 t9iBvSS5FCBLr484W32i6iOotoRKlSPP3JH2fNJfx72dks8PrSqc7pQeEumEIDSVjNoVCuPFOSu
 +SaDqkMTf+Y0lTxXXqUNNzYNRywNAqg46wC1a/IopkiJiVTwsZgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfX1ovCWEFA9wOa
 HaKdyT2rpunhyQHpHKyWkjjEUmkVSlCfcR2Vyrol8CD8NKnhvZgdKN1N6NUwv9UUbTQhXxyoGNR
 WXM4dBH6pF2G8H+cInVADC6j3gaF+R0HKBdvEBAcX3/q2Ap6pm+mh6YjPSxNFwZEZsS7B/oKs69
 Sy5vOU8ZBcjSsyRjZnBFvS5FFZo17GLQ2J9p7NqXalV+79Xs+wxVS/mGOUxXuFpyrPd8Zvay2V8
 DpP9IbW+apVRYsxSXGUGCvUAQeaCJVBGHD6ZrvwpRLktzlN9w43qe5lM7zZAuqw0AtqqW/tXzf9
 cETSmb4oypubArSQd1EKYtyVhacdYzEVM13A2hg0tvF1HwjJeT0YKM/UnfAy4Xs6dVl5gJZTmd1
 BSBQf1M7/5KaNnbOiIGXWXWX1ys7pU8P26VLNunxbl6/wi2wYecVRqur26f5pzI889tuogJi9oU
 OKGHBselB691GeWUWBg==
X-Proofpoint-ORIG-GUID: LPyFbWHHr92FNLJj9G5GsqHATKKwDbql
X-Proofpoint-GUID: LPyFbWHHr92FNLJj9G5GsqHATKKwDbql
X-Authority-Analysis: v=2.4 cv=a/6lZkSF c=1 sm=1 tr=0 ts=6ace6067 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=dg4UtMH5AAAA:8 a=wIN2Qo1HbR48bUUB9JIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=byNfn09xH3PuSfgbYLsR:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=10 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130065

On 10/12/26 12:16 PM, Nicolas Pitre wrote:
> On Mon, 12 Oct 2026, Tal Zussman wrote:
> 
>> On 9/6/26 7:45 PM, Tal Zussman wrote:
>> > Read the block device pages through read_mapping_folio() and copy with
>> > memcpy_from_folio() instead of going through a page.
>> > 
>> > Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> > ---
>> >  fs/cramfs/inode.c | 23 +++++++++++++----------
>> >  1 file changed, 13 insertions(+), 10 deletions(-)
>> > 
>> 
>> Following up on this - I don't see a cramfs tree, so could this go
>> through vfs if everything looks ok? It gets us one step closer to
>> removing read_mapping_page().
>> 
>> Thanks,
>> Tal
> 
> Yes, please forward to the vfs tree.
> 
> Acked-by: Nicolas Pitre <nico@fluxnic.net>
> 
Thanks!

Christian, could you please pick this up?

> 
>> > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
>> > index d4cd03f4f60d..b55eb3bd29c1 100644
>> > --- a/fs/cramfs/inode.c
>> > +++ b/fs/cramfs/inode.c
>> > @@ -194,7 +194,7 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>> >  {
>> >  	struct address_space *mapping = sb->s_bdev->bd_mapping;
>> >  	struct file_ra_state ra = {};
>> > -	struct page *pages[BLKS_PER_BUF];
>> > +	struct folio *folios[BLKS_PER_BUF];
>> >  	unsigned i, blocknr, buffer;
>> >  	unsigned long devsize;
>> >  	char *data;
>> > @@ -227,15 +227,15 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>> >  	page_cache_sync_readahead(mapping, &ra, NULL, blocknr, BLKS_PER_BUF);
>> >  
>> >  	for (i = 0; i < BLKS_PER_BUF; i++) {
>> > -		struct page *page = NULL;
>> > +		struct folio *folio = NULL;
>> >  
>> >  		if (blocknr + i < devsize) {
>> > -			page = read_mapping_page(mapping, blocknr + i, NULL);
>> > +			folio = read_mapping_folio(mapping, blocknr + i, NULL);
>> >  			/* synchronous error? */
>> > -			if (IS_ERR(page))
>> > -				page = NULL;
>> > +			if (IS_ERR(folio))
>> > +				folio = NULL;
>> >  		}
>> > -		pages[i] = page;
>> > +		folios[i] = folio;
>> >  	}
>> >  
>> >  	buffer = next_buffer;
>> > @@ -245,11 +245,14 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>> >  
>> >  	data = read_buffers[buffer];
>> >  	for (i = 0; i < BLKS_PER_BUF; i++) {
>> > -		struct page *page = pages[i];
>> > +		struct folio *folio = folios[i];
>> >  
>> > -		if (page) {
>> > -			memcpy_from_page(data, page, 0, PAGE_SIZE);
>> > -			put_page(page);
>> > +		if (folio) {
>> > +			size_t offset = offset_in_folio(folio,
>> > +					(loff_t)(blocknr + i) << PAGE_SHIFT);
>> > +
>> > +			memcpy_from_folio(data, folio, offset, PAGE_SIZE);
>> > +			folio_put(folio);
>> >  		} else
>> >  			memset(data, 0, PAGE_SIZE);
>> >  		data += PAGE_SIZE;
>> > 
>> > ---
>> > base-commit: df2908090cda368b01ff43709f51890076c56157
>> > change-id: 20260906-cramfs-blkdev-read-folio-16fecf6908ac
>> > 
>> > Best regards,
>> > --  
>> > Tal Zussman <tz2294@columbia.edu>
>> 
>> 
> 

