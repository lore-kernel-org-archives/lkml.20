Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793263604;
	b=JTpAvopZs/JNlFn4BcoVluRilJmgZ945ZlYRQih0MahNLGtP1NDIokq2KRCfsWAQlBIa
	 yqEX9cm3wO8DEIwLft4FvvjBvsxDH1eqirmtK1L/KWXV/3+H8WriNbtZwAlcZON3eFwlC
	 fQ37McFwWexw9Zxo4WocfS+1ULDw6U9JvHjYB+X8BIs9V7+XUJESzOoKxh00q4bhr8QZx
	 f+GLOmRkQghllJURp1NO17EjbRb6Btjttc4fDtqnRzidOxIAtOl0YEz4z5svbYpxruLHj
	 hx5rkGY9/flSSqMXBckmqFN0Mg9gZhQctDCJSKkTiPGMRX4o70kQtnSHvleorI5HiTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a1WpD8CKMCmTwyPtEaw5nz6q3LRedCj+B/ByJhgWHZ8=;
	b=fFzfn1c4jf+7w8s8zbEVhpvvc1UacMOwzhzaEOnhqCTBVy2rldrW8irpKNZ+CUCv/oB4
	 6H6/g66DCfbfP8Tt8DVvb8UPIBxTOdzNM2wW5gn5OlJ7znKJ1J+YX9H/Pl+kyPdouNKYm
	 FNHp7tt4PpqBd8BdJPs39eRA9l0sJgo1InMQZO1wSBwzeXUAETN2jRc46E9weY0zXIhcx
	 r2hrocgt/Dp/otFRCy3/nCOUmTC4UbHtiicZthTFv59xe4J/JRFRBL+UITm49QuKPzAdx
	 tTKUV0xLOi9UYbcEFJA5WLui7ctmg7vhJEey0VkEOdY3LjmU2JY5DJjwSZcmQlqjCag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=u6k66prz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB49606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB49606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=u6k66prz
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c46bd7a7345so88403466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793263602; cv=none;
        d=google.com; s=arc-20260327;
        b=IRQ25K1hSaeLYsGpJXZMDYUpbD6Yt8JgnNPHlKoXzQs7vBgZ67gmAZ1iYeGaLp43Ka
         kI9kqqtLfqmOkNKvbYdzs3sh9K3hmFomAo7U/GNL30vYX5+O5QGp3PKA3eTO446XY81Y
         aeqPlRXkloLfE6XxW3uf2xATdTqBhccNVJ+2JdY7PLI6B06RWcCGM7DM1HFJ/f1vfzkw
         reCtPrMkqWW2d+pgxQ5nVoSU3KQ9sfrswqB7xJRUeEvgCvAdMY5pXDyIOPjLcgr3GgKM
         rQnWFkN6yQ/0yonWyTEtWWDqDzbuKC+lgHGXL5cwGtSadzAD1DwCKpuL4rh8rHmrh4Vz
         TRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a1WpD8CKMCmTwyPtEaw5nz6q3LRedCj+B/ByJhgWHZ8=;
        fh=XN9JrDh9H3KhIi+PFWWxE458ZXItAaL0WurCobDWDkQ=;
        b=Ni1O/ABVr2P8oCg8iYpGbvfdnRIsSHYPARC2j0m+hAWfpg8ytq9PkYjY1Cf4sfXWXq
         Ez6oalrM0iOPGaYeHmH06ZhKSFu0y8m8w74+QrCZUHhcaHzcFFgh7bh0nWmO4HV13J54
         c+6AmQO2QMKe7vovKl1bciMu2ryi11tExRHqupJHvj7jfbNZvGJLAb5gFo4Zv+e/jWm+
         qWjzU5zuVYL7WReP83nlP6LDWw6e1S//XtYvvHXhh2+KoQnEALkapEULpzeURHXkAr+f
         S0qMCxR+YkBFuDp8gTIeCIBQsxOMjtYvPvS1tugHMFsZtLPkWdD9sJrsk6Tt91hCvy3P
         9vMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793263602; x=1793868402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1WpD8CKMCmTwyPtEaw5nz6q3LRedCj+B/ByJhgWHZ8=;
        b=u6k66przy6QnhjhFElLmFV6aue9wU04pzaX3L52X1Sd1j3GO7gb5wzU/TeKvDmxgCo
         8n+k+Ker1fU9c/mQy7VK1m28/g1b5BsPn9LJOloUgLTkLQaQeTUcYJ0WGSUwYLt8Hjjq
         uWCwnnz7bsL0yuwjTSlZh1NwTWfiDa6D4yZbI+LHHHhS83WqHopmn7iWz304/cBxNBI6
         N7vzzZnUeAjP5/hg95H7ZIApN89/jwKAj8tEutfGNcHkCotzj4rbQfWMIkxyyCReV1wC
         xaIrcsXwwFpLRUcOdOlyYYKTMZdmgdBnu7jQSNlDsTZNgHnsURYEH/o4vkoRN27pjL6e
         pssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263602; x=1793868402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1WpD8CKMCmTwyPtEaw5nz6q3LRedCj+B/ByJhgWHZ8=;
        b=gzqT3XK/t08H7Dl+h+fvh2yEHAzEnVrsy2gJEmwqhCJUtZtJN3SjNN+oMmZCNGwZZt
         t6XqPItatUBPbrT778p+IUd+wpgTEOk+NxN5JM5Nvi+rk0MVX6kOZYeaR+TzPZH9B1lt
         sYwcWp5a0kp39RcsHQt9jeiXYV4U6Lc/SRVgyHmCtKM1a5lh8LJ9skilbW1alq0wqBHN
         EoSMDA3+RBhY7UDrKM7Ts6M6FbPloAC+1Im0QF9+1hH5OOJc7//3W4BXOV6mSGanFKR2
         B6oq75+Esg78zQvq+VH01DXGbNESKHzHzTSC9AmrWlPjK3gfB2gvui0jFiKtEJzZQJ5/
         RTMw==
