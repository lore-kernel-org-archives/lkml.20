Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9639734D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816867; cv=none; b=YjQCQrsoAASYTgTbxb4/2OnOheVN34qKpRa5x6d69n1dItFIr7tOITzRMYbqUcEe7vLQjGpXWbEaw2OmCZJdMkbPlRy2inHJzvL/UzNOePQ2seWoMCBEeJuriJbUIKIxomIkWNZ5lujLxgN27p08mLyE/ge482vhaJT+BKaHfVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816867; c=relaxed/simple;
	bh=uEGi+v5mIFyrmKaRy5WGx/AYHuXx6yiBnFc/1b89L48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HU4GRrAbEUCcBnk5Xg5rCVCNRzjNvvm+/2DKfcS4BazRaEaJM+3bp1J7F2F7cs6T5UDvwYXdkPvTjNzfvyrXGMhIYgq2roXb4yW0eEj/5rIyk3W2wDziafzVHYhzK40pDm+Hp3TgKRRFiDw1jae186Tz2aW/R2hViwa5aPcAGak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VXXBB2La; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=e3mflisL; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VXXBB2La";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="e3mflisL"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CEgSrF600163
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=UItR
	iT5YnrQlpW+YOF3Po2aWsL1V37LtJ2ZFJ6itops=; b=VXXBB2La7ZHL/OX+CAYw
	rWLjjSej48q6f4A5cgmlHf5Mr0NNUo2B94piL0R88yzZZBII8EGaAtKpZnBkcu36
	zimSlT2nB9UiGmhj4dFOY/AbhEOp1sMFaw6QHHX8Ybv05SnuFrsabWfgpneBjEZu
	D4HmBiiiZqjlZsyHFWg63vmmwjDiJ029MZ2RQMO/PS19o59HteE76wpBQLkuV7hf
	QTO8p6/EesfA+WG1HYWTC2IClpGz4NOa4M8kOAkrroQTUgoNyJj/EhRwXyVBBs8V
	elxpwU2nED36s52pAMzdEhHrjUXm7frUQiFIV7k0/YmG5gwgbPyWqLrvCnd5EPzn
	RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h8eqy53h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:54:17 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso363676085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791816857; x=1792421657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UItRiT5YnrQlpW+YOF3Po2aWsL1V37LtJ2ZFJ6itops=;
        b=e3mflisLJY3ISi+J71KllE9KEkte0oVfOJzexCsO31UrOiQayqIRgyXXeZ0s9sq7vF
         RapX94/JZ/Acg2BqhqEFlP+h22Ozu/+CirRAz3aIwHUaUUgL9a55O4/pj5O4YiQGAyYK
         o+lUH40ASNJocBzxyKtjXDNV2GefqJC9A9pdI1cBkfKuqa8Z1iitetfYjH2HsKkFNJMr
         FMohveSc4Nk3Bb6AUpA8NaVQEIk311Fr66LbZOxgzpam3V6IZoSa5QxOBO0koS08umdw
         e27iwoqtsH6si2oSiPYpMzaZ474VlMqQ/9OH0TlRLSOJ7+xSjtOYb+mnfdEusct1CEvb
         2G0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816857; x=1792421657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UItRiT5YnrQlpW+YOF3Po2aWsL1V37LtJ2ZFJ6itops=;
        b=sV0X4boZkqT8D0v+RE+kZ0BHEzG4ttR1hpb3KVlM9Ka6GR3bSnVo2TfQsRy7frpd5/
         BHqeqKL0et2pEcjjvrQd2x451QJKnjXqEJ4ufryFogv6/3isfXIk6VuK93SRdczYI84Q
         ph8/UbQPCqLSxpNwQOkjHgxk70edoTJ/AU8z1PElHcTwaVOO07jnMgeRS0KCWudB26TO
         cyvMQOgI7LBKbsdwMuO1ev2mWSRucg3XnbGGilQtwPDMHgs3v7c6gRs9HZQlNDHb/HB6
         kUFNQiSxPEC6qwcUTRxozAi/MzLVy7ZtK34k3/aJvtyLYIXaWGfP14k72ObdrF5r2quE
         r1yg==
X-Forwarded-Encrypted: i=1; AKwUvBxCbjfeZ7pb4YtP0qzI+jzSUEcrMXCNKtF3BLdY2OCRQwoeCocuS7FdwUo/P+eKK3uB2kx78YGXcPhkOF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ9Ilu/RrfwqTmiyYLbaxiIPrAH2VulA6OmCdbFxEgyCN7wb7k
	B+yol1Zg+ztXz/zGTlsKNmNnGVaQZVi2skdENbBZPAUM+v9dYTqb4u+5A08UpFnpKzj3mVQScDX
	YlairdivE+CLiff1auB/gzCP69C+6lJm8ohOzRit8bLdnqMvIEQA3xzmBDl9/+cEn8wQNgA==
X-Gm-Gg: AYBFou24YcHaAK2BfMjagGcQK6Y8gtDf9xxGtMg/sKTEQyLFWwBLsSx/OtLUFWQ/xLb
	hZZuDhHTddFQMF50MOVAK35OOQdd7ttXoXWKjRxP0Vf649LmQbVD9JjfIKbqB79VatBr7tND5HB
	KhSk5c/ro0mB3rEL6q3eQ3A1FDn4EYuk00Bb4tsmuXXV1QU6MzixyiMfwIsQ4kps0mxj4593cvM
	hFQ+qaK6fc6zth9hLXlyuZeHr2F+TDSiFNHAlJ+UmdUJCcmBW4CWwJxTy7C4gzkbPGfjsOtLO4Z
	FVgclXuiAM/SKwwoT1hUcDVMNP/6uwhaJv3mmUiE+GCZZhFXj76Zdhq6tuu9F4MnOpeEnLrsT98
	FWQUu6yGvjeBJig45rIF/0ooRPU+BP3dpdqRFmKeKKeR1TJLW
