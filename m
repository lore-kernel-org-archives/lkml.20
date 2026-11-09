Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243752;
	b=Fw+oGbtN2/paxuOQ74zvw/eDzOs9rNdaATSACgpgA/8vnM6GqxLykgGc09XA833OKUCV
	 HmW/9jlDFBjzOjWZ5YNoxnpdd0OExYmkLpJPPMXOWZRfRE2K733h2VKmTYJx7fTiKkmFb
	 d2D8rqqblElUe/O3wbqNANNplSPX3tPY+XkfD1xJh/3Q8+YTp/BK0Ht+4FhSrgv4Xv1A5
	 FmAORYCFmDviw+LLPqIY6wDh3XNVmHgqpSkUJU3HHYtPhwk/aIbCw3YuUAdp+gxJipRNv
	 HpK5hzw1KhrRCsbrfwO4v4tUD8/M+vWnBW3yYyRPzxmF1vHX9A8OCt+/EyiLAoWnQwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
	b=HIxW6JR+2DCFeJ9gbQSs8R8hHYstXIsiiCKrGCl97XcrDkbez3ifQDt9s4c6vDb+/zKm
	 lainzhEgZJA2Qte2eyD4tVkcfv6jQ+8YAXRuoBMJjS/lENgkX50ZhmRg1+iloOuhJnK6o
	 MtsATGi3g5u1A/FrVIzLWFdPryV7FjPfcPGFGaHvzj5Kpq198t/bWZrEL5dSDWgwR3OrA
	 3SELARbjVQ5qXrIGujP27L3whxJVPzbvjdEpFiacwDavXgx8IF+nyKTuxA2/SApZL6Y3x
	 KVnREtrlfuHonBK7h2HJpK9Mg+4nrAYcy04HkTCK4I6oPy4pDzgvu+FnIQ4SqVynsXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HfZiO/Qj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F6606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfZiO/Qj
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-999b2b06bd7so484301241.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794243750; cv=none;
        d=google.com; s=arc-20260327;
        b=BFaCjKJqOJ8kVOACT3ftNE9ge/nIL9RAnNu0wvdaiCIimyB1taeD36nfBa6Pp9K73n
         kgty8oPDQO9GVbovRI4tAVd53hgf6/EpibI0f4RNULXUHGePBi0qXoir+CdV5CKQPoRr
         yN5RbD8TLnYzdZznaSpvUk2E+GwzpAZTDgNsC1daHMJk3FYIlLXCOSsP03O7a2eAsgzu
         +Zd5DDk4PcfuQ+FrvRp98PU6E02tiYMSd0N4rvg9l+X5Gt6aXlgLxur8aYlmlYvtjnTt
         4AIEhPu3icI6/dN3/fTUpxCybV1Bbx+33wZs2G8teB6ko8Jw8BJf7khOx+6VUpMm7Rzs
         CQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
        fh=k/B+NTM2LBV4Q7E3v9PHY6Gj3f+QWnE+e5IWVxcv7FE=;
        b=qieSR/LGNkvPIuQP4N0yUcItAPSOZsToumQPKEFm88PjElVyATj8GeQt3arQiVkue1
         Khat5b056cdfZBmF2PpE2ChBCWQc00RFkVpBfJ9scm8lkqHdH1eGg0u0ImpUOmKgXGtS
         3qbZeMs62+bstEq9IMZZKkxfYPtlOm1PG2RCFlw2twkdA97KII7565tmU1mzi47z8qSR
         B9zMzBO0wdc0gZsqZ+vCTN5OKPIRd6Uyhlaa1GzoiuTyR9yg0BSPhE1x1N7SKYErEy9F
         5FLKJ7V1B/uEgMMPe45LzhoVh3BzgbfkdBMjfkzaFYBkxAmiK6atcsAm6mBh1Irvj4uh
         LZcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243750; x=1794848550; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
        b=HfZiO/Qjj1Tm+ceYl3TTP7O3Pr83QEFesEPCtxsNgg1w5vyp+X3UEcT5XDnE6iTYyc
         DYNOWBcF15T46jypa6ql35crJ2QiNzp1/WqfuMfX1P+MtNPwrQLCnVfRXfY7Bua1ck/z
         SfIDVCR6B6A6iU7diSUaF33k9ORDHCYMemwcTMgt1xWg3Yt2gWznLqhA70zkWCb2Z/Ak
         Rb4VuXCqLj+2o5zxZW5x8BqvZ/xj+22FDLrJhWplY+gULwUnmtXzEej1yQOU0S3z4iMn
         AeMUh/EMEiQRzNMd1v3pA5Z4Q6kqR/FVN2ooz0a8qkst+/cuGtT0VxEbFgPkEXNm5r7E
         Wffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243750; x=1794848550;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
        b=M41jiWrCmyfBie1H+Z4RorgPZh3xbp7m+GBfDt9Ze8i+XlrG9qICJZ76uVdXRie8a3
         BRK34h5H4ZBGJcn0JGEXOFjLMxDM44tXR1XSLmsJjn/n+hFRRfAWwP5wx8K9UYPvO+y/
         zyhpBbZ/FguqmfzELAqpRy/ATIak7sbpaSBXIKXb/OJcXP4/N+93xgjmMHaAtxNogxbz
         VF5kdGN7/6zC3o6cycTbgVXLfzLyJ7UJiZBB5LznHZFBdybt/EmZCHhMwKYLlrAxWGss
         JTx+XV5U5YwCixfUuEB7BVOefvxi/6GQIqU/OjZlc2LB323+3LsPYXmtb6F+XQBf43ob
         71sA==
