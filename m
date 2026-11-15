Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762094;
	b=bwbz8TUqpnY1jnEES0eTYbvrOQ3WwXI38+timZcd3eI4JveJ6UelxqbW1pi37p8Qg1aM
	 0vMLlmYMchhABUYVFOuP2H4qIdBmydzg7DAnf/477P6AG0Ud+meOXjvzbC4CY3lLPfRUw
	 I+tJWXc9SK9DxJ3QkuiAuCo6oNAuCSv4OIOiQppIxsK09vQ70dBxsJRa4A5bhb/FWTwiR
	 vhptYP5CbwfjKHxtaqCuZQIzTBzkuwPuJzxVY4eM0t7UmVRTotlZLr8DHLWg0N6ZYJmKz
	 T8cKIzhZuzmEk332T/NBYkGZexuWQ8rWP5IfbuzYb391DoSFCCLjycG4gncQCv17UXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SVZwwH4W1zKgtEsp608WvX3HiMcrtY/DDmZr7nWB46g=;
	b=sBliJyaw3tUhQYGdddP5CFl39B17Se2cPD/bRPHjWbHVGVKCWtLt0uvIvRjOe+IHlzE4
	 LFw67K6AuxxazP+xd0MJMynjrJ08M02GJY6k+8pQ3VoVgbonPksJS5HNm2O4Lx7KFaiSy
	 auQrA4L6Cy+4LXPeOCyBTRtBJ46PfUlTPhXYsQxwHi9mqdradfwvMVvvTNSI905IdPqCE
	 J7R1z/ZZ6fttdNjtvhrtqtP3YZujgwBi+X7j13iQqkj9KHY15t5enBAoxVaQlUdkMKbTw
	 4uzzTW3yOX2w4NRAvlIqmQqs+jE5HjbY2YH/9zmhZkrXxZjt7S6+jywLMwlr3/wJm9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=qY7h4cTy;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3FD606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3FD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=qY7h4cTy
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-497614c95f0so1156202f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762093; x=1795366893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVZwwH4W1zKgtEsp608WvX3HiMcrtY/DDmZr7nWB46g=;
        b=qY7h4cTyq3eIH+N1giwXEDGq77RYhniijXUA3ssiqYQHkVUOqSPUzZNIJh8/q3vOj5
         Vg+uUvEC4nn7iEaKd6xMBxoP7aSz7qN6X8Er/wZnjRwoxwhKRybf5uDXXMdWLtUfW+CV
         jfESgM4MIKHpMKpm6nyS6SCvHyZ/JYLyHL6pgfwukS7S7rOxUnlNqHPcUQIcOaWA7aNf
         XsK441+fZF+TScjo9fOnJYgroil/hxxXP0YRDCOAZKuHgmxIwQfvwdhDe2RyMScqnum6
         h5NwYCcwou2o/wJ5szE91gIY3aLP00VBveBktR+MD+J6jLSiTgFDXufCb6s7k+e48Qn2
         0NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762093; x=1795366893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVZwwH4W1zKgtEsp608WvX3HiMcrtY/DDmZr7nWB46g=;
        b=Ox88cq1wdvmmLzarYYKeZmICEXmfnv5fKNqnQO/WvGIoZAL+aFLP1lhCM3anKaLbxh
         fljqNo58Af8NBMUTcIc4tfokLeimVruQwalRkmdsAjQqvSyuR4A6jr/DDzU8fK8MWqg8
         jVPVOKRvzruK3jI8gBMpJMRXRrNwACknM2JQID9muofUydLiC4RH9ESQ7JYTYpHCS8ZC
         bJ6iBOpz/5ai5GhzxTSng8vuY5zPTwjnXpivETkz29Tv7wxWnxtedS3puLDmTODT7GR5
         XVx/QT3t9jA0KpG0rXMdZSnRa5hi2zVPOq9ONQf3C9DfaXIl92LuI9JunWxg1WWVZ1yW
         1ucQ==
X-Forwarded-Encrypted: i=1; AL+hErHjkQ0+RX9H7D3FTv0Ovw5fkYKTl+BPvjvbbe6hu3efUip5kjCzNYa0e3z68R7dt5csE48uOeEp12biewo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sOcZOYOQ2TVQTfml5y9HltInvMjFJYAN4CBs5FV0QV6NgvQT6
	9DDzKfm4kW7Cwv26EEVm0BHioxS6Kbz/IIbtwvQcWr4MPUA9GC6cmDna6zkFKsg7YGo=
