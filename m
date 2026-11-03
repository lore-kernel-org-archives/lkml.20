Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793664409;
	b=N9Dja2jyPIHJJY+HNIfcHdwWipLBVcWgh5hAAhhgotLt5iSDGQWlaE1PcUimLYqsW/H6
	 QKfhbhaZzqcTEdxODlpj4X3yFskIlE5yD+fSUMI4INtM/SwtmEQB/G6Rost+FMB6xZKxG
	 S1r4RNS8Notobwuag9f4GV7tn7Q53gzdfqsF0dqJ/NNc+zVfBNHe5j4drvAbsIUskSVDC
	 pI1Kh1YeOrNaFNs98+pQfWuMcDjPZm2pfTT+hFuf+jtPa1I4Q4LbGeG90rneXvLi5n5SL
	 yU3IQQORvEftUEyvd3CeCDOECK2HiISErS3mLi+ZPaVYs3hSXI5KZrymzj4HIEJOVjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SVB21/AnViTS4HODdzSPipK9V+HrHwv1zpOfO/G5LWc=;
	b=uKPZ7rD/5hsY87HvuVKAOydnn6T/cmqHBI2cy2g5LVpZNHNe8B97Xnfo2bZoGc9kEYeF
	 tGVAMWIUli+5P1d9Pxua9TBk4G48uh7O4HRHjsPI78R7agHP1eEsH8cXBt1xydWZGLY6n
	 /K2zBydtKCz+4z+FeygO5A5u/+ZSIUUHvXP5Zt9AuSm3ASSLU1P5d//L748b/ecdbADGb
	 oE/Mq1ga0mgNgFg6iQxNg7szlMV8qY2ahRY1nQJYL0/4WI+WAoHXJS+T4DBIRNoETtKmR
	 kLr2fTX9dc9Tb4AUZ1GDw3mdwjfHjUFFFxHs6YaKneunGYjZNSRSN4sRdsvP+6g4GqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=A9AYJOa3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3859606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3859606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=A9AYJOa3
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-844a8bf7e25so2520490a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793664407; cv=none;
        d=google.com; s=arc-20260327;
        b=TS45cLzPTHycQWbmAaUH1130wjy9aOaFrbCpR+WKQrq3CjcVQMXBj0D3cNt9+ANvbQ
         51dcbD1U8Fes0bumNgf55I/eNB+W+hgxmfHvPhocMh+WiMrsZ1t6umjLJuiY6P2XLL7R
         06IHl0euEMG5A7BpysjdoNFl4bf0zRYOTIZfGrlBXVG0AjTyvWT8kPK/2EY0X39wzf0k
         uZ4IeeZH2YbzjTnHKZXRRmcU1bmpUssEqhGTH2NYGys5jYwhOhrMPnHra0HAvw9voDV0
         Ooq8nmU/2RX1FxuNzTVFB/SXx9pklQg6akGX3pEUtF5mSybY40LDKCnj7Vx87QGiln8e
         UBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SVB21/AnViTS4HODdzSPipK9V+HrHwv1zpOfO/G5LWc=;
        fh=batHytLlyQeJDcLA/nfhbimmtpKF3+G5kw2kxPGasTs=;
        b=p0AtSxpxgrWsGSFZdOC3EfZ4yz8xAmoNHFlVBoZdfrGiI9e0b48wtlE+TgPypJOx6q
         cFanVZFyK/xK2uDs4oq7GcSg6kca8sF1sAHMyvjgwQk3IbLjbXd928DPela319+H0iFP
         0u1bhk+l14O9OP/K3PeAllClimnZWWSMxs8BXNMPBoR21sU6P58ZN40Oqx/kyQfGFsoV
         xF+F7Le7qfQFiQJ2vpm4XpLlFZp885bSMGHz4YDkK/VhzNoepxZUvodQuC0tMWIcAuR7
         0AKmd+/s+VCS1UQil8vdoY1rc+kkbKnbWGUsODZGWd/Obv9SvdDA+8BCaDzP/MHXTkNt
         cbEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793664407; x=1794269207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SVB21/AnViTS4HODdzSPipK9V+HrHwv1zpOfO/G5LWc=;
        b=A9AYJOa3OGIZGbLtbJdt52wFiu+w2TsukdRAIXTFBdhL+8WjOqhl2uEHZBnfOiyDjr
         NrG8Bx7Jc4C9u+1UmWYEcGOgSIBex2U2q59kfZqimvxo4HbZxJUgmbzrzHH5TMiwGhpN
         YqoGY2hrNEPDVddMK3JBTOt48ALpVPKJx8C/sDBy5CYQgZLE3pPguGKf+8eQ/LJgOUm0
         IdHBDVhD4Kiz6KkkYUaXQ43m/vTS5zJl2RV9CdJ7cHhfsacNXt1ylAZJRGlOyBqas3JW
         m+RLKdlC4RfSJC5QCOcRc3PqtCFbvSzdL/9EQrvXTqYAtMgF8cxhz0VWygfoJEuqTBJt
         Gv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664407; x=1794269207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVB21/AnViTS4HODdzSPipK9V+HrHwv1zpOfO/G5LWc=;
        b=S40WTuqT6MVWS30bXcAVfUbh3WyyEmSBLS8SJV2W8a4R0x8cnRLE2psAHMJ81vomG9
         ropU1AZVGfs1B4U3opGhHKPuUs8k+QjeWyTTwsip0Mn00+uK6stQ3NrNqvYgQ6n3EvgF
         EEhc67pIylAMdD3T6nwQRqu69o9KcmBuDAbZRdLBiV++9t6MQ100tFzrr5GhBpkkDFzm
         aVtXFUc0OzwiuntVOuU6MHF6ALSQRQihXI0h7/f+dqPBxWhGTAkuTkm4iwptDOvzDzgW
         QMNTzxb/ZgR0zLaJ3wXKAQDrO+6NltTbnMUZA/GLuBf2OF4JAinud13rhF+Ky96KvKHM
         uagA==
