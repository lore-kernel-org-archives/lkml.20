Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3CF4DAF9A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018845; cv=none; b=AdIQ5wwtqgvlsRL56OptPd/AsGPkgzDYeEPo/aEJV2nualogfT8m2iRqD8hGauVhgQO0Pt5JSYZDWvlQZ4gLaf33F2uNHz/tKGh9xj3uCd02bHc7GalNB3q1maicvwmCJpupnbItCl4ofLppwO33EyGptYjl/WEj1LOHCQTZ4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018845; c=relaxed/simple;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmtjVaLrDfozTqswM6a3BnPjiIGXL5HKGLcqTOKeFhWqOkQ4GzsyXxtV9S4AjV76nPd0buS11GMNLwtFSNvB6eFqQ0oIuhCsUsiQyFsDHedc2VmXTx3pGOzt6hrt9axzATDY35lmKesLjHwB6oVu8W4C7G2BtOgKw/N8rWMd+F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jt8+wtSv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt8+wtSv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso4233269f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792018843; x=1792623643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=jt8+wtSvp1Ej4wHbT5h0YMJUeMhws74la5HjvtU+klQdXWw5SmZ0fIk8aTiTEjitN9
         FR+GUOPTIx2pzKL0kKXUvrMrcbhh0amj8gZCzZ2COoCFS3J0vAREnQqKYxSiLiP6+v6t
         6xmU9df1SSimyOB6oD2qU8Jtut7YhN69fnF4dUf4Mu9z7m+lXJZwkds0l4oAlCv5hVM3
         ABDDqmdJZUVoOs2YuF8y+S7QK0XTbUDNlmEyvNjmW9pK3rl+LfkbnLlslGfiWIpMLOch
         HXNnmH8f9Oxd7Nc1WwS1oEz5n8hSUBLIaaaEA52+Nnz/81OgQAWZgLYozQVm+tGRD3DX
         d2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792018843; x=1792623643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=V2vq1e1dEwinREFdAyOBLlRyMlo/A5tgVdV8ohgwinFoOSQoFg0A1ZbHuiYsmip3v4
         FZdKaEYllXV4LpLS8HUFe4OCJ1Os3RK6nzjYmhdUN6GbV43ojE6csmI9mP6t32kVNxWs
         z9c2hvIoNWMKzuXNvaZEUm1ty+BzFjkduXW32JqJkfJ3d99ToeWBqZttM9MLqAoS6nsR
         oGcSU4p59Uuyt9LRZbRcn5oCWhP3FBSsZ9UdEInd3PNdaXbhVNK7SBZALPCPIU+HHflo
         bBgoMIewmQz3rrJXJybAbH+Zd66H4m8/olxG8ecuct17u3jphGweAra2yn1Lf0RvW2e2
         sfNw==
X-Forwarded-Encrypted: i=1; AKwUvBxjHUz8JzlXl7jC7PzRDtVul332vyHQvN8LNZSdAnoXDB9XcuAPK5xHYasSXoe1spugoBsYTRfdFUfo85E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Bn1gVhRKZf9h905/mcL9kvGIfIT2ydGj0wsILHXVHJvPmnKy
	W+/wS/P3SAAbW9kQJ42ANdNOTcxSQyb42rVZq/AbXDlVNAJlKtNzZO43
X-Gm-Gg: AYBFou0Of5TtkW+fkO8xapDEE7eKbVXCgBKlwyVpVhHpZx5/5uWPGPthf8dJnH9vaRv
	hFSOjH5IEfpe0YyAkJ3+9m+lyhpLRomA9iNvh+yphWqGdg0TjdAWxnKhP6nPMAY70JSCE9UU26x
	RJIgbKM+eAoVWlJRoCb98wiiH5VDjEpcgsT6R/bFvYBCyg93Sxzgux/kjryEkFpY6bWcq/q2yp8
	d8MGq0NGUVN3Cycn2pYKET5AkCf1IaM8sTP4ldy84RQQtCmzxBD11cTfOzAhwSek2Box9tx2LKN
	uN8XXLxMpSUYWkQhBRvIG8PmJ9rCrR1XzJe6kOjb3XXffCLdCYNtk6iTzdVCadFdPLRmFUKb0vA
	csPK9k2wv0GW0iyLOQNYLf5/e/VLSBXWSzd+TCj67LC4XLC4RfwbeHT2y2ICZ/3mPqIOX9D3F95
	08SY8KMo2X7FlLs28QQOJvUUyiqPvnvHezQRHsaOQAlfi73ZI2fseKblmv12w0vqh5
X-Received: by 2002:a5d:5d89:0:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48ded0e6cc9mr6634802f8f.4.1792018842530;
        Wed, 14 Oct 2026 16:00:42 -0700 (PDT)
Received: from beelink ([186.247.161.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ebbsm14231065f8f.45.2026.10.14.16.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:00:41 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free on umount
Date: Wed, 14 Oct 2026 20:00:25 -0300
Message-ID: <20261014230031.3222107-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008003955.1191-1-hackerowskiy@gmail.com>
References: <20261008003955.1191-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
