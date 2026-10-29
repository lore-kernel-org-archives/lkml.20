Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232910;
	b=P0ylno3rcdvCyzwSqjNcTmF+VMwyXQU/O4gixjyYUeBY8idnxUkYDtQBNayYQuCL6c4C
	 OTAHPaLyRtlPY16dYBVo2AO8VdiLzfnBAecvV51ICRkws2wjNF9XqkxjqxqYvyOSvH3/u
	 X3fEBoca7oe8uW90P6+HX1sxTgBtq57gzgAYddCr1+Aw6F77STNqjbezkHxMuOKn+OZFu
	 MyNJRwL+C3DqcBXHALFIjhHZHcEsWU9YBp7I2ZivtRZzzWdkz1yWEyueZiZRn90IU6Py0
	 kh7DT1C6QMpKczkqM51IXp5IazHLR1FswDbdLw1+WdbcmojhWe6pr/88ggmL9gtye3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AKYZnuuJaKbDAUFeC/huFk/Nq3e89+l9qvUa+yaAXe4=;
	b=jkyzoJzcqykWIg68Y/U2B9oddCcjffctMjWaOvtL4khV2Tn+gxxSWg4WSuvP4u3NSiLa
	 gmOw/K/NjtDUsifOmStM0/k+8ipDyhAnRjVuELbgPL97rXiHPJOMP7JVwP3PtVh7tbVl1
	 uhepF3qrgQzJH2zUfF2OTZRrXmQqQ63DMJceKR0b0mrT6aFmdQEcPqsfK3l3Ua+3k2ec/
	 jkHq97ProdNCRAyEJBLxTerySR+wI2cw7slG742oexPQnwQFy8vw0wjcscbWVoSqepOEH
	 wZO7h3u1zrTrxY2DScMMa2cWYqPHDthI/bqyI2GR8v4s4wUqFxkhAXiuSv9P22BTDPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cyz8+CYk;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB4606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AAB4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cyz8+CYk
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a18fc7a38so3190226eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793232908; x=1793837708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKYZnuuJaKbDAUFeC/huFk/Nq3e89+l9qvUa+yaAXe4=;
        b=Cyz8+CYknyDBoJpS4eV51HCF5lQJrBEifAr9ZMP71YDBQz+RGknXtI3BC5MLb6dDbP
         CxON6ML/0b2GNtJB3ru5xZFKMfhgSJHjqKkipsAYoWjnk1IQ8DaoRAHEDeoj77NIRFge
         NvSFxfBI0bBYS3iPDNL1MmMXZlS8qYJA4IrWrfl5K9srkikFe+vtWK4JrvIHjcRE/a8x
         aCAxRftiRLaWbFRaaHwU68bvkIwZ0lox0nBDpImcTHf1IW+i+K8qiFBqTdFPmbzOuL9O
         KCFQUsMY+VZtOjT64SB+p2r6UpRLE52PCYq93LhIODBfuSvXEYjnLy1Kffu9DqGratVZ
         7g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232908; x=1793837708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKYZnuuJaKbDAUFeC/huFk/Nq3e89+l9qvUa+yaAXe4=;
        b=oBOcBhKZonDDvyux1K6TeIQAqz/1l1iwSAUPkiXvJT6r+DJbUBhy6BeCYykYajp0+E
         CAtRykupjDDLj8/JLDHOFL+4xkVciMp1BonMJOOv2gg7TS9Pfpe1KP1jIKRI+WPjiSwN
         ZGsQ/LumCN0t38pxEluxKyNyGQaan8P0IqV8qF6xR/gG5PHH4Zc9l1mQ2+qbJDti1V1N
         H3yGGpZyn9mn2kg3HeAxi2jfvnK6wiYZdOwsUh2Bi6zYe3uarrYn6+uPVp5NX0oBSZcI
         jY/DTaW4ViZgO5ox3RhyzGXlCNf4mvv8MSBNIh3i0eSnp/tM0/EMU8X+eTDVPQ98P9sG
         Ey/g==
X-Forwarded-Encrypted: i=1; AKwUvBzmuSNuDxycEy78XgV7cI/mjHfsLgK9ZkVbNf8xeadpM8O7G/40LeC8hSscrmOVprVmaL0HSH5gkTbexUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLic0iU8OC6WDeh2SWorr1OCXNWIz7V7jOhZMYbuloGpC/SswUY
	YcEOrYmzk3FYOBE/1lC6JhhdiYg9uMjoYN0V9pSx1y2oUctrb0vrcTYQWeLxjmfL
