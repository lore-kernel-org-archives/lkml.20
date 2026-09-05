Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E644A3412
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619518; cv=none; b=r1u4QYm+VcwB6JOml5tNHbHqqHWHJ2ziKJBC64xNFm9nWXx3l8pE0zKqsF0ePeolGFhEuXT+od5dVGCOdPHIXxfE68PqGHzhJbPVLMe4gHIwvYEjDBKmivb+rwcrUtHLannmum5nPpy7EHpikdY3Dfk2H6O10h1dGicmViG5ql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619518; c=relaxed/simple;
	bh=3dSaD3qzEawWjYdUkb2MHJo1tgSjCE1Kkoj7/OKb2TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/UqMsqltgANFXJ8PKsQuCl5SC0xJ3mmdA+WEoWCR5+5R6PL36rawRiLyQAsPPfT27PdXHMloneA+wodyC9PYBYr1WLfx8lGLznhi0NnPSuygpkkjuc0grtB8L2UxVBht/RCOl+sadkGQjdrlknkH1eVDQmYcvXqTNwzNTw3CXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SqNiXqOF; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SqNiXqOF"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so94322f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788619513; x=1789224313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=up/rgxumaxsCy5JEMTBUZLpY+yoJXx9XvOAZd1MctPw=;
        b=SqNiXqOFqCcPpxOP/h1yMkERrUq8SvCZprQrDjTBQGNoiK4ME4qCHxyFOjI/or/H9p
         rwoiI23ZFvShfxreUWQzUqPfMRV+5jgfe7P4PhzB/owpaXzNVBWHTLwP7iKVap63brK+
         fbJ4bjB8P7I6eDKrIg91LtNkI75VVssExjP+EyuJhnjcGtQU7v68BKfa+E1WYcwUbxBg
         WMd3nwk8N8YVyTIdbgp5s25FpqmP5vmlCzOpX1ISPOwzgaAq+0cXZhvpItUj8Ji690if
         0e4Y0OuZQmadUtWKNe0iXxouoRc6b/f7eQPTWXu0HFUxV/3jzBEoAkIUaNfACc2lPNyP
         wfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619513; x=1789224313;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=up/rgxumaxsCy5JEMTBUZLpY+yoJXx9XvOAZd1MctPw=;
        b=BWcMIeR5ym7KOhyL2B7PvBPixc3s3v7TtO78AkcrsEenk6XIrbQlvBaAwpg2kAJxg4
         ejsbYYzLUkG4pB6wmpbzjx4BWEeVJX+K+yj1o9JZlSGx2JVm8cEgxPG+nqkkwN56TDvp
         aua+j1i4ABH3lFzbGZDYQKH6y1Wl/29o7lLCMv7cAG/HVQVPJrAcBSD5QLPpHd272aNM
         j/eKj6z6NG+2x08e2agvKUFz9o8T6IBXoECh1+XU/IDvE4QGk8dXBhT+s4nE0GsDt1ei
         4jFV/DOK46vGYW8M+tCq7Gnxpj9gJHj/8XaEtCpPmpfHikkydYBmVQca/vWzbNHRs/Vv
         NbsQ==
X-Forwarded-Encrypted: i=1; AKwUvBykn3QiSg+P+HDoqwrehgcsTmMrAxrviCEKMcSA121l9A+VKkxgO7QvGzSbLdMPOx/ZIoSni+sC03JGXLc=@vger.kernel.org
X-Gm-Message-State: AFuF++mzOQI/eVLsgKSPj2QYWAsBNr4eo8adJjEAL9ZIWn+70dvC/1CX
	tLvuToYY0sfvQCmwv5xmZl7Uu40CDu03uUY+e7Xvira4hZb6jdtW/YKpD7ChYW2PXBs=
