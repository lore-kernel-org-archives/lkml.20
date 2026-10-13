Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A727388E6F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881368; cv=pass; b=cc4743Nc0HSF2nKdZ5G+cGnhMZQC/wzHZBEKVVig93qu2p+KKJnq0blrZlH2e2e4w2V2/Rlm0qX1fAc198qcguiyeWPubQHBL1/cfxYnfUD/w4IKK7kuU86ByrAm3OFVHoHKlLyNEsVNgadIwOWnrZbDKAkXZErWIpnm6h+YT58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881368; c=relaxed/simple;
	bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQYmQjFjaGPB1QrFk4M21tD4iz8NQX/NGRmfQ7+a95aL9sU9406lhpGPSqQDTkuuTlSSVk+/otZevJ204sonQ12mq8Jkxct7ze2X1moz3oEfsupZ4NWHIqj+TnrMbphbvFjWWtLDgtKvJv9ZaAOyBuJn5h/U1BI9mDruu/NEMZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNV50YvU; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNV50YvU"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1138154a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791881367; cv=none;
        d=google.com; s=arc-20260327;
        b=B4lQwsQ9xC/U1+AEpMONaH22MualgbqYBhAE/l2DMrCfH61UuH7zXLITgaaWSAakC4
         d12KgH9Tn/pXhpHpCLIUy2BQGJK17uFCtM/L236jHzz8Yr5O+xjTBtvClc7jdT28hkRr
         9Ak2waWncEugtn7y8nEKVDWoFpn0+oy2moMKTNrYg+3CUMYKt/g5WEKNMTHs4AQHL/d+
         O7UkdlTSOYD9T88BSs3AyegmEVkwm9Q8fjxzxsvYBGtw1S70thjv0DhGvZMwKmy82sqa
         ti1XBOw+B5Ub45EhdsuyqJTqUxXO89Qhi/sObF7WTZAE2TpmVK+GtxqLDR4HyTrfEhbH
         2E/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
        fh=GTrB3SLXBkVN8l7CLR8nLU/CqfV1Ae6HTfzQbCRj3vk=;
        b=DFQxSO5wd7JXp1LrLkjCsFaBAh+O40ZQJ3UPlN2VAf7YRJRL0p2NyVEibAj5JtotLe
         SdRnsJ+GQWsZRYFeuvED1WAubfm1xWvygYNeNzJsDyeQpTAvRlzEGYV0WpMa7BnSjkfA
         53oQgryHJYCsKFtn8EqXtX9B61YC+o7X0QsAQWVD80x6KP9+slLni+u8IYR1iOjeipXj
         xkVeR4RJVubHfeCfjmbc7eqMMj4hlcx9zeRS3Y0X0oF+aNIjfOgNUjMNykIedcslIrdT
         KHSgI9b/yAeF7AJoprn2H95DO5RV8/1fz85Y6SRxMo2dIVwZtCdS3CwzP0zbUOmbeiXq
         6NLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881367; x=1792486167; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
        b=qNV50YvUT/Dl0P0XxnkzbcuOPlYIhaII64QkxnI4hwyKgPUtlMLzcCo/U1jFS56l5d
         PPL2A9SRDEgYJcPO8YP9p8PElSr6ZwYbqobWHhRK4JcoHDlU1wY9WE424e9BvQP8jxod
         2r7HIx/heI1Tqc6oGK1BzpNjKrptFKkq8Hyi7fh4Q9B5k9L9JrjYIKIiW8wkyWq5k4vm
         ZUXkxi09iIv6nP9zEO0Mn3hBdSTMEROH9Madyk95aj6O5KlgH/+2TC4OzbUWld7U2T1m
         naBT/Rbvk3pMJ50vMvWnmFLIHupgXGO8rw0ffcWNqVYLg78yFhW1orHjU8Rhugn0bnF7
         30Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881367; x=1792486167;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
        b=GoOe1MiK0XT4OcxzfpY8MTJuCJ58ANW2BGS0LdJbIq344uMNBjZ585oO4PA6OmdJ1P
         dk/gfJGcOxnUEIJMwozG3i/50KMsy5gtznHes04RWkRZ5uZiuBefS+2ui5FlpiEqKgaj
         nsOxSSW6VZZylq+GnlRl7YjqVsQMg3X5nS5xOufX6xrefs52R0Eldl8+yQ8B6dSfg/t5
         nLzx9WA1ejZcv5noyhj9DP5jaPlJka+J/pl1DCMkMsNKatOAPUQSh5uCPURdDDqg9GUH
         Gkgelqx24EvCnt/p5Es9kTSeN5Sn1F7g2H8GoWcq21RXfI/Cz3aS+RaQs9HySE07+ziz
         O3Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxYO5+5AJzHlMylMJEBgRblBxqKj2NrtZaA5VsGeXl6EeN3MbFeY/Mks9iIYQ0GCoUpi2Mto2Wm6ohM84E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbjWYZMy64PglztnHzkAA8Qqyxgte6JViwtx110ybR/rBbc3B+
	aMCdMRNZ+7zfI62/ZMwGH7b2bRwGN18SlJg7kDP8wBhI9Wfe2CtdATDZAvPNws5HHGTY7fzB0fQ
	L3dAjo6EQd6in9xVp8eFc6I+9Q4RHQM8=
X-Gm-Gg: AYBFou2RRuhNcmAeCdr1OpzbdGChY1zO7OjPXSn7YWm91l/6GGtieE9Mv6/jrNPhTCS
	OPHBHmj5StvVoK7/qM3zp5MKqXawwoLXKBYAKr0l8jNEUC+XgmViYQWZmXltKlXaAHNRiA39GmQ
	1gDJA8hAWf5Srneg3WD9f806kx8hHv69B7YsYEvYR7bpfd+tOjSW7wlxVQEjZANbO3m02uNxfBy
	XYYK0e7dGTU5vnyfKuF8WmiV4+BCCDQMezGhxHGuR4ft/t2hYky82ImrhWN0TffG4CGtwv3W0ku
	PSg5YOjV7QWP2y+SpxKUV1l6BqeGP9ovyWlYdLcmVpn7uAamzMi9q3Xk40cZA0fckh42GjOAO4I
	snnc2DKjz0MJ4cfo537XKi11BmoYDdg1ZVBx2uDT3yWsXbNZmoJ4Bai7H8lOdzqBQhCE=
X-Received: by 2002:a05:6a20:3d06:b0:3d1:39e9:b261 with SMTP id
 adf61e73a8af0-3e16b7aa7dcmr10821454637.0.1791881366815; Tue, 13 Oct 2026
 01:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009091059.25729-1-phucduc.bui@gmail.com> <20261013082441.GC199624@google.com>
In-Reply-To: <20261013082441.GC199624@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 15:49:13 +0700
X-Gm-Features: AclHuK8OWPyPTBv5w267K9ocnsdZsqZeERbiyZTzVq6qJslWRdmCxKS4n-cxkqI
Message-ID: <CAABR9nEgZZrEJ-HLUfN+8SEdRhbZ6Jc-ybYk3m96twB-npS5hA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: lm3532: Propagate enable GPIO errors
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

>
> Ideally we'd have the author review this - did you Cc them?
>

Yes, I Cc'd both authors listed in commit bc1b8492c764:
Dan Murphy and Jacek Anaszewski.

Best regards,
Phuc
