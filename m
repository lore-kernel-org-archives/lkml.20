Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76253E120B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277457; cv=none; b=GfkgPa2n5+xUPGGYYQWmDm7ZpxmVIlNwqGjL/NTs9Xb3D7U+lsnFzhy0D0/QfBnPxgNeMYm7cwP4K8jdB9lhZe2wmAUEVMZoJnzNGqSuRaZ2/GMROuwZFlQJKbU+Gj9Pof7OhUnPSEvyV7tDwELpegLUhQiX4LW8d9JKopJGKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277457; c=relaxed/simple;
	bh=hvVhg+aYOQ3FIHCUsZmXPOdl3GO5m/J5KeUDelJbR+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLRHSjSgTvLe7XTrcBfn8s5zu5Zhh2pUjxUseDih/gvoANUkM6Gm2WEupPnjfPWoHORhPjX6mZso2cxNp98K6sqenkJB5FTycjkAa7ZpMrTzVlBW4RPKef28JMaN3DfFBK+I5nF9hY8JhBLO5+e8rNbDUk4mk8Hkrijh3UEFfIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwsJr5o2; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwsJr5o2"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b6200eb0so74895a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790277455; x=1790882255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+WPKyUAs5bceQgDWCS1geYvYJl9Cc9+dR6UJDwEd9M=;
        b=FwsJr5o24U1CKqGr9nw9kLKbNnv4sxeopzqL6nPP+HFT2k6zYz1Slm7/dX+U+4+P1B
         6VBYlf2NS4jgsz3C+o8j2+mE+wXXDTw0P1oT6E+FC36V5BE/IvHi5dkIoXtSh7DxjfRS
         yk76ky6pd18Jc+nj77rJIwbjE8LBKbLCAA1dpPVneJs76JaDZrwYLPhOJH39qN5USY7s
         mbznRLVLq/nAmMWMlyhK489Ma2EP3Vz9Y8e/n+/IhF3plJDNtQlgF9QrDyWrgdJLhrSg
         BM9lag+BieybUfPCwwI55B+0n1YybSQSEbyiwtM4mxAU7UoqUKKHcy0w4Y7YSeHdf4Cz
         iWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277455; x=1790882255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+WPKyUAs5bceQgDWCS1geYvYJl9Cc9+dR6UJDwEd9M=;
        b=Fe5SbOCgTWXxmwaHZffEbqEjjfkFdFKDUBvSotCxKFksX2gH2ucAdI5WCsKhhLHjIO
         cpXelkYPxX+LyiCF1c4mzXtPNfC46/WilkY2Aei5Gtxr88/A1uFpey5o4rguLqFut3mQ
         JMu2SCQ/2+7WvjTt+2bQr6uF5MGlFcFnwSHUKDJ78ff+xuGDZY92m7lK5lkc0SKQkqTY
         qaMxovFARhPs04eTFRwDpOOQqI0B/ZujPcCitHlohNJfYEsw0lI0n1ipkm9Q3kVg4HIl
         BeIoGXyH6SKFmKC3xote48a4dbSolH/0Ls0Y5wsUfzUUBM3F8JfWo9v5lIAkE7RpJ1XP
         AqmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzlE4+jXKDBHvcffHCTER5v6UKa9R2LPg0F78ndrO517w4hDfSL3NxCyDuvh9h0ViW1Gity/PuM4IXOf4=@vger.kernel.org
X-Gm-Message-State: AFuF++kp5KFIGrpCZ8JqBUpKznFsnoULwQrz2TEYqEiXi9Ro4u1IobK5
	MOmk36Gp/FJwwP1xWcr+420tQ73kInKwXQYwGVVsxLQohf1oyfkRT6gk
