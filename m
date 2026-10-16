Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B694F7970
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167120; cv=pass; b=pgO/jiMh17rL7iQcTg7We1qH9DBLGpxamVjix2vw/xRZ8JMvqlA7jcRoapiyV6igoiB/yxMYPsP3wLdvbwZW+9oV2pukwoSuMp/rRR8klnnkkwIi+xONVnp7tWYcxaU0q69eQSgakMb5vNtMG9UONanGU6RlOw1EgCRrEjDMCPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167120; c=relaxed/simple;
	bh=gPXFXTYHfhMIi3Tk5OWQVDYZ9+5PmV/EuJNrX3blnmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIVflQQkcN4rZx/vHldb5R+sMMN9S3fJh4zJOLyms9LF3B7WCnGiBaRBqRg5hXQpZ5efhf+t8lfnsXxOxBDPgyonN6vz70ZzKK+SVi85iiGFXQzfsbgq1TcdfM92c9MmAgjoh7Ivo2FHf1DD2abS9rtCH6LtkQJuOQq6cxdwTtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z091odMU; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z091odMU"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91986c5cb75so1790186d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792167117; cv=none;
        d=google.com; s=arc-20260327;
        b=WFGGF38jfS6QkWpR3J6iNzyl9b+sA/+hucFjO6UUWqz+wQojSTbebdpvSFI5hZoU0j
         ITYqNN0Rbu9xrbkPtjGBJEtJzWcLcXL7uEnFO+ZDec+O5WvwDUtnS1l9aui9jLboh5lO
         YL7BhYbTzrkMx9cnuTEFzRMNLx92hxVWoInvjBA+u8tNtik2rKE/paxq16lHboNVu5+Q
         coeIT1EcP/bRmxBrCOKJcqFpWA1yBXamUfyoW3pfKYktw9CqRUWxE0CKA8Yspu6v3Szo
         kpBm0ms0eRVV12FZsnOY2kOlFuOQeI+dDuNqDHBquVMNZBuofSky6bE40vb5sXkzSHOc
         pPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gPXFXTYHfhMIi3Tk5OWQVDYZ9+5PmV/EuJNrX3blnmE=;
        fh=El/G6zH6Af7ZLWt1n+9LlVijdsAauJRNLvF9BHAxxk0=;
        b=QoUTEb4jVDYYUtw7W8JokKlXtY9Nnye9S/FBMAnT/T/ZyUQs8I5wj3Ku1NxQX7wF1Y
         AT8Qtmo3Ga7XRHtkmHhEZZeQrUdwe+t8HYl6VdN3BtTUFoRlKbgidZv2ZwwZKHLcX3P/
         PJxjyk30SZYXJZRxwMVIoePp4498GUxLTa+5t6lSHdiTD3/nZkwxzJyXxY00QR+G/sbw
         vMPPMfOH+mCM1LAk+aSjmhkvKjvxo0YPDNRy252RR05ERs7YPTaWkGHOKHgM+3+twhdR
         SK1z4nxk5H43nUhmuDn/tOmKEyo7Cki3NLL5UmFrEafZR8YQGYuIkou7BOXa8wHqXRkG
         yy3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167117; x=1792771917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPXFXTYHfhMIi3Tk5OWQVDYZ9+5PmV/EuJNrX3blnmE=;
        b=Z091odMUVmcW9fjVJoia6epqA3p9qdLtllKzfDYefAxytOgbF8wZlFflVxT+HTiWyF
         zGYe7//oGvckkhK6M9xCoMqyRm/+c3VDXq6uU8Q/5yndB02M7cLKxJjm8LZ0mLho0yQB
         XOxat6Z1+KbUG1/Pk5PfeuUsYlJFeC1tlCU4oRLdekjzZ2k/evHqqTsYPgekNQcv5cge
         OmYp4v5RUzrgR0l+R+LUUEg61+5BFZp78Qvt6Am2uZ2AqEfEZ7LzaWJoj9NjmNNEn78u
         bxsRvNOGlP0f4V5cXpgwxDCWEu4ME+X0+puUvOsGfD8UIRkckM4wjuORk6TJzBWcseBf
         kfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167117; x=1792771917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPXFXTYHfhMIi3Tk5OWQVDYZ9+5PmV/EuJNrX3blnmE=;
        b=YrhUqeGw2bhMloK+KQtEfOyJgL7CisQU0cho8BLN2IbXs3IrYHDQjb9EE18DGcE4oB
         Gazn41DawRSaAo55n86HEmUhVFPK2tuhpQc9Uk0sskI8B+FuCFVUI5KgbgSFXnC7pfq4
         23P9hifI0EhiU1RbXC7CFYqXzv8TWXkWa5ZQdIvawZ8YccL386jqJcUPQ8+oHFF5LvzQ
         OFodGo07iLuTCLesZRypnOb+LGE5XAnQ/yDvnlZIUlju/NPAeSAD+1MTG4c3gN9ugWix
         UcpknMmzR/IKECpWjv5KE/hJzWwf/oM5oF5UQyzjHuyFW7rO8VjNzuhJLxh77W/obnnN
         wI6g==
