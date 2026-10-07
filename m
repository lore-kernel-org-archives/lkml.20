Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32B9472F97
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374022; cv=pass; b=ml14RhXECv01HD2vAFUxTbat2msBaJ7IdLwv0X0tKbnlIQOba7FZb9tu3aedda+wQcE9+fLV/UP6lQ14kVwsc54h0Q7niPVkImUwQBxbvLyeEKW/1/mSof32fVRvC2lR7hOVZWpaaADJcbUeiWHFbnNt6CX+YIguBOCraG7bjdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374022; c=relaxed/simple;
	bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYYymJRPTVjodcrugt/wDNUXfrkMUZb63FyKU6tSUTsQN/L43A8lQYgzpaKif+1iDi+KvocbezWNNm/qAc2JE+KUu6Pyfpl+MfSkdGMDMq9bj5GiQerHevwMsttTpiY8BfcVpM/bbXNyIJzadoEWvBh3PggL6dFKTj8nvRcrke8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2jVc83n; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2jVc83n"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5fb79ce82so4458545ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791374012; cv=none;
        d=google.com; s=arc-20260327;
        b=a6Fk00qHy+SAO0Lt1sKpTveTiIgGaRi7Ymhd41b6VkN7KWxt6POcQLZsakIKjozLZi
         Eyvyf9Ec1wuzekDZ2nUeNGBGbjW7FB9DkTQHcMAePxY9RGsRG2P1gldSpe/rcybNa8So
         LI5KxbGWw2ftAkyHaiNfwcFxJXMZMFF8hk1uL9MQnKOUyOgqy2T3KoupI2Ax2ItzOZGn
         sdZDEil5M3YpkxSicVZp2egNN+Fd1MYkUVpij9+0lkf6tx9yROahbahiqgqu8Zm161IE
         e+Hxy+YwLGzPP9ZADmX6ADgyOcxbXlmSIc7+NIaFIz7KCJW5D1m1ugY8YYQG6Q+XDzU3
         P2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
        fh=29Xfd2+cpRbhKqKZvWS6BemKwYe8Uv+EMRakVe8WlVI=;
        b=HJCmzt0jNtQkwyjS0ThV25zjpOOEwRHLx7wCPjfouAO0qBjhhYFfyZECiWtqAlO6AZ
         vuVivphjMotf9lZKRiQR2meUfid+NqDmSfJBKABPA4szwGenHIJhfv0D7jdIgVRLxL34
         g7FaYichM/HCwiEbzgdwd1g7LozrTZJ1wWNpL81Dodryes8ZT5eXMG/rS1ljve58MyEE
         p2c3fiRGvNtWfNttNes3cVInCzcxNopE/OIl61Q0ZpUFP0RW5Q/L/Qxjn4BPBYJ8wSMw
         MnW+Ge/M3zE8X4TChwX2J3olZ8iPzkET3DuX0cnp0GRKH7KAZ8/K73HHm78a4Gx6D+lE
         vYDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374012; x=1791978812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
        b=K2jVc83nrzC9u98XFs6c7s1RMoDzKdEpkZXv/O27O8gI6RnYYBr15BPX03OX6hH0Hr
         iSpJFlg/ALBKVO6xoUfrlqWBM9Gg22Y9IaRkRDZL/Uobkfpmsp9Q7iTa5PURTQRaRGCr
         LNHXnnX0Tr+okNiHgvbBq/t3qkMMpEamsb0HYwyPtFqii9L+W2iCKGKKMoIBJvqIcT+/
         h9M8k4fjvcelsrcZbtpjgrNyMM404vVg+T1mPkeBLHRGVPiVvfH9jeyv3wgHyLTIPvLc
         1PuW9WyMYLWP9hNu/XN1AHiJ05KUVRJE9/e1mi7GUC7Ac8h9XzXUIxq5xZFejxXHshCo
         1pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374012; x=1791978812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
        b=wiQQLkhFnRmyU5scr50Yo2gWxf8x3UTZvuMsZ5wIFARwOsvGK+J9dolo4k4EnLJc5t
         nsLa2U7SnDFtXq3kHMbulO7Tt9w1Wl17zLEpRdnV6qmEJL7m95kTlTtFrFbylkkxZ8GP
         yTmgBemz5YnPCkZcmW6vB/dPFPrp7gWuCxvq6inc3S9fY1o0pan20QRyRv6cZY5ieYW+
         yz+gbr/QZeALYVquisSQYBYOQoffy7yWhC8sIqk4fh5zWWSKTkjp8UFdVNOIraO7Y+1V
         kOi0ZN4pK7N4Ynr6voDqIDNu38SRJSz58hq3ooI5uLkL5KvBmrt9FAbV2Id2uT+Birkw
         9HXw==
