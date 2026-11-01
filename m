Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517374;
	b=YL3GPEdPBeajmUjM4btphvjBZQenxBMZlO/aPYpYZGsAo9CDwSkqCyFlirY6/W/QByMf
	 FFzic/Uk/+ogJ/jY9JTT8tNPY2V3YfDXcq2t/JPZ1MLM49Y3Xt9TU8Fdj78L270kAQY9K
	 iKLGABLALlGJ5xYmkJL5M4MZEuktCsPUiHsKd0YNFoxaUqVCUGIupwx97aGus6SV6YtTF
	 Q7J3cd+3mEsu8wpYDFkyKe5zVivo2U1fC3MXiM/uv8y9yME3Y60F6XM9L06uVNhUBTr1I
	 yXmt+TFNgeXUEBQYBiW14q+5tkASMrK2jFXSro1jC5tK6/Pgi3eSDorW/HuosH+5nag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xjWYg1n4YKzfxG8UfUkLCh9i6lhXerNEUBT8wvZMd9w=;
	b=Z/yTXmpNPoHLng8pnlVU17KWhmmOKFoTGeEWfUm+ZHQni8bUQrf44LQ2bVuJQqow9+iQ
	 rwvGc9altMFpEuX1ehkoE5f5ypivGNCooaw7RoLXfYXmp45mdBtprUteLs4rQPg/dtSBo
	 UXHQkLRKwHTpN4YxJij+2y6NfUnw3G5UceoN7WGy0k2CYHp5+jrZRwO8JhWSK1vTECbQp
	 PVWCf8rboGX4qrchvFQYbGhoRtg24hzG8PNlU4nAYTeTrLRIDecumumOH9mZjaR0b9aDq
	 EWbXO3l53ujkVP52hfjqJSOSMHfjl/uveyxbEumWbsB7+T7r0iy9SiHoiy3xypkX0+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOe5vS3I;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF16606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF16606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOe5vS3I
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so3503924c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793517373; x=1794122173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xjWYg1n4YKzfxG8UfUkLCh9i6lhXerNEUBT8wvZMd9w=;
        b=ZOe5vS3ISMdrhLgDpU/zp1i9KcXmr3D9SrI84jkP0vt/ytPubliSrLdOck/fcukufg
         2PUJKPhFtuKEukhICewninU3btU+c4JZS3aS9KP+RLkqCKyKi82tLpwwJsx//oCDXvh0
         ydib1+w9CvBDBpmHhsxjohRqCyZuJToLisyzIA8nlhTnccu8QvKSlSa9JuOx5s/HyLbT
         ycxtWq9WZXZJ8E62EQXgZqTnrbB1drTTqs8V3bdZIfHb0odBKFfqPCfKNtzgv/gQCYvE
         uGsHb/XGOswLssr1or5m4E/a/h9lDnDhg1Zv7X362kX1w2qcvXhOxskC1cFIGrXkZhQc
         F3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517373; x=1794122173;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjWYg1n4YKzfxG8UfUkLCh9i6lhXerNEUBT8wvZMd9w=;
        b=yTa+uslG6RGo5BUVoeIf58JpjbdD8p6SH87+5MQ0m/2DyF5sYLOeLJy5b+hC4sh1ZL
         zphZGIk87K+LGNcbru3zcRhj/UuO9m3ABqudA1wtfYXdItAiRyafJExY1kyXImGhGK/b
         7nf/hmoQdennoHyAgURjN/OEC9dZ0jY7nFR36CZbBg7wp+ppR7eRvenb66jXsyRTlIK0
         frOhp5ozLty+70bhCMQ8YyEMW26h3XaHtMaDDIMvGerovh/t/Zg1NZg22ocRFyNpopOT
         B7XEo+ObcunkS33i/yqmQwHb+lozOj0y/kOYQ4COv0pasUvCSghggD6mUZBg+iojbUHA
         boHg==
X-Forwarded-Encrypted: i=1; AKwUvBySRzKr2P0iBVzOlZYP7GmCvHEHsA1K3TiHq8hs90Ybu2qTQtaVBlssDyb00F5WMz7Rs/DIzwbOCsIjD7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1w8gp7HOMfwN0kayFdkG8hadvFbV1E8GDw0h5FY7hBh42zM7/
	asb8aB6KF38LgIBfHDVsGJXbA2Qnjxb1TUWQunMz+1O7u3/EsrZ+FCNv
X-Gm-Gg: AYBFou39DKARt3+hTzCgxgN80j5yHlyIHVd0QGV+GnK4yB/Gz2L4OSle3icQNvmxEsa
	NoIntbJ6Ajf7WPeNu/7TccBHYW46mwRfOfzOQBUfJHzmvGglwkm9qI1DrDb10iSgctyY/EqEkA1
	f6WjZYzqY7Xl3EZROlaBSIODGk/pDk6NmNSc90sV/IJ2gcQsqNBAjZ4lwVfWPd0xRIqzqG3gpWH
	AlMgLUqno33/Yx88k32Jasadwr+Vhx7zEM96k8wlFhsrwJBGb/smeJg3qu+9hNkr1MttgDX7pGf
	VbFcAzsRLGDsPkvxJmBc/Ml/7C+hawwSWiFHTvQ4Hhw4nsrYrwZyPGpJ0rgh5obT2EIuUsPPDYx
	btjU51zW66leCay5Q19NgCkhL46M9KhZKdgwjra3pWTwtDS5cH4HTZLddU2yDue490IQDA/5Q7D
	I/W0q2fMIs1Hgu98YA7yyiV4+W2o1UJO5iLpb8DA8EWCUBzzCy6SE1vxLVOaj7W/+OrHvl7OZEi
	gMzmpYR4oRAShJ0uMBw/HwJGkprCJrN3l4dv0EwnGFrw/94Pn83bHwWTy+CgXg3ap2JUiPNV1Mp
	su/Y1ITs1jFhB2bS4jC1Zz+XZ4jK4ucaveajjpRQfo/tt6fDfFdfdQZwuStmsB+J3K22
X-Received: by 2002:a05:701b:2401:b0:167:4198:2cb3 with SMTP id a92af1059eb24-1ac5ae38bb7mr10000684c88.18.1793517373179;
        Sun, 01 Nov 2026 00:16:13 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm23197930c88.22.2026.11.01.00.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:16:12 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Qu Wenruo <wqu@suse.com>
Cc: Cheng Yongkang <teel4res@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Filipe Manana <fdmanana@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: reject zero num_stripes in the system chunk array
Date: Sun,  1 Nov 2026 00:16:06 -0700
Message-Id: <20261101071606.1854874-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d2ee0cc1-674e-4447-88da-d346122a43a4@suse.com>
References: <179328314071.648427.12527832319954042748@gmail.com> <6ad220fa-d6a0-4b4c-a313-a0cc052b8637@suse.com> <179334729054.2353588.12398743988940745859@gmail.com> <d2ee0cc1-674e-4447-88da-d346122a43a4@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Qu,

Thanks, I've sent v2 with your change:
https://lore.kernel.org/linux-btrfs/20261101071444.1853699-1-teel4res@gmail.com/

I also need to correct my earlier reply: with the assertion disabled,
the old expression gives 48 bytes for zero stripes, not 16, and
btrfs_check_chunk_valid() runs before the loop advances over the
chunk. So removing the assertion is enough, as you said. Sorry for the
confusion.

Thanks,
Cheng Yongkang
