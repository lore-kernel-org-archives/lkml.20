Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D9F41D228
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860512; cv=none; b=LSsYU6ymSOBrgyqllOkr/Pc1P3I18/PABxsGqYhzRtLAWEgYCw2UbnWf5gsQoT1oAOsUFQD5NbjvoK5wx7a98v+wTHwnxZNHbiSCby+gXFIbp5RwH2XQsEvZeDpeVu5egWzFG4OpkXPC5ep6ZwAYszPYUyXCkrdVwa8Um5aDXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860512; c=relaxed/simple;
	bh=br2suaEIjGKbFF5+bYLbcAvyV0Ek7eGUNoJPbZzLNjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qu4LqKRmlL7nb++1GCEMaQtHRPj/+EYynbR4fSBjKI+I+1YGxa19WgjxpRDXIlpy9yPJ9MQx/JPDFlhTZ3hGs/xfpteas6HNTUm0dQkvBDEy08cqW9/m4oBgVJgwGj+VDo7Pcy3iM4Y09tGUtaAPdIP3XTsHJxnlt72KmOwRA4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le77j9dU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le77j9dU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2038A1F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860511;
	bh=TINBbytPg/b2XLiSEqbqNhjnJmx78W0AKEtx4nAg5lw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Le77j9dUTadbLOSRixm2P6rTaILzEK/at1TksaCRJ+xmLbL/06yaWGPZKkb5SPXpz
	 3udrBLAxmQSUandbbKdzs8/b8yqevBIgIf3J5U8X/3lS9vWFZWmGGhMBkJJT4xfuI+
	 rw546/BSY42TyUTyKlAT3Z37be8xMw3JdedptTSF0oTv0obvDGNQ9hoA29hDROZ1jS
	 qHlcpRnq7KXxBKNN3figFyJ3YtEFjwztyhZeuINFJI5N8krzGucvlc4b9mWlDhf/w/
	 dzHhZYhuJFXphSvqkd8qbP7Svc20avXG8bROg+JMmu7DiX68rf8NpBYNQUyoyrqC6+
	 J4FQulGQlW2yQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2637dd37c1so324196166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxclQo/AGe5go0GfYJ0kxpMvkfw1zXcG0udYhYvSBDhP56aBrKkWk9cW/BE/oP1LBnXeiZFAa0OGjGLzsc=@vger.kernel.org
X-Gm-Message-State: AFuF++ntA+FHay6uuMoL/Fnl3NoLVaOb4calwt734DR6Ee3DtpT59kgg
	PkRU0HRM06PY+Fqx5+FuXwqOoLECmoxjv4Cxzn5p8dtzzPOQl2AcZ3gTnnKDwITQuX8gzQXtMjC
	dxxqpzmje37GOJjIMGZpJM9XSDzSnjbQ=
X-Received: by 2002:a17:906:478f:b0:c20:fda7:1856 with SMTP id
 a640c23a62f3a-c260c7b61fcmr1143741466b.8.1788860509808; Tue, 08 Sep 2026
 02:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907101623.671477-1-yijiangshan@kylinos.cn>
In-Reply-To: <20260907101623.671477-1-yijiangshan@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 8 Sep 2026 18:41:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_RLbH6uoqjua+mLaYaepN9MxsLSfEt0fN5OL2Qk7esGg@mail.gmail.com>
X-Gm-Features: AcwNN1VeMm1B8clYUuTUaR8yTLbeixI9pFWrgsZs3UdgGnv01BI4eN9UjyOOCBA
Message-ID: <CAKYAXd_RLbH6uoqjua+mLaYaepN9MxsLSfEt0fN5OL2Qk7esGg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: remove unreachable code in load_and_init_attrdef/upcase
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	13667453960@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:17=E2=80=AFPM Jiangshan Yi <yijiangshan@kylinos.cn=
> wrote:
>
> Both load_and_init_attrdef() and load_and_init_upcase() open a system
> inode with ntfs_iget() and, on error, run:
>
>         if (IS_ERR(ino)) {
>                 if (!IS_ERR(ino))
>                         iput(ino);
>                 goto failed;
>         }
>
> The inner guard is the exact negation of the outer one, so
> iput(ino) is dead code.  Drop the unreachable branch and collapse
> the error check to a single statement.
>
> No functional change.
>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
