Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480835;
	b=NSuYe4j9OzR81ZqlZSKSrwiaO9wmLCrS/t85E5etUGCezjzaIHkdvT515vM86025VDvn
	 JZ+L6mRtp53TvGbE6jshuNsvEAcKoLN0IuchwcRelMqwtvfY0KOxn/bODwa9ZyoUC8I4U
	 Gx0rJfiWqHvqGtQJ2hZ+SLvpkTiKEzWUtRcq+NvE6KdWarjP0QwSlooZlodfwQLvOt3M/
	 iz+4D1ixegsVZeg3ygzlABQvX4Wa9G4XWQbZGslrSEocbQzKwLrEgtwPM7s1DlmThqioW
	 695dD7lJt54amiZR+5FjJ6gzU/jDYDSbLdOEv6eD1nVKLnGQx/WI8pMWCFKU1gxb2Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480835;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer:X-Mutt-Fcc;
	bh=x9FymSRgKEmF3YLVaEmXV+qBe5FB2zMq7gJot0C8RFA=;
	b=1AK41C7WeiokZ278gvwUaOoRiYjyyfk93Ijy5/GEjWLYty5GYERNwQ0Fje/1cBl9B5HO
	 O/jVkBxpYhUns109QTrnZ8YaahKqQvk0kC8B8dH2JoF6051YS5eZPd5sQDKgy6aZ7Ue7m
	 +ky5Z4kNlGOEY+J6IgzFei2daGQRBeQ3Mox6+s9JQCup+mPe0NMIypoBv74en3Et3SPNO
	 IkAUeIquhoVG470cjxtiv4wj57bs2kEpNGbOWaCrdoM9gZcAos1bVi8GlUc1FkXeGg3K3
	 N34FP6enzGNDUyygJtx5rY03oHSUq8wgwlU3j+dK3PI427IBHZvthGhKDjclPDH28hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gbIsmZyd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kYxzWQLj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C98606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C98606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gbIsmZyd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kYxzWQLj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794480834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=x9FymSRgKEmF3YLVaEmXV+qBe5FB2zMq7gJot0C8RFA=;
	b=gbIsmZyd951GkYAeuc5ZVvZPM6iBmnW+NSEqvDeWCvQAXHsX3ABjnR0P4lGihKq90YfK6Q
	muIHNQdA/M0Q1Y76+xl/OBmt0j83U64zG185sJiLibkqkTSIltYKflwrqnOukKVyKoCKs/
	u1a6BAw5KImAlk18fDj78C4Fx2PVzbU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-E2YnazgyNIe-0tKkvEdxxw-1; Thu, 12 Nov 2026 05:53:52 -0500
X-MC-Unique: E2YnazgyNIe-0tKkvEdxxw-1
X-Mimecast-MFC-AGG-ID: E2YnazgyNIe-0tKkvEdxxw_1794480831
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-492d47f142cso537876f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794480831; x=1795085631; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9FymSRgKEmF3YLVaEmXV+qBe5FB2zMq7gJot0C8RFA=;
        b=kYxzWQLjAgb7uaSd94J0/GnE3e+uslJh0T7nLI6J5Y2CPFK/vi8ve70V/KvrFhlfXb
         2wV37QFKMOalUGJOTR9LzckAGvWSY7r/9RLfD/ATIjyHIUQFfjaU4/QzASTHohMie+L2
         3JdblAlJUCqEAT9YOF+ROtjzjTpVkvTIRndO2HpUNCaV29bS0yw1R+vbbW1aSgU+pcco
         xkboxj70uy73V4m802XAfLuy1zMD4g3P4ktC2GK9pgPGXZM4Y+DJ4vqpTtLiDak85cCl
         j11asEvqARn4jN0bKjaFP20rZ4PCbWURM7+xQXgbCPhzVRf4LcCZ1QFPC1ropbmu3nmr
         7Atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480831; x=1795085631;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9FymSRgKEmF3YLVaEmXV+qBe5FB2zMq7gJot0C8RFA=;
        b=qh0iwF/Oi+7SLETR8KBXzIV3PP1bURc0jF0ec4xrph2oVu7xko8kgCtuPR4HMKvZFJ
         RM0cr3qPYmvpXQF51k3hau0DcHKM+ZB2rDZ8HExdvcBVNr/39/iJVMTMDw5s/XLUTPTS
         rqrTXusOxZhUDqccn7piPisyVckmxoRtMJyhXDV0VvOLOYqxg7ZrYIGu+riL/wphKitg
         MRkA1F6xA5rNtb/o2MLSmQvSmIKQvo0m6IwgAlBl5SgO04k3lFMZx9w++CtPK1GsRV52
         qnoeGJwlgkEaP+JO8965F6ittyqsd2qWl8PNq1CH7Y33Ljzm1CUKyRZWLqe3zBUVxXJF
         KU1g==
