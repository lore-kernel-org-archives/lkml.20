Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165948;
	b=nSfb4kFdMXvc2IiKpGbwupKsSeQOoxLYeyzeZIfE76ZW7lzgHnftHZwvfYh4+SUodi+C
	 uQcAJJD4O1JUWqAl4SuZRoGzYhmqGCvPqlgbv1e/YMWIDKS648Z6hME3AbnzVk8Nxzrdh
	 yWjlTdK8ewiCBzzg3WxPIxrYozcussXRl0gqKDbeSNlmNlLGCf8DzKk6B2bbz/avQTjmv
	 lB9NM2GGhE38x86EQBpKkqcZxWQJAsss2imq38vQxz4AZZBGHuqMv2pR6Vve6elIcmir+
	 yTTfrklWhWx45dSrXOhqEtjhK+UHwllCZm4+JpUgigW+AD0DxId6jmgx0OhwtCO8nQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To;
	bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
	b=2GaBhuvnGQRn3KAB1K6UN5iagLLybGD2Np65fRRSpsa2Sb/2bXkNKPRh7MnpTl9FFIPd
	 nliu79MT7noHYoe0+WKYn/aia8swm7+N9JVk096rKsprzn8b2aTmBwYkNhsM425NX8/bU
	 PqzIfHFc6ZSs3auvwdcYqWp6k49YyJUdFgVDzYbjujLJmD5OJDS5OU+h4hCjO3OQ97+la
	 oci9ANrpR7FTk8W1eRr6JwTluRdxQsgfgxTC7PE2YtYx0BtpxhF+wxivkA2qWejJyr98V
	 nRnZe6TxTkqUbg3sgiqzQbLxdTTceV1M9bw/NzwVOnW8chAh4URnCHqzUR3LdTCme0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSiv4TuA;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3271606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3271606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSiv4TuA
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d7d591607so34103666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165946; x=1794770746; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=WSiv4TuApj5w4HZ50fhfgNst1yV6yzNn/XhgbsQuSgTm0D/HVCH4udeCvKUww6E+U0
         D3N6gs7Usyy2COHjh1RqeQGWpr2skW+hn7epsen7I7xrqYqFTEdbosd+1UWyeCKmRshx
         8JPu6ci7480u9eMj2XPPDmzzJcdd5rsQR33Z5a8L0no+54MDf6arQnvG6cwRzKOyQ/wf
         8VnQG0sN7CnI5yvoG67OJ7bwbiRqH/j7Kqt3StBXm6UkhPd7HulEHPLx40qWowz+IA7y
         Yj9eB5wyBSFmMzhXc2iYzgYS4Qh0XzHhq7n9ToLj7gD0BpKOWW80IVuoX8DQebPToFGZ
         mPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165946; x=1794770746;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=l9U5ssMU3g4SDbDNsGC56rsnmhqyp/pfmV/L5Egqx8jMb1DA5sJrxriucPiDMnvVqS
         YK1PJVjsgwE+iiGq2Jfg7R1/yCa258eLKBQGuvmCW+RJQStUvfJ7ctbqilj6KW95Ss11
         Uzw4C9aB1Cg0gCbfTs4dMtLgJ2iXCHo5B/OKhsHxBQ5uhkGYIfdp91qUfMkydNraQXG9
         FIEdUriYUGQifPLA3Kbq+y13H3pNGhZp0Tg9fCNhFPOvauG5t0UACRyOIw1+sA/LtACf
         DaLhx/iXedr7B3QBvdHcl+zZu0sPrwpL/oPg1UF18KqstkaQqYTtTuLzzUjzoCCtNRgz
         cuDw==
X-Forwarded-Encrypted: i=1; AL+hErG94nb14yNMflurHgS+Xh/ve/gqKFdpalmlKMqN5K6hYwAwVbwBmVDFeq+pICQ9Vq2e2efxVvS2DoN4pUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aZtxBzH+Ea+j9aGZTo4u2pBgGV5UY2Oja1ThXWsFDzjuD59kU
	lK09Te124/IK0dRq06uqfAXd5jLqNsBrQ1s1I4USAu3Dg7MOkPjFGcz3
X-Gm-Gg: AYBFou05In9PqaplVD4Bor5IkaB+3EboUGH/QXO0IW+1fG6RV8NtPbD2Z3QnU5JDLxr
	pDY+knioXi1QGfroPh2vRIFI6uFH8G22egB1Nndq7EvIHhh6dfmlth2zraSpzKmr0+8l0raWmGR
	fED4hQiyfYVKc8x4JXiu8voRvv85uYAAUI1/zVw0dj+9t4o1O+GpEH/4KAEHdupybx22ZIOWXoN
	pg1sNpBbAbPO0WScZnZffnVpqBlctFNy6scVf3GKwLquGvoMNJ/LUU2jKfCYR4b6csltmjBg07p
	dtJzfCJOGqQH5BikvZV8CJwTpXhBITAX3Qt8/WdjALqLpgBY5bufJrcnGtNaxy0YkNJ6+/HDkK3
	PsJXUmsrMaAMElb9umeocTOxp8Vk8ilmTAIxogHDXGWmdsZhT7A418xihsKrBQA2f5Zuy54jPua
	zvr8H+vxLvOIEpfpZav23Atvtpex9HuIPpPqEr6lkjmI7Yr/8UXXl8iwoYXRykEHR0cB0e81qNk
	JdRDk1Z2+eNmCpxcJiUkGIpekg8Pk3mPX1SrhrPwIqxc9KFLl53c3rqnZQbibrqv5gpFEUpsFPT
	QxPz4IJIbHbCOafzHlkr5xyqtplLAHyf6oX6deNqDi1QNrxL4xytaci8
X-Received: by 2002:a17:906:794f:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c4d6d522af9mr142299866b.23.1794165946088;
        Sun, 08 Nov 2026 11:25:46 -0800 (PST)
Received: from localhost ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a5asm81036666b.72.2026.11.08.11.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:25:45 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:25:41 +0300
Message-Id: <DMQ2QUT58NN6.10MAQ6P7FML2K@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: "Linus Walleij" <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
 <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
 <sashiko-outbox-203909@kernel.org>
In-Reply-To: <sashiko-outbox-203909@kernel.org>

On Sun Nov 8, 2026 at 9:39 PM MSK, sashiko-bot wrote:
> [Severity: Medium]
> Can mtk_pinconf_bias_get_combo() and mtk_pinconf_bias_set_combo() read
> past the end of mt6895_pull_type[]?

Right, mtk_pinconf_get() reaches pull_type[] for the virtual EINT pins
227-246 via debugfs pinconf-pins. I will pad mt6895_pull_type[] with
zero entries in v2.
