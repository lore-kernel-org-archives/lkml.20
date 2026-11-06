Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926175;
	b=fu6O0uDH65RN1eSZZb9jljaVMDbW4v24alb8WWXbxg9aHnQw4mMp5HZWZR0agmw/k1EY
	 +L2EJxXYtCOta8idVGgiBFSpvUVxc1WLLeDUscEdKSEOLhZ4tl3VcCv8LvuhxcXFiRBwh
	 FzZMbdRpVDal9zUTRr8/ROLoOy1bT5c6i2ybxX4/KYypVd5Z5RC9PoYap1mdnogkWwUTl
	 sSliDohe0fqewxLR7RhWr3gANuBlPuwTkQd1FKchAcbXNsG36FJ68g2ATntGP59vTxXN1
	 gnzhTF5MvvCqLF8+9eFmjo9wnf5UbFJ5QoyzlbQCXHIt3vvUd5b2jtqx+t+Z3Id1L1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wRHQZ34rL6dBoiypM95HljXgWyJttgXvfX9i5yF13b4=;
	b=TOBb3GDz6H7pmz7mNYQ8pE70aHGC+4m5HMSl9qdXkZ8f9aqbLbou166FteFkKUXYk76v
	 C1VqpxLkxEe3IQkOEp7utUEX68tfWN3XzbfIDztMoivOEq4naO+IPBwBoKiP4Wdg+PAJV
	 zmMGMvY6gqU+KBeGtjNnVoqA95Xj+vPnqKdgBU7i/v+5hxaJjryQb/8RaFD/aJz9yRxNc
	 v6wH9J5FtWGtJCR33KhogwJasqFVOQLhQWPo+wDb0rqrnLbLHzDzKX/PgomlYzL3C+M0o
	 t/lkTB/+ZI0+Hm8fS2UuD4ElcOR5lAtmwIV/OQ47B0+dMns5IYbigIA+XBS+F5Sakyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Aw0aYpC0;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0D606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB0D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Aw0aYpC0
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d126f631so323327b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1793926173; x=1794530973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRHQZ34rL6dBoiypM95HljXgWyJttgXvfX9i5yF13b4=;
        b=Aw0aYpC0ChWWqe4IylSxFeQLDJ3Avu8kU49E+Frb2qRnfunxUmPKxMsK92mfjj9eo6
         +c/eeTRmgmUw28rvi8iq8IgGOsSQ9V0JDgOsCyVkiXP2cOvSYXChz9/XgKSLCVDR3KLP
         W8u6hUWScXbejML4qepU/A1aghSygtnBF0di6osp9TqmrOiYGIEyqoPh2BN/V2Gp6ybw
         7Nvzh/qAfrAmQBj7cTqDeLNc2jARg4s+B5lhGIHDM7BzzLFdFDxrIbTJ6DojjN0BMtmc
         LMH3bOBKNvSSBhZTB2ljE03sHylO+cM0ui05B6CF3D8CMd1XH0yez/GaD4hYIWt4nG+a
         4NTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926173; x=1794530973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRHQZ34rL6dBoiypM95HljXgWyJttgXvfX9i5yF13b4=;
        b=qCyDGTrl262j9A2DekQrYFTaBVu0ic+cvzAZPC2eI5JWBASvh9oYXJU+9rqjAsDAWC
         ecz8QpCZ53uc8dCBZ2USSmciLdeVmSGdT7X/DCvjj3fLAOl2wEqc7QgmJ6vssP24YAc+
         4W1QZ9BJ+sxjtzAePJKQMxxC+fU+ov+UG+UbENC8YZA8PLvts6PT4jQnGzy9fZHHFcLc
         lVXvBlYQndajQfU5ONosLOxNk/kVX7aqk2KrVHKMrPfVGxh3vzUZhMU6yrRsuvmyhKhK
         X5dBrfTGhmx8R+hiKNspxCWb0KI/dR8QmOuV4mzUpxRzWCITckNNsqeWrQG3UKsLSnvQ
         JzHg==
