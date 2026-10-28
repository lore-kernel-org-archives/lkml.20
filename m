Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793151732;
	b=d/P/M5S8cl7ZnCTR/pH+b5ypcVp/P4nnKBLuX2w17YbWXeYGWzammCnld6AzOnmTnDI9
	 M0vLxvF8KCuTUo7JcfKs4E5KIwEJ/d+sK7Itljs69D+l3DFhtQtKdTC5Neooap8ePoF4M
	 ZSaHManO2Mjpdz62hFryuqhlUDJRz14mfYFNehrivRjQprhK14Zef51CEUm6Gjp9iZFl+
	 1HNOWmElyDQrkAIz1YPlQp1/hhlfqpvufcAesfA/gQFx6Xt/fkC1D9dQNeRXGFhvEEsCQ
	 x6hjy5rNPqgHjkgyVnA/ZRDH1mkqf6muIeLyjmk39AF11qS433h/ZurnrvthQfOamXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793151732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
	b=zMtrrSIKuE2ZV7wzBNNVGzJHClIOp7XyvWrvx2jgfGB/VvjiXsGiOeRZiQEd8j6rr9TK
	 phGFLOu0x6XU2FxvO1YR6nBjMW7u9cOW8EAeq0pc+1/ZtBWYgN/zKdmTy+C4NoFhdyZ8s
	 ZqaffcPkLjjuOym+Wu8FywTfL38TcMyOuq71ET0OenjoHUdEB9mq4ZuG8ELU5XrKdjhhq
	 UMCoKli3TDEpDLa84zpL2NpWrgEK4sIAC7/A0ibgGpGu8gJ04VjP2aoUc4YyuRX1olOhW
	 waCxpX6Wc8bBwV8/LTLiHR79lBxG8QHdM9ysn0m5enzTSgieWgXW7NP/nbpG780fu6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F59606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F59606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so944615ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793151730; x=1793756530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
        b=vZUzLndHuy+VrKIWc8p9M5ErSiqHSTEQkb9wVs99zm6p7KAj9XBh3k3EJ99gprGcZD
         hlu5kMNZsrq1wpEgHoKsjHTnshgWPCuL9yQ95Z2HpDv2ENFjrcbJ3F9SApVkFcXtxQc8
         r6Bv5EqaMce/K2vGnSU2LE25LG6KkUAs3Etqx71TwcdrbSsb8h65TbSqowVvmGyIdsrS
         kR4hgBkWPIADtdHzQu7ywyR3Tpze60Wl0AQOHu6TLljhXzz5HomKsyoCh1N+tURCmw12
         LmSgoPxP2LITXU90NNKTE7VZHx/T4E6aZ3whxPJcGbxDTPNpZXBuZM/QnR12j0d4oXaK
         sdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151730; x=1793756530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
        b=edyzVOSfz0/p5V+lxwI+p9Qj1yM11XbTLqXulKSsLR/3eH+ISEwJcWARblg7pYDSRr
         FK+Lx4rBobTXhBF0wwsb8smpacFHFTqBWT4OozU1P3FBn5nJYS9S75pfcsCbRfxsWNuc
         uv6xloYbWJlC+ug071HVBZ/rXEnMl605sjYwXz/hR/uZh5HSExVyVCKMK4jAjVHbtgr/
         5HHOA0mdKd2kSQIUTugr1Gi7KaXWFlv3jPvBy8OeYDBltqOO0RhRxsiu+w2D+TZhDH7l
         kpGtZjdaDgzuCeZPlm8E1s5iC3FKFLTMIJJ3bivRSvN3+P/xrruO0VfHAD06dhkNQQlj
         Ac/w==
X-Forwarded-Encrypted: i=1; AKwUvBzSFypNRMUeG0Ub34A7/CQrQeXiMNZhY32jgThZ9ndflvJ2zSkALpCe0EiTw/a1fe5jbgZgUHKWCIq6omU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnSVtqrZN6clcfm/lCP7Kaod0DzUacT+M1Nww/5AIANJtJx3BL
	cM6guATNkFQq/LJFajH6Wb08XYMHM0cdzy4P1zW1AOUd6fWAiANJAAYx
X-Gm-Gg: AYBFou1FN020AY1O06uuiZZYVuKH0ZAz80QMKeCvoyM2JGg4iJK/ePeOZFhA3F1Tkzu
	w9n/8BFmz7riJPWsQQcdbwt5QO/gH9HQBjPfW4EmT1OQd3d1OonH1uZy/qwf14Rl8w0GTBibubC
	cQvdJ0bMo+bUwggtf57rjI4LyCLWwaMByaPkpxEe/1/oD0Da1FmBdYj45E3sb6bTP07o4ZrxNkG
	Fv3rodYro4ah6q+58k/F4SX/kCzkhanpg8Xa9sbpeTHo0u501CWAmB0KWqJDijXpYTEMT9uw1Aq
	dQLqNWzHTAExhfbHhVMCyS+q4EAXBCNAjEZ3lHcRtEEsaqUi16BbTYkxcl247Q/FG73U20YCY7i
	HDoxGkjbiNYTi+ks7HFFZuMmWIuQwvOxpuG6SWlCgUIm0y69Xbg00JvBc/9afIGDvwIaUfthVvo
	vIB+orjOeLXVxuGmNQhmwc0vyX9vkmowHha20r+/Bdqc4l/RyaFwWOIvyhkliXSW6icm9Sx9uAP
	bk+v5x8cPSKLp72dlfryDsDSopWcVm3x/TRv1QGq23+v03n3BervO4mW3jsHiL0f7f4bNaPONeK
	T19T2J122ln50N7RmsRjN9TTBXlcMBda
X-Received: by 2002:a17:90b:3c8c:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3ae581811b1mr1020251a91.4.1793151730487;
        Tue, 27 Oct 2026 18:42:10 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm544338a91.10.2026.10.27.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:42:10 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Wed, 28 Oct 2026 09:42:01 +0800
Message-ID: <20261028014201.11057-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7b993a3e-d2b4-417b-90a3-a41d1f454cda@kernel.org>
References: <7b993a3e-d2b4-417b-90a3-a41d1f454cda@kernel.org>
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

Hi,

On Tue, 27 Oct 2026 10:56:44 +0100, Krzysztof Kozlowski wrote:
>Yes, just be sure to capture this in commit msg and maybe Sige7s DTS
>comments.

Thanks, Krzysztof. I'll clarify the hardware design relationship and the
reason for keeping a separate board identity in the v2 commit messages and
Sige7s DTS comments.

Best regards,
Jianfeng
