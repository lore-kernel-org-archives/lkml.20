Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793592432;
	b=ruqMbvYP7LZtRQBRdKXPkH3yT2Fl+erCJ9NkAfRVLEKJgoE2t3LWjC0TVnJj8KefT6kI
	 DhkvAofIWQjykEtJCR0AgW9aOX6yBL3zHBxo9V1B12ZwXNlSdbDFvggTTxw8e8jbeGvDA
	 J4eLuH7q4+UHuKMu1D0K49/IPguRCOybz4dE3t44RU73pHxwJLU0W/wrBfgl6gDXZDx41
	 gm1SSI7CfYht7jW2WIGeLdZpukzZlrjKIviygEAQ35k4MTkMXB4t31kdh6OO16decdQSh
	 YZ9y3cwSTYQJNCDssjUWbTR8wmuEpa07zZitGjUYMsfbsM1bSGskppVyNGlT+M2gYeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
	b=XiDAMfWuzGH3+goURJ6LshdBTkniYDl+M8plVQiBaRJ2rqIZV88oGCXwsFOTtjKievWq
	 YxWf4W5abF8fySFPSkJ9u30JKCFntqBbq9tpEAKulD8nSUwFDDDNeDcvUASdWCp5AMg8M
	 0I5UMMQcQPmcuFYYeRa1DWK4pNk/KYrF/+kjGiyItrRQT+pp8A3AZijLfCkPoJc9kT6kw
	 4RlqhwsMpqF9lkH1XImfUgarraDmYHgOE9v3JKeb8ZOcql9Q0SRDwrWx7Q9hUDJJmhXWu
	 WnLqgjmuvmMYMWQG1SMrua38h6TPmAafJ3Jlz+0y/f734u3wLU6sRZJAamowXeF8wBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/PQaWUL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FA1606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7FA1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/PQaWUL
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so1765686a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793592431; cv=none;
        d=google.com; s=arc-20260327;
        b=Sbqj7vNmjB9mHfO0oXhY2qyVoDlPvRQBUL2VMFOCTXmAfdD5HbVJeJNr3h22uT+ZhM
         s0z5F5vZcUhE+1ATNPm1VUDaqGQXDuEFAtwB9bfe08lInC+/iMak1K0wil07jYF2XoN0
         YUfrR0t6fUvoN2VPAc5CsUDdP/8rgKiEx2hyuyteUXs2uYJBlwXqCEHyQDHAg2qV4i9O
         8Yscg621Sq7l+V78JGOXgQp+ZGIhbnLzlJHKt3zVwe6xi8apdDS2lRSnMgzZ3uQAQtdq
         0X74gxIZSDfopNcsIoTbD8ALe45RRtoVNN/RgLi8NI+tnSWTi0iEUakvLQpjsEdpzzDc
         2lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        fh=vXdryZ2nzKqphkpUDQGqEPRMXkAFTQSm9WxLR4mmIBU=;
        b=eQzyYuvieRzbyBXiUaQkFyBWJocirrsQMqhwQM+mQcPOzbXZKw3wWUNpHOCsLEQ/vt
         UqzUPsoNfRv0XbCRd4Br9keu3G2XXpsRYvSMnaTRjfqtZmNWIGOEgh7b5qgLhfrWl3WL
         OZjVTENM6VsWn0PQWcVv9o7XDOIchqDnItKl99RM+D7pCsBm19Cu7K0hf4VsgG2TYyiK
         CmZfgAopjObfmj5xlj+gtITQK5APN6LLHZxN+B47ckKEzI5t3PXqczpD2YMXa/uyj7/w
         rs9/11ouWSgpgzvyK2DAa1aP/1OFDo6BCrVL8BAaVb830zwgRD95RkB4SaC/q1E2Nts+
         VuYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592431; x=1794197231; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        b=n/PQaWULTTcvCt4vkoQZcj7h/RsyFJGemB/065ZoKLOp1IHgZSSH8tHEqmfJMdAaCS
         /Os3PUXS3WDwSIcpHGhDi+hCJykQZXiEZE1ZJ4+rjJwzWDWmawvAhywNpf/TcBl4wJeY
         VFzMDLNM7whSos20IKuaNcNS0E4pV48GzqbbBXwrpEtT0dunvxPVXymyWl0sGMMU/2PM
         FU6gIEz6zJWC3VDq/N1DwNfWa+dfsg+i2GolIS8JwO9L/gh2chtTNpA7LKs/oZzRMXc1
         8koHBh48/e/u5J0Ye0zWEF+vVBdGmiHlg1lG0jaf1Yy9qX6To/tgidTuJsYbaKfrZ9i9
         Qhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592431; x=1794197231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        b=jevAU7VehMluRdV4rPtiIp43gmFfi4Un2N91bLYP/hHEEcjIwb0BYmxpcxtU9jRq2X
         EWpjDOdKcf3lxSHgyiWQIwIh6I8UYLi3EuPItMn5QXGtIASyjO9W7hcMrkr4Sxp6lmBm
         1smUKZE34Q4ElKFG5N3f6oVOuOBzBqH3s83mMZYXk1QW0WwD3IOUFmHecz6zE462AsW9
         mACHhGBVL5aL7oJVvgxj5xS/d++Bk3yiuxE5KVdlCz113e+DSGyyCMcAk4UIw5F7LOJz
         biTR5fJZVMJKHEk70VwAErsU9KegD36NYsItCUF9bscsKRxGkOK31jx/M2sEITl3prIY
         P2SA==
