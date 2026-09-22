Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D8E54CF54
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086960; cv=pass; b=uDB/UAoVSTTbra1kWu62GsYduQ0vHic/BEDgj5RdIUYekL9GMScwBQGr6n0P05hMLQ3JUBwV3kor6d0TmDlfNqj65KKWnNwbZ1XDQdNsJjsAkHYY5Ssj7i6JTMAPdbnkTaUJNbkalaacICYpvrzpyg0GOrPu1Mm7+d2RAJt3FaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086960; c=relaxed/simple;
	bh=UfRh7sNseGJXTKsVsEpvuIA/dx++uiblm+pTJYzSZD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnK4YrvCs0cXU16QZ5aTtnz5Tl4soKOJx+akHJXLEXA2I7MXJVZb2eXxwh3KJx8kTVReevysXVMVVrjOWkbdQFTqd9JzRaTQqaK5FKBMP5xU9mFp+Gm04HJXt6BOuybFg0CjG3IL6Osvy1WEh6PgN5eU2GYB9wfGUcotr1a30UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NQXAC5zz; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NQXAC5zz"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so40119981cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790086957; cv=none;
        d=google.com; s=arc-20260327;
        b=eDS3TJS9Yr4m8cIC7TNn3k8DlhFG/ixBLi6tHAcOdEa2BWyGX4No6UBuN4h9zaFf21
         MI4AUyBE1OFMu/8rwSEnWxtnnXg3ceVy34EhTPCh/K6vNIALDAY+P5x2C/BKQGAzZP9L
         4KjVfLxdBB0UscsrJyF6QjR5QYdICA5ZU+LNjtAjO6BoMN5rhAy+NgGHOnac//Z4dNZ9
         pmxCrHXf2o1cyCi3FQXRcn2+DUnyt62Gw2uejigumiavzALMdlxwRXWQ7R7xawXJ3d7B
         a8mqUETo35tl/G+Etfz9PRx1Lo++893uSR3ikniNj8QxCLY5GCCeGuGt9E8/kQSTaNMq
         8jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UfRh7sNseGJXTKsVsEpvuIA/dx++uiblm+pTJYzSZD0=;
        fh=mPs126THd/a4TegS/fa19GEQkigFhhSTNzOj3c5SHb0=;
        b=peClAvVRBr90F4jpFB3um9tK4FOm1Dne3EfBKJDlDe7h+lel4gQygtvRYjwwxg7p+G
         OnRCGERE5jAHpV5A3KGSeyCytR53Sno108ZsT5FEAt0cMGvTnuEFGixM+upHKpwRK4lg
         bAK9OFztT6j/vDfmMuMVc/7g/18dD6Hr06/4ceXUeAq3KpNPPyv+NpdBpsJM1x7iVsHu
         sMLYalLCJz4yCfNsvYeZWAruTrs4zrjabvU7tD9/ddTapz4jc4lSqw761mrWLmAjI5Zd
         fC6HG26NaPe+kmr1sOcVIAH+WpoREIUqBkLBRDFUU//5iLJZUx+pXNfZch8AzCLyIyMq
         SiRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790086957; x=1790691757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UfRh7sNseGJXTKsVsEpvuIA/dx++uiblm+pTJYzSZD0=;
        b=NQXAC5zzLsrSeo6GKczo2TATy4QZHz2Jpi54CVnMwc+Mn5hai3tsQOWqelaMNWSkBA
         DqZ+0VmqrMBo2sKc3ge3vDRoWACQp9jWubk3KnIIhs/wItFvxuX0/Ltw0VUeJasmrxU8
         lE4IaLQhXa3RQbcAH9ZHvqYfaYmwLbiRL+LKCg9OqN6hxulpHAPmBB15S3b4Te8EaUmC
         b1tcbxSLfVlALgFqQHew9RlUD20pZzOfdMNc6J7I7BNJkllg/dtWNxI5H6NIzDTROeav
         CdvOQf6m3BURhsaU4W31+Mtf2vKdmlQy3qUAPM7Lmn8x5ztLZokjbsw1IyaLO2yjUJZI
         WEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086957; x=1790691757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfRh7sNseGJXTKsVsEpvuIA/dx++uiblm+pTJYzSZD0=;
        b=Se68E+cPXggZPqYa5tIIFlf0Kj5iUQyk/BAQDyyL4dWbwo20HIh+TSKwOiY0N6gcd+
         edflW9gkAgM5O+vUhNymLaOqd0MkQnrRwWSnFCbY6rr6uMQzOh6EPCrdFQKjggp9wYnV
         q1wLTEw/3rd66DLSDX0hvKZ+0BG4BrOqGJCSIrcffy1HT4op3RaBlJTdq9u7gqrNKXbk
         tGyPaERh8oUN9jkUAJNeoCM3yu6OYMT7TdX8ZZ9jsfH9R1EUnyZtoFQKbHsgX0mEQvRV
         qd+NCFBVJI7DQYT+Y465zV95g072O4hxSVJOx+uXitqtuxfCsYEbqbjZfGdkO+KPXwXW
         1nGw==
