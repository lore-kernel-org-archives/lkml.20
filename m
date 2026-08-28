Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831491C69D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787891074; cv=none; b=VVQSHLs+ZcFu3spT3zt+vKW+xYOIbCaF4URCTGHQ5fT1m2laskJ+IZtjJLjYjmfgSnqXVinEOMRQPGzS9Mak7xtuoEuTkcGjl7xKH+uNIYNP7tXfQ/lmqMvfpe78s/Yv+1OlDA+ftWVACWdgRVXJPbleiHShxsVBVyuOf4myogs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787891074; c=relaxed/simple;
	bh=0Mh1jC/QJ/MzZmhoBgK71nmVa9X9R/cosBlVbeWXYl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvtTQez6JjeyZF+gXF0Kr7V02frP3nXBgG8+iE7eZJOt+Bms+VBNe9NtixLRxqgrqlYJm+KgKDXOvs5i2hLZDGse3JbKLI/VLVBzSovIWTmiM59XpEkUSuXQt5ySl2ZyQdWN5hQRHiMdf0Ud8cDYfWE5WFjQmF+WPxwdncj22c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=modMriXD; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="modMriXD"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487214ad2bso898412b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787891073; x=1788495873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADeDExzR1gAOijbYmVBsEH6+zMDPtRZUnlmbbAacMz0=;
        b=modMriXDUWQDrgFAcz9ZmlyGsEOiS9wO9qVT3mEpuxQv1sLthB4YBuw+Jb6EcXi03L
         zyoQKLIBeAR7RldWE43C7mpgil+ThplPfGI90BULQtgcNSn+91TkRuaO3xp5doFP3wys
         uIhr7LXeP/kQ+aaUnJhzwSND9wSVxHwhIxBhMreOejPtDi4+sDiOCJlPULZ14fpTmKZ2
         wwhzOSMifBjZL0zdaZ7DLH3ojFGJyAUj7jPYzeVKvfn7Ejv2CHwCM47PRaQjg0+b0+tJ
         wQQeDzVcIw/ORtvz5TaiqpcHvZcwXGi0PR3GOhKZwWq8JGct9eSjWmGxvGDdwEbj0W3v
         N5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787891073; x=1788495873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADeDExzR1gAOijbYmVBsEH6+zMDPtRZUnlmbbAacMz0=;
        b=Se5i9O82wsGs4rpA/IC49EjaTmBcx+Il0c+8yoo6JYEVXCc1r3Hdk64FCNEtuB5auh
         +dKj2SkHx+79TTWGAwvbRh0I2yR+IluquA72SMOnCIvL/+xYckQ226mo9OjVsvtUYAm8
         FErvCn2xCLTBJ3XdujreXxNEElwNGtkk+wDzofVhSdFPGc/psy0j3W1qmpFY+t3EkDL5
         iNHSKwF9D6VUBsc1LSGLT96fuEnhCU38bcwmStsV9kz//Kg/tQcpih7ufZ5CpeUVuHZf
         xqOixlvrsXgOPFCWi4h/ZGzpUEvzAaHlGoUWIqrZR7GAQbXLLAdRAqCVjenaCeG99GwB
         1kKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSSrnrPtj64Rv3VEv9GyrcFtN2R2vRBpHgXj8yW2SEME4Ny+nUhlq9hCxpA65TD27pDjkJtz6ZgmViGG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lX8MSr6ZcJX1bPssVJ1YpC6hvokkOEJSUWu0C5Wd5cPvtIkIMT
	aftzZXqw8sonartroQcDTUpeehZrfxmTNdm+ERedkawYU4JxZ9qcNN8H
X-Gm-Gg: AR+sD13Zgs5SjwYbITLe390frc2ntvKo3xYx3SA0y3kyxpD8WcFR2nN3/XmRQ2Xw94a
	eml+M1Qa1VzELv/QoGLLh3H+gqSG7JQeysuagRpEvLFRrYC5qHy5nYEuWYrjFXdX3/+8Bxpl4/i
	f7jLQTcKCoydbJQw52QgghY0adZvIZIH1scVS5MX4zKjj4YOQkOJhMZ1SGdxVjFXm3gWqIidX8a
	xFvYLoYLFQe1bTFDrV5vlIwKVyEhrfdGRH5CXHCkTZ78qsJdf6DJYnL8As4nhdSdjv9etDTjH98
	6ZNz8aSp/YZW98evfkSdxnCO27pbQgy0mETJtkvn0i32vyQHW621s5Pfgb9TFYGQj4nH/vfP019
	MA7nEXQXVJxC7td9b94udvywYokQJ20sRSbkEgzDWnR7EewlHQy3I3Nfw3QKFlj6dItgSXt/iYl
	DDG85FFEgUsRAmwYuSO6Do+B4PdArHnBTxvURA/zKcLi7/WtFeqP5rmYvCZA0RDUaev7QNV83W
X-Received: by 2002:a05:6a00:909e:b0:848:467d:293b with SMTP id d2e1a72fcca58-85629f0a1f8mr9011536b3a.11.1787891072818;
        Thu, 27 Aug 2026 21:24:32 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49ed7asm190642b3a.8.2026.08.27.21.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:24:32 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
Date: Fri, 28 Aug 2026 13:24:19 +0900
Message-ID: <20260828042421.964822-1-4ncienth@gmail.com>
In-Reply-To: <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
References: <20260827045007.3831259-1-4ncienth@gmail.com> <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Honza,

You are right that an fd-held dentry cannot satisfy the count == 1 check. I
was imprecise in the report: the fd and the final unlink refer to two
different hard-link dentries for the same inode.

The setup is:

  1. create A/x and link it as B/y;
  2. open B/y, add the old-group inode mark through that fd, then unlink
     B/y, leaving i_nlink == 1 while the fd retains the B/y dentry;
  3. race these two calls:

       unlink("A/x")

       fanotify_mark(racer_group, FAN_MARK_ADD, FAN_MODIFY,
                     victim_fd, NULL)

     where victim_fd still refers to the already unlinked B/y dentry.

So the A/x dentry checked by d_delete() is not held by the fd and can have
d_lockref.count == 1. Its unlink drops the inode's last link and reaches
dentry_unlink_inode() -> fsnotify_inoderemove(). At the same time,
fanotify_find_path() gets the same inode through the fd-held B/y dentry and
adds the racer mark.

Your suspicion matches this topology: __fsnotify_inode_delete() from
fsnotify_inoderemove() is running while the inode is still live and reachable
through the other, fd-held dentry. Deferring mark cleanup until
__destroy_inode() would avoid this particular add-versus-cleanup race. I have
not audited the broader consequences of that change yet.

I can send the exact reproducer privately if that would be useful.

Thanks,
Daehyeon