X-Gm-Message-State: APuU4Z+YT/IWGk7BK+Z12CMDvjJeSSKLtaABpWnnC1XQnjBz54MQBYlP
	EM7XPcq6OkE81GxH9sngqljhb48RJ/tj7ZkrdZHpxg9PEqHfz25qmHYfVSVwHfIBsWoO8RTripA
	GvKSkRUrIFYAMuHZEA0lV7JIVDqGI7e+wCop6Jwr26RBaqYiJTNVSsD1SnFSpH5PL8xQIeo4LT+
	TxiaM/ZeTfKv8YvF0r6g8qg9uh6+W9ULLEo076Bj6c870=
X-Gm-Gg: AYBFou2PjKf/qGUwb1B+I41MC8Ov0J06ejXhw3x/spaHPN+UkXF3Q61FXLEMV1CKRhQ
	rJ+nVzcEqE5dvT35v/krcChtDaw/0ejGC/EggPngVPhrudUgJGj8J4QIGdJ6IbdY7vu49fRZu1R
	DSXeuiK8staCAQhQcoeBChANniFcSqKHmSL9Dn8L8FFizm4efr5l2gmHmAUHXjYp/vUHzCbBTsP
	8/enO4Lmc7le6QSluVTaT3LrrHvzgImjNPLTUL1Gffb3tCuz7mAF3UBJzebBYj815YGdbl1uRaF
	zYJOeeB97odcgw8zWufllas6GYkuPx29V6EFfsN5o3cvGYgFKThEf8qmVaK4l7IijVSHRdLdVns
	VDgImjN5PRn09waiYo1bDiYhHz5g6xD2tmqkzwOXBkQ==
X-Received: by 2002:a05:6000:4211:b0:498:364d:7509 with SMTP id ffacd0b85a97d-49b02d4cd48mr4648436f8f.24.1794480831252;
        Thu, 12 Nov 2026 02:53:51 -0800 (PST)
X-Received: by 2002:a05:6000:4211:b0:498:364d:7509 with SMTP id ffacd0b85a97d-49b02d4cd48mr4648361f8f.24.1794480830624;
        Thu, 12 Nov 2026 02:53:50 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbeedsm15992928f8f.43.2026.11.12.02.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:53:49 -0800 (PST)
Date: Thu, 12 Nov 2026 05:53:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Khan Zhao <zhaoguohan@kylinos.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH RFC] vhost: set dirty log bits without pinning pages on x86
Message-ID: <af7f05bf637337d35fdd10f3e0dbb5e39d7780e7.1794480795.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

vhost had a TODO to replace page pinning with a version
of set_bit that works on userspace memory, since forever.

It is really best to avoid GUP on fast path entirely.
Implement set_user_bit and use it in vhost, to do just that.

Should not be too hard for non-x86 too.

Reported-by: Khan Zhao <zhaoguohan@kylinos.cn>
Link: https://lore.kernel.org/all/20261112085631.128819-1-zhaoguohan@kylinos.cn/
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---


lightly tested. pls test and resubmit with your tool.

 arch/x86/include/asm/uaccess.h | 18 ++++++++++++++++++
 drivers/vhost/vhost.c          |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 3a0dd3c2b233e..ba1e7c3f83c8e 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -594,6 +594,24 @@ _label:									\
 	__ret;								\
 							})
 
+/* set_bit() on a byte of user memory; returns -EFAULT on fault. */
+#define set_bit_user(nr, addr)					\
+({									\
+	int __err = 0;							\
+	__uaccess_begin();						\
+	asm volatile("\n"						\
+		     "1: " LOCK_PREFIX "orb %[mask], %[ptr]\n"		\
+		     "2:\n"						\
+		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG,	\
+					   %[errout])			\
+		     : [errout] "=r" (__err),				\
+		       [ptr] "+m" (*(u8 __user *)(addr))		\
+		     : [mask] "q" ((unsigned char)BIT(nr))		\
+		     : "memory", "cc");				\
+	__uaccess_end();						\
+	__err ? -EFAULT : 0;						\
+})
+
 /*
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 2f2c45d208832..9ba16cbd788cc 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2405,6 +2405,12 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
 }
 EXPORT_SYMBOL_GPL(vhost_dev_ioctl);
 
+#ifdef CONFIG_X86
+static int set_bit_to_user(int nr, void __user *addr)
+{
+	return set_bit_user(nr, addr);
+}
+#else
 /* TODO: This is really inefficient.  We need something like get_user()
  * (instruction directly accesses the data, with an exception table entry
  * returning -EFAULT). See Documentation/arch/x86/exception-tables.rst.
@@ -2427,6 +2433,7 @@ static int set_bit_to_user(int nr, void __user *addr)
 	unpin_user_pages_dirty_lock(&page, 1, true);
 	return 0;
 }
+#endif /* CONFIG_X86 */
 
 static int log_write(void __user *log_base,
 		     u64 write_address, u64 write_length)
-- 
MST

