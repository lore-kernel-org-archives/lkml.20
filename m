Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73D3806AB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812443; cv=none; b=U2FvkZQyy6k+jqf2Wiyt7+Qa+iUe977AliTCxJC8d5l+/4Uxxe38hutDnO0dLuX7r34NTBCTbaSlP/inxEwvY19KLCPTCQSMtN8wahG42gXzkw5C058734VxQblwGxdVb+2agx2vFJgXketimeW7KAJv/+a5Ml9CdHUxS/UWarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812443; c=relaxed/simple;
	bh=BW1wpLoYKk2pIV/zuM1YKBU+Jk4slTJCsg2kUbro9Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnjPlsy7WScE8OK4GEDekE5v6no4uahRQrkBKWxlAcRBSYMIsm+TODx+V/LEyhPXOzqIMjkiyf9fiBe7yTyx7wFFxwgqHcrNCEtd3te8045Cb+u/JE/xpSC3ix6Y1YThoQjXjn9jl2pwLUKRSDYTBFzUxv2WzVAR94V1ljHngjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewBnIMWR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewBnIMWR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e71fc84bbso1430405e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812440; x=1792417240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BW1wpLoYKk2pIV/zuM1YKBU+Jk4slTJCsg2kUbro9Nw=;
        b=ewBnIMWR9jG7PoN2FY36ON6GJaI3KlAbdCbYKOeg+Q1sxJ/OT7NxKrPHpsko3Nlk0i
         zBq72r5QD6DTvzSqqnWZ4OlRc8ll+gzKlSD+QXlQS/LSQSS7CwZQUK/Df9pNqMlA6Wry
         yNKeLZ/BgS9nReZ9zOFu2Km1eEypfXal6AUcW2Nl4Avf02siO/izfo8WZLyeL3gsP9Qx
         Fs9o965XqbmJIhtou7eWdfpjRlxBUfgJ0Sihi6aoZmWDTvBokJq19p+dNcVJYQB8f0Xd
         EzhTBL0k7+odOf5V8qAUNRHAenR+5/X1164OUZ8+SmG5acTAB+lkXs5WtwMbFL2nhIXi
         /kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812440; x=1792417240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BW1wpLoYKk2pIV/zuM1YKBU+Jk4slTJCsg2kUbro9Nw=;
        b=noOuwq14NTxxWLFEscVGwRjhRxnIxjpIL5Wz7AdpQ7wPwAAzdsHzk2wvQ6pU8ne7ku
         bczFv6je+jS1Gsx+F4gDp1+GdsxwipRIQxFmWKDwyjz8GjdufhIOACpKemD7S6oPwj+w
         XLikSAyPEVeQLjpoQSzcZKx+uzq3eKMDmxq15L48sdrqX8UyeFX57ZN8EuqDBy4ReTrl
         6gKZmFT6u67X3OnGkrJdTOWyZ6pet2gPGm5Jm5rUp9cq+9Us7bbSmu/VsnuTWy/53cED
         ieHlVL5gRqtBq5uQgON7/DwXxB2HWrgt6DnPM8tyLbTCP1SXgK+NsIvYz/Dx4PL2N0cp
         dNnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqGDRk1Lafk3g560h056kdMimuUZrB8w8FKJSm7oEV0TZVB9qm6VKV6sZAFAL7/vkRtfbubDRE4c5Lva8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS9iuyMkKLtJVIGKh8jNByGpZMzpHy2xjq9rRCyOtS+H7brxdk
	TsoumAxAPytg4oiS1LIrrXEln16e3i6b2+Z4+pHFfnloakbBesiNhOj8
X-Gm-Gg: AYBFou2CSy2F0/ILvKEbQi8Nv7fUG4COc0AbXC/xB0ljuAGXqq/uuPLWv56iC3Pvd+Q
	XRwFhKYKhiYazMvWIRlblmCfBLvhthYIM63TWjSwOrBXb869sPo32o0fSXKF9nLtPas6OZiKJw5
	K3AGg/3nfSoB4I5DqQwobbTXR7JNLuXV8jtjIMfSnJzF5Oq4cFMi3qDfWz7pd0f0DVLQ9V9ij1q
	HswE6c6ZNSi0oh2iuO1B91IGY9V2i8LuzFa/3NMWD8eopvKxATHxLvs+PyCc+ehYi+pv555Sjng
	idsdvdafLoDwI3wKo2+N8VIxixJDyw1c9sew2Zyh/LRABOcU1CQyR1/cFzaRGDlpNDDlem2QkEa
	wXvgJngG8ZR+uZYFznNb/sdtVblFd7dkY32MtlYcvtTcchWLapKvnB4AXS8+Ng2sfE9rZMuZMJz
	v/BN9B4osBlD3Clq9GyhuXu0WBn88btvIJjk9x1JmDjtp8Izb1CIS5qHuO3dv5hQHlTf0EkWfOT
	PW9ifYvOmECnh/20TCNRaYrsB91LklH
X-Received: by 2002:a05:600c:6285:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4a18e4760demr178450175e9.1.1791812440060;
        Mon, 12 Oct 2026 06:40:40 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm170767905e9.2.2026.10.12.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:40:39 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 10/18 v2] sched/fair: Add force push task mechanism for fair
Date: Mon, 12 Oct 2026 16:40:35 +0300
Message-ID: <20261012134035.2757-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKfTPtBDcfk+TEEjD07RBLpCAusKqa0K4AWuFrcCtdw9uGsXCQ@mail.gmail.com>
References: <CAKfTPtBDcfk+TEEjD07RBLpCAusKqa0K4AWuFrcCtdw9uGsXCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The push mecanism part is generic and includes a push on put prev and
> a push on tick when the task is alone and never put back in the
> runnable list. For short slice tasks, we don't use the push on tick as
> there is no reason to push a short slice task that is alone on the
> cpu. The push on tick will be useful for other cases like misfit task,
> EAS and cache aware. The latters are not part of this patch

Thanks for clarifying!

Kayra
