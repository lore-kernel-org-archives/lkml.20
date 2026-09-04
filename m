Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316604CC26E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538796; cv=none; b=QNIgqXA2WcjFp8nBU7R6CDzkNaoVzzpLdT0Wy4oktWTxxvvQ8A+nIjOnYnuuA6K1sZ7/3fhj1HRYUbk+Q0A38T/tDCdGtgu6VQCdivlO8n7oFikxslRAYeb5GWentfmpBdh+rwEDvOyZ2dtxFdWpb47os5JN88mwvivMgv0lbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538796; c=relaxed/simple;
	bh=ObmG9tfgjwMlydiJMgZz0Uw/hklY3TtDzEUESXlWCvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6i4bjhKDTwQmFxMZQ8PUWOkkb0VblzZ+02XsnRFAc6QCicbwT36y2s8HjbewHVfEMAj3eYgKjFG6ALnv0Tt9gsHhDEQAOZuIbqCotBp7NeWcnIMSefKPClNvl9PSQ2wxBDaJUrZ5gzhlSeTiN1byRzKwL/LkzlN2lZEqjP5Lgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=MUZ8znf0; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=cBR3imX3; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="MUZ8znf0";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="cBR3imX3"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684GAEiJ2215716
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=CZJ1
	b+xo/XcDeEB8HUsZoAtzYxQXYY6E5mqisQMBwto=; b=MUZ8znf0F71L1M2hlNCv
	xCdJmIm7XMf/ZQwLW2vfFk52O2B0oQciKpMGkORYC8CQSVjyJAGqs98bXKdH4p0J
	NoW3cU8XjBMqTUzZF13/gB0To13e/miRP2elTJFgjIVSH63x4dQ3QAjAbgtl5zs4
	jfuTUul/5qdl5iKb6ylat+bQj1LBd7qFDlMoUwp1+szGa0w2v5oF/S+kX7BEfaFs
	jTdfUM49H1C6cKBG1dC+2e1qrVLQRQOK2rg7gJHQ+eYpLInbOb2LPWneyYHnPNg4
	Xm5cfjhewvn10YVHNHDuqDIqm8SlaOVpvFZllGQG6RXWt5FebeRX6aYiG4ZQovJQ
	SQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gfyvkrypg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:19:48 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7db8d191so25369106d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788538788; x=1789143588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZJ1b+xo/XcDeEB8HUsZoAtzYxQXYY6E5mqisQMBwto=;
        b=cBR3imX3JNlUtiewTNBPQGXRDUZJ1yA6kjgt6spkMyH9o+YA8rcrJHbYXyw78U3EZS
         Ez21EkHpLMAGSkYhDo58dlqXHEGghwba+gBbq6esViGN/tj57b1E+Tg0iwAphAbE9nmP
         Ub7TAZzXTA/PfPt1Hp2aLTOVoSdMKklrj/bzJjgbvVEbxiRilC/5CUTy0zwmjmWTqUVU
         0NV2P+lTjWosLtvJJz9aYJzYQcuJ1Xj2tbCEwwVucitruck4FtsNQ8zAf0rrKWKxoRUs
         LB2nS6dK2Cune4mrYg9hdEPBBGNZ1P3gyP1FNUcDfOwvPtcDp4iWk56jxG7407xkg65y
         qcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538788; x=1789143588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZJ1b+xo/XcDeEB8HUsZoAtzYxQXYY6E5mqisQMBwto=;
        b=AsE6ayX8/f395PlWYhhMWbF9oWX6yQ1wJKY+wyM7i1Ox05z0wDS+coQbqwbJ5O51fA
         qzVK8U3H3SZbnMB5cLRhLiM9/lAHJBLhr2aqV60KalImBiMCAjmnbGJFLcvTavypVIaf
         htdcx9AY/5z41aGnq4ERTqWUtoY8qx1Hs2aCLJ5GreLVwBYZsLNMArwDiiMHM3nJX8JB
         0uM9ibiUNMDSf4J0PZ7wyDPzwOa6Diz/wiezKqjP+SPGDM/rgFPjSHIMOhEXaHJl16Pp
         SYKYb6MdWph6iDzA/THSgOx9PNPLpgPqTXkear8IjVKMOVTRaaOmPtNERyiiN7yQnJp3
         d4dA==
