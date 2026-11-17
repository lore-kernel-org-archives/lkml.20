Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936793;
	b=zO98rU440RmkGj1hoAY+XFZrSXGV552y078zWqWT51xugRynRMRHa+NHkRomt1oBtz6v
	 mXIrQce7eFI8un99v85bk2Ft3mw7dgJ5S2qvpu+ruO+1G3FkdMM+uKbiQdiBQIAbrqBXc
	 u7VEziXfmUoncv7r+o1h0rYMwsyJZlgrKCFUOG3YVZJoZOmmD8mkCDbYyT6N2l9mmlLmC
	 qHgzgCXbDBsHCMrlcsdNaAbYlBVq7b91QhP1klqPyLEL6UkHhpgU+qWfG+m8YiiZn1QqD
	 QbyLw348phYw0zvKwK+8FahDISRrCunvE7Lv/C+vOpQ1+9R6GLuTIvXmTb2+KaZnRHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wClEush0em0gomV0MbpA2Fe3wVn1p16r90QsMPKpJmk=;
	b=PAeiztC/LZ8pVcrUsmfOqBHbZpXSNxnzuPE01yeHSSlKZB/2IEMYeokSnvJixnOOn5jk
	 1Fxg6PRdSseg0TMfaFd2WNI+1qZp2NE/UdYMTqgI4pAKIow43mqwMvNO2uys//Ue2ije8
	 AdawYRrqZi3WqQKIe1hZUryagGi3955RZlEmZQ7Sn/gwjzrFvTSTvfJyKCZBTb9bntGOC
	 NugHRW4NbAe0MOY2uVWRCnPXCmX0UzVQ0uk0KrD0OBgKC7M+7tk2DFpI4sMRg0zcGUuDG
	 VEjzZg7PdUh4Lev10iiPXuqLkrmkpggh7APV2eyL78wVJSJtzJlDfI553Ri6VttbejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e72OyF4m;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5175606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5175606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e72OyF4m
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1375f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936791; x=1795541591; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wClEush0em0gomV0MbpA2Fe3wVn1p16r90QsMPKpJmk=;
        b=e72OyF4mYU4s54zIGzNwRXjE+lIsOYo44pmtsBZB3POuY4luLULw/JUV0oZBzRSs/a
         D4+O2TLbP9hQjTcVPW6VDtQIy8aFJWIidI0d/8PWVt33gM5zv/HLYU8j4dw5BCEdLq54
         aSD9wn6d3++LWjcr5BoWSea1i7q4NZCpDVC95HTHs4HBHhMwvrvUfXsvkcMQ474CrStA
         7C9zblCBS6dcabzOOvxYed5wIQOrn1S5S1iuhqU3FfJl0KUgH0EWW/V/HHBXB//JZlRt
         RVMe7jwqiWk8Xh+ypYR9h3z/CcmAevvJe/w659Ee1NwQ84ApWcBRZ2uQQ4XaZIWkL05l
         lCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936791; x=1795541591;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wClEush0em0gomV0MbpA2Fe3wVn1p16r90QsMPKpJmk=;
        b=LfhTNulTIBXeUKauS+tNa8W5gAtt5Xl/oJDTReB9s3chBC0dH6NY88GCJGrEKugtE1
         i7QZFXNOqb32NFfEa4rf4nQE7blJicGa1yGkeM2WM3pI7A2ehJlrUl0cJMEBZIv2eLLV
         ItUsYRPk0e5M4vOQznH+AJ0i28QPTMCtUmYPTV94BZU641DWSEk4NOrScGPSNnb6KRYs
         GwgsDVLKkH4cSXSWl6VKpiYROi9SRhGquMwh+6q+pt4gQlYtT4/z03KswyWFuzjb3gUY
         42lpBKpEumpFLgtEyVHe4kfFPcR64nlPTguSkI8qlADPDEAgP26lqwQZhu/I/kbdwmTR
         Q/hg==
X-Forwarded-Encrypted: i=1; AL+hErFEFhm6DAZN8xZ54HsYNaGqMy9d782xl8d9/q/G+ucH15gtq4gHcjH6rFMVrlKCQ18xkJW2W0qwUSqS7s8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H9HUo2+WUTqM7TzvUePCv65FDUh6PeTgJitmGTcXgt2LifBzO
	f1pkoUccLdBmUuKSPEoS5MhEh55AU06dVEzc31x7CpzXpiBJ1BOp2dSO
X-Gm-Gg: AZFdTZcebPOGzxZ9S93rroxnEY42fzDQPU/igds4//r6c5K2xkl9vv6HvZbK4VYyb7D
	YObk0P9HIm3RkcCU5uxm0EmA+BBgir8Q9IKqVL3YAYJYAUQuPm8LDuHPfuDoYI+b369ffNsnvIz
	+r7MgkjkIJux5q2CXse1k/NIEW8ptyDObdhQmo6zLLPV3n7of9APWdTLGAh7rr1ArU5fIu1wR8B
	HEMLJjihYmMWoaPF988kHT5c+yckRkMLVvw1O3lak6LOs0JLEQtScDjIoJqndiOKV8IH4AEYGAT
	qA7T6RtpCeD8dZCRXi0cwafa751jgLGvDi/QFbCCS2eDfw4+i2OG0DP7MFXnGKPsa4w7Rga/f9E
	18CupSmHJyW6j5tH9z7/DJ5t3I847AsN0GtPbVbPdQ++WZeyjeKf9M8UrFHbbIxkj+/3Vdo5yLt
	/mCZU8zJyeV/UeezfM4NXWQN+xCPXl9+eBTD6nKI/LvSku43I9O+/CM4xxk4D2sCMOiKP3gm0mu
	GwIomwN7/x3WqnWu7QHKNPlMJ/tXiXA8k/aXl251sk+
X-Received: by 2002:a05:6000:24ca:b0:486:f907:ebec with SMTP id ffacd0b85a97d-4a63a2d70dfmr399933f8f.31.1794936791043;
        Tue, 17 Nov 2026 09:33:11 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a38b9b986esm5691057f8f.59.2026.11.17.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:10 -0800 (PST)
Message-ID: <6afc8fd6.f0979b8b.2e230b.cf66@mx.google.com>
Date: Tue, 17 Nov 2026 09:33:10 -0800 (PST)
From: Adil =?utf-8?q?H=C3=BCsrev?= Tepe <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: novatek-nt36525: fix v1 review issues
In-Reply-To: <af565a17-f7a1-4c24-bf2a-130a025c68e3@kernel.org>
References: <af565a17-f7a1-4c24-bf2a-130a025c68e3@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

You're right, and I'm sorry - that was a git-management mistake on my
part, not a deliberate choice. v2 should have been a complete,
standalone patch against mainline; instead I sent a diff on top of
v1's own (unmerged) patch, which is exactly the kind of thing git and
b4 are supposed to prevent when used properly.

I've just sent v3 as a proper, self-contained two-patch series
(cover letter + binding + driver), each patch applying cleanly to
v7.4-rc1 on its own, with the full v1->v2->v3 changelog moved below
the "---" line per your and Andy Shevchenko's feedback instead of in
the commit message body. Thanks for catching it - I'll pay closer
attention to this going forward.

Adil
