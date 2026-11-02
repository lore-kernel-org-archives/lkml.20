Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589903;
	b=xqvrPz3ye84EWpwNqv+3kqRYTNgABVBZ+zTj288xhlKEgF8Pqx2fk3vgJYTQiWjzDNuv
	 20O0J1fEFGqoucZqZ1hwTh0UuJ9o6NTPopC56IoKvnLJhGsetCCGp9TSqHKSZ5UOptRrG
	 XMJk9juQYSgmru1BOlyeVUXxf/f8Wzx7HOMKqBeiAY9OSWJno8GuP1AJnNYDR75tcxmyr
	 kxe61YaECicv88LyP1G7UwtUgh3PgYKu5k56X9z7dAB3e0DIZ1YzCQvw7gBLs3YFrez6H
	 /PpytMBOnvbkHXBS49Cod3aCsLuVWOf3X4RqlJvnbF8T7xEYSePwNwRZq18SI4P157w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
	b=w14dsfcYpz7mCjyj2i8bseaixFFYQ/OEW8yyCbuYEb1/CEh/EjWExsMQE5M1lofqd9v1
	 1VVjsVUPUAoqHOeVE0fxc7V96a+Xxd10Q0TEf37wIm0t+RJ9aJ1zmCdT7HEG5WD/wHaGa
	 ssFdgiiL5Gl9um+Qs9X8TtEkssNOBC0qKP5CY7xAWz8JPrjxQP7G0diFzc/lbJfxez1T7
	 lM8CqyYcTrNq35Hdgye+qmPtSG/6w3PeRoUyGDAuif3PqwxepTj7YpKbpmI+RzH5/h1a/
	 F48M33EQuDb9WUH2pXsd7hV/TZlitwtXLcOFt2UKc5Py2u9wcgaKXPF7mJpTI92tfbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUrMkkDg;
	arc=none smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0829B606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0829B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUrMkkDg
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-702ba2fd61cso751618eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589902; x=1794194702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=cUrMkkDgUhZ2oFqr/ht1C6GIkzL8jnOecTg0iysKs4K0V0mxwdwyXY3xWu98lZpSNJ
         Jnt2Ef2rl+7W51+MUtYfjfKGW83QauEE5mW42k7QWGOCmUVJch91o3ELG9oKSGA7S95u
         ALxRO73CswZIVDGpUX7qrCJ85V/7lapjCoChdK3be984hrVvQ/StzgimZbrTUpKQOfbK
         3SCKaRVR2MopzLBJSiozfI3ZYobPcxXpK9/M3SDTeeXMMKnfvdLBZMvTZfdKdV+7cpWc
         NrXXlzDVBH6n5L03Pq6fmOmZirWYuoUEVYULgrxD+sVDuTHBKcFzH+I6oPit4BX4rYXr
         Ozlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589902; x=1794194702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=u8fSLevqN2w37vXlFGOM0USCN7ucKcyFF5U4g+JPNx5tsQ6OpUF0g1GfWF0Dzj/zaT
         NQ09OQeBxdOqgVeTrHFVGCGgn423M8efz6NtksxKfC14PUSfR0Ej4NEIl/S0k4YEYkow
         8nVoHHr/bSxgTRkNM2RaoiaskG9hSBwzCaGRaJZc2H5sKK1W8JtoLfQNkMEtjJhpKA2v
         Aiu5hBk0XiAH9aAewbkVD1erGGIGgpTtWQJ8Tewcb14UBGbf/Ue0wgeCwHhY3NABLuD+
         uB1vPsekCM6wbi19Z9xstFhFXuztd9QB7uXi1xq+6Yp4I68L9bSPOeWokLyFozi6pBcD
         YJ7w==
X-Forwarded-Encrypted: i=1; AKwUvBxTNIBtoYDnFN9PN9gKmWMr91iLn1apQgBH33JvbnccLNujRgFprACGRchmwHFluHAb5vMaTcEK0a8BPd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu8vu2KDerr1kDUBZatUBQ9xFMFmgnvpkIVDzsGKjb4KwwaQf8
	vSZPDhl04HEI/V5DMUbRla/lJPSYuOkq+eT0fj4ZWJHtfVK1yu1sYjAu
X-Gm-Gg: AYBFou3MzdtnV2Ud//fH7Ww4qF3LwXPpkNKUMTYPG2zFtkLHf837bK2bYvpwemQ6M3N
	pQqe3ak/ihabKZfPZcl2SbL2IPfWf9bIVw8BlZk+BRUzWf5x6efpZpTEWAMaNMPTsLPa8k85MCx
	o4SCozhvhYSu36c1B5NeOxAMWjz0almMHFQBtbqbtWOLEzAtN0lw8woAaXX2TGudWPPTBAQBZCk
	oVl2JZ56V3Np0PwZRrmGafzLaOG80VagJ5G7nh8cKOxj3G749g+dRlLbszZ1dwCOqRrBV0J2UA4
	kwba+ck+pv9rGBGSu3cK9+2ifRKVrCfEMvHCob4/mcwfO2DJFzg4AilDjVLgq68wzie2LNhHhwJ
	Kvm0GNcC/CO4skCkvMowPdz/YEeBBkPYSJYz0c4VA4S9Nfj4B0YNBGU0hOABUtpuu11oAzd+m7F
	nBXqha9DhChDMNZA4quk/VhDt8DWY2D+Cb8mwAiU6nbjKGS2/2/UZxxCVsvhoAYkNpgGEjrEevE
	T/LSlccOKJj45YNu6KrS+dWVglPDSsb/1WYGmi54pJ+5CrdnHvVTkiCVe8hqtuw1rL1261YzKj4
	Tq6mPT+9yqaqEGwTuA865Hc398WvSw2KvWkad6qixPWG
X-Received: by 2002:a05:6820:168a:b0:6f3:6cf9:f182 with SMTP id 006d021491bc7-714f2480119mr5364303eaf.50.1793589901912;
        Sun, 01 Nov 2026 19:25:01 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d35499153sm8255830a34.9.2026.11.01.19.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:25:00 -0800 (PST)
Message-ID: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
Date: Sun, 1 Nov 2026 21:24:58 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Gentle ping on this one. It has an ack from Rob and reviews from Mattijr 
and AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) 
that I'm posting for 7.5 uses it for the volume keys. The patch should 
apply to input/next with a three-way merge. I can resend it rebased if 
that's easier.

Thank you, best regards,

Ryan Brue
