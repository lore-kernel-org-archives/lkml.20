Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493030;
	b=vzJP3GdOdzxRvSHTshJFfmI4WEBzr+r9rYD0nt9YWWMEAAbuQOd6ewqiITv0blyWYB3i
	 HtFAtr1gaJbaTNNk72BHXXWCUSToj4yjCVU87ISv7MEf2InHwuwZPMLeL5oi2NlZIGtQl
	 otpKdjn/tBYYGTOIEnIwKrn6OlfXGW2zwW8RzJQrxlwQvQ8pzLxUx3JjO795SgBRJXfto
	 zl2z1kZWOp4PceQPM8bhr5bI63GJOIL8sHtmgSd4UESWkj+5BnhRRCGXoTVSc4xfSVN0a
	 z8UI8CvkcEv9xnl5Tm6Zymu9nBRDb2p3bKiW0XAqquh9HS46gKBmjrpVIbf9B5eEu5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W7IVuM4gM5kY+VlCkjQIKxVNfU8qqC+cV2NO5JrfOD8=;
	b=Ef/+LFIWbXzvk6aY0/sYPxxxLwI2tdPi+38jj/38KhYNO9n+vCTE1O6kG+rlfJxreHcw
	 JROm6A3IzccV2u6e6rLY6VoF77VUaLWZ1ngKMINbvNPSnDb72DjANCeJ2qFv86w27kNTY
	 ayfSIBWDWNKpiu84XE2UZNgUGhW3iCof2W5VrvTjKrYMblNa2ymuJFZs6dfqXxREqQLqf
	 73/asRLX2vIj7c9ZTbBbZuXBO4SC/VOsq3i15nJcUeC3Ju55fAM+YkacFtJwmpdLzzCgu
	 8c5XAt9Ek2Nd89LY4L8+LsnUx39l0SY2B/PMKatIW9clX6mpt2Ue4VPWiHdVl9NQojA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBbUcmC3;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19D60A3813
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D19D60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBbUcmC3
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cdc606b47so680852166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493029; x=1795097829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7IVuM4gM5kY+VlCkjQIKxVNfU8qqC+cV2NO5JrfOD8=;
        b=FBbUcmC3TkNMVh+tg9wiyedlSSvXNi3Z9406WpBziBrpIKlDlj5NNHzZZb1XcwSYkF
         x7+ZTkVfFCUyXjZoWOHRfjpzVtW6WtERVZegkoyX+BBhtCtHf6LctV6VsNgCgGV0Dh25
         bFus9i1wmGquJjtQiDSmWBBR4EvByqHrRHxYbuubocgxgGuB/V/akZFJ2MsZtV334UEe
         u5tmhEk4ZC+S10MzkDJXenSEKFawwFu0DPyRD1pp99MCJasPPMJ7cAmcj+NYoxwpxxca
         Xxlmv7CIj6qklZGD/w57xn370NWyL4vrjhTqvhBUvkfnPoXmRS1R1yOz+snKU5dVDUKS
         v9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493029; x=1795097829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7IVuM4gM5kY+VlCkjQIKxVNfU8qqC+cV2NO5JrfOD8=;
        b=h/UB43zLOmAJEdtvgiJyU9iI8vZEha54BIE+KqZlnfxDukvVALPqlFZGeD7Opfuq7o
         DOIe9Gt4jOjVPaLLH31fFOc7EmW/W99HyAaHCcuaUJ/ZL6vlBtwv/zi24tLlkzluw7JH
         EYrIm7zq6C2JW5ukqriMLotldWIFC/gd693Fk1Ta/0FTwVY3TnNfJ+vjPrICEWpQ+pK5
         Ii+WUnXDaWlC2aXtQQP0CXrNQEqa6t5TCnBk5vrqr6Yq7BnTP8lpISb+w2p2NtAFzxBb
         kwAUztjGDq2n0a7JMdETBgrjpTo+X1R4f9WcYzDi/rUm5qddaaT6dH2Ryfb8QajNgflR
         yfkQ==
