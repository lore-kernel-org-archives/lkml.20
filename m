Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823393;
	b=SWrxnr9+WuMlNJcdtlyLevugyv3//dmjQ4CWICxxociXp6uLiaUWz4d53RhCN/0oMCUH
	 KzBmzg6+f20/T0/Alb9Tayrk3l31R5OQed51HP4b6RjVoi+jn4uTO8srK+fKzRJ4P0Hpx
	 cuGj6RRCWODzKGaKVL0jr1lBZcsFdnXKVJkIgVIDKvotYhnuBYpiF/TRPoChu+zev2ACb
	 FLS19Y3lX/PpUTcfY+94Su07ostv8hpCtXIP8aLKuzCUyqisYmRmg+d1ebiSCB7lqc/4r
	 awCvtnNTB+VkzvkemVLK+vmZeL1oTRhlFNBV3nG4cM4v6YQOA5vWXUEnsnTzJ9z3Dzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823393;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
	b=RVbSnmH8ZLyCAzrIzUSr72AmFt0oQ2V1LLGdL9rVDRF2eKcJzYAAeGYAM57Ef7OF49tH
	 0YUPwD5kaLdMagKWo+LiYrAdWDW06Vd4xAlb2MM/rYLvpJRh15ZjmDP2TCI/HpvqSC/1Y
	 Rw3Mf3rXP1a3phNtxvd4XxGx5XAs4SYa3jS21JnGrWlbzu2tRBMb8G/8skUcKzPJVihBt
	 QoTApEbebx9wsjxBb46G3BDMiBc5WZZkSyqwY88AiVManigm7kCqhLYknQMLo+W2oDB1+
	 5jfSyg+yCuT8ZBi5uMlC6bubH31/673F2f6laKef1BgoVCsmd8u84OJ1ku3xOn806cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46152606D810
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46152606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so614353b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823393; x=1794428193;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
        b=c3L5fbYehTF7MQ98IVk/3U9oaPCWA7BlPK27w/NLB55qv4XZo7Y5CRGjRQzXHqIf2y
         iSB9R9nn8E2gdOCbBPUuGeQhg5H2ZuwyQFWuO4MRCDE18Z09gCNd65E4B2Xtbo7syUUW
         /qdnobJtFIZcpYcgIoAvBEeOahz9JoEGpIvKegQrxyNKQTSgcF2wS9nQSD355PiI1LXZ
         Qpea5lXKrwJWp0X9Q7UGd/D81Cjr7SsL7LScvMlJ0iLveBJmZaY00jYSgmVVN+/92ueA
         sh0fSuCPXzsoGW4XgEOVPkO2C23tK3dh70igSeCmaMI8GSVP6NppDnHy/f7PWxbpN4ni
         UqwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6nmLcsvCwC3NYG85I/xObHaZ2KPU7TIjmAOe+ae4BfjAGtvqE5eL+DizxHtKY9zQ66bEJaYHWN77vddY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86loRzrln81kXmzGE2gS9/P2qgOamLSiH25vwT9r+/9hsaLkEl
	hS+IO/nt60PgSYYIXnkMS+RhTLzbRHBkJoErFfLdlzm/VlxuteDJjP198RnOVDri
X-Gm-Gg: AYBFou1zBP1QVqDk2nbdHymNbms93z9L6eRMOld7VgvH5otA8eZdCSZZhEOCoVZGff4
	46baiNnlzuiDDlF/zXaXTcGJqz7enbwqsPXNiQG7ixRLhw4PPSdAB7bTqJon+Frq9WEV+Z9XBhs
	BU5ihodi1fP2/X5/UCxfIoKtXCRWcKl4efLyi2mCKmybADQU94QOxndwpP3nRoFvsB7z32RWdXD
	amw7RpMkOAfa+solu4rx6lDmY/GOR1f4S9maVYnUfKvRne1f05fXbQdmMIFTnvX/DfiqqIcu7kG
	LmnTwhT6AQbGBeCb1G6Uv6mnXqxFUT7eIzsqMfUMMlMvSpRbobq9gwOimPCOXBaF+ojfdV1WeSP
	i4X0IR9nprfOnFxbaLgXzF66cdkQXhMVV7IyCUCdR5XFq4a3gbgACNJkHUG1GtvSTno1W5GSWnZ
	4ysVg1PQMwo+xFC27YSqARgjL9LmFyTlSOPx12u93WPSF7PvLoFOIAY0OEBuhaiGbT2TClsmbW9
	GHKZSbqA8XzOgccoyouTEAyIBlF+7VoQ5aXvmxSK/7+kWTVveud9yXaLW8H9pS797Bj98WLjwoX
	smMrDYBGeD6lLyzWc6+B18lcQ69530WXqyUO+N5G79mlzQJ8u7eO4glFBLZAn8Gqpuuftb1X+Mz
	q7fDQo8t2AyNdvYs9uIqc/yUcPCmJx7GB7ipRWO8R37Tf6HmAR1FMtXpLHagRDT5e
X-Received: by 2002:a05:6a20:c70b:b0:3e0:c346:734a with SMTP id adf61e73a8af0-3eb9832eaaamr325977637.11.1793823392632;
        Wed, 04 Nov 2026 12:16:32 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe109fsm1324441b3a.8.2026.11.04.12.16.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:16:32 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a315ed211so1124012eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxhsM4VLRVtr//twcHD1PULY57OkfF0Y40C3Gw2PAhJH/6zh6oI6HF7yEfrQgYiJaNOlSfdTr77b5sJwdw=@vger.kernel.org
X-Received: by 2002:a05:7300:dc10:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36de0488bc8mr1203042eec.0.1793823390961; Wed, 04 Nov 2026
 12:16:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
In-Reply-To: <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:16:19 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
X-Gm-Features: AclHuK_OSxtEYlXiOHps7a-cMZJsR_Cw4vnjS7VT6Pg5ApAUwbgB-aNStGUXOis
Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Consider replacing this with
> devm_reset_control_get_optional_exclusive_deasserted().
> rstc can be a local variable then.
>
> Don't use devm_reset_control_get_optional().

Thanks, v2 will do this. The binding makes resets required, so it will
use devm_reset_control_get_exclusive_deasserted(), with rstc as a local
in probe.