X-Forwarded-Encrypted: i=1; AKwUvBxUtAvjyNktzcyei7tAb9Wkp7y8UX7MffugWZxYLd0lJZvus/J0dJmTFCf7gA+lak7uNMCdr8q9sekUz+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMjI0iS9tD/Y8J1kVKo9o773UozvW4xnJvn6JLaScLs/MSJYHk
	/D0SFYTkFZG325PQsblG8AEVEJqf+GBT4n7d/XXMuev1hOIBfoDIjf7Qke2Vi2c/CkCh0jwRIZI
	7j+cc0PSCQYikvbanAzk9u8jyvCOumGM=
X-Gm-Gg: AYBFou1iyC84SuBjGdnYGg0SIcq3XxWIYIs0st6C/a6eIplxIslHUpuT9Ky+uBBqJOm
	oUBCq7OJEM4ZDwQjdfkjaps1oyx+JlyY83T3aPFlj5I10xPSSFcDn2zgCABb7ov2i33s0izMEEO
	DOjkQGRpTILBeMwzp5KFqexL1TXQJU4bA7J2FlxEtH8bhIzKexjnO/1HMgTxVLux5gHtVK3bspO
	Coe73PiMR0aZQYRRDf2qAwVnH/27SSUhkh8fjizX/NsVSYq2UtrQupShuNe4EFfoxBB4caBuvU6
	afgztu1QM9mrZGCV0bU1HP7cDxGU+QSy5wqDgMTj0rNwEh/D0HM67j0EZZ+S60JpR3zMlM7JF4O
	SwGgrvKK0
X-Received: by 2002:a17:903:110f:b0:2e5:c563:c0dc with SMTP id
 d9443c01a7336-2e600509c23mr20094385ad.42.1791374012035; Wed, 07 Oct 2026
 04:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006061549.627-1-adrianhuang0701@gmail.com>
 <20261006061549.627-2-adrianhuang0701@gmail.com> <311d97da9ba4b870ef03aa412586b751bc7da3f5.camel@mailbox.org>
In-Reply-To: <311d97da9ba4b870ef03aa412586b751bc7da3f5.camel@mailbox.org>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Wed, 7 Oct 2026 19:53:18 +0800
X-Gm-Features: AclHuK_APIuynXW_Vvb6ZGIqmtWSwMFkf9exrzESzLpquCiFRKPp55oN2AWzJJY
Message-ID: <CAHKZfL3z0-fVa7HhW+J5E0RdEUoR-E3wMFYmQ6C0ZQh7t1xoGQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Docs/admin-guide/mm/damon: Fix various typos
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, ahuang12@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manuel,

On Wed, Oct 7, 2026 at 6:30=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox.=
org> wrote:
>
> Hi Adrian,
>
> I have read your patch and the affected files. I have found
> a lot of issues, non in your patch.
>
> This got kinda big, so if you don't want add it to your series
> let me know, then I'll make a patch on top of yours.

Since you found those typos and grammatical errors, I think you=E2=80=99re =
the
best person to submit another patch. The credit should go to you. ;-).

Also, as SJ suggested in the previous email, please post another patch
to fix those issues.

Thanks.
-- Adrian
