Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149898;
	b=AJk+Fy4950jrhYDnx6AzFNjPO4NbZT1pXRQ/gDGQPXX9eXb2/08wWJW7SucP7vpsOM14
	 MDWzlj5KQ814a046rCPzEgfw5FyXUJRNCXo73LzlGOIND8WPz1oJlHOpFGZVErLByl4J+
	 Do/0a0GHbuuekCbht+Bnf/ED9ZjDkYCOwTEDz89zC7x9EsiYS6+1yZxv5ow7/iz4rTU8j
	 xKh/c9EvSVe43k5TrlEDb0W31rmN3QSvXhSqCVJkO0mJqql4W7EehkInrDEso1vRb4Bux
	 69qCBkRcmu5toTMFT6pMQmjPwiEKm5YgfxZNcnoyBMtRo9aBc7ivIyJgRw2BGJ9kuJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=zg9wHbUjOFQvCSSXrqJHlgr9ERwDV2A9O9zK2C7wcfk=;
	b=fpqpQRWVD03YEfrUZTiCWMdnmZaxr0EugsnCFJCUk8l7o05TSmLaSxdyqJKjFAyA12Vs
	 eTz1jig9YrmoFtEWP0Lz3lmg0UVQKvlo6lfMOIDImruUpu3rFloRHVdVD1jPwVGUlg8Mc
	 Y0Lx+oFA8CL8c+TfR+gQPlvYAizJOPv5UoDnmoSkQQyLIlksnKkUv6Dp6BeY9yAXrgdP+
	 47U6BE5CZX4DTVPIHQj+9QTnIsqJF+/AbqRHvEX6pj1RJ3MH019PGr7rAKjaEdwFT6MWW
	 b5VQmy+nPj2VlDwXO+OI+cdYe2BccZOtDdKvU1qEFJMtVQh2EvjLuy4WVq6qieG8Mgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HcS6u0uI;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75969606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75969606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HcS6u0uI
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso28346e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794149897; x=1794754697; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zg9wHbUjOFQvCSSXrqJHlgr9ERwDV2A9O9zK2C7wcfk=;
        b=HcS6u0uIhoh9TG5kUk7m09X0xPU9+Mwuv4H0pil3okKllS/JbNjw4JddmRd+KNy6rK
         6/COhsGqCao54mkTwsKK9Ew5gFfF4mCvIs0G8yLupXu0KtnG7vtUNEJp65CeqdORuhNu
         xJR331SS16VS9Nr70KyGExUhIgkJdTDg2mv3rPNv8YPtv5LTEA5Oww/EwRNez94dNV1i
         VT+kz2lxNqcPAokFzLoY+z9Z8PT4grgBIBs8Qop942/G+pKgSlh2DBBqO04vESPqMOGg
         6twqXRKFO7dIFS7uVkg0bMCoeA4K5RTedfCOEglxORHoK95jl1CnL6qcUj7o6i0nYNO9
         6kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149897; x=1794754697;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg9wHbUjOFQvCSSXrqJHlgr9ERwDV2A9O9zK2C7wcfk=;
        b=WceJEcNWYDNlNFk03DPegUEuF5ggJ8GdbnECQrXQ5DaDK5Y9av8Qd9s05dLofiVGjF
         jgG6AVj9eDKlIhGtUAQbEaY7xt1yA5PZe07iGbctWdLeiZDLmbWoPGnVVbA2/b4E1ayz
         HNj+qd8Zf5cU48Gkvcbh5mBtMmPTAqVn07oozRKwiABQNI6RKtCeQkUHgLM3NcA0BUc1
         9NGIF6tsd/dOly2WHktLP/VFLhh0m9xQTXMZNpnCV4pJRfNU6rQd90Z1UYNmBCDQ6InE
         5cyiSAX3E7L7zuCqsNfR72nPUYVg3NI4EKLAa2zQ7bdkxrSMQNweZzS/GJtjtPBimiwB
         3+rg==
X-Forwarded-Encrypted: i=1; AL+hErGgi9zn/D9QMCFvEvcRYlKdS6U+2NRpHmzZvqPe3EgbeRYImUAjar8g7leUWuov8pTvf2Cj6xbwVwS5tBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NL/BOYaM7futxvVnYwhSqcWfQwxg2HwcqCP3K7rRPCu+RKeT9
	1maKH43puwN00rZMiSaT5XQURSSuFzDxGh5Ex0ws1h/QsFI7yE2wHLjoUZttbJCnkVI=
