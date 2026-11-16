Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850650;
	b=pKCAvL7+QTBAhwn6ZEJtKVly8wMqBFULfLgVqAFwvyulUE3kVuGTPawGI4yv70eu55Ge
	 rhXFg19qzE0SFVFhGX+9NZOJzKUjwREyV7RLLTIG1ntSuctxXqqcGZdo0PP9LbhRAY41a
	 vnGwdsx++EUqhwkv2cK8FJ8X5XjM8kgSRZlLKw7UTTYsgp9IVj85ehw14La2Agk6eClSY
	 J+gbwLbOzjnWDi7l/RAnu5ksYY/sm2Kup1kaayiCJid3dedjlptWdB4pDLgBOviRJHeFZ
	 uBP3QTUNwDMNASMcMjGG05S365qFbvuadwD/6wwAltG+IW+PpHc97gwVaCJCKzfjhog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
	b=IO0RVhzRoGb/15tQBp/aRPfzQNMQzYjRjwuc1zNsfQIu30Ko5OTxZ6bjlH+qXq48ZcOj
	 BhbpESCWbIwuURKvt77YlcFLcV7MD2MtpnWaiwZLDv+eXYD+K9xJ5EqGDCSv3nRGmSUMi
	 3rVekPQikG1fMO7jgJDO+vJpv6auhWHw2je+bgCWFHI2Oc079QKI5iIOT65DWW09m6nyd
	 TK7SESVu3WXrMHcPijDlkBjT+q86igKbHla9dwK4ep2BdwmlYTwneo+Uvm8cTPR8cyWkx
	 zCVeIoippqB4kNh67zUF8kBvapOXkBwK75eMaIwA7lFsbHDyOhyxNzy0TC7wtxK9qSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C416606A88B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C416606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so218687a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850648; cv=none;
        d=google.com; s=arc-20260327;
        b=rP0EnUFXb2p0Zd7NGLjDrRiXj5e1ir+Rc3GE6K+FJpHLt6G30hNE73vXq8jVYur0Et
         5h4Xjeyi9y9EP66XDDJUITj6JXdUgbL756cj4af7OIV/F+n7FeNhuiWjVCJqYb6Xz1K4
         LrclG/KEYfme3YVIyqPOVOqiIQKYXN8a44DrF9Izr3Pyf4Vqq9+l7fI/HRNqZlJlU0dj
         LmZ0BddIF2nM/xZ0YVlsxWzd+l35eR9X9fBEyeq4KKCrzISHt9lNqjU8tT0+8EOmaRke
         lztwgoDYFlv7+1v8rlW4rVwdgfDWBFsghHDEQcEpoC8Jtu8BwACTEfzaA+p57fO2Lw5C
         2abA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        fh=6187UraO/k6dKvT8fM1Ofrvlfa+iwa7JVrY0dyUXaPM=;
        b=emZzlDwzGtvf3Rq6A31hhPOdVY7M9AzunMmGpI43S4xceDZc2c9lAue106yPdKmFOR
         h3u7sH0C7gt0LVrhjaA/wEbTusYQAlB5SMqg7DU9igxwq4uZURzA7vNl/A0g+p5Pktff
         TfOF4dgfiOnqwyuZubx+wN24m4M5gXfwhp3onZ+C/0gnoXwAbbP/alZCSVIVTjH8WiC/
         a3F9HQ4yrbCxb2EnRwvaJx7n6ddnqWtxGMSYV3Nj1M9rOD1O1baZ3oc+0QYPwsIkXbSS
         SD42EaYTfBBrmXw5S6pa3WzFHSzLyDd86w7QTNKXfrV/bDxyjpwiv8vxe1JXzw/C+1Vl
         w5Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850648; x=1795455448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=Wda5m4T+Og74YNLartpajMnAcctT7hnb5haqi9hjLlBRa67TYcEPjf80gw45qsgIx7
         FMobW/aC2ZXQsUmoaLilVLeaESS9ODytholTX6ZkGdI39Z50BqAMQuVm0upEGdU/eTIl
         KzXBiwaEJY7eqa6p49n+ZePGE0YUDeVtz78JPQJb7w7ae3zRsyAfYOAEtJq8eS6befDe
         ANfoXo4rOnrr9cTK5CEQbvEa19yD1CMimOfBL7pxwr0U+pGpN6RB970vgsC2xV+kB6BG
         DqloDFELm5xz1LM2zdKvbUwHIwogDmvmrNVDo81Was00uh+K9TR8cjrFQWZvFUjBWrt9
         3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850648; x=1795455448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=i7g9lC9UgcbZtGsAveGwzgKIaWNoHqLG5AFMtCs4ZtCYpEeg8HfHKFvI4PC4CiZPMW
         hwzSSXcbbj5EGhwujNqh0aZDa4uA0mtfkMGz3+9/XxCL7vwarp64YpheQHRc4WPgQ37i
         e2ZhTO1pzOo5wKDR9GfZ3u+cvaWu2PrUf/4Ho9lXcivcckdQcLqO6jnRglq+lNAbzUpZ
         G9Fbby7DNtg6GNwRAhgoV+EUoBf7aAUP6BV1FplV125pQ5S+G+tytQHhSjtL856jth+a
         9UDAkm0pbzWZfjnrdtikJbnWz4qIdAtEqRy5G7d2V4uspPaCMbNQ9RE9tPOzVASQR5hT
         m/OQ==
