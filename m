Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004A35B63D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040114; cv=pass; b=Jy4OQhmtfxY39i8j6sOAurXqzM4xCYv6oaBuOc37b+l7geq4EFBN3008J/zy59dyPN9USg2tY8wlvPIvvJT+TnUkrXs1Coz4iH3K3Hfl4o+GLDXVRcD7lsTWRUpAqkwoDyHsUTQaMmHX6AEddkZSmfPrIi83aP0fbRrHWuOckW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040114; c=relaxed/simple;
	bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzV8qFVbIKmqPM3mimX9s8y5AWEia2p/lvmWZE/Ur+Xi+DDqpgHZE7snnLo0lkwUjVRYdq5f5C8fDvFRrFXl2YQJ0EWh+c1L8VB4E+WZPqofdQCyYXlKu7hH84jCUd4yPKmkL9sjcdxyCQikRPE0uf4oD0kxKStpoJS9jtz43Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWAS9LrZ; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWAS9LrZ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so3217423e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790040111; cv=none;
        d=google.com; s=arc-20260327;
        b=Sw3LiNx2zuam/8XPuYMClyivAc5/zcmgX8n09D7KxcrKFB5IAgotceK3XSB/7r6QZc
         YxLFLyOp1HpzqFcmuUTyiSXuHnHOLnHcie1Xu2wNeM1X+h+tiNkJovHrNm38BsDUus4G
         Mm1bez7WozwbyKIrSaMJR2TkaryScTDpSg0SAllEr1nXiLFzaZNPSCTDlN9YY7Ujca8f
         vrrZZDSwx2uFPN/LH3KN+naNQB8yU7DDWALkGdCfEmgzUOrkO0BdRC8t4NM6NCAB6KWK
         Mm63bfrl+IQdU9/H97AddFxIl0U82PGXoPdnNfbtugC0Nl+/rAtFS+Va96R9I1T8QyI5
         etOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
        fh=SC+Qy7BlF3VfiyARpb0TJobYPcy8rp1okL/+szZKzLc=;
        b=Biqwij5VeCLVnfGpOahLcKx9yEYobM1D/pGr0kUpRosL3P4GBx2kOarKQtkEBelatE
         6LMUm4uDRp1EGPZM3jWPZCEEsHkjQlEXbN+x3aa74K7nMuQ094FSBsn3F4v7Xtytnbjn
         hOkv7Dw3uA4CM4RmzTI4Ig3nosrOEF0BWaHNJoFHNnXdkKFhf7pKoM1Rn20/0yO9Zb1m
         C88uGgHfEnYNtqEywRXgCu0dt1aEAWWUtSjK0fqJ1n2S3VJZ2tCdR3eycjrHGQpP+ULZ
         WY1JBK1pq3uxlb8kH42p0fZYbhPsTtR/6vRdmgV32gqrMwSPnOevDX6mFgQkpK4q7Lz5
         80yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040111; x=1790644911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
        b=eWAS9LrZH+xREn4M+YkHpNDKRhI1C9Rg/8dOKaL9KdvhABAIFCrbeYD2JAu95ST9WJ
         ofhZYY5gLZIzk0bSyLGMuQdxJHC3o07EpKIXhaa9Ov3gMZy/lD7SE9/gdgOWtDYoqJ0M
         HR1a4cbrRotxmntXDikawhbZJNbC1fSyDqoIvR51CE1nMdLz0Ze+fjKmX2Kj97dZwsZa
         gqzEJLsCp1BxxkRxp06viMFjgEGS3QXJTy+My8ObswAPnsEddUVB9tkM9JmgLzsTTBp2
         kPw8WwsOiQ2N133YbSUfcdQXb9GchLxK2jSOakoyX4jlrgR3aize+zYp/ubvlquF8aTJ
         lZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040111; x=1790644911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
        b=wCEK9SIpGqwnVx1XJ56wEea2LukzTlUXgtN0CTFycJMo5+ttISUJBlou5yXAN98AO9
         0DE3J6RJSwqn6JTZFPzZOrvKB1Ggnit71OSQljEPZUbR7tQRf6HuDLRYv1qVnreaMXT6
         1f89vZId6aeBFw1rFLQ3WoACs5aQc/RK/3+jjQqFn7IWnsWl9mimljmzDTwMi1ofpw7P
         M3BZW7PL4iFCBRrtlvcX4R9H3m5Ad18qFCQK51aWyK34T8mfOivjHF8+LICdX7wcgtxo
         UEZHap3VG8ycaggGhWrpB102Q9wpMmM/oYYY+7YS4pXBzrfxhpMIsEU832xGW+e4mJ50
         +tSw==
X-Forwarded-Encrypted: i=1; AKwUvBzmoWEUhzcszwI4evZfeEQPv4faWk63dyGre84lT5DtSmT7aP3AMiiECfi16TArcX1ZbBFRGuZ8wsCZW1c=@vger.kernel.org
X-Gm-Message-State: AFuF++m7XNmpO+x6jlrF+Gai21DXKU+FnhHPhLIqWHNHRegWy5aFOTOs
	R+rG6LaOVod4i+B2i6RMCVPR9sQTZ0A2orjezEaL0yw5W4yetKWRsqVOMsWn4I59yMC9Q97oxYP
	XV/Muh1STKei08bIp/cphLCskbd4RFQU=
X-Gm-Gg: AYBFou049rMyXrf7nBLxJsJZ7xGLDcE5ZGmBbdHPLpG/vv6caOFUjnU94P3o8i/voPX
	IbHiPOCEnDz+LLcpb6Vp7HbkMNfLbEEI6jT50WDXVlh2+2+jdX4m3BXd/kcm24mmImiJYV2SQIe
	rgw1FLvM+xQvXmF9eWrDFbRQ6DbiHGrRr3kXwpLlhDl+sT8XcNa6QSmI+ZWQLjrweqglL29VJgC
	mtHYLeqf++KoRmvNOHchqllLlG/gS1VT6ZHuRmxocbJ7ydU2pgvqHKvL9jYkG6TbflqSzJNWy89
	1yHYcNB2RFF6fNy6WhJVWszLS8B0lHMNvzY1pTrhOXWP05okkCZiwcM=
X-Received: by 2002:a05:6512:39d1:b0:5b7:c68e:a501 with SMTP id
 2adb3069b0e04-5b8c18457d2mr4617397e87.33.1790040110670; Mon, 21 Sep 2026
 18:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920083131.1880061-1-liubaolin12138@163.com> <20260920083131.1880061-9-liubaolin12138@163.com>
In-Reply-To: <20260920083131.1880061-9-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 10:21:38 +0900
X-Gm-Features: AcwNN1Xs4mOKDO0SKEzKVNS96SX0lpAJbUENXwJul-pXhha7NjBeTDVZIWI-WOM
Message-ID: <CANFS6bajYthoK3asS3PmfU+9aocdsHS9ZFaUhmiKV5BfbaygeQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] ntfs: persist immutable in the $LXFLAGS EA
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chenxiaosong@chenxiaosong.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolin,

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:32, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Add a fileattr setter for immutable and store its state in bit 0 of a
> little-endian u32 in the private $LXFLAGS EA. Reuse the standard NTFS EA
> attributes and restore the flag when loading an inode, so eviction and
> unmount do not discard the setting.


I think that the name $LXFLAGS is not appropriate. the prefix $LX
seems to be a WSL-owned namespace. The name could cause
confusion or a future semantics collision with Windows WSL.

Thanks,
Hyunchul
