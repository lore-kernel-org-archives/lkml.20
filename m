Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455F3BBFA0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743723; cv=none; b=lkoJ91G68/wU8IP/+Tv8V8F7Wz4gF5p8Ly/3VukDLILP+8bCq31sIc1WdkNMwXA5zkaoTCyWfjKEDX8xsx7IOTae7xRhijGkSh6QT5OpdjizBWFm0pAFzZ/WkIJbc+sBNlp/c9Qp7R5WQQ4ZZDWoNc5TCNGKLTF0vzip151QSVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743723; c=relaxed/simple;
	bh=Wuo+bMt7X8tweXE396YuJxWT4Aq/RkDqSUllNrlHizk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTorzmz4n0zpAuAI5Bkw9cN8X1ZONLoDvbgfmJ2OHvOKcGzRB/pqTKtPvbSyU2PGax5JqBycCOA8PvwBv97B9hPZxpqXS4SNThLU9IHY6CkLY4QP6Jp9S8Uiikin/hU6olugHyjPnqFsbT2lTBqO6MWzDnAcKN6zEPjqLqgKO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7y0Hp19; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7y0Hp19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2461F00A3F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787743721;
	bh=Wuo+bMt7X8tweXE396YuJxWT4Aq/RkDqSUllNrlHizk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G7y0Hp19/Av66o950bB/VeUxWsvcU51z6yZRQve86t/JBI7xs2ETlgPKa2rlBZVdT
	 +wzEuMW+D7IoREah0lJ8TB1aijmrMKi/dFINX9q2fGaIErIsRMb5QLohg2rLct63MC
	 kl9xX8xjjeb3JP5V+Qa+9XeMVjV3E5A1i66uDvnaQ/08xAHacNx5w2VKZ5TQd0QW+o
	 uUBbwLp21eMwiIWc7m52GfAvGdlRQ1FJmmr5WX5LSYjeLlNBcmenxr+7ZLPSZIMwJ2
	 fAMNS0O0DPBEeXzQ7ipY2svMZLr7knrBKCr2Z3eY+7P3QrIYF9sfrTIVQZSNce4jrB
	 KWnV8zG1SNgYA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1545228a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:28:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqDj4L8SaynbFdlHLmX7cswST1AzVQOr1elUP94qnfVoPtVItIV+TRGfsTjODss3jnvb7TXX5LONpFiE9M=@vger.kernel.org
X-Gm-Message-State: AFuF++mYnas/mHWoZLhTO7LQyOHi2xh1j8T3GPS1jgmihAcsbV6ZVYsr
	wXaievuTRkcAd7m5Zw4GjQ7zeqAMAGZYr6zcuutp3rP6Hh3JtsvlqY52r2gjmy769LPz4vilVmP
	yq7v5B1MY4o2kkuFWUYyItUsTPmTiJCo=
X-Received: by 2002:a05:6402:42c5:b0:6a0:8885:e6f0 with SMTP id
 4fb4d7f45d1cf-6a5df5f0b61mr7500755a12.3.1787743719648; Wed, 26 Aug 2026
 04:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824054115.114298-1-zenghongling@kylinos.cn>
In-Reply-To: <20260824054115.114298-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 26 Aug 2026 20:28:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8RD=NisPHjoD+8meAh6s-nnN7jeRYmyH6Fv+9UVhBzwA@mail.gmail.com>
X-Gm-Features: AcwNN1Umr7HrHWw_6xgnr6FeYmdAF4X6UTN7nxBD-H1Af0wJVN52kVeriAwjaOQ
Message-ID: <CAKYAXd8RD=NisPHjoD+8meAh6s-nnN7jeRYmyH6Fv+9UVhBzwA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix incorrect MFT record pointer passed to ntfs_attr_record_resize
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 2:41=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> ntfs_new_attr_flags() passes the wrong MFT record to ntfs_attr_record_res=
ize().
> When the attribute is in an extent record, ctx->mrec points to the extent
> but the function receives the base record pointer m, causing incorrect
> size calculations in memmove.
>
> Fix by passing ctx->mrec (the actual MFT record containing the attribute)
> instead of m (the base MFT record) to ntfs_attr_record_resize().
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
