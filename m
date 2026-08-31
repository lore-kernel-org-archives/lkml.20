Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD63A7833
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155424; cv=none; b=db57LMWtPbr5e+0fOhFxTFs2WD92L1F6Xm1+MWioydDkZirQJ+OKOxJB4u6JZwlSneIyIHwpO6z5i7ASsyuqFF9QbCaYiWeXBq75uWsGw6yCXSKzja5UwzsIUPb+IxReBe3rrx99cVkZxvyjf9U9ihm0UwyCjV6TEN9f55ZGEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155424; c=relaxed/simple;
	bh=WPzDy6QI0Cdle48zbtI72awG3e8e4k1qnYGpIZr5jR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odKEA98ygWZnYR0oqd8Ug6Y35v8NfABFtH0UPlnD2xbperLJ3bDYqQ+pObhHAUkcrnA4JMVOjRyHTPjgHdADnOxWV3evlka+EXu2ZU4k3n1tkSMH3XjIYIEf9gsIjs0YhftZXoXOyH4R+OGD6zuNb2vg0LFCicQRKAtZutnnUBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieU09dJK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieU09dJK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d7200b2e15so32439165ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155423; x=1788760223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4fY8flvk1Rf5VPFbST/ZHdyH507l/1gO7fTOQXgpBc=;
        b=ieU09dJKGlWOpFhdni3p+RBojCEQJ26948+sYplhqXv41B3ONyyHexnzlNsZwUD9Eb
         TWbJJDr73RPno7BY+u+Judpn7+qTJRBISiTEbZfBhnh/hN/csp8hrViE8rdBC5c9HGmz
         Jt9DohUytzz5knWCMxH4dT7BGMO2MJ96G2mo53xlZ0c3KEcz9j3ruI0d7J1jbCvdXPVb
         clgeZszopNOO0z0zNL0mbvNmk6gGt8DCsqcDQZPf/VE/q/K9l6dJPYSlZfk/Z2NKO7xY
         EYcM+cH2gkpm+AiPCnzTgmnfSH8N/x/CMJYHhthnIbP9obiF+Y5GB7/43dJvQb6eOyhQ
         kI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155423; x=1788760223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4fY8flvk1Rf5VPFbST/ZHdyH507l/1gO7fTOQXgpBc=;
        b=n2KyX35uwkC2EcnKzTE9zRAwb9XlJlLvmQNCLRKVWRU2rAyZsu6/tKxpgEF2ivLX/0
         PwNzTMcHGZsXV2Tp1J/uzWqRtmy2nlEcKz4+pSvAzKvU4DCIHBQ1/1kr7dAgZnXHzz2p
         BSOPBzmwGXsRNly7C36Ilch5La4l8iETEv6uU27sm10Xib9wszxxORIvDC8ypWf5vc8p
         J1jCP0zy2JDiajTDYArqsR2FtEbMpC3DW0kOkPbuVq+9niGlQJ6BLKpMTs80uQX8o/CL
         HL6b/AwLwm4rv41XXQ/nu6LbqIl0z0Qo5Wp9GP82gTLGBgkBGWszVLqKjztS0m9MkY2s
         Z/Mg==
X-Forwarded-Encrypted: i=1; AKwUvBx7zoo20K4TIWJiNqvZgOl2Uoikl/IyOoYtbFi9dt2nALHsf6KSJoQv+XTzNxzfDt0Q++Uy1/sZ4LIXacA=@vger.kernel.org
X-Gm-Message-State: AFuF++mzbueOpL+wXLe5hzPJdNF/KR7u8Z62qo5yuZp0yUeE0Qv45ud/
	dbAODnAz89HR56IDWUeI9c0wwUyLJd2O3yp5obeOt62mhxkQEKf1YHSd
X-Gm-Gg: AYBFou1CE7RqE72wqUjbJkRLycLuS/1bmex58TLakIHaddpP4zq6IKAb4gtitClwZIx
	XeecjFdJT0/9Rc4wTVsOMruvVdWi+5DiOir6OxqOAq3YYzV0FzjJ3EsAZdFPbxbrXSNlnSH0Jni
	r+Zt0kkO6FdYCHuQYf1ovIcoLauQx8IuiaUJwmPkF6CgsuZmDEk70JemHwK5cWdxieyFPQpXwXe
	m+JDcC+F1YpMrQpMVZ4K2cXo9CdjzJCM8P7cwrIKipRum6a2XBl6iOqSwsTksXmgPjohTCMgNHd
	qj/C+nz0iMGT1YZZWIdWf6U84I86lih0+pZCZOUfESHG/ZqvBBuGotcmsICoN6BH+46VfQRBsmh
	Pygp8CFj63b5Mrv/FGT/rEdeW4L7GaexGDEj2d/Hu5D9mZPaabL0kMQ9RauH7OCUssiY1D8UHIc
	lh1WLUeoY9t39Z4Og2MZga2S3xi8sCrkD+9K4XI/qZ2vmOfPpJTxosC78Q9GVInCSgYlE=
X-Received: by 2002:a17:903:38cf:b0:2d8:d4cc:be68 with SMTP id d9443c01a7336-2d93fa55ab8mr14713175ad.21.1788155422558;
        Sun, 30 Aug 2026 22:50:22 -0700 (PDT)
Received: from Default ([2409:40f4:1012:165f:9722:a5d1:aa46:da42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm12967862eec.2.2026.08.30.22.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:50:22 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: ccc194101@163.com
Cc: bentiss@kernel.org,
	chenchangcheng@kylinos.cn,
	jeffinphilip14@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0a031a76585d1c7e737d@syzkaller.appspotmail.com
Subject: [PATCH] HID: corsair: do not re-schedule LED worker after it has been cancelled
Date: Mon, 31 Aug 2026 11:20:05 +0530
Message-ID: <20260831055005.18420-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817072831.139954-1-ccc194101@163.com>
References: <20260817072831.139954-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Aug 2026 15:28:31 +0800, Chen Changcheng wrote:
>Commit eb51c9f8cb4f0 ("HID: corsair: cancel worker before unregistering
>LED to fix use-after-free") moved cancel_work_sync() ahead of
>led_classdev_unregister() in k90_cleanup_backlight() and
>k90_cleanup_macro_functions().  led_classdev_unregister() internally
>calls led_set_brightness(LED_OFF), which reaches the driver's
>k90_brightness_set() callback.  Since that callback schedules the worker
>unconditionally, the worker was re-queued after cancel_work_sync() had
>drained it, and the subsequent kfree() freed a still-active work_struct:
>
>    ODEBUG: free active (active state 0) object type: work_struct
>            hint: k90_record_led_work
>
>The removed flag check inside the worker itself only stops it from
>dereferencing freed memory once it runs; it cannot prevent the re-queue.
>
>Fix this by making k90_brightness_set() a no-op once removed is set, so
>the LED_OFF update issued from led_classdev_unregister() can no longer
>re-schedule the worker after it has been cancelled.  Also apply the
>cancel-before-unregister ordering to the probe error path
>(k90_init_macro_functions() fail_sysfs) for consistency.

This UAF[1] can be prevented by your patch, would you consider adding that too
in your patch?

[1]: https://lore.kernel.org/all/6a937393.1d9ded08.62e62.0113.GAE@google.com/#R

Thanks,
Jeffin.