X-Forwarded-Encrypted: i=1; AL+hErG80UVa27htFZjXB25VljipiLzHKhPf0DkzhGb504jb+rPhqXDZU00CGsfpO0OdlRf3JcIaT1b2ELwdUoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uH9pogb2YLTyyTkRu7v60TEXQNkUC0yaSiFBAGtNQqDi8Kh9P
	outQ7y4DFfZ60TBZVzkgXxMGg9tCxTAMgMRp08xM4bR95LwIfZ4a7gZS/mHGWi5mvVGNgD5ucR6
	YntAQWvBW5MR3f9E8qhxE4Om66e4K5GaydgJXn9c4jQ==
X-Gm-Gg: AYBFou3+zucIf0mNKuJPQvghhZMT6AmI450Ul7ViFQo9HhnxbFAAsd5RZpgkYDrHODk
	l/OknhYSMVdbMRFkVQXyyw5BSMnL/0742vr3kNspycXpNj23YOVF6Kst4sQs0QiZoBK6FyyeglF
	Rwf3IMaw/1K5FGIiOrxf6rZ3SVrLOjXfoptIyBby/bPlIC6kuQFGHiwizVQMwFW+eWIh9jcM9o9
	Q5LOAvNeO5jmmvQzpKX9JrZBHC35d1/iY1YlOZhV4kjGYreRbjprpgdBLsdjteksblOW/9bMuaL
	LSusEAAJjzKiDgFFmEijobyi3Nujo8xRfwhC3SdOFdE9hrsG0ILSLVakEA0D7wALZrPCDGj5VGU
	3gD6LneHdXT9CTyCJIrNO8pbiZKzuMQt8qBjvyStDZEPTUCDXvm7CTKoC
X-Received: by 2002:a05:6122:2224:b0:5ea:e197:93d9 with SMTP id
 71dfb90a1353d-5ece73a936emr1891195e0c.19.1794243749691; Mon, 09 Nov 2026
 09:02:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: qvkap <qvkapp@gmail.com>
Date: Mon, 9 Nov 2026 20:02:12 +0300
X-Gm-Features: AclHuK_T9CdT9gcFODPQXqQg5OkLrNWefuBwKE95_Exc6nCskp5mn1L_q6DA4S0
Message-ID: <CAABLQ8qdSC1r=-et0y6qnEjNE-FCvoT8wxbo6R9vmW5=bUOSgA@mail.gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: add no_rfkill quirk for IdeaPad
 Slim 3 16IRH10
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca, 
	ikepanhc@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans, Mark, Ilpo,

On newer IdeaPad models such as the IdeaPad Slim 3 16IRH10 (83K2), the
EC/ACPI firmware reports erratic rfkill radio states through
VPCCMD_R_WIFI / VPCCMD_R_RF, causing periodic soft/hard blocks of the
native Wi-Fi/Bluetooth interfaces (iwlwifi) without any user
interaction or physical hardware switch.

This patch introduces a no_rfkill quirk and adds IdeaPad Slim 3
16IRH10 to skip registering defective ACPI rfkill devices. Tested and
confirmed working on live hardware.

GitHub: https://github.com/qvkap/ideapad-slim3-rfkill-patch
Raw Patch: https://raw.githubusercontent.com/qvkap/ideapad-slim3-rfkill-patch/master/0001-platform-x86-ideapad-laptop-add-no_rfkill-quirk-for-.patch

Signed-off-by: qvkap <qvkapp@gmail.com>