X-Forwarded-Encrypted: i=1; AL+hErF7cZoZ5aXA2+zvICQQI3GH1kdDE2R/58ua1Nf7zmhc/JmFjIchfpSSI/TWtFrXASRRqfdFNoUeauPUmKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B/TvaHOKQuC2AjA0ezpiwaqFwCZ2+eamYps5pvKicGp033aC2
	HX8FdoHHLvpSLjqIKq4KZtuNaATY8k2HRSBZCTSOfr58YF/GNBAveuAlHoYCUqcbzJCW9fdJtWg
	bSRkwhT2aaJnShVIVnSLfhvimrFtnnO0=
X-Gm-Gg: AYBFou30xHLkzmfET0sXCdEw3ZbmIXMRcsqj7qtPdi4jK7ld2tvA0epQCsW6WHRgASh
	QyY+HNoY9A0EHdmYQFFOX2trWyH98RDlW50hSvxKj5GU+dC/firC/UXrmJ94IQREgsO2WeTmmrZ
	MNtrKZTqvc3JjFmwpabYmkfTvf1kz7vI9ptHFrWtLulPWxBg3Z2bZSOegpTbz2zpDN2jtDJ657S
	6KcqvEDBD0ElYSw/4GGqKRWryk8LeHhqzClIs6oT0OzIMksQNpmhZnbsx4c4LtT97XdVcssDqwJ
	/kQuv8n2LYV5GtlRO44B3X2/7Hy0bhSeVDVh+hXTdRmeuynx1lxMVzJVgjVvxynM9N5SUqaWslx
	pF0eAnwGJHC8P5CycjL/caDyDkcCnLzR/yejBY6Xqt7ULOT3IiMxjTNyQ4FJ4Zd4pflZDRw==
X-Received: by 2002:a05:6402:1598:b0:6b5:7250:d621 with SMTP id
 4fb4d7f45d1cf-6b859ae1a00mr134291a12.15.1794850647426; Mon, 16 Nov 2026
 09:37:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:37:16 +0100
X-Gm-Features: AclHuK_sKnxFPAK3k65pZhjyZC94SJD4eZ9z2j_P12s3kyb9TMw6hurQcjyq55Q
Message-ID: <CAOQ4uxgPerkkG4ie0SyHVXaBD9VZN2wYfQpEAEi4hytn=ara3A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> The data of a metacopy file can live in a data-only layer. overlayfs
> doesn't look that data up when it looks up the file. It only remembers
> the absolute redirect and looks up the data lazily the first time
> someone needs it. So until then nothing can tell which filesystem holds
> the data of such a file.
>
> But a data-only layer has no business being a pseudo filesystem in the
> first place. All it does is hold the data of metacopy files and the
> regular files of a pseudo filesystem are kernel interfaces, not storage.
> So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
> mount time.
>
> Data-only layers can be added via the "::" separator in "lowerdir=3D" and
> via "datadir+" by path or by file descriptor. All of them end up at the
> end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
> of them.
>
> Note that regular lower layers on pseudo filesystems are left alone.
> Stacking overlayfs on top of sysfs keeps working.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/overlayfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 39d4d57dec230..719c2569dfeaf 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct=
 super_block *sb,
>         for (i =3D 0; i < ctx->nr; i++) {
>                 l =3D &ctx->lower[i];
>
> +               /* Pseudo filesystems don't hold data for metacopy files.=
 */
> +               if (i >=3D ctx->nr - ctx->nr_data &&
> +                   (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
> +                       pr_err("filesystem on %s not supported as data-on=
ly layer\n",
> +                              l->name);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +

How about we make this just a tad more restrictive:

                /* Pseudo filesystems don't belong in composefs setup */
                if (ctx->nr_data &&
                    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
                        pr_err("filesystem on %s not supported along
with data-only layers\n",
                               l->name);
                        return ERR_PTR(-EINVAL);
                }

I could send this as followup patch, but since this version is simpler
there is no real reason to have the intermediate "only ban datadir" step.

Only the commit message needs a little more flexing to justify this.

Thanks,
Amir.