X-Forwarded-Encrypted: i=1; AKwUvBy9Y5g4FaUoCfvntHMWZK6izAXJGidQxUxU+3X9DZ5COmvow3DBZRHV2hIcSzzuYatZUcXjxgSo5cl6MkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiquf9DQ2VvtRXlc9j9zg3tSh3tJA38ecqvYrUOhDUpZqZI6mW
	+D2cNzxLdCGOWp9tbeqRLcUGVTF1/444X0aHrQxGlds5Hw8f05qxoGBz+j1aOosIs3/JfVG/+eF
	XgSWnH4YlJg0VAYupl4jEjRKgH/NEnRorEEcJ+butlg==
X-Gm-Gg: AYBFou3OxKNayH7N6eHILAf3PpZv7/R6QYyAfA1ELQ97S30D6JEYhE9b2ovJJALHawR
	O5sy+PUdqvvEKScKjWlYPayZbOIOIJU31zmUQu2oCMVLvEWJMEkaL3vpLhrCn06hOkk3077ssoe
	CGevOV+ZnUbgJuZmUTK0Xx9WyZugwhbHSRQJFkQko3+YE8FljJKy9lXfjYlZpoHyan+LaT8X1ag
	S2cfaUPcqqRG1ReoN0oook8K4B6Cgr1Nef3Yx2KV6mRARyMUeh27Iw7MwtUkOgKi/bEiyR5d6W7
	Moyabn3lbIXJ6O2O3qXFbFOw2rUwX/FJEi9u1GKhY3GU916msSn5aY55PwvgWDlQFbNtg3uJ+3X
	SJ4wnMyIIQl6bUNL/HrdnDVoUSIm+yfaD0Y9cgIlU4W9nbm57+D5u37+9hfr/lVrRmK2TTok=
X-Received: by 2002:a17:907:8687:b0:c46:d493:47be with SMTP id
 a640c23a62f3a-c49d123892bmr163688866b.19.1793263602434; Thu, 29 Oct 2026
 01:46:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-biwin-tua-quirk-v1-1-767a12c9b9cc@flipper.net> <96f75e1f-9b4d-490d-9492-e60bdc31ae79@acm.org>
In-Reply-To: <96f75e1f-9b4d-490d-9492-e60bdc31ae79@acm.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 29 Oct 2026 12:46:26 +0400
X-Gm-Features: AclHuK_iIuXyc87PtXwJzKHpST6z2LbPjP651cuL9m3vutOTuWFnAaQm9CNolb0
Message-ID: <CAKTNdwEStLNtK+UGqLK8ZY42Ui5vVMK2XRu6-bsfkW3D4ZY76g@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Clear power-on UNIT ATTENTION on BIWIN devices
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@micron.com>, 
	Stanley Jhu <stanleyjhu@google.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:40=E2=80=AFPM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> On 10/28/26 5:54 AM, Alexey Charkov wrote:
> >   drivers/ufs/core/ufshcd.c | 54 ++++++++++++++++++++++++++++++++++++++=
+++++++++
> >   include/ufs/ufs_quirks.h  |  9 ++++++++
> >   include/ufs/ufshcd.h      |  1 +
>
> The quirk has been implemented in the wrong layer. The right layer to
> implement this type of quirk is the SCSI disk driver (sd.c).

Thanks, Bart. I'll see how to redo it at that layer and send a v2.

Best regards,
Alexey
