Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DD2C15A5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171932; cv=none; b=PZYROBi6q2K5l6WsV5DHzB8h5+8XTr01YP4YrCIkTuRanxRvksWtwxeEYqKMWaUTnRGOxl+xCkrLd0oFrLEheKsskzo2xm3efdp5SrrPJydglTa9DEwN+qXCS+Y/vfhxWGMe2f1LKlxIUnbMG6+huop4O90w5QSwx/qQv7Rp7Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171932; c=relaxed/simple;
	bh=oDdxchw+HfFAGtOiAlLwJIKnl3Z6Y/3M5kytY39eayg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGdCZpKAZAE9/l3P5jbqJKIVdvl28BdY0Vl/ASF9fyd4RyN4zFEEY9yYZWnGt+Cy1d5eMMNJUqClW4tvkVUaffnaMtXOySO9JBaUuM3OibMDbmKgsiBtpMcQ0QvDvRjw4Phay8pd+cid/f0iokkxB8YsC8qwcvWR5XB0OVIA+eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQmFP7wP; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQmFP7wP"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2265174b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171931; x=1788776731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85h0gP4EJzGrJjTm/s6tdHc7gvUEeMEkIXjoNPcxSzc=;
        b=lQmFP7wPAnoy0qe3XSbB/eiBM2esLl5N/USsJjhsB1gbnUEPyt7VReggrpXbcUGSgk
         +mN+Sd9W/FzSyDu25w4DBb8hfKTyotLW8hOeIFxtloSaXyOljqfiiuFyxUzGtRpp8gDZ
         faML/yQDfY6Cqp0jjl1x92v+F99BqzdJ5CNCr/u4Pe0GjMr3EsVmKLvsOwuG/9UqGgeS
         MaHjoJKp69sSXClxpYS9EDQECXMD9945GgpYpTAAcFlmTyEXO7zXl82lKY7fbcG3yzCo
         w3+S0sX4XPwDzEpEHQ+lrlsjZWn0XJVq/qXZZkq7O/tL07XQKsBrjhNWiU+tElG4xlUt
         3imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171931; x=1788776731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=85h0gP4EJzGrJjTm/s6tdHc7gvUEeMEkIXjoNPcxSzc=;
        b=Pucsi5oUVsISoyfTGHkaO5EBgP4uLXKw324Nqqrp20Z7crdb7RnbMV6tj5UIVkfWs9
         +AU5AXDVJZBhy8aG3eQ6lLBiA7sipyvuvJDiwQTZS3L1YUBAHC1GnmloaomarBzz4ZZH
         xF5WmXckSWf5GQ7Ebb53lgSSe9i9g/TdF9EQNl7afHWqz7HjpT39aKTuwYcZv7aKdL4D
         ix4iHXxdmGN00QK8A0s3HkDfIBqnC7UgAHWPkYQyw1vwq4KBJ9rcNPnP1q5LuDtuO34x
         dr2LizhaIYq+bEvlf+NfH8xXv+DCBRGF2ugCjzgG+Q1rpF94UgzCetdHlcl4eLurfeQf
         cnfw==
X-Forwarded-Encrypted: i=1; AHgh+RpoCyINn2Hm05FAgUEVvwWyMeY316IjMsNhvq4BCGaR/CFBOMxjnD/lPeKYe4SlaBNWNELj1uEiHQkTldQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lfztI444YSebxFRgOG47LPj4tsMm/sXqp4aDADBA4vJ2qjjJ7U
	GTxOpOhL6/266IzsTRtyy5iLMKQwBHRy2WIFBpnPnPRHrYpTZcUN1WEL
X-Gm-Gg: AR+sD10XnPytYm1WSMNfdWMHPTKHcxGes8/H1yvA4HucruzzSmJWwI4s19KZxcdPZoV
	3pNPc+BxJ/cN/nVh7H4sw+K3XLxlbjbfWm5WoJUsnmjClyuKXckvcR/jkk3DkIKbbx9TGQaNkdV
	b9phmAAdOiyJ+hlxsyo+y6Db9Q1njAazD4TmywqCnXksbw8Z4S8jBkDyAQjccYwZQHqWsDgvG2V
	0mAdHjFxYuJFEFwxlhBWS42OIFNbtqSsVZ9pcJZKEBwgLxqDecbA/LmVRdkgkl1P9sAecu4l65X
	2mW2JWqeDznzOHjqJ296SVR0nc1oTFqgP7Rqz5JN0/HktVfIdHi06tmaBKThGha5A+w03ws3VoD
	c91gQXps8uuvvTxTGVhqKZ9GDRpsrL2McT0msSiJJd2IpqBT53BKQEeO0fVx7EYOUZtf5uv27uy
	YLpXqpcKAQdl03iMUwXLGfY34JxBUUIfIXKLsmC0rpfA9+5DivIdlv30O89AvSju2zzw==
X-Received: by 2002:a05:6a21:6e88:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3d267b60e7emr43957424637.9.1788171930549;
        Mon, 31 Aug 2026 03:25:30 -0700 (PDT)
Received: from Default ([2409:40f4:1016:5ca4:c595:44a4:9cb1:2f2f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm32800439eec.14.2026.08.31.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:25:29 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH v3 1/2] usbip: usbip_host: fix null pointer dereference in rebind_store
Date: Mon, 31 Aug 2026 15:55:17 +0530
Message-ID: <20260831102517.109498-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026083141-morbidly-swiftness-9f8f@gregkh>
References: <2026083141-morbidly-swiftness-9f8f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 12:04:45 +0200, Greg KH wrote:
>No one will ever notice this, just remove the sysfs file entirely if
>you really think it is ok to remove the functionality.  That way
>userspace will notice and handle it properly (hopefully...)

userspace tool atp handles this properly as it unbinds and rebinds sequentially.
The problem is when any script tries to do this without a particular order in
sysfs: bind, rebind then unbind causes an invalid opcode and attempting to directly
rebind immediately after writing to match_busid causes the dereference. I think
it is best we drop the rebind_store function and use drivers_probe(). We add 
del_match_busid() alone to rebind_store() to stop tracking.

>But, are you sure it is ok to remove this user/kernel api?  What about
>workflows that are using it?

Any scripts/user that don't use the sysfs properly can keep the broken pieces
themselves, no? We have the newer drivers_probe() that can perform this
much more cleaner.

Ultimately we can keep the rebind_store() function if you choose. But this is just
my opinion.

Thanks,
Jeffin.
