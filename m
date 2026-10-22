Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660675;
	b=G7lEVImWTA4tDBfdyuFoEmzYQe6/RW5o91VLN1trcYmmsUgGNguC2N9BOU7Q+Ls//mnB
	 LwX74GcjSLqyYpFwJ5MQaFmfl3r5OpOEi7s6R+5iPXZfYYkrATT2CIHoev78s0F+Nny7e
	 sTmaaDgWJVLuOhziSR0MmiAT4oklWMAyDl/Ueu3apcGPp8P1NLECOYgtkiYXjYCHXiKq+
	 gW8C53NTX/TgaPOIHNlHaesVHXQTPHW73QbmmI/3ZSXd//oWEQ6BBsmWi67cmSNyS3Xyv
	 NsA6i+RdUIjEMNhU1cZArhfj63FeJON0VnSALCshBgGu2tiDqUjVezBJhIhDmhFoCGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ocag04n70GUcrKlBG1nR2WLrZJEaM8t3kqqnu98kXw0=;
	b=uZr4/OVD70VuOJl+ulffjq9wgwL+lti3UlQtgtjNP35kSKzUGLbDd7VsDGNz+rlGbImn
	 QlFYmEqj2STpbuNi4Bup25yVMgNTmOzDFx4GFNgVlmjXsOv4rLuRsJ5aLsnSGxDdv3Z1Y
	 04F83zO+EPsE18/K9lv8sG4O58doyvoHf1acFiWaStO6FwYF18A7WnBfiXm5krVp9qBia
	 AywRX42d4zkXnCQSXiroPwk2sxgwNEP2WTF7zy+U5/pfss8PFzHL/oyatPBfVEeyo5AWt
	 g89kg2DR1WlSyLh+DVgEDurNAFP03PEV6uijrJYDVt7XXZWXtAHUeOKzcIb9P2ChtmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARxRqF2b;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFCB60A380C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFCB60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARxRqF2b
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-157fe9d771bso2113942c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660674; x=1793265474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocag04n70GUcrKlBG1nR2WLrZJEaM8t3kqqnu98kXw0=;
        b=ARxRqF2bp1UI07Z6dZENz8Wz0U7A+8wUi0hR3rQfntMekDe3/ZIvk90kzCQF2iloOd
         xNoO1j/kJR5XS0r4OIeupeR7SWe4OwElclPwzLKrkxYrh8r94cnh9aNmzOHQaEm8hnDH
         XGyCdxxwxs7gVpEzP+lNMH2Y3JlCyTJAZQCujSVywYST0kDNpNaZGVnIAXzHU5FnMIDW
         eC9SG6aiViNYNxqOz7Z7k78GHfmaG2zfu+tCZ3zSgHLiEyRgQ7zo7HDMFXivF8cu57l/
         rnJzapELfq8GMFKElJHWgGiaMalghAvq5FgPYayjuJQ7ZdMcleg6SpOGegTmfSTeW8Le
         6cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660674; x=1793265474;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ocag04n70GUcrKlBG1nR2WLrZJEaM8t3kqqnu98kXw0=;
        b=SALt9Ix3tJhdVFiU80mQQpKJALseTrpSJ3DiZH3dOavjq7XgaBCrotZeC+r9XzmSTj
         FYkIsm1K0wnjuIKk31KtkcJnxuFEhitDq5rrzX+JSa+anoDjT9hxOVvQH/BMX1dHLpzE
         7NrUAWIwJZNXf+GRm10ylRyv39ALxs2iSMQZqd5p82oWnSoKssS2vxY+01Cy49/RUWMU
         33JwP5oJtYF8yGxnywgUWr04Q4TgpTJXLLKRsSkLLSxDRs/b3LBpMhALlhtn49hcM1Ik
         +ITP7or3EdvZcI82+Ewn+Na+tgjDmvt35/nbAFv1eSuw3iSW8qK5HAMqQYgC7coNGsVG
         y2rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFmHm4Gjlsd9ctaGh2NUrEsivEdmO/Muz0rlf+ER/M4xQ8CLOkLt/nmUrhswXDsll6DLcaWC+WwEy5cTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0Dg9SK0iS6EMo3noe/VE9wmfQUDQQ8Ur/GGnQiP3JNEOgcJf9
	SkscQqUtnsyJ/5SpCjQcjruKYJPnG/QQcKp/2jZPVCT0crvdYE84J1Pz
