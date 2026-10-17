Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487A61A6820
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216734; cv=none; b=A9mTeY26ViKdVTkZJBbMXf4iTS/TstgR2ZVDSxDXypNRvyGYKwjx58sgbErH7SOs+vEeAY2lOvS4JkQA+Bj+1358EqNluhss1X+WfaiHnDfHMpfkNwpbTSh8DJTD4RtWM2O1KoKsXpdAMGhBIDFReNTt+aKAa4HO3XW2OKHh6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216734; c=relaxed/simple;
	bh=TS80zdwgZtIntN9BXJLlbabXB0MPOJk7F5xXN+y4vg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NZfj4GuUWGUjxUzreDdA4WcjYZWSvCMRbW1vYvnWgCh7myD9QUG9+kxHebwT1E72fr68j7is5g4CbyvchyaHNyI1SwLdsHnHDCDBFC0OOTKvTEb/RP2evbKgf16UoaurHrgkDV3XNwnes5PtYxn897a2vhBtKdtjyXqvSKTicfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxR3JUO9; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxR3JUO9"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac92391681so129147a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216733; x=1792821533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u1Xhol/J/CmwQIkyrdfZ4whYsR6x+45itfNA0thv6A=;
        b=GxR3JUO9aa0UMFtfc5R4GUjCE+WDh6JHH7CnNke/oeEI3bhnfI1qSUfSv+hqp5IWih
         ecw50Iz7DZV17CGu1jHhVb8WPxjtXZG4bpXMhChjD/4vLUM9R8PBfseo4P0l5P/CyEEj
         0cVWEx0vAEcboWP8yVLa/hR+eYAWHoChJdW9hEeY8zJQwfZOIyCq8ebikeWP57Ma3bSe
         6cf80Z10Jv5XevrznC44sHjHssfOtCENNiQpCoh4+BFOqnG1dFgea9MsEyOwcylAC+lS
         l1bVr4tXWvSp/KX0m5cPbD7ADl2o42fQ7GbA3DKJL21GLS1E+TbU2T4/3FZ/Hr8B9ogU
         p9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216733; x=1792821533;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u1Xhol/J/CmwQIkyrdfZ4whYsR6x+45itfNA0thv6A=;
        b=k4s7CAcBoMn5n0uiHgf/usJifRMsOtKBYIax4O+RYXDYEAqfutaZ70iRzVcVl+JWW+
         0fgFZ0lESMTzP1+bJF72Yuo2yjWUnS6DxJOPs564K+EK/UmXE9R8p6JHlO7h6sv6rVIl
         6Ds34joXJbWdUV9WhmWwQjPRsQJ4i76J3TzlJQP221LN8LKy0jFh335DmZutS+3ThGDO
         hz44K3NZHA6BAj73MfJSmkHiU8zQ0amYJiQHBAnIAQamFH6sLnNSsqDEZpFnxPnQT5wG
         5J9dOfrIB84T19Il3ISYnFf+iMpOjkyei5Jprhx6VWuFQYR6mFG3I/U/jlnb4Ft2+vXg
         OE+g==
X-Forwarded-Encrypted: i=1; AKwUvBxWY5pM0tcwDKoANmXyzZjoIr1Df1z+zy6QJQzS1STPJ7lNGoL7ff0pyCzi6sWJacBAZBOpbX6Zd0A1Dag=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMdAvyQ2gM/+TARheMjhllkdA8pgy5xt3PxEW1ItfF4lOD0AEN
	OZjoLpt3GItiiGnnbLFs9U9bATQiHndxCbCLN7mfAMHady9EY2U19L5Z
X-Gm-Gg: AYBFou2odeYBQIXPDs5PY0Pf8fj0xSz9Bf5OU4RgZSvi7LhhsH4kFHDpY+CQHQeefaQ
	GWMBoNV7yBzoeR1qXczlPRlB2uXL400ZeEnubgFPgOFRUwCByia3ZNNvfvjVnwm+URuJHKhIgTB
	J3GS1PvObccNqj2Ie73a6r8qJ2yav/jcUTvDoE7Ss4xygVccc9XirAAzOiy3M0A5L1O8ZL0pygV
	CAJ5RI+bB/ugT06mOGo6FGjDNJi4zTHDOkaA2LHFoOpNA/MKSfBifalBLGIGyfzIMJesaYDF0Tj
	NSFkCm7j3BvmVnkLHseO+xML47HBMF02LiDLPX2D7CLHBqQ3ULb7Cwk8NLTj8EoqyDaiibHzzhG
	B2cKQgkvd5qOGDqw55svUB0vXE99/Z9xHThBWm+2c9RVZjRlZWu5BGszWcPZVksDEPHw+1Uw1M6
	5gvd5w7VtAyO5aqEfCyJuFQQYq93QepxynZsufwXIV/+n8/m8X+Yrq/Xfwm1rEvreRSWpIL032F
	t1RTSi5MdYvFA==
X-Received: by 2002:a17:90b:4b90:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3acee2796e7mr1677864a91.4.1792216732662;
        Fri, 16 Oct 2026 22:58:52 -0700 (PDT)
Received: from localhost.localdomain ([123.109.188.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e72c6sm11901830a91.5.2026.10.16.22.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:58:52 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
To: bpf@vger.kernel.org
Cc: Woojin Ji <random6.xyz@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: Zero-extend the index in inlined bpf_get_func_arg()
Date: Sat, 17 Oct 2026 14:58:45 +0900
Message-ID: <179221660441.1929028.16387900667319276841.get-func-arg-cc@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179221432098.1890560.17043109037413683447.get-func-arg-index@gmail.com>
References: <179221432098.1890560.17043109037413683447.get-func-arg-index@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial posting of this patch went out without a Cc list; adding it
here. Nothing in the patch or in its commit message changed since that
posting, so there is nothing to re-review:

  https://lore.kernel.org/bpf/179221432098.1890560.17043109037413683447.get-func-arg-index@gmail.com/

For reference, the change under review is:

 kernel/bpf/fixups.c                                |  5 +++
 .../selftests/bpf/progs/get_func_args_test.c       | 36 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
