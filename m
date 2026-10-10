Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A080E2EEE67
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791667261; cv=none; b=n8TsbTGIHNdTTPwfAaqJDl/tbQ0EGNOzZX4nfMd7q/n4ivUdVevbcthjYQWgAIP/MOLyMCOrt1jjZb7Kwi3xF6pfSvHNxgk1TYkhvd4lRs6cTaJspoB8lER5C630A9JWIlN/O9swoghxtCk6gE5jSxG9mj++EzDzUa1DVwMXjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791667261; c=relaxed/simple;
	bh=Viqw2VSB6JoudhGNy09fj/h4CXbr8K02sQ7MgR9eAh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnTcyfFQFqBqGTAJNUSswnuewfaF3bSWI/p5T3F8j343yGTmgAsN3skZlyGwKJSZynasPJ8aCRHoNJEkzRjvlPWYirkdT1sdJrxVttKiOQw5r5P8eAgybAK3HfpTc+VtxBWEEJsCwn06IJesHb+2aLz8R5hRWRgcnbQDiroXf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkXg3K3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkXg3K3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A751F000FF;
	Sat, 10 Oct 2026 21:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791667260;
	bh=48MHaP83/iJcJ8Y4ljdBdoxiH7Nc6HID1h+cGnYzIuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AkXg3K3fDmlJCdNOvp/Ztt+uqOFjYq22CcP6fn3kjoXL4re292J9r4Ff2NSStopuJ
	 thBwC+Y1fXxnNwyS7oA94N5i65cs4xLsRAnQTHx6EWuq5zU69QsS88KL575hHQei0z
	 nZ8SKu06RoZoZe5Z3igYzsC79ELfGwx7oAagpC+1kdVop1qUOJRMixL8QB2ulZO1iv
	 Pr2jEzWMavZzmfCiMH6ZXv1+JPCi4j/TkVYbnfOCoby+fioeaMKgEsUGGBap5+BOiT
	 kLFqj+5USzDI08pQUkCV8YdAssNGNek69ONBv3z8pCfokL5/PyeYF8BT5s8UebHOfD
	 ojhI79uE5nX3g==
Date: Sat, 10 Oct 2026 23:20:54 +0200
From: Gao Xiang <xiang@kernel.org>
To: Friendy Su <friendy.su@sony.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: Re: [PATCH v1] erofs: enable SB_I_ALLOW_HSM to support fanotify pre
 access event
Message-ID: <asqsNhtlXaEOrEky@XiangdeMacBook-Pro.local>
Mail-Followup-To: Friendy Su <friendy.su@sony.com>, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
References: <20261010094000.2036805-1-friendy.su@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010094000.2036805-1-friendy.su@sony.com>

Hi Friendy,

On Sat, Oct 10, 2026 at 05:40:00PM +0800, Friendy Su wrote:
> This patch makes erofs support a use case below:
> 
> erofs file data are not available at local, but need be
> filled at fanotify pre access event handler.
> 
> E.g. when format erofs to blob mode, meta data image
> is store locally, blob image size is big so it is stored remotely.
> At erofs mount, a loop device based on a sparse image file is
> used as blob device. The sparse image file size is equal to blob
> image size. Like:
> 
> $ sudo mount -o device=/dev/loop1 /dev/sdb1 /mnt/erofs/
> 
> Then at file access, need retrieve data from remote, then fill
> into sparse image at FAN_PRE_ACCESS event handler.
> 
> Signed-off-by: Friendy Su <friendy.su@sony.com>
> Reviewed-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
> Reviewed-by: Daniel Palmer <daniel.palmer@sony.com>
> ---
>  fs/erofs/super.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 0967aace9f7f..b92d3353319d 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -659,6 +659,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  	sb->s_maxbytes = MAX_LFS_FILESIZE;
>  	sb->s_op = &erofs_sops;
>  
> +	/*
> +	 * Allow HSM to support fanotify pre access event
> +	 */
> +	sb->s_iflags |= SB_I_ALLOW_HSM;

Did you notice
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/lib/backends/fanotify.c
?

I am not sure why EROFS itself needs to set SB_I_ALLOW_HSM because EROFS
is an immutable filesystem, its data should be considered as a golden
one and it shouldn't be partially filled.

Instead, SB_I_ALLOW_HSM should be set on the backing filesystems (ext4,
xfs, ...), and if I understand correctly, combining EROFS file-backed
mounts (pls don't use loop for this) already implements what you said
above.

And this functionality is already released in the latest erofs-utils
and Nydus v3:
https://github.com/dragonflyoss/nydus/blob/v3/docs/fanotify.md

Thanks,
Gao Xiang