X-Gm-Gg: AYBFou1CVponrG9BBmva9MNvsWJpXPAGRuQm9Sh012fvBiaBekoW/6dTt6moqKqjLZ3
	jmVTOBTtujHYL6/JcBJoh2VNv1o2tetGB62sVg4h4E0GtnQN3kvTEZtNNz9NnhwCUTqzfVSEy6Y
	IS1hY4qrp3gJxGMts6PgiVuuEQn/FLxtzNfuF7rNnaSMGfqQ0rfugUpWtsMCyhBMmkWs92M1yAf
	IhWjhDNMM9M6ggSCNm+mVZA+f5lj9tTbiOHK2D2FcT40xbcbMY7FzJLMje8phn0m5ZEpFo2DMde
	pdLvI1zdxSUW5cqAlDRSbLGFPPvP0g8jBi9KQFdYaZixUYZnXDiHHLMPNOdb8ZAuD3zdawH0Y1/
	I1sB2jMJjmuRmQ1CV5M7XiQzm8in3anrV+b97BgMBzONzein5lxJYcx+UPDFuufOoxXNYCba5VO
	Z4Yeo/d3gifLNigvQHUL7AhDJP9L/89Cf46/2/Ye8cIlqkuojkU0UwvC2fnYdzLwH0tLGbnA==
X-Received: by 2002:a05:600c:8b2e:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49d01dcc1fdmr48391805e9.2.1788619513504;
        Sat, 05 Sep 2026 07:45:13 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm10186499a91.13.2026.09.05.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:45:11 -0700 (PDT)
Date: Sat, 5 Sep 2026 22:45:08 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ocfs2: validate dl_blkno and dl_fs_generation of
 dir index leaf blocks
Message-ID: <apwp-6JMpJckN3If@p15>
References: <20260905142144.2869105-1-joseph.qi@linux.alibaba.com>
 <20260905142144.2869105-2-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905142144.2869105-2-joseph.qi@linux.alibaba.com>

On Sat, Sep 05, 2026 at 10:21:44PM +0800, Joseph Qi wrote:
> ocfs2_validate_dx_leaf() checks the checksum, the signature and the
> entry list counts, but it never checks dl_blkno or dl_fs_generation.
> The inode, extent block, xattr block, refcount block and dir index root
> validators all check the on-disk block number against bh->b_blocknr and
> the generation against the superblock, and both dir index leaf fields
> are documented as "Must match super block".
> 
> Without the checks, a stale dir index leaf block left on the device from
> a previously formatted filesystem at the same physical block number can
> pass validation as long as its signature, entry counts and checksum
> match.  Its index entries would then be used in the new filesystem
> context.
> 
> Both fields are written unconditionally when a leaf block is formatted
> in ocfs2_dx_dir_format_cluster(), from the live superblock generation
> and the real block number, so a correctly formatted filesystem cannot
> trip the new checks.  The leaf block number read back here comes from
> on-disk dir index root extent records.
> 
> Reject dir index leaf blocks whose dl_blkno or dl_fs_generation does not
> match, like the dir index root validator does.
> 
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/dir.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
> index 329680b46227..55c4a305a282 100644
> --- a/fs/ocfs2/dir.c
> +++ b/fs/ocfs2/dir.c
> @@ -733,6 +733,18 @@ static int ocfs2_validate_dx_leaf(struct super_block *sb,
>  		return ocfs2_error(sb, "Dir Index Leaf has bad signature %.*s\n",
>  				   7, dx_leaf->dl_signature);
>  
> +	if (le64_to_cpu(dx_leaf->dl_blkno) != bh->b_blocknr)
> +		return ocfs2_error(sb,
> +				   "Dir Index Leaf # %llu has an invalid dl_blkno of %llu\n",
> +				   (unsigned long long)bh->b_blocknr,
> +				   (unsigned long long)le64_to_cpu(dx_leaf->dl_blkno));

The patch looks fine to me.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>

Only question: Do we add the same check for dl_blkno in ocfs2_validate_dx_root()?

Thanks,
Heming
> +
> +	if (le32_to_cpu(dx_leaf->dl_fs_generation) != OCFS2_SB(sb)->fs_generation)
> +		return ocfs2_error(sb,
> +				   "Dir Index Leaf # %llu has an invalid dl_fs_generation of #%u\n",
> +				   (unsigned long long)bh->b_blocknr,
> +				   le32_to_cpu(dx_leaf->dl_fs_generation));
> +
>  	if (le16_to_cpu(dx_leaf->dl_list.de_count) !=
>  	    ocfs2_dx_entries_per_leaf(sb))
>  		return ocfs2_error(sb,
> -- 
> 2.39.3
> 
