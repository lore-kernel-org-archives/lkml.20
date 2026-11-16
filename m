Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836351;
	b=Q+/Z67yTm8b0pmyTKZVDsFOTLcKW0KKRwsvig0/sNaf3TPwo5zKa+qtLqrZb+3Qv2T9c
	 4ASlVz13xatIOixkH8VdjL9qqGLqyjWnNSsJHPAI+kdkR0BS0K/oFCExWsXvMSVHeuDkG
	 9NKPWN5uSwMyD5HOBMCkWH93x+5X087W4bz9GSyPylSbW5ehBiIZlX+1l0o30MsJkUE5B
	 BkVlTzF8zEauAP432CmqMO2gXvZMsL6T24jKf/fRIqcmGZ0wGhMJqcAuEe78fpeT3vHZg
	 WCf6TvAM/HTRhMh9cmqtx+NL/RGFQzcw+ep99fPVrDDSu0YOSNitiGKtNa24mTde3NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0RCY8SlJF1fUzfPYkjMVeM8fsGJwzoRlEM+dvS8w5/M=;
	b=j2MJJW13JFaP+tTh1zEL4bIrDpZBohuU3TkbVdnmXH/9neuAI8KxRFAhjWwzLcZ6ui8a
	 8/ivF11QwJdhc0a6XmV+mIuSPfsq295OElHtY4XRzBinygj79U+M0/5WP/7BQwXGrdwZ/
	 V3D6NZ1M0ReZfNCOre2QzJV9kotdvUWu5o+uuhzP0etWnsbPe0TZIMNxejjfHJHfblZIG
	 WNH7XwsGx1eIaeyCknCnvzwvpeYFaqnWud0PZrq+jp9NFuEIZrDlcaWxyN6xPo+LqH7oU
	 zUOVQMiCNzU4Q+9JBrXKfofQ5YJRB9Eh8Xkc813fBd6kUQSdYn7nL7Ge62dlgDGkodw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuyte0XH;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A49C606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A49C606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuyte0XH
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d21051042so91617866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836349; x=1795441149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RCY8SlJF1fUzfPYkjMVeM8fsGJwzoRlEM+dvS8w5/M=;
        b=tuyte0XHN9vejcqK4l0//VkSntgcv4oWwWa0+sUtmOsAc0uHuCz+B4sf8XJCEQ6lHt
         F6yBmnGoSO4NP/5dfth7qg0DEgKkhdqXx18qjFXlQY91q9VNCaUQewRO+y8vhGd2cj2c
         vjmZB+Pyqu7ss+Z5WvUDDHZMlwoLK1q3FS2dJkkPUlsYs6LBLt10f0raz9lgtflmdL4I
         ALvIZLXPWkEifTnl46MvaDyQMGiuvjHlty1EKX+42GDpiPRYqkKuFKOcceVEWJzmA0tw
         P/4dGFSBL0fP+wJAZlzcN+HfOW7BoGOwZXy7urGRN1aJV8LeLPVi37aepSTtD+UVcVOH
         wbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836349; x=1795441149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RCY8SlJF1fUzfPYkjMVeM8fsGJwzoRlEM+dvS8w5/M=;
        b=vIXuSsIUUZe9/fX6DtHpHoyfdN6Z1ovYLRWy6YX9k3EF2eNK2g4zTc1SPnmeNQRXFm
         2GLRuQc6ySgMXeUEwYlrcMLAgzXsA7AmBKlYOUXifwdhopTyqkChTAJeI8VTan2QTehT
         qDfIspsn0twbRdmbzuLip5aHti4drLtbr8nIQd6oNWSLadso3DA7kqehXUfSk246O35k
         NETQTFqqqg5oWyrwTta/5xG3n+vNZLwVgdVdmmJHhqmiflkLkNOSzLUwM7y46r/PLpcc
         MoPkdQWS085Hbh7JYu2c8WkXQ9GBk3aGrafSMo6TgpYnandXDqNgazEGZy66+NVk08Aj
         qhiw==
X-Forwarded-Encrypted: i=1; AL+hErHvgXyt0D0ECUPeRNHKiEhAXVZhCpIRQGKSeYgV6p3QNz0vcF08jzBDCZIZOZyNotdCzv3tYd0+I45ILH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z80PekREFT7KIZJmygdw+LCJRQN43ZA2EhYdhtoIpz7JfdKIUtR
	sEE0oj4dHWy7UXKbxjGMZD3z9LZhJnhEdw4qhT4aiVpywFZzg1XGI/h/qcqkG+wovdY2zg==
