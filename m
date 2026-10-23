Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792788433;
	b=gria70KdetZEVCo7wOBZxXJAEMa9KT7yqKZPajNh1C3MZH7ZifXivn/FvezUnVU69Q7z
	 V9IdRoAzh1VBeaC10+uaWfSeL1QTynanNEZAcjDWc8Pq1HqQoT7NeTEKRL2k4fzaZRriT
	 MWtUKYLaioFPjIyCXLmsdMU7Y2Ayesj1JcX0x4u+ZqMRzDAS90ZQJHRVDza9k8HtVcM9m
	 JFDTmTgVn6M1av4GnwAT3wMpKE036ju/BcVL3/sZR8ShyLkSsTmGFbBJIgp121pXhAucp
	 DVFV2IK1M542ybTwuRc8K18Xr1M6BApysBjFzw9G6opjyUkPCJDvQ00FLx7lmLKl1kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TCEbxm8avzTummi3Y3lCnYO6mye35k+RSerUFk+JTQ0=;
	b=WEyqySbGr2fPFEKjxNXScC8/suuvZ4tmc4zoyo46jBQQKe0suZRPzuAexyflFkrL33RY
	 DyhkSaouUG1CVi+mvy3PZxawCAOdqcgLy+0s9I11jInuPYcZQxA08v9niohmkPf6A3rcW
	 OEhdJlbvsSpoJ8scc/UKj8r6AJre5bSV64jVrPSriX6dNnwY2PiyU/NkEmbLraDY7q2oO
	 8yrjN/SbFAo/Ljcx7hjq8rOqUGIBrxOny7gPZGo6f706A8Eb6BM8k5Ek2r0QAffS9hMrq
	 fwSf2cu0s0Qi2mxufBcmMkZ8vBUcgA8bUwJ77NNYe9xooq3hP/KT0yHa/mHcHpAMvRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyY+LF3R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C20606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C20606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyY+LF3R
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c34bff61551so180174366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792788426; cv=none;
        d=google.com; s=arc-20260327;
        b=XCTyJ7D3s78Gs+CNIa81tk7ku6/Wc/NMVlU6ppxVq9mzaNEeRIZ3J01jpPVRzlxU9n
         mI1hvbcshKzh6yhwIC0Y9ijXmv2DUmFDy6IupeceBlFR22tK4EY2mDzDkHxEE2oa4qUF
         vGfYvb3CgEhC5MsQcA/xTAD3ZDYowVoofCxbCOdY3O0IFM5JCtrxzmunaxDtsekiH4iB
         9PlQKGAndAIeLHmtqytgMzmULTAa7i35dnO8nGVBvqgA7dukx1ADVxEgP2GdltrhqEQi
         6L+KL9IPYg7li23ddCckHfXEcXReqjaA7hMw9ZsclRz+9eTz7lucpUG+tzFV3LIEKeos
         /bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCEbxm8avzTummi3Y3lCnYO6mye35k+RSerUFk+JTQ0=;
        fh=w5UmRn3tkUzXvYOXey+qPGGTOsxG/0a6z6IFoAKja0Q=;
        b=SJnC5wNxnlJr4VnA3PLlRhVaTvkTwytaFID38Gye75n2g/Dk0HDF/Y6QnGPlbF+/Qp
         jMkyZVe6SLWjNJwHKnfFuqHkMS4OZEWeq8l5c73S2uzdyKNgV/XLqRXAOJIosKuueLrx
         L32Pom07PXzY2b+W75FyM5TeaBz/ik+n+YThlhnaUnp1zet15lWi9O5bj0pLkmEM+vc2
         +G8TstAKjhZqmGKWcoH5GU4XGRW3tj2cXwTBhthns+Jp8ZpIuczfBtNDxOcjKt/0imNu
         uOlhCLTejmpPFDtMKjmYxoigur3jte2T1BcD3RPSsVneYmIVAXVB9G/mbF++qyI8ZfVZ
         8mmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792788426; x=1793393226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCEbxm8avzTummi3Y3lCnYO6mye35k+RSerUFk+JTQ0=;
        b=oyY+LF3RBLKVUchgpkrZgHuXUdI3UhZ6sDH8n5vdQRyhJ702pqsWIZlC0Zo1JYcBqy
         zWYIKFKmIfbmDKAwvihtYud0XXU0ugl+GgJSFXWFPMtauTSwJHYCiZNXt+SXBw3BD7m6
         LThfv5zU3BkBH+tAC8OYLJgqi0fsp0izHfnUYufYTwFrw2nhltZ9d9iPBvFqRg89UYQu
         Q9zKKfJRFoonqequfrUZBvFMJhMgii0wwfcjvh5bKPTN6COi0g9KjksenOOXtWtCZH7j
         EMs7vlFV/J5VdEMlJXd5fUn8JNSg1I62nV9Jyov3HqZB2qy+f/AIzsjE1eyApoA8Fbu9
         I/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788426; x=1793393226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCEbxm8avzTummi3Y3lCnYO6mye35k+RSerUFk+JTQ0=;
        b=zNwXjxzJ7c/w2J9p9LIiu1qjkxke4qrVH2LSG4/C/P+d9w9uuDnTJKmh26Q1ahNyvO
         l3sb3KCmV5xWcpwi44MbfS0t3h+l5swlXqM+n1XY/IOP604P23GQgSsnsV0kdx0o96w7
         0XLQ+4g2F8WXgfjjfS4GAoxs0EvHOlUdTgZ6w5npt9GGhiSID3NN5ClkMVPPc0EjpaLO
         NmBm4aMQTXA0dJTSijhcRUj6Ba+QnLEOkI/NttoHUVTknnpkIjI7tvRlmSIfUifnCYwB
         xtkOdkz3gypi9CqX0Mc0AioYKYoTTwQsYXXvvMquMVQnnyZpWvhHMuLwrK50Pz6Cr6zM
         6Whg==
