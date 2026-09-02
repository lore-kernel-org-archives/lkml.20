Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209A3AAF5C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382372; cv=none; b=hM+p3QKOiHHCgQ1NxzIJhQCroPcF8ri1eV//QRbEIoP1Ri+arNy833CwqkWDaK6FVgrF9GWkkPcH6xLMxXuk9881rJ6D8imOKzPYUkUbtbQyS/W3FYH/HaM/Jr5F1UYGb/BrlTDzwg2Eo3pg+tpTTVpFQCry/3lHcVLhn31ACCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382372; c=relaxed/simple;
	bh=/BadFUsA3OstmHGhfK99QbnF/NkulvL8khR/iLpaHno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6mSuL+4acYyKn7eOoRVJiBcY13AMkaURMoOI81fc0DYm9jHeBJ3zLQRUZB0DMqpQV4ADvM1mY6jOx+L2qLAYTUTbFulcCckpw5I1X0FxHFlDxOspF5W1ZUzaElZtqNq+jM/l2v16zIrjn89f4BsDpqhNQVlvs1yn9CXNb6r1yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1xFPzzy; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1xFPzzy"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2223807b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788382369; x=1788987169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXjufAEosIj1q8FXumUFsTj098OQ/YAIZCUC7EsihNw=;
        b=C1xFPzzyJe6Xcw5H6uguX8gbdFiLTeqdfE9McpcpgiEBn2hdYvKAsXzJL5s+fovqf5
         mozyYL3r+hSAeBLzk4kiCl1wbhoKyeUqD6c3Kv/zvn0IdxSppVDB15XxF1WdAf9rMpr3
         J4RRJh0XZKkLpxWSzPl9qwGSLRgui6DIrPcuIOfELYBimO88NOIEkjNNmFY5dtl8sl8Y
         lESZSUcj8+r8afHpEXPHolYRXgFaPpAq5GIqz0UJ1kfQU1g19gN1XTaHmHIf8LuBT1A/
         bwEDhecpph8l5aVYn19tXLnRTZePi9WpseEUHzvn2M0Te5HvmbpcqgEWEKXmL5pF4xx4
         M6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382369; x=1788987169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXjufAEosIj1q8FXumUFsTj098OQ/YAIZCUC7EsihNw=;
        b=HOwZuRxyWOyI7dR6CirUenTxI+vP6xcfrD/vDM2p0Y15q5JQ0xGc0uxuDp+HOKsMuu
         NNcCY4cn5leMO4Qyj+5AX+Tz7AGyHy8n0KHrmB1LLtpw4FdNa4ihNVmlg0Ma3w157exG
         mKcViNELbNk1bheFazN7B59jpBHKwv5q3S2OOyLG+tLxT2giJQNKCmRl45NSkjiXCB0/
         dEKDp4jZUvqa3glZX60cMeCVwKsRXVy4hfNAexjY0U154h8rwUwJJo9gLqi+rS44q2PY
         KBwSBAwlit8vPPSp54nAFRRX7Shd8Uqdh+tD1/5HZWv86seq2yWveTMAQ/abU2DBpFU8
         jpxg==
X-Forwarded-Encrypted: i=1; AKwUvBy3PcAerv/QoMybdnhQJAiWo9Lc2ERhan8iP90av89c1616RgKYNwKtKYiIX7itMdq2lvTWD24BNTBSw7k=@vger.kernel.org
X-Gm-Message-State: AFuF++kXyonImFyYfhDQzZbIG81RtO+4muPDR3P8n/DHOqHKxG2Tedmn
	atg0Zrd4xTIU4x55BmEGSd0R3o0DoYYwFR2XsUrmENUePblqi6EMeXCS
