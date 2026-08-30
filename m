Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452814F70
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788078453; cv=none; b=QrsUw9a7F9AwPYRnMHtnyiEv69Bm1B6pMss/811KsngNDZEqjfl2UkeH01oXR0vlHk+GEVK2qEcwiLQE9lNcVihz7inW1xVZNuWrwTLG66xjr9dYArtKYTHCe7sG4JWZfY6J8AonMKYqC6HUhh7+VerEU4jeO4IgcG1UsgcsntI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788078453; c=relaxed/simple;
	bh=IA+d0A5QcyMe6n8YDpvZW44tVbbxmmPH7u3V+8hzS1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mF0dd2ANchM0j/X8cIIJGGlYzpiyxerdBcRduTHTtiE/1F6sSk2IleCn8dgh+wLdFrVV1E1ju3ipaUUc+7kAdFkJSm9Cfrlh8hAGbqPuNtkNs65rpa774dhvcVRQlcZaoFJI1CGqOqY3ET3y6lVv7eoNYzDOAnODtvumU4nNmxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuR9XT5J; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuR9XT5J"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3553123a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788078451; x=1788683251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IA+d0A5QcyMe6n8YDpvZW44tVbbxmmPH7u3V+8hzS1Q=;
        b=HuR9XT5JYCrvblV3mtMNm9t22F0nIN7XZ8AMROg0aXAwCMemQpHrGvyDdKTeVvzlHq
         CTdRpF+f04zFpXwCosmiQdPH80mC+lbSZVu6I0TjTV/FnoONzYOVZxHO191DKYyYFLvQ
         DhOyKgx6ntQWVNH30ZzCd+dwfVOmKxJ7uF47JpYPTwSLAgxKkUwSv3L/HGydGmouT6hm
         5zaR00Lrd5HcngZPC5+M8Hyi+c57s3ssl9jxhZW7toTUoa7oJ7mzm2sYLIY+EBOWzPJh
         nQmqfSEnIqavOq4hmc8xRdKuClXPv3vQLaLADSyzNzxPJdbxQeuUY8xdmzCoOh4peKqJ
         tj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788078451; x=1788683251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IA+d0A5QcyMe6n8YDpvZW44tVbbxmmPH7u3V+8hzS1Q=;
        b=s11re2Wny0axvZAksEkLljih3XoE6erqUpxDLPNUJi31nJGpe3h+/FeaIjKOyO/VAm
         cZsESAG/wlma8z7wk3oVm7FGHq7r0jXB3JhSTPYFJZkyLk5HSTUty8ja2xUQf0P/GCni
         EEy9k6PIHVcmA2STtb4RXZlzaMB+ITdBt03GJ2HGFC87fCnNzcNmYGQvfS7si3MSf2Yd
         1FRfA60iq0VEql1tBXqYW0MSFfVeFhwPMt+9nBBtVAq3BwEQmNZhBw49jW4Kc/ORjtYf
         ZE27F0C5vnThKknjY0Lep7JqJaKtR8VE62ZEX8wyfuH8nSPIUKlgMH5hoIcR8mpoNRXo
         IKgg==
X-Forwarded-Encrypted: i=1; AKwUvBwHh3CSvx5EvmeOnreDmn8lkLjS6cKoESIEFdyuE3c7HdrIp4jAY6D8h2Fp4+GN04rrHq0yta4sallZANQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lr+XdI0TERUj74mShWn6ahI/aH/KiVqxeVn0T7ZiAf7uxF4s8o
	U4BxvPqKtoAYcsvUvC0nPGmfmum0o/v9aEwS35IrKGN2Nd5Dlp+BdPiR
X-Gm-Gg: AYBFou1DbHeEr9pwqaT4kDkedfjklp5jdPdie+Gl6FTZqeSp51Uh0f0OCmqULPOk/YV
	tRVVDS3GlsPGbCB+q/XVpsYEa3Gqhj9M1leEqlDbVdHLG8EpIHG43DZfbRAvAOmz/AR87EBq1x0
	0XRC2D/vb0Se6wnxQippmNjmjUh+AeeEotx/G9BeTc3SjbA0y+lCZhepoy8vAFPxflczrYVFt0P
	9KMsiTjvgf1kiUDkICSXfGZhf4GA0+izxfJ+BNqiiS9M25pA/+z5AwyIUbeMCc3Q8MZl/ig3z/T
	YwUbZPMZ8MPEwAivYrSAcsU21HNrNLPvvSjIX4b/XXIVJANe1bqKsut+OdAJvJDfjw18ha5vY3Q
	+1k5X8SZi9qMiQrMBPviLSppAhtGxLCxePmBjWy81TA5I7F+NImGumgqXOjhtjU4sHG44bfGEca
	nuW/iiX/RJTVlqaIBiijok30tT9IMVO5Mi2d9AA9Bd0nJlAxUR2lKDIZNW2saIH1k/
X-Received: by 2002:a17:90a:da8b:b0:398:9be5:b41a with SMTP id 98e67ed59e1d1-3989be62ef6mr16592222a91.21.1788078451274;
        Sun, 30 Aug 2026 01:27:31 -0700 (PDT)
Received: from Default ([2409:40f4:101a:c47:80b4:fa67:fe3f:eecf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm36211979c88.14.2026.08.30.01.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:27:30 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Subject: Re: [PATCH v4] Input: atkbd - fix uaf in atkbd_set_repeat_rate
Date: Sun, 30 Aug 2026 13:57:18 +0530
Message-ID: <20260830082718.8375-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830081415.15187-1-jeffinphilip14@gmail.com>
References: <20260830081415.15187-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 30 Aug 2026 13:44:15 +0530, Jeffin Philip wrote:
>Would cleaning up leds cause any weird issues on reconnect?

Correction: Would _NOT_ cleaning up leds cause any weird issues
on reconnect?

Thanks,
Jeffin.