X-Received: by 2002:a05:620a:2b89:b0:93c:63f5:eab with SMTP id af79cd13be357-93ebd24f64emr1651502485a.31.1791816856993;
        Mon, 12 Oct 2026 07:54:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93c:63f5:eab with SMTP id af79cd13be357-93ebd24f64emr1651494685a.31.1791816856101;
        Mon, 12 Oct 2026 07:54:16 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50287a2sm2852485a.20.2026.10.12.07.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:54:14 -0700 (PDT)
Message-ID: <810d7901-b897-4880-a8d4-d80fe0f8770b@columbia.edu>
Date: Mon, 12 Oct 2026 10:54:14 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cramfs: convert cramfs_blkdev_read() to use folios
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260906-cramfs-blkdev-read-folio-v1-1-1be99a82be55@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260906-cramfs-blkdev-read-folio-v1-1-1be99a82be55@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6accf499 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=PQBzku6fbGuEC0B3IqIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OSBTYWx0ZWRfX+o5kNJGo8OKI
 qaG4KqIXGGVrRwtj3VAx/m3kRaCYu03+jsO3+vQM15d/agHh7UEOTWutIRA33x1CXTp8C5PzKCS
 zW6y/yNLfu9pa45v4iErdgtBI2s3uaOx+MJPd+ECyG14NAUje0NF68D3Xlnel7pFmbYPiWf2sVU
 Sg88CLTGjV783wxHAlB17N7mWuNb2XD7Kk5CrL/9os68vbE1qw2NbOExx6/zHohjPDdafoFToxM
 6uUj/06aoVShVGMfZ4coLwKNv9W8M3+A7PFYFug7LmOpwRcsGRpkYqb6NrUQY1PBjl1u3rkWtwe
 ojWSX8FYUffXh1X+9iWj53zG1PwJ7hjL/wx1/BwCXSXxWbpcRL+2KmSBYTFYksGXClYx19+RYjQ
 I1qVSqGSpMnJJcrxGRmcHAD2LYOWl6EAfigRgICbPsuNkSJ/jcXY6ftUtZS0ltNOlegPFTJxckJ
 7D6/9CHgyEzAIKW6RKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OSBTYWx0ZWRfX9zRVZBA2J8Z5
 sX9+2zsONLaEqMpBgepIJs536CkXHAq/oJjtXWG2YkjDz2DQu9NtBvU7K4x7PQ6E8ROvDQyJPuq
 I5AI0QpIB5/SDPd6mJxXY6/0gIOCfJt4FVBiS0DG+wt/7UhUbF6Q
X-Proofpoint-GUID: AKoZcQeI2aEYTyC_gQ33tnk4jFTrn8ps
X-Proofpoint-ORIG-GUID: AKoZcQeI2aEYTyC_gQ33tnk4jFTrn8ps
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 malwarescore=0 suspectscore=0 lowpriorityscore=10 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120059

On 9/6/26 7:45 PM, Tal Zussman wrote:
> Read the block device pages through read_mapping_folio() and copy with
> memcpy_from_folio() instead of going through a page.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/cramfs/inode.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 

Following up on this - I don't see a cramfs tree, so could this go
through vfs if everything looks ok? It gets us one step closer to
removing read_mapping_page().

Thanks,
Tal

> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index d4cd03f4f60d..b55eb3bd29c1 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -194,7 +194,7 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>  {
>  	struct address_space *mapping = sb->s_bdev->bd_mapping;
>  	struct file_ra_state ra = {};
> -	struct page *pages[BLKS_PER_BUF];
> +	struct folio *folios[BLKS_PER_BUF];
>  	unsigned i, blocknr, buffer;
>  	unsigned long devsize;
>  	char *data;
> @@ -227,15 +227,15 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>  	page_cache_sync_readahead(mapping, &ra, NULL, blocknr, BLKS_PER_BUF);
>  
>  	for (i = 0; i < BLKS_PER_BUF; i++) {
> -		struct page *page = NULL;
> +		struct folio *folio = NULL;
>  
>  		if (blocknr + i < devsize) {
> -			page = read_mapping_page(mapping, blocknr + i, NULL);
> +			folio = read_mapping_folio(mapping, blocknr + i, NULL);
>  			/* synchronous error? */
> -			if (IS_ERR(page))
> -				page = NULL;
> +			if (IS_ERR(folio))
> +				folio = NULL;
>  		}
> -		pages[i] = page;
> +		folios[i] = folio;
>  	}
>  
>  	buffer = next_buffer;
> @@ -245,11 +245,14 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>  
>  	data = read_buffers[buffer];
>  	for (i = 0; i < BLKS_PER_BUF; i++) {
> -		struct page *page = pages[i];
> +		struct folio *folio = folios[i];
>  
> -		if (page) {
> -			memcpy_from_page(data, page, 0, PAGE_SIZE);
> -			put_page(page);
> +		if (folio) {
> +			size_t offset = offset_in_folio(folio,
> +					(loff_t)(blocknr + i) << PAGE_SHIFT);
> +
> +			memcpy_from_folio(data, folio, offset, PAGE_SIZE);
> +			folio_put(folio);
>  		} else
>  			memset(data, 0, PAGE_SIZE);
>  		data += PAGE_SIZE;
> 
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260906-cramfs-blkdev-read-folio-16fecf6908ac
> 
> Best regards,
> --  
> Tal Zussman <tz2294@columbia.edu>

