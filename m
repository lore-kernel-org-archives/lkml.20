Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380964;
	b=Wi0gr7znQUqEGfIaZRI25oslcS8lLlkP0lqoclx7qfnXnGpC4rcf7MfpW2q/fwrqYpHT
	 0WsuYCr0GoscBXk1iCHYXbUQyRGZVMvUIiWBoouNn44vKn5Pjdh2fY/0h3zkAn8oFQW+B
	 RObiChoKY8MmvNduK7zMl2kfdjoA2q0Ikx8z7IZHRPaWgDxdHq437RWvTB5x/GvQNEY7E
	 CyPrEQNDjUfS2wlTFavsOKNTTRSSa+VhVmHu5N65ta563U6KNdl/i8m+zAUi/1ZUVZLGI
	 Jh8hcFGqI8mzll99BYycjMQ7pGTzIRgvhutErQsxO5qxynAt7w6RW9PYTEhbC0hi9cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=uJzytUwk23ovgU9TbV1PYDO56P/aKAkqKpMgUmlpTZI=;
	b=CGt7tixjlTkqjTuzOT4woiXSfUHEDUmvEsNh4ber2aT00/DhoNkUx2Lto3pBGqiW8xEU
	 unB5jx7kj/guEmgqgWuA+reM4Sw62K+0+Hl5BBIwVP1wPIAl3z4qKBmsCeRuEfKs0yfu+
	 HUOee/bDd0IK4A+sGWVS9NsO6TBYh4ld25gbnqiEK1BKEw5gzUtJlp7VFYb+UlgcqucL3
	 GgXIYHudDlv7YIYlFhQfqxNQbqc6GvAWVM8mIN3TCr/xvPATpx0nq5E9HH92RVEYT2vWQ
	 jOMbJzWzBuo3XsyaHRGA+Gp9hbMcq9lgRcgs+61nckmez15H5LGe38VzuJtv/5vSbtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzX5ZSDA;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B64B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B64B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzX5ZSDA
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so786776e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380963; x=1793985763; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJzytUwk23ovgU9TbV1PYDO56P/aKAkqKpMgUmlpTZI=;
        b=WzX5ZSDAvT3UHZYgbL8cD7QJcaTmxK/HjuD8vHcV1VasQc9xQ/1M1gJxuClXJu3G71
         0cQx0epuDNOaiQwOWpcS08+NxBBSc0iRr/JOMYt6N5R38zdF7MCBzVPnaISrGxuraccf
         1s3eE0EVkRvBoFQxBfmv3RBoF2ppZMkkpZV63/6aOp87lyYoWXWNlRbY+eY7OGvyVIch
         uTmGcqODp80JiIkU29BFSREd2vV7sRg/hl5beD+UoeSOXoRxumAZoXkfD5M2s3w4pgRA
         i99tmffMIpgo1HnGF21ioAGGFkqfqvumHy0wa/qUyXSE3QMDmYVgml7u35F1CdfOUWBB
         jbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380963; x=1793985763;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJzytUwk23ovgU9TbV1PYDO56P/aKAkqKpMgUmlpTZI=;
        b=VUHf7XhFprdJTrBhxy/7byyiXjkASN697aPdHLfAX+EWUIDK2RKJUMSftwcablx0/H
         fAuQpoFYrP3rAbS8HkH+567+ZG2steDrR+wtPZFc5uudozzdbCXxDA63VqSqI+WfyVdv
         vpIMEEuFPQjCQt0KJNLWeJeyIPJEa5jvXqw5T1gzkZ9JyMx6vTmmNCHIVbPzS8sIOOLg
         IrnIpO85BgmIIOfRxALwKjGs275zSo5tnFY7liH4/sghSydIwWT2U89z0RgXL7a2RE/P
         d6mpPkbD/ecVTs1bLPuWyG8wxlmvGV7OaYGNa+KTFK7WXPVEwL0yUzl5SJ/x8VQ4VImL
         NL3g==
X-Forwarded-Encrypted: i=1; AKwUvBxC3MV4yjNJaW9rTqJSaUHzLq4+nDyJQQarVCBW7bvoIFYAcD0Iub9Zgj/yZqodfg8F6e/AalIs/3atTjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK08OyNjqAbjuuYfptXd2ZgTSq4nkFUKjF0sd7tf55ixs9BCDke
	ciZKcsH7Mxa5oSuX/rzx7UIdZMCVus6EYQkFswwBGmE3wsYUM122jX01
X-Gm-Gg: AYBFou2Tv5isM+KQbFcDmCBkcp92phOl21xXiMsuip6AKu62Hhd+4gEU9q5uAsC/Zii
	51rtpTtdEYV26eQj8enDtZbKRyJ1lA/DduE5uoENWTpjLqud05McFyk0oENnJQeDPm79C0aaREz
	cama8ZqdUvP8OnMslTeKkJ3L2h6MaYd2LYONjZXQoZgCWHc8gxe8rm4258Kchlqqm2j0H2rhXoa
	KROOFPSE8qCug5IEPoKP5J56viXqwg1630OaDpxmj68Hl5xkTnGFFvAoA/vUJKRwDn8DDCj8g5U
	SBi56XHxC40l3FisNEbU+cajUuNhSSH7OFxfhkv4HYzaO3msWsgR0KPKc/V4bmawG8hW4LY0yYO
	jLk7BL3ygtapHjGkoTpHa6i3RVEyx3C0xDb/ROEYkdGzmM1cPQWHGVnHLOAvpGbaZKYps0u5/m9
	vd7PLrRER0TZlf+3WZizlxQcmL8HcBNlH3j4Y/acIk4q1JAvo6oZs5ANwX7dE/NHq2Q505XHcgF
	lpqJEcOaTLgzA+C7pJkUh0jbaQZI21DDdt30ZlIE+eQILYdMUBwLbUZkHTXu964j9nkou2iFSw2
	55T0sFy7xNP+KgszbL853vx1KkUn3Uo2/OlX6qPVhh5bhql+SvhKXndZW8k9tAXV+Ku/DPbN02O
	tLTFOS0ld1uDdY2IDsSXEXhzFPzbWkJjfOthS3sJDqbXRNq/fgizbh0A5OtIwyF/cklOMdlRX7s
	niX3Gw18Dt0spzPiLAqw==
X-Received: by 2002:a05:6122:1d53:b0:5ce:b65d:22c4 with SMTP id 71dfb90a1353d-5ec6896b8b6mr1733742e0c.16.1793380962808;
        Fri, 30 Oct 2026 10:22:42 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:18:15f:b9ba:756b:b70a:a34a:8232])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c99e3csm3005317e0c.15.2026.10.30.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:22:42 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] nfc: s3fwrn5: validate the firmware image size
 against the firmware file
Date: Fri, 30 Oct 2026 14:22:26 -0300
Message-ID: <179338094618.65825.9271330213423582924@gmail.com>
In-Reply-To: <179332821053.3327.2621510890857714130@kernel.org>
References: <179332800288.52644.4206885352837613064@gmail.com>
 <179332821053.3327.2621510890857714130@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

This was found by LLM-assisted code review, as part of an audit of the
NFC drivers that are only reachable with real hardware (and so are not
exercised by syzbot).  It was then confirmed with KASAN on arm64 QEMU,
using a test-only module that registers s3fwrn5 through s3fwrn5_probe()
on a virtual phy and a userspace emulator of the controller's NCI and
bootloader protocols, as described below the --- of the patch.  It was
not hit in production or on hardware.
