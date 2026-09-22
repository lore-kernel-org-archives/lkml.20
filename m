Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4852BE52
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067366; cv=none; b=mwLi7/DaweBbYWTsC9UO7ysDLAT5mubd5hRmJC8R8tzt82TeAU3pHYiWANjyHwmI29KL8WEQ3Eyq57538zihnWS+6fRK70uSn8qhhIaPORdUe+VABUxLx6CFye5RbObE/Me/5kbGF8m1BmmqCdB26dQXPXIXZKUaq5w69zt1nS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067366; c=relaxed/simple;
	bh=jHvRFtQyx9UQ53om8i4AUQfufcwc3sWn9Gux2Mdm/VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOWzH3pkp70COgHYtNDAC8twaZPpUUxp+SF6RixkTiBSv/3KaPdruY/kJNnGPUp3l5lIC32sJnhE9tMpWfI9UdRaAVC9jxCCMoU3aiWNR7u6amCaJvtaiOGzGlqfAeosGWxtv7AofaNDypNLGJl+ZgeBrxGOvNz5oyfGiDsfTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcwSgb8P; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcwSgb8P"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so1799065e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067363; x=1790672163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHvRFtQyx9UQ53om8i4AUQfufcwc3sWn9Gux2Mdm/VQ=;
        b=BcwSgb8PESGiEHRSB8rU42O+kh7XbBP/eXgYknFVk2ofYd//sb9r1R9Mb+mb7yUCEU
         /Zdokqi4DKnZ1OsvOx0xzYuMWO5Wiyj268O3SIw/MfITyrw0ak+VUcAOl9/0zxLuIQSr
         Z55/6DyZSCxq2r2ReOr9FEk1LymRES6AbqIpyebGqqlydfXQffF1ijVCQn0+4pVlc9CC
         mebOzsH4L3+pO+1eZFdVnpuESxP7x3n1ALqfd57BnGgYFuScrTUDLR1rPrN3bA7FjiKU
         Y3DHfQnxvIscvIXlwqKOkM1tAV5lICFMF29JNqVmvr/3kslF9WVOKzrp9CrP1eQEvsKg
         h72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067363; x=1790672163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHvRFtQyx9UQ53om8i4AUQfufcwc3sWn9Gux2Mdm/VQ=;
        b=ssi6xeJgHc8g896mPq9IJRqjKv4J64buHzozec3wMs6+LydcbfGy1M46ZfNcwI5cUX
         vVBIObQoS68NrSevA7+LBSSWVl0CbOG8U0jsSqBNG6xXNJ6RecalmvaT1UNqeAX0Z5x9
         gPWQg88W5crJg3EkujnsW1YX2ikKoHlSfu23joR3qJFPvLIZW6QfM9dtmRV/Zp5/p4HN
         kivphIASsJtK++RuXhxWGbHYADSh0YUpABVpsnKZ9a9JbBQ0YyekWCGztp7SnPtUDDEE
         CNWn3vtURa3Tz3RmElnEb3bL00saB0dMJSS5touPoWPULq2mVTpi+RXqalXOnhSU1m52
         5Tmw==
X-Forwarded-Encrypted: i=1; AKwUvBxfoLTQTYjYIGWQM57n2VGVXYPigRwszpJJJXIGZMO6ecSfAyebop+Y5MfXiPe8M+AcTJiKiwmdM6gQkRA=@vger.kernel.org
X-Gm-Message-State: AFuF++mUW/mbGOu0FLjVdlkitpz7VA//Uei7K+7F0VKLWN/Xv7NIXuUW
	iu3m0B4HBVVyH8lAjsgvrEfxmyuy7VEX0BQptJly8h6pqvtYoCEWBxr2
X-Gm-Gg: AYBFou2Ql7ASQwVSmI+l/UiMEJ/GiBzoQTf4Ex9LkHNRaJ6DWkiMLWkNYBp6Q5YX8a+
	z5gV7lwVGddi1jKnKOruz+dc7vLKyd+reDzpKyN09JvI+4+sYzyxgeEohBlSKderLMdOZeViYP9
	E36zRwJvo+yiFHObX4cFhhQq/EnV3twplsDTn6RsHt9J6WHO51V2VdiYjbyJu5hSRxtVkiqDrhz
	ijzxTEe1KLK9PnwC4Ma4qnvmkJPg/9RHE7OY0EgeC+WEyaA4MlLBoYufqoPGP6GpfM3lj8Ecufi
	1BwtA0S+Tric/NF+sBLBbHAJ7hV/IzYC1Pvt5ajAH5oyVsU8KG4aq6GKoUXFum2GWcj5V86pTtY
	t2uldmK5nykmYH/TB97a0lz2u1EMwGvrTGV89096XHkYQqTcgKUTzkLg+O7CTNO+rdm6/mcNL5k
	Q26vwqo2jk0HMbYa0gokpMphcSgFbmp5ky3+ZzB5/SYe/QIp58XwD43owiXL0MBNzTGPv/lCfjf
	mjSEGd4a2wOYwZwfenLFZNGBkYkLRkL7xKaiuSqZTp5f+Gj87YYJnWPYyHyBGs/3aXKF1C4sQQe
	nIw=
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr211705895e9.1.1790067363190;
        Tue, 22 Sep 2026 01:56:03 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277e611sm3538781f8f.18.2026.09.22.01.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:56:02 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] accel/rocket: restore the NPU clock boot rate before powering the cores down
Date: Tue, 22 Sep 2026 10:55:37 +0200
Message-ID: <20260922085537.53363-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922081326.B46651F000FF@smtp.kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-9-royalnet026@gmail.com> <20260922081326.B46651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the shutdown question from the Sashiko review of this patch:

The gap is real, but it predates this patch. The driver in drm-misc-next
has no .shutdown callback at all, so a reboot or kexec with a job in
flight already leaves the cores running today. The callback added here
takes the devfreq device down and puts the clock back to its boot rate;
it does not stop, drain or reset the cores.

Quiescing the cores on shutdown (stopping the schedulers and resetting
the cores through rocket_core_reset()) is part of the same teardown work
as the use-after-free under "Not done" in the cover letter, where a core
is unbound while clients submit: both need the driver to stop its
schedulers and cores while files are still open. I would rather fix
both in one follow-up, once Tomeu has said which way he wants the
teardown to go.

Igor