X-Forwarded-Encrypted: i=1; AKwUvBxkpOo2GFDb9TBhZh7W4AuqFQuOqaKkiBy9coxhfNFJlQ9Lm05qcO4GGM83w0/4SOKXPBMCm78qwR1N+9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcCCk9rYk6xp81reNVCNMiaFBGYxcrYdO8SJsp9CTHmNaKDCy9
	OgBUFDJm/62QmQ8U6rT0Z+DgOHN2KgcPU1ZSSkbnvthsnt0jz03UauS7LzlZKgthNVhGh+iohpu
	DPuotkU8TMxAztzTfw//c5Tw71cisoOGr6BivXmZc
X-Gm-Gg: AYBFou0Q+QFwsEKVOQ24E3mAFL9Em2oaF/i7nBxoW4U8krkNPs+Jp5EgKlky1ZMHj/o
	FLfkuTYz014btPAQYuZ8ygcNAmjry6rt5VyIQfSf1EO8maMFUbXGWZMj2D0ftF35JB1C1XtpwOd
	laW9IHSKm1Xo7Aa5Pz87Nj7ajKRcF+wxAOT3j+Th2CjNwgvgkzG0Zy9ySnA8KXZ/wvnDI/vGtTp
	LRFq3RtU37tujXQ3uvrpHjpUF662WQKr/mhxdkVaSVS1NBNmUeitDTcauI8uVc2fgIeUs9yWAju
	YpCOCrQHZV1bqvFniFc0O8Hm5jXZ6Ma/k6t0uzh+RSqMy2p3uMVwQ3fYJV8MDA17b2kcDfuwgm7
	Syj0/SvJZZmLQF4hwJARc2tDsrqm3tG7LiBMYJA==
X-Received: by 2002:a05:6808:2218:b0:53c:2a2e:8650 with SMTP id
 5614622812f47-5640df72f37mr7638020b6e.34.1793664406884; Mon, 02 Nov 2026
 16:06:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102233041.310900-1-smish149@asu.edu> <a12db355-d677-4656-9715-a537980e928a@suse.com>
In-Reply-To: <a12db355-d677-4656-9715-a537980e928a@suse.com>
From: Siddharth Mishra <smish149@asu.edu>
Date: Mon, 2 Nov 2026 17:06:36 -0700
X-Gm-Features: AclHuK8WPFKvIkjfRdxOUVR8P4RPk3-TpPeZ4GJPv7cbB6VWYA4Uv9k68vyPW_I
Message-ID: <CAKpDGtncRzRwkv6yfxNvMHOMSk_Ejg_HJHEs3k9TVNb_6mArvQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: do not check support for an invalid sectorsize
To: Qu Wenruo <wqu@suse.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Siddharth Mishra <brightprogrammer@asu.edu>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:42=E2=80=AFPM Qu Wenruo <wqu@suse.com> wrote:
> > diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> > index 8e8fb942d..b348591f8 100644
> > --- a/fs/btrfs/disk-io.c
> > +++ b/fs/btrfs/disk-io.c
> > @@ -2520,9 +2520,7 @@ int btrfs_validate_super(const struct btrfs_fs_in=
fo *fs_info,
> >                    sectorsize > BTRFS_MAX_METADATA_BLOCKSIZE)) {
> >               btrfs_err(fs_info, "invalid sectorsize %u", sectorsize);
> >               ret =3D -EINVAL;
> > -     }
> > -
> > -     if (unlikely(!btrfs_supported_blocksize(sectorsize))) {
> > +     } else if (unlikely(!btrfs_supported_blocksize(sectorsize))) {
>
> If you want to change this, you should touch all callsites.
> Not only this one, but every unlikely() branch to return immediately.
>
> I do not like the ad-hoc fix just be cause you can trigger an ASSERT().

Thanks for the response. I'm assuming you mean I change the whole function
to return -EINVAL on the first failure it encounters and not just the secto=
rsize
because it reached an ASSERT. Given that, I'll send a v2 right away where
any failed check in btrfs_validate_super() returns early rather than
continuing ahead.

Siddharth Mishra
