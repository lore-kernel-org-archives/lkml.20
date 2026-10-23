Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777664;
	b=mjz+QPeemDujDI1cVc3sxKWQed4SJCMBvLOITuO/3jwpC6Bpd3l0pTIiSRSHEGs5Rztc
	 qQBdM8JuSKUk1pCOApgfWLPj0WoUrXtcTzs5OPULTzaSO+eJvSKI2316y1zkuSkZSwIMU
	 DvHKLnfKISwA/+wXbZAVyfgeFWqeiyUHil5L6WcZGQRo1//j0GeTXq9XyOhftxeXdIJR+
	 SjlOm+mE6zTJ/nbF1hWIR9mRgOGynJImLIrgMyoUdMabNHXh2c8VPPiKwliC5cYuep2/+
	 b9ANimS6Epi8VHDkV2SDEICfAq8kpW+NhOGBdVyFEXu9gtp0jf7mS7PjQrRfLHSVp8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777664;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=uLCv/NZWL8y5VykZphrMQa1/Fay4tIgvqvv8+uzV9jc=;
	b=uZmFxNcVvH90PoKPatvzBffWu5FVEzmktRtfDJ05iY1OCyvpiwGrWGyJpClPQYpSIzAH
	 zYfKDK98liGC54CoBHxncM9q38bgWGeJLVb/xYBga1rINsYGPQen4RGpuhrbDGV9HLNru
	 oKE1dcYlcjzW6kqVeH9OpIIIgwK7dD/O2ddqMPKNyeU8Yh2IOksGKQtBB8uzhdEvyBmhV
	 tAcepcl2y17JnyYocD2IAr2AAZZDQtqcP2DnpikilBD1EiNWIKYMpYjWxIBO8wG3Q6iv7
	 q9KkN1bICSZBq3Qn8nS///my87I5+Yrx0Hs+8yoZrONiM7JbIi/578LOZEkrSc7ut4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D9606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-815f2b1ecc3so2422557a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777663; x=1793382463;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uLCv/NZWL8y5VykZphrMQa1/Fay4tIgvqvv8+uzV9jc=;
        b=cXkHaI23euDlo9/+qB0w7rUx27X858nhiTG5ZOOnOv5g+tOxaFpZXFUEjzlvWIjiJO
         eC4dEtpUiZpdSeHn+38ISLGP9qlZjee3Pa6QTyfKddyHkiHlFjt9b3gUTFLuLgaaGche
         tG0CY8OqK8N7FkJVrgpMhCbtSN9z14Rks4MAxntpKrmGfkrkaYXpr4MKHK3aWuws95HA
         8RjmOgpo5d4MiXgyOLq4Nvtb1Cbh+DYXL1/4T712do/vQoYNGYMyWtISpa1TQBjzd4hB
         WJjwcCktiItMNGlmRRfiu8Zids34V2V/+75e2sxAY0kANI1zRJv8KtdeiLaS8DJziJev
         LmlA==
X-Forwarded-Encrypted: i=1; AKwUvBx4fuObapRZZpVixAgsqKpGH7CblMWRXXdKVttCCwXpGYAfK08gvAm794552EATJGwwZQYuG1rTKftGBGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUqD+GeeLkanCMdVjQl61zbgU02L6+8W37LAQY2ODg/Y43pWEg
	fFpyaLMbqB8DrsEKR479PsucoM4DNNIqkTaV9KriNDrYZfbthA0mNYAs8JR5xnQMDN8M/Kwbojq
	kfVDi0vuGFPiB4mpfFqJZZ6iPgZ/WyTWSyTcox+JG6R8fqS+wUZ7680ciz80=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b13:b0:53b:11c7:2da0 with SMTP id
 5614622812f47-55be80c4689mr1901483b6e.21.1792777663090; Fri, 23 Oct 2026
 10:47:43 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:47:43 -0700
In-Reply-To: <20261023174739.5884-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adb9dbf.5b36369a.12654e.0009.GAE@google.com>
Subject: Re: [PATCH v2] configfs: fix slab-UAF Write in config_item_put
From: syzbot <syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com
Cc: drifabdelmalekmohamedsaid@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test:

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

>
> diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
> index 89178f5d371a..7d746a10c369 100644
> --- a/fs/configfs/symlink.c
> +++ b/fs/configfs/symlink.c
> @@ -196,11 +196,26 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
>  	 *
>  	 *  AV, a thoroughly annoyed bastard.
>  	 */
> +
> +	/* Put the reference back, retake and check after relocking*/
> +	config_item_put(parent_item);
> +	parent_item = NULL;
>  	inode_unlock(dir);
>  	ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
>  	inode_lock(dir);
>  	if (ret)
> -		goto out_put;
> +		goto out_put; /* config_item_put on NULL, no problem */
> +
> +	if (IS_DEADDIR(dir)) {
> +		ret = -ENOENT;
> +		goto out_put_target;
> +	}
> +
> +	parent_item = configfs_get_config_item(dentry->d_parent);
> +	if (!parent_item) {
> +		ret = -ENOENT;
> +		goto out_put_target;
> +	}
>  
>  	if (dentry->d_inode || d_unhashed(dentry))
>  		ret = -EEXIST;
> @@ -218,6 +233,7 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
>  						     target_item);
>  	}
>  
> +out_put_target:
>  	configfs_put(target_sd);
>  	config_item_put(target_item);
>  
