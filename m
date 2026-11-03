Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717875;
	b=Tg/tpyU9KqJTjwtJG5UZgnr0edQTvPlNs55QUMfV58uYmywrn0diLjQEUslkY3Y2Fanq
	 2d7Rdh7eSdai1+81VR5q2PW82KyeQk16PXk+uE+ma0z4Z/lIVeSpDEoqJlOC1rTjf2nQQ
	 mBmguQmS36tAaaKRjU+IaRc9WXFfxPDY20JtipiglWzULDVJJbuJL8Qr6LZWlC5Hv/pI7
	 AQaZQLk4pVZJ5AMWeAYtoFSZu/kwxpYBpp/1FSlEBrb8grIDbJQ6eKED7QFi/RoOvqIfm
	 VqoppZWq643XMSlBa67/GzawxihX3r9QiHJ1GpFJgKQuDbxPUp9cpdPjGRIDnRU2FQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i3ce6V5Fn/mqyiSZg/eYAgXyAQ0fPbUt248njUT/QJU=;
	b=4xyxmr617CkVx0cFocoKvp2mRrJlfxsHqyBZY+a+sWDZ8GEwXDa+RiFpBLLao3xdK2e4
	 lqrnCvl1kpdy/DdptoOxwvt5vEz+ZYCqY/JuLiAgZ5Ia+jLRKxvXgAzkMongCnc+BEBWI
	 UX6u8GjBSUgVO+8jT9GLDTI2b5jrcMNKB7gk4GzBW5g4ZMWvy0rm3jVDqODQgV2Tkbl29
	 pZBLmbdcAvjX1Mtb2Y89eFOYmcCRSb4NJ06N7jWzE5vtSJ2CncC632+n3cpZFDNAv7GzZ
	 WFgPF4eHBHX0qko8GeQU6BL2GkeJZeQcooS/FrPL7Ywj5lgpb1vhdMfaa7o3Hv7DTcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8qJF61G;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8808606D816
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8808606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8qJF61G
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3fd91337baso726172866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717873; x=1794322673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3ce6V5Fn/mqyiSZg/eYAgXyAQ0fPbUt248njUT/QJU=;
        b=x8qJF61GmIRGyteW7Ikwi8CKb/NK5DCUXyBgHHKcZ9Gg67wv4grBJd98VKSg/ccWyI
         tU/TkQ4qY0FCqSouDzu7zFw6uf3g95H/xnRd3xZ8Z5sf8LEBwdsVpp/hIb+2EJzZK5PM
         xl3wrZSJsE8a1bZDV6mHsUX5AeSuNdHpqmUQz7NEnrGVozt8jPe8z8vgrmjgQtmd8xC0
         sRboqJzqDy1lfFBXt86jCWJuO9orRilnngG802t6xXp/jv+fJQAjvHqoo3FcSz38vhZC
         PdZ/6YQScplUxkWykUKNqwClN6LjZl8Crj2zoFUyS5yz9oheRQ1ovk7r+UJl+hB7m2K8
         z8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717873; x=1794322673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3ce6V5Fn/mqyiSZg/eYAgXyAQ0fPbUt248njUT/QJU=;
        b=cWLxj/g2L6BJImqgOYGLlAsqdOFwahawV/gl4Zvbj0cBigKIvBeXEDe/wkVs/c0RB+
         ZWOdLo9Zkx5QVuUkwxODkUhXX4eSB4GBqQlt59hWhdvgf2a0FjGa5JUjSLhGBEMXawyd
         Q0QROoRNGxhvpPgV7GCp/ZNURsLvqnR5xTkbD4jTLavSmdW8DwaGeqncU/lFuCI2z/J9
         VwM7sxLg3JIUuFtfRFCZZZkh0jLZm/y9jfsT475kdNcQRyUpeDMSCfrthay07cWNOi2q
         0+wApV3BW6IkkX0oimdGsD1gX78LsIISBdn8vGoTCTYnqBluN3jvOty41sXh7rdIv1t0
         Vv7w==
