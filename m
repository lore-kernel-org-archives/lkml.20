Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634196;
	b=o+m9JkEoL5AQEGR3FdiZgehwnOpJlhDZjm9ufjSYI+JtSrQ3y6opQOfkacSPPPcqeE6o
	 iES0O4JQ48mcI4dfNAdh8Kf57k1NpOR9Bfr615qWHto4O92dkKwqR+wEAZ91cF+m5HEZI
	 zHd15mh4xr1hnTQj/FllK91zKQR2hYq16yEzr39UsDl6tA9S5AqwTJ1auT43Y+HmJoWNX
	 Z1jwtYxxIIuC20q2HGIFxJL22NT+QrrJqqY7M/h8MBysOjXdKukmY6tLkJRQ/SmgH1anh
	 zer4xkD7Jico8KagqKOYq6gmKw6J+WadJUovDX79Jm0duUoNbkQtJHi4XDWoRBX2tZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bMIC1kskP5GdqBrbGoext4Aqt+LqpqVvPyut75h6qnQ=;
	b=CQX+O0gCXJjbLTQHPBJKcScHVRRicWWFhY7MOPkUvrAc6l6P3Rdix6lVjWG2AcJ8GyAP
	 zVjl2JsDsLskAg5N+FgABd8raUbHTutLci1VWc0YtywVBfOK3Af1QAy97IeW9HEcOivPN
	 dNIR2pVeeGK5dH4NR1DKJUqDzq5f6+mZadBK3jy+6j5PI2s2NGNaOiv7/GUMjfat3X6hs
	 mb96VzSoH5goyLQsDHotlviWCaz5407QgbZTLxnL6Rhyl1H8aU/bNktrunB5KYZrietqT
	 FhbCucMLnRhfPOWuOmYbBOwCTMtCGzC9ho/uDc5fUlk5C+iZ2/AYYbGQu08GfSo0Tlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9QUns8L;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D772606A337
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D772606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9QUns8L
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d7791b00so19862245ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794634195; x=1795238995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bMIC1kskP5GdqBrbGoext4Aqt+LqpqVvPyut75h6qnQ=;
        b=x9QUns8LygYER6rS+zrUErCDxfCuEzZFMjnJYYstTzqa3hPY+e5AWl2n9ZIT5whLpI
         cOsh6wCFXx6xDsVpJoouiu66DQsZvc0ffkRkgD8j7QjIwIDH4HAj6CcC7nCcc/T828Rg
         euxQf0MBKZy4HOIrktd6BIVikqb+9rjXvI4JfwfmzX5QY6jftYNmYrewD13mlko7rGc5
         N8czpTaHHxKJy1unoOYXFz43QkPFOOSqSfFUswQmO8jvYOkTfCQSSW8QxMos1cOgCtMK
         S5OYfp3xRXCI1TP6hFIYS4+D2Rns9yUshBVSOPXpn1rxXk8pC3LbFU6auUhS2n5iRojz
         5kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794634195; x=1795238995;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bMIC1kskP5GdqBrbGoext4Aqt+LqpqVvPyut75h6qnQ=;
        b=13Cx3kX0znfP7n/N2magIeSr+cq5LPf4L+KTVz2AGjlV0yuAdirec8q9WmBiNZ9p0l
         8d2hwfHLKG1HPMxA7K/bTH7Z6tAXAVYO9zhn4KQDGsST/Hnd8TwwpqOQRYVEWs0yY4+3
         Tc8oFZer7xHLoe1G3G8gQlqFvkbWSaC4ajgcVDRpSHKRDS5Mkd8vpKiXaq253nvcsIYa
         0YavmNYResKlzi4kUAWgw9oJ8xXwg3Ju5xxZZZ8ySnBFdMe4KepoNhAJlHIaT16KrJsT
         +FprBMK7rglfV0GfnV/g6D6qO5eCB8qX81tuLFrvxciUIK8jWyoQ1JiRzOq/xggmR/vk
         O98w==
X-Gm-Message-State: APuU4Z+qRwDtxLxLQ4R/6TZ9YI0B2C2U5zSdT2idnjlmWTSziHVWtDFO
	9/P11tGhfVDxsz5W52NF0hejDMzITJT9Cgz/u+DiP/5Ho97gr+GnyYCj4/wMyFYT