X-Gm-Gg: AYBFou0QG7EyRNjlVCw+hyxdyMwhEAJ7+xn0Qzd0rz1iylq0Fxg0ggo4r5OTM6RJJVN
	oexKFdPT2/mnXGtzkjr/Ud5Sy1nJCvSzBHACm+n86KZdHJ0ETHhgvEi+GY2kdA4lMbHO4fW0gxM
	7jPa99pAmIZYqqkNCr9DmJrUzlvWT2H3E05EQRcxz7folOQCJYYvLeG6Cda3CHVTDJZbzM+aNSP
	O275fb7RQHZelcLGl+uiwrTQPI1ojUjvJ6+XpY9OxOW0ELhZU96RCoD0Fj6q/dnV/Q7Fu25NLoA
	YTPYvi2CxnwX6VoDkHYouNLIjz6Rj5E/905zQ+jd4vMsYpJ++iCY7rGMG9wx5qEMZgCsdoEVXuC
	XmpdUTmLEtrMhHbcEMVvyGUxf4E1TQL43F+latcbwBnUpO8hUfT6KASTIPtTvNOtVdYohLRp4si
	xcnwTlotbxVnZ2momzMreQrfIqod5wlGrqrwwsEdp1ncwf/K5r6dNcn1Me33+9/WQlUQv+c27xj
	afgeubVwujAuR/uBTN9pLsx53V2GpoHi9JAokWQoBcp7UnH/HtnxczBOWCk2LV8enm56JCDKWfP
	mTwhfJRYiEGbcP6Ue8k=
X-Received: by 2002:a05:701b:4194:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-190a632f93fmr5636140c88.28.1792660673930;
        Thu, 22 Oct 2026 02:17:53 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm13436256c88.14.2026.10.22.02.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:53 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Benjamin LaHaise <bcrl@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/aio: io_setup integer wrap can exhaust global aio quota
Date: Thu, 22 Oct 2026 02:17:48 -0700
Message-Id: <20261022091748.3653127-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

ioctx_alloc() saves the 32-bit nr_events in max_reqs, then doubles
nr_events before checking the ring-size bound.  For
nr_events=0x80000001, the doubled value wraps to 2, so the ring check
passes and aio_setup_ring() builds a one-page/127-slot ring.  The
original 0x80000001 is still stored in ctx->max_reqs and charged to the
global aio_nr quota.

If an administrator has raised fs.aio-max-nr to at least 0x80000001,
an unprivileged process can create that context and make later normal
io_setup() calls fail with -EAGAIN until the wrapped context is
destroyed.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1, with the administrator
raising fs.aio-max-nr to 2147483649 and dropping to uid/gid 65534:

  io_setup(0x80000001): ret=0
  fs.aio-nr:            2147483649
  ring header nr:       127
  ring VMA size:        4096
  io_setup(1):          -EAGAIN while wrapped context alive
  io_destroy():         0
  fs.aio-nr after:      0

The unprivileged io_submit path stopped at the ring's real 127-slot
capacity.

The default fs.aio-max-nr=65536 blocks the path, so this requires the
documented but unusually large administrator configuration.  Under that
configuration it is a system-wide availability failure.

Check the magnitude before doubling, or use a 64-bit intermediate and
charge the actual validated request count.

I found no matching upstream fix or CVE.

The privileged init wrapper and unprivileged PoC are available on
request.

This was found with a multi-agent workflow; the full
quota/ring sequence was reproduced in QEMU.

Thanks,
Cheng Yongkang
