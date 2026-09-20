Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF23E9C18
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789892278; cv=pass; b=qfPE0yhMrugmhaKfaOO5s7G23EDhYAhnlh6KF5iCkjhDtJw2+sB8y3OFkE204JbTLcVTZi7Rt5WLKkWIc2GNRjn6bnQ7r3jRcwXYLmNvjYev67J6FoMfAdmRA9emVmrJZ2+iK3xFCLrQqPizd8qCr39AJt/k/NuKecDjp72T4Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789892278; c=relaxed/simple;
	bh=WYbMRPXl8tzSxOI6esJNtyz0qMAnN7XzmWLgxEoqUFM=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCTXBOZaNwm1mvLUxJ3ZyLFV0ZgLdy14t5u0jZh91CEyA2gpiCUfCLrOq1FRoTTHdta6X9/0Ec98ZByFW+HdWMJgVf/IIw8ejp+RzTwQv3IQIfEhkr07ZRvriV+KKi8sVqVVY6Xh8eiStaZLH/FUBptFHNXo2PYviprA1fRkK4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=dzphQpqM; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="dzphQpqM"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso3584316e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789892274; cv=none;
        d=google.com; s=arc-20260327;
        b=hPp9rG2zmZPTc0+QaM5h3sZAxT/j9wSrvnAZwJt9F1aKW1N6Op9MsZGdnGJKHf4p4J
         tRsHIaFeQRzkppF2OH3Mk+cFO0fyOXSRfLGDvLwNhcsvNGi8vtfYDAAR1SAbsPKHdojh
         y5c/ylWUdUnC9CaWSm2Ox150htETSLR6qeiL7EGwzZEiupc0cdpP1um04A773vSzX+/w
         Lc9sDmWTHosAMmahTjugFMQZaDAm7TS5hXoM0310b+/XDxyZzdVIDNocD3hw6ZFIxn1h
         DO0XftPSDsQ3SauFNQwwgmD6oKzCc8ly1fzUErVCTg7IvUcMc8J87/l+8m17jWhnogj/
         kXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=WYbMRPXl8tzSxOI6esJNtyz0qMAnN7XzmWLgxEoqUFM=;
        fh=gbEWDckVw13Td7CEgCWIRR7FU9JxWHOux4xMO5q2sNE=;
        b=iz4v8o3YdcAxaCUNReK+tQC39KxmtEN1wUu7KV7xBSRX/dMX/S2Gx6n2Z/VCOLjcBn
         aG4cDq8D9siO3hiuJs8IanhoZViQgaNLRaY07Aq7R5RHAcB468qBW2xLs0lhzB1Nuq9G
         MYr/5ABuCl7NHOlNgiA9Ufd9HXMpN/5km6jzlhbmDECc9dPCbGYpb0rMR4gTL4D8DvUW
         iMNztGK5he5XLrYS1UHT+ITPLdUyxElDQaMnTB677XBgWjgwBN0VtRRBzQOicuJLXOyE
         5v+gEXRVXBVxKh24dNGb2bDowOvY/6lIMybdtZYl4H16Db5ovNGsSpYrjMxpZY3hZEp6
         74zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789892274; x=1790497074; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYbMRPXl8tzSxOI6esJNtyz0qMAnN7XzmWLgxEoqUFM=;
        b=dzphQpqMM3l3FFpUr05OnohNhO3p696crH6+N1//a7NQ6nVCb0AUdfknTvn6oZNEDP
         lEi7GCBNnmr4/PaTA5ZLnoLvlhD/nAz0cIUJgXtSwhbFKt2aIJNtIehNDAAyRISVis/i
         nttJGeTfVqW/NSFAB+hALeKAJfzfcXDKhlacQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892274; x=1790497074;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WYbMRPXl8tzSxOI6esJNtyz0qMAnN7XzmWLgxEoqUFM=;
        b=fj82ZDOQpbCo7hfpk92XWfNNAXfpaQe32ipW4D+JNTpfotea5YNLV6FnqCE6OAyxnv
         yUMV9PNGnrMFSpHa2RAlDESXUwa9SX+T/Bbpx0oGVFhuTCy10b8dxwuWAwxp7Cusheg3
         HwqCUOeIVtqx1VNeXpOuGYN5u3SoIO7FDBXlDFFO6J2GmWpw91Xnw5VCIXmMDdr4cNun
         a90JeCXx7OMpn1GTeS/Vpl6wIYh1IMXcP3wrt74UOTg52gvVuA1B2CNCQs5iWmByyFAr
         Lw8bK1ASXFopinx+WUCSPhBIqnmz9AqbNwxMRms/WHnaPmPPRxhRTXNik88A6A1Ryj5Q
         6RmA==
