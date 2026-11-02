Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793640114;
	b=L4aOrvkw7wy7qVWupWJOj2+ZH7NuOEKOOlVQbJSKV8hKYtAMD6Z/5MgYLxgzw4hGkZIp
	 O78T8xUh15VRGQvG3sAy6X5OGAqsZWapQmmDZko6SJ42m5E6O0CtbXbB8+gPuEL3+Hn/W
	 rDNajs4vmKNJ9tOs88jdc6+X7oEwFhfemZK6o3t6ASg2TsSzD1oPPTr/A+9ttnbKOLtmK
	 wRZABoG8rnuSznnzFvnOkO3BXy6wObSxj380HYgryRYSdF8HnhrcBvE9DuBoZb5tYqAQ1
	 K5x/UHq6mPYUZRPW17l9fT8Kkijivtkdi7UN7EBeXzSB1797wimgzliwkZ/aSNAACBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
	b=LwdNkCmdhORDnhYpgT5t1kl/U+H0uVs7+a+VKOPltUpRX4MyF5/3zG8f4ffUPdXijQdd
	 GoDQvbaOnp5ebKDz6VZu2EntS0QO2sW8MtkJ2rsZbhO32sQ+ZjPlzQR1h/bK4Aof+p6L0
	 xnL3l8XE7Qh2SW3jArpuDnjKetPC1G06/zwxn413cqjrdBnKYVRhdbjpXNgB0Veori8Yq
	 9W95FSQyCsJxeFtcu481ifekDuybjVDOZBqfu+ri0WvJZVNbDNMvjzgNZrwN01avb42VC
	 yUi4ymqGW6i4Nm/54iI8LIoenvho8iBQ+JJ3veoTzZhwoIcsHEB1k0nnBACJa7ttnOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KACIx996;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B5606BA52
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7B5606BA52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KACIx996
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533202fe429so566981cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640108; cv=none;
        d=google.com; s=arc-20260327;
        b=bMoOxjJrwopPke2e6QskCnc6O74OXB6+qYlUaYLUBd2E6e/2cyg4saRxCLmM9Lxy/e
         A9l7LBgsOs2iEhHXhIrJiULRJuI/ea8quwhn30k0F5e7TEI7G/Hxy+XFwQA6cLyXSQNC
         XOt25vSAzgWDLFwgSpNdq2CN2b61eHEpMbPrKL/zeH04g2+WqFPPoPXwQMYCBXP0tw7Q
         R91AOJqWXW0BvP4jbarhRDlcOYkmOGipNKGsNKU0t88EklZXLLgaLv/pADwYekMF3pZ4
         vFCdL3wSTO643d1f5PcIi5UrX+HuFo7IAunMZjSaOgiq8/EFgywJhkFI35SN1kUJjcow
         RPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
        fh=2d8aY9E8kheDNSmyU12Ya4v5P12w3O3H35Uf7RV1tEE=;
        b=KV+ac4u/HKWZB38XmP8R51i5JHNA/YCOIHzycc4RYKdrEhW2Dg1bOGpymQJq4SxnjA
         3XIRn1cMWcE0k7/IM2XbBTIKnkJwEabCqFWfW7OudtqVChPCr1N2EAO7ghXiD6o4U2co
         bdAad/Uf8eakJTrWf3N9ncdbry9+AD3oOW368vqWVBBDxY4lQGspkrwRHXGSQ7nKp3k6
         DTRT3FAuwnIVCxbZ59LBF3huDA88zTEGCRU39LiAJY5eZ54pYmbRKJFQ3V6BkoOPkcY+
         9x0OuZtpKcMnXprCiVn4XqPAhKQT5w6ISIPw/tSApcQdw7i4pVWsK6u10EU7lCOPQT0j
         G7IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793640108; x=1794244908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
        b=KACIx9963F7+4FOg5xffkZ8NHTpNRv1DH18778aING8dHlF7JmravQUnFuOQrCOGtA
         ansdFCifjPZdeWuiwqOwpUhKyXG4vO8suKigpWw/jXjtxhzX5LEAREdeUKufJKQhgdQ8
         RvF0jQh8zu2V1euX9OMU1FwyeZ3dmtUfsixesLgRkN48nBLrnw8kRmAt3oxtmhTSrMF9
         BG5uPRpNO9wA6YT60v13yXT2UvwtdE8NxO815H3KN5tM/cEscAjd8pD+fGC1BTAHHJ9R
         aeOnfJ4Tbog0ybixpVaiPVqofTYisoxsTrBwnwD5pXXkLuXVSvJEcpLlHhu5xuu522pf
         l0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640108; x=1794244908;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
        b=ZdnvB3mC2dTDDMEjuPN9QObn6jD84vIkSJiapYx/m5/8bRxwayS/LalyW75lAZ4TkY
         1c1nxCh8ElsqWMhlETQKk5ZobqcOIV85ko48uK/vPF0OeXjzDVjOuv/2n6mu3PeRPM7R
         dQht6S8osbOhnD5u6BRAPonEMxNQuB9RNVfqbPrUxix0L7LFkF/9ZTh+BnDlxSW2IB89
         lMZwPouvUTTqrZCdoSS59BuhtOhUxXBy35RMeZbMsDjon9WXt8H5zIfnUPpt4r4LzWSy
         5RrZSB5t5MPfJxvK6wDpU6is3letWEZrH/exbZ0PcjJeDp8HWqeXJO7J/tEMl4k7386h
         In/g==
