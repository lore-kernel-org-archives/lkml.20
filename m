Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507548;
	b=Jtfq7rsztVxtIA/V5+vsxGhRStYsbW+ElZA0JkyfEmia4YyR3YRHYPHZb8rnLhDwbp9D
	 MFNCGAjE7OH0lvP8LEe2udMf/iwoQg/fNUG3vWRvlsyG+GLlFJHdnxPYa2BkaKtfOEtDz
	 mbmitRaMReXGtmtSYhyYgHzfcPYP6z/0dt8cyeRWI1eOmnoPclFkk4rLOs0nC6lt0bBwn
	 B/8N8oo3MJYM28JKGGIe3RxrOJT8j+JLI5Nc0WVMikCjhf+R8gXoGptT6uyAz20n7ufUX
	 dTsv+FYBjMvQyXPVl7a7r95/vwO+jVWYm1SHAJkvwBOc0DcsEDF2yBXbX4T2nIr4vTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hB0gGU6/Wvj6DY1CIjnvdF3luMseLxUER3Q6hRYFMuA=;
	b=FOOGnVXXP+X6elzxz8zmJHZu3scQGDccW33jyn2UUouOi4Tdf7/APVDbRfI4IVbMJKuk
	 PA+bC5X37n2hEjYyp1k+SZLMD3dDoDYaViRXVU8DWhVbDeQLEu6YMn8cucql2i/t2pXqt
	 UAvJNEbSH6OYTyfeuoC/kmKtEigJgknsURbSDxxifhuS5YFDBBaBMvX4OBxcyEmTEv21t
	 aAPeEQHKcHGbe90gjG/0ry1SepHe5GOtG6FXKTv4aHXJnIyq0AzidfugQ92PZCg5HwlQx
	 QNAJ9RPUFwdwqtZEC38G5cYN0pq3ZOf9sv7ZVvCpcN+jFMc/WCL6D+KdPXvnWVkucMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEzGzzhe;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87427606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87427606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEzGzzhe
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so1218425e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794507547; x=1795112347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hB0gGU6/Wvj6DY1CIjnvdF3luMseLxUER3Q6hRYFMuA=;
        b=aEzGzzhe6EMFNOvAc8cfQlCBSeL+1K/zjWgyK5EZg0KOfXRvCTDR37DN6Dvaxui9Jy
         kEyTMJCIJoM3sImYaAyUCu/k9QIQwhVdoS90OalO4Hs4hhRPcJEvLB09db+cU40pUXV5
         drlxgDiARYvqvqh1fag3LhNQw1dMaZ2wnvqMS8k1R13dcPnLeiOXlKWwqjtgWblmifpq
         y/WADavmJRtrqONZx6E2ynDb0r5XYhApsRbz2dpQ8JMe4c6RiphErUvuVS4pd0LxTRK5
         DrMPuN4QUkEl1rpwRIn6qwWSb1mJQz2GPIgQboD3O5JNtxt137JkEgUXNCiYp8pr5GPs
         d4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507547; x=1795112347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hB0gGU6/Wvj6DY1CIjnvdF3luMseLxUER3Q6hRYFMuA=;
        b=oUTJlXnqr6ScmnvzZG8erQh+N9RQYSOdyFECT8yfR9eBjfgATZ+rcAlkPUsvz9ERHz
         ghCS/KKXb8EwoUf8QePle5lc6UhB6G6PP+zpo8mM63ou4k0LxedUWFozffZJaJH9ZCvi
         zC+fcKkC1ih4KLF2Sq1ohl8CCXcOLrLop7iUaILhGy2yybnWvbC0m8xBMEk9wtRPoWSn
         IJEzRdNdi2nh5ScaXZfJDTmqgatV7zs0/NYq/eGRYmHFSGXncSCm4ObzPLy7ygLu3I3X
         ER7ZUbuRVsYfy5uD7bj8ttO5zw+mwVVbx3B4qFq5v/KzJ5bC10aQOX6uKj+ucOM1DL25
         cWsA==
X-Forwarded-Encrypted: i=1; AL+hErEivoh0sIs8XynBlirDV0nJOWkkTFfregJ7h8d5WMJ4xemBIh0qGzgPJFnsdp/2PBjZPbNTDw2tUD4QU54=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PYt8jgLawUZchmHVh2kEULpc8zYf/bdS5IrIVlV58TZeXp8hY
	vcZ0+YA7sqLKjgZTIwvID6uExYBLbELRvxoiOkLvmeD49We1v5DZz3d3
X-Gm-Gg: AYBFou0m0hij7p6eCP2qYEB3m8R9qapmZD8lKZWEwzK3Ie2bBU4WvxD/3p+H9IW598f
	xReb1AdxQYr6jM9OmdGAyhw//1UEeicvsADHl1uBVPNWmVDSftl90862uAJqOKkEAw3zqdOibWY
	AXG512LRegdnuC8dmPD9ne0ik0EPG8IedkAl0nHNS8zx9KGHxUYvkBUE+w7D92/pXKg0TIMtlO7
	9O1lykjG7zIVjBvPxPuV/0YpE+1EEyIKaleA+hRmkln/P36gd6829Tb7IRmeWeKCN/cXpi19/T7
	f+AFNf+TAGfJP541DqQnz5eQpLAsmOuHr9v4Z2FA0CKABc+i+EZHDaa0/Jh0xx+yDKLN0Hs30WE
	layZT1pZVNmTw5u/M6mcZaIWvQt5DWbYzou1DY09voMUYWafnA+mfbDafj4w8qdpBJLBwzgm+rN
	kxzYwzaNGHrGeARbqN+EiDH5DuYHJpaCWPgp9vGyDH+7ptPL8EbkiLaR7EnjNHgJHyIoWRX+o8s
	r7ppnbMxwoa2b9ZdrS+Yk1P3ljGZShsOnDTbFs1ZSK1B8p9Oj78YG6V7v+QguORGtf5XRBTCPX6
	y7e+LzZJEngX0mD9dC/lzOo2tkKCMeOvCJuyxXmSFXcnAINDF1AqUbF+34eQvwLRnGIXBZFTfBm
	PRQ==
X-Received: by 2002:a05:600c:1912:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb55ad45admr76185e9.35.1794507546798;
        Thu, 12 Nov 2026 10:19:06 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.56.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e27a8b0sm87629935e9.15.2026.11.12.10.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:19:06 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] livepatch: Fix races between stack check and module load/unload
Date: Thu, 12 Nov 2026 19:18:55 +0100
Message-ID: <20261112181856.234172-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avX8UWAA4DN44p6o@pathway.suse.cz>
References: <20261022134433.3595212-1-parri.andrea@gmail.com> <avX8UWAA4DN44p6o@pathway.suse.cz>
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

Hi Petr,

On Thu, Nov 12, 2026 at 06:50:09PM +0100, Petr Mladek wrote:
> I am sorry once again for the late reply. I hope that you still might
> be able to handle the feedback and eventually test the simplified patch.

I'm not planning to pursue this further, so there won't be a v3 from me.
I'd be happy to see you, or anybody else interested, pick this work up:
please feel free to reuse any part of v1, v2 and of the reproducer.

Thanks,
  Andrea