X-Gm-Gg: AYBFou34ceM+g3imfaoL95k8DihGf90d7BTgKkmBj7ZlnpiSf0hRZ8ezN/BbvHEM9Yh
	E047C61b3moQ1Nv9Taw+71DaJSCLhXSssZldH3ZTcEAXr7RKHYIe+iC8zpUNbEGDgP7UcxlTY88
	rpQJrXyYqAZ6wHpHwFVRonRRZeeuny5sAT+jVRoFPfSBJAzdtRIEqgwh0PZfmjRLhW24e4TeG+T
	UQfJZeP3Qr5mRFJ1lCTxUBOTN5pSMJBiajhbs9R4AUHKokgZI6iv3A/Z/7baHFtGyEQ6dsTRW9l
	4jfvXQfYl150rmREHf4GuTZXcYYgtHia/8Z78bkP7g97JzD3li5UfD1Rc8UP7e1uJBVCP2ndxNH
	G7QlH7jAmiCNKPdYVOFYV3xW6cX1QyXTiCBvvdCgeYr+ChRIWOnUYOomWGKYIMpljZxJ7w1Efcz
	pWzYVMi39c7mF6CR1vopGEW2LNybF4VnJKPkRGkMCXOTodTA1AJrhb8JelUqXf6vafwtb6VOEIQ
	nhEdHbQ3aJTcKRILjatAfqU110LCfuK1Q==
X-Received: by 2002:a17:90b:1644:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a098967e86mr3378016a91.45.1790277454526;
        Thu, 24 Sep 2026 12:17:34 -0700 (PDT)
Received: from nineveh.sos.local ([131.191.24.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm96097a91.6.2026.09.24.12.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:17:33 -0700 (PDT)
From: ctdk <jbingham@gmail.com>
To: hch@infradead.org
Cc: brauner@kernel.org,
	djwong@kernel.org,
	jack@suse.cz,
	jbingham@gmail.com,
	jkoolstra@xs4all.nl,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] minix: unify the v1 and v2/v3 itree code paths
Date: Thu, 24 Sep 2026 12:17:33 -0700
Message-ID: <20260924191733.433874-1-jbingham@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <arJ8Mpef2gSLvKos@infradead.org>
References: <arJ8Mpef2gSLvKos@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 at 06:01:38 -0700, Christoph Hellwig wrote:
> I think this is a good idea, and should make the code more maintainable
> forward, as well as simply your iomap conversion.

It should help immensely with both of those things, I think. More than
one reviewer of the iomap conversion has been left scratching their
heads over the weird tricks both required for the iomap conversion and
simply already present in the module.
 
> A few comments:
> 
> > +	/* Set the direct block and indirect block depth now that the rest of
> > +	 * the version-specific settings have been set.
> > +	 */
> 
> Please use the normal kernel comment style:
> 
> 	/*
> 	 * Set the direct block and indirect block depth now that the rest of
> 	 * the version-specific settings have been set.
> 	 */
> 
> > +	sbi->s_direct = MINIX_DIRECT; /* Always the same. */
> 
> No need for the comment I think.

As I believe I said somewhere, I explicitly loaded this RFC patch to
explain what I was doing since I was looking for comments on it. I
erred on the side of verbosity because I was looking to undo something
that had been this way for at least 21 years, and probably much longer.
I was already planning on stripping the excess comments out, but thank
you for the reminders about style and line length. This applies to all
the comment and style comments below, to save space.

> >  	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
> >  	if (INODE_VERSION(inode) == MINIX_V1)
> > -		stat->blocks = (BLOCK_SIZE / 512) * V1_minix_blocks(stat->size, sb);
> > +		stat->blocks = (BLOCK_SIZE / 512) * minix_blocks(stat->size, sb);
> >  	else
> > -		stat->blocks = (sb->s_blocksize / 512) * V2_minix_blocks(stat->size, sb);
> > +		stat->blocks = (sb->s_blocksize / 512) * minix_blocks(stat->size, sb);
> 
> v1 always sets s_blocksize to BLOCK_SIZE, so this can simply become and
> unconditional:
> 
> 	stat->blocks = (sb->s_blocksize / 512) * minix_blocks(stat->size, sb);

Noted.
 
> > +extern int minix_get_block(struct inode *inode, sector_t block,
> > +		struct buffer_head *bh, int create);
> > +extern unsigned int minix_blocks(loff_t size, struct super_block *sb);
> 
> Please drop the extern for all function declarations that you touch.

I figured out that we no longer need to have 'extern' in the header
declarations after I submitted this patch, but thank you for the
reminder.

Somehow this reply hasn't shown up in my inbox yet, but fortunately I
was able to find it. I'll get this turned around and send out the new
and improved versio shortly.

Thanks again,

-j
