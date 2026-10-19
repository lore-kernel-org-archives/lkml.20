Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A54F85AD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419662; cv=none; b=K7UEm/jyz7omZPZLZD58yv+Y6XakqrsVgLAEas4fDWclKTWUxmm5JQYnEaA3JP2eXgWsnjzGd6Koq0gW2kd1MaDyBigwTsicy5Bc+Wwd6QYntDAJeT1Zx5qR8EgzaUoCIcgOcjW5ubQ0+hg09BA/LQ6JqPcUkzxrYcxqtsScsvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419662; c=relaxed/simple;
	bh=BPuSehC+2SizEm8Q590GYMEvYmrsbmRmwXKqW/CVDrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulUKOKtAfRM3lM6iqWmrcs68egjfz4foVYPn1vXOEE2hdppGkbMfPq0S2l7v8sYzCluEAVjvrTyUaXou8nHF0RO2hWd5Ra13ap0l/7mtb7EAcQz6WTqvSr+b9Ku+iMxwQTbltG3Rb7u+gfvenUpHap846oce8Ffk3SoQiWAADGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQa4q207; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQa4q207"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso9789065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419659; x=1793024459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPuSehC+2SizEm8Q590GYMEvYmrsbmRmwXKqW/CVDrE=;
        b=RQa4q207g+ucKBcJCLraS87nfb7xyyI6sEfV3NIegi8g9FOp3mObXZZTcCY40Y5Gqn
         1VbG716gXXLhefA8uwKqwWzoeBids9ICS7WtlzoMX+SpOtBYMuz2uTWxYhJGzrkWRpA5
         jGtRzvqy+be6DHI/48WyoE6nUKgHiHGZZsjOGqQtarR+LzFLxcX69zsT9LF05V9KuodT
         w0yOCYS0lAiDtsLEJyCPQ+TVz5YtqFHi+6WV6dxARM6AgVyqQ0pbfL+Po3j+i7Md32O6
         ECYXLOI5KDlN5tLsWKykGYMIYKR3f/AZ+UWec1A6rawxx66wHatQUKfXQMD27zHfaHAb
         ZssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419659; x=1793024459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPuSehC+2SizEm8Q590GYMEvYmrsbmRmwXKqW/CVDrE=;
        b=oM+UpJgbstB8M/3q+xq+KeWdX24pcTel6dDpeES/q85Vzwmqwqp1zxTiSIu9lvi4Ya
         dePK+7BI7HxG+L/zWQSEyjs4WbaFXopRNwrsO6UQNvNmHQVLbjBsES/v7sOYZScxVtM7
         r/4pHCfNUUKZur4HRlBd5giiy+vMJO6hTlqUDZDLrnPaTpoWcZC75yAHrPpepTUms9xL
         o4h3+3TbQXi3SQqDaE0yxz+oZc0mAuaIyofhRNx2SYhkVRntuoGTjocVh5UA+Sj8uJAQ
         OmEckHuiBBY4zaqxagnCBanWdy6TOrxMemYVXwuNSFhtn1Qun/qf+F879ZV0VZchhhqk
         Jr0A==
X-Forwarded-Encrypted: i=1; AKwUvByf+83Y/WGkhKauKyIUynx7k9jxSeD/DLOauZsk/4U/xonuKu+1sQG9HU0WH8RPZn1Bu1ek0VZp5gU5iNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYICMytDMuKHBUTER3oyAIeq5lddpEeaZ2bgfdI6OG4/+G0wM+n6
	hHhUuaAHov+4B2kvHpHcLAzlWkoB/VFq3MFAPMJfqt0/7Di1EsXowTCa
X-Gm-Gg: AYBFou1DYvkIQ72aFd563hhGivnQotHelxNH+IGZ6dhajYGadhYvTzv0VFe3OugsW0O
	/CMHCMUyHpt23UmR+5H+K4ceAGckDmzTgNCTQJw0alAX1EnfI0G/Gtz1bocyZss6+Vdlv1k+oj7
	v0mXqe7vy4BZp1DjrmPQcSQp0qVzL+nvRqdd3DaSBPWPV2i0CS51VckKkMsIxRkVhQKqcPbeL+6
	WbRUcsNs7Mj/k7Jjrhs7YddE6f7qVFs5SGlLxVm0lm7xT5hLHCtWhjRN93LVxUHqT1ZDMvo+C6r
	6hh3/yDMpBNuYXCGgif8Gm5UKM0d07qbLtC6DrmvuwLc2vhK8kXA9NRGfjnnt6OsAvTv0i/10Rp
	er4DoCS8crTGGe0kaH9f8OJRVLAZbsmFjvRnI1MDukF0VxO5xeZ5oRY4XVM/Vc6f3in/pkf7Xsa
	q5LbVMm5XP791F1B3bQ2Q2qnrI2K7gY4ht7Jq1OvrHZk53zcBB9pwrst1BgftscwmerBsJQChaK
	erdsmZ/xTJGNnVKNX02wVwmbi8qzYtbErRRAPz4+hCwGlBKoPqGXE++LI9utbQzpfVudcD7deGs
	kgUie4yMhEGohDV4
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr186069345e9.19.1792419659252;
        Mon, 19 Oct 2026 07:20:59 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e28bcsm23702042f8f.23.2026.10.19.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:20:58 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Mon, 19 Oct 2026 14:20:57 +0000
Message-ID: <20261019142057.3973805-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <875wyy15c5.fsf@bootlin.com>
References: <875wyy15c5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miquel,

On Mon, 19 Oct 2026, Miquel Raynal wrote:
> We are maintainers, not chatbots. Please allow us reasonable time.

I apologize for pushing it so soon. Your quick reply last time made
me think this one had slipped through. I'll wait patiently next time.

Thanks,
Orgad
