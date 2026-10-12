Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99D43911C0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811063; cv=none; b=YmLGN3Rp1erksg01JVNfK2QSZBYoVDts7GO8m0x2zl7l/vmiZv53v94C3ZDmLNfFJmNznQOwQhpvr6WH+0a0O4jepn6uJa8TJ1RYZGK+38a+NZwoQpVRNRfs4GcSgjFnV0uCcR8GzlfviZ4wiPvS9zmk8md48pEHVEIS0DF/JDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811063; c=relaxed/simple;
	bh=sWZj4fi9PchIWq6iTv6FoJJcUWY4ROJjikopBkr9icg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fp4pEVlyT57rhUFuCJCPEM6OGjtin8WEpcrBMhuGS7qlMRxH1w1mGqRcHC7m7UVYJhh5RIaJWY3arIHS+wggxRHk5ZUNhmhvFkPE+iV+/t7KK17250E68ltB+IqVKO/E2C24e/0FRAb+6QXLE6dlD+cBQRN/HPb8/1RMFzgJYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gyFHEdYS; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gyFHEdYS"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a170fa0879so14440165e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791811060; x=1792415860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+fEAaRgfVTrd4ivzqjJHoxub+cLoCC1NeXyWvtmvqHk=;
        b=gyFHEdYStsj+LBr9NGC7a1w2pOu/0BpTT7rrJLqnUMTFuP4gQzld2wMQaPLXFyx9eQ
         SyaiOIIz/N6aHSi4Ykh0Lw8MZX7I8NWsbkFVMS6CjiaUz7XMEvZ/lrqsljWiHBwF5Z4I
         CxMAWnsaF3Kzx3GpPPCCRDWLUv+2Hsf1DmkeMeov2iAE+dwU6xTTC3fJPXq8XlQuPDZE
         HADKt6GkqgXddLHoL9FJg/pgwLj8gQezXCbP/bYFFQq9jOmhRaLhs+Ztt9lwx5qifkZz
         fj6kLCF5ub1LQUqaWvFqpNJWGKf6/7p9ol7OSsrDAVRgcJb7HMGUFvXtFMMGzCvtgqvZ
         Q+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811060; x=1792415860;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fEAaRgfVTrd4ivzqjJHoxub+cLoCC1NeXyWvtmvqHk=;
        b=soSxeRvqeHqcp0TT5Cnai7N2s9YJNO0UaIUhqlETdt3pTo9MB8M+xvEaS21//D+eEH
         hWmrStnI0/NqxXqIUDJ5eMjIPuJUM0NRn9Th/fRNV1SG/QvhTa18c6jwFBBAQAcD5k4r
         ZVWWYA8n79Phu1NSulb6oYTAM2W03FBdPRMSp7KsUBml82kS+3Wq7iUrKJnQOza3AvNH
         vhjFYILwjg5ZaXqFOEAezi3ThL/+QLHt7ry1bUL8kKSsNR/vChQ/z5lqRIfYRsVGds2G
         IsoPt8yiKKe2WhIVPa56NO4eWIJaEIxGe+jI+jgYqv3bAhHQ0l5DRStX2bCBfcKUWoGs
         GETw==
X-Forwarded-Encrypted: i=1; AKwUvBw4r7zV6Q+6hlYe44kpI87wbz4QB+SqxP+65ffxyvKQFw9euE1xzr3TmoLUiuWQ0QQIRq+hqc1bhjn67Bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj1CbRGUIyHamUtJ8XqXSPep57NrNw+feVwzCjcHSrLsmz3Kly
	9frQSer0BlyCmKd3M0twksDlvol8Ml1epx2uJWNGhGJqPBiwdNUUMsyNPaJQ0+AYuKB+/gUBhji
	P9v2Q6A3/OH1rpQ==
X-Received: from wmoo9.prod.google.com ([2002:a05:600d:109:b0:4a1:8741:47d4])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b28:b0:49f:ff7b:f056 with SMTP id 5b1f17b1804b1-4a18e4a3c24mr156632435e9.9.1791811060039;
 Mon, 12 Oct 2026 06:17:40 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:17:39 +0000
In-Reply-To: <20261012115928.1372317-1-smariotti@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012115928.1372317-1-smariotti@disroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
Message-ID: <DM2W05XKJT97.2ATHPA28J84ZH@google.com>
Subject: Re: [PATCH] selftests/sched_ext: Fix build error in dequeue_remote selftest
From: Kuba Piecuch <jpiecuch@google.com>
To: Samuele Mariotti <smariotti@disroot.org>, <tj@kernel.org>
Cc: <void@manifault.com>, <arighi@nvidia.com>, <changwoo@igalia.com>, 
	<jpiecuch@google.com>, <shuah@kernel.org>, <sched-ext@lists.linux.dev>, 
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon Oct 12, 2026 at 11:59 AM UTC, Samuele Mariotti wrote:
> Building the dequeue_remote selftest with newer compilers (e.g., gcc 16)
> triggers the following error:
>
> dequeue_remote.c:39:32: error: variable =E2=80=98sum=E2=80=99 set but not=
 used
>
> The 'volatile' qualifier prevents the writes from being optimized away,
> but does not silence the warning, since 'sum' is indeed only written and
> never read.
>
> Consume 'sum' via an empty asm() with a register input constraint, as
> already done for the dequeue selftest in commit 3788e3251653
> ("selftests/sched_ext: Fix build error in dequeue selftest"). This forces
> the compiler to keep the accumulated value (preserving the CPU stress loo=
p)
> and avoids the build error.
>
> Fixes: cc07fae1de5d ("selftests/sched_ext: Add a test for ops.dequeue() o=
n remote local DSQ moves")
>
> Signed-off-by: Samuele Mariotti <smariotti@disroot.org>
> ---
>  tools/testing/selftests/sched_ext/dequeue_remote.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/sched_ext/dequeue_remote.c b/tools/t=
esting/selftests/sched_ext/dequeue_remote.c
> index f2c1901030de..af344581d5f1 100644
> --- a/tools/testing/selftests/sched_ext/dequeue_remote.c
> +++ b/tools/testing/selftests/sched_ext/dequeue_remote.c
> @@ -43,6 +43,7 @@ static void worker_fn(int id)
> =20
>  		for (j =3D 0; j < 20000 + id * 1000; j++)
>  			sum +=3D j;
> +		asm volatile("" : : "r"(sum));
>  		if (id & 1)
>  			usleep(100);
>  		else

LGTM, thank you Samuele!

Reviewed-by: Kuba Piecuch <jpiecuch@google.com>