X-Forwarded-Encrypted: i=1; AL+hErHpWIaf/XnSXX/wpCx0xTM9bFKPg9l+spzZfJz+mk4eEl2bY6LZreHd3R+AkA728RKuVHTZ+5JNXuFZ/vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HdfdtoM7Qr5n9EQG/ghgNa5RLJ9pUopsS70dWO0H2NAsYIIyI
	MO1XTJwvPViTBp/GkJEtvH6zKu/oPCARM0Mmhmet1o/EYumgBDb3HsvcV53zLUZn06s=
X-Gm-Gg: AYBFou1i3xnWnyy1vtcL/Yd/8nj9SQcypWK7Q1npZrGEc3kZzfhQqZmm0sEBaBCorNy
	oQJsY3ImrdXJ2FvV0jmed07MXrZuEpnmWvzEhwV6AS0i7Hl8yRqf1KWFvBihhEl6OkZywp+SiU9
	pA2iOZaTlBLbogQVwJeAMuAtnNvGMvMRt9xreQuRs5hET3/16Tanrr2Kwsv88lZusrPl5VDJ9wN
	UgtP16b6dW61wU/DtZ0m9jXJT2Z5tKxZYM0OGbSU4K34yQU52rp5NFkuNJ6aD32SkMl69ar53QQ
	ccYbJEIKwK5S35cohHK8hH0t3hbsvn8Uz4W81I3O56iaaCXgzddy/eEAuIPLcPW9L6j2nqDnU9b
	vW0TlbA9HVH77hAVkQoHGwx7jnPg19QW6xaJnmomO6kohoun5x+g0FEhYeJ+nCIxEJfCd8P7pup
	PdWYqt6l/N7yxTgksqle+X37St8sYBlaxtISfelkWTsdDRaKGHXmS7xrJy2XVCL28x+PQYE87hy
	k0YEa2mit/sSGuFN6mk0S/t2XI9JA1/EQIaz6zzE/psyV0cbxBaF/6hld8MIarZELP+bO8dHxdP
	AP5dVXP1n8j3UoKCi3z/q2JsG3IW8NfKjdRqNDsrE6GDhhneCXARI0NgrajjwlwnZH6t3ksY00s
	eR8JF9n4i+lQCjF7qtjp7CKsp2ltTM42LDsszTUPTaBcJ/du7ouBGVbpNROl7
X-Received: by 2002:a05:690e:12cd:b0:67b:9a55:3382 with SMTP id 956f58d0204a3-67c14556c15mr801493d50.56.1793926173044;
        Thu, 05 Nov 2026 16:49:33 -0800 (PST)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:62d1:9ddf:24f7:e87e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0e5fsm851304d50.5.2026.11.05.16.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 16:49:32 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 0/2] hfs/hfsplus: set s_maxbytes from the volume capacity
Date: Thu,  5 Nov 2026 16:49:21 -0800
Message-ID: <20261106004923.1844283-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HFS and HFS+ do not support sparse files: every byte of a file
up to end-of-file has to be backed by an allocated block. As a
result, a write, truncate or copy_file_range() far beyond the
current end-of-file makes the driver zero-fill the whole gap,
which runs out of free space and fails with -ENOSPC rather than
reporting -EFBIG.

Since a file can never be larger than the volume, this series sets
s_maxbytes to the volume capacity instead (capped by
MAX_LFS_FILESIZE for HFS+ and by MAX_NON_LFS for HFS). The VFS then
returns -EFBIG for write(), copy_file_range(), truncate and
fallocate beyond the limit, and trims writes that straddle it. The
now redundant local checks are removed.

Viacheslav Dubeyko (2):
  hfsplus: set s_maxbytes from the volume capacity
  hfs: set s_maxbytes from the volume capacity

 fs/hfs/inode.c     |  7 -------
 fs/hfs/super.c     |  8 ++++++++
 fs/hfsplus/inode.c |  7 -------
 fs/hfsplus/super.c | 10 +++++++++-
 4 files changed, 17 insertions(+), 15 deletions(-)

-- 
2.43.0

