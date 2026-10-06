Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBD42F0680
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268246; cv=none; b=UVUrcflL9vxXJMT9WtuyeKhjN8655fXgJhGg+UPCtSciZGKzDji01zmxo6KBJjjTmG06d/47vRVTSI1cqSb8dr5DgNHckzqHEJIThXMd1vMGzyFgU5eRPoaE4QHpGzHuW63vLpaknnlxqRg3g9DuiaZqBK2CIDAMyUMBo7STenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268246; c=relaxed/simple;
	bh=YjuXSi3aozrOIYinVYm/zc31n9VMdX/3ZofAmKTbW9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EweaJcea76lLT5FGQ34JEJypewj+v8D6LkM1v8tvyKwpgKYVALKT8FfseISl7+6OptZQt1N7qPhkaVGcWcP51UfOwi4UOVW/Byfk79VR0g3cpDVg88HF6BxS9HtPmf02OkkDhAUnPvhUnosp2LRHcPXQGkExPOxYpm0k2bnNApU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lp941Raw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lp941Raw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B441F00893
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791268245;
	bh=bSJGzpl/sgtBbaC9T7jxEyyq7G+X2H5uaG+ljuvdkdU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lp941RawQS2rl7xrDYvMw/A3W64Qm+D9P/6LjXUpOQKw/dERY9muedisKFMuYk63o
	 X/rBqFBUhcJVW+JBCfKYH7HW8oTCUYKAzqqir9KqKlo925UsAO5Y8Yvmr1H87e9l5T
	 VRXEtBSq7ZdkVixRAfi16HhznacCRhCbWI7vIVXUg+lOl/Ywl/dYWzRGx7HedjRTgv
	 BcOBc8lBG8ZE6VyARQbj82p3AUEc+QAvBBlW/+XKOmjLHgauFoEG8k4xjPjBbvmCQX
	 pN0i4vVS1TPPhcjTZCEEiN6llchbj5ic3Q61DYJgTbInXE51GMH8b4zjO0n2TfVTkI
	 EC/1VtfcJWRFg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso25992766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxj2u41ppqrBrSABgIbQkM79t2zfuWLcqVXA1IMvT9+/sdkwj5Sln7gMpOEbGjgOtHU4wef3ohI/E1BkcA=@vger.kernel.org
X-Gm-Message-State: AFuF++lXpCqJCWLN/dtLD3GEKfYXk5P11v30P4otTMPe3S2s2ED8KA8/
	447Rm1jTPzmO+FKHfA8FGlRJaByaVEv+eaJ4JteLxK59gRRcvte8LqL7fPmLYzwabTNnR6VVIFW
	02nPsCUEJDZ7LE8IIQt+T/Zm+ZVzzW8E=
X-Received: by 2002:a17:906:c116:b0:c29:f159:ddd4 with SMTP id
 a640c23a62f3a-c316a038586mr41726266b.26.1791268243200; Mon, 05 Oct 2026
 23:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004101934.1975655-1-chizhiling@163.com> <20261004101934.1975655-4-chizhiling@163.com>
 <CAKYAXd-2cSYwBcAfGtcAYbK95FfpASRrptz4YUf7Ke-cXK00PA@mail.gmail.com>
 <5b101dea-77ef-4ae7-b8d9-54df20b0a6a5@163.com> <CAKYAXd9u3gC=McjgAVABfsd_JPwKWMteJ=t4r0RAnuZ0worupw@mail.gmail.com>
 <c1ab6f08-f277-4645-99ce-5e31ed896a89@163.com>
In-Reply-To: <c1ab6f08-f277-4645-99ce-5e31ed896a89@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 6 Oct 2026 15:30:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-v5W8g_Ho81Xa+hJ5mbA3wrdUcY1K9X-RjpMHbiivXnw@mail.gmail.com>
X-Gm-Features: AclHuK_Q431J3lAiKb67qMwjp4p4jtCGPSZ17Xqyd89nZ5pXnHQxYHgXkwyLW2w
Message-ID: <CAKYAXd-v5W8g_Ho81Xa+hJ5mbA3wrdUcY1K9X-RjpMHbiivXnw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] exfat: dirty all new pages when extending valid_size
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	dxdt@dev.snart.me, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>, Jiale Yao <yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 3:02=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wro=
te:
>
> On 10/6/26 11:57 AM, Namjae Jeon wrote:
> > On Mon, Oct 5, 2026 at 7:19=E2=80=AFPM Chi Zhiling <chizhiling@163.com>=
 wrote:
> >>
> >> On 10/5/26 5:08 PM, Namjae Jeon wrote:
> >>>> @@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t=
 start, loff_t end, int datasync)
> >>>>    static int exfat_zero_new_range(struct inode *inode, loff_t start=
, loff_t end)
> >>> Function name and comments no longer seem to match. What do you think
> >>> about changing them like this?
> >>>
> >>> /*
> >>>    * exfat_prepare_valid_range - populate and dirty folios covering [=
start, end)
> >>>    *
> >>>    * Populate missing blocks via the read path, which zero-fills data
> >>>    * beyond the current valid_size while preserving uptodate blocks.
> >>>    * Mark entire folios dirty so the newly valid range is written bac=
k.
> >>>    *
> >>>    * Call before advancing valid_size.
> >>>    */
> >>
> >> Okay, I'll add it to v3.
> >>
> >>>
> >>> And generic/538 test fails with this patch set. Please check if this
> >>> test failure is reproducible for you as well.
> >>
> >> I ran the tests, but I wasn't able to reproduce the failure. Could you
> >> tell me the block size and cluster size used to reproduce it?
> >>
> >> There is also a new failure in generic/551. This failure can be fixed =
by
> >> adding inode_dio_wait() to exfat_extend_valid_size(). Jiale's patch
> >> includes this fix:
> >>
> >> https://lore.kernel.org/exfat/20261003093035.532916-4-yaojiale02@163.c=
om/T/#u
> > Okay, generic/538 test passed with this patch.
> > I will apply this patch and your patch-set.
>
> Okay,
>
> I noticed that these patches have already been merged into the exfat/dev
> branch, and the comments in exfat_zero_new_range() have also been
> updated. So I don't need to send v3, right?
For now, yes. I am currently doing other tests, and if there are some
issues for these patches, I will request v3 to you.
Thanks!