X-Forwarded-Encrypted: i=1; AKwUvBx0koziQjb6YsBmneCcd8oD9k7RQ9KeBIk2+NHohBkDoeOjNfvT8MEhM9Gl5N9wGu1zpBz5TLrcSWcfC3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcbYx1XzAv4r66h2eHuRatfiBTmtDGPxRKovV2yFhyDbofTMRS
	UOwrEBv5Ot4ltFl8oJQqf87aMvTInO12yHyqpvJ4Dc0WVlQgKk298LJMERYJ0YG9AyCGdzvVTQ7
	BXuBQkV/8yqRgEujQteO7b4SDNeVvJYCtfwSD
X-Gm-Gg: AYBFou1DRePCvJdZc110Dwgo8uUwgwPwINJYx/B1Yt0kFe2NPJExXX8vKRUYKRV5/6K
	fXDShLrDQnin0P/Mi6/5mm9eD2yhs7gOrXK18YwygKB0mENTtr4sYttQHoU8LgZfyjCPkkkU2PG
	dtdJGqGp0GWb859qRKJF7zK5Jb+JhfBy4Z9EKHUe6JDuH/OmKnykkCEtG/jHOnTJM1eK6r/gf/H
	FW44pPweWI5O0hyf65tRtQ64/SY2O33X6buydoe8MMbzb+7+1iu5KF4gi+ay8NQx1cRXnSzqkzV
	1lo+RUttIMirJeSSvUHNutsYGpqAlOJgiM9aOTga4vcc8y4zfoztA0Tx/veAgit77GLiEjK0PcC
	kjEqgIk5Qd8/um7fq6nszyeYjar8EiOjEqOUeGicH9jiV9EBeR80pD9AUMI0SvJ3x1n4sqwPPE6
	X1rbOE3ADJYI0e/PRor/ntUL4U1dl1pOfROg1FCa8qecZ1bLXHFStZrpOIKcxYF7VWALw4qQNPB
	bJiQ9m1RLiDpk1UM3EmhzKDdaJuf7rFNqqRTYFMcMRrex64hw==
X-Received: by 2002:a17:907:a0c9:b0:c1c:4a80:30c4 with SMTP id
 a640c23a62f3a-c46bddf651cmr6811166b.11.1792788425687; Fri, 23 Oct 2026
 13:47:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023005313.3946390-1-rosenp@gmail.com> <179271707120.3327.4775409276963055481@kernel.org>
 <CAKxU2N-_Th-ksPst_1KR3W1nYWoZpWR2Sjfo=RWroot5A1RR8w@mail.gmail.com>
 <20261023123637.1aba3995@kernel.org> <bbc66ce1-8d8d-4d35-9314-98fe14082690@broadcom.com>
In-Reply-To: <bbc66ce1-8d8d-4d35-9314-98fe14082690@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 23 Oct 2026 13:46:54 -0700
X-Gm-Features: AclHuK-ivruJl9X9jCViXiK5EZAfSDg6147raVZhkKBY9-G9io85x7I6pMGwWMo
Message-ID: <CAKxU2N-aNWtZUc0bkkc5H9mFWUn7RDti_ZzX4UHXhNyPPq3s8g@mail.gmail.com>
Subject: Re: [PATCH net] net: bgmac: fix oversized RX frame check
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:08=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 10/23/26 12:36, 'Jakub Kicinski' via BCM-KERNEL-FEEDBACK-LIST,PDL wrot=
e:
> > On Thu, 22 Oct 2026 18:00:53 -0700 Rosen Penev wrote:
> >>>   - How the issue was discovered, e.g. hit in production, hit during
> >>>     development, syzbot report, manual code inspection, LLM or static
> >>>     analysis tool scan.
> >> I added Suggested-by in the commit. LLM only used for the description.
> >
> > Suggested by is for suggestion of how to write the code,
> > if Florian reported it appropriate tag is Reported-by
>
> This was a suggestion, so I think it is appropriately being used here.
So do I apply both tags?
> --
> Florian