X-Gm-Gg: AYBFou3Ak2slIgoF7J62gPdw7R7lkxRALi/5BFkdsb7f2E5N2uptetrsx5kYp5YSJJp
	To7+G4MGSBZvYIe+dT7MCgsZ79aiRiLDvzXH6kNKwSIkBnGCVw3X6CVEbBbWlmZbnASrd4JiGJc
	LVJ0Kq50HneujJZxMrUX1E6vpTYBnyGW2K6vGHYUL26MyZ7FDfTSqyoZWruL02W+TJVRavLkecg
	b7w0s5jfejWppgEFOBeuoQ31S1RdI+NiKgqWjFjG9wTsvJjGAKFNcVEvLvWEeeYi7hQziMebynE
	ewBagL6NfQnI5qnVlo4nsmw8NGGbS5izQiOVGwJdjrbhyO/pnn67FX/yk4LordqwuBaiELTBFVm
	qcyVU2yAZoFtl0MtoICMUU8vh5JFKp80LdkvizIIefORExxTuMqXaZXBYOfbtopz9RHghBOHxLg
	htVgJVdXcPlv2pt9Qc698Avj6fybPvVq+Zs3U5wfct8h6rBzY8l5+FlIsFqwd4dOSe
X-Received: by 2002:a05:6a21:6004:b0:3d0:88f5:f813 with SMTP id adf61e73a8af0-3d9b05238admr12663995637.11.1788382368648;
        Wed, 02 Sep 2026 13:52:48 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:4bb2:9d5:1e62:39c6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592d9c5sm642702eec.11.2026.09.02.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:52:48 -0700 (PDT)
Date: Thu, 3 Sep 2026 02:22:24 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Luca Weiss <luca.weiss@fairphone.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] buffer: fix NULL dereference of bh->b_folio in
 __bh_submit()
Message-ID: <apiMiLlwujmqyYLP@user>
References: <20260902013357.2815214-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902013357.2815214-1-joseph.qi@linux.alibaba.com>

On Wed, Sep 02, 2026 at 09:33:57AM +0800, Joseph Qi wrote:
> Commit a2c924c240e7 ("buffer: set BIO_COMPLETE_IN_TASK for dropbehind
> writeback") added an unconditional folio_test_dropbehind(bh->b_folio) in
> __bh_submit().  But jbd2 shadow buffers have a NULL b_folio since commit
> 5febcba29792 ("jbd2: point the shadow buffer at the frozen data
> directly") made them point b_data at the kmalloced frozen data rather
> than a folio.  Submitting such a buffer during journal commit oopses:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   RIP: 0010:__bh_submit.constprop.0+0x87/0x120
>   Call Trace:
>    jbd2_journal_commit_transaction+0x932/0x1b10
>    kjournald2+0xb2/0x250
> 
> Hit by the ocfs2-testsuite fill_verify_holes test running with
> data=writeback.
> 
> Dropbehind only applies to buffers backed by a folio, so skip the check
> when b_folio is NULL.
>
Hi,

I was working on a fix for this syzbot report [1] and didn't realize that you were
already working on it. I noticed your patch on the mailing list, so i won't
send a duplicate patch.
 
> Fixes: 5febcba29792 ("jbd2: point the shadow buffer at the frozen data directly")

Could you please add the Reported-by: and Closes: tags from the syzbot report
to your patch? This will help syzbot associate the patch with the reported
issue and track the fix.

[1]: https://syzkaller.appspot.com/bug?extid=41453ea05ab61c075f1f

Thank you,
Pavan

> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/buffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 427d8a817cd5..f46fa6413032 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -1106,7 +1106,8 @@ static void __bh_submit(struct buffer_head *bh, blk_opf_t opf,
>  
>  	bio = bio_alloc(bh->b_bdev, 1, opf, GFP_NOIO);
>  
> -	if (folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
> +	if (bh->b_folio && folio_test_dropbehind(bh->b_folio) &&
> +	    op_is_write(opf))
>  		bio_set_flag(bio, BIO_COMPLETE_IN_TASK);
>  
>  	if (IS_ENABLED(CONFIG_FS_ENCRYPTION))
> -- 
> 2.39.3
> 
