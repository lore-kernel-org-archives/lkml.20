Received: from mail-lr2-f30.google.com (mail-lr2-f30.google.com [74.125.230.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4988E47276E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592560; cv=none; b=bI3VU+SvTyG5xzobjPW/2naLXK7RoKeMVvk8pRfAG9ltitV1U//ofWTLSDb4sjSZfZNJMQdg8ip+2kIyQLOv9KeAPlwB7bgdavXvr94H34bngHE6f/LF7jfyZigKOAHZiyfqbMFZKYGQZe7VOLWQ8FA0XTiQHBi2Zz+9JDp5SxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592560; c=relaxed/simple;
	bh=koETFQfjHFNpObPm+a3iwcMgfX+tKG8jegzJvsvQFnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/ACQWeDriMZn6tZPOVhHhSUYUJk5Lm6pemBLN6czpdKDY1iD4pHL80qi2nu75fSXRmSwraTDbXZL1CbkxasPoaif1oGBlpCrNUX8ZDhw+JZW83UXlPPfMd9xE/KmvBoZqAvInEZ/Vks+SfJrJj6r9ZLM2S8bIgEP742mTSU4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8p8cGfC; arc=none smtp.client-ip=74.125.230.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8p8cGfC"
Received: by mail-lr2-f30.google.com with SMTP id 38308e7fff4ca-3a318299b38so1999331fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592546; x=1790197346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qlLYXZqY4ht5qui+jz/p5YTH6iOKiAioS4FKUxhszs=;
        b=B8p8cGfCldas2anB/fuM0UdJh4PckzprEqpsw+FXf0xs7+xV76PH+gNLxihMewKdTS
         w37n+EwLKv5tDXV2ol+iGvHIZQCBKBKfEIH7FCwe2/zBMdvcOvraibkFn0iKJY/HKFSG
         xyBLc6ctonmH6ixWy77k3cuYwc+pTkYD0OhNc0kzwV0mcPOEmzZeFmqMeoQD9fr2BV3c
         1K1TdWG0gxMH11GcrR4d/e4vJiebwPNx89qTR4T6C4L67W5OMopOgRDFbbRnPFgIL+5b
         GV4EshpFZqRXCyX4rZPR75aFnPUP0/NW3P2LrFFvGPKF5RVaD6tZw9CtjUd5JungkK5J
         lM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592546; x=1790197346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qlLYXZqY4ht5qui+jz/p5YTH6iOKiAioS4FKUxhszs=;
        b=PI8uKFJDzKTf5ZDAiFmJ+utoUQSD45tYtf5IzKK2eRRW6gV45LEssJs/SYz9iFmmYT
         C0LhH/tj02nO3IuM0kY3LTfGryytvGt6aQLnupER1TD13vPgOeRRDDsWY2CMuNTAZJ2d
         zL4qN7F5/1UvlWqdh81CjZ33laWMb7VHDsAWRLLkUX050Vvh/EdEfN/uCzbYqiX/hSzg
         q5+o7d48Iu1f2LHfbu18j6am7obxay7S8EJNDRx4LxVwbbNWxqdd4eWIAGysXgAHFf9i
         7GSZr26Fcqk4Md44Fyx1umlzO44ceQMMY5D/TbX+io1iyHJG1rTkpWiPHm15bpEEA9ip
         +5CA==
X-Forwarded-Encrypted: i=1; AKwUvBwo7JJclpipROo+mG6jSehyADOzZse7NEl2oJCOOhytyI9DVuXEA+ZMi2hlHhOGy+DEZsRhXcnstJD/r/U=@vger.kernel.org
X-Gm-Message-State: AFuF++kHXMCUjoV924mE4683/Zv0loNeA9g0LihGJ+10uNfGe1zsVCuE
	S/nfC55/zXHLI7FodFLAsdk4OOlDbbTwS/cZ07HkeM/zobi8cZUnM8CH
X-Gm-Gg: AYBFou2vUAE9I+hQHhHG82G/AFnGX12Wjo0+mhT0HCGNiNEfW3k/owOjUOiQFT/sfeo
	XVuscG2Ep7WVeNsvZP7aru/xykM12jS8mWS3mncR63OToa7as1eWPzAwHbJp1z3F7LG+SJFqsQh
	2Zvk8DRlfNoFaYpQFdZIGG36sQ9n5oQpbLUManaAWLRhdvpedI2+kEb+I1WL3CDDeWWqCOHseMh
	i4aK4O646nww6FgOep6+MXDpNUv33Ow5q6ZcaljgbAX21Z817jyI7LMGLdUdCCYvrhcRdjMAolB
	6fikc2qj3+fNKjWbELIShQ1gakPX9TaIqYSw54GTqlC5eME0M2Qw0dzMlIudOwCLba2SZNNaVQI
	kc9PgaQB2GfSpTd7Lyb++LV1Ijs6o0Tdt34BGnAFt5L/cs80gq9wtW4qMy3ZpfBlZrUU8rfd9Mj
	nJlWAiJsb1r1CwSYSxPAOp9QyAm1vJMqsjAvcaLGwlSJvmYJWhCfiwdzom7B5/7OQreuywwX6AC
	8FVBeXMYhrgZJU58+x5tEi74hnVQYa7LMB3slCKa9890DAbardfyNo9JooLGF/38MVEHw==
X-Received: by 2002:a05:6512:2c97:b0:5b6:1a7c:59e7 with SMTP id 2adb3069b0e04-5b8b665ea83mr1028346e87.65.1789592545994;
        Wed, 16 Sep 2026 14:02:25 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e7f2fsm1175758e87.76.2026.09.16.14.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:02:24 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/6] iio: pressure: dps310: add hardware FIFO support
Date: Thu, 17 Sep 2026 00:02:23 +0300
Message-ID: <20260916210223.15456-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910033636.3a2ed151@jic23-hlaptop>
References: <20260824201203.396651-6-zoone.rupert@gmail.com> <178813888151.2788519.16547013180884814648.b4-review@b4> <20260906094622.433243-1-zoone.rupert@gmail.com> <20260910033636.3a2ed151@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 03:36:36 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Maybe we just set the minimum allowed watermark to something that
> in practice always has a temperature (or almost does)? It's kind
> of true that a watermark below that doesn't work because we end
> up dropping data.

Two temperature entries are prs_rate / tmp_rate pressure entries apart, so
a batch needs one more than that before it is sure of catching one. The
FIFO holds 32, so there is no such watermark once the ratio reaches 32.
That is six of the 64 rate pairs, and one of them is pressure 32 Hz with
temperature 1 Hz, the case that found this, which would want 33.

So I will hold them locally instead, which is what you asked for first. The
drain timer runs at half the fill time, so nothing overflows while the
driver waits, and the hold lasts only until the first temperature of the
session, bounded by the rate ratio at 128 entries. The first push still
waits for that temperature, but only once per enable, and no pressure entry
is dropped. I will re-run the zero output regression against it.

> Validity flag in the data we push to userspace?  That never works because
> we don't have a universal encoding for one.

I meant driver state, not a channel. Moot now.

Rupesh
