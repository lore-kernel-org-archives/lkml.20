Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583653;
	b=3JH3xMyfQiTGxnQ/BT34dQXC1fPqyBZMofcExzm94GsKo/AJ54UVPUqnc4StAniPZmKP
	 I/jUM+GGuHrG0ZKjdxMNQO8p/gCregWn0ea0avut+qNCEJyYE2CkyizXQytm5poUI0ctS
	 n4RUkAycKzxLH2JiC+nnYTAcX4VH1H9KmCGdieDDziYiXpCQq8sAYoB4fHvtdh3aTpiUt
	 VOkpLd3pKAut8zzazl2wr8Fqlk7oKy3+9wIBVoe4/UfDEt1w+iNqTf/uukm1WRgjuaQ7S
	 qzWGZAtz69RieU9eY84stGZK5iG66c2AA3nsoA2+vTXINqGiaD7x94Vx17aFC1cyyuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ufj3bjLDpGq20+8LFXkkxCdAXIxC5JGd/uesP7CXbSQ=;
	b=FmE0a5tQjfdWe2tP5cPWrdlcpmMz0uNaGdrO3ljX7X2d1LKp4buV8GQL/XUQS6VoUHCq
	 SAPAeEAZ9iHEUOmahcRSeTaRW1aGhtb+36AyN6/4raDYEKijaOTf41jqNBFHLRuUlYzYu
	 /WR+uHJS8MPf31Jm1y5s28t2WcqXd2IYXWXGFtxpmLMNm6HMCIMMOZzNc68j3JoVOzMJ/
	 nvvdHM4bKbSZlQpqaw7IR9LCe7w4nEzFKoli07UvTUSxKlrBnLMK0vDgsjgbQdE//7lBC
	 rVp3gbEs0iVvvktWXVDLxCFXRRk2H1xgkJlSdKZQEgNNRXLaiOfsNjKli65oo2FO0Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pp3EJHp1;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2D606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A2D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pp3EJHp1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c42888c50c4so37474166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794583651; x=1795188451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ufj3bjLDpGq20+8LFXkkxCdAXIxC5JGd/uesP7CXbSQ=;
        b=pp3EJHp1ttZ0m+dK7vaMjimBBXm2TQHLlVACJtfuO8Qp1b9UI2HpixPrU7LNr3M4kS
         GHyHkPYJBftBWF+R/nsrHtml0rnVVY9Flq2FhRwsUI7J0Ota20FWFnmXhR1xjblUv+/3
         CnnRS5unlW0pBDquMiZwieZRutJ8EvimuuMqo2RdYAIDIMacMourFb3Vb/Awn9WD6dIS
         Y8e8tjnBf8XMT7BIVAMfxHXuqYsoVYnIJq5GFPDhoZQPKrhK63TnmJVQ1jvftevba2+J
         NyPfVG1ClpLk+97wZ8s18Y9K3zO7jp0h4U85x+JEC15/jMR99/6SNYtjKRV07f0Ym/KR
         J3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583651; x=1795188451;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ufj3bjLDpGq20+8LFXkkxCdAXIxC5JGd/uesP7CXbSQ=;
        b=Os4EsWVrEK6eV3LVqlJwQjxiL6/Xw1PfD0wrjZLQq3PSeDEeq3CXlLjz8KXygd3Ji/
         NgJnTnhC9Gcev6CJQcKWwliOa0r4gLuQqyfN4TGIe+wdPlPqyt4gry9iSgiLlf+1G2wc
         PSX+IpeIzWImAfl1d9EBSiHU0zXAFHYwK9Zlk/a7eQMSJmUezHbAZrWyirUyktxUASu5
         AY1JTXqUl6wrbguw3ijkrD/UWi/7Cd22J/gmT7gSCYu0s7zwwpdF5nbcsDwTwfuTPfRZ
         WFBRWTga1z1xdDHyLyNWUDBw+38M6lIMxKdU5ZbjGfH12gc2E3jfHdOmJtlmJNe7zQil
         mvcg==
X-Forwarded-Encrypted: i=1; AL+hErGr0cdJ8hqw4SO1KBNVDd9qDG/4A+0Wq2rB6jNm1QlZTGp68595C9h+vlL2iFQA8e0MOei8AOc+DoI14Qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5guNF3OsuekxtoOxcm4rUY6HzHMXjEG+hQheCZ8hz+4Hc1dMV
	Yj96OtA3mv++WX6KI8DeE7v4/MEw2I1gNgZMYsjbAfS0KDD9Y/AxWa4qX7w7HQx5cM0kj9DiHRw
	ZXz5grtJt+sphROTQiotsag==
X-Received: from ejbkh10.prod.google.com ([2002:a17:906:f80a:b0:c50:7d13:f19a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9485:b0:c40:b477:dfa0 with SMTP id a640c23a62f3a-c509637afb4mr264673666b.18.1794583650971;
 Fri, 13 Nov 2026 07:27:30 -0800 (PST)
Date: Fri, 13 Nov 2026 15:27:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113152729.837429-1-vdonnefort@google.com>
Subject: [PATCH v1 0/4] ring-buffer: Fix remote reader page swap and memory ordering
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bgrzesik@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bart=C5=82omiej reported a remote tracing issue on Android kernel branches.
Although that code differs from mainline, investigating the report
showed that upstream has the same underlying shortfalls:

1. Potential corruption of a simple ring buffer because it does not
   prevent swapping the reader page with the head when the reader page
   is already the tail page (nor order the page::commit reset before
   updating tail_page).

2. Potential failure of rb_advance_reader() because
   __rb_get_reader_page_from_remote() checks rb_num_of_entries() before
   checking the reader page commit via rb_page_size(), and lacks memory
   barriers ordering page::commit and meta::entries.

While at it, order page::commit with page::data and page::time_stamp
(patch 3) and add the missing pages_read increment on remote reader page
swaps (patch 4).

Vincent Donnefort (4):
  ring-buffer: Skip remote reader page swap when on tail
  ring-buffer: Check remote reader page commit before meta entries
  ring-buffer: Order remote page commit with data and timestamp
  ring-buffer: Increment pages_read on remote ring buffer page swap

 kernel/trace/ring_buffer.c        | 46 +++++++++++++++++++++----------
 kernel/trace/simple_ring_buffer.c | 26 ++++++++++++++++-
 2 files changed, 57 insertions(+), 15 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.56.0.611.g1030f0b940-goog