X-Forwarded-Encrypted: i=1; AKwUvBwCzHfq0Nud3nxfRBOkjQcr7k1QF3vbuG6k3W2zZs5EXnwmMG/HwR9ZZj+wkFjYDhz/1FjxwcplCJWetyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/Clb/Mz4g4WpbMurECiAuR78z8oW2cNem+k2wCx5fiHBI3Ehp
	QL3YFLMXX3MDYbLv37yxZIJmg9SqdzpNVyRt93P+QEfDYpdkif+980xS0SfZStFNTj8s4NgN6CA
	/qIWqErbqiLSyUS8qcUYRM/zGn46XzAc=
X-Gm-Gg: AYBFou0yP5rP6XYdYZucjQfBMKfWMIBkpixcglEM/O3V5Hd3TjL+7gFBXs/xH1wams8
	qZpesrD1lsLalrg5CEqKwyO4yJzh/a/SmjvOWEiDewZjscxyajgdpDG9mgwJA7qZofOat1OfgS8
	Eqx0VXRI/SNvkTMMBoOrw96KdbnvcvR+NPfpZqFqouFhDjKnAkZCOnzM3v+PJ3Gq+sh8JBbww4N
	UVx9rHFQ5DuBrDE7cHO59N/4uGnw5/LRw6ebJ7dxXuOYH+0evJigsN5Tje4kLo4ok13q7NhkGLT
	+PnFYLMBwazE37cAieSW004XbvNdjDibP990sIplknx8W9ZfctkacCgnigdygMqcDq2BPP3kclI
	ETqtlB+K1jBTYOHZi8to7N16JpkbS7pA2zKnR/PQWc3apxBy80kmqUW8ySPwuzvD9ufC+48Iflw
	==
X-Received: by 2002:a05:6214:451d:b0:911:9373:a171 with SMTP id
 6a1803df08f44-91bdf14bd10mr7504466d6.30.1792167117094; Fri, 16 Oct 2026
 09:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016155947.11018-1-neganhat@gmail.com> <atJLkogz_looz_I7@kbusch-mbp>
In-Reply-To: <atJLkogz_looz_I7@kbusch-mbp>
From: =?UTF-8?B?Tmjhuq10IEFuaCBOZ3V54buFbiBEdXk=?= <neganhat@gmail.com>
Date: Fri, 16 Oct 2026 23:11:43 +0700
X-Gm-Features: AclHuK8Iwg8EbtvN55OnbeHF8C8q8dkZtGC1xJ5xQYF_Zpjnogu2bBvmMmbRg1Y
Message-ID: <CAFJkwZyX6==NCJgvgptD8C8AP5YtiLY=B8M5zacNYKxGXqQYnQ@mail.gmail.com>
Subject: Re: [PATCH v2] nvmet-fc: skip port entry rebinding if already bound
 to a target port
To: Keith Busch <kbusch@kernel.org>
Cc: paul.ely@broadcom.com, nareshgottumukkala83@gmail.com, hch@lst.de, 
	sagi@grimberg.me, kch@nvidia.com, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about the noise in the recent patches=E2=80=94I botched staging the d=
iff
before amending. v3 has the actual diff moving the check above
nvmet_fc_tgtport_get().

Regards,
Nhat Anh

On Fri, Oct 16, 2026 at 11:06=E2=80=AFPM Keith Busch <kbusch@kernel.org> wr=
ote:
>
> On Fri, Oct 16, 2026 at 10:59:47PM +0700, Nguyen Duy Nhat Anh wrote:
> > v1 -> v2:
> > - Move pe->tgtport check before nvmet_fc_tgtport_get() to avoid refcoun=
t leak.
>
> You may want to double check before posting new versions because this v2
> is identical to v1.
