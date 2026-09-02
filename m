Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A17340407
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383356; cv=pass; b=uvfJlC3GM9VkDHviJuJqvyUfiEuJI1aeJDyCQilkowqFlo7pGRmx7VmMJXJVodg/zrz8krNMqMRYtsINiabzrOjaqi9qjEAXs5iyuKz7kE23L7fc0/O7hnQiisjIsKiR1n4jpduMUKIIHosb3hSbmTGdlEHHN5dvJ9EO71I0pAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383356; c=relaxed/simple;
	bh=6LAkCHWQ+Xh6b/xHtFhNwl5IQ0yXktFR8/LntIm839Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1h0MnwUMqHOrlyXyqi4om5oRZFKEvIZ/kRy0bo3A8q2M/1B9piWLIds6sh9jn62/AMaY0YZFE7KSAtdcpDj4FuZQmRUTYQp0mwUNDtG2lVRWBxk3c0S2572VLRp5yQ+t00CPmfB6fVG77DG/CI8xNAK+tK+uedd8UrQyTvUYbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBl4TCqs; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBl4TCqs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2570768a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788383353; cv=none;
        d=google.com; s=arc-20260327;
        b=Ci9R3KgM8f42/TYtWDpyGIx8re/vmcFMj1mmz1PyIF/H4FRUeWDZaV9OliTrz6OFWd
         v8owQG+84m9J36ygiaX4z8MBqkl53/HThKCa657qz+03vKrFkjrKCXTuXidmP4mEeCaq
         BjND/RKOkz8pyt4LEb+S3fdK7U5uA+L6tl9RNDTioLqs6SGvo+MEzNbDYEMLYKH/JVi/
         rgEbnHpqjJIHK7uU1JylKFH3iHkmPPqghdTNDHBTZ+2iTIJSpeeJsSZMWhaSLH32Biqg
         MVNbzPTheShhGAbassImwEwxPnWgBdl5m9Yzk1wgvLUGIlmQyuT/+CXUjQnGwGxseaWE
         RGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITS+WCs3MQ+DxFTvKg1KfeLAgxV5qMgoTbk5uHwFoBM=;
        fh=AK+1kZCCQN40640ZXQN08UGzRy9MUJEL1VSISB/dhcQ=;
        b=EWrOiOfPt+49OP3JHZD7/T6f00a/gSv2OtuPRX5KwyRO6qDWt7lxI529fOU+sFiZsA
         JDKBfgdOB6SX4q2XCrGRHcCFu96qBVgTOVL8LNA/tf0ljYts3u6acFjurNEOxeNjbeRr
         1vXwv4VM4XJQLF3+n2xL65JDk4YqGxP18k3QOntv9EOOoj2F401UIOPklhkhr/msFHfT
         PYZ/fQX+fX+bgS3EGkzEPhqMUsL0bQIvWznHzHwvLrUtXXAx22lI05m/0p4rpynay9G7
         OQKyL1PXjty3Y5judiDDDfhnCxPCD8hnCNFRx4KzEmBjGkIlNWJC8Y2xRmCbU6w2CgUr
         vESw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788383353; x=1788988153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITS+WCs3MQ+DxFTvKg1KfeLAgxV5qMgoTbk5uHwFoBM=;
        b=iBl4TCqsWtNlLuYkGp4RYBv1wcu+8ol6hSmA3mas7QmVEkztcygaUgW6gitn+zt0R/
         zV4lLIC1tGkdMrVm30eV2QTtx1aBu+7LSJ09k7Xf5pBIgcV5xXGiGLoa043bbytU7ZAW
         wXBVMNnNTDkT23ZNbcLli+yhEdZ1JasrywTo/DVwfG9CsI6TrNnNVBbVlMZuMCE6PRwn
         lLGhUBkBwhBKcAfLvckVr/V7DNfsKg9N4qj6YxfwCJA4hpPEif2QC/6A3n+Pzfhv6N/k
         7xtMjYUqnThEpcFTgSTCNs+qEk9ttOzhop97G9ve65l2zLk7QEFBNvS0bpYuOYMfNEVu
         Po6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788383353; x=1788988153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITS+WCs3MQ+DxFTvKg1KfeLAgxV5qMgoTbk5uHwFoBM=;
        b=rpols9eoxHmmfYjT88ukJvDuzXUHofTLTFIBSDB8yFfYvG7mp9ZYvLWu0H7kjMWUD4
         N8JBhebtMVbTiS7il9D4X0yYQi0/3gVpzgQXgmrm5bA/wY3tSN0gcA4CzTNaofrRpbHg
         ajC1K7IYC8bQZJhb/6T2zFAQ7Icq1GJtnhhgph436x3CVzKecmBGTnyBbYo1iV6pOikq
         z9k/8laImjJp+EWdP+/aPMBxhKAJL651X0NBE0Nd2ihAOjzt89voAuaTIfZ6333mczYO
         34hXndGHbY46MEGAdgvs5fwrGPZIv2MK43YomNQle2tIV8xkZM4kOGMurzIFej4/PSrv
         Zpuw==
