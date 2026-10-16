Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4F23C8AE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110681; cv=none; b=iJFVSKHd7xmrmdzj1Z1DZ47g4MmvwcxbCnXoUK5fDqzy3foB5Yb0H4vAosXoCPnuzEDwB+TMq8Ek3iDBjyO/NkTAzLY9oSF5oriSSgUejiZ/g7bKvEIuiX+sHuMr/bK1Rm91w4Iz4Gu/k1yIRtVc6FP4Z6u525doCutC7g1BW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110681; c=relaxed/simple;
	bh=pPpVYZE37MEdXM4A+LvUAcPCWE74zNQfH8gS2u8rINM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=bpEEYbLQguPXHnFKr6NhUFROqFmZPUEndXYYDoy6O7fRKlAveyW21l2pO5xXekQVuFnu6p6IsO2iEyZvL2JB9eQ1a6mTLY/kjDb1iuG6Pu8W5bLVK9WWJ6QwmpnehA6PV0rx06ROYhOscdaaUDvBkPK9gGdLgrnsRzrpaig8Ybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA54Ps/7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA54Ps/7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89d6bd67045so314025b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792110680; x=1792715480; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPpVYZE37MEdXM4A+LvUAcPCWE74zNQfH8gS2u8rINM=;
        b=dA54Ps/7pR0FU9wNDr9tY3+FpNTxC29Ck0g7Lx9551UcjbWRuergvCfYwqHsLcci0k
         psV0muIX38K/9zdQFoVCKZE1QuBHSNFSNJcHGrfhYSkHKdbgpAR/k+6dEMK4jXpl6CeR
         dfOsI3iMB0v9G3k+hGqStjHifMQklrv5V3tG7rT6Pbl9WQl5Nd747zoKFCwZvskD8vcx
         By3uujNiVzEnkZnMcewEvCnuM9nwy5SvP8+Z2Yr+/OE+OmmWeJ89NDzyy7U4r8Y25AKT
         3UJ8/pWZLrLw6U69XeNrydWYhGkvQHY9JPqNx6eNd5x+xdTMs/o2QPCc8f1Z/n9d8dHN
         PmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792110680; x=1792715480;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPpVYZE37MEdXM4A+LvUAcPCWE74zNQfH8gS2u8rINM=;
        b=ny1yMpr/EuhDZnzDlGZRMpUIZfP9/nv4maRZUW/mYEYtgAg3NQ/xzLqNbHKcrfqiXx
         UFAdb54WBujwiKGnAHE4itF3xMKlQ/e4Et9pNFjog2y/hZl7r6hkC9L79NXrhiVmvUce
         rj3wE/jcEsuz4hKWSkC2+ammvWN7N9Fzu8jI3fMCR5Xw+PkvLmsmdAttEE1X6va5+ker
         dKj/9LdQ3w1zP53JbUHxMzUS90UhhEbbuvfz2FyGMaJa+EvSVBWVU/QG5BM83JzuwHYR
         ueNwG6zx5o4IfQYH5x8LzrsGE6223LPRHfZ9OAw8ywkp3L7svued3c/rgiSD72RsQtAb
         efsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyQTSpDjuGk5PU2+YRdlWgAwiLJ6oEKWgAQJJKsc+otS+t775TG9l5ARheIuegHkOQoW1zvcBQTkQOZIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6B5hjjSxyRRtmh5hYBxuRI6qsO/V4iQQEFhCjWlPSvaDU7LG1
	p060e3ENf+b9N8aZ9FCtRIT7v7Ldn/By7v5U0uGk+tkoxSy04c3Im82E
X-Gm-Gg: AYBFou1TPE6Vc1q/BvMSh1Ogrt51farC/R21INe+tubKPHwvkR+DEETvqPdhYYbt0L3
	nDG1X84V1i3FOxa2XWhDMSiGtvSz8VBngmallcSe6EK1mCz+uy7+QrMhSSt/IexslbnaohkcLvX
	+gb1rKjdiZvlEm0QjywuzzcBlcYE8mliQSrk66YZ/Kvxj2+0PQVl4VOX0+qWZuh0e5zPoJWW9SO
	Dl5kUO3jyvhAwSG1dHRx/WzXBwjsiDjPRAKmTzK7q+aEXkoD6tE/PKXhio7sR1KbiB0wXm1yNN5
	P9tJSRlBUf0vQhEyNM4GERHRJiydFBUt3P0febO3WefxVx1jEobwyZIDDH6EoDUTjFs1Rs3gmbq
	CuDskQBYnThOBs8NXeTHjnCtwBZXc0ilifUuiRVq43IHUuKw3nggxRemSV/N4aoV8EkruOMKm/b
	rf8aYWootml6O6aYeHcfK2DR1Ctf8tdoH5zwH2va2+Y6eyQKn2ctMjbkZVgRo07M2FfHqTcnccK
	lifsuFUbGd1q2LEkrW0Bb3NiEDY3xR9R7iceijOA3qknD4O4crcuwx1hEPGouIWmG5kzEFkj8+l
	Z2g=
X-Received: by 2002:a05:6a00:230c:b0:877:ce59:bd6 with SMTP id d2e1a72fcca58-89f1e9a1c35mr1115329b3a.1.1792110679891;
        Thu, 15 Oct 2026 17:31:19 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57947a64sm275547b3a.41.2026.10.15.17.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:31:19 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:31:18 +0000
Message-Id: <DM5U7S0WO4CB.72E73EAOUSGZ@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <jakub@cloudflare.com>,
 <jiayuan.chen@linux.dev>, <kuniyu@google.com>, <willemb@google.com>,
 <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 0/2] bpf: Fix iterator link update target validation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jan-Gerd Tenberge" <janten@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261008161309.8179-1-janten@gmail.com>
References: <20261008161309.8179-1-janten@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 06:13 PM Jan-Gerd Tenberge <janten@gmail.com> wrote:
> Runtime testing in disposable QEMU guests confirmed that the resulting
> out-of-bounds access can reach kernel-owned metadata of a separately
> allocated live map and cause a deterministic kernel panic. Corrupting a

Way too long.
The prog needs CAP_BPF and CAP_PERFMON and it writes past the end
of the map value. That's all that needs to be said.
See "Length" and "Impact Evaluation" in
Documentation/process/security-bugs.rst.
Trim the commit log of patch 1 as well.

pw-bot: cr