X-Forwarded-Encrypted: i=1; AKwUvBwR17y3lxdU4owj2APF1zJBhzPvXyGcUgJVoH6LiKyy0LfhYE8fMaRAuF3e58Yy41kD/BdA8So5V833MkA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwO49PrxdIbjDpbPKS3PP7ad5bkiUon7Y6NgwTWsN6GWvaQGHa
	4SpS30nr/Npj7rzRrQPmSHdv4oyZ+eeRGUtAAD+TZNhuTMA6aS7U7p+IjZWqFtBVwq800+38NjW
	6qnctjAP/0hkUc0Tt/qyJtOfHehqG0KNQAoP5Ot6gVPtBZ+vYULQGlPVO59w=
X-Gm-Gg: AYBFou0Lle/iBouewIMXKnsvVHT00Sg238XfUubYlNblEAcUm6mEzFqmXMINjZ7bTad
	qBaffckloRxVkCMGT8yGeQL64FSYGpf2Wjg1hcSkYgVwHa5cjxPZsnarP5f6x+uq61X7HoUyZWu
	/WPcCBa9H0z1xG1sKO089m69zaC8OmhJPAwA5Z8Z/iSNqxE1tjhEG2l//AlauHtQnJn3+VorB/o
	jXy4M6Euzp/f1pXY6a0v/kC3u7uLc4sIQg7tp02E/208GROZPScCMf+OxUWtzJKnpyvEufJVmy9
	A1h3DaO9yZfsIt4rQk8iU9yJDoby1VAazcHgKtaOXtjEh4en7s5ZpOk28s5MSskPVNmXvz6r2qz
	j5XnZ+0p/KKo4QAOw5Y/8S1VgHSyUvkdWHGcN7aWSdDVP0wYerUlTm05o+XjUA6uho8+abSqiF+
	/fLuhU
X-Received: by 2002:a05:622a:4a8b:b0:532:9adc:63a0 with SMTP id
 d75a77b69052e-532d8e70eb5mr58677071cf.68.1790086956186; Tue, 22 Sep 2026
 07:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <729830b8.130.1a0c945579d.Coremail.18983559317@163.com>
In-Reply-To: <729830b8.130.1a0c945579d.Coremail.18983559317@163.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 16:22:24 +0200
X-Gm-Features: AcwNN1WlFAdwrvFcuaEYrLMwWoTh1QrUe7UwPBFveZTKSMv8vTEnEckZQgsXIv4
Message-ID: <CANn89iJ45jSsXMShe+9gYVSMLwpC15nmBROFkdNWVVR-ZyE5YA@mail.gmail.com>
Subject: Re: [PATCH net v2] net/mctp: publish the mctp_dev only after it is initialised
To: Binbin Deng <18983559317@163.com>
Cc: jk@codeconstruct.com.au, matt@codeconstruct.com.au, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Binbin Deng <dengbinbin21@nudt.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:19=E2=80=AFPM Binbin Deng <18983559317@163.com> w=
rote:
>
> From: Binbin Deng <18983559317@163.com>
>
> mctp_add_dev() links the new mctp_dev into dev->mctp_ptr before mdev->dev
> is assigned, so a reader that picks the device up in that window
> dereferences a net_device pointer that is still NULL:
>
>

> Fix by publishing only once the object is fully initialised:
> __mctp_dev_get() runs under rcu_read_lock() only and hands
> this object to readers as soon as mctp_ptr is assigned, so
> they must never observe mdev->dev =3D=3D NULL.
>
> Fixes: 583be982d934 ("mctp: Add device handling and netlink interface")
> Signed-off-by: Binbin Deng <18983559317@163.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

Please next time wait ~24 hours before sending a new version.

Details in Documentation/process/maintainer-netdev.rst
