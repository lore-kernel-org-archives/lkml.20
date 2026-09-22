Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382618FDDE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064774; cv=none; b=KXV2AU9zKuQTqPnhmK6PpG4sYwMZTPFkFmTtLrio+jhX8KTUZCeqS4BlIr84l8SQvQRL62vzovWhzZtEMV78QadebFxi2fuPtrKXpqctrDET/01TJCTKTLadRk0pKNELiF/lQYKer4bzNVK7xS+Xusp/9GG/hUuQmmtGbiJotzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064774; c=relaxed/simple;
	bh=60x8O/YrRot0F50Ltg76B2oYgHHgxNBmBw6ELDymd/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhWJGmSHpap3PVYAY8OKOAsODHvlYCxe6Pr2an2JHrsYl38ap8hX0HJtwExveoMpXDunBpMjwS1+d1nV+MPdnw6YUZKugTaoeXgwpvBlCm4rIqYhqoepaBEqXZze8y6R37DCJS7uQ4y1Wd3o7n//b9Am7WQsI9fxlPbAxjKp0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3942TiR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3942TiR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71974de4so2806215e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064769; x=1790669569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60x8O/YrRot0F50Ltg76B2oYgHHgxNBmBw6ELDymd/c=;
        b=E3942TiRZwnSteQ5srhVfVe3o/SmjxewztyUk3I2Ald9sbgX59Bd427RgAyH5ePOck
         kEQRw73owlIUHVsbg9dWkZrbUcwcivI4pdeGL2bjkmdDPl/QrElPHIbAIYoGQgKdpgZQ
         dQfpKxiy6dyFUPRj74THiFCZ88CV6VmLlxyzKqkeFzfOEZAMTFFSVnyY4kYcCuHyh/IG
         Fvk0eUfbBm6jMVa4FBSFWvEg2YpZSaEKa/sdGqMbIT1d1GE7ZcgkMPcSGmkfDWUpW0Kj
         o1appyb5iZvGfAHiZEM+tlQCY5ANfJV2jIxUiFjpMgpJIgQdzg9hCy7laxW8edWHLT03
         TfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064769; x=1790669569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60x8O/YrRot0F50Ltg76B2oYgHHgxNBmBw6ELDymd/c=;
        b=U2p5B3+/klZXf8ZTFz3N+zPccboWFR/2KR3E+OC2bf4Xcx+vWE46f3RKJAasM0XCd/
         GYkpttEo2O+lXSMEbYoC77n42PP3US6uNrWoqb/wyR76zO+7IDDb+BRqA9QM92TZfEkA
         rb0dx1kGfj3+l7ipUHqvmxschYMiTZULG+c/+zJ8D57/yP2LbM5fSacftNSleK6Y7qgL
         c+M8wA20bNIjLAPDlMy227+Iy778vGAmmXetlZt7CJ1W8uaKOR8uoPIaoUsNnGYo0TFN
         ecRUqpETxTIySE5qcGg1vdsqxe+Cpkczh6rOQXZX/+Kclomi3ce0X1TguTeij/dLzR/s
         HNew==
X-Forwarded-Encrypted: i=1; AKwUvBziOCBxsfJMqoQ2Y14BBPDKhdPX6nW43IugpCUlJRor6CAr+PuWYsUIUaRE2BZxnnsy246O9f9YnEPBrb8=@vger.kernel.org
X-Gm-Message-State: AFuF++lO6xqolndGIDzilShzqnn9ma9lkX9ZMMQxwXE/sMAfmVdg9FwE
	qI1yUXMberbe/ozNKEhwArllnjXrCc/F54MyQ4/ZUoReUDZ5T25SXF7i
X-Gm-Gg: AYBFou1k0warqQWFjKRuSJ96S7a5Ovl9gnQyC1TddJhQpahucHXrhYlc/dXn6CRM6an
	h4nppplDoKLt8ykf5dzQoNGKUlOGiLWgHghVHq8AphWaYVv9PR6zQxvVZv342coIu8CxSmvOCw3
	9kjr4oL3owWMEaPY4QE/Je11v+sMUleecD6nSz4YGjvyPhQuseShhQju+2ybkN5RFKzo2fbfqP8
	3z+oRxpO0CxA37ozxZi8AuuxAlENHWB8ps1NiFOB3apqYCAZwupZjhhO3BUYPvFbF47B9zUPpMp
	cf5NfaId4sAKdUwp7d4/tG2M5gL8rJ6//4xq9i1IPYTF6n3dK+XCvlQWJstqbqaAThKs2/+ipsZ
	zML7cw+B5KPcO0TUWlrORb2o1WHKJcBoWGLIWH+eCuHsx8k/3P1x2u2iTNM9wXYoDlOXOzRXr4X
	jySCGB+Epdjni4G1E26/DoyWnHjdpoyAHrFfXMAH2oKm/Nth4Ngia+ejrIpSTEaMnnDR/OnN9KE
	SwON1vTU8FZgBRqwX/13dbAw2aQD5m1zTacbOWIrf8JxT3d40jUn3Xf/EOUwbc1XoO8zbnqnoyp
	BZaPLWt2s8FW2A==
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr199991445e9.2.1790064769228;
        Tue, 22 Sep 2026 01:12:49 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad6306esm34086575e9.15.2026.09.22.01.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:12:48 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] accel/rocket: fix shared-device lifecycle on probe failure and unbind
Date: Tue, 22 Sep 2026 10:12:41 +0200
Message-ID: <20260922081241.46091-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812130311.8252-1-royalnet026@gmail.com>
References: <20260731064933.12548-1-royalnet026@gmail.com> <20260812130311.8252-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tomeu,

A status update on this series.

2/2 now travels as patch 4 of the DVFS v2 series, as v3, rebased onto
the slot fixes it builds on:
https://lore.kernel.org/r/20260922080114.44662-5-royalnet026@gmail.com
Its commit message shows the crash it fixes, and the notes under ---
list what changed since v2. Jiaxing, v3 changes the code you reviewed
here: the scheduler list is checked for allocation failure and freed
when only one core is live, and the patch sits on the slot fixes before
it. So I did not carry your Reviewed-by; a look at the new version
would be welcome.

1/2 is not in that series. It builds on Guangshuo Li's "accel/rocket:
clear rdev on device init failure", which is not in drm-misc-next yet:
https://lore.kernel.org/r/20260708062845.716487-1-lgs201920130244@gmail.com
I will resend 1/2 on top of it once that one is in.

Thanks,
Igor
