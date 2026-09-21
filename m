Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778EA352003
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967806; cv=none; b=uvZiqexlD0yRvLs7bUp8+dNTTfrPmDh8FofD6TUIZbpecJVd28dcKML76kEq2IUxmzZu+pBf9E4AEfLgJF0xBYhXy7nMHlpa6pZTEawYKQ086oR2Rky1C8SQa5OZV8WOncLpIw9w0qFC+NUTFSTWPWbSpURIQ7pRjb3U7lx83Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967806; c=relaxed/simple;
	bh=3g1zbiU1QK5zke0/S4jE/NxmBKVwHjzxstpSj/Q5/eE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QIKbccqu3p/jV87cg++eTXRbj1Xx9VunC2F77Vc0gy9y2ILWrNU8Fdm15xPUL8BphFZXIgImWIzSp0hIVbMMfcoh08QGezt40nhx/AhmjB5Dd+osvrRkM7lO8eSXKdBfIyTSahXrCY+aXOkQWjURXuF8f7J6Mg5Tljz7kvd4h1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObPl6Z3X; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObPl6Z3X"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so22923895ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789967803; x=1790572603; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=38kXP5y7t8yIDd2XgtSWMeypsNJyNTHpui685k0AnDQ=;
        b=ObPl6Z3Xx1hI5SIEtP0NjPS5uW0eXRQnCwDvqNoxDJ/y+5eD/ZwC6/7KyIoZuMyOlJ
         EqJnGZH0VBMWv4jNWftJeSNAVRtvmmyRk1Yc2ozsAF5JBX02h2YulVjmByNNe6o3Jb1y
         x+QYAp6eNpVR2X38q8X4+L7aLI6PKHBOz5NEFkxkkWOHaNZ11RThB245uL/ZNt6FhJlm
         AijeMzPPJQKrwZRbRhy8bJv72wr/DJFaRHn/QWtagYrQFkGqCgx7bZufizOvWQw9K9EN
         csWMbCNvk5E0Lj4qqA+DuKS91B/r8TPWOd68L2K/0IOP6nL/xXhv/AjeKItNhH34hwYn
         a/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967803; x=1790572603;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38kXP5y7t8yIDd2XgtSWMeypsNJyNTHpui685k0AnDQ=;
        b=w4g2AiQPq9F6L4fx+KCUBwGLUPzXxkgUhCxQkxU15SzHwaccX+rkdV3iuaXx0Zq0E/
         RAgn/eK3GBblmkLjNUnxRvUFgMcLVjK/ITdDNdXy0LlatiIyhkeQOKhXL/7lbOp9pa65
         hid4tkw4CFUM6hdCrOdsA+H1YXkrWHGi20LQLyzClgGmv83uPrmOTVnZWkG0/uuuR7LB
         9IXY8Hk+nYrYgwsgbnnkYaK2nyeiUhWg1w+1r7Z5gi7Q5ws0FaKXKeFi7cpeUFpmOWKO
         SrenEHqYbLiJr+ABwERDPH44yZIngowub+cKBYDCdIrk62fTc24a59Y36Q1wpYhnicKc
         glkg==
X-Forwarded-Encrypted: i=1; AKwUvByBdxMRqCYnIML/LUcVM9bBF/OkSp4Vb/HFrtWI6lUwIxvg14vBkKTnIXCrEC4mlpzRgVoffzPqtbPQMko=@vger.kernel.org
X-Gm-Message-State: AFuF++nj/wwW3EHlI0O4SSa3hO/64sEVg+8VaHI6EEGtHIatfgD8ivdL
	hUsVr04eRvTKjf9nUieueLHvq1LlHwnyo9tL7/WMOp5tA4uJTGuy23o3
X-Gm-Gg: AYBFou0W+Of7bEHPemzbRdu0+4rHMHYhUWyeeAsO+0dW5dCr2F1kEA8TsrHEGbxhI+5
	OzCRjD6O7n9kp3LfSB9iQvMzVP6cy5V6ETuvvpcnwcduUL54fJLZYJ9pCzUMO+/EKEvD5PuftpQ
	CiilbGnC7OX8ifPhzu+xSax2oQT3HfyfsSY51EK1QaA+vuYtSKUxuKYw0bKEMeYEswB83jFPXLb
	vUgjdJtwpTfgkyezMvOfdupNa4Qxfny/hTg9mhDzmwavOeR8UEcFXqKZuddC6bcrczZ4O0BKaZx
	SXdRYNGSS9TRzUB5QFLaDd+SlaItq/JsgS2aR5e7Y/LJRu+RE98Lq5Ug82UpyzEmG1ErOgB3/SG
	HzK3ApGB6ykscIz8J8b+J64fqQ3XirzOKYuc7+fmyIZn1qgnm9EWTIigyCMvQQ7+Rv08UtQ/9Ji
	ND+B9+uBh3B7wuA67S7QYYRT/RG4fl5cu+zDhxSKe9rfe8EZh0ZlM0lOo+OaHAfyJnx+LA20Dik
	3+/lvXDanOxOjY+UPxN57lWbTcN3NM0HrHdv/qgTpDrwMO8
X-Received: by 2002:a17:903:ac6:b0:2dd:ad73:5b71 with SMTP id d9443c01a7336-2ddb1d5a667mr133827755ad.33.1789967802768;
        Sun, 20 Sep 2026 22:16:42 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17dbdsm17114682eec.1.2026.09.20.22.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 2/2] clocksource/drivers/timer-clint: Add T-Head
 C9xx clint
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <Mr.Bossman075@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260625134752.3107959-2-jtaubepe@redhat.com>
References: <20260625134752.3107959-1-jtaubepe@redhat.com>
 <20260625134752.3107959-2-jtaubepe@redhat.com>
Date: Sun, 20 Sep 2026 22:16:37 -0700
Message-Id: <178996779710.23212.16488712177302270116.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789967800; l=495;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=3g1zbiU1QK5zke0/S4jE/NxmBKVwHjzxstpSj/Q5/eE=;
 b=wAMUNHIueVGYaHUdxdg6y4PVoMywnzwDXfAPCRf7vEWza/xyfEXl6N3XBMrpn6lI/R+smnLHT
 5Sicpzx2vIrB2yYGQYK0DhAUA+u54FoHteuPV4wfeDDqQZadvJbdVXL
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Thu, 25 Jun 2026 09:47:52 -0400, Jesse Taube <jtaubepe@redhat.com> wrote:
> To use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need to take
> care two points:
> 
> 1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
> implement such support.
> 
> 2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
> add a quirk for lacking mtime register") of opensbi:
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

