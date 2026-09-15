Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F566443A9E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508305; cv=none; b=nB+EiWrwELPod8Z1pWqYPfYuFm1zsZoxryb19mRhM/wtWVjGWdTqsJpngD1bhcCg57xoJwocIl3mEnLtSUfV4BjJTaRIgfkAGegiJ49HOt/aqPwo09NDbWHParpzGUf5mOgYgI+Hxans7l+YNs+TFiCp87mYWRznCfMHtFeAgwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508305; c=relaxed/simple;
	bh=sRJdjMNq8iNjwpDIBmIuNCaQb8aJVuFJtpaL92IS5G4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LY1W9TxiBjANm73SnbCNorl5XU/wHiO1OuI/skN2PJ+qwQN4rFK1jW2gJnCZASgACHgn9/3P1yheOagnXnQnIecmjDvyO3yiaLTFrjW2ux+rj79tVmMDYSrj341Gdr4tBB2foVBda9mz5WVRv6Jx8baoq9oV4iSn405TLtLLa2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkPNjjH4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkPNjjH4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccff31419so2350335e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789508301; x=1790113101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sRJdjMNq8iNjwpDIBmIuNCaQb8aJVuFJtpaL92IS5G4=;
        b=NkPNjjH4ifWfKCLHhyBQYoFDXvaCxHl/snH+ZzcGXQ6PAaAw1xX15lzb6VHsNpp41H
         dui6RZiXwRY+bBwEg2uSJjGKVBv9Rnq6Y5AmbmWSbTLzZXMfzH0+sYTLGyqNdZoszVLh
         vaKGESyrKLTFjnq2S/2R2dPr/PLZt6UlvWX40qviv3X9NXhekJK0uXmWgbuuatiP0EMT
         MRCY8+cet5lm4t1akTdAWehW6R7blkp2Dfjh6UmFdX3bZCpv1jIsIdLnniE5dxA0R1OH
         uP+hSfgf4xbtymHXRsyRJTv3PWEqNRJU3X60PnX4xx6ViG6gEWgIPmw3vJnJDF2zTNxM
         9SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508301; x=1790113101;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sRJdjMNq8iNjwpDIBmIuNCaQb8aJVuFJtpaL92IS5G4=;
        b=1n9rDmiYNnZe1MocxiqAZ83svRNwkr8PYxyO+1/uS7CMxtrpB47aCoi5T+XBPxlgIa
         j4ZpIfPwrUpEn6YB3R9kUPycW26uShCpzO19K0F6RYSpR7FUdd1MiVOe5ynQWa2R08qG
         gcNxqlGPfk7dneqn/6O0vkdAX6Z6YsHtDPBvqbKcXVkFt7jgVd4XToEa5ywQZBGRuDAt
         hngyM/7G9Jvy3enkRAJeUJ3NwyodAJYcjRNUWmBvn2aWJxuEETEnL1HlninH7A1WSFdz
         Cs/sfj4aZCyULqqZlFHtTXMZu1vytm/RcY9XE96S9y+bNnkVljPgeFYSplEl1JKg7RwZ
         9/Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzXbZW0yo1OIgLd9ECuN3zxWrKLRbdalXjii0JVrlsGJfAbBiq0l5PgzdC+O3PZVVb1/Q5M1ZQu19Kup5E=@vger.kernel.org
X-Gm-Message-State: AFuF++n2J1B1Eil+MVk+j8c6jIpzrVzKQ8T1lytqouxLND6uH2ZSI7TX
	13h+nZIV29r2vELQnAk1knRFmg5E/wgCnby5joFNvVuVF2SGEyDTKt8K8cYCPw==
X-Gm-Gg: AYBFou0FDdXEcIBaOJH/7ZJcsK/MolDG7fAbMJQF/++wWL1CEFEGja/eNWYVF01Ii3D
	TB2LwawTCdcmxRT64CwzwfJvPY22IMZ7j7avW5fZNDpMonJ6xWskUTrvcG8nCAkWXGaxoxKJN/z
	yG1IV/csTMRXVuGyt3jvXavzc/WwYncZokgUmQDIWAGBUnp90LuDKoVq0ui/QDgwePvTQV/S8UN
	snvKE10j5CZYHF/shhEmPrxWD38QJsuLq45P9y3s2526iC285diHixZzf1whtCMDA8uHbFdyq0w
	5DrjUgNO+kxf24Poqc8SQx/AGIOU/VMP02FWU2CQm4ht9sAfdnj/EynfJd9chXTxzaEZK5MIkMg
	B7UUMQOGXFqal7Rgj0mkt5PYnsAqEYjHv7tk+bpAVww6Gv6kol/pchmS0obO3iTzO9F0+oVTo2G
	s5GaeOQk2TOcXzGGX2FELf1GJbfIxTL6qBVKCVx3EftQeMb6qHeluHGWrtFAEMHzN4Xkg7npFFv
	vUnp42gV3E=
X-Received: by 2002:a05:600c:c168:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49e7a662e89mr107381965e9.7.1789508301467;
        Tue, 15 Sep 2026 14:38:21 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm1927059f8f.20.2026.09.15.14.38.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Sep 2026 14:38:21 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:38:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: djraszit <djraszit@gmail.com>
Cc: Oliver Neukum <oliver@neukum.org>, Alan Stern
 <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after
 host reboot
Message-ID: <20260915233818.5881ad97.michal.pecio@gmail.com>
In-Reply-To: <CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
	<c335085d-a824-4632-ad3a-c06715258c81@suse.com>
	<CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
	<1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
	<CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This looks bizarre and it isn't even obvious which device to blame.
Have you tried any of these things?

Disconnect the USB cable and connect it back, without powering down
the disk or the Pi. Can this fix it? Can this break it when good?

In good state: disconnect, reboot the Pi, connect. Does this break?

In bad state: disconnect and connect it to another machine without
power cycling. Still broken?

Regards,
Michal

