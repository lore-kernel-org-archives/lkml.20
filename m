Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FDA43E06B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826540; cv=none; b=unb4Vahkg8hmOdXpUce5Aj4NMpa6U2geucGK5YR0Y92KOM2TX0r1laXk+vWji5FK5qpWV8x4yQUljK4SGw9XpannoPbOSowdUcvX2lSPi9IQnUGunQz4cMqAZtFxCo+0WlqMsKKjm5xv2gfwtPvFrBUUUO0Z4v/8BqrO0j2/YAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826540; c=relaxed/simple;
	bh=cnZCmRpqAqEOWEgQ1ue8oKzm6+iLdIFaaz2cMdzlopQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5AwuZmub3DSh+n5QFp5R9pd4+38tb5EBZey2tdf87UlDH7Zcjk6r23N+G/Is2WCdgC+Rbuuwil9BPDvDPboBnVaYAb5D4h3v7TeoYnGWNP9fSG5EF5J9Ez2Ip9X92kEBC5rhHGcPeSqzS36Rq+TtoYPglLzxJqhlxZQnuyYDHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPAEx1bQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPAEx1bQ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38f620399a0so1452395a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787826527; x=1788431327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptruR1AcBwxfHwWoiQ4jX61oJnM3pifrJ+nJdGn6vn4=;
        b=IPAEx1bQry2AlAX2mC9XJG/+T07VNZ/k8yXnEqMekrpmKApYsBCo2P5Mu2zP0tDp/t
         G8bQEw3j+UPOktJBuR47udztEhrxIK6Wo/ZUb31YjfCFiAjEIc+Bb1IvNXljtvA7tD+Q
         HsWcmuGnAiufu9aXxQMuTc+QLf/pvKdm0uw3GHPr/UFx+XJATRpXQSx/OiZ3ey9S1+ZC
         jKGG9HQ1kyi1MR87hY5TLAa6IWEwzE7ZqQ52n4J+tDVY2S8OPtOuzeUMyKj6cqX+Uzml
         14VnQZ9jjNNrAchIHiEicRGOP7c40ZOkH6/JNhBRQfp+oyoQcexXfrQSflafg06m0YWL
         2aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826527; x=1788431327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ptruR1AcBwxfHwWoiQ4jX61oJnM3pifrJ+nJdGn6vn4=;
        b=mAMeRsFZ/WlL6Uj+vZoKJHN4lVaCbhk0oK1QQ65jXdkoJnm8bsnhF3NVwgU0xiIc1h
         fstddI0jNvoy1wkuzcHO1vYGdU146lK8z5eg7k4S5KYnOFZyH8ra5MTUtAaBMjwm7GMW
         yhqw3bnBYYNS+e4Y9eWEveYJgTv57RmJUbhwIQdR+ajtHZO4MMIjFkjcKBUNAvT5gbm9
         dpiBgj4pz2AKp2TcZomOdwHEARnL5haHjwSSVEr6ZA7fdAVsJSFKH6PzUC+6pIhzFPpN
         oJ5d1Ed7b27t5iuj2ph7WaQSMUMyRC6GpmcaPSFKjSBOS0W5cKk/zCO8Iv63SSKOo6wS
         c+2g==
X-Gm-Message-State: AFuF++nmIK1k2KFNubhZfm/pYCHiyfNiW2S3hbrRguv64x71BdQ3aRLE
	uKwbX2ACy1g57ByyKNxPT52pRfY2TIx2R7XBp6ghhkmFcjqVTTv82LP1
X-Gm-Gg: AR+sD10eQPe8LtUb1vtz2wPsYjrxXoe2KndhC7gnePWFqjjfmxvxiZBssF8stk64nKh
	udawbdZ894lO3bn4Z4oijnkwmC8t0REyhGbujjUnVxf2zymXg8ZxdGk75xT+EaHM6cqjKnPGGIe
	Dxae8wHKQZrYhemzP+uzZEc9bpjdb/r7Jnx3EB7T4pmt59Njb/xs5EPJMsWqD+Gz7d9/1YbFcW1
	tOh5MRXmvEniSZ6oeC95txVQ8e7G4uBPayoblYO6P/uyROL99UfmlnAOqE2fCv4evI1bqsQZTN9
	jykOMkHP71nnj9IPon2fHRBtlvrf2fe07m92I4dIMLqzrQaxxQ74cbCoTDcS8jXxSBQTxvXqMCl
	qBsVC6pe1itzOwqje0xq7R746aJUJwXFc6p/Wej6kacsh96nKXPgjPWFxmtGfu3Pn/XsN1G9DIT
	xWHOMgkbm+VRRTnc8ylQmwk1fm8a/Y/AwwcZ3ibGjCu3A+QSuWrQmF7KBgeIbzabwgmg==
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr28463295a91.16.1787826526788;
        Thu, 27 Aug 2026 03:28:46 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285d1075ddsm5130994eec.29.2026.08.27.03.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:28:46 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer dereference in snd_ctl_led_get
Date: Thu, 27 Aug 2026 15:58:31 +0530
Message-ID: <20260827102831.21012-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a9007b3.1d9ded08.62e62.00cd.GAE@google.com>
References: <6a9007b3.1d9ded08.62e62.00cd.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 818bebeb63dd

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 8cbacee57ce7..f6a46ed97d37 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -114,13 +114,11 @@ static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
        info.id = kctl->id;
        info.id.index += lctl->index_offset;
        info.id.numid += lctl->index_offset;
-       result = kctl->info(kctl, &info);
-       if (result < 0)
+       if (!kctl->info || kctl->info(kctl, &info)
                return -1;
        memset(&value, 0, sizeof(value));
        value.id = info.id;
-       result = kctl->get(kctl, &value);
-       if (result < 0)
+       if (!kctl->get || kctl->get(kctl, &value))
                return -1;
        if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
            info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {

