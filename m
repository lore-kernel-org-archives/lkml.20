Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA336308E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562182; cv=pass; b=sfOAj8JXk9rMua42uLHNYODtr2A4E5NEVa+l7O/yDJEDTkjJbH/5iKCdivnl0E10G1LD+6m1mCJIbeW/8Nf+36WNqr40TCQJFgEA9L69T9Fc22ZnVZEXlx4vBVGr7TBdo+iVV+Z6NKRz5x1a4qpTdfq94WENaUX6Y6IxfBpGHc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562182; c=relaxed/simple;
	bh=KydG5d3vxA3VUShHN1s7hA9UZcxf1OVCVtdhQV/rMSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJUU81pne3hYEjAoWZG8C2a5maXR1NDd5PpdxwwkVKmiGqdicn+Zuw2+z93OlhvtoqM0SUg3ygwcfhPasrOL0OrFLdbRXCnkOOOudIpiriEHGpwY4f4n3NXv93hjpa63RmdMmrKpl7Yj5+hg4ep2+biqisxh62Ytvpdidqat/A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Enkng8ii; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Enkng8ii"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a9bcdf29a6so66431fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791562178; cv=none;
        d=google.com; s=arc-20260327;
        b=SPgIdEDuoiXV3h6EKgJN7Ex51zkqOgpSNJ3k6A1PG0S4U9RKNiyxRpHeIF72yOzkAn
         IRQTCtMZJRe18dYDNfqiFDcJNlpnGbNcjOiC09ysVAD7/rJmmBW8+9huQJh2Vgh4lu8j
         8zbj1w9DUZDxQbeJkDbyaXqJ9srZ/vExCOluIgkQi0wSqJww2SE7bjh1y+vaT7hCJzEg
         0uTxP4+1bZ5Y7wXur6RHsmGhjD6BOqexUG3rMdBNPoEK7HVC3neSTluOtKX79KOjWMD2
         bjGnV6KZfSI7CfByBxBtf2F66mUBVO3dOT7EdeGHo+ViV3rNbbiKji29VI41dGQ7RJ1C
         0y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gRdACjVvFL05i1wuINmk6qUnoFNzpddNkZG/YMMMyCI=;
        fh=m/BTrwDSS4UWWNqT8rs/W3DcKy8oAv3zGGXvGnA6h28=;
        b=EDXqiyPk5Mss68tgzlKxPfTJ6GvDhbFSroel7nlz1Pgr/hY0K/yl22l8+BFU7ye8Ho
         uM00mQ9g8H4cALONCEJl9gGPWCIXR8IEC5XqXptjvD3hk5/dCMhOXG5q7WIHZjP9DZyg
         g7ZSjKIgFpSBHa7tdKCaZ8RPJNl5REcN1CRn2lRoVSojKUlWwllf3K+KkbiAtkf40r5Q
         v17Mi2JMnrHZf9GZP0IqCzBZCg4u/8KgSFXSuhT0ZVAAmm1UzIFw2ozhgPKiNR7VaYiT
         I09/QPxXsqUY6uqk/i0dy2PYAK4BYrJ3vQqjKVqJ/NXhYv2XxgvcPkCXgKX4FepIAZFk
         Rrww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562178; x=1792166978; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRdACjVvFL05i1wuINmk6qUnoFNzpddNkZG/YMMMyCI=;
        b=Enkng8iib/1wECRtEdH7mafJ1xNIMrHxkhV8JpOjj7rcezr3mpg8oM6TJkH2rpFQMq
         4J4B6QYZL1yOTudQUBHC0s+gLDOCnkouTwdIxghBTkq2it39djPcBZvxq/LDybpV+r2W
         XQH7sH+rRmz/LizRFLV5dGtgqZ9ZBzY4L5gyRFtfQhEnewvcf7vqPTjTTsNLnevbAF3Z
         7NCBbhNN8Vn3g9f52ABJIu0daa60jXFvowNgIQBMR6REuh47THaeRLoq+rfIA2U4BspE
         7wMtGJAtHB/nPg0EfrXUwwmBctfiw+dFM7I2lgxWdZG4u/30S6m7NWeMEduWG8q1bQvG
         9aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562178; x=1792166978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gRdACjVvFL05i1wuINmk6qUnoFNzpddNkZG/YMMMyCI=;
        b=zIYshT0/6jkazl6UcYJqh6kNjDVIetlopUuXvKm+odZcKrNzvyKp152eNSFhZNyptR
         BOGeFIFSOGbQJ0YWloL7VESc0hWGCno5QCZLh9okxkXIan5lUaeAKn4co7z+jfTAS0t5
         /XPoxzXER+yGRz6OC7PiN2oob4Qh2pGtwYadnZXi+2wLNyQiQuLqq6pSNtrYAf1Vf4GW
         Rho/LCNm/isXG6/tI8dax8I1IXFF5+I/egj/a/gcx1rq7pfcJnnchb0b8luaTF1umzHb
         JyeryF0k0lrlEmWn1JPNG697mkRpUDchU/FnPmtNVxU3Tp7ZmUfQMYUyXfJw3ktRW7L5
         sLVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUceBXym2U3Fp3w+xWyJfeclysMadtwtuKjfqBpn5F3xHaiIXBsUZgZYox1qG0VTX8rRYw0dVVNi8xIw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfmVu64sO2fEKSoNZvAEp+e8ebp9VlefNJhQo3qWpWoO2ZTitW
	hyURVhUJICaeN4I83ee4fb2ALrykKA0AkMQXYRUbopzkKq11gtnPfNJiOWp9mOESCTI4iBzBkWc
	J3FPq9lgvpd5vcIgmM2Kr52SdlaQ5pnP2pQ==
