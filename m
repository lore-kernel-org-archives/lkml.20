Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992468;
	b=Sfk61fWkL26DPJm1cLRaUzd5L8Dni6FNUs8m0jIfRDrrbCpV6koiXFFozyz22qOyWTli
	 k247UfkJeRMBpIS6QjMZ5o5u07Xw5InfnlSSVhtV86Eyu7wQ1mhepwm+Uj2UE31srf+/O
	 fZLHj1nlyeGUWFiQL330k1k6S670whHUNjzj1sC+qK2Y/SxE4T/ZKsNpiM1HsPmh6Rm/Z
	 Y3cVQwDv7NCuroONPeMXGJTR079qPIJPjNWRGSwJW9JyMbMFk4OoxLpPoKZavsxche3gK
	 dqr0ABGRuzwLzfT4I+NRnwzZ4TgNJkUe7hnCAO2ILnNG6Mh/7CMvYq/lb4pj4G6nS1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KJHbuu9YNunQc2098aJOeh/4wneftBInLaZd5ecyQ20=;
	b=0DZ1kVHqjowL+J6hoOCRmw92rFP61FiYJkVDqmMARwS9Aw8OZTJ8W9ncJFLnOduO6WQR
	 BUW8RpYQJrkB+4rMPY330KJjRHASwM+k01oyoqicrYJgjvXFKxdxRHyXmaO02REVb7PBw
	 uNJTr4N5o0UKG8yR1B82mrzFlZWWwp+OIFYDQXrUx81aYCDJQ29oh6NtsENs0GxUYT4rL
	 s4PzbK5Cx8G164Aeb+gGyc+s4eFHSlFYsaNF/kOwqjC3bA38vl15oOPlW4DhQ/SbvW8iA
	 lIoR4Yb0LTZN4so6svJNiAaflPMVKshGHHkP+LZhbL2Oa581TBndjp1/5WNljkVGHUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cg0E+dri;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C862A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C862A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cg0E+dri
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1517bda04a0so2666373c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992467; x=1793597267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJHbuu9YNunQc2098aJOeh/4wneftBInLaZd5ecyQ20=;
        b=cg0E+dritt0P6TfxAW9Q255khPeEmu+69fU8a2+/61exzipudfLtte3lz6pHT99rWJ
         NYh0W4TJ029dbTawErQ+RMpBmQSz611482As9+CYIbrL8/dA1OIcBJkDJUQtVhq3uKft
         8Xho4cBVbfyF3g1PoekWa2iOGxAm3ryDdP3tigjYTJU89NCwQVhS7FyZ/CTgfrLFDkts
         rbNE2r1zXGpM+8Zn07zrtdJ8ntU6kprsxSvad4T7fL3WFTq4nXGqK89wr56ZdHihhPSN
         gebvQ1afjV7bvIobenNv1K8k5v76Yd6zWZXiWvWLM4QKCNB62wf5aWZ1/f3BsqpjZdOV
         NA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992467; x=1793597267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJHbuu9YNunQc2098aJOeh/4wneftBInLaZd5ecyQ20=;
        b=XhftEtM0go8mk5NoarvN3x2Kkr1Cs8kGMIZhQJlaSn0WAuIscBKwTs3IeucppUagSr
         Fi8KU21jpHx9TIGjg3Dwr48cMoq2JxDoGOnWyH5tCqVUUY4QjFDRF2A3Pp27d/3W2jH2
         DCQBPgUldG0TAzclgD/JkkEN3/idbYlp2Fv2XFTvB79FLxk6v6+Opg/TwY7b2XlM+mkX
         h2Sqzx5cvU1IASj76ljr9zpaBj3M+txBKyYNyernOVQ8e250HqzWpO070nfqWS1Uesph
         CvK9hb0LOh/iChtvr5EqbB7WPbBBK4L8dOLruz1pb+Ir8BRg4p7zu23lUXHXYjggBKU7
         s0tg==
