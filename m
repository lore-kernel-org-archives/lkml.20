Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821983;
	b=KNqvzGyMbSLhx/zebnF7HfKmHg80qrT8Sc7LKdHB6riUarXP/ceTpN0lKlnFO1M2cbZX
	 2gROmEnWBPjKjZuJgQu6cQLpXWxYWjTV2wpaPGP2/mdOkx5dU7zcqmZFTjLTYJJPW2GZf
	 QmpLRV2i7PqcIPiS5c/Bz0cFXK9kjwi76OQjiG/CiWaNVoTze7asP+7W0N3nPiIyBOcSB
	 67BlEoZm56tPKgUOFjuRABvDxxbYjATbjutxiqh2CkM/VS4M5CQ6ck2v8rcl1lIT6pvsV
	 Zeyfh0fE5mKfocYPC64Mpkt4uDSJFrOMhxnVCY+E218iUfNPC1sUWEJ8Fm0tlbRWrGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=veFu+GeN/zVA2n2SaVCI85ywkvL139Q8TkIg1x4TZdo=;
	b=0/3R0oFMwtUhtuMb1stbZTOEpPctofgTDmpSRHSZjeeXx3g2cJjxYXvkoGNZjz/mlvNe
	 eq9WkA7RYlmvEKpWINv0Pli2fGh4F+mWC8qz7KuEXPO9Xv7TUtMyS2EMzaUPor0O1Owhd
	 qA0BC2rNREuyziz26bYTFfUS5bVGMMtpwUURtGzOMmJoSz3sfCxDSpbjHtHuByc5Vu7Pv
	 5xkJT+L8v4jrnOD/CYiUvnymSPbPWjXTpTIhMXCDe3F6fV8Ht1OHcKpTxRwZpIqCLUkyn
	 hlwi0J8zOQRdnaZeI5ch2hFbEbmsgtiwXdYIqfmSpwtupIJe3wICSgj+zGBDKZhm3VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANJA3a98;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5008E60D9EAE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5008E60D9EAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANJA3a98
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9906c85122cso373536241.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821981; x=1794426781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veFu+GeN/zVA2n2SaVCI85ywkvL139Q8TkIg1x4TZdo=;
        b=ANJA3a98FFvvIOpxw+9fKDajX7EDD2IFRKvH9PU+9a1uY4sPHSSxrQo6Gb2VOB+q6K
         Kkuup/Ar+oQar2+ucZvjAcMmZUaUYNVkQ0ouI10/NGnVLlAzJCDC1NlovCQiY8+xDL4A
         8U6aybAiThMxApJAxERlQ2os7ZsctB0tjT4eR4ehvvNbZncPKM7cu2G5kC3PGyDVjf2A
         9fCnF085z2qqlhcj17L1776oNFU884YV0+F1bDpYIqPccQNEmbId1ZnPdxl2RYBt3fMy
         8rabLD5Z2wZQuLs07BRvCqsYJ1ogEMzYz4hv+c5y1wE5JRRHUyuV+jXF87+Lx4rEuzuJ
         8rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821981; x=1794426781;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veFu+GeN/zVA2n2SaVCI85ywkvL139Q8TkIg1x4TZdo=;
        b=sg0n+XulfQzBdN4w+3akW/fzXi182qVfwSWK2/3iZw0FB/vbL2faFfNXC4aQR9NT9W
         QlW5d03zdSNGIC3lgmZZRbldc1zGXcy8mXvEg9WmaxGqI6DSHVX2VbtdQLAdwyWo7yX8
         6M4aFl3h/51vIiRfrFXo0Y3ZEZ55pBv3K7ro0Yss47LeneSyWVv+osfRcZARpvwUXjne
         SVGgghfVmKJzgScXclgBM3l9wz+VX4h6Gz/zDf1lmO2mStINTj0PTMjXUjxt2IpwjreH
         W3vpYrGw9nr9FoOEBcPuN78waUGv+yVLjyspo3rsuSRzs5wLtcRwCNZH74T1JmuTwYPp
         xPQw==