X-Forwarded-Encrypted: i=1; AL+hErHa3iy4NlACSZbZ4+vnrXq0MUTEBkfFcgHNPtn6b+PJb7j3/kDvHbtxhoe5Pqf4nkkxDRn8F7FtLXgh5yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SWy/QKSbdxPb8GaplPyCR1ddv5jyxHEOqsGPtaD8gHXbeeJua
	f6z9kA8R/M9FtN3TvMVjLE+FDpAp8/o7bI1368ZyKzs1eF428EW7pviD
X-Gm-Gg: AYBFou1Nupm9/JgVSDLbhPI0J6u/bnQmb34SjBlDT94oN3ucGxE45p674QsoNy/kljf
	RLCNSEV6okkK5ap5ahdWmKvP0s+9a0saePfLDAS60WiFYym+RZQv/KTQae79Ji/KFGhCYPG9rtl
	ToG4GiQzzxZt1Os+oSqec/obNCUiQ29biN5N/yxLvuMjLfQ5+bFTaJMpuU7ggtN2SryHrW/47t9
	aVM6+AR0jizKe2YdfRoAnk+00ifvdjkXuUc0WedVeQy8VH+mELbvfB9gF38gLIBKoyAXO24/YoV
	PkpaPKsdRCltugNmAZM+RjqykDe6O+WRcCIE+qcNLmx3qTW01VR8/fCSV3Gcd/Ub+mKxT+g3qhe
	Q14F4mZNxXjbQ9yWY5kl4126EuEWaeIcEH/EGop0a27v77TlrwJJ7grDB+uCSC21tvjHq4lyYFk
	KzGCu1l58MM9ZXG92QrJltEXL31tOGaZpkuWDH2b+CvLM0FE8LQt8WG2Myzbos9Ns6TjfHRk8Ck
	JYscun191v4NOsozPaJQAj0oEBBNcuB87GnU917m/p2KLB00cQhdk7dJBRVt7cOsvma9bzWnyIZ
	sd0sYQ3/CY4153QQVZgxCcwS9KEnJr0oWId/QRIoVedLDaQ8TE7MiJjKm2yp400AEJdpt/mPREh
	5tZILCFaC1lgBa9J5DzNeRNetBw3gULfJ0G+/KVosp7jP7+Bix0DU+9GUxgeekk2jiLeo30Rfku
	12v5cB/SDN84sSMlIGXatEvmdgziYtpGhI42ghWJzfswv1e85z7M5Dx0xAaH+Y4TvuAMeDqAA=
X-Received: by 2002:a17:907:3f24:b0:c2e:4292:d27e with SMTP id a640c23a62f3a-c5066ae263fmr504242866b.22.1794493028760;
        Thu, 12 Nov 2026 06:17:08 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm360156466b.16.2026.11.12.06.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:17:08 -0800 (PST)
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
Subject: [PATCH v3 2/2] PM: hibernate: refuse splice on /sys/power/resume
Date: Thu, 12 Nov 2026 15:17:02 +0100
Message-ID: <aae0f774a25c8e2048c09919d3b6b841e2b1c1dc.1794479968.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794479968.git.krystianmkaniewski@gmail.com>
References: <cover.1794479968.git.krystianmkaniewski@gmail.com>
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
SYSFS_NO_SPLICE so that its writable opens refuse splice and use lockdep
classes of their own. Plain read() and write() keep their behavior, and
read-only opens retain splice support.

Fixes: 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev in resume_store")
Reported-by: syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=002fb7b2d0bc53bf7e75
Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/r/ec0c2add83f18d7a3c726d5d219dfe42@kernel.org
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v3:
- Use __ATTR_NO_SPLICE after the rename in patch 1. No other change,
  so Rafael's Acked-by is kept.

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

