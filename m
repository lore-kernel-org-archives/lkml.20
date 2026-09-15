Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8A3B42FA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482589; cv=none; b=OAbox+aGaFoI2BaNlMtuhqK8gnd60QAx8IP19fSW/zU23N+U35wQiByH3N+xRo/qRZzQiQGW4jq3Myfg4VzngmDtB52uxJf1Dqot4QwxhI7GRh3CTk2QObB46WBVTbTiINF3yDBMaTr7hbT46SGlky71dxYZlehrOymnNjGHh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482589; c=relaxed/simple;
	bh=w6FJwout0DsKD6TkfCqvOKdMewok/Mrvz1ESpCSLO4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdvzTf6Ucr/1W6jrqBQIFA/o+KMCSIpqMYWtJHh9494/GYP6Z6YXXNWoCDbMWSLDt8VW77YnhgtnPwSLitHxOY6wLB08BZ8d3HziTIR3mKid8VFos2ttVXWYrw05oPsbuiRzwMP26SMtYHJrrlRijx0n6GiscXnDSV/EQ52jYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KU2CQBU9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KU2CQBU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD891F0089A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482587;
	bh=PI8ofUAwsEfrd1/dz6YRefCreukSx2VFFqza5udhf/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KU2CQBU9y0+TQaIBPK+jvMld4LX56q/S7idFSjQJuqwX8ps0pNkK1F7gZUv+SZp4P
	 BT/FElI0pyCl42+/LIT07IxfZXQlZRo1GIamKvj8aQ5sNpIp64T0wihaFOMmNH0bMR
	 twAaFg16QPukKhvzh3ncxW2pA+3cpEsjv64CeDLvuQSVXlqSnZ/O3h+Cw3zqt5RiYb
	 KvrM7GCDZyWKymXvtJ+dOEDGbz0Xc+m8MAv9CAcJFSRoJeZV0wkPT82UbxU78dlwxF
	 h2+67HDe9CXtGIrCGAYWzq7y/rOvMG5k4KMGKBlUFzOA0sjM/3yYMytVbjT6uhr1mH
	 K/bduZXn+7TTg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-86162c086f8so7178557b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:29:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAM3oE0bYY1nrFhBPd+oS7+cYwJordp20/UHFLVyrP98vYwIxPd/cPLkr5eSah8QfsHpzLkDhqBah+in8=@vger.kernel.org
X-Gm-Message-State: AFuF++mCdEA3FNmek8KY3CvBA+AjNkodeLgO4+DmPhxn2qhLfTh1Y9eP
	Fu0pXNj3K3ehQRaL8PGGibzPPBV6mnYnPviX+mHpRACd/CMRZcXMPh0KY6I5UXSNMy+McAR0brb
	k+Wt9aHloWX+nfbU2ErZJ22KhZkux5j4=
X-Received: by 2002:a05:690c:2702:b0:88f:3bb:8715 with SMTP id
 00721157ae682-88f1b6cd7dfmr9384457b3.33.1789482586874; Tue, 15 Sep 2026
 07:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913142314.1400062-1-anmuxixixi@gmail.com> <20260913142314.1400062-3-anmuxixixi@gmail.com>
In-Reply-To: <20260913142314.1400062-3-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 15 Sep 2026 23:29:32 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9pPRi21V_t_h0FSQyU7mN6u3o8wUc8=pusU8fDSMA5JA@mail.gmail.com>
X-Gm-Features: AcwNN1V-l9dr6tskmgf35OLBinpE_thNmKVTcxf2PEbVUtkbrZUXqH0vNiUS9R8
Message-ID: <CAKYAXd9pPRi21V_t_h0FSQyU7mN6u3o8wUc8=pusU8fDSMA5JA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] exfat: retain the next empty directory entry hint
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -1489,7 +1491,10 @@ int exfat_write_volume_label(struct super_block *sb,
>                         goto unlock;
>                 }
>
> -               ret = exfat_find_empty_entry(root_inode, &clu, 1, &es);
> +               ret = exfat_find_empty_entry(root_inode, &clu, 1, &es,
> +                                            &next_hint);
> +               if (!ret)
It should be if (ret >= 0) ?

> +                       entry_allocated = true;
>         }
>
> +static void exfat_set_next_empty_hint(struct inode *inode,
> +                                     struct exfat_chain *p_dir, int dentry,
> +                                     int num_entries,
> +                                     struct exfat_entry_set_cache *es,
> +                                     struct exfat_hint_femp *hint_femp)
> +{
Please check whether smaller holes can be skipped. For example, if
there is a 3 entry hole near the beginning and a 4 entry name is
appended, a subsequent 3entry name may skip the existing hole because
the Bloom filter miss bypasses the name scan and allocation starts
from the saved hint. Unless another deletion occurs, could this state
persist and cause the directory to grow unnecessarily?

And please create the patches against #dev branch.
Thanks.
