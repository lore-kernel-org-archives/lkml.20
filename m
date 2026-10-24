Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851233;
	b=IYWztQeGK7CKB55pk/PcJ+OX6b/AzcmrXJFsAm9COh99XHn5Zn6qOcwzo5SkRlcfsT1B
	 3wb9chr0ixVb9H1DqbUsxYKbnHRCEyqUxeq93VeGRmr0JZy+nSwF6ZSWVT56BAN1HKYAc
	 1GmMJKubIfTr019nPhV/CKrDoFzJ0lE073j4iwUKAJy5bGPx6jy7o6O2Ne0CrESf1Gp3u
	 gIcflgTRDoivarH4tXSl7mWp78nYi364dXnoHb+EDZecH0lmIP4Wy4lxwBp9fKDU2Kf8H
	 IXH333ztyuCLhoAi/EysWR5IeinGSwQEEBTl3pxbYt/v0GpvBroUNWaoPOm8RhfScgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NinjwXEZqsyLzVMLGtZx22X19MLQYYpk0oH7D7uxDoY=;
	b=ALCv4/kxkKC4RVYnaGdfu8WHZ1guqx0X3DXgKvh88HoenVr0P+gIo8SMJ/oL1ils9pkg
	 ZeWDYZk2kUbUiLETJ6UrfNz6WSSpFAmlokXdSWWrwKm1CI2Habz5y85kGbeIh6OK1zyra
	 jvOAvWHZGiMSEyQ0NMoAXRtYgr6kilXmZWBCL9WopYaQV0vHHB7QEE0GPBHcgxpOpGfF9
	 s5wWYvsrq+HaNmwg7sF9HlR5e5lTDrQtoTaoaUfHajcNgxu2BQ07D1Sja15ogMt99hHAr
	 DF7XhlVdrtyh5F9Tyu/ff1irciQ7zC2YVJNTEKnWQU11nBXxW5RTCPg6WW5exflvKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kBUV5rEj;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kBUV5rEj
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so247034766b.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792851232; x=1793456032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NinjwXEZqsyLzVMLGtZx22X19MLQYYpk0oH7D7uxDoY=;
        b=kBUV5rEjp0fRCUpZgbFLngnN3udOkzuiE/cPfVhL7V9Mk0Yads2TUBl6eUFj+1LgC6
         vNouoW2H2tzekvc9PxQdtfpjFEX3jbdTMmwd4AE1emaJ1tG5z7aSKT0KTqoZXHSbA4yT
         y9pjERZW2GfpFS0TI7mh4aNeJfm2Y/NpYJQWPS8Fx5FprSX5mLr3kTrYdY2jzS3dE5gh
         ZclwHudEDohfCXwNmd8Vnn+MPKDd2Jw/VGrQ4481B7T6hOCExmh4Q5m02PDlvWau+VzB
         QuerrrrB/0kgHyExwFoEGOk+ar5xKZMO6N6H4/z9cBVNrLJpdDKlMvgVxzM3o+/aDINE
         OaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792851232; x=1793456032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NinjwXEZqsyLzVMLGtZx22X19MLQYYpk0oH7D7uxDoY=;
        b=qLCLUhYoJuMlrJoCGoMz3NBFQsn3+0c/AMgHBmdePtepZDmNS5hpsTKQXIAOwkRHsx
         G1ku59zvh0NDQ7iQEvC4sas/039jyPW3tDqw3nMFqSS0IU7gYWOPwc6Uo96HYIPHPF/+
         H1NtKifIQJ6yYv3l6FMfHVRNkB4riobggvfWKq8trdxeJX3siZSvs4BYpS4Ug1w+xYVW
         QALzaqNlZax4BIzCmZS7xXCoxyYwtRWeamF4KD3FRlkOaKB1hVBlxIgsg+NP3WPcCoI0
         4c3LUOgCedDvA7Vqk3664K6Dfy7ox4e52mLGqv79PQnnU13D9S5UYItJyHLEWGL0jtfz
         PKuA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ5PIkwQ5sE+tw+PmOHZjcp7rOuelaplkCb1ooV+fSQE6c8Pqq/fP+VKWjk5KaTeP8f5XGTZ6H1DdYqvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2AMcVWC0KkRTSG6l+uTeBa+D3s8Ck8PtbZraKlGIF9zjGhAVp
	OQrA2kC+TpA5f1Fp0kD+76gienvN+1cFLxKxrP7uGoKZlEFf9G3b/Q8wwHN1ZgHm+g==
