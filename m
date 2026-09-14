Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072C480DD6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404126; cv=none; b=RiAjao+qrBNI+cFDcCGU/8k3vf5hIHk728KGuJ+As1jc0kOlTPMC+9hUl2mWLd3K4Hy34eUQAH94O//m7RI3tq0i0hlUIRvxi+XQLp9sthGt/JxiIhDgTBXTddB8rUk/yzaiV+BB65NUrx3743R5kfEfNHo8ZPXyxxumU5eLAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404126; c=relaxed/simple;
	bh=H1l4m7LqRJnZ49EJ8tR396A7/0u8ejG0VymqYOqgnNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kypA3ii7DGkVUXMOXVmFwH0ZjyHE9TgykoJpOrgYQcUDFCxBAH+b3B7zGYg6Y7bsvMGi/ulmjFfblWISwCvbeooKmvQXi+EMjvTEVfAh+p/GUFI0v6R0MSsHdzBDFylBq5ZvXWgclxZEDJv1c3dYup+ODUSpL1HZoVKpv4xycBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=D+NfM3JA; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="D+NfM3JA"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ebso1880707d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1789404122; x=1790008922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKDUxsVBgyG13X1UZt4eR7O3fTMlydeoVTGRT2zzuL8=;
        b=D+NfM3JAVMqBdhkFR8uFrouOQbtvmwdEK/BblDsiPeia1MBD3YszhT624dIgi7BTqC
         y7QDTzlbwCgCGfGWwfJrI+lzuhU8ncceuex7O1Ijyz7FnytFq42aAJEE5slbbiDxA9+G
         JmnKvb23qGwpYPlp0DiLII1qkRZChnu5vg7oDVty/cHd1q4MQlFFQdRK26HFVcYZogQY
         AYVVKxZV1ngyBVFK23lTZcNd8Le/UWx1k0/U4heT0aSfqy5JG8oegc131+Vs0uKBa/11
         g+f6Bqy1RTEgMjLsa1em4dfCrKmzTRuJ2f8UzRXMNh99Utc0lJjrjFDHAhMKmMKsT8NP
         6rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404122; x=1790008922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OKDUxsVBgyG13X1UZt4eR7O3fTMlydeoVTGRT2zzuL8=;
        b=o1S+k+rpP+mKQHsofU4utW5wEnWmYmsKWbrZrqHnMQolknzHP9636qBBSplW7V2neR
         L6SqN4V1fLLlbqtmd0xzHEVvxX3UlT0VofhzEA5PUVqnfTmEkGLEl2r9Vrhmpc/rW6N5
         YQXZs476yvRhwjg2yHrtd0txoe7VE7qLLIum8qAuXdJTm65TMGydQ2w2wZAjiFA8Ec5K
         falaxs+T07LYjUnLagz3hLptQQTeduuKUcHkAb9F6rX6ELf58amfKJ3KmrOanMSwdhZQ
         qY7bc8aHtKQFpjZP6mzNqrkZVtFah938OmBxnVWs4jW5+1TPBYQG7ke2WLUOE85byDV6
         MHRg==
X-Forwarded-Encrypted: i=1; AKwUvBwk96Jm9aHTZ+XhCWcVqju61QyU2iS89z1jhfnjfNf/HfX+z1MFhcxK7ryQPHPTiaIOl4fX5bxoauBfmjw=@vger.kernel.org
X-Gm-Message-State: AFuF++mdkQcUAkemh3l196J4h+0un+hh75T6lWpvXd+3ilxwmfh+qTLX
	L4LsiiR0ffBdhmZCNJNrsSCC9jwEvdY+l0acwYmpzhRaWPPN92vd+ADULHntr/mgUy/6
X-Gm-Gg: AYBFou0U/lRzkHstHgkVmWqFol+Ndgp5W8x46Sb5eYlBiirWwg63HUuYIL3VzUUy4lL
	ud9UGyhYKbXIchRTrZvAleztwcnlTsw15V4AFZk8ir1g+cvf0jFsoiX6F5Y6g+2xGvl6WukM3HF
	6PuXbLS9dktUj3NzdveaE9WCnuB5WUJ3QWTi7zitSmKHifvaWxzqstOLCUaw9dFBMZp54I6O5xD
	jAtc5fLpONLM/d/ZvobB1EX/jfw9EdVdgWE9SsaZg/DCdsmdmGsGChwZD2ymSf7N41V+el7ZylC
	6PuF2ZyFYrdsU/Sz0ubvwURmn8B2FXmygeTrvhBOkHIxCBrLSTuWCZ/bYxEnyMlQ+0E9CqF8zsM
	yymkVfc+l+eNEM/qVMxX4ftn/2kGm3p4jW8T7Bjkw6QiFKaz9owePO3OG1t94z/eMZpri7Aev2C
	WP1P2/ZBVkB6HY8h08vTAJbCBo4R7jbeG0diMlkJmmL9MVQmBVR4YdH/8TRV+y
X-Received: by 2002:a05:690e:12c8:b0:66d:132a:875f with SMTP id 956f58d0204a3-6714e088222mr1068042d50.47.1789404120256;
        Mon, 14 Sep 2026 09:42:00 -0700 (PDT)
Received: from [192.168.1.110] ([2600:1700:1ff0:d0ef::d15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df42a8sm4879023d50.8.2026.09.14.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:41:59 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Subject: [PATCH 0/3] keys: Add well known IDs for fs-verity/dm-verity keys
Date: Mon, 14 Sep 2026 11:41:41 -0500
Message-Id: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NSQ6DMBBE0augXqclbIYMV0EsTFyEzmCQjRAIc
 fe0WL7Fr9opIQoSPbKdIhZJMgaFuWT0HFx4gcWryea2zu+mZPce3NcFbOx/i7bzxh+FeIRZekH
 k0tyuXW2LokNFujNF9LKeH017HH+y3YXWcwAAAA==
X-Change-ID: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, fsverity@lists.linux.dev, linux-doc@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.14.3

This more or less follows the bpf keyring approach, allowing userspace
to easily find the keys instead of having to parse /proc/keys.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
Andrew Halaney (3):
      keys: add KEY_SPEC_DM_VERITY_KEYRING
      keys: add KEY_SPEC_FS_VERITY_KEYRING
      Documentation: keys: document IDs added since KEY_SPEC_REQKEY_AUTH_KEY

 Documentation/security/keys/core.rst | 13 ++++++++
 drivers/md/dm-verity-verify-sig.c    |  3 ++
 fs/verity/signature.c                |  2 ++
 include/linux/key.h                  |  2 ++
 include/uapi/linux/keyctl.h          |  2 ++
 security/keys/process_keys.c         | 58 ++++++++++++++++++++++++++++++++++++
 6 files changed, 80 insertions(+)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5

Best regards,
-- 
Andrew Halaney <andrew@amutable.com>