X-Gm-Gg: AYBFou0sGsrpYULTLdfWimxkAKkP9STsdWCQ+VHGWafiI9MrAbD+IbrTQi0fKBr13S+
	bojViQEWUxpn/zG3+p/wG71t/7lMWHL8cHkTgDLoV+8sG4nDjFqVS3RLN8aJ1T6Lt+SsAxRFGT4
	I4NbGLPf/Rr+HSqQrNX3fcH+1BJ8EnDlxZNAgw58opLY8Cvy1CRIseyxCNP5N3BI03SjhBRi56E
	748xrknIs5OroyHibatKiWoCwOok41fGs2Efm1QQqE3YnW2VfjaMdmpMgvDwqFB+noQAzBs0Iso
	sPeM+oS831PF7X+4CH9QWkGFDxDS6AKWJDKfaT8GRi0tt6sln67pGkurvk+ySSGm9BsNub7rArO
	8lsg2nuQuinV8wlpLJc4AR/ThfkGYXY2u0tCZ49QH7+cr/CGCEmwfK5II1QVHEa+oRgMVBYHIoW
	bQue9EmtbTJd9/aIFoJ9rcKFbgP+QffxuqnuQUPNQuEHrDtYwA02dTf+D4+R/PRAjvFvGQmj2ZV
	GxWkxFTn2HSiLgTlwskQhejDCmWLd95qpwLvfmeObTXu1/OoJCTb5UBVcAT+4/dFPsUbdP6E2/X
	6/sGdoDmkDIvFDNsPNIl0nK2oJRIUPbHVJ8oql6V
X-Received: by 2002:a05:693c:23c4:b0:369:efeb:3c6 with SMTP id 5a478bee46e88-36a202e9a2dmr7718659eec.3.1793232907818;
        Wed, 28 Oct 2026 17:15:07 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm11221892eec.11.2026.10.28.17.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:15:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:15:04 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
Subject: Re: [PATCH v1 2/5] ntfs: preserve timestamps when creating hard links
Message-ID: <auKQCM-vwM5RPYDc@hyunchul-PC02>
References: <20261027093515.344799-1-liubaolin12138@163.com>
 <20261027093515.344799-3-liubaolin12138@163.com>
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
In-Reply-To: <20261027093515.344799-3-liubaolin12138@163.com>

Hi Baolin,

On Tue, Oct 27, 2026 at 05:35:12PM +0800, Baolin Liu wrote:
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> ntfs_link() resets atime, mtime and ctime on both the source file and
> the destination directory after creating a hard link. This overwrites
> the source file's atime and mtime and the directory's atime.
> 
> Update only the source ctime and the destination directory mtime/ctime.
> Mark both inodes dirty so these changes are queued for writeback instead
> of relying on the earlier FILE_NAME write.
> 
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
> Tested with the complete five-patch series in QEMU. Explicitly assigned
> atime and mtime are preserved across ordinary hard-link creation and
> O_TMPFILE publication. A separate persistence check set and synced
> atime/mtime on the published file, then verified those values after
> cache eviction, remount and a fresh boot.
> 
>  fs/ntfs/namei.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
> index 0c84a5c..4442e1d 100644
> --- a/fs/ntfs/namei.c
> +++ b/fs/ntfs/namei.c
> @@ -1663,12 +1663,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
>  	}
>  
>  	inode_inc_iversion(dir);
> -	simple_inode_init_ts(dir);
> +	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
> +	mark_inode_dirty(dir);
>  
>  	inode_inc_iversion(vi);
> -	simple_inode_init_ts(vi);
> +	inode_set_ctime_current(vi);
> +	mark_inode_dirty(vi);

Could you also update the last_mft_change_time of $FILE_NAME? it still
appears to retains the old ctime.

Additionaly, could you run run xfstests generic/004 and generic/389?

>  
> -	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
>  	d_instantiate(dentry, vi);
>  	mutex_unlock(&dir_ni->mrec_lock);
>  	mutex_unlock(&ni->mrec_lock);
> 

-- 
Thanks,
Hyunchul