X-Gm-Gg: AYBFou1gZsLu2np9Lzk4Xy1gbUj68zeutJcVSrb2kYx9KsNtIE/2/zszktUGxn3uRB6
	sFBW3XlMDsUe0kPMjl8rCnShTzoq4mj3IDbNtJDaOvR7a6GhQti8VvAffP7f+L90ALx4RqWPpMa
	rh0GItCtYFywc0gReYOzbZoUzrz4LNXbPEXA2LnjsJeSeSnq2XTQGEwxBwC7Wd2NKUVKksrCeGR
	Hej0nizdDAHyvzAwPhDmxODkSJV04zyHgzon1foemHCP+E80vFeq9Ey/Q0gVpJvb2jrqt4Nzyme
	qC/8ygbIogXErLL6uywkYyiprtfD/3ZUR1BdczYM4+VwEq9U1930S5anJB7/E/2/bXkUpxAs/EN
	EzTzY+TcO8qW7DXxn4gGrDUnoijG6QB8w3djyh8FxwfxK68STgH1K9SGVxHJ3na6gwbJqK42RBr
	yUHH1Y2pWIci8FNNIW6W5EdEg8zXtUlxH94JN1R31W+4+XfwrNTvnfHcKGKAchPdMufrybtmppg
	B+/cpSLfs7aObcp/ak/WMKEqm0+7Dg9mkD4g8Q1TmF7rCAAaurCa2vkf4DAlFc4HoCxdmBVdqiL
	y6WpveUpuT0qNyQBcIh+xaAcQ49oLDet7kpzV3I/LO95Y6NWz6/a3CqJt3OUogwJmPfI0kDoySI
	kzoQIIulweROByAe0M7Sr1/lJewJ1GkhEhTWhL5EJcKqVYKHZ87TeTEGsDB3t9TE1jSr4EKm/vx
	5QC/LLMTbVlg8H1wPXj8QYvRyJRSis7ZIlM9ym75SdrNTIFhfFfDinC8hZ6K5DQHOUxaEM07wJr
	Q==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28c7:eb21 with SMTP id a640c23a62f3a-c50963967fcmr876042966b.29.1794836349492;
        Mon, 16 Nov 2026 05:39:09 -0800 (PST)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50e9b2b5fasm61267066b.35.2026.11.16.05.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:39:09 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ian Kent <raven@themaw.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH v4 2/2] PM: hibernate: refuse splice on /sys/power/resume
Date: Mon, 16 Nov 2026 14:39:03 +0100
Message-ID: <20261116133903.400202-3-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116133903.400202-1-krystianmkaniewski@gmail.com>
References: <20261116133903.400202-1-krystianmkaniewski@gmail.com>
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

resume_store() passes the written string to lookup_bdev() before it
tries to parse it as a device number, so the string is resolved as a
path relative to the current directory of the writer. The syzbot
reproducer writes a relative name from the root of an indirect autofs
mount. Autofs writes a mount request to its daemon pipe while kernfs
holds of->mutex. Together with a splice into a writable kernfs file,
which takes of->mutex inside a pipe mutex, lockdep reports

  Chain exists of:
    &pipe->mutex --> &of->mutex --> &sbi->pipe_mutex

A splice from the daemon pipe into /sys/power/resume deadlocks when
the written path triggers a mount request. Mark the attribute with
SYSFS_NO_SPLICE so that its opens refuse splice. Writable opens also
use lockdep classes of their own. Plain read() and write() keep their
behavior.

Fixes: 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev in resume_store")
Reported-by: syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=002fb7b2d0bc53bf7e75
Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/r/ec0c2add83f18d7a3c726d5d219dfe42@kernel.org
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v4:
- Update the description for splice refusal on read-only opens.
- The code is unchanged, so Rafael's Acked-by is kept. With patch 1,
  read-only opens of the file now refuse splice as well.

v3:
- Use __ATTR_NO_SPLICE after the rename in patch 1. No other change,
  so Rafael's Acked-by was kept.

v2:
- New patch. Together with patch 1, this replaces the v1 autofs change.

 kernel/power/hibernate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index e365e440cd52..da5590ffe6cb 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1316,7 +1316,8 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return n;
 }
 
-power_attr(resume);
+static struct kobj_attribute resume_attr =
+	__ATTR_NO_SPLICE(resume, 0644, resume_show, resume_store);
 
 static ssize_t resume_offset_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buf)
-- 
2.53.0