X-Forwarded-Encrypted: i=1; AKwUvBw64cGIcSK51PrI+j7A0RSIyyhw0f8fVRDMN/tFNpMFRsWuToeLHQ/TbLX9ghj7Jl5sM7mIMRC7E0H+pr0=@vger.kernel.org
X-Gm-Message-State: AFuF++lEdABig+iHHcbHIUC4ZKDY81vwDF73G2KebMr9scR8C+oMZowJ
	3iVZswY9u6OMScSPa6NNNXmofMQyv/o++Bed0vtkDALnYY1fowBJX6URp6hAOHN+AcfaqD+Bpmd
	LiKq+PHLqyTdHGHSXvWKsnwrbwKViC8teXTtqVIJYPObSLBYbiwo1IofF0OeJuA==
X-Gm-Gg: AYBFou2jfI/2pE8kHRpHUWdiwbsMPr21av+FLU0tu42sAPU79e1X5wtD4kaPzkJmpfD
	oA5KcfSrAldD/+gAzuApKBP6cmnXtc/4HCw1xJW514rc0vN9uWDbYok54jxpiEQXvoz30QFSRP5
	d7+WztDBSCEUhJLAUDrC2MZAj9etrUwEzeQjfx43SoiKSmHpXaayd0P0W793aNYeTKP3bgUuY+m
	BdCxecrSnFb/ItKqG4gev4FkJjMZ4FMKd+bSyn5WpDuePvStH5o2TojXU8eZWt8cCuCCG/9Wq4Q
	2lbvPl9nlL3RmGlrfoT+7F2oPCpL1frHd1czgiXYML5x4PNtc+c306baSjdkhPP6IpicwG5syG9
	zEfVpyv9HAnW+++V47xp9JpZhOpWKqn8ZdvERU0NjnduCFtAUGlTT
X-Received: by 2002:a05:6214:c6a:b0:910:3c08:fc6c with SMTP id 6a1803df08f44-9103ef89180mr79714566d6.22.1788538787705;
        Fri, 04 Sep 2026 09:19:47 -0700 (PDT)
X-Received: by 2002:a05:6214:c6a:b0:910:3c08:fc6c with SMTP id 6a1803df08f44-9103ef89180mr79713766d6.22.1788538787001;
        Fri, 04 Sep 2026 09:19:47 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-177-158.net.columbia.edu. [128.59.177.158])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067b099sm24071926d6.28.2026.09.04.09.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:19:46 -0700 (PDT)
Message-ID: <95a68e6f-0e45-4763-8345-00f85c53b5ac@columbia.edu>
Date: Fri, 4 Sep 2026 12:19:45 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] block device fixes for large block sizes,
 IOCB_NOWAIT, and direct I/O
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0OCBTYWx0ZWRfX0BfP3IbIypYk
 Pn0GKmSJsBqGeolCmkIGw2gN95OgUs/pAwXQ/kQhzI6kJ+8ZJu3QQPIthstdlypqVQOEKomgWtB
 YSBStZZXSXhm7KhVBE02VDtncCrbvHWPeETIeBY8rUU9aIwFNovRM2dS+CkuRvfCJjW6uxw8/xi
 1rU+B+3CVXjkgNBAz0ssMcwYzLQK0fhO1qbyWs0YdKatrGn3c59i3qiIUZvIauulURnkeqwDUay
 J1/GC/EbaAZ/0hpRjlmA1g+jXC7RmhLK7VFpyno7Rk14BYM7+RJacbh/ISeJwWSuSwOFbfKcTpG
 cypCKEpM/AFUwNIDpCzmR2XCSYisRDp3IOQoR5b1AY2jFdXkJiVrA0VMaxIdNcho5E1pIaWlVH3
 /cjcoKp/C+PFk0/3DeVRd2arhzGHBPk2ba09QUUlRZDf+C3aqAufhcNs52MxAiZ5nv6e3aSgUPe
 INW/UeRFbAd+vPD+/Cw==
