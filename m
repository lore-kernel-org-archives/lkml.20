Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DAC34E745
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108347; cv=none; b=RkBvPyLDT4QtWHZU/yKJEcWcwBzE0+5WQ/UgnQ7saveLZEl9BATJEb3wwIxK+//SB0zWr2T2ewcVa4H8t3lEbybMxhHG0QBsUpMgCm4bTc74fGmrKwTjdR2W1/6FKZsLq22U2Ek4Pk8rjgyaZF8GgZJUvHyvPkH0G4qTFXS7CPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108347; c=relaxed/simple;
	bh=+gcYGZJlmCOavbvJmldQ/ivgBw0x9JuCRNzZ/unZeXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4Ui1rrVFUNWSviQ+CTxaA1jPFTyM8waeAev2N+5UmLiQ7g0vgGw/W0OMrRxPx02gTqo6pGLZJTzgFUfUbNA5pKbdUTbl1nbe5VIAFGZfq1qLl/Com8AMcSk5HmU3Cl9F11SfK0UpduVLzr6RGjKT2HOrqGLSi/usBeVNAZWHbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXHcLdXv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXHcLdXv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so5017635e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108344; x=1791713144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7dO0Rcfru0/bHBYtaY5qQl2mBgYh6+npZqhA24Mb2E=;
        b=PXHcLdXvnwtl3+a+nFTWHyH6ymt/QKmpm7ri1iSzU3104RXrN2F9L+g2XL8TCHkymp
         XPGWmb7ebH07lEAiYBEPVvYE6O56fSLI0zhmBgkUkam4HELae7GQf72ZkLl3trDr39Bh
         bVouG/RgyEeqKxMOypKzMJOHVPGZqJm39TUtXEZqoG08P7FL1kDaOMTb12DW2MP+EaXZ
         SKB//dd8K9YJ2PPmKm9hzm+Ie0YeYwuJHLc3dyzKqiEt2wMyElYMR99VAj8quE5SJCRG
         nDunyYduC+lRQ82m0QnMQDLtEJsP9XdDdWPctb7u7B3pIznVwgZPd7afLhfgSY4zi9Yg
         Z9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108344; x=1791713144;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7dO0Rcfru0/bHBYtaY5qQl2mBgYh6+npZqhA24Mb2E=;
        b=FfM5tW5yaIllp8HcBRHJKovXjKB7rsvyBfRYNIukGe7hxDkThxRlHpzR+iYEHLW5uU
         Ld2wC/w0lrWUrs0Er8HvMrfP9dXriRn43kTxWk+6STbQynoLGtpf7Q3ywlYZhVsJCDg0
         EIrKnvtmo8bHP0uOob/4vuNyuOk85lXWPsOAtuqazoBOWE1oskm6TF/qBYCsV+wZZVN3
         Zlb0V73nddrMwcE9Cz6WCDLns+nIq+xrshFu/5+BGZIDy8EM4jE708HqQ2rexYJZnkqd
         lPztG7I3mopdss/JVklwYmpXVH1HcrkrIYPyXUt5dJUy7RYgE8WiVjP2JlmEUVfhitYj
         rV8A==
X-Forwarded-Encrypted: i=1; AKwUvBxHGf9atesX0AcvwLfcTtmwBFHANL5XaRldwwGx2rB8vHvXwbi9SWoweSWzRRn6BxWd0fO9MiDB/H90GP4=@vger.kernel.org
X-Gm-Message-State: AFuF++nw3JVX2o6aUwJzhsOgBKIQYZiAD0HOnRXyyzeRqzCnlsZ45g/a
	NKSi22SN0kqiEbeNUf5u1KNU2Lb8CWR9dLwI7PnjTpIeEJl/JGdBo1PH
X-Gm-Gg: AYBFou2A1kLq7yO4qfRil6MB+70fAQMXF2ih159xI1uMtD5wn3XjH0xxpR4GT6xeE2s
	vL2oUrGLPA1wm7YcihN9+u7FRVAfsqASs9F47dWzRSNnOdRT1SrDRCKvH9Iq6avvl+c0zMXTXlf
	kWI9wJOxOV9pn2mNrC9HyNAo2z1/kdc6uCsKLq0jaexnJmX4lk6gd4xoxLYPoVKJuyLbiZrkqwo
	4zA7AyeFPH2/yWvQY6IMowNkEoPZMNd2Ss2RLFvhQpyGCw1Jw5dY9PvBaFfbwRLj6PCseCF6NLf
	Ef2loKZp/4WHqONUovdSJZIWMcRzut2TO32geAJzhBFRzWA6tqwRk0DlIqk18LBf3wp4RoDxclk
	R+D6GSz3UAUPM2sGQG/R8DYPBXu4Xp5pkOtNiAo2ircQLrHEEA6px1TZO0/QJ1l3OP12YatdRee
	4rL2Yk8BghHSLRQ2yMG5ygVeJLjIHV+RQy+vyswIJ4QgfUy0MROPPAlrz39bjKpUNEngXSQspct
	V6BmQ==
X-Received: by 2002:a05:600c:620c:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a027583fb0mr131735445e9.20.1791108344053;
        Sun, 04 Oct 2026 03:05:44 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm215687755e9.6.2026.10.04.03.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:05:43 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: clear force_link_train flag when link training succeeds
Date: Sun,  4 Oct 2026 12:04:59 +0200
Message-ID: <179110829900.3315.15040287408420454805@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8b45dfc1-5350-4a63-9213-a1160478683d@oss.qualcomm.com>
References: <8b45dfc1-5350-4a63-9213-a1160478683d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026, Saurabh Anand wrote:
> Yes, agreed. I will update it in the next version.

Any updates?

This is not limited to Type-C. On a Lenovo Yoga Slim 7x Gen 11 (Glymur)
the eDP panel sometimes stays dark at boot without this patch, since
msm_dp_display_prepare_link() is shared with eDP. The only training
error in the log is the forced second retrain:

[    1.839032] [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #2 on phy 0 failed. ret=-110
[    1.839043] [drm:msm_dp_ctrl_setup_main_link] *ERROR* link training on sink failed. ret=-110

msm_dp_ctrl_on_link() succeeded just before, but the retrain from
msm_dp_ctrl_prepare_stream_on() is not retried and its return value is
ignored, so the link is left untrained. I'll test v2 when it is out.

Oleg