X-Forwarded-Encrypted: i=1; AKwUvBzjTYJzpUUNI4Fgqs8zTHUQH3C2pMKOpnnE0j+dPHv7spSkFYwrkCMsZSvEK9/sjMMQyan+7q/uEsR/xyc=@vger.kernel.org
X-Gm-Message-State: AFuF++kxPiacbwi2VvtMp7U8DHrJPi3LY/evSp9CQIiNMjqWBCRkWZ1x
	5tEYbFPqoKDHrskb54PXiOdPcsNmnwlxkO5C440LKRrN7w81MlCNKwA7eudRHF9NxicG+t0gF8I
	gbwc+mkHQGvpVDuUhe4IFluj3IftYBn5hG/10DVN5Lw==
X-Gm-Gg: AYBFou2KABnyMuHd7GB65VL12i6BvzIKoL7iCqU01fkuXROEsQ4maeTyYCO9W0t90td
	Q/0SHmgYR0j3bS4cUNSdVSFT/wJ8ck+QeWOjGw1Qih+CshdvCUW+F/dyotPYiVL7Pf0q7zFASWu
	/PljZzfmgz7spKSwzqs1aHVr2ySW1F1Yvdd8JG3xrRXK53NVwnVIAxiSAcSL7WITSszQT5UTKc3
	YGF2P1bt5cM7Z3u99rK3zSLZko5kSdYe6tb523QbfPiOOU3VrVXQEuRycvWiFPcWcDYkhTn7UIs
	c7O+dczd1+Rhs29nnz5mYb5csrW2sOiBQcaU5zP+BmMhWCw043iQ
X-Received: by 2002:ac2:4e11:0:b0:5b6:183c:5ca1 with SMTP id
 2adb3069b0e04-5b8c195bff5mr2095691e87.63.1789892274506; Sun, 20 Sep 2026
 01:17:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 20 Sep 2026 03:17:53 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 20 Sep 2026 03:17:10 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sun, 20 Sep 2026 03:17:06 -0500
From: Kim Wooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <9b5c31541fc8430b9d4205dcdff9e76e@realtek.com>
References: <20260920-codex-rtl-rx-v3-submit-v3-0-883d11351963@khu.ac.kr>
 <20260920-codex-rtl-rx-v3-submit-v3-3-883d11351963@khu.ac.kr> <9b5c31541fc8430b9d4205dcdff9e76e@realtek.com>
Date: Sun, 20 Sep 2026 03:17:53 -0500
X-Gm-Features: AcwNN1VmswgGtvp5aGOT3uasAhXGdEW1BzQipYCZHO9YFjYbPQcISGcZH6olLpc
Message-ID: <CAH1Bc_yTizX4Cex+GRLeRUtaBdp8jEc2XEyawMzkQsZFpj1QGw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 3/3] wifi: rtl8xxxu: preserve RX requests
 across recoverable transfer errors
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

> 'retry' --> 'defer_schedule'?

Agreed, I will rename it to defer_schedule.

> Not prefer using bare system_wq.
> Can both use schedule_delayed_work()?

In v3, the error path uses queue_delayed_work(system_wq, ..., delay),
while normal completions use mod_delayed_work(system_wq, ..., 0).

I can replace the error-path call with schedule_delayed_work().
However, the normal-completion path is intended to bring an existing
delayed retry forward when the pending count exceeds the batching
threshold, which schedule_delayed_work(..., 0) cannot do because it
leaves an already pending timer unchanged.

Would it be OK to retain mod_delayed_work() for normal completions,
changing its queue argument to system_percpu_wq?

With that change, schedule_delayed_work() would select system_percpu_wq
internally, and mod_delayed_work() would use the same queue explicitly.

> nit: a blank line

I will add it before the switch.

Thanks,
Kim Wooseok
