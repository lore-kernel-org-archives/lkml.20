Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461329;
	b=GDY8VoxhmyGPpJu8YWbWRJ4iAsA/0GJJ5gOm5ZdM1zY6ucPgkzKXkAtMRfo9sPMoKFYk
	 hhnLVE+Ei18bgUSvppKy+oWTXlwSsNHNH5yjBTACQ+1hyo3alyMbL+s1+P2b5va9al95D
	 DlS7La3bq0LK4NR1YSRoH1JyuQjUyHmd0bdg/Qd6dn8esHTiJdKL9n9vMDWC9WtQrVAnE
	 oKnxVnSCeEHvyp/9nYIjC3BPTZ04KfSu+ceftgLrxbjYF9H7ydl4fZveE7h28pCZ7O6UC
	 GrKvLyPFoNq8WqFBVOhQUcLYfGP/Ug0bvu88wLwtr/F9CBQ0FyxKdoBzPKFPPFZtKtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461329;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hNlfYdQobugmf9UW73UA0KZ3DncrTeY2FGpbRf8Ii54=;
	b=h4kYIhJesgKVADzK6pg0ZqkKKZsZ86yB/YJimszK7E/4xwuVMiVFi2aCkOLVLvR+rTc+
	 9bQauQBXZNjDzCviRWNZ1mZ/V22l4pEew5Uc6uLbp4qrHkgTzrHFVPCSN/+ho1nwOGUq2
	 kCVCDuDIti0/QI7xlttUlkiwyz9YRYItSAMigwCYRir920cdZ7kOuqj6kqcAFwmdQOYfw
	 ZpBlitkDqRYJYGt8JWF3W7c2VZw9W3QiaYMuBR2COmlbo4Dc/AzvkoJ0O6OYVHdHl0d0T
	 g42fsTAQyp+HJ8Y40IEz8ScLsGggAdevG/Fp27n8RdtpzuAAGW20j/KEKRaaQsLwnsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9E606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E9E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49412eb1474so2295948f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461327; x=1795066127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNlfYdQobugmf9UW73UA0KZ3DncrTeY2FGpbRf8Ii54=;
        b=rbe1FPO0Iw36un7uadzFIaaWHGQbA6VJ6dh7ymefANHm8cHrf82SAW7N6rMPWhyTLK
         Kr2RXczuvK8a/WmG6FxkBmS8zMdEMM1ZWrj9KfQwRMgVGHbt/q1n6IL3dx3B1IHgnW/P
         GiucSnQSS3i4H9RqJNeB/Es/ThWDD2r9pGykpMg0DOpyr7g3F0ppdlF0sqed7qQajahi
         viYg+be1zN5S2YkDdCdsuK+rGrIZRYH0GyrWHkivu5bijnLwHycvNvVqpCsmGps5rSAY
         Jm5sI+Bn+toAxLBuq1mkvt1h/edcx+ItPxgEKj2S7YQla7RFeByiHrnf07D3XkM7zHOd
         rAeQ==
X-Forwarded-Encrypted: i=1; AL+hErGGMPur0viHvondZIbmPm5/NKlB15U2kgAZWXIItTMl2ibu3KVfPqdDIOXu0dZjiKGVO7bG/iaBPs3eBx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UJ26jZB+sBMMj/BEfJESXIVsVBMpsC3AYXriSWl0KxX/7ycxp
	YY5bA5uiNfUvSUVnTTCXM4RFGODs3lL+bLlwkeWsO4wnlq0KCPJIv3GG
X-Gm-Gg: AYBFou276jjrAjLvJ4DQXOuMbujX6urYEYSPvMs4xMB5VoSfoaO/qlr+kgKlDG34+dh
	tWm4mLsHJdy8ekRRTERhcyVDwjIAD+bkMTaTz6DmQqoQe2GiF2t8YbQNp6lEIdKCrtgcjth+xxp
	ii0HjZhl5RaO1SEd4Uf5nAqumxz2Le7rSKiqhP/dFOYafBwBL7bIFXxNlUcnGa0g3RMUlnROuMy
	66qCItJR8u6sD410h2cENZ3+E7NGKP1beg8QeEErckUaWSyCZGY3hPOnKciGSHivAdwyWuYvbaW
	DrUrFBHSxJviekWyEsxySzwt0SVqp6qdybu6VmxMputwG3Ozv9jbdoDA4uIBZEnkWoEkcMcs420
	HOcgGhnkNVvihmmrflTx3oxtPgfrg684WAwsfEKlTDK5hfQHGn9p9LLqEpRKA2yFY48E734RNwr
	0rvZiNH0MD/SW28VwtA4FFgtAQsb1Felb1LMFPFFytJxdXlY3b0UUQq2Yy4WczQNqG58Of2BJC1
	XclwkN9s3oQKDlW1q5FuV87HsGv1kdevmDqXlL9scPF2VoW00gv7tHMBQaipiqks/7LaOfhBCtP
	V3y53dg4CwzdEY3Cnx8VzKGZXyxAAVxbet5uT+PmYifV8eIASjT6YnAx7ikvyk83wLlDLeNSPYW
	a5l9QMEUrjJSs8SfDlX5dVcgJYqRwqOAiKALezT35MsXUMfAUg+EguST1KIgm
X-Received: by 2002:a05:600c:8708:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ba0931c364mr69232725e9.1.1794461326740;
        Wed, 11 Nov 2026 21:28:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm11119109f8f.32.2026.11.11.21.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:28:46 -0800 (PST)
Date: Thu, 12 Nov 2026 08:28:42 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Dan Carpenter <dan@cryspen.com>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: nv: Initialize hw_mmu to NULL for nested
 vCPUs
Message-ID: <avVOivX0YmlES4Pe@stanley.mountain>
References: <d3571fb535e1832d2a067649f294b83d824d4350.1794395321.git.dan@cryspen.com>
 <86ld6z1782.wl-maz@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ld6z1782.wl-maz@kernel.org>

On Wed, Nov 11, 2026 at 07:46:53PM +0000, Marc Zyngier wrote:
> 
> I think this really needs a comment to explain why we repaint hw_mmu
> to NULL, because the next idiot who looks at this (likely me) will
> probably remove this line...
> 
> The other thing is that this means that nothing can evaluate
> vcpu->arch.hw_mmu anywhere outside of the loaded path, as it can be
> NULL. I *think* this is OK, but I need to really convince myself...
> 
> I'd like to add something like:
> 
> 	/*
> 	 * We can't rely on the S2 MMU being the canonical one,
> 	 * as userspace can restore a nested context. Nuke the
> 	 * hw_mmu early to ensure that we pick the correct one
> 	 * load time. It also means that we can't rely on hw_mmu
> 	 * being set to anything useful if the vcpu isn't loaded.
> 	 */
> 
> If that works for you, I'll squash that in.

Absolutely.  Thanks so much.

regards,
dan carpenter