X-Forwarded-Encrypted: i=1; AKwUvBwP7YEtz85rHSEeHj9aKonMrfUXCOCu+mPYQCr8kdvSQD1fP3I7AjGByQ/OsAR0DOEfBUZP7sv/h5Pd4Qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFDAoQz04bB5qZae28vQa5tPcFIi1PccrMaGs1+U/kIRy9qcTO
	ik/Vy7PaxAkZiO0Dz6LqRzh32ufoK5XDuFZGmRg7V717WZEgZhAGfQrC
X-Gm-Gg: AYBFou1D4ZeraFsxXEAXA0gH50pZ5XhHOds7y6CrJoqhXMf68V5mGP+s63T3+QoyTti
	ZBlqyLuCb4++SnzRJFPKUtri5NI6q7B2g+S2ob1CneGMDC+azsarShF0sy3Dc4LONND8cXDdHWa
	PlDva/yMI/+swH7JYmm6kgfsy88Wlw5Inr5AAt+en40ymlWWCUljFDT+YeugfYJdBnMDX5SPmV2
	kixuk6x0aGsm8RbE2PmsTGlcCHgFxv/+EpnN/t86pCbvSxiC0cV8n6RAHyBm+R9Z/Nq7IXSWBT/
	5mynrtn1ASa9Abczk23qWmNM9GieWdhD+98ssplwazqJPixeCCgKJshSwxN+6aJpfkDEN9V3Brh
	DPgIBrxXaQwgxWZQrzlqBJRM/QFJQ8JNLE5RFgMUoL4iaSgdqo0r45dp7cLq0ZjuwiLlHhd+VNl
	YbgrMjFPudpTUikKOgJjJ4LCNgvsuOgcpsiwjhRlrDCoNUcTGan5+dji0gWBMmFqTo//eIPyo8t
	YvcKxYxIO8qKjtsfxieB+Qq8nhp6BxEwtTnaaGX8HRRktynJ2GjNwrqTjSZDpeVIB8xqi7pJxFF
	4xbwIYOtipLlolgBK7gRDDhK6w==
X-Received: by 2002:a05:7022:3a09:b0:195:76af:b810 with SMTP id a92af1059eb24-19935fc69dfmr10272975c88.25.1792992466519;
        Sun, 25 Oct 2026 22:27:46 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm29188566c88.4.2026.10.25.22.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:27:46 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net 3/4] sctp: don't treat an I-FORWARD-TSN as an association reset
Date: Sun, 25 Oct 2026 22:27:40 -0700
Message-Id: <20261026052740.187459-1-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179293012867.3134.16497481637722705271@kernel.org>
References: <20261024120627.837568-4-tim.budding@gmail.com> <179293012867.3134.16497481637722705271@kernel.org>
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

On Sun, 25 Oct 2026 12:08:48 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> With this call gone, sctp_intl_skip() now sends
> SCTP_PARTIAL_DELIVERY_ABORTED for an I-FORWARD-TSN at the leading edge.
> Is the pdapi_seq it reports still the message that was being partially
> delivered?

[...]

> Could sctp_intl_skip() pass sin->mid_uo (unordered) or sin->mid
> (ordered) to sctp_intl_stream_abort_pd() for the notification, and
> keep using the skip MID for the flush and sctp_mid_skip()?

Thanks, this is a real bug. sctp_intl_skip() has always reported the
skip entry's MID, which is the largest MID skipped on that stream, so
for an I-FORWARD-TSN below the leading edge pdapi_seq could already be
wrong when more than one message on the stream was skipped. For
unordered streams it was wrong whenever the abort was reported at all,
as the old check only fired when the skip MID was larger than the one
being delivered. This patch removes the path that happened to report
the right MID at the leading edge, so it now shows up there too.

v2 will add a patch before this one that does that: report sin->mid_uo
/ sin->mid in the notification and keep the skip MID for the flush and
sctp_mid_skip(). The selftest will check pdapi_seq for an I-FORWARD-TSN
below the leading edge that skips two messages on the stream being
partially delivered.
