Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319436;
	b=v0xGFmH0YixyTbVAJHWSXqVr71ygS2exUtelmM1Ymyaag/PGSy8HkCySUmdX194g9VCL
	 wTpvnEK2tafd8F3Mvh67yGz1yEvZdcD/pNAkjSdXBTB/g7eiQRadQOhkCdgCVzTC+fVat
	 SZ0HDKcLD7NRIMAJTH8xb9xKyIz4EVKeFlvor5Ts+dtovA7DGgggrZYgOg517A+HkQb4h
	 w7nYwAezmNWSCFSASl/F+xpNXNg1l/uKMHpAsR1WaX76k1spYC/ZdH5yDETEsLGV9qmzw
	 0SVN9pLhtU0DUsqkOvWEHWCue/bIVQBZhtlFFNZEfi69j2RhKDaRp0lZfDRQ4skjl8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=LmeHeiyAlUzpahmPYHz4GdQzrqGVFRf1t8/WmrIMmcY=;
	b=YC5U34I4I+BHRW2c+AWecPUsB6XxbSGHJIy1svJxsr5YmiyMYKL5BE0oiEpr3wOJhEL5
	 uULTE72ojCsgrceJneRw1V4rO9GWERUxjK/flskHP5pPcmnIb++FKQ/OoIKU2vgnQJAgR
	 GF1HjNdvTcN24K/w5zwGOwBf/fQhEM2fJWtePsHYCJhn8ZDHG0fs2nu3TPWj/u0pcU2BX
	 v0htmx9ZPXtIkvFbAsoitc2mHRp1EW3Mn6RPF8q+McS3w3Xm95KGXBxND+29FDPKuQmQx
	 dVP/c3pO9Ukx3cQrnzcdOVP9eNxcdT8LE05LZTfQp9YwH57Ywbzh3esCriL4fLgHSzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZKsHvp+;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5CD606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5CD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZKsHvp+
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1553008c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794319435; x=1794924235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LmeHeiyAlUzpahmPYHz4GdQzrqGVFRf1t8/WmrIMmcY=;
        b=YZKsHvp+EItbb/BTe4Cp0uBR8CbFsw8A3fZCL2aJae79uogkg9eTX4pi21wbFUOM4Z
         5avHORvRexE2FxVzOTNW5yBBVVOZOFkAsgPcpH8OccxLAibaWpPrcUA8/Yhif2cP5g07
         s6YTelElwItOizFHZ5VDp/i/yj9jrOat2L7MidsOX52PBIQe6UEAd/1/g4C5eMETx8hR
         q+15EpJ1T9b++Aw2MC01OijLj+CZ7AIusX9pcpot6O6I8f8Ur/PQ+bNmnUIMhiJB/wG5
         bIDfxmrDgNOZY+X+eWq+8NMGmIxLB+Yjg41eBSdW1hMOAGlLattlkyV9cTkq9zs9UmPE
         SawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319435; x=1794924235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LmeHeiyAlUzpahmPYHz4GdQzrqGVFRf1t8/WmrIMmcY=;
        b=E/G/CF04Ouid2OGLRJCSlyPNzIIikkFa49CFgLfS1IXhmvcCkdyPR45VX/HRGdkzVc
         Mv91RU6UaxCbvPTKQPjvTzKiMTO/koI8YlGAlQKUXiv0g9dQkq5fWNnIbyTTam96ibBT
         n3UCGnHa1J9KS031k/BOv80hop+eVKXdSMLbYe9hV0Cz/0TQM3uWSfVrw1JRcaBYghbd
         jNLPw+l7V6NGeEWh21Cq82UdamFg30SXpDB3rq2UxQ1EsMSjwiAgj7IG7ybafkpHEANw
         r/ePiRF0ZXg3bphOXH/T0bRZMGoHUApFJlE95Ic9YiI6RGpKe8mlSPORVvsQFybg8fKr
         aebw==
X-Forwarded-Encrypted: i=1; AL+hErF8+iihFHYxlTaVQ+xLK8yN+MFNKTq3PAzAE81XH3KSKdYexaXqegYC4e05c5B+6/GdgIhJ4HXaak9j6DM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T5ft1RgmDPb7AhT7Z86zm6IM0dGcB1wnk0Pgyt8nFwGSdaf90
	WQbhpFad+Y2YytLUv+jH+KsxEeRNjrEHOne4L9wnakITNPDZMEpIt2uU
X-Gm-Gg: AYBFou1g1azrgvkWDv76FIaXdtE1vJrUrrwKPfvIYpQHxQrHGlXu2pCl3QrWMktJFjq
	LwtljXfIblMe7/nlwD4iSnNayEj/HTIYooLI4Twt5/yl50KiErw+QjnQTQv/wYqSPom4324avwm
	cRatMN69TDSVZlmS2mc2JZMfJF+gCrlJyhOag28bN+qKr7sOLYx2/Nj206Wh5xHzKn2KFwDDVnE
	3CQDWgTcOoe2xhZeEcl5sJiCsQKOjC34ZovlmRIaj9dlrSn2qcEsl9GJ2qBSuFNq1Q4YVMOhivf
	oJCj81MMDGElfksPuydwqKR7heeStAj8OArXNunxZwndcR8DVJErI3Ifu1MDF7ztsOOWUjuYSCS
	zHxImvXqnzr8OcT1oC0vurRgg522C+Wz3o+W+gRBye4VNlYjEGAKf1GBO/ogZP7KwIV8KDP2qif
	Nj+l+bnSJCXS490xJmPOHLfa9TvtBtdemuUCJe+ljBvNqT0mkD1EtOCwCByLhUcRlCYxqxoW2BI
	FrkIDtS3mtk/rfpOdt2bE2QleU/C3dWFM90n1+seUEkqiDShe/1N9NvwmmAdFwkLVHv3W75b12E
	sUTL6qwjkcIgey64mk5sHv5XomjVUgK30w==
