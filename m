Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576879;
	b=UJ9ZH21SBz2C6pkAquKG+evybeYxTXOg7w1wgMUlBqZ2/fZVRqrpsZ6BQD3A8E2D1S5/
	 dtenf1vMTJadiFuQbtfrYpSPBr67VxCwPg95m20WVDK5Z/INtfB1G6C8PS2mkctLiPOxX
	 a4oV/gcgss4jw0Nb3GHcQvtAYt+LDtllcUqzPP3rFcDTWJ5m21amVs2Toyb9UI2wng64e
	 h9vfZbLKzGMnGgkiyRuseQQ9otZH2xA1dgWuQ9g7lVeroCEGYN1r37W3cj7UaoURWlUsY
	 Hrg8aJ6DDkuyh9aw3osXAgeoEvLTwp3duNhGa6AqYnDHzmFNIZE7mD04WOznq2Mg/ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
	b=Wc4fK1Fqnhc5eQDFY2XQHL4JKPq9/lgCDXXBxKUnlVZsbMEwkDy2sygYjJxbm9bIIcrH
	 xftwLZDLpZRudCkjgHHKbvO7EvdHlcw7/I7BGDZI1fToBGh/PUwzNYbKWhicvx2DCbMxq
	 4Um005R1cbYdCWAPnvDkOSsv5Zy76n1+b+1Ob6I+1vlTfTHB9qXsqyE8mBXPVFKSKLLjm
	 WKfYgO0l6IZZy73I3BJ+/x8m0BdyxXb6FJo4uwmDaUtTpBTXmtTWObbpK0iTu/O7mlLqU
	 4PL34MplY/H4Hw99p2kN4Eg3O7iql/82CCLa6xqlMVGwZPzxVdbEJgbROW1VuPrLPoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZ4uX7UW;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2767606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2767606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZ4uX7UW
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-99061e2171cso163522241.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576872; x=1793181672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
        b=rZ4uX7UWbJ1O4gUwJRxBqUzt7zn2jQWxTGl1OSySTdpfU/gL3vj7nsCqnbD6z+3NwR
         l1N9zREAkxd4QsL+o18pxEji02PB3Lweo2orpvKeugfr0AaqhbihlsKzmFeRPW85hrEw
         9heXvLYAL02cnn772zK9jnU4fvgxMs7NkfakzCE64z4AJt55mdDwCESZ0LJnGQii1VIc
         UugeFvnp+DCoLuSzu2uGSfwBi0MAspgt6RD3sHNIgrxAGbu7KT1y0udfuPkNMne/N05J
         lEQlHPw38MBMgsIncyyyxisPOVCsLz/9CtIDJmlwl+rSjYtt3eu74YUGdu4wzQg1fohY
         9Qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576872; x=1793181672;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
        b=waR5KeZBqMrEcdVWhWlp/r9HyoQ2pazqzZiJOGQlZgX9Z5gfH+f5h7L27nPVjFeGMq
         scB//nw2e2ACnl4NrIDcluUNptFreVy+x390gnkVYCHHH59zEFK4jVC32LYS/4OS7bms
         oRhFD/Cist4n2htG6Q71SS20cut9TDR8dJ/BnxJ54PUXCj9f5vk09Q0kRTePjUczv1Qx
         dbvZqccVE8gqWpvRF32mrWQhX80FMoOd2XlY4HIsky5dbQ/bHvwJZ6WfHJovpREt41f6
         bO1if1ryPNdeygY/3jEOY2PSbB5HopPc9uO/evQfSZsisi9Vr/IC4ypGLJVqttVz0HOj
         0htg==
X-Forwarded-Encrypted: i=1; AKwUvBwhpJLYdRM3+b0V+UIG1YjucXCBrHmpCESvGkCk7wXHnHBFH6rGqHJxinPxo/7+P79OoZLjdETc3uNi+Cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhOTCJ3JNBtryCU0XZADWFkcQzLu9gh1MgF+3KjM/fmTRFKv0X
	AX8fMXfqzWtRDGp6oc0q1N12w1oXcfydmaMje/klWslgSvAOwtK/PVd8
X-Gm-Gg: AYBFou0u+ihoWEaXxkYwEF6ifkue91rSC01JzGs8xtQbzeopRkhI2BZnHeSm5t/95yN
	iDNXprfFsrWhh5e83AZIvcNNL0n2rfjfi9BbZQVH/NLE//mV0v8uVXK2qkelc+7+aJZOmkzb8Lt
	GcodLpUlQ3fNfjAQ6s2o1lMOO+hs8PD4M3T0gmhIbV5z7/GGqZI2EVxULOtM24ZI6y7n+4d7NTH
	5UqXpmqh5CNr4WfDyc5Fe9iMiuBcgDXjNhme/DXAvNgQRYYjllNaqUQYQHnJX2R/oL+2wE+FIFX
	82ut7thTV84Mcanw1bu+SxF3+eSdpJmPvlO3r8ghzBWvtYlI573AEvV06nJ+GSn6UH4PBGjgX2u
	oNK6Ydfeoh27VuHgYI4DfOPnAa8NFZt3gM06ASnosc/TYqoboRSm+re46hmAN9apyFJf9u/23AG
	LyG0HxaYsyvngFkx6tisSKZgb+ZRPQUboRoYdru8FEhHxtDOC1RO3rdGWiQTOb4B/lUehuWUgHG
	EXK5pLJXKfHP2li016tdqJFbTMgTK42419aSSY8eDU2tT+0Lbs051e89biI1x0vgkC0NntuRoa6
	qX8mXJ4TFYG07xNE2XZMxUCMiRfAeRPCKN0cDi53N/WMhir3ntArnFZDnD5RwTs=
X-Received: by 2002:a05:6102:4187:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7cc9273dca8mr461720137.22.1792576872539;
        Wed, 21 Oct 2026 03:01:12 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d118d522sm2526812241.10.2026.10.21.03.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:01:11 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 07:00:49 -0300
Message-ID: <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <athe0QikG2mzCAtd@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local>
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

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Right, but have you read my second question in the above paragraph?

Sorry, I missed the second part of your question.

If I understand you correctly, since 8250_dw.c already has the BUSY-safe
set_divisor, you're suggesting that it should have the matching
get_divisor as well, instead of pairing it with the dwlib getter.

The dwlib getter would stay for the other users of dw8250_setup_port(),
like 8250_lpss. Is that the structure you had in mind?

Thanks,
Vinicius