X-Gm-Gg: AYBFou1v2u5PpgXNcV1ZY/CGnoyeBbmYX73DvUP7ugCcBE2XfflqjY0cDMVs2ZHpFCl
	9yNwplIXHoIYqkTrhmyWMHp69Vki3UACDfkDPSzrmkm4Q8Uy9rS4VsT6Ir1W2uY/vwQ2+3ki8gG
	mdSUX0jUfnqQvE0wx8jQja1riiwtgm+fFw7SYWnHa2vOUJcIvgHi+phhKw+uDXV/bXnBDGRRXKL
	vzFNsO28QvadrclZB+nyrYQ5ls0UlFssYvEygX6gOEm1P/eXbQZ7voFr7/UFPrYttdeAZZdUQXl
	7yB6//2OjiA81VRDcOA9UHmULfnr2O4gBkYwgjZrF7HCSl9yOl7I35qLi96piuSESGwfGsOuMAQ
	rT/dSxiv8fR5oI/7hOxQkeE5KXH/VisVsMJnyxeKE3sLtwke6WI13Wc5AWnWKYgaAR10VKDEePt
	RqXaMmN8iCmnc0b+nDVRH2SnNLbgAmlSKGI5wjJJpBtIe0VB976HX+J7V1IQK9oNyGpO1UyjAZ8
	cnVMkNVMZEG0R2h8n3aFDHQk2GQXWiI84ZH0dm+KgkuN81JwyoSl2zXVaCiJzJN7GC7kEIxfz2E
	7MRPbVEmdL9rYbmK11FN6Kr9KP/7SwYmuWwWPwpsmaj5sP1NoyzRuGkD5/E+CPLKc/abB24RYvr
	TEx6NGjy6iuDeLv1EuKGfKFHw4RTir5Y=
X-Received: by 2002:a05:6102:511e:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d2db193714mr282127137.21.1794149897376;
        Sun, 08 Nov 2026 06:58:17 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c02a108d6sm1838855241.7.2026.11.08.06.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 06:58:16 -0800 (PST)
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
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 09:58:14 -0500
Message-Id: <DMPX235ZQEHC.379KOADR3QVFU@soleen.com>
Cc: "Alexander Graf" <graf@amazon.com>, "Alex Williamson"
 <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Jonathan Corbet" <corbet@lwn.net>, "Josh
 Hilke" <jrhilke@google.com>, "Lukas Wunner" <lukas@wunner.de>, "Mahesh J
 Salgaonkar" <mahesh@linux.ibm.com>, "Mike Rapoport" <rppt@kernel.org>,
 "Oliver O'Halloran" <oohall@gmail.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Vipin Sharma"
 <vipinsh@google.com>
Subject: Re: [PATCH v2 00/17] PCI: Index saved capability state by
 configuration space offset
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "David Matlack" <dmatlack@google.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pci@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261106004218.604799-1-dmatlack@google.com>
 <CALzav=dOnBUdYKN8ucD8tMF_5RuQZOzYG2aW=K9Grd5itgvnMw@mail.gmail.com>
In-Reply-To: <CALzav=dOnBUdYKN8ucD8tMF_5RuQZOzYG2aW=K9Grd5itgvnMw@mail.gmail.com>

On Thu Nov 5, 2026 at 7:46 PM EST, David Matlack wrote:
> On Thu, Nov 5, 2026 at 4:42=E2=80=AFPM David Matlack <dmatlack@google.com=
> wrote:
>
>> Merge Plan
>> ----------
>>
>> This series applies on top of v10 of the PCI core support for Live
>> Update series [2], which is targeting Linux 7.5. This series is
>> targeting Linux 7.5 as well.
>>
>> Both series will be merged through liveupdate.git, matching the
>> agreed-upon tree in the MAINTAINERS entry for PCI LIVE UPDATE.
>
> Apologies, an update I made here got lost. The PCI core support for
> Live Update is targeting 7.5, via liveupdate.git. _This_ series should
> probably target 7.6. I doubt we can get reviews in time for 7.5. And
> as for which tree, I am not sure. This series is mostly PCI core
> changes, so I lean towards merging through the PCI tree. Only the last
> commit touches drivers/pci/liveupdate.c.

I looked through this series. Even though it is motivated by Live=20
Update, it is primarily a refactoring of how the PCI core saves and=20
restores capability state (to make struct pci_saved_state compatible=20
with Live Update), so it should go through the PCI tree rather than=20
liveupdate.git. Only two patches (12 and 17) touch=20
drivers/pci/liveupdate.c, and we can Ack those.

Let's get the current v10 PCI core LU series landed in first; after=20
that, this series can apply against 7.X-rc1 so the PCI tree can cleanly=20
pick it up.

--=20
Pasha

