Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B953DB339
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613259; cv=none; b=P3rGlZ4p/fyGeRATC7y6gC+XgkyMnj0b3WQeMQrH/AsFCPabk3pRCQzhEypqfFNEp/++0C/eTcqKn/D2MQD4nsqn4QyVpl1yKieCfEUeOCN2ZnUSNnZoy5ojylze9JbLIERafa4MUw0bx9e9j6+8ZNhyMuBG/3Wte9rMrhExFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613259; c=relaxed/simple;
	bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdNDMRbv0emlp1U4dQB7ZHyyM+qE6vAlluwcDoTBXHvKHnRFbj3ns7a0fjy37SN7o8ZP4FqfIr9SzGbNtRZvImcySRgwpUohPhQ54Sy4luhRhVo0CVFL/vaq19gpucg6+/I+uErS35ApXRGDVuPzthB93X4N9xOEq/Iqw7+ZZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip0UGn9w; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip0UGn9w"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccc7a6070b4so142046a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791613256; x=1792218056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
        b=ip0UGn9wZfNJ0oel9b9UB18IJILq2ODa5gcehD9jE4ZEYAdW5Cf+HKemijYyuOjhuw
         wbf5T1snBXusb7qSdM4+jxAZgztX4vBVd6pRmLKFZzQMuN73p8cNN+NWAMGp9XNoH+2d
         oCkx6sG1yvVafLgl/eAbFFQWBl+lXDARS8rw3dSMlTESZjgXTghAru7q3ooXnVCkGv4l
         traJZMzH/BipOYHBSH2SNY7EX00e2dimvoLU7op4ejaRBPZoOalpxY6v0FUSiPxIAdT7
         f5FMr9Z9RRYKPJBQSaHWRyqO65zkqgszvNQdZKS6tdHvIfh8hmJJQwBi4z4MY5QWHycU
         pQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791613256; x=1792218056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
        b=eRXPcl/6pfv0WDNLa4vY7LTPFK1v+KcvsRjqvbXuJgg7AwUhUcDCqL5qbhu3Ykn7wu
         Q4LHfg+B20TlxVFrh0uyYgV7C5zhs4e2r+6P8uESl/VDYnBm9ZuXzb/Oizzp8t7FTIkg
         iNI01TQEvN0MGlCb7X7UWA8DILfbwGTkdZuXfJgt0Xy3qCqQtsYoAGqn9qml/m0jYtTq
         g6M/08ANlzjAkk+w62qQCgDrrNkYhVxppUEI4daKsLl10zQeWVTe91RatvD1U2s1CVIj
         Kd0bB7HmLZ8GDSxBtVhWihGf5BVtt2YotUMvJvqeJtMWEhuOH4cp4Zs3e5qLnMkV2i4R
         tArg==
X-Forwarded-Encrypted: i=1; AKwUvBzjUP4zmALEYwGkgUZX3mJSlHI0SvbBc7ypYbhMRIxd3Z2L/sB3h2qRXVOaRHSiM3bVxHSy02rXM6bYOl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxYz6HXU96Q9Hcy5CQJe0RUSOv/jGPBDSW7yXSZPF6g5z6w9nj
	zyX4h66sBgqc7AkKSVJPoNg0cq825xVUns0y60ZcfehbP+8ofQxzESxF
X-Gm-Gg: AYBFou24FT2Prdi+gqyh4xDiBMXIw5ZUaIOhzP0KFKAyvre/5wUKvTSnA5X1bWWVgqH
	YANR9AN4lcg/WhrCM9agLXxBnLie6XWUIiGLyYlv3avBKTcZ0hWpqCKcWgT1FpXNNWndEonETgx
	ZGGLT+5m2S+M4l+bfENiGXn7CzGPF2EkLja5UkmBDXLA7XMG5PjLLNjpcgcRpfENu5YT1TlHZhq
	3OZji1OJLNNITgykGF6PrhO4SvNRXQL3HxFOrl/D26hfqjrXFR0NV/3UoW33TnP8xX91e/tanxu
	ORN2sFn4RSDaWVd14MiO5vQbodXvrmmUd9ckV5P0wUPb1ySKXIXEfoCeMXAJIpC8xfAcw/toVqP
	d+qg0ICIz4S7CpY5iBGKndtRufOE5OoBnfEkAypCVLr+SWMLCZY6kTDoHIMP7Ji+1f0whNDNxxa
	6IneNhahAMTJ6m2QHh5KUFKcCD+i9Pd9183Qy8v8CyZV8/vPLXZZgLeJtbnPbrBqtm+7IzZFNc9
	hypF1pvEoUF6T9Vf7wiwWfviXdJWeRKhnWA4I7Cqfs1EVJTJQHSCl4SUD71eCfRBC9Mu6iqXfOW
	lRP1jWF4bpNKgvg+3gsGPW0=
X-Received: by 2002:a17:90b:4a90:b0:3a0:d79d:b6bf with SMTP id 98e67ed59e1d1-3ab3a90e590mr2805853a91.20.1791613256121;
        Fri, 09 Oct 2026 23:20:56 -0700 (PDT)
Received: from Inspiron5409 (61-228-80-139.dynamic-ip.hinet.net. [61.228.80.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm6418243a91.7.2026.10.09.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:20:55 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	chenhuacai@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	kernel@xen0n.name,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	loongarch@lists.linux.dev,
	nb@tipi-net.de,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH v19 0/13] ax88179_178a: Add support for AX88179A-based chips
Date: Sat, 10 Oct 2026 14:20:47 +0800
Message-ID: <20261010062047.399148-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested the v19 series on my AX88179B adapter, rerunning all the
previously described tests.

The previously observed VLAN-filter failure did not reproduce, and no
carrier or RX failures were observed in the test. No confirmed driver
regressions were found in the tested scenarios.

Tested-by: Jianhui Xu <neuromoments@gmail.com>

Thanks,
Jianhui
