Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9823EC81A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355673; cv=none; b=ABAbnKxWiOXPgC6ySYd30enEsv+9qOdS7zqdqMRaExsA3QGIlG3UU2kCxGo1ZjJj1Sw+1dV5ZgooMQ60Wi1DRzPj8oSQFjbSrVi5WgoR8wemW48ILYGo/V/SNFyKLXHZnbt8vKschC+pMVanbCMT3ORW3p+Z1IKNGl0XP2A07Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355673; c=relaxed/simple;
	bh=mGtMxGvGMAPxZX+KuCd0vFb++3GQYItv+c8z4egM++c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e48ZA6U2QTt7VKNpOHAJXhsbTDDsJtEmGl4RCOysYu79/VoES4Zl41REL6DR/eD5/GDImXEwtFucJsiE8/jE6pYfRe7YHMD0W05lIJ8P60pzNgJQEMHpe5PR59bZP2RkUy+IiuM4EeZnfD6yCSKfnQpADDiGmbIqKQhTcYifdLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gqwLDKu5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gqwLDKu5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e8c710847so168432666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792355669; x=1792960469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcZudtVZGXqPCpJjVd+PjoGGou1YwE9FLeXdn5NeRV4=;
        b=gqwLDKu5s9gordUFCi6XC70nosY/hZjBZv6Qb8r48rLLHMiDWFg/swEdylGSGbWspM
         uU+2cPaD8Ciz9MwAuWxhkoE1LjLgrtgsp5EGEtw5FFerYl1WGfU5WBn2tvDkb8QkSGs5
         FjQRhQrl5cEPlT327Je2O5ZAphnx0itGXUk3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792355669; x=1792960469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LcZudtVZGXqPCpJjVd+PjoGGou1YwE9FLeXdn5NeRV4=;
        b=JWBdPkGeXJ3ItC7RPHlo+BEo6kSANOb7W1yDBJo0EJKe9FBhP1V5lYuC3BbIzIZPiH
         ecOh6DIESpc1ikVAGmTNKIWEeI5z8b/bs1SkhoT4Oq3b1JqkQmWio8vCFHMGxwYqlN+H
         xZGtoTbVK34FCM5hJ1g31uQHRKDP5lu+m8/UtIEemMjYk5mMuLgPW+fkjudsACFKTy0l
         514X2T0JaPCMOYaqRHDPE45bXHHY2OyfuPsvzWRumdFeN+1RHuE7q8gL2CKXffthWOdn
         RJyscbngpUdnBlIf7FG1h7XOhcNIRkNvs8vzTMHSXQXClpYf1w1/jkyCdgHzhSdwwezH
         umPA==
X-Forwarded-Encrypted: i=1; AKwUvBxTF5mc4O2sGc7o+LN8HjoKnr8II3KFPMQzHgX7AktM54/A/aYjVPmjhZDzIAJnizHAT9j7j3zQexzKbzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwhujWL9lVLvzzMifWEpmr07qqBGXTpQ346vBLW/o8rZQd6fbJ
	CVs/TmQnAn1h715jxmSjv3Bkl72obSeXTWtvCDLrAPI/Bjm1FNwxFdBtj9B6EfWTrhlTLw8NYMa
	2LKJrWFI=
X-Gm-Gg: AYBFou012+UhbcPVgcgeuKUuMvtxGesMMvwObysG4FjU6rtW/mC9juktSY+AGonRtb/
	+BWgX5tPjdVrgy4GYU76QZy9qs7nrJabBwIwu2vOtpQ8Pe161N2xtrFPohMvgOmT2RXq7K0SIeM
	HbWFbenYRM66aEoqJrlzq2nUpmcezqbf3tNMLiEUsnRpKGq/xov3w8VG6hWxRdYzfyW8tSx92dO
	tV2XRHIKPvF/A+TfmwLEn7s4jmRFFSp695cCtAZT3F1PCZOspGXxw1v/AYujjl+fxOZe/fjs3Cv
	BQkqEafjXfFaSaT4keuNoNHS4QoRdY7SQTra3/6ce98dDj+hmI8b7EHKWh2WNh+0O3dSTVd4a3G
	39te6HHA2Xhs1dwFyI4E8gneoypoJQSdBXBqGIO84kIuCETGqaOP2J3sKDjJZsQFuFD2KyqMY7F
	drtinr81tAOimFHVYoRIJxayX/iF9w1/Gfeyh5D2TK6SdOISCyfdcHXYZpeI/dI+x6lsNVy56aa
	AEUoPcIioWZwQmoPLNo/E2ZQe6IqSj4BRPkgITLIMniCpI=
X-Received: by 2002:a17:907:e1c5:20b0:c41:cf68:bbd0 with SMTP id a640c23a62f3a-c41cf68f3a2mr207361166b.26.1792355669297;
        Sun, 18 Oct 2026 13:34:29 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm291737066b.61.2026.10.18.13.34.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 13:34:29 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e8c710847so168431566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxiyhQEc1ruFOHaOhTC0JwlFfXXOpZ+m6yIB2W+h7BEADC/TcekYMa6EKT17NzogkugzAz2saRadHBREtM=@vger.kernel.org
X-Received: by 2002:a17:907:6d0b:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c419faf81bemr359351966b.35.1792355668398; Sun, 18 Oct 2026
 13:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com> <20261018152358-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261018152358-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sun, 18 Oct 2026 10:34:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiUn9EbV4TJ4J7OPY0fVc3UC+xb-pp=+rg3hRc4jQqihg@mail.gmail.com>
X-Gm-Features: AclHuK98aalKW5kTezoePJe0elXfnFi_e6X010Sl6ShLR7WlXp_TWSCo1UYtPLA
Message-ID: <CAHk-=wiUn9EbV4TJ4J7OPY0fVc3UC+xb-pp=+rg3hRc4jQqihg@mail.gmail.com>
Subject: Re: [BUG] vhost/vringh: __get_user without access_ok leaks kernel
 memory via vDPA passthrough
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Haoran Wang <haoranwangsec@gmail.com>, jasowangio@gmail.com, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, eperezma@redhat.com, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 09:26, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> +               __virtio16 __user *uaddr = ivec.iov.iovec[0].iov_base;
> +
> +               if (!access_ok(uaddr, sizeof(*p)))
> +                       return -EFAULT;
> +               ret = __get_user(tmp, uaddr);

You should never use __get_user() in the first place. It is almost
always just a bug.

And __get_user() together with access_ok() is actively wrong and
stupid. It's slower, bigger, and more bug-prone than just using
"get_user()".

The *only* reason ever to use __get_user() is in very very iffy code
that might use a kernel pointer and doesn't want the access_ok() code.

Or old legacy code from the last century when __get_user() was faster
and was inlined.

               Linus
