Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883763;
	b=qRJpGAl4rWRYZ5KKO/EBq9AfUcOLO5NtdCuyUDyh3Uy+63Jql1QgZUmysLsq/O+T521C
	 ogRJClKvvtqyw4qTfAuIq+NpZt2nW2mZqigpZAve327f3A27+4rTNl6wCMGgkr+9kXKBA
	 iXqe0u9RHq9bSAA4aWroKe+DxhyQjuBlSp2AhVlli3U8kUDXIPeLSxH89RXpSZj6PlbYq
	 tFDWfv69yV04khukrHAX7eArethGNAS761di2luQU5hJn7cNjjUvrWnF90LFkI/G0N43g
	 HHX6lxyG+7MF768mhkX6YTu7jemiudBJRlddGgQUob2xyXqY2N7ofPOroKm5OyVg+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Shk8KMb8WR/O+11ZzxwMDxGBuHI4bP7TZoQ05okSDEA=;
	b=xLPpEmb5TFF0H7Rs7ywujgSocPaQxiGm3Eupezgl9P1X9m/FWK8KBjhhUn9Q0R/KuD7A
	 8WVf7JCagyFmDl5RWjRUYEfZghnFW6/pSByE0Qqvj+gHAMUXu1uye/ggqqjq+z2/uDOkt
	 6Th23G4EQNpVsIi8nGuhMaUVxg8T0u3oDRZVNfRlAzj9KR8OnQgjz34sKR1PRrrt+zCKD
	 dGm0Q01pmJx5coJ/lLDDkUer0m1ANR94iLZQLPcElhaWljRoGDZO5GfgAF/JRLOqoMiBh
	 wvurrSKMT90H3ueagsUjuPR/Xhcr6Bd7lGJFjnAA6UweqMruTM75+S9MvUa5lKXrg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="B/dTjZ76";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9492606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9492606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B/dTjZ76
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so5263346c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883762; x=1795488562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Shk8KMb8WR/O+11ZzxwMDxGBuHI4bP7TZoQ05okSDEA=;
        b=B/dTjZ76ejqqvMugSHmsgpYfWZfjQN20kjfMiNiHFQpPSixBPshTAEMYvUDZxT27IL
         2G9W1lxIX9K2rftDzlHXyyJweurjhf7Ms3wxSQZ1DochecFYYmvhLQLGjvDahBgCzYw/
         Hi9haU1rr2Yvl9w3UzEwvpP7CqcjnCeHsfsyGmKIv5SVyL5kO9Jn7CA/AIjW2hyVuOw/
         nc2bg/khUXXaXiplLJAMZxs4f8/M+E6t5i/8BgbpiPSVPc9vBk0CamGvOdVUv0FPTgQg
         du/3sEzvrekCWqaKHmw6sNKHCWUCkIH/PcI/wkfdPczgi1op23nYxBkW+jTyfrI3wZVb
         xgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883762; x=1795488562;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shk8KMb8WR/O+11ZzxwMDxGBuHI4bP7TZoQ05okSDEA=;
        b=loiNA6np4jIsi9PivMNjFGP26VLOpBrInSkPybLxAk7thS6060ZI23tymKGWQZebd9
         JWjg+RFnkV7hlKCnI8/knPjqY1L2G2HpxnjLFfFsjq+nRLQnQnw/R542jVoCrlq/RH7U
         xjM3ZR/HAyeZAddnHB8B9XCYg3zeD5/Otiow1QaHJs3f9I5BO2VbgPO52NCAaM1RAcMb
         oYeb3fkErV8xqp11vBS5e2KA1AR+j+quamxOZNYsHZoshgiSMmy37Xo08dxrO1gk1p0n
         8nAtYTf6OgrLFAXZLLV15YEeRibYtjIBVu73R55qQElGla4nj9arhFQUBZv2w2apfoYu
         7zeA==
X-Forwarded-Encrypted: i=1; AL+hErHWsyqPUACwM+NDY1df6Re0O8m7CgczUP7juunrjh0nvpW7GHZ3y4ZOJaivMFQPkOdw+ths3GBS6Ncndcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/upmWDk2OBmIWJp8EAe3wQJR2VYiTk6rStWptMpQhyi/bc0Ivi
	Q2pAcIdu1Eu/s0ueqlPmTGLvgB41sIQkYiahhMJcuesRkSPAvit2aBm4oab65I2SYECgLmHflhE
	AZqsyBEs=
X-Gm-Gg: AYBFou0jJY0K6r/OEbMUSKUp/j+Ze859Jj5edPu532zh4Oy5MMIf9azQyGj9Sef0o07
	/d1VKav1G3ddxr4dO6jI9pIAXzqGmwo6o5MOLU/DEvqU7bF+XBrxENhOkYDa2kMUwG/xSAhNOx+
	1jcIY7QGU0/DELKUM5M+C0gsTQ5pP8HZ+r1U3nny48uqOVygto3o61tnzJjTBI5KoLNMmzFdc7I
	DLd8TQMAtWy4eQQrTb98RlXd7JuOl+8bj7HJ3pelAGOqRJXtlb3FMi9JgsXmyuMQBzCRml/T79r
	lWfcaYWyGzWlXwfb4n4RhFNXGJJLqitmr/gOo95EJ7cCg7tM6dGXE9SlI7exNqaCiC5lZQhyOEy
	UGFLEs5dXo2PcAHjYLhSGmck82D2N/TSchu/xViQ4NSs/F+rd/6EQmUGuGi8G91PFjJqDud9Oqu
	dP8N/iUhunUusAIrvSQN2hhuzWGDnDq48GMjSUuBRfKGOyAdt3j/eXi5+mtT7+XcQwCJFfId0qE
	ZBjKu15wnGXCeyFJymlYZ+Fg9V81ZRSu/O73TurBX3Oat34unpdA+DZWWcE4aSjkhfwEesM2GVv
	oWY2xeBN83OLl82hsXdZkkWXMGSz+K1HgWRtMmWjeC6SQkPePS597iYz/F5NCKTU3i6p24FTG1M
	9e7bJ98zrzipposVIzGQR3rBZvBREGM7GoQ==
X-Received: by 2002:a05:7022:d8b:b0:15d:fb47:4268 with SMTP id a92af1059eb24-1b503106297mr11912874c88.21.1794883761776;
        Mon, 16 Nov 2026 18:49:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm31493244c88.1.2026.11.16.18.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:49:21 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Wei <davidhwei@meta.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116044519.281756-1-teel4res@gmail.com>
References: <20261116044519.281756-1-teel4res@gmail.com>
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on
 cancel
Message-Id: <179488376079.22588.10998515587766379982.b4-ty@b4>
Date: Mon, 16 Nov 2026 19:49:20 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 15 Nov 2026 20:45:19 -0800, Cheng Yongkang wrote:
> io_timeout_complete() does not check tw.cancel. When it runs from
> io_cancel_local_task_work(), a multishot timeout that has not reached
> its count still posts an IORING_CQE_F_MORE completion and rearms its
> timer. With a zero interval the timer expires again right away and
> queues new task work, so the drain keeps running it until posting a
> CQE fails.
> 
> [...]

Applied, thanks!

[1/1] io_uring/timeout: don't rearm a multishot timeout on cancel
      (no commit info)

Best regards,
-- 
Jens Axboe