X-Forwarded-Encrypted: i=1; AKwUvBwrkvOWbbSGzCNiS9tcBwPG4i5Y8LOMW06HnM116sgSwyVO0kCQXJIfRWYKjwN5ADqGn/7MTq4CNLILofU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hRB9wbp583E+BmJhG6IbMG6bqJJOqYy21qlqmWxiSYPCF4rGH
	4mXZM1961VXDQ31shtdyxopRF5tOCuNa4+eUfDiFPnAsst9FRCQpdQg=
X-Gm-Gg: AYBFou0QWhSwODjeKdYf7eUgNicZD309b1Q514Uw/CxRsmAjEg5+zdIbhuthNgmTfn1
	3c7S5XDD7fAkLwqaOmiyuJbzZW7rywzRiEuEg6R75znyaBo1OBtgahWwSFtRIpJM4D0oAib/Y+m
	QVbz2qyP8s1zZJ5GuWPxySzS1y7lWmJ0ki3jDqOQVSCTgaC/iQNsCk9yp0xKrEig91Kye4EMCIs
	232yHzTMa0IGq5Oi0G5mkGI0mnOddhakAHMtOh7h9c4YFrkV9GAcLPMMi74RThnbc2a1lvYJ8eJ
	nRb/fgEZlDNvnzsdNNSa4Ij1uWU6bxKvjoCtdiSqM4VtU6BrGOCX/xPgmOs80aI+4FnD0NpqZKx
	x/B2PGZGG1aZDAqveO022qjrpfRm7qAsIDurRdCSYqj5aND+RggOsSDCByqG0PkSuW05hCmC8We
	Gyte+ZGwOlt4Gp62RYAy7CYySSopvIlYnsp8n5LJOACn3YHi2WOciItcoDywEdJoiL/1049Tlw9
	5qrVWBOexsYNe22YTsb8YmFNXnA36R1Lv8ZM68+9dlVL5J6MpbtPFVoGoUykkkUUn0P/pknJCEH
	XdYO+hosOR4yzKKxZOGIRyIpWihfMbJVeZ19Vj4njnBRC988c3HxEpuaefuH0KbSLBQe9iASpWt
	mgAc5
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d072baa450mr6439786137.10.1793821981337;
        Wed, 04 Nov 2026 11:53:01 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm2387237137.3.2026.11.04.11.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:00 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] remove TryFrom<&Device> implementations for pci and platform
Date: Wed,  4 Nov 2026 16:50:13 -0300
Message-ID: <cover.1793818280.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch series removes `TryFrom<&Device<Ctx>>` implementations for
pci and platform's `Device` struct.

I made this a series because both TryFrom implementations were
introduced in a series:
https://lore.kernel.org/all/20250321214826.140946-1-dakr@kernel.org/

Changelog:
v2:
 - Replaced "Closes:" tags with "Link:" tag in both patches.
 - Added mention to the soundness problem in the commit messages.
 - Removed bindings::dev_is_platform C binding since it has no other
   usages.
 - Solved Sashiko from v1: "[Low] rust: pci: unused
   rust_helper_dev_is_pci() left in rust/helpers/pci.c": Deleted the
   binding. Platform was in the same situation as mentioned in the
   previous item.
Link to v1: https://lore.kernel.org/rust-for-linux/cover.1792417858.git.nico.antinori.7@gmail.com/T/#t

Best regards,
Nicolás

Nicolás Antinori (2):
  rust: pci: remove TryFrom<&Device> implementation for &pci::Device
  rust: platform: remove TryFrom<&Device> implementation for
    &platform::Device

 rust/helpers/helpers.c  |  1 -
 rust/helpers/pci.c      |  5 -----
 rust/helpers/platform.c |  8 --------
 rust/kernel/pci.rs      | 21 ---------------------
 rust/kernel/platform.rs | 21 ---------------------
 5 files changed, 56 deletions(-)
 delete mode 100644 rust/helpers/platform.c

--
2.47.3

