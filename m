Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974585;
	b=yBIQyYZQNjFbhyleJhmo+OuM4W1TKhkAusp01CI46HG8VnF/mnzi4RFpKziiTikKpO3r
	 ue1CKhrI0ggPgeR57bq6pIC2s73cNBh291TcXv6Yqv8/1asdlTxpewWLeuaT5R1vyMPyk
	 JuOMtGxXhZDHyKpVgWjmOSWPLrTjnYEPCqIiL9rd5e588PuJd6mVKfl6H+3t5QG2AgwC0
	 7Chc0f6tGSSl5s8diT9t4+HMhU94T6EKmFOk/O0lnMu3Pab4HmUkRhfByNK8GyHMGQqGg
	 EN2zOEMbgH3YgI+tNHhKoZNbok+8do4YGyxHUWR4AF+dSmze3MSbInRAzB4ThAXjLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Daa/iIwitpiz7Co6ECQKt9tYfMt18cT1MFoMvMMMOIk=;
	b=X5ioTy0S0ervGMqgyb0FTz1odv0WLUfH+VrCqWH6y0/QlaaRq657FCdGzyO8SDmEwP04
	 8BImFwtU+7Nmf9zcFW+eGzsAcpRRPX/V4PwHSXy4jbYlIzFACdTvLmYV5PeDIZORaYl6f
	 /N6ULZkNHJ+PtHT5YVCrKiiZEQDJzb/6vX3u5iY1hbfo4nVaETTkNFKo0hHBgb7P4fqeY
	 p9Jw4eWwWvESP+oUpOjc/FxWJCaXsMP5EsAJUoLDyjOxfMU3+z2Km+bbIpI42G8M0gj2z
	 nlnOBOfvvNspRrEKtPTwovlF1/ttXE4Ks5g9j0XpxbAAHFn3jYlzM/Oo/xa5PSG4h5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4Iy1scq;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03664606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03664606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4Iy1scq
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e98798cbddso8734845ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974584; x=1793579384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Daa/iIwitpiz7Co6ECQKt9tYfMt18cT1MFoMvMMMOIk=;
        b=Y4Iy1scqew3iKckDBJkT6E19Cf8YuHJdeW8u17Wbh8V1nQ2/4UVohE1SZjkZFtM+4+
         oIsLW82hgZqVwZZ1/EZsvjE/hKb5oV3gZpmlr/Cn6OTJsw+fjQHf5b25wfgIv3RiZAk+
         uQG9raDyemA+/7NFKhnZ0v4HB1Lugd1I2gtMJN2isRkPymohut27gP83mwwWOEomR2hg
         Bpw6JBuThz4qjfjls6Ce36CWMYYrWfqN/8ANbnxhMDvkaXj/KQ9udpk4Jv9g6PIoixbn
         pU2TxVNOQGQjTHjsG5ur5ASQyK1DvvKLpXe4cQpLRjJmYP5l/1vXbyjNsMsY3XGU23bc
         jG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974584; x=1793579384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Daa/iIwitpiz7Co6ECQKt9tYfMt18cT1MFoMvMMMOIk=;
        b=UuFZdCeouRT9/GjxXy6cQfpKGTkBGW4GAIfRs9133SsEjY2XaqDxC6v+aZYGnG+Pg8
         Zi8VPOpFkcQZMYbOIdv04ptx0uU7VpEhrc4HscgmJ0Vy5Kh8DupQttDB3ITuwjiy7d0Q
         XfJ98UO4MAeVbAipKVgvd/RBMhDIb+6G8WSDu3RslBNZf0t3wAq5E+vxuENHqfTcz8Bp
         BYfytWDDg9+NscjOinOCPHQ6V7NG4YqbG7Vx6cfiTcsR5+09L2RliouMaqwlMgIa+u2x
         GstRoDOVc5EsJ0hgLzlZyUt4XuQTebEpGk/IFAeHyQv94I3UdleoLRsVnwssy1GmpA1k
         qK6g==
X-Forwarded-Encrypted: i=1; AKwUvBx1dVDD4a/JC7OBaCitUISz0YLND0vS0BJVo6d4j+bvxKrfWlIcbuFq52iDHD23DSjSUtPHADD8y/oKKGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi0EhfaJrLpC8LaaIKPR98+foUd9y688KOLcBAIpeDyLlxJELv
	7zZwM4HDnBoaC7wf1lIRSsBRfE2yvkmfqwmXL5yKqYt6yYhQTGbtwEfT
X-Gm-Gg: AYBFou0FAOGeqIhixmNHqqWx/SP77yCQgTwKfIl6s29MFGHasSvjtKYHfUxXsopWwLC
	OVH4pu70vbEyKvMjgDXr65HFZnLhx9QI5SmpZkDE9S/6POh/ipkjLETIlIsA1WvUJFmxl2bWgJh
	XI7J2LVDXBUuklFFfOvm6BOh9tcuyiubr4QuhUUKTUu9mhcO422uo1Tpk4ho8BvKHH17aNbgBIi
	x/U3AFVIWnmynQYRUJg3StGTRMy9ZgqrkpAnYog2CCvlS/XRrKQeF9NZ/5yybskviEklxEUHjTj
	OzgrWiooKnX/0XtaA5UEkndLrwuz98lX4Xasy7FNewnDpvf1sykFWa8KVUY9iawrDc2w0NEzJnX
	a6U/IlJGHLA5NzeCcKvF4T1bA/FDVSpuy0KOhsvAxDcgw8025fvFQ0qSuK2JsPr0tYke381EvDN
	nPtCzGHazRc+SV9hxCtyWQS9BaHTMIHinygj+MEaDfpeFp0xioZBSCx7UwF3RZcc2YWs2vFq3Dy
	HvMAi1mt3IrovVJ9XIMmNnE1lLfRratd3mn80yWd5UdmZQXZJVeu2vfNwruGlCk3KfhXjHVTHmg
	icloR45+i+a5msU=
X-Received: by 2002:a17:902:fd88:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ea9c697125mr44525615ad.15.1792974584380;
        Sun, 25 Oct 2026 17:29:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eac205bb63sm2057115ad.48.2026.10.25.17.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:29:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:29:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Asaf Nuri =?utf-8?Q?Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Add ASUS PRIME B760M-K
Message-ID: <02aa6c87-7098-4a4c-8d84-197323abb3d1@roeck-us.net>
References: <20261018202934.1111462-1-ycistak@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018202934.1111462-1-ycistak@gmail.com>

On Sun, Oct 18, 2026 at 11:29:34PM +0300, Asaf Nuri Bertizlioğlu wrote:
> The ASUS PRIME B760M-K (DDR5 variant) is missing from asus_msi_boards[],
> while its DDR4 sibling, the PRIME B760M-K D4, is already listed. Without
> the entry, the driver does not use the AsusMbSwInterface ACPI method to
> access the Super I/O chip, and no fan, voltage or board temperature
> sensors are available on this board.
> 
> With the board added, the chip is detected:
> 
>   nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> 
> and fan speeds, voltages and the SYSTIN, CPUTIN and AUXTIN temperatures
> are reported (BIOS version 1838).
> 
> The missing entry was found with the help of an LLM, and the change was
> tested on the board above.
> 
> Assisted-by: LLM
> Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>

Applied.

Thanks,
Guenter
