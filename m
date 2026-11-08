Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794118092;
	b=Mg/Y4gS6ddEn2wZ7U8P4bqMy0kArBVHMHmz2I9XHPPKB5g/dO5WN2l1cn2/v6cANfxrc
	 uo0gx6SafbrLNcadl4pqnybDrfCCPktaxIOv3OrB7CzfVJ0G4dFVFC4Cl5M7MQTTEmLRb
	 jGBw+UW40gda60dr+LqsG52bt2xEYOlC6CzNoO1p8LhQzkikdN0ZWt+OB5hRSO3OlVPNz
	 d87YjlSU5d9vq/E6LUyIBNhHNQZht93MASX0Z6IJZrtjDzMvIz0XS64GDbM7/bK8ry24q
	 2/JDKxr+XXJ97f2/IuRrCPF2UaC3zaNcuCbeQpSI5pkUpa1i5GU9IFxpPSY2DIauSow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794118092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h5oxcX+E/dx5EGmHppwh/qaFc5/IklfAboUOQh2Ctv8=;
	b=Apr6fWzoLbks9XWbXkqmkw9Voa2TWFlFIqEvYnymEy99sFqQe9+CfTV+kUIj3WTbi5kM
	 sRQfbJcg7CuUe1E8lSOj+mX1VQQV3fkJpG/JiZhXxrMpPBmoZaLzch8hcwDRYCOuTh31m
	 NfQ7nxqvwb3xa7uFf9kbF01RE9dzQyzBroHbnSV6bTdzYTv6mQmoW0becYgAYciNslCDg
	 auCivAQQQQ7MjeExNXJpNVR1P5ls1XwhY5z3/l0lsAGglk+09YDDkMhsKBt+dLLJqxhiZ
	 eaVBdIwXvANXvVijPZYmODq13Fr4Ui6FJzRHpZiW2Ga3/msePgsZGsOR2FvxwmHGaJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vK5DnDmv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BE9606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vK5DnDmv
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70b875f6f1fso175214eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 22:08:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794118091; cv=none;
        d=google.com; s=arc-20260327;
        b=dNY4hEAdw5UsnwVPXiQw8R6tvTHdoRWhQx7O2k/eB45/GmPYUZzMCPXOYGVBYuGsY5
         3sKqUjuPAFiG0KZ4h00pRx+A5HjxEcx8+kdXZOYqjfdhVNKZ1laoYRwu0w63wMNjVobd
         npHtRhJgkuJ8oPAAY+r61AVI8o4mlm8b8hC24fikLWAYZhvzai45UcF/wAToQYw2y7qh
         tm0QINLDGifw4zInWHzKRtKVS3yjiKGpGzm3HTOUR+ro3yipUo+N4oqv5ioQHLL6E0tu
         1T/TePWoEC3YihGjBa7O0Hz8TgGZH90MoPKricZeFverk0Rj3pT53bIenNnhsHumwHF6
         Lq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h5oxcX+E/dx5EGmHppwh/qaFc5/IklfAboUOQh2Ctv8=;
        fh=k9pW3AP4Vfp0LujvvKjAkkhyRl1SMP+Hv6fcvVkLdME=;
        b=L6de1bYwnBHFHEd/c9SnQ65bFgmUoh4/90mGkX3uBpf4YLKngwzxy95CRdt9ofCQ1p
         5aPxeHwMG0yhIdTJGvro2jvC1cYrRQwkxpQFFhiSVFhwilwMcB1tjLSajahUIDG7TnnL
         f4LE/zqhK1QpUlZQiM8PIzTQCwAxR2onsl0IY2bOHGcX0BSlsTYa+MMaQlKFtPKZ9sPd
         wJ9/mOkoKArHuHnVKg/bTr1ctFnubiJAUXspCAih0nAlXKIcha1rG2abS9c6NJWFEqHh
         56E9UCSbonilM9w9NjQdMJIIOb2UhFwsl7AFwXtdLWMJM735rvxmyFhRM6UK4FZVEeQS
         zZ3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794118091; x=1794722891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5oxcX+E/dx5EGmHppwh/qaFc5/IklfAboUOQh2Ctv8=;
        b=vK5DnDmvw/E23FNxx7ig97q9qw/XmUSyLzu9Ql9lsqcBxgh1nE/n0PKcjT/l/11Jc6
         NWb3hm8ltUU7VaxchOJvXHtx8Q94+THtG8kfxg3PURy3bvim+rIO0m9eOEf9JwEq+Q5f
         oaHGDHXkzdizDCcx/+5JBoJA2/L6e6N6jpNHALSL7Mt54d37fqMGaz/EboXTGe39LprV
         1gY+56w7i4BD4Ykvqlb7bD2QBBLoVNK1UX4N7qstg4uJY68hoNI46G3vNE8xgkFdTU1F
         TQ3bIbXRPTJtGCDrvSpm/kN1NE4C7GOodtSTQSJ4ov4wrM0lIwjWBn06C4bq9+lg+EWJ
         4IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794118091; x=1794722891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5oxcX+E/dx5EGmHppwh/qaFc5/IklfAboUOQh2Ctv8=;
        b=Fk1GQ40dXulCHh9+ARD3QsToLPUdpLcgoFBJLituVrMEXk5Rhh7Ze8pu0Der6F6rNj
         lIAy7KHSaVshNCZLhO3iCLjuSGQL8hikamChjC4q+BDaEgmyzV0sR2oSRXoZE6Qhpm5K
         hDANomlMuMYdrNoWc4yr27DuG9KKG5spmlbfD5ejkQSffVAeJwZOc2yTJv6sGLwuFRxL
         L0g1rAIXruPrd5E8TdiiOXIQvRBnT0O4WllStnVMHNQuASgajU6zMw6RinZf5RMoTSYi
         7GnL926qlEzAZqnaxxuBnat7iLgGhCR66ac74MKP3emvPHU5FgcLBCoIKASd7JeNGjoL
         bd+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJmJSLcJu6fxqSUOrJdR3M8SUb2xiweZ5t3MgveCFPCb3ERCOLS3r/47kTGx9nB6pZTOvje9yGG1cQTkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HVLKL/CqvaFycotLgPa+gJ4OITfCCyWXSO+htwOzVCdf7zkEX
	C90h++wW93Hu5iuNsYCia2vpMabgsZul4iPgPHXihnOyHTWChrLjTYz2ncrcasz+Nrb/gCFXxE1
	jVPrQNQOZT4md35/chkvgjl6buQQTxlU=