X-Gm-Gg: AYBFou0vHaiTNs5HY4iy4VHE+9yoafYnVUxHXuUBk+C63VjkpK2LRTaZPoQUiFQBrj7
	O53yrbPG6+rjVdWXOpQKmhuxYZtD2+A3/jqe84UeFf62tw5RYS0FGaQitfgNjtkZe20AS8lKwfb
	eIAA8GWJemxkCgv4vjr/eUZgqnYhUi1DTTWK63eqXv5Ik2AunRcT7ON19H4IRqbtn92a3JC4rv2
	+gRHUueChNupiGlE4fxQws4OgM3CNGCjotztIL0iKxUfyMakM63PJpirelI4C8oZVipVrT/b8uf
	GnclSImcRgkfV/OjBJ79Bd8zOwMrLv7zHkkK6rB9aQUCeMZBt3ugqHTb3L9VOx0qZKgRzeVAv8i
	RiCQrSJ4rYcv7Zc2nv4EBbwjCsLCA3XOM+w1bqALdhZqnoC0tNRHh8j9O5LFBj+SJyDQPsKYQit
	eakeezM/86iUrvrK0s2jN0BpMLfZFokjdUkazUaMX5IHy2uka/4QgnNAyq3IJ+PCa9EW26jkqXb
	JSuR5+54JYNSHPRHJeWvED4++Zvgzc6G+I79AZ4I0FpJtBnTxTfVqPqE8PvNwJHt7OgccBZsBcf
	hEe5tsP2R+SzEesiGbRoe+CvmXBh0Pgk2cRKnEgc+Vtldh5f3fqN2zeigQHVgWwLXlJ7V4iybOv
	P2TFPsYg=
X-Received: by 2002:a05:6000:22c8:b0:492:7efe:3fc5 with SMTP id ffacd0b85a97d-49c7381ae3emr20826396f8f.23.1794762092143;
        Sun, 15 Nov 2026 09:01:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm17595092f8f.56.2026.11.15.09.01.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:01:31 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	David Heidelberg <david@ixit.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Paul Boddie <paul@boddie.org.uk>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 5/9] MIPS: Ingenic: Update Ingenic XBurst implementation IDs
Date: Sun, 15 Nov 2026 18:01:31 +0100
Message-ID: <20261115170131.24669-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
References: <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com> <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
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

Hi Nikolaus,

On Fri, Nov 13, 2026 at 01:33:23PM +0100, H. Nikolaus Schaller wrote:
> So the lower 4 bits could indeed encode the MXU revision
> and the upper 4 bits the XBurst revision.
[...]
> IMHO, in that case defining PRID_IMP_XBURST = 0x0000 would be correct.
> Maybe the _REV is misleading and should be _MXU_REV?
>
> But that is quite some speculation.
>
> Any thoughts?

The core manuals define that byte. XBurst1 CPU Core PM, 2.3.1.8
(PRId), bits 15:8:

  15:13  Generation: 0 - XBurst1, 1 - XBurst2
  12:8   uA, micro architecture version ("please reference to SOC
         document")

The XBurst2 CPU Core PM, 3.3.1.7, has the same layout, with uA 0 for
the X2000. Decoded:

- X1600 0x00d00000: XBurst1, uA 0
- X1830 0x00d00100: XBurst1, uA 1 (PRID_IMP_XBURST_REV2 today)
- JZ4780 and X1000 (0x...024f): XBurst1, uA 2 (PRID_IMP_XBURST_REV1)
- X2000 and X2600 0x00132000: XBurst2, uA 0 (PRID_IMP_XBURST2)

So the upper bits are the core generation, as you guessed, but the
lower ones number the micro-architecture rather than the MXU: the core
manual leaves their meaning to the SoC documents, and the X1600 PM only
gives the value. This is the reading Maciej gave on my v1, where he
suggested PRID_IMP_XBURST_REV0 for 0x0000 (REV1 and REV2 being swapped
with respect to their values):
https://lore.kernel.org/all/alpine.DEB.2.21.2610262045440.42255@angie.orcam.me.uk/

I have asked Thomas to drop my cpu-probe patch in favour of this one.

Thanks,
Olivier
