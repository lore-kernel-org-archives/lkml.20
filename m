Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865854;
	b=pEqw+Q++9q4BTzAIQweLhMWYmBOjIRrJSawwj9eO5Vs1oBsIEK/MMVA43Cpj70xy1Jv5
	 w2YF5A5RsIXv5F9u0JF/AN2MlIhxeaAer1uFfOBqZgYYkfJyDlZ90PyCKUmi8gdfMEJAX
	 nGRFXm52Gqar/x3TLlNh0wbrj3nN+HALhVYeqe/oBCEQvJx4Z8W9sEPJSoN31Bd4vbwme
	 CRkeTfAMgaAqe4cbpTAFPvkDMlO7H/HAM0W54wFJtBrKzGYmKV680HLZAIZaNeuKZyf15
	 0ih9kjoCalKaVWEnn9zuQ1UalEwJqao2RwpcjRlG1XiOpEV4Gqh5NpnM1F8trqzcLCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=qwbrzd7fYBYLMbcYStT4Nw+sPoOjHywyjBxJxGcabSk=;
	b=rPknFc54jGNvFIKF4q8hJWbTfWc5TquSj/AMsHGi9iolzYr9Ql5lXl6Vnos+xi9mqHxn
	 FFN8iF+xjrjB9E2BInb4obTx6tGPM/y7BTDqhKWsZ7pbHBWKzTxAOIdL8FfAF1e1R5j+k
	 SJjW1f9wakwNyUh8gQNLLp0IsjoH5TRQo3Kn+/xPU+bhwxXh4kHHMxEzZJoWWHAlsZXfW
	 ZzjIybl+w5a50ZhlWNoP3Gj02GEqRUjVAnv5jJDpYz5zCiSFKnXQ5UpIact0CnpCdOgAz
	 tZLtYtMVi5TKxPFfZvL7w79BS+ZRYg98Bor6264hrVl5eUnCsz4b4lZkZtLAIM1YV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tGNwHDCD;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00958606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00958606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tGNwHDCD
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-380c28f9e35so313257eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794865853; x=1795470653; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qwbrzd7fYBYLMbcYStT4Nw+sPoOjHywyjBxJxGcabSk=;
        b=tGNwHDCDLKla2E18ZcotYovPFx9z0XaxN+o43JDW3M7piMhhdeMm8S7/GGjvxD0xzk
         HlEuUaC0AK147O9pAIrHvwLm93QEKBOtcFxzYAJl4P5eM4fPtcNfEf1V5KoZrCnpOtZT
         yp8enqxqbZ0HuEFpYT9XixESnW6taSo6n36rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865853; x=1795470653;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwbrzd7fYBYLMbcYStT4Nw+sPoOjHywyjBxJxGcabSk=;
        b=oDzFvI7z6WOOOJUv8cPQWv1Xige4WirfQZiIi07OYCbfiDH69RXy/NMKBp+raSyz0s
         zMRTQiWLhk22NEhBNdYSTB/w35DJF5t+ugsZ9T6/On0xHIQi5XDamUbeGq/fEZ9XaFSH
         rkJDjsikQbYqnSPurYSoveMHHgZ3YasXG76bbQDKMB/eso6OzsMo3A4YjzYY82kGvhB7
         Ur2b3301DHjsIYJOjJDI5uxbqyoop7ez3wfy+uxszCqnzAckBzZqzBTLGv6n7QjcbctW
         Ki62lZf6Lub+DIoiGyrkeKvedGcTRIiL9NdeYYPJSIoJxeZwZ00tvk3mJ2zDrafCjvIV
         tGGA==
X-Forwarded-Encrypted: i=1; AL+hErHCvNKJQPZWw0O46gWb10+Y0wWf0f2hgKZWRg/02mkxRxNGeGJDyJyREHkHJ0LNagpVfMkjafCos0uR0Us=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bi/bN5dWXaHAv5ellLRTnADzhYEe6kyVETL9PHNTOvdAE8jvF
	OoRN250oTf1uTGDoGE0aFwIsFmKTSBH+Ds2MrOC2qlLlzYBPVxatGGw+Epz7T0SA7Ow=
X-Gm-Gg: AYBFou0CSBgftXRvDiKKiKKBKIcA38tA/5S5cJyGvVVitqBjRNepwG2yaYoXTzlfDZF
	Dsn+dIlhP3B1VmLY5zF/G+7rjUzJg0sNfg/mPvo0H6blvJfHaVtOOwJpRJjcqHmrewdFnU3DyOX
	Fjvdleb3lPqyKCKBKOAHjbcH04jx1YOuBBHeQRsbQxssF0A9mLRTTdXYuz+kgOtM85JgTXM8UT1
	WLYsMsQGoFF0Xrmi/BYaGo32VgOq7a5ukHimQjJzow/asBhKR+5NxCtjETsW8Ti3GwKEHTVRpyV
	95RKm0Z9KIQVcvZ9ghUx+QEw6JxUoZJOsg1rYN1u4Gn8MCjxm2sEo8+17q9oBhPhHxQ+hQL0LJe
	gr/pYT681kgdB5ulC1vI4HrajnLwUy6c1nyibA54QKRSJupi9H5lM6rZaVZDLpYltUYNI/VGLzw
	2t7dpn++xzt6tyikKU6KT4dkRky6MaABLaj6DUkW75yWvjzt5QbUTJtDvcJ3drTJqyWt5hPp9y2
	r7E2dmhW8Ar/LDkB08A6jAjWKUtl66upb6NMy8iojhx/Btl8Zk6TmqbfbyC67hIHh0DmaKFfSfW
	/eg+OZDvDMmk5mMxpaHJkY0vP3cFsdGWIun7EdT/llvsvEeNvQIX974DDJUJfWCY9TVKj4VWUfl
	Fdq1Y1RqObJpKAOGVahbDv3Um/+fGHJFTBwZ9vNN2xgkXV2mot1bF+xVZrt0tc1l0oF1lgc8R2I
	op5tUhKdFj1hbFWzC00Zv+kHp/X7G3Hk0O9/6CHUkVh7LRk1Db/1qAWSd75pYuas8BixGAhnACp
	LRsu1CGch6WoA==
X-Received: by 2002:a05:7300:b0af:b0:381:5665:df21 with SMTP id 5a478bee46e88-3815665e29bmr58724eec.6.1794865853121;
        Mon, 16 Nov 2026 13:50:53 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e0fdcc36sm2436124eec.25.2026.11.16.13.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:50:52 -0800 (PST)
Date: Mon, 16 Nov 2026 13:50:49 -0800
From: Chris Down <chris@chrisdown.name>
To: Breno Leitao <leitao@debian.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, John Ogness <john.ogness@linutronix.de>,
	Petr Mladek <pmladek@suse.com>, Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>,
	kernel-team@meta.com
Subject: Re: [PATCH v2] serial: amba-pl011: touch the watchdogs in
	write_atomic()
In-Reply-To: <20261106-pl011_touch-v2-1-8f4996113320@debian.org>
References: <20261106-pl011_touch-v2-1-8f4996113320@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avt6uX_CAZmu2ior@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Breno,

This looks good, thanks! I reproduced the issue and have verified that it
goes away with this patch.

Feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks,

Chris
