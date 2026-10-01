Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6F38A718
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887201; cv=none; b=ReFxeSf28vIhFjSr1YCWAiVcXWKdaR29NiGpFoYMgux3rnSARuK3WqEUnwQLDrw6XP49iM/iM5ZJeh75BlVhePXfUHoy/CRM80rCJkCPGDIq2TFjPdHB7AAoMBnLjeC1B7kJEn00uMIJFWYLh4Nbe6j+dis+WWLbmCKhR+du+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887201; c=relaxed/simple;
	bh=GLiKEQIDSQN0nNYFYxZ6HgI/x6d2Zprs9FU1tkrK7FQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=VmZ6RO2D6Ky91Q7z2HnpP2Pi3Q3+HOTiQ0tAwnvPNbe8gO7Cn8z/OVEghcqeLwXZcs8Q6HHilGPzkt0z70Tyf//gxc2r1ewBLlVniRHpAMnm0aniUZsGe6rihbhNrkT87SYZ0eCEcDtNKIzB4wyGgVAdZlooMwwwwDZyDMJuPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso10598668b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887198; x=1791491998;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a6IMbtmsX9VNtWj9A+lxAahVgkoUvFDDeDzK5Joep70=;
        b=C1rZjG5+Hlg17pE2IJ+sDGU68fGFeehGRfIad+HMsE9LygQsXwaDnvtrsJ0xjzoxHX
         2YszlaZJ6R2FyBWT9/2UkC3ijuQvg44AjoBcNBHQsqoU8KWPDxl/VYbBiQhbpyREQ5hK
         +hsH3hJZsBJcE638thKvbtPtprIdYxhOOCQFjDTjSRpfdO5b3SnolZu7RVlyavVIMr5c
         IckKYqz4guciy+D9j06592kb65JfqzI4xFAdK5dfaD0A0tpEu0ob2iPtnm2K+ny3y8Yk
         ljnB/2ApZk0ZG0jZGkOjw2WulMsmVTPXcdbHiVZvzd8S08J5+nfqZ65PWOf9wkbcs+MA
         y4wg==
X-Forwarded-Encrypted: i=1; AKwUvByYPDZWgprKQ4WhyT5D4zC8zKI9nswG3vBiA09WVycbkCkMXfS8+qL4izT9S5pb0sUyUnDn2YoRSc33ZAI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJBR72Ix8TOM58FkBFMY1RoUmsg2Mn4QuZU58w6Hmf+HVr2E/2
	O5pHjsjlrdPeGqDQx1kCJsU4DZUVq0vg1RKsA8O626OBkVwrB4lFslQRMcyska2gyTQGlep0qK7
	vjJjJCqSGe5vKG7N1f/gRmyr6PeJvLrob44zX8M0b6DFNAaRcVtIWB87psgU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:158a:b0:4ea:18f:64b0 with SMTP id
 5614622812f47-4f52b4c5ab8mr283630b6e.67.1790887198684; Thu, 01 Oct 2026
 13:39:58 -0700 (PDT)
Date: Thu, 01 Oct 2026 13:39:58 -0700
In-Reply-To: <20261001203952.1294581-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abec51e.7503fbd6.2d3f6.000b.GAE@google.com>
Subject: Re: [PATCH] ecryptfs: validate auth tok payload and sKEK size
From: syzbot <syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com>
To: adrianox@gmail.com
Cc: adrianox@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>  fs/ecryptfs/ecryptfs_kernel.h | 6 ++++++
>  fs/ecryptfs/keystore.c        | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index 58165928ed1e..4315c18ba1cd 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -88,6 +88,9 @@ ecryptfs_get_encrypted_key_payload_data(struct key *key)
>  	if (!payload)
>  		return ERR_PTR(-EKEYREVOKED);
>  
> +	if (payload->payload_datalen < sizeof(struct ecryptfs_auth_tok))
> +		return ERR_PTR(-EINVAL);
> +
>  	return (struct ecryptfs_auth_tok *)payload->payload_data;
>  }
>  
> @@ -124,6 +127,9 @@ ecryptfs_get_key_payload_data(struct key *key)
>  	if (!ukp)
>  		return ERR_PTR(-EKEYREVOKED);
>  
> +	if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
> +		return ERR_PTR(-EINVAL);
> +
>  	return (struct ecryptfs_auth_tok *)ukp->data;
>  }
>  
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 51651314b7a6..7f2dbc81fcbc 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -477,6 +477,13 @@ ecryptfs_verify_auth_tok_from_key(struct key *auth_tok_key,
>  		rc = -EINVAL;
>  		goto out;
>  	}
> +	if ((*auth_tok)->token_type == ECRYPTFS_PASSWORD
> +	    && (*auth_tok)->token.password.session_key_encryption_key_bytes
> +	       > ECRYPTFS_MAX_KEY_BYTES) {
> +		printk(KERN_ERR "Invalid password auth_tok sKEK size\n");
> +		rc = -EINVAL;
> +		goto out;
> +	}
>  out:
>  	return rc;
>  }
> -- 
> 2.51.0
>