X-Gm-Gg: AYBFou1+zVx1l8lUcUE27Nwc6oftgmXIcoYXUdDxIheBdS47/ZAvYgcefrRPUaE0KhT
	bluyVlBWM/j4RAPs2Niz6vlW/Q/B1Iytw5sH3jodqW5mAaE8Q6K6/mZzj6H+lWcjkC4Iv8Tnjor
	ao/GDzWYbELSL6L7X6uLoogdZz+vU9Ghz0ddxVg5BcRPkiWCMzvs36ZthuqMrXglyfBiwZBGTVM
	25BUTM341HQ9y49C4QmA9DO4lZxKMrH9zzr2X0vIu4GagmOWpKDVVQZ3tZfhBS3ObKlaoPUuehs
	XPv71qEs0QivVQCK//2CnR7HZJNnDe3c/yUy/pyUu3OOjkrR9mVziOpUqtUve4nMejGAaoVIILU
	z1Gl5maVjXnD4JjB6LSIpJAiSnUDX5LGxumx4yz/kxFDu1n961m/cSdgAesyuZgBpQ3JHlCEK/l
	cL7v1JMHyvnmtdt/PPGlGLHuiJ0YhjYdVJDcToj3dGzgOi40IrHeBYoifIYd25twultGQGak0qC
	z3LoqTVr9bxTGu27kIR1vUzTPSpkq0G4ZnrPqpyqnonrsVIHvzatQpgNuXnFc+FPTCvgk8jHkvG
	e1t1I5nDCZi+srz3yjJxR4MmghYowBzxHKzbtEwFPSW9mT//xtPhG3GAQtvnFBgAhptLPQGpBmw
	3AJ7IfuV4NdwTG66nuQZOJbAI2QNq/4hKHLDjGmYSz8R/Zp8zGmRVYBD4EFuFdyA+idHwUnLJta
	Q2DatVBEcs4F0w7nexWrGDVa551rkwx+iSGn5YoILMyB/qVg6LCKr96bKJU2jSoaeFzyyCRxLaq
	jhGoIA/4/Plju+DOYW0hP2YkXA9mw==
X-Received: by 2002:a17:907:6e86:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c46bddb3308mr236179666b.9.1792851231288;
        Sat, 24 Oct 2026 07:13:51 -0700 (PDT)
Received: from Desktop (p54afff47.dip0.t-ipconnect.de. [84.175.255.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm95461066b.10.2026.10.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:13:50 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	Nikolay Aleksandrov <razor@blackwall.org>,
	idosch@nvidia.com,
	Eric Woudstra <ericwouds@gmail.com>,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v8 1/2] netfilter: flowtable: tear down direct xmit flows when the fdb entry moves
Date: Sat, 24 Oct 2026 16:13:49 +0200
Message-ID: <20261024141349.2145994-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017235849.1066624-2-julius@bairaktaris.de>
References: <20261017235849.1066624-1-julius@bairaktaris.de> <20261017235849.1066624-2-julius@bairaktaris.de>
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

Hi Pablo,

Please do not apply v8. Sashiko found an out-of-bounds read in it: with
a vlan device of one bridge enslaved to another bridge, port_vlans counts
the vlans below both bridges, so the gc looks up the bridge port from the
wrong device and reads past encap[]. Resetting port_vlans at each bridge
fixes it, and a selftest case covers it.

v9 has that fix, credits your patch as its author with your sign-off
and a note of my changes instead of Co-developed-by, and is rebased
onto nf-next. I will post it once nf-next reopens.

pw-bot: changes-requested

Julius
