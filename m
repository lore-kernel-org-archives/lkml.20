Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716270;
	b=fCkQfvBo1EdYrjQvm5h8YYnhPYeN6wsRx0nYWevMOTjAotnHDSICXxQZs9U9QDmCM+Ot
	 Q8WnhI0oVpD8lgTPml1lZINKNJANPgKA9Dr+8E9NtEdyNnzdWgZylKdxkFxmpFSeIyeun
	 846CcOkh5UUR3ECbvdIiQoTCrmg/+FHgNnyVPk1Xm+376pj/IiXjSsIg7phxZRbz566Ue
	 rQ/auzStE4UHLPhDfZIg/v4ZwyMWLNY5PWw9xYa/6kv/S7gr05b04Y6ZX1KEPKhqSbKAs
	 K24GeuEwUCFIpIZSVk0txBnX1MYp6MAok2aYbeBMtnVVg4100TZxQj4MakIde9JsNzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Ysaq7Cyacxen/YvlMfVmj6mDX/MD0zdJpY8pywVDXcA=;
	b=3+QyNPeK0OSVT9cClxqxIUIoMXxEF7yMdCHM3kVBtjSafSDmR+G7lD+YFn3QR4FUTcAR
	 sIrwz7WoGgYsOonKObSWvR/4UUtF0vjqQOvTCIrmRnJwqcLdUoAzyPnfEVKZwdU2ftCDh
	 1vjm3dAGB4caJY314sJhoKXM97kaBtGjGro92eeV3awVLXoHrT3TnsU0DMK8zAlxKKhea
	 54PSyjK2FL/+CXLOiTlM/A/cWLuc4B8e2nYX/cWTxRHhiPtSyyPreetkYKIg0KSt+a5op
	 5+pSGW/0OVBnTfw/02FY7UUeT8P9LbEZ3IPAM0nz7u9xrEAEVHDuwqYjI3wz0pSylrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CM4B8dLW;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E69606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E69606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CM4B8dLW
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4164917c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716268; x=1794321068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ysaq7Cyacxen/YvlMfVmj6mDX/MD0zdJpY8pywVDXcA=;
        b=CM4B8dLWknDSMXXm5/cxWMlEVn1KQIceffMmr6Pvph7i4TYpB3NdVvYxXQKTYkAQOh
         iOpQQz51Z4hXO0in8yjlonUU7zMuU5pvfiytFDKECXOhLwq1WfOi0dbgUzTUMIWBAKCK
         89gUC3B3xYYTnxXs17POZzd70oHVL/QWRiOqftXLXvb9z6y3SmO2PahjI/uQJSfp8UQT
         jOzYJiSRf5HjvnOTgkXK34H5puHjVxugBzd2EI59KBDu0o0E/EW0zwRqQm4FycvJtBd1
         vy9v2YbHy//8axspYnA3PI82eE7dUr5L5qvFqREzA3MiaZn2LmeXp44F32dNlLocurRy
         5upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716268; x=1794321068;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ysaq7Cyacxen/YvlMfVmj6mDX/MD0zdJpY8pywVDXcA=;
        b=J057YY/VZ/bDKK491QulkRbYKSV3KSU9ubzSdCKKpBkAw9f/yb8gN5RMkoospsaHNK
         zpEB5n6gLF6ffuPUjgmB7EfCLBOBH+IkV0mSe10gWUd0eJs3sX8xnAUFySKkX42meT1c
         8TQiANGBdblqrwWIbyxZy+YJu+QuA4VikjqT0LyuGHTfW3MNuCbz674L464zFeKbZPHl
         cBdOa62KGnwkWUx6GOHhkvzF4Yn7pp6sui0uVWu8QLSLjxUBD40sXjzk5WB5exDExCRj
         dkQ00C1ogWaSradMDSjJGtN4dWztQ3+QyOQBgr2RauqJ42ZUJSoKub8oTVRL+fbG/i0l
         BhVg==
X-Gm-Message-State: APuU4Z8Kf05CIHx70YHjKT3ZNDBOtJ0rXt9z8tUFzGSZf3TSTlVsSCA8
	2JVxDrPLohfVm48siswS1BVPTEsyFQC24gPaHZfC2yfyOULmv36EC1sqnRJl6US9f6W0wgOn8WU
	O3F9PCRY=
X-Gm-Gg: AYBFou1sQ7Mdl6WAxQiHorzovXJxyNTW9jxfTUqkYPwCUv6YDUJ8KjjiyJ2QkiKgn5C
	sq83s/S1KNK53NIpPEqJkEVkuChYtXyPSh0AQbr6DC6xru8hFKvRP2J3Pnmdf56Gen0QASGkptX
	CnYv20/f7ThTDiCt+JAmCWlaPXD3EHzxD9Zp/RbdS+i5HH7sPYax5uqPzTayylCjwTyvKhtTKOx
	zgb+rq+UEYr2NHFVOQ268ZWianOnU2G+PEQAJisoagUy/1wKFrhETEkcmDAP14cxcsOe9ih5qLS
	Zx1XywNJd11qDzIOlSInWheC+NdP3jVUKf5Yzy68X5vxNEudythB9PI0pXWCjw1Xwcs1O4Jyvv0
	WhejqMWG8b8XxOe62w/xNkd8w+ga2v7QYvJAkpCdHlT6KD6RNjifzUR6XIFMasGGFW66oM1wUq+
	Qwqa6jXfgWtS0gOINUj5e3QoVGLFemQFQkrKo1I0At1zfUaRpTBieJHgl1KorH4mzDhhZX4cmqi
	qZ+pLy7pWUgVL4RytW3fynKwUYRRxopnNzWWilJO26QismJOGm0KnstiXA4enILWr1ea43TwH9e
	SOcGpB1NsGOuvO0LKYspcmfCSJw7OgGmTjFt5Wo+xledL2YWSSXL2YrQhMcLTkS72UXR85oa76W
	wDCevAIPOFJ1GOZucsVfQTAcwi3h4F90tIQ==
X-Received: by 2002:a05:7022:f105:b0:168:e942:4e62 with SMTP id a92af1059eb24-1ac601d2f3amr16617735c88.40.1793716268368;
        Tue, 03 Nov 2026 06:31:08 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:07 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Jianan Huang <jnhuang95@gmail.com>
Cc: linux-kernel@vger.kernel.org, ming.lei@redhat.com
In-Reply-To: <20261023092611.116795-1-jnhuang95@gmail.com>
References: <20261023092611.116795-1-jnhuang95@gmail.com>
Subject: Re: [PATCH] blk-mq: reset queue state on scheduler teardown
Message-Id: <179371626714.3691261.13847962595068110458.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:07 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 23 Oct 2026 17:26:11 +0800, Jianan Huang wrote:
> We observed I/O timeouts with requests stalled in per-CPU software
> queues.
> 
> The affected queue had no elevator, but QUEUE_FLAG_SQ_SCHED remained
> set. A failed elevator switch can leave this state when falling back to
> none without clearing the flag. With empty hctx dispatch lists, a
> queue-wide restart on CPU4 would skip requests pending in ctx5/ctx7:
> 
> [...]

Applied, thanks!

[1/1] blk-mq: reset queue state on scheduler teardown
      commit: 3a9892bca4dd0182db61702e131cad569b1d71e6

Best regards,
-- 
Jens Axboe



