Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295308;
	b=ZqErhmMzh2kMePvIjKMEr2W7wKXcLrZ4TY10RAfiuGqUM/oNqN5rrbP2fQLBEVMztXW+
	 F63ys7Hp8enCKqg2R34c49moYX62/nmzi7Q5+xyMlV3x5PLNHHw2b85De5Rmbw/t0ePbP
	 UQrMkFhcc6aIUQy/uvo8jR4FzV5dj9A/mwPGMXUSf50WUoyIHjmcUd78Xpi5cDsFWTCuO
	 ELwUFy+vJGZNrfUA+mFavL1DqCTlh4+Gk2dNGP7UH6i+TgMt1LGydT+XxfehaXztuj5WO
	 KSLDzTnvL12CkV/Hze9qSb+wJs1JM785fAbpdTFfFE4l3TLqAtgh+z5YTCU7CNusFBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RmBXCpAEN/ZLhIS3rfNAZDYz2sNDq9Q0TKTm0QMgBPk=;
	b=dDdHognfDHnkIkY41NdLMdmMdzy0uLrciYFFVhl/j/vyBSvnKrJEoEBo0EwTNA1OB1Mb
	 dTTr4kfbDGOmIPMCXH9+BHuHr3Mj1+1BoH2ny+/7Vx28gfAsXvCKxuPX0ddBVTYbGiyMj
	 OwsO1JjGFY9sUwt4aag5bdufVMLXILGJQ0Z8UgdOgTzmU9FH6UFtEensHGCNTTylzW02p
	 /l6rRJHLabxsd8wOjoxZ1ABezUUdr8Ohfta32PybODtXZ1tDrlHLDXxoERhwScQuy/ZPx
	 4CWRKp8vEP1FzfXWorcl6+mQqj723r7NFITg9gGkjqoxi5OjgBKeZLJdJvPX86a1eFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=inOVOqcy;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DB4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=inOVOqcy
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987b4a710so6185045ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295307; x=1793900107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmBXCpAEN/ZLhIS3rfNAZDYz2sNDq9Q0TKTm0QMgBPk=;
        b=inOVOqcybKyMjPOYFE6gu6IVOtsK5uwJhr8yfYKJIf+y8YnaotatogG2LbhV9p1p5R
         Ev4xIGBwfdw7VKUqYY6tU6QLxHsEz0FMPI4Z8xCzMAf2zDNzfB0eSGd3JmqL/G7uF1Qu
         VxdkXD3NjLolO4RM3KqFVVv4B2qRZUWAaMVrmfgIon+fmVgjHFUv7RAfySXBXsStS+1Q
         i8DSt+JFXu/m2LpB/QUhqfPIRNhxTGZ7M4epRwaf09x98fEuY8XjVXeR0Watnv1x2fc+
         FHaq4TTnuJoItB6yPXCfH42SiWK+ExwT1ZI4Yia9HGhJ7+KhyU98Mlapu7cRXth0NSQg
         zKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295307; x=1793900107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmBXCpAEN/ZLhIS3rfNAZDYz2sNDq9Q0TKTm0QMgBPk=;
        b=bfgUxrJp/dgXDJPXsfGgLexofnmBtyxvPDheQQCf72pyIhJZioGF+FdZjzFumPDeFI
         J9z8Huk05Rx9FXcgkR7FYUIMvR2SkkzepneRX97KEAiuQWpimPiLstayDRZPCofca2r5
         c9XQblbF/6/7jTiTjqFuK008NE5QoKDqEG2nhNyHscJG0zN58DT7uEUuESpaUyaRrnUa
         batXglqs5soO6KJWul8gDrLKgT/9C/8e2hxtqmUhe5u/LWyHwnRIlNmSZyzu7yELZ7GZ
         M0vF71M1naPgahl2uzD1dmPuRKilk6FBqsC9qYI5776JLq2U8gP+2Min8FtDkHBpEu2/
         3LHg==
X-Forwarded-Encrypted: i=1; AKwUvBwO0DWzoXYVGV76yCLTPcQdiMVQtqrVM/FDMJfFw9UQbq3Rcw44GI4twzIb2R3trAE96b3pHJi/iPuevKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIUt+pE3+hiTtgbw39rgodW+uZ6Avb4QTLifHqs0v3VpiOvFKL
	GRD1qkxQp/B1jrA/0WTlgWGhrYuTlyp064bk16wSwKRwNY00XP1Z3e7G
