Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427231;
	b=AmOSZ/4QtYtEUIdK9GT4gDQTs9cAyP/ElQlCUGZi2Zjt2Lna0Id91TWSxQgoREs9EIkr
	 c/tFUc8voriFTKHTQf/29JoB/E631sXl/LsGgacLMoinI5JtWLxDJx+GKnjbdgPZQloGP
	 yFHSJc5BUDvvToq27OLSdhm6hyU/c8ErtCjqcSmRgbnluDQl/tDrYbxqG/304zSU6h18+
	 RXSVy6hv9xd1IPLULFcvtI2vGQ/Db228TM18Ink/1Hndmdl70AvaE+Ob93BoN//+Bgk1T
	 WH3xml9q2dc5i7+N3pECAxk1fqZdJo9la9P+nmh4qDV59eZVkKZikePicxaL0WnwfEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
	b=ZRlo7MsGQLzTnx8C6IlurUKdGG8VFijvs7E+3UL89cUWreRsU/NsLEF5jGFMgcfnLxtO
	 68qSMeyr7RgTk73o/J8x6QC6V57V7EtHYS+J138K4TBsxgwsG9v4u+sn7ejI/zwYYFF1Q
	 VzoEVcLg8YfJBILlLRwUl1TYOCigVqY6NvXDTqUDH244E+sf8XahPOwBfyOxCzxZFvtPC
	 FvL2cUD5my8HQLez23o9sEcCH+qv9eZdMRwacVbnn95JACJfgqtQOECfqVHj0Y171/32a
	 JgHrfGaY9JXSCqN0W5t45Jes+DXA+mX4vFMNYxeOl9z77+BzVj+ayv5gE7/DLjoEvXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICpsNtDj;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B226606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B226606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICpsNtDj
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso2411999e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427230; x=1795032030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
        b=ICpsNtDjl8RpGDWPxeboydSu/EEH2dc3F1U/ihmVr5TvqmB9GXzkPDgrSdb4pTybmq
         rSXYND5og4GcBCQzlUFJdJ7g1a0Wg25xXHOc0oR5VBOQCimogGtybB77X2IzzJAL4QCY
         u/rPxDk7NZAtRuT5zgOxildkgI8fjUqWbzfA8BpS1lDpmeugNImYN4GZjcm5G/yE5pEa
         Bmh8Ui1PeSQVZNNz0MEFnx4+oVTDI3tlGl04FCJBhH39Bt9Bpi3W0D18XWQJ6YEjdkdF
         oF1V2Lh3uJOAsQow9V6jQCoClk4BzSTaL6w3T4gVUiqgEkTBavTQWVWq12QqWIUd5r1n
         sSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427230; x=1795032030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
        b=dE6fuWan3WBZhrmYiIksD+Vdz6b4PCh6GH3iDadQ7+Lfk4VOS3/wsTVc9kvIRU2P+5
         LGmkkR+fiLqYDdINU69rrXssPhWWOBFs0DaYdqAzWpfcb9wlpuN+98/E4PRF5DI2ww7p
         Qh5Vafhne7HDEil+LgN3hFpAVAAs06wGxKoynhzh9jtCEk4mSB1Q1I/2dbH0i/vP/y8c
         mIwlbkyttnhepv/hgE32zCzrxaBmy/REQUNu4FPBtiHtFXFN9OQuuv2mFuulkwU71GDB
         VsE4c+7NPhLDYe6pF5lmV2RvOgx58eX9QyTSOrLGc4rJgPUELJZKb58qWB7YFuhuFFfH
         bEmg==
X-Forwarded-Encrypted: i=1; AL+hErEuvT8acrBsyWPC0vGvvIKjLq0IKLsjaPZow9TyzQl7CZ3QxZngfUBb8ESiv0HfdcKk17NnOIePPscTptM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mxFL5rgN/Hpw3XWTbgtDAIylFSFQ3YF612XkRVUCr6niNCq8D
	l6QJm06Elj0vHUal/YKu/MJn0O7HwM7QrG/wSJ6ouhhYWimzPQ7khhjMcq1JzLFn
X-Gm-Gg: AYBFou3poSpy631cIcUsFl6a9c+vU4txEjzqs2Ba9WA3bZ+Toih1jKXIVuQ2VC0Zd7J
	3txjIEaM00pWKhxprN7RcFbdoHpaNWA2NKX+AK6DlP+kicnFa6NA/AxG/nSIvB62hsts8BcFAxK
	154uAP7Bnr8bOLPqVO8pF2yLCWHxiU8dZUZfyVDDnbqak2npPKeFDkIe8oN8eHkRuU9NfstPnf2
	hPdGTFTx/0qSmLLcUmeFrSY6ls/Yj8YjTnM3e3YwjHdBv9CD6QpBwzNY9GpGtsVBfwvxC764Lnx
	qvgmRlFjGgc/UMclc0M/vzf4B0ocqnEJfTNoDfqyHXx15kJrXyB2X/5XG2f5VoeKrDWcEZ5KEfD
	LrWWQmPTrYwdCxkaDxWNoDEbUvXNw0r5Q3k11cfxcnszmYEX6cWmQoRkERY4iVBt075DBLUQsQA
	xiIAKsHmEMoPCKu75MC+Yk3TySiwwjYKmu9pa3bJL3esbQl0+YxLNM6G9Ht8SIW/sjZeL85yH9x
	gM3DP/PvwrcwK8bhMGvE7cJjGYexLrTl7SjLSkTd9lyBe3fflkWeuIRELOjWImt7v89v5/p63HR
	E1amgL6Ic7uKkSNWi+kcwJTWQiRljtAmAQNtNXUYa+Wpf2FZyPnKUnKqjOD7/iQ17kzrKMzLuGj
	KhUDvHJc8QC0UxLYn5yxaZCh8BcmH7WJkHF9E
X-Received: by 2002:a05:6512:b8e:b0:5c1:5cce:7f1d with SMTP id 2adb3069b0e04-5c15d58a87amr1050525e87.9.1794427229586;
        Wed, 11 Nov 2026 12:00:29 -0800 (PST)
Received: from yantra.. (nekmmqtce067ylb1za0-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5558:447:baa4:a7d8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bbe89csm1102957e87.81.2026.11.11.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:00:29 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH 2/2] iio: pressure: dps310: add a data-ready trigger
Date: Wed, 11 Nov 2026 22:00:25 +0200
Message-ID: <20261111200025.38344-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-208073@kernel.org>
References: <20261110154254.39092-1-zoone.rupert@gmail.com> <20261110154254.39092-3-zoone.rupert@gmail.com> <sashiko-outbox-208073@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Nov 2026 02:15:48 +0000
sashiko-bot@kernel.org wrote:

> Should dps310_fill_channels() read pressure first and use
> dps310_refresh_temp_locked() like dps310_read_pressure_value() does?

Yes. The wait came with the triggered buffer support, so it is older
than this patch and holds any trigger faster than temperature to the
temperature rate. Fixed on its own:

https://lore.kernel.org/linux-iio/20261111195118.36853-1-zoone.rupert@gmail.com/

With the fix, this trigger keeps up at 8 and 32 Hz with temperature at
1 Hz. I'll mention it in v2.

Rupesh
