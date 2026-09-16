Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426674A4857
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559272; cv=none; b=dG4R4XoC+o+PdSFyz7X8kdIGmtRP41aNa9+EpzvwIlyjeICsEmvaC7FPLW2YpQyoih939l1ALyNHVpMGlkU0A/gvJHM+F4Zf5/bzuBQsEXDr8dYR0QHVRPz+R3zrn2nzBMQUak9XtWZm/e1kcbYlk2o2jWfaT/cR46eDixwmcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559272; c=relaxed/simple;
	bh=Tzk1UCeRRQgWv+uee8FcZyqpdtE2izuFxuleEU2KXy4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T0DSrBmCvzsudzAxAbXbnXxYgt78xUrFlEq7yM0zI+gm1ngS2rxjq17XUTzhadWeSHAnWs6rv7R3QUpg1v7f34HcfX5Mr/y1fB0fEo2ydYsLLlXQnC9yEOZnht7patpw2OWOearjMKMyfm8gDMw2TDgtcj4K4+hG1AaIQfHEc3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=df6kpMoQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="df6kpMoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789559262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ao6TiiHWDUQrSpbHW+Bi0jmiUJWb8gLIpc7usmTVm5k=;
	b=df6kpMoQLCdxNy6fl9Wcyn+Nv88ajsQnfo/aAI9Mf51MHwpU9wWAJYR0g7cwuRUlVrwKi3
	n0uClkNX01ydTAYWmzpYAgSNP+focypYPksFsoMDSLi8yDfOm5LRDJj0CC666VyH1Zfvby
	r3mv4hd5tse/Bb4aDBNtKASCOhvvrvQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-hlzttHNcPJ-wNcDDed7CHw-1; Wed,
 16 Sep 2026 07:47:41 -0400
X-MC-Unique: hlzttHNcPJ-wNcDDed7CHw-1
X-Mimecast-MFC-AGG-ID: hlzttHNcPJ-wNcDDed7CHw_1789559260
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8FC71935DC4;
	Wed, 16 Sep 2026 11:47:29 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 417AB7C0;
	Wed, 16 Sep 2026 11:47:28 +0000 (UTC)
Date: Wed, 16 Sep 2026 13:47:25 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Quchaosheng <quchaosheng000406@163.com>
cc: linux-kernel@vger.kernel.org, 
    syzbot+7d1563afac6cb196a444@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] hpfs: reject dirents with an invalid length in
 hpfs_count_dnodes()
In-Reply-To: <20260916073354.40306-1-quchaosheng000406@163.com>
Message-ID: <5b039133-96c2-6b51-a2f2-da1205234ed6@redhat.com>
References: <20260914013801.394622-1-quchaosheng000406@163.com> <20260916073354.40306-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Hi

This is already checked in hpfs_map_dnode - see the line
if (le16_to_cpu(de->length) > 292 || (le16_to_cpu(de->length) < 32) || (le16_to_cpu(de->length) & 3) || p + le16_to_cpu(de->length) > 2048)

It seems that you disabled checking with the "check=none option" - this 
option does what it's supposed to do - disable filesystem checking.

Mikulas



On Wed, 16 Sep 2026, Quchaosheng wrote:

> syzbot reports a slab-use-after-free in hpfs_count_dnodes():
> 
>   BUG: KASAN: use-after-free in hpfs_count_dnodes+0x854/0xb20 fs/hpfs/dnode.c:773
>   Read of size 2 at addr ffff8880471a64d0 by task syz.0.17/5986
> 
>   HPFS: de_next_de: de->length = 0
>   HPFS: dnode_end_de: dnode->first_free = 7b3184b6
> 
> de_next_de() adds the dirent length to the dirent pointer:
> 
> 	static inline struct hpfs_dirent *de_next_de (struct hpfs_dirent *de)
> 	{
> 	  CHKCOND(...);
> 	  return (void *) de + le16_to_cpu(de->length);
> 	}
> 
> CHKCOND() only prints, it does not abort the operation.  When a corrupted
> dnode contains a dirent whose length is zero, de_next_de() therefore
> returns the same pointer it was given, and both loops that walk the dirent
> chain in hpfs_count_dnodes() spin on one address until they read past the
> end of the dnode.
> 
> hpfs_map_dnode() does validate dirent lengths, but only while the "check"
> mount option is set, and only up to dnode->first_free, so it does not
> cover this walk.  The default "check=normal" mount option documents that
> "it should not crash", so the walk must be safe on its own.
> 
> Reject a dirent with an invalid length before using it to advance, in both
> loops.  The validity check matches the one in hpfs_map_dnode(): at least
> 0x20, at most 292 and a multiple of four.
> 
> This only changes the read path; de_next_de() itself is left alone because
> it is also used by the write paths (hpfs_add_to_dnode(), hpfs_add_dirent()
> and delete_empty_dnode()), where silently clamping a length would hide
> filesystem corruption.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+7d1563afac6cb196a444@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7d1563afac6cb196a444
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
> v2: Add the Fixes: tag and use Closes: instead of Link:, the whole bug is
>     fixed.
> 
>     Resend: v1 never reached the maintainer.  The 163 SMTP relay was
>     rejected by artax.karlin.mff.cuni.cz with "554 5.7.1 Helo command
>     rejected", and the HPFS entry in MAINTAINERS is stale -- the address
>     used for the last fs/hpfs/ commit is mpatocka@redhat.com.  Addressed
>     there now.
> 
>  fs/hpfs/dnode.c   | 22 ++++++++++++++++++++++
>  fs/hpfs/hpfs_fn.h | 14 ++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/fs/hpfs/dnode.c b/fs/hpfs/dnode.c
> index 8c6aa060f..224be4124 100644
> --- a/fs/hpfs/dnode.c
> +++ b/fs/hpfs/dnode.c
> @@ -767,6 +767,18 @@ void hpfs_count_dnodes(struct super_block *s, dnode_secno dno, int *n_dnodes,
>  				ptr, dno, odno);
>  			return;
>  		}
> +		/*
> +		 * de_next_de() returns de itself if the dirent length is
> +		 * zero, so a corrupted dnode would make this loop spin on
> +		 * one address and read past the end of the dnode.  Require
> +		 * a sane length before advancing.
> +		 */
> +		if (!de_length_valid(de)) {
> +			hpfs_brelse4(&qbh);
> +			hpfs_error(s, "hpfs_count_dnodes: bad dirent length %u in dnode %08x, dno %08x",
> +				(unsigned)le16_to_cpu(de->length), dno, ptr);
> +			return;
> +		}
>  		de = de_next_de(de);
>  	}
>  	next_de:
> @@ -779,6 +791,16 @@ void hpfs_count_dnodes(struct super_block *s, dnode_secno dno, int *n_dnodes,
>  	process_de:
>  	if (!de->first && !de->last && de->directory && n_subdirs) (*n_subdirs)++;
>  	if (!de->first && !de->last && n_items) (*n_items)++;
> +	/*
> +	 * Same problem here: an invalid dirent length would make the
> +	 * "next_de" loop below revisit the same address forever.
> +	 */
> +	if (!de_length_valid(de)) {
> +		hpfs_brelse4(&qbh);
> +		hpfs_error(s, "hpfs_count_dnodes: bad dirent length %u in dnode %08x",
> +			(unsigned)le16_to_cpu(de->length), dno);
> +		return;
> +	}
>  	if ((de = de_next_de(de)) < dnode_end_de(dnode)) goto next_de;
>  	ptr = dno;
>  	dno = le32_to_cpu(dnode->up);
> diff --git a/fs/hpfs/hpfs_fn.h b/fs/hpfs/hpfs_fn.h
> index 237c1c23e..95330fe7a 100644
> --- a/fs/hpfs/hpfs_fn.h
> +++ b/fs/hpfs/hpfs_fn.h
> @@ -126,6 +126,20 @@ static inline struct hpfs_dirent *dnode_end_de (struct dnode *dnode)
>  
>  /* The dir entry after dir entry de */
>  
> +/*
> + * A valid dirent length is at least 0x20, at most 292 and a multiple of
> + * four, as checked by hpfs_map_dnode().  de_next_de() adds length to the
> + * dirent pointer, so a length of zero would leave the pointer where it is:
> + * a dirent walk using it would then spin on the same address and read past
> + * the end of the dnode.  A length that is not a multiple of four would
> + * misalign the pointer as well.
> + */
> +static inline int de_length_valid (struct hpfs_dirent *de)
> +{
> +  unsigned int len = le16_to_cpu(de->length);
> +  return len >= 0x20 && len <= 292 && !(len & 3);
> +}
> +
>  static inline struct hpfs_dirent *de_next_de (struct hpfs_dirent *de)
>  {
>    CHKCOND(le16_to_cpu(de->length)>=0x20 && le16_to_cpu(de->length)<0x800,("HPFS: de_next_de: de->length = %x\n",(unsigned)le16_to_cpu(de->length)));
> -- 
> 2.43.0
> 