X-Gm-Gg: AYBFou3mdTlKKuYP8jAa7EJMa6/RFcQC8DQHNkpxCp+mvl5HEiLXWSnkkRV/XoZ+s3c
	tDbNa1wSIubk7vWgGdsSq5w/PMsk6RRmOZgiouVbqdS8l7soTO0Wl7bVbQ/GiPfmMbTT+OOUDbx
	qSFPagOYbLzvaY9kjb2kNjEfbR1JOrYbAp85FvP2TlpZ/Qk0O8BBFSmRL9yN8E8jrXSZ3Zpvmk6
	wGebppGZz4TPURT090wOh5v9odTS4i286VPtXbVuwv4JQLnmuZga4+V3sN0WbSMlH6T8cauDzWS
	kG2gXC8e4q5IsBdh6drB8/QTKs7y7nnTV5XfutbEEbsxEDyQIekjKwrxxwIYOR+x6NULNWocWt/
	RD3e/15CLGHMg0g1JGG+sU/jUdkgHQKJ05HhaxqmXMVbVSBG1fSABlgIAG0UwbH+X8G4m6lDKvx
	uhOe8csA3rYIwgu1woMZEG5mIHQvJ87CisJPmzkqCnVoGifHPl9RzAU81Yalv2ZDZ6cKwRfajUi
	aUjg49RPRsfsui698UMzF0GBALU2aZVe8GyjYu96T92pyr1sz+AK4ZOIy7924CvwhsiHD7mmBXb
	8KSKE4B3oMWFuGyQSrNGfBuB3+W5gFLC/zK4FtDTiNKsZc313fZBT8kJ
X-Received: by 2002:a17:90b:3ec8:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ae6ed47185mr2035559a91.24.1793295307219;
        Thu, 29 Oct 2026 10:35:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm5327703a91.11.2026.10.29.10.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:35:05 -0700 (PDT)
Message-ID: <3dfe3089-dd17-48d3-9ac1-5ee26b62e256@gmail.com>
Date: Thu, 29 Oct 2026 10:35:02 -0700
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
Subject: Re: [PATCH net 07/11] net: au1000: fix buffer descriptor free list
 insertion
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261027223140.3774570-8-f.fainelli@gmail.com>
 <179329051744.3134.5754193683869445346@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179329051744.3134.5754193683869445346@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/26 09:15, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message and Fixes: tag present this as a functional
>    bug fix, but the bug never affects runtime behaviour.
> 
> --
> 
> net: au1000: fix buffer descriptor free list insertion
> 
> The patch changes au1000_ReleaseDB() so the returned descriptor is pushed
> onto the head of aup->pDBfree with its pnext pointing at the old head.
> This matches au1000_GetFreeDB() and the list setup loop in au1000_probe().
> It is tagged as fixing the initial git import.
> 
>> ReleaseDB links the old head to the returned descriptor and makes the
>> returned descriptor the new head without updating its stale next
>> pointer. This loses free descriptors and can create cycles. Link the
>> returned descriptor to the old head instead, matching GetFreeDB and the
>> list initialization.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index c0e38a507f892..f8976e324f0e7 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
>> @@ -583,9 +583,7 @@ static struct db_dest *au1000_GetFreeDB(struct au1000_private *aup)
>>
>>   static void au1000_ReleaseDB(struct au1000_private *aup, struct db_dest *pDB)
>>   {
>> -	struct db_dest *pDBfree = aup->pDBfree;
>> -	if (pDBfree)
>> -		pDBfree->pnext = pDB;
>> +	pDB->pnext = aup->pDBfree;
>>   	aup->pDBfree = pDB;
>>   }
> 
> [Severity: Low]
> The new linking looks correct. Can the old behaviour actually be seen at
> runtime, though?
> 
> au1000_GetFreeDB() is only called during the first ring fill in
> au1000_probe(), before any au1000_ReleaseDB() call can happen.
> 
> au1000_ReleaseDB() is only called from two teardown paths. In both, the
> next steps free the descriptor buffers and the au1000_private that holds
> pDBfree and db[]. The first is the au1000_probe() error path:
> 
> au1000_probe() {
>      ...
> 	for (i = 0; i < NUM_RX_DMA; i++) {
> 		if (aup->rx_db_inuse[i])
> 			au1000_ReleaseDB(aup, aup->rx_db_inuse[i]);
> 	}
> 	for (i = 0; i < NUM_TX_DMA; i++) {
> 		if (aup->tx_db_inuse[i])
> 			au1000_ReleaseDB(aup, aup->tx_db_inuse[i]);
> 	}
>      ...
> 	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
> 			  aup->vaddr, aup->dma_addr);
> err_vaddr:
> 	free_netdev(dev);
>      ...
> }
> 
> The second is au1000_remove(), which runs the same release loops and then
> calls dma_free_coherent() and free_netdev(dev).
> 
> So nothing ever walks or pops the list that the old code corrupted. The
> lost descriptors and cycles in the commit message would not cause a leak,
> a hang or a wrong DMA buffer.
> 
> Could the commit message say that there is no runtime impact, and could
> the Fixes: tag be dropped so this does not go to stable and the net tree as
> a functional fix? Another option is to remove the au1000_ReleaseDB() calls
> from the teardown paths, since they have no effect.
> 

Agreed. The free list is never consumed after au1000_ReleaseDB() runs, 
so the incorrect linking has no runtime impact. I’ll drop this patch 
from the fixes series and leave removal of the redundant teardown 
bookkeeping for separate cleanup.

pw-bot: cr
-- 
Florian