X-Forwarded-Encrypted: i=1; AKwUvBxpYMTY0Ve4+3YJbeVninuVt6JhQ56CbBEmyHUlvYx2f+467aR7J5+4OPMIdJT1dXnXLN9lJVLgrrpLGvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPeOhjHyIv9J6YvAmVA03HFPcKyKRNo5u5K/R+SfiLc3ZqNEAB
	vuuEaoS8XGZKOC6bRPN8uoK1+OUHJuM3gF9BI53aguoXPPXHJUAEWLDLMjs2QS1N6glkHgMntm0
	0ZHS+ppAnOnYq0ekIrPCA9ng+wgGrgQY=
X-Gm-Gg: AYBFou3SHdD6F4i53qFvOgxqaNeaP7iVctjoHI4tPtwQ8cimFBynvAkdI4NBUPv+lw7
	aF2UW108zVid5kIr1d+5sVkEjF6yTJQ4YAzaS3zhn2V1Qrk37cN9khkAoziNUSb3wN2KvfW8n2i
	CFHzcqUEXMql+mkmKbPCH2bBdhbzZoaDFPlZq2y4XZdbq5xghz93/EmwJOm8unbCdA7cPblwQQ2
	+mEkIopxEbpxquEc7NQdtpOJRpREWkcwt4BY6To9I1MzcbEbe/nngwAL59pUjhbdANTuKMliGu1
	lPvPkuA4LY+SwN8F1rfydrPws710CzoQl67Z663gtEVPpQZH1YK+H20wH3UHR9wYbje8ahpO7gk
	+em0uAHrtkq2zgh9/WwT9F40ACWzq9djKf+BLDLvnXG1fyg95X24Mzmnjnurifol0/62mcJTV6f
	3P/C3WcllWvCAfnm4Y8jbBSY5UCbRLO0YefaAOeiBOYNHWILuf
X-Received: by 2002:a05:6a21:9cc5:b0:3e3:37ff:378d with SMTP id
 adf61e73a8af0-3e9289d48b6mr7780763637.40.1793592430971; Sun, 01 Nov 2026
 20:07:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179301363708.752130.11323881261715222213@pm.me>
In-Reply-To: <179301363708.752130.11323881261715222213@pm.me>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 2 Nov 2026 11:06:59 +0700
X-Gm-Features: AclHuK-Gw2LzF3mHyz4xOxxQKV5R0e0KWfeLN-nORpS70vKs3u59r3GyDfpcj_w
Message-ID: <CAABR9nF+HekdvUboATGc71JJcA-DgYdzQVBzqb_-wx3QbvbhjQ@mail.gmail.com>
Subject: Re: [REGRESSION] ASoC: rt721-sdca: runtime resume fails with -ENODATA
 since v7.3, jack PCMs cannot be opened
To: Robin Everaars <robineveraars@pm.me>
Cc: Egor Poderiagin <egor@crazyrussian.pro>, Oder Chiou <oder_chiou@realtek.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthew Schwartz <matthew.schwartz@linux.dev>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

>> 7a0886826308 ("ASoC: codecs:
>> rt721-sdca-sdw: Propagate regcache_sync() errors"), later simplified by
>> 2df329044c61, makes the resume return that error.

Thanks Egor for the detailed report, and Robin for confirming it.

I wrote 2df329044c61. Besides simplifying the error path, it dropped
the regcache_mark_dirty() calls there. The commit message calls them
redundant, but they also set no_sync_defaults, so with them a retry
would skip entries still at their defaults. Without them, every retry
writes the whole cache back again, defaults included, and fails on
PDE23 again. I still think dropping them is right: after a failed sync we can't
assume the hardware is at its defaults, so writing everything back is
the safe choice.

Adding regcache_mark_dirty() back might make retries pass, but only
because the rejected registers still have their default values. I
have only looked at the code, not tested it. The first resume would
still fail, so I don't think it fixes the cause.

I think the real problem is that the sync writes registers the codec
does not accept. This was already happening before 7a0886826308, the
error was just ignored. regcache_reg_needs_sync() does not sync
registers that are not writable, but rt721 has no writeable_reg, so
regmap treats all registers as writable.

Maybe rt721 should have a writeable_reg callback. But I don't have
the datasheet, so I don't know which registers should be left out.
In Egor's traces PDE23 REQ_POWER_STATE is rejected. Can Realtek tell
us which registers can be written on rt721?

Egor's patch looks like a good minimal fix to me in the meantime.

Best regards,
Phuc
