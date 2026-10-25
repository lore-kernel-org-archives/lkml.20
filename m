Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932813;
	b=hp9ua5d+/gpLFcwxcj94oKinLBzfSMEgqaZ5ggFnS5womTyF1VtdzjLQUug1a+OvcW8E
	 w7VCSaGicoQWdiiODheNIGohKd8mls2urv5uzE+Doprx2NXAGnLv1WB2v1tXB4T/39seJ
	 wgeUcQABCTgSTTGKgeUALu9VbxisNo4wLp+4p1cD4tmz0nUGaYJZx7tojqfSDgaHdww+s
	 D1CVrFQWOL/B07fZYnMizT7Li6KHw/zg0Jy1qSKHCRoXt3/a+6C2MW2RYYk79GeDu5F2Z
	 XTI1BjHh25oslFBeVQfAoFjVq5Br5R597tm9YmoN06iM4GQKVbW6lE5zofyNo6lTDjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AMW1/8fX8Atf6UqsvjpOywQP22hAnwECitMY445RWYA=;
	b=xdkdmUVQh1Ns6eo5GSzaqolgP9LuEcdqPfIeqyXViYx/uiYWhbke94g18Wzsof4InJnC
	 8Du0f37bn1hSygWpwbPIco7vNPkQPEHmr8/hyMS6/xyMCaiQd4E0vbN9IgafsUZVEcUB4
	 8BGNT/1bi8Y0qaoaNxSqecBYAQH6g5mSswJUa0ypi/cVrK0u25YqKAvUXrj69NE2kdK20
	 0vb92EZgKJERKK/jZG9rMVgLf/KlqyqDvkcjwK8Q8vpewIRHNJjDOAHJhaWQosSDX3g3n
	 iMXSqclSkIk5MmAItNxahGXMfg+Xf+W00Z+bzW3le/s6wsBdVYjq3ZmYpPQM5FNQnUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Llmdrzig;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDFC606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EDFC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Llmdrzig
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so12008445e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792932812; x=1793537612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMW1/8fX8Atf6UqsvjpOywQP22hAnwECitMY445RWYA=;
        b=LlmdrzigULCw7LXFZFwAdP2Vn3iH/E1G2//zG/GDW0P7dIvxXL59bnV/8syChVhX8g
         rcV8cvAzoPqeVIsoB1NEdk+El01hFp4CDHUZ52Oj6JU2qanpv2fGrUWS+ZEOnOmou9XC
         y0bIwhB3UQ9b/uN1nB5xN8FDgQkBpxfbeRQ0Vhs9+8C3gMhq+4dHEG9a2uxRWC8GYEe7
         0o8FG35lmMYQ7uofc2izYnsD8MfazR7btiI2atwAPi9IG2gJoaGDS49hnCpat4kwqpRC
         2puiknFuCAuCdMKF7JYOnUKqvgq/K/LpneS1GxZrnXO+4XWSDZ+Gvvnx14YCmKKOOorR
         NgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932812; x=1793537612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMW1/8fX8Atf6UqsvjpOywQP22hAnwECitMY445RWYA=;
        b=K4aT/e9kI8ubSfV4qKMXtiyTqriZIrz5VTP4F+1UvTStI4dOZEgnRQMBbtYUMPfGW1
         x5DENMAIFnWAaQaac1JLvD2BaML3nV65aw+0+txRaVF9ngWxu2AD78suMOr8OE4irn/U
         QZ+tJZC4c5+l/gpYpzDGatWplOyGJFV94MXPDAZOIVStf9ixQ+hTd+tZOAdnjtQRGlhR
         zEAY2IS95kDo/7dC7RxmXTc72OEqxVTwEgqqazD8H0shY00NheTz8AxRDMVYM8xw+6JZ
         1tqVkyg5ymWAEmSsyP6Ro5WC+kjj0LMNNkP81ZkPW1loXSFN8Peqb81nnff774NYZIBl
         05MA==
X-Forwarded-Encrypted: i=1; AKwUvBzrhC6A9j5lPXEEjzLtrZ2VZWUqsttwnKDmQ5sdHlocRvRQSRRgo/aMHo3oPizDJpT8mqitPEtJdLUFRz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvx1CKQsyAEfRTnQs3s5mRT/pHHQ4vpJuuCjy+tpAu9aUyt0hS
	B946GqxzvZhaoOQPwwIDSift+cxa4CcqCWBf5Q8GE6YtXfkeEyu+kKGz
X-Gm-Gg: AYBFou26bUj8gietuDk5zBVWHAg0k9GuOo04TRrTpo90QjTLJ+8dSjfrn+t7B2SriEy
	5iRWL6Qp7rv7Yl4lVEum4EhCa++bvWWRa7id5bIVf0SX41S2IKSmkzfDBZq/nMZNAQiKaCnB/Bd
	6fgdRvzBT0PiaJwNCELL4RPf8XQfoWf45OpIU7MUUOaOsbjHlQzrhwjAjeF3mO2s3J+nftrT2On
	ohVZm+e7iBIsgBvpxYq4faCcrWG+oq58lA+OOlzqCRGcZbWhBnUAzhOkSeutAb6P5YHShM49kRR
	Rzm2nsl3D4gC9SXYvs2+jO6rXQhxyW5c4vOssJRJ5GNSG6V37leXqlyiNKqqI6pCDaZtsM4iTRj
	D6Xxzop9wsFJMesT1iBsWlPgM0PAX/gOgCni5FeCluAMDnx3qtmrJhh/FH3eDf4MLL3gVYsoyeN
	iRDGyuhjygIrnV2HT7zDrdW0sdUGT1QE84EMyPSKuPfaQ0qCXtRdBY645fEyLmY41JRrgEzWW7O
	SbGKTU8uUoB3dZOA7+69/LlY7To1E/H80UihruIVavQO8jJTO1JiVeXB+QZnni9FrVuNl+hfB3x
	PcDkB+HzCBuU6Y5fCqJMZWpHPBi2F7fiLU6jn+TdGJgYPeCKAAbk143Pqyfx2R/ss0Ig
X-Received: by 2002:a05:600c:870b:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a35ac95981mr70164175e9.14.1792932811603;
        Sun, 25 Oct 2026 05:53:31 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm10240448f8f.57.2026.10.25.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:53:30 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: keep vblank enabled when entering self refresh
Date: Sun, 25 Oct 2026 12:53:27 +0000
Message-ID: <20261025125327.208328-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9ee7225b-588b-4253-b766-5e6ee6dffb04@oss.qualcomm.com>
References: <9ee7225b-588b-4253-b766-5e6ee6dffb04@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/19/26 3:27 PM, Konrad Dybcio wrote:
> FWIW this is not enough to get self-refresh to work on the Glymur
> Zenbook A16 and the 8280-based x13s, the screen stays black if
> there's no updates (it worked on the latter in the past). Dmitry promised
> to take a look one day.

Thanks. For the record, I had already withdrawn this patch after the
sashiko-bot review (the self refresh exit path, and the vblank worker
touching DPU registers after the last runtime PM reference is gone). It
was never meant to make self refresh work, only to avoid the atomic
helper warning about vblank being disabled on a self refresh "disable".

I have no fix for the black screen, but I am happy to test whatever
Dmitry comes up with on the Surface Pro 11 (x1e80100, OLED eDP panel).

Ramón