X-Forwarded-Encrypted: i=1; AKwUvBz0IreuyiijmNVa9jyFITCo8y/txhZgbZ4plEKXjEQ5+Oiae8kxfjEyy5Bq+SQu954EGkZoyRIFNwGpM/E=@vger.kernel.org
X-Gm-Message-State: AFuF++n3Zev7M9Kzp0wGabtPSooLGZoCaiobyGnLrF6e2rAlzfRewfvA
	owNjBcbbcNB5EhNBDQcmogxaoU9x86EPAA6KYdWbme1aPiULM62hW/29Tm4+focfCDP8iHwEYSE
	E0G5XTn6L5UmW86cJiZZZsjcLFrg71J8=
X-Gm-Gg: AYBFou0X2shykqFTWpyXzAHKaMds2qwjbVfJZyRTomUy3tlmdxGxU/VVwEAoRaqS/zU
	cw1Hcq44WqAG95UI7bSc7/q3VWpD2jxfh+zQj/R8CirMkkgwf30VOMA8XnHny09T4LqXw98Xl8T
	Tb7sqdNOxLPGfGOVPYFLh+zlALcShiYYnVOpTnDU8G9dS6pppqKnLpKR3CsoqTqrNdNuN6qObeY
	1jZtBPTHtCAtMff4bbL0SY/SF1Y6RkkSNwz00XajlX/GIr96gQfkDr53PnoisxgNtBLRj75KUhz
	RyIxi3g0r3CS0YnCzVIOVTb4zusia43kD9IAiOJ6juJPGxxZi7bMaiiKgvj7xFvxSxG6JtJkN0v
	GhtjAC0+MQPFLAg2KueQI39Y9H4O/J9PO
X-Received: by 2002:a05:6402:52c9:b0:6a5:f203:ba4b with SMTP id
 4fb4d7f45d1cf-6a6832e4e4fmr5407484a12.16.1788383352594; Wed, 02 Sep 2026
 14:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <96d45353c7c29cc3aaa3234bd960f38d2ed8889f.1788277742.git.mattst88@gmail.com>
In-Reply-To: <96d45353c7c29cc3aaa3234bd960f38d2ed8889f.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 23:09:00 +0200
X-Gm-Features: AcwNN1Vnd5jJKP2ps-BJtZ3f17q-K909CEW1Vx1QOhe1D2REOQkwE3-6KhQqV3s
Message-ID: <CA+=Fv5Q_=BTtgA7Ypq4fE+cu+5Ui_BKAgC4cW38CR-Owqwtd_g@mail.gmail.com>
Subject: Re: [PATCH 16/24] alpha: select HAVE_GUP_FAST
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The lockless GUP fast path needs the architecture to distinguish PTEs
> with no struct page behind them and to keep page table pages alive while
> a walker holds no lock.  Alpha now has ARCH_HAS_PTE_SPECIAL, and it has
> selected MMU_GATHER_RCU_TABLE_FREE for a long time, so both requirements
> are met.
>
> PTEs are a single 64-bit word on Alpha, so the lockless reads that the
> generic walker performs cannot tear, and no arch-specific
> gup_fast_permitted() or ptep_get_lockless() is needed.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>


I tested this on an Alpha UP2000 with CONFIG_HAVE_GUP_FAST=3Dy,
CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy, and
CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy.

The in-tree gup_test completed the get_user_pages_fast() and
pin_user_pages_fast() benchmarks with both read-only and writable pins.
Each case ran ten iterations over a 16 MiB mapping, fetching 123 pages
per call.

All four cases completed with ioctl status 0 and no failures.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
