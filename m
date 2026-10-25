Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918003;
	b=rx3eSzi+a4Fhzfsf+94BfeIo1b1A1NCd398dySksznfx88/iSAtLR/iQR662iIAdFIyR
	 W1NNg/1LVmJ/sfVOM9yWNxt89S482Fz+LD2vxjwwaVpDmyW8H/qFkhsulf01Zx+A+SYRE
	 KcwiyEHjvyBysOA3kiwvLEujf523W5ITX/m4PP/rREq10ZoyirzryC8dmEQUWb0XGS0Qm
	 uc925PsqOXYiVO+J5jnYLbsCM4DPSr43xOdXEzSjPGUSmw/+K/mJxFQtBt9nY0apn9Cxt
	 9ES6LlxNnBZlRNKKoCLopReqe3791SqLyqHiXXXBV/4A/5vs6Gv36lgj726DYyzD3zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=;
	b=edlgm3Y2qmXFui43DShOFRejw7ClM0PW84hAYhMqDdS/TV8ZqE9fFUTHIbtXnFB0D55I
	 U9MzBh3cQlKXNFDoSA96RV08blMBY9lAmksim81p29zwj6cWlvbYBvH/3fS7be6dFENkq
	 DXMTY/b2Bju9AZfB2J2YwnZO5Qzzc88wA6DRmtD6CGstVBylmcJUu5Vjug73iAxSBSzle
	 5je+VJB2x2DXF+VWNbVYhaRdDpd/576hsYPWq3jP9xKTOE1WadH2hc7jrt6NoUpaSHzua
	 SjnQwfD+/Wy10/kO+324gPwCiwF5l0GDKhrB6L7daMYkM5K+D4Wc9zKszrOaZRkefow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="CE/EP0C/";
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A223E606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A223E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CE/EP0C/
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so926440eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918002; x=1793522802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=;
        b=CE/EP0C/9IpQBVCJ6taLKeH7aWnmy99LlpYvqDMGYLgGhGruyINltDQTUcY5NC8vwz
         YFWJNVoEj0tYA16X34ifZKEqpC71JFev+8aBw4hkNb4/tDO7ynX8ahRm9JjGE2bHyDt8
         KO1ScZMeEXoBM5NmTBVyM8QfewkDmOU0YJPAFSmSONK9RdcMAHchnT5kBm7ZF7dtsup8
         Do73CIqa+/Ib3YV2dNvsqWgdZCRn5Tn6QTGXNl5tlI1J5Nb45uanC5OPERytQIU6TPMQ
         qvUvJ2wxj9osjCxcDQjquJRRo2YFNqkg4mwKOfdkE2JJcwFb7TpzSPI993p51J+Bbim7
         csmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918002; x=1793522802;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=;
        b=a5lsn2MnqLaXlCyMSecE39vlrrGhjzHwtKI72dO09wpFW+xAgGlyDuLZCr8OVA4KOR
         OgMR11eOfIYfmxhpS1ii0jnzTS7FsgZRY7hswdsVOgxgCi+IY7hLgbJ1XPcMLLUzPAE5
         Wn7Qz61y0QZkA7RI3zpPsGnYMijodfq8qnE/EmnDBbiYxq9BvB/5fhIL/vHerjo/VB4h
         5deTrKDWpnjzCTCylJKU7qErjh61Aod5WZ4O5BpVGxjQ0QshUuhp/viiADSqEqKbPjL5
         q41ECmCgde3M+TIXPcZ0Qk7I/QQxegJl2fQsDAaoMeMqTY/vppIdNugvYrjHOV6eZiA1
         xeKw==
X-Forwarded-Encrypted: i=1; AKwUvBwt0mZSRhPHeTJp3Iuuu8YeHJvmHN4W4xgyBGxvoyV8UTQX6npHyXly7iy7VQItQXnd02APUBzomV9TCLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeuRgYbVBXhhWD2P0tF64zU0HeNdSUW5KwlO1ZM2NQhz+29qbN
	tNV41Flh3TJNY11puHnxxnGriNepgMPwsMeTE7jES5hhgYj71V2MT8lk
X-Gm-Gg: AYBFou26pUW5lhRRSM2l2zoGi/2a1hD1Bm6TtwlGu86G29zoca8H8dLqzAYDQ2Tw1CG
	jgi0+4qVS0I/vnC6o32faxbtvihfeuy2WHDEqnjk1RuxqCphHlNstzSDjSpQbwQR7ATPbijW3cz
	dv6OpFOHQy5poiqIVE2YyRv1vQBZHkHjP7Ac8qd5mYVpoKAt2jg4vAZibWdW2nZXRV+xWKW9+bP
	vf2LBiJgTmc2Ni2wyvi687ygtYGa/QSWxKGxenF+eOD83sCO5ZGu1mlflVO2TZEoWKBHBaWHAL0
	nGZrIaWgRjRv9Bf6Dzva/NLAkeodVjpEfVDhAySTHTexG4qe7Vh1C/5eLZ3TsONb9So6B3l4zqt
	J5JviV5okl0jL5vDQD8qMVQtNrdUL1kmcIdqf2a3GHu6ezY85vm8I7E5WVH6WZsTg8FhPzzBLQM
	PL6K5clNE0kKtKoAWKJLPspLBfeygLCXcsF6chfzfRk47Vs9k3eQAiHNk8psYyR5u5N8LHp5aAf
	G7e3bIdywux4sVVQcOOQzt8k6c+oNm8BRUETYZpP1zBh2X28e9CxRCQKqbEASKYcA==
X-Received: by 2002:a05:7300:8aa3:b0:369:b82b:5fb0 with SMTP id 5a478bee46e88-369e84ac218mr5762198eec.23.1792918001511;
        Sun, 25 Oct 2026 01:46:41 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm24418092eec.25.2026.10.25.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 01:46:40 -0700 (PDT)
Date: Sun, 25 Oct 2026 16:06:39 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Roger Lu <roger.lu@mediatek.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_soc=3A_mediatek=3A_SVS=3A_fix_devic?=
 =?US-ASCII?Q?e_reference_leak_in_svs=5Fadd=5Fdevice=5Flink=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de>
References: <20261023082948.1854252-1-coiaprant@gmail.com> <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de>
Message-ID: <9AE974CC-F342-42F0-84A3-D72C3A0326C2@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 25, 2026 3:58:06 PM GMT+08:00, Markus Elfring <Markus=2EElfring@=
web=2Ede> wrote:
>=E2=80=A6
>> Drop the reference before returning on both paths=2E
>=E2=80=A6
>
>How do you think about to increase the application of scope-based resourc=
e management?
>https://elixir=2Ebootlin=2Ecom/linux/v7=2E3/source/include/linux/device=
=2Eh#L1363
>
>Regards,
>Markus

Hi Markus,

Thanks for the suggestion=2E To be upfront: I'm not the maintainer of this
driver, I just ran into the leak while reading through the code and
wanted to send a minimal fix=2E

__free(), DEFINE_FREE() and return_ptr() only appeared in v6=2E5, while
this driver dates back to v5=2E19 and the fix is tagged for stable (first
LTS is v6=2E1)=2E Converting to scope-based cleanup here would not compile
on 6=2E1=2Ey and would force the stable team to rewrite the backport=2E

So I'd prefer to keep the explicit put_device() in this patch and leave
the __free(put_device) conversion to whoever owns the driver, as a
separate cleanup when the stable backport is no longer a concern=2E

Regards,
Coia