X-Gm-Gg: AYBFou34NdII88aj10BOuCQZXo4+Fo9ISN1ha1uKZ+rf0K/D18dGcog4xU2qBDd3GTA
	xyff/mowY1JdYxeMCf3AdjsATrk0z5z1rRYEmh/P4C/IqsfIlEhWq4LXatPvkhDxz0j+DOmDoIp
	0+hlI94BBU+X0A3m98p3iZwAoaGy1ZfyVb/cJFqyQafcfZna+XBA3MKeWoBq5n+0Qe3qA45tWTz
	GzToc9FoH1BYcY7ag+g21OHxxWl9lHbjdde0sDc2vGma+q9hacJxdG95kgzN3+GOG+IgDbQEUG1
	+CG2eHN9/Wdt+oa9slvLBudZlAA6cX+mLrE9+NYUsOLIMmf7hEiYRM0wL8FOti7ckZatXN2Fzjk
	4iJYXngmOtgiRE5UhH0rJlbxhsOxFb73ufv8y+qnEyudc6A==
X-Received: by 2002:a05:651c:3251:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3a9c539d80dmr6025531fa.28.1791562177855; Fri, 09 Oct 2026
 09:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANGjgdnO3HXAxA33cT_rv=on6Qwyf95jgicj6cZKA86Q6tv0Sg@mail.gmail.com>
In-Reply-To: <CANGjgdnO3HXAxA33cT_rv=on6Qwyf95jgicj6cZKA86Q6tv0Sg@mail.gmail.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sat, 10 Oct 2026 00:09:25 +0800
X-Gm-Features: AclHuK88wasHb4adoc5pXDnvTuPod4Oua9y9hXYO0WUqnkU2YRD2jeL5DWhWa2c
Message-ID: <CANGjgdmmH6SypmZCXHKv_7pDWRPGRnPdT9-opAc+34uqUB8r_Q@mail.gmail.com>
Subject: Re: [RFC] sched/fair: avoid redundant updates for unchanged default slices
To: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000037bb34065d6a9310"

--00000000000037bb34065d6a9310
Content-Type: text/plain; charset="UTF-8"

Hi,

The inline patch in my previous message lost its tab indentation when
sent. I have attached the original patch to preserve the formatting. It
passes git apply --check against v7.2.

The code and test results are unchanged. Sorry for the formatting issue.

Thanks,
Chengfeng

--00000000000037bb34065d6a9310
Content-Type: text/x-patch; charset="US-ASCII"; name="default-slice-noop-v3.patch"
Content-Disposition: attachment; filename="default-slice-noop-v3.patch"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

ZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hlZC9zeXNjYWxscy5jIGIva2VybmVsL3NjaGVkL3N5c2Nh
bGxzLmMKLS0tIGEva2VybmVsL3NjaGVkL3N5c2NhbGxzLmMKKysrIGIva2VybmVsL3NjaGVkL3N5
c2NhbGxzLmMKQEAgLTQ5MSw2ICs0OTEsMzkgQEAgcmVxX3ByaXY6CiAJcmV0dXJuIDA7CiB9CiAK
K3N0YXRpYyBib29sIGZhaXJfcGFyYW1zX2NoYW5nZWQoc3RydWN0IHRhc2tfc3RydWN0ICpwLAor
CQkJCWNvbnN0IHN0cnVjdCBzY2hlZF9hdHRyICphdHRyKQoreworCWlmIChhdHRyLT5zY2hlZF9u
aWNlICE9IHRhc2tfbmljZShwKSkKKwkJcmV0dXJuIHRydWU7CisKKwlpZiAoYXR0ci0+c2NoZWRf
cnVudGltZSA9PSBwLT5zZS5zbGljZSkKKwkJcmV0dXJuIGZhbHNlOworCisJLyogUHJlc2VydmUg
dGhlIGV4aXN0aW5nIHBhdGggZm9yIFBJLWJvb3N0ZWQgYW5kIHNjaGVkX2V4dCB0YXNrcy4gKi8K
KwlpZiAocC0+c2NoZWRfY2xhc3MgIT0gJmZhaXJfc2NoZWRfY2xhc3MpCisJCXJldHVybiB0cnVl
OworCisjaWZkZWYgQ09ORklHX1VDTEFNUF9UQVNLCisJLyoKKwkgKiBVbmNoYW5nZWQgZmFpciBw
YXJhbWV0ZXJzIGNhbiBzdGlsbCByZXF1aXJlIGFuIGltcGxpY2l0IGNsYW1wIHJlc2V0LAorCSAq
IGZvciBleGFtcGxlIGFmdGVyIGEgdGFzayB3YXMgUEktYm9vc3RlZCBpbnRvIHRoZSBSVCBjbGFz
cy4KKwkgKi8KKwlpZiAoKCFwLT51Y2xhbXBfcmVxW1VDTEFNUF9NSU5dLnVzZXJfZGVmaW5lZCAm
JgorCSAgICAgcC0+dWNsYW1wX3JlcVtVQ0xBTVBfTUlOXS52YWx1ZSAhPSB1Y2xhbXBfbm9uZShV
Q0xBTVBfTUlOKSkgfHwKKwkgICAgKCFwLT51Y2xhbXBfcmVxW1VDTEFNUF9NQVhdLnVzZXJfZGVm
aW5lZCAmJgorCSAgICAgcC0+dWNsYW1wX3JlcVtVQ0xBTVBfTUFYXS52YWx1ZSAhPSB1Y2xhbXBf
bm9uZShVQ0xBTVBfTUFYKSkpCisJCXJldHVybiB0cnVlOworI2VuZGlmCisKKwkvKgorCSAqIEEg
emVybyBydW50aW1lIHJlcXVlc3RzIHRoZSBkZWZhdWx0IHNsaWNlLCB3aGVyZWFzIHNlLnNsaWNl
IHN0b3JlcworCSAqIGl0cyBhY3R1YWwgZHVyYXRpb24uIEtlZXAgdGhlIHVwZGF0ZSBpZiB0aGUg
bW9kZSBvciBkZWZhdWx0IGNoYW5nZWQuCisJICovCisJcmV0dXJuIGF0dHItPnNjaGVkX3J1bnRp
bWUgfHwgcC0+c2UuY3VzdG9tX3NsaWNlIHx8CisJCXAtPnNlLnNsaWNlICE9IFJFQURfT05DRShz
eXNjdGxfc2NoZWRfYmFzZV9zbGljZSk7Cit9CisKIGludCBfX3NjaGVkX3NldHNjaGVkdWxlcihz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnAsCiAJCQkgY29uc3Qgc3RydWN0IHNjaGVkX2F0dHIgKmF0dHIs
CiAJCQkgYm9vbCB1c2VyLCBib29sIHBpKQpAQCAtNTg4LDkgKzYyMSw3IEBAIHJlY2hlY2s6CiAJ
ICogYnV0IHN0b3JlIGEgcG9zc2libGUgbW9kaWZpY2F0aW9uIG9mIHJlc2V0X29uX2ZvcmsuCiAJ
ICovCiAJaWYgKHVubGlrZWx5KHBvbGljeSA9PSBwLT5wb2xpY3kpKSB7Ci0JCWlmIChmYWlyX3Bv
bGljeShwb2xpY3kpICYmCi0JCSAgICAoYXR0ci0+c2NoZWRfbmljZSAhPSB0YXNrX25pY2UocCkg
fHwKLQkJICAgICAoYXR0ci0+c2NoZWRfcnVudGltZSAhPSBwLT5zZS5zbGljZSkpKQorCQlpZiAo
ZmFpcl9wb2xpY3kocG9saWN5KSAmJiBmYWlyX3BhcmFtc19jaGFuZ2VkKHAsIGF0dHIpKQogCQkJ
Z290byBjaGFuZ2U7CiAJCWlmIChydF9wb2xpY3kocG9saWN5KSAmJiBhdHRyLT5zY2hlZF9wcmlv
cml0eSAhPSBwLT5ydF9wcmlvcml0eSkKIAkJCWdvdG8gY2hhbmdlOwo=
--00000000000037bb34065d6a9310--
