Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729962;
	b=e2/qcjIfdg2FzBqKE2HGgWQybhGPf4QbxhTKYvOczzXvmIh5qcSMpFegF7/V7um1fg3K
	 nlT24DjZxffrHg8k5y7xjtnmt/Yin2CvA3y8GoQYQj9kPaByH7NVhtE1Xuw1ZGPJydvFk
	 6qyQ0bKiGH0Ndp/MaPJCzjO8Tj8uOJnVDWpAtsUg2Mt3bDUAWkekT0874OBLgYnRQbEPz
	 KnDR3Qna4EqTT/i3DkvAQMTVb3ixbf3lLljhPqTf9krkD0Czph0M5+v9XdMPCOFKEmCcd
	 X3Lqg8Gmq0O4eQJW/1ZmsPd8C2hwQ8rsA9g+pv+YKy7PL7k3VIWKZaYpU50c4wXDZHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VHl71I32Bx/e3xsZSclmhNLm1RyMWmdjUwSSd6FZTAI=;
	b=jWt6NTGbEl4uBosBSXy7eZ1gZm6cmbUmtKiqjX31MMRXcfliKx9fVZ+nyR5uZMoJK9FH
	 aBkKzZdh3Fba3hsA8EiJCNCCaOenUgx6RUhFlARZncTUYUN3YgECEMwAjZbtJVrBrvX9K
	 shnN43jMWLSAw+3+WQHuMxmme3kOyg0Cojm6ULNMXzIhoXpx/2O61J/DMQOQsvMLhA5rC
	 NXHHki9Q+VDWsT7LIuCRVAw/aeODFKRcgf7hIy2lhSpzUv1+abjnDXSkgyhVat0bmJEL6
	 WyJo5Djz5dy4Ef861L95qRpRQ75rMhjrV6/axpo5uvKehhXrEU7RT+Gbo5oyqEhEv9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHPhbDfo;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1B606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHPhbDfo
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso348569a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729961; x=1795334761; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHl71I32Bx/e3xsZSclmhNLm1RyMWmdjUwSSd6FZTAI=;
        b=jHPhbDfodVTTLB5cXQrLwjt4wm+a9W9TWJJM5+3lF1pO+PhIXoY1YcYm0kgu41i568
         rUuAH8AruR40VSgN1BVucGgChAC/D4cBDOlMbEc7HSvo1+JVm+ZU0WgPQujJABGKxVQ8
         qYLcZ25UH3NusLAwOF5BDrimMUxXwf6LGAD4evHqUPA+VHsRGO1oRMkGQ3l1yt36vTok
         LT3GYxUGG2w9I+XijGOeDUnRZAwvyqeidAuasQ+O901dsm1N0wE5j8RyG9Vwa7AKRW7J
         kWdLPCpZJdw4Nmew025EIIGboLL4fjB2IJnd4wdcMmoaLqwlqnsKQeaK8RHvYM7d4z5n
         0YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729961; x=1795334761;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHl71I32Bx/e3xsZSclmhNLm1RyMWmdjUwSSd6FZTAI=;
        b=oOzc7LLmE56Yca0E29liaLEmPEiSXoENpXiZ5Wvn2QhrkevP1RiBSell9EoOi+3BgI
         sfCcLedBgobs3UKPIfXcV76bOZ4TX9t/E9BTBGUdC3LupM6n5T/c+QkWxzcpWXy/Yq6M
         ivw0+833eHqEWUBHsoRbMWJZ5fTQzlvWAmq1+Rl+91uIMFSrk5N9BnU5DxDaRwRdEj0N
         xvH0SaPVRFvsPt6WlaiJUwPW8XJh8DOoeqIJdfCz4v/aEWA8aLPwLhzM3ZqMJdSvkxL6
         Y94QFOwFQKdd3yIsYXxr2qcT55/Vb7fJpesPJlwxLPpZ/ZZxVcIaETM4rYs7AqlacsUF
         PCrw==
X-Forwarded-Encrypted: i=1; AL+hErHerDeco/f+EWQVA15TALk96AI9Hx2QFaIu6MY4FjeLarrDaauoKJi3+6aLtdRfPfftXdUhx6r6UTzul2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z83+AmfmnIYG7hu4fl8wma40rfsUsBY3Ut8YA6oz7pebYAFjJU8
	G+3tqwnS0+Tp7/0QFjWtwMjq7jb3coDb4IGIFPvM3MtMgIP1LxU+F4YK
X-Gm-Gg: AYBFou2PTdbL1yhvzU6Snf28trg/0c+4RRP5jV7fFpCNrUJ+uGf9fjn+Ea5zSUHQS4d
	m1gY7IAKch5Hlnm5dYn8cK3whXkfcK0ljyzmu63dExD9mJ0F0EMTvkrzJZAWBijfyTfcto3sw4/
	hsB9SjQBvP6h4sMC9Y7XOfG0O7ukp+1uagC6z/YTWxC49xULQBPhEYGhXIcKYf1YvgliBDHknTl
	OxOi5JJrtF6P2+G9awMg+7QoDKkB8NG8nFrpB5vhdunEpVfR5PaIPDrpFqTKchxzbaxjAd3MQBy
	ZMG9n0/INAT7+RrOezAI4wC45gHJHEYOn6HU2Of1N8mojfNoCEKPN14/2wtdmPgs0sykANQe5FF
	Hp0Oo7heGZ8tmb7RRZb/Sz4eVk3tWv//VCokN4FtOPgqcLSFVqmD6jwnizBoeyTu4Xo8oA6I/k8
	Tb/V9xVmsfWrUp8gYJEaGtdDvdaB4/NlTcwnTtJXkXHUYJDFr9oNr31wtXmvxJUNDCtShMQ0XqK
	Hl6Gl17xEKd4nrntSoTQUk7O6mCH2cxmZn4u2m9vX3yEicim6XDFefD2W6Yg5H3NSS3hZwNluph
	MNtpKYv7QkmcZWDwrE0j4fS8hiOH1yATb4Pgd/xHZkhm+eMi5kh9+ioUPVWfERIdC+7BCRx0ZRu
	DdbQVUPM=
X-Received: by 2002:a17:903:94b:b0:2e2:d09f:d772 with SMTP id d9443c01a7336-2ee0d366b72mr113814645ad.0.1794729961255;
        Sun, 15 Nov 2026 00:06:01 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868203sm24927565ad.49.2026.11.15.00.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:06:00 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
 mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the
 core is powered off
In-Reply-To: <20261112141512.1840-1-26rote@gmail.com>
References: <20261112141512.1840-1-26rote@gmail.com>
Date: Sun, 15 Nov 2026 08:05:58 -0000
Message-ID: <179472995896.3849457.7552548813153786316@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested on an Orange Pi 5 (RK3588S, dwc3 not wakeup-capable), 7.3-based
kernel with KASAN and a local dwc3 s2idle change set to keep today's
power-off: 10/10 s2idle cycles reset the controller ("root hub lost
power") and brought a USB 3 disk back; a cycle with the core kept
powered kept its state. No xHC resume error or splat.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