X-Forwarded-Encrypted: i=1; AKwUvBxKB3ULiF7NS5E9OrwJKltIHOBVQZCakYn95ZV3m4cQgZAHrto5m6bUbu52YiIvW4Z5xxbuoFGjEi9gjDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r2oxql2WruLIAPS9NbMxAgGzukJOkEAco4SL/8O65NaijYM7h
	gS0PI5aFzbTuH1b6FnBvD/NvIM13b3xaByuKV2KnS9/gOm/pn/skkMmp
X-Gm-Gg: AYBFou1lTVnpwiLIvgxSEh7ct40LDQdRTlXmOtNY5CbgE+Ec9vSBmgxTJUrp2sucC1y
	9KZwfIYsgHGL6yEKUjIc7+aU9pu90MvFJdmNAj8zJMBF8fGEjJTxO5RkHQJmChJn111t0loBiW4
	9tMAGS/LIG/MUCIgNN1QH6l0s5Sf3GFT1aFlo85sCEBpLeUPqEoIJUjBROdJqAKYie12kYtNQ1y
	/MGqKCtNbmv/FcRi1xEmEUzifXzPR25KdPBtSxAKqg8a6PhtwwzhkFawzpsSR6DJBECfy+Fk5W8
	bzN/C680adLhhZLBVVPAtEpm7YfXC7n1zRDv7Q042NO68SJZC/tBQtg8vi9cRz+yk5qbahWFHny
	YjMghLUrh48Z9YDrTxqfR8/7/HdwWd/+6jJ6VLNFUQ97fiP5PLcFiJLbKa9/gcUIxvSQiE/vHuv
	lySWzd5wdXNKn2PD0xAmKfEE1wxz7HFedvRPWn/mrR3pQBQBM2nMLfRaibdYIokd6A9h4LuO1tT
	ENUlpcYBsWGgCcmh5S1nIjSbgLwnsR49vpHwKKwFkZebVjAzEFO/RRmz6sw4NPdyn2qh79WGqfD
	HOBdl9ubdxiDwEQD4MlidNqMkptxA3ZSvccN93j5XE6vhu6iioencCM3QDBGcTghfsl89Qeow5D
	tuLPaa+8Bj6jCwuwMDwIrTzMaFr7RVMj13Wpj9Nwv5cODp9TnECHWNf6m+eOWXCfRnED15h2gUz
	a9gzGJ404e7A1tJqmcLdE0c70TB6yTaeqsbiJ8RIshnqdn8p1ysABTsMiUirP/6IQFyDuN7io=
X-Received: by 2002:a17:907:c23:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c4ca7ad10edmr1125964766b.41.1793717873240;
        Tue, 03 Nov 2026 06:57:53 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebec78f3sm93656366b.23.2026.11.03.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:57:52 -0800 (PST)
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
Subject: [PATCH v2 2/2] PM: hibernate: refuse splice on /sys/power/resume
Date: Tue,  3 Nov 2026 15:57:43 +0100
Message-ID: <417c773d1719006cc85a3468dc393f5e754bf855.1793715774.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793715774.git.krystianmkaniewski@gmail.com>
References: <cover.1793715774.git.krystianmkaniewski@gmail.com>
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
SYSFS_LOOKUP so that its writable opens refuse splice and use lockdep
classes of their own. Plain read() and write() keep their behavior, and
read-only opens retain splice support.

Fixes: 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev in resume_store")
Reported-by: syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=002fb7b2d0bc53bf7e75
Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/r/ec0c2add83f18d7a3c726d5d219dfe42@kernel.org
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v2:
- New patch. Together with patch 1, this replaces the v1 autofs change.

 kernel/power/hibernate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index e365e440cd5299..9dc5a27f674fa0 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1316,7 +1316,8 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return n;
 }
 
-power_attr(resume);
+static struct kobj_attribute resume_attr =
+	__ATTR_LOOKUP(resume, 0644, resume_show, resume_store);
 
 static ssize_t resume_offset_show(struct kobject *kobj,
 				  struct kobj_attribute *attr, char *buf)
-- 
2.53.0

