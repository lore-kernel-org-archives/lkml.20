Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E437F72F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989477; cv=none; b=mc9pidybO/gLIcGx1xRL4ZK8VsHBJJ46KLlbTwbzd7bsjY+wDcDNASEdFrEaPGP16ROGPd1ZVoTTw91oysGIuoX2IrB9ex7S3vxzIalUmPsN1rm077wiqk2KROvzcnFt+Vh6C/KIgjFrpU43VvJ1zDjJOXpZunALsppgIyjybvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989477; c=relaxed/simple;
	bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e+HPjz3TdWxlwlQHBcFSA3vAMGINwe6wZHO+qCxYlHy84oj0CLaqSvgerYWNTd1CA8C/uXI60zNa7QJWSw5MT5NYXDKctqKRzaALOagqgB7diGIzplWqLxX4dfnwpvzINRtocZJCEm2V8DekJ5g+PqkOIP+strJ+2xP/1CjeCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KJlTsPQn; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KJlTsPQn"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso688794b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791989474; x=1792594274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
        b=KJlTsPQneOdTf+NTnEos2i1mBGw3NT6yl1s6xGRchVxV2aqPUvUmXNzpMG02tz4GpY
         bc8jA0xajctuztG1P6Ca+wtFW1m62LNLTBPkvKz9MWWEPTKyrTU6NU7sYZi5FO4oVrgj
         7FQ5RA6fWyovx012HSl8I9iFXnM71GSyWaYwOq030UDqN9H8j9LtPa0VnU653FEsvltW
         LjqikJ1IeMTRkGwJ3Wnb0i3U7ex4UnUCToSNSXGU04UBcdr6IsuAwTPDD+OQouNbPFVl
         3h+WW2ZeZ3joK3rb8kCO8JPu9DN9zrq+ioinvRU68Aq4Ddg6bojtMgvVvPCpgNmsU1TS
         +5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989474; x=1792594274;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
        b=xp1af1Z3bTeSaeQhRM2OQLU4NyJ5560hHE/vsr8C/r0ImD7ipshRE2gd2jcRIfoMNL
         H0y0NAfXUijixNpC9obVDQZiFA8Xpb4/Nd4y5QadCWwfcd/hHNbMHf9dgswXqGJd865h
         CtcMK2V61lxLvBEyHQhkR1ItJQQgYKday7bHC8aTA7wGwgSrAm0SSO5iv2m80W77t8yJ
         /D/nH0X3okbQaUx/5MjiMFQVN6zWZ1jGcZrWD5xX+gurDgtg+Pe2Un/dnLcw6oGmhTI+
         o2mJTSxIT0Z9A6lD0FzWe0l3LkJSxnkHZWc29DhBbKVlku/EpN23Xqy5OaSRrXXBvceL
         EC5Q==
X-Forwarded-Encrypted: i=1; AKwUvByfjXzPYxdNLXb8lC5/+0cOkbIugeqdf1yQBc74sxDQ077W+Vi4h0pIJRItsS8T+VyaktLjKQDxqCwoZYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjALelG0rFCsw695UHkAJSyJ4Vh4YUKrjh95bAXFVo8vUh7eG+
	HYZGbDGeY0kYWVcr7iIAyxbpO0FpAJHefO7n+AIlG0PeUnPsrmVaUkNiOS/mUS4nz/nzFVcBb26
	Y8OAKpeaVweS3zO58MJnLr/0oa4PtcU58Lg==
X-Received: from oiic12-n1.prod.google.com ([2002:a05:6808:a5cc:10b0:4f2:6bd5:e3a1])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a1b:b0:4d6:9335:d533 with SMTP id 5614622812f47-50c5b17f9b1mr14938839b6e.64.1791989474239;
 Wed, 14 Oct 2026 07:51:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:50:37 +0000
In-Reply-To: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014145045.2369689-1-johnsingleton@google.com>
Subject: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation and
 block comments
From: John Singleton <johnsingleton@google.com>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	johnsingleton@google.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:20=E2=80=AFAM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Thank you, Andy. Just to confirm from my examination, I think the key iss=
ues are:
> 1) There should be separate patches for the comment-cleanup and the funct=
ion-header cleanup and
> 2) The preference is to do this for all files in a directory, rather than=
 a subset.
>
> Is that a fair summary of the concerns?
>
> On Mon, Oct 12, 2026 at 2:05=E2=80=AFPM Andy Shevchenko <andy.shevchenko@=
gmail.com> wrote:
>>
>> On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@go=
ogle.com> wrote:
>> >
>> > Replace leading spaces with tabs in function parameter lists and
>> > format multi-line comments according to kernel coding style.
>>
>> Please, read the mail archive to understand why this patch is no-go.


Thank you, Andy. Just to confirm from my examination, I think the key issue=
s are:
1) There should be separate patches for the comment-cleanup and the functio=
n-header cleanup and
2) The preference is to do this for all files in a directory, rather than a=
 subset.

Is that a fair summary of the concerns?

>>
>> --
>> With Best Regards,
>> Andy Shevchenko

