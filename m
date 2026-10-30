Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389457;
	b=yerOQQ97Vu/XKo1Eyz17cfCEPFF5OSfv9Og0PK/67mqVkcK2Wt+DQGy6VMqH44pJSBpJ
	 xiEU3LDskrQ8J34txQlx7MLQFREnUSnXrijvmkaB/QunbL9NHYfUDcndi/dJwnqQXz0lF
	 hPomz0oOhC2AcrRA5AAkmPFm1s35aV3GuRbqYEfzOJfOtv3HsRM4sXDOEYLCGQgb/oGRI
	 r1jNFXt1adHRlO0FZ+/wklJM1g999XFhK9hL3F2DEGZ1eX2gqCY5FVuGM8PdYPJaCQyv9
	 3eTB4tFtlQzdKAGUBAsHU9GqUrumJgVkdtQqQFg0MMBYmiohN2SaAIWmEDGAKTgK3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CXEDrLue/vvnR5MTELNqL3qGmcwOB3zKOMD71X0/Ofw=;
	b=DREo5/VMFyS9WWDNCEksyMq5smHoIO1cLFpodh/9Ad/+0nB9ikz9+qjtwS3/PQlm4f3i
	 QVN1Ojvw3G6RyOGzO+MWMJocXARpHUGDbwLCAy5Toekqa+g6svDMC9jFZx1lLGVsA3JBA
	 VvExU+/ySS53urXSl7DhpcZlw3VfTvNn+qHmuqyhwEebdpfTQ6wK8LLP3Nn8EPX4GsbVA
	 7Dk3ehRlNz6vsN93zvfSzFVfLPhSvG5Sxzh5hvte1ihrrCSum0Zs8ej1bllDzTRJNXTNY
	 Fi9W1r1acgTGYrldg1DJLuiMrOKoldbYPYNV3ASXTfbENkAVbHzsrCgl9vBD02yyuCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OC1WT+5S;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A5E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OC1WT+5S
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-181516de561so1019267c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793389456; x=1793994256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXEDrLue/vvnR5MTELNqL3qGmcwOB3zKOMD71X0/Ofw=;
        b=OC1WT+5S7/D368hSeCHEnHi6wM2PrffXDqeajTJEjjNUnTFUkwPjZTjXoMHWSJ9qcd
         2HoebJ5RlVAJcMFCIDxtUf4LeMj/3/IaMrFs53n+qQInpoNXO/AahyFvfFY0FPDL2YTt
         aORTMmUXtO2fnSEtmvx7dS4BPjjKQUDmD0h3NyJWTfnv/azob4eR4b81t6M6ZJMUsGJh
         dViityIWcGrTBGEx3g19NrYuumb2D2QeGWWr+5eJFcqOkNCKE7MH/QxQGmiYBThh715/
         yLKx0ipRF5y5ALS6UDwq8PrG5Igek+fzspCCo4o8dtueA4fTkeMlD9IiHwC7ECc9yv8U
         CXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389456; x=1793994256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXEDrLue/vvnR5MTELNqL3qGmcwOB3zKOMD71X0/Ofw=;
        b=vn8FjOcSvc8Mpr5VTVHhOQ+EAZYHfFnrWsvRBHrwHqXtk8k6CLcnvq+XzClcaMjjEJ
         FHSJrBKTLF46t5/8iA47UULEumxP4uataBEM1z3A4Scg8yRfLsCwcLImIM8q4VZT0SRT
         B8dXN69gKWKgvtrPbtShXwK1ZWn6fXxfl/B2am1hO82TfpzD7RFIWPIq6rKtuvw8F/N6
         r6PBxzoXlQQR4MdRV+90J0oDR7ogNXfqYltJXvMsEcjjRiFD6dL8i0YMJAL2oBXwaqYO
         YV/JxCqnu894y8S36kDT2cWNXRoX4da506xXsVx5xMhlGudaQ196WF7YUxTEQwaFu3Dk
         uVNQ==
X-Forwarded-Encrypted: i=1; AKwUvByZPX51d/b7jJCZ3t2bb58rCxtbztxtI1mXyCEzWAn9a07HRN879cAAGvxNUefGPFFtXfBd51hIlPplTIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFnC2wmpdGX0nuFzEBaOfGTUgFFykNFSsV9bVZtc1PPlDVspe9
	N6j18ec9HBvAgXEVw49xI6jfuUuoczuXWOOzYBgZ6EtKxmgxHJ+WmWXGhtSV1Qsatq8=
X-Gm-Gg: AYBFou2D8jI5iin603f8y2D5rifSztoLEe9WF7s3BaFXvjnXrsUs042+lzIBDBeESr5
	FC58WrpdDx7lAauMn/2engLcUOlZm7HJM9dzY6EQBoCovmObpzfBYNPkHOZAkOGXACZvOAqyRT4
	MQ/aLIshD8fyucPzGniaZ+qdD6uGDfgY1uL9XvYJ1F5DJSOr7x8uh6HCa17bWTImQSyNRiUGYMT
	llILE7xnwYxxQAv5squjWmb1x50cs+of83/OPQlaZyDF2vHJC2JWp6H163ACDQp2OBbG0tukv60
	csgLlzGO0wid5rwmAJ21eYX8SFgLgNEh7Iol71PqBYCZKsV+M/RsdeNZfpidgl3zo62a3BXlOCq
	gqUX9m3uIhBhnb5VgkXRtPkWc3PYm+pkU7f3EeuHpJs/O2KF2kqHGBBO+JceUvuaJ7bM8kYIy7I
	vI8mUJpWy9ejdT4O01PEbB/IMJVQFIC2czRH0DydcfLN4QVEx2Msw4/H2N5qnK/8TJbKESOIm8a
	L/1N7wg2zTKQzq25VfyKtAcaj53ULOXqdpT9sjMj2HEYRPpm753yt78Eoq3gm6GPZMXlf+N/Zwk
	Hpm0dEtHSJfTfu7dz3qLCZHVOkuPENrtiQb/hGtgXR+OQ5VVzw==
X-Received: by 2002:a05:7022:b053:10b0:19d:233:989d with SMTP id a92af1059eb24-1ac5b02894bmr4460084c88.14.1793389455423;
        Fri, 30 Oct 2026 12:44:15 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm8558684c88.19.2026.10.30.12.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:44:14 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:44:10 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/18] nvme-fc: Hold inflight requests while in
 FENCING state
Message-ID: <20261030194410.GE122209-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-16-mkhalfella@purestorage.com>
 <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>
 <20261021212357.GZ2931-mkhalfella@purestorage.com>
 <45d52d19-dbfc-49b9-a445-a8fb9e69abef@flourine.local>
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
In-Reply-To: <45d52d19-dbfc-49b9-a445-a8fb9e69abef@flourine.local>

On Fri 2026-10-30 11:29:12 +0100, Daniel Wagner wrote:
> On Wed, Oct 21, 2026 at 02:23:57PM -0700, Mohamed Khalfella wrote:
> > Adding new FCPOP_STATE_HELD will result in a more invasive change and it
> > will result in nvme-fc no using nvme_cancel_tagset(). My intent with
> > this change is to bring nvme-fc closer to other transport and only
> > cancel inflight requests. synchronize_rcu() is a simpler in this case.
> 
> I am totally against introducing yet another synchronization method. Fix
> it properly.

Okay, I will give it a shot.