X-Proofpoint-GUID: Wd4lPS5QjPaTNVOadnVy9cpea_1FeiE7
X-Authority-Analysis: v=2.4 cv=T868ifKQ c=1 sm=1 tr=0 ts=6a9aefa4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=tLges04aSNaZGVAfhBIy2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=dXbZDeGBosa9AtOZLTMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0OCBTYWx0ZWRfX0S+Jj1TdYTw2
 7B2Y2p4KFsXJCGumYURUtwTOkJMe/9wxqzIlfYXVVrtkCt+YjCTERCbP1+OxLJ7XwzIimZMtOh9
 FCcn/p8XW049a77FFrCOOTOz0Q8X8bp5cAgZe78jpa3Yn0hpETuP
X-Proofpoint-ORIG-GUID: Wd4lPS5QjPaTNVOadnVy9cpea_1FeiE7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11895
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 lowpriorityscore=10 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040148

On 8/28/26 4:49 PM, Tal Zussman wrote:
> A set of independent fixes for the block device file operations. The
> first two were found by Sashiko while reviewing the RWF_DONTCACHE series
> [1]. The fourth and fifth were found by Sashiko's review of v1 of this
> series, and the rest came from asking an LLM to find any similar or
> related issues. Each issue has been reproduced, with the fixes resolving
> the issues.
> 
> Patch 1 fixes silently lost mmap writes with CONFIG_BUFFER_HEAD=n.
> 
> Patches 2 and 3 take i_rwsem around the direct I/O write fallback and
> the splice read path, which race set_blocksize() changing the mapping's
> minimum folio order.
> 
> Patch 4 makes the buffered read path honor IOCB_NOWAIT instead of
> blocking on i_rwsem.
> 
> Patch 5 makes IOCB_ATOMIC writes fail instead of tearing and falling
> back to buffered I/O. Block devices can reject both paths into the
> fallback before submitting any I/O, so we fail rather than issue a
> WARN() like ext4 does.
> 
> Patch 6 fixes leaked page pins in bio_iov_iter_align_down(), and patch
> 7 removes dead metadata handling in the async direct I/O path.
> 
> These issues are currently unlikely to be hit in practice due to the
> specific configurations required to trigger them.
> 
> The reproducer for patch 1 has been submitted to blktests [2].
> 

FYI the reproducer has been merged to blktests as block/048.

> [1] https://lore.kernel.org/all/20260730-blk-dontcache-v7-0-3e8e6850068d@columbia.edu/
> [2] https://github.com/linux-blktests/blktests/pull/258
> 
> ---
> Changes in v2:
> - Rebase on current master.
> - 1/7: Add Christoph's Reviewed-by and submit the reproducer to
>   blktests.
> - 2/7: Skip the buffered fallback for IOCB_NOWAIT direct writes, per
>   Sashiko.
> - 2/7: Change the Fixes: commit from c0e473a0d226 to 3c20917120ce
> - 3/7 to 7/7: New patches.
> - Link to v1: https://lore.kernel.org/r/20260802-blkdev-fixes-v1-0-a82fc549fd74@columbia.edu
> 
> ---
> Tal Zussman (7):
>       block: use iomap_dirty_folio for block devices
>       block: take i_rwsem for the direct I/O write fallback
>       block: take i_rwsem for the splice read path
>       block: honor IOCB_NOWAIT in the block device buffered read path
>       block: fail atomic writes instead of falling back to buffered I/O
>       block: unpin all pages of a bvec in bio_iov_iter_align_down()
>       block: remove dead metadata handling from the async direct I/O path
> 
>  block/bio.c  | 18 ++++++++++++-
>  block/fops.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++------------
>  2 files changed, 84 insertions(+), 18 deletions(-)
> ---
> base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
> change-id: 20260801-blkdev-fixes-771b1c314ebb
> 
> Best regards,