X-Received: by 2002:a05:701b:2089:20b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-1b3b602d056mr3655380c88.33.1794319415066;
        Tue, 10 Nov 2026 06:03:35 -0800 (PST)
Received: from user ([2405:201:c052:b00b:e920:f0ce:52ca:a7ce])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5ba8426sm6831793c88.23.2026.11.10.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:03:34 -0800 (PST)
Date: Tue, 10 Nov 2026 19:33:04 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: dsterba@suse.com, mason@kernel.org, fdmanana@suse.com,
	josef@toxicpanda.com, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
Subject: Re: [PATCH] btrfs: Clean up delayed inode items on transaction abort
Message-ID: <avMkGGHSH2scfa0t@user>
References: <20261109202914.64371-1-pavankumaryalagada@gmail.com>
 <d3e07f45-58f3-4668-b9c2-e0cf63decd4c@gmx.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3e07f45-58f3-4668-b9c2-e0cf63decd4c@gmx.com>

On Tue, Nov 10, 2026 at 08:37:16AM +1030, Qu Wenruo wrote:
> 
> 
> 在 2026/11/10 06:59, pavankumaryalagada@gmail.com 写道:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > When a transaction is aborted, btrfs_commit_inode_delayed_inode()
> > fails because btrfs_join_transaction() returns an error. This makes
> > btrfs_evict_inode() skip btrfs_kill_delayed_inode_items(), leaving
> > pending items in the delayed node.
> > 
> > Move the error check after btrfs_kill_delayed_inode_items() to
> > ensure pending items are removed when the transaction is aborted.
> > 
> > Reported-by: syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
> > Link: https://lore.kernel.org/all/6af131f2.44d55313.247daf.0001.GAE@google.com/T/
> > Fixes: 2adc75d61203 ("btrfs: move btrfs_kill_delayed_inode_items into evict")
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> >   fs/btrfs/inode.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> > index abaa33471456..397aa64b4816 100644
> > --- a/fs/btrfs/inode.c
> > +++ b/fs/btrfs/inode.c
> > @@ -5623,8 +5623,6 @@ void btrfs_evict_inode(struct inode *inode)
> >   	 * the inode update is released.
> >   	 */
> >   	ret = btrfs_commit_inode_delayed_inode(BTRFS_I(inode));
> 
> What if btrfs_commit_inode_delayed_inode() failed but without a transaction
> abort?

If the transaction has not been aborted, we shouldn't remove pending delayed
items.

> 
> E.g. btrfs_alloc_path() failed inside btrfs_commit_inode_delayed_inode(),
> then the transaction is just ended regularly without aborting.

Agreed. In this case, -ENOMEM is returned, but the transaction hasn't been
aborted, so we should keep the pending delayed items.

> 
> In that case, won't the btrfs_kill_delayed_inode_items() call causing
> problems?

Yes, calling it unconditionally could remove pending operations even when
the transaction hasn't been aborted. I'm thinking of making the cleanup
conditional so that delayed items are removed when the commit succeeds or
the transaction has been aborted, but are left untouched on other errors
like -ENOMEM.

	ret = btrfs_commit_inode_delayed_inode(BTRFS_I(inode));

	if (!ret || BTRFS_FS_ERROR(fs_info) ||
	    test_bit(BTRFS_FS_STATE_TRANS_ABORTED, &fs_info->fs_state))
		btrfs_kill_delayed_inode_items(BTRFS_I(inode));

	if (ret)
		goto out;

I included both checks because TRANS_ABORTED detects whether a transaction
has been aborted, while BTRFS_FS_ERROR() checks whether a filesystem error
has been recorded.

Since the TRANS_ABORTED bit can be set before the filesystem error is
recorded, checking both ensures that we also catch that case.

This way, we clean up the delayed items if the commit suceeds or the transaction
is aborted, but keep them on recoverable errors like -ENOMEM.

I'll send this as v2. Please let me know if you see any issues with this
approach.

Thanks,
Pavan

> > -	if (ret)
> > -		goto out;
> >   	/*
> >   	 * This drops any pending insert or delete operations we have for this
> > @@ -5634,6 +5632,9 @@ void btrfs_evict_inode(struct inode *inode)
> >   	 */
> >   	btrfs_kill_delayed_inode_items(BTRFS_I(inode));
> > +	if (ret)
> > +		goto out;
> > +
> >   	btrfs_init_metadata_block_rsv(fs_info, &rsv, BTRFS_BLOCK_RSV_TEMP);
> >   	rsv.size = btrfs_calc_metadata_size(fs_info, 1);
> >   	rsv.failfast = true;
> 