X-Gm-Gg: AYBFou2mh3mo+NhwDNvGzpe+PMsaQz98WevVFT00b7snpHDSmEzg2WjGqysQWhaJq5P
	sDocLg5KaS9vhWzgl7cIVxTz2t6P30p37xsQHtz7XR6dGw6gKxArH4Uf7A4VaG+xJbF5XztCR15
	RKXIZdOXlrllPpCjGbHBwLqoNRvEd7nVFOO94N7k/X/6XWQTsjQ1QkPbJcok/28HbQeHKRnzp4W
	JJAJ8Xa17ei3lxjWOrdDqBM6u+ze+CHDVRIB1g6oCtcfqYz56g+ddWquASYI+yndveZennZvIn+
	nTDstXXBqP+WfNAye8i24Hdy+ajsCOLDx0sbEmSJINEcDoFXRCDHMwriBywwkAd36WRUhrddm4w
	jgzp6YE5TaX8C1Er3UbqxmBMSyMg3Qs/2OWHRRd2wec8/z0a8fiBV+vGDqbbq/Q7k93F4NqF+G8
	/b5Dr//IqPBa/w893c5nTF+n0yUSwCKbC9UBuMAe0ItaiT2WnZaU4RCh6nsORjLyON9MWLWjDaI
	/ru0C4OOxYp3KUSHsr3gYYqxK07WUTxw0VZcWnx2k0jH5PWdyA+3cLocM/ErlSdghkBKH7rTsr2
	AuO7XuZnHFK3TnJcszGi436WFejDRxWSQLkxm38i3fblAfVZzoo2G7Z75SKtuLfBCDWboJEKn2Y
	jojGK0jm44lb98ZKKPjTAyVKt68Sh8Wx8qHAo9NjGRM+QxOCv3+heaFM=
X-Received: by 2002:a17:902:ccc7:b0:2e9:6c15:6b2f with SMTP id d9443c01a7336-2ee0dc93a16mr44755005ad.25.1794634195250;
        Fri, 13 Nov 2026 21:29:55 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2001:f40:90e:5ed4:d53:b5f5:a144:fe4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm17760225ad.54.2026.11.13.21.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:29:54 -0800 (PST)
From: Izaac Chong <izaacchong934@gmail.com>
Subject: [PATCH v2 0/2] configfs: fix use-after-free races in
 configfs_symlink()
Date: Sat, 14 Nov 2026 13:29:45 +0800
Message-Id: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/4WNSw6CMBRFt0Le2BpLSv2M3Idh0C88hdb0AZEQ9
 m7BBZg7Osm99yxALqEjuBULJDchYQwZykMBplWhcQxtZihPpeScC2Zi8Nh4YjT3HYYXG5VnprI
 XobVU17OEPH0n5/Gz3z7qH9Oon84M29fWaJGGmObdO/Gt90cxcZYjhOSVUNpadW96hd3RxB7qd
 V2/Zii3tcoAAAA=
X-Change-ID: 20261114-configfs-symlink-uaf-c5d84bb6a976
To: Breno Leitao <leitao@debian.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com, 
 linux-nvme@lists.infradead.org, Izaac Chong <izaacchong934@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794634191; l=1520;
 i=izaacchong934@gmail.com; s=20261114; h=from:subject:message-id;
 bh=9HaOXwSMwzKzPRbmaH7JW1q/kvKxDa6hssIZEkktu2c=;
 b=rW8QB5s2N3tYg5kXg2dxxatXuShumKYKJNvd+OxMHLlUDbvc2euh1vEI8+phoHZm58K7gwdjg
 uNpq5iNyl2uCPKSjn74kj+SFs1Dd4UJBYL4ncLs+sYnGvpszhu6ID77
X-Developer-Key: i=izaacchong934@gmail.com; a=ed25519;
 pk=IFfOWcK2ZRkDtCqaNggolAwpvIidYMt3Oar3NEnvqzY=

configfs_symlink() drops the parent directory's lock while it resolves
the link target. Two races in that window are fixed here:

1/2 fixes a use-after-free when the parent is a default group whose
    containing object is freed by a concurrent rmdir (syzbot,
    nvmet_port_subsys_allow_link).
2/2 pins the target against rmdir before ->allow_link(), so drivers
    that walk the target's ->ci_parent do not see it unlinked
    (NULL deref in uvcg_streaming_header_allow_link). Found by Sashiko
    review of v1.

Changes in v2:
- Add patch 2/2. Patch 1/2 is unchanged.

Testing (QEMU + KASAN, v7.4-rc2): the syzbot
reproducer crashes without 1/2; a UVC symlink-vs-rmdir reproducer
crashes without 2/2 (with 1/2 applied). With both patches, both
reproducers plus an nvmet target-side race run clean, normal
link/unlink/rmdir still work, and rmdir of a linked target still
returns -EBUSY. syzbot #syz test is currently disabled.

Not tested: lockdep was off; LIO (target_fabric_mappedlun_link) was not
exercised.

---
Izaac Chong (2):
      configfs: fix use-after-free of default group in configfs_symlink()
      configfs: pin symlink target against rmdir before ->allow_link()

 fs/configfs/symlink.c | 66 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 20 deletions(-)
---
base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
change-id: 20261114-configfs-symlink-uaf-c5d84bb6a976

Best regards,
--  
Izaac Chong <izaacchong934@gmail.com>

