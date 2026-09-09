Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AF92C08BB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916224; cv=none; b=bOu+uKKSh1uqnzRgUIqLo/1ZyTTv0k4qgHMgIbRAdqj51UONP76JPbA6LeZvu8DKW+aVqWEsoxCRQZ3GN4L5oynYKBjCTmiSB4yADQdkk6fAzfe8K6TL08NzSnLbY+/bAs9Nm3HrvjfIwoKUX+tr7io72JT4g0GEHXD58QmE/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916224; c=relaxed/simple;
	bh=/KNkqL8brsMMGc5Cqzr5HLntXTDWrBVEovCUk8D0+MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XHSZ0WvBtD0yHzwWHnGOV2Iva+D6FsPTFdxUsZuBUtjb/FnNBPiqqffNpBconMNvRbOJTmsLVIrG+C8DVCxWOLhiWjjWvDvFrxxMVmrvhruF6FAZs2T415XSSV/XjTI/u1hU/vFcFWc5j3lJCUwJquyfqtj5BmzN5q0jaG1svf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NWZv+NG6; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NWZv+NG6"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f4f3683fbcso5211719a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788916221; x=1789521021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=NWZv+NG6ScWiJXBrzINv5nf+h2CGV4UewtnGQ7IVsT1w+viSyhB/HZqxuZbdSyN6NH
         fD1upKpbC5Ugif8JTdXzeAkgeGi7r8nqMLy+XbJjyUS4P4qdVwi/DLmAVmHvIZmeNcN0
         uNzLIQVzE42+2h9B7fCuUQIK4ASVycxHxnFyZN8uaKvqRxjTNeGJFXS/iknYk178z4/w
         Qaqtm/xrcpMtGqi0Johbxc+HvIn0dCXZ/xLQiYRFQjikoQ9iUR7H5l5lesstCH2OqiSM
         P9aigVKQGV+U02AZizU0hX58ZakAPxC7lZHwj4q1rjbdIncAjD71L3X9aRC8es1VDpEA
         abug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916221; x=1789521021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=hV0W/qoVZb8oE9z4Vb4xHsx/T3DhG24btsICUtvsC0jMg3yUkJEwnTA2yxclxViqQ2
         04ijM/WPkrtZK5eS+jfWMrEhxSAcG26xs9EshyMYVC8fXAzu+LAfRGWk754HHkYl7SuR
         2zBsNF2Dw3MIKun9A1a9rciQYwm0sIX9ot9mEyNaG2Mx8T729DA8S6db7W5s7QLUMf1S
         T4YfXu48zSaAMf5quWMQ80boZ0h6EGdAqe51CkR52b/Vi+3KR4ALZsx2IA/afx4eavq0
         6Dde4UnHh/WIYgwR4QLLO2hlFY8vVAEM4VZOMRsMK4TGI44HS4vQIIbi3/7tWEHoDf3N
         Zq0g==
X-Forwarded-Encrypted: i=1; AKwUvBx4y7Dt6bc9kkvFwcVeXf9gu0vYMG/UV4Wekq5Wg4ms5dHTdYbPEBp5omcvZ/jgjtaFAJcOv6XYq9nKh5I=@vger.kernel.org
X-Gm-Message-State: AFuF++lldzjp3nBqPCw08n58YEoBdnwn4UDKMQqfpYj5PjyJ80WS/ebi
	VyDg6OvsyLyv0+hl34aMp+v6HW3oNjCYMRxTOBwS9CEeQnhPZavw2fUcodzAAarZvkE=
X-Gm-Gg: AYBFou2b2wbzEd2Qz8Wz9M6YYXSqaQYcW5K+ZMpP0LYbVV+r29ByZAuHfQpL578/Xpe
	NtyjwJ73ZGUOMI2xMtgYij4lAE0yyr4NgimF84TY09SyXEBP69JHCnQuRUP0qS1pYFhjWopJE9a
	Hfi7fPnbwF6u5PG8bDFoLCLswLzMxotXibVWGGn/AGFYq+5CBlc0RPG0YVIf5rIrZthE2jgZij3
	+y1D0+KqjVEUkapcf4Y7Ai1p9HhkOKTXs3MZyd4Wm4lTRGgHdODA3Gua+SjSCV+iI+Bso2e9SpQ
	IkPQ2pa882UCr32G89LkWzikZmXslKFsD1KBFiMv6tm6WwUUmhZlXApIVbKN10HtmELjVwODQyU
	w0QfwJKrv2L/tiHk4MU1XKcP8p7oiLS8YfQbU9yVK8eYApLl+cnKxIWo2MUzvum5rAB/qtcmcAj
	Ri/0XpNe3t1yTAmU3bpARFs4A/WcDFy0FM7C6gsQcmPoLSv7cvi0EzfCQ1x771LrwJdQrM4s4w/
	YTi4+FdgqX4oViw1xX355tt7yMxY1jUkfHnB+xgRI/zc0FaZY95/BtgLg==
X-Received: by 2002:a05:6830:8411:b0:7f9:5a3:c24a with SMTP id 46e09a7af769-7f905a3c4abmr10303149a34.33.1788916220674;
        Tue, 08 Sep 2026 18:10:20 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa642bc562sm16613685a34.16.2026.09.08.18.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 18:10:19 -0700 (PDT)
Message-ID: <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Date: Tue, 8 Sep 2026 19:10:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
To: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-7.3

-- 
Jens Axboe