X-Forwarded-Encrypted: i=1; AKwUvByB5pA06ugb96Enva8WEsGUFDk4nTKI2E9xYYD2+1eC9ztRtiqps+YlRx4XXhg9bUE7dRg0UvDWkOpXT14=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z3tVW896QIa4zqheLp4jVgfFBwHnSYoyuiHx+NvfrruPQP+ul
	Bu2Sa/ZEmTCDlzKRjDT5f1CztJObVYpje2TEKUYny2eBTCRUpM48sjOLnOtwBAo9rRF7YZ0r+0E
	+7SBpeOgNsYW4wrTJNJZ7akVVQtZUqVQUu0z518Iz
X-Gm-Gg: AYBFou0pxdTFwBI6/sO3w15R6WlkoJU6qKpzXPx4TSGBfsWM8+BpYsYKcSesC0eblMO
	TWP0nUi2oW24IhJdg6BW1UUFxr0v182qyE42IoNn4qgqde3vdY0KXhVBCsU8uqrhKVdFAKC/q8l
	sbapo3LpAW1LEV8CQOO+W5+T5CD9pgupOku+diMXhLE+fuCWTeEthM5+/mEiuprkGnvIPidaAAF
	zKhm5Ik33JEvDxodi90z1FuKERQxB33STECg5RXQQHY8g9QzfXucpTWlMLgOm4cKwU/zWec3E7Y
	QAWyde5BcogGAODAOoOXHJYQq/wnnBIoyxYIOPhCwRdsso/7K1YMSgVFml8JfyS1cQOvZV/9yZh
	G83hqCOTM9ItMrlL6Aaec64SgDNmp08oHuXo6
X-Received: by 2002:a05:622a:c01:b0:536:78de:775f with SMTP id
 d75a77b69052e-5414eed1434mr90915071cf.15.1793640107803; Mon, 02 Nov 2026
 09:21:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
 <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com>
 <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org>
 <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
 <CAJuCfpGwZqGkOm25=BWAh2QgA8Y00OUmwxsDU+_qOsVsc+KHhg@mail.gmail.com> <20261102090125.58a2e80d1669c681c33ed20b@linux-foundation.org>
In-Reply-To: <20261102090125.58a2e80d1669c681c33ed20b@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 09:21:35 -0800
X-Gm-Features: AclHuK-DjqV142Ud10paqFStz21PGZUYRyNelFGZhjzHwoB2M_64kIh8h-R_AJQ
Message-ID: <CAJuCfpGvLt+QDw+n0QnZmBqryMrX+SRZJUTqFhVNR-EXpXBRpg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 9:01=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 2 Nov 2026 08:15:47 -0800 Suren Baghdasaryan <surenb@google.com> =
wrote:
>
> > > Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
> > > complete fix looks fine. Perhaps we should mention this pre-ARMv6 CPU
> > > detail in the changelog of your fix to explain why READ_IMPLIES_EXEC
> > > is important here?
> >
> > I guess I have to ask whether you want to post your fix as a followup
> > to mine or if I should fold them into one patch and post a v3. What's
> > your preference?
>
> yes, please just prepare a v3.  I don't think bot will be offended.

Ok, I'll wait a day for others to take a look and will post v3.
Thanks!