X-Gm-Gg: AYBFou1YnfciTGSkct2Awkmm44Hek29GWlyAiSdZhFhwGTrlYWM9hbUyPguiM1GyFXb
	psniAYJ227scrvPj/j7CqlWbnW0bT8NJHKbv9/kU0koGLX7hJQ4zcmYCdmZIwpPKvpF7C6njbXJ
	M51uuxIgoi4MRmT1u56gGi+U2z3VIr/r4Jq0Xgo14ciPjjtlWJc8ZmOAEwuKBB+94+gh0C1gTfw
	PFsdW5Ro+LzKM4cu0zB0m9iDBCOLvBT0fY3hXzw5c2vGA316WfutoAvlQm0tZhvwwyFdw8jW5xy
	rV2u0QPwqeYIWMovuxeC8uXey/QbudkL65yojibrzXXfstFqZZGYCj91gzjEKShXLIt3H1g2LIU
	WFdYtrYJIC86HLR56fHBfP54MYIraYojnDvYA5A2yU9wLYxGfAjZ25hS/2eKg+SCiUvypu0o=
X-Received: by 2002:a05:6808:1302:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-568143e3ef4mr388887b6e.48.1794118090754; Sat, 07 Nov 2026
 22:08:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107015447.335056-1-mmyangfl@gmail.com> <91357461-8056-4b1d-a06e-6f1db5eeaaa4@lunn.ch>
In-Reply-To: <91357461-8056-4b1d-a06e-6f1db5eeaaa4@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Sun, 8 Nov 2026 14:07:34 +0800
X-Gm-Features: AclHuK-iIhfgJh2-Aw5nKIdYB9WRNWrXQisMuyKiYZUjofkpUZpqI58wFbD3YH4
Message-ID: <CAAXyoMOwtQB01SFo+o2UPZZtw3Dhkpq94h8N55ZEas81z6VWUA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: dsa: motorcomm: Prevent rx_bytes/tx_bytes underflow
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 1:26=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +     if (res) {
> > +             dev_err(dev, "Failed to %s port %d: %i\n", "read stats fo=
r",
> > +                     port, res);
>
> Please don't break strings like that. The reason we allow lines with
> strings to be longer than 80 is because somebody is likely to grep the
> error message in the code to find out why it is being printed.
>
> grep -r "Failed to read stats for" is not going to match.
>
>     Andrew
>
> ---
> pw-bot: cr

Hmm that would be more than a pure code movement...
