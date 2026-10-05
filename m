Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321D47252F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196054; cv=none; b=nOfNJOMk50TDz9fGN+AJaLdGNHtolH5y/E8fcmrLg6iA2ukpttwEbN1V8Zw7nMmdcQEVdLqK88AlBnLfBLxF3W+rIJetUqFOvTDpsK+kYugDCn9/lGLb/tHlbB8IVguEr+vPT4NJqVBdoEmz4dXHWjM8c4/tWLeuAXC6xELQVcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196054; c=relaxed/simple;
	bh=eNfnq2Z1m9vATI6IEOIp7uCuLn4LfwsvxoZBIRYjBQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8w8ELrG75q0sswjNwxeNYVNahNiWhhdyjg07wKzM+SDUgVlIP3aygTqlt6ex7cFNxjH6rETvkm04T4TDeN2ELdTC3BzHlIu0yVER36E8zfeLUcQcGhDaw5i3keC3a8JEi2POqjKlCEPuYv5wWwwrIO4LQ7dc5ylKhH1+FEd1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlE/JhDT; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlE/JhDT"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so6031715ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196053; x=1791800853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCy7OWUxx6rxFKNFyknNAcEUj9iw0sI9ldfF6jwCKZc=;
        b=XlE/JhDTk6leAjcwhNuiw6q6Z5b8o4RrU9I5HLXYOcZJ7zXeHhBSmiEIsWZfJAnEkm
         k+zkOvesqnd3TCExQHLBAf/8pfBlqK+JFPldMOMnvtdvy5MPx4ojm2pNUu/ewoF2/WoS
         EF2pTZM/GLwCBQphkbwPAwxpwDPC0Euulc7EPElpzzIHwr3Zm5wzPXkb7bvwidrSyjD2
         R1niZC/2us3c9raeq0v8hAA03ceawUtxsykniypSYNGwAEpl8ljL0rtjbEQ2qH05Yg4S
         b2A9gta4GpTXTi5UKimrTBAm2OOne/MkknwkA9LmDKpknRC3ssJ7HZbEfZZDxUg18HhB
         ti0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196053; x=1791800853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCy7OWUxx6rxFKNFyknNAcEUj9iw0sI9ldfF6jwCKZc=;
        b=1Kw3diVl39XbhUr+KrHsF9STIw6Cry3GLBSu8DEvI4EI5/SQm+eDxr0EkdcsiMG5bv
         NebwpaSlHS1RMDZiDtO4x2xIFbNzwn96QhDw9U1RCPzmVrsLZsseMIrD0TYCk8GKHxbo
         nx2CeOdgk1xFtiD65/T6eCopSrl1Rhck2vXFxjarG7NtE98eay8LXSJPcIt/awT75SVA
         WCVmLF7bSuhmgaaB3FGy1Z7vATGNXJzz63buGl1SWE5BjrewvKZFor9PBY/dGfdXdj6d
         TFqUb/SCQ5V8gxOUMmnwQMjlm7HlAbQYHTvC4P9VECcVMlIWN5RjrVbyqTK/2k5rhVvF
         iGKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwncPWj3tOn8aOZG0Edt1wtqqFRQsnC30sujwO3HA1Nq2SeuMS0agcwmB6StHUXbSkBKBZLp1uHc3XQHjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyHRNtpljlopP7+BmYvheUA/laUFSG2/vn5ydhAZtWLOKijbsE
	8g8LeQkLqdbB8R2d5WyWK5JyyQc3QGwS9LeIGSwcrntOzGJ2vSxitWWv
X-Gm-Gg: AYBFou0MKrDnAAcKAuA+XrR2kf/TCHG/KOi4cUFreiEawIgeyH6Kf1XUWvjV6KZmVqm
	/65aYmxy6BkqFfaAkVT1aIwIdVi6R7a8dGM4gKe/kaapETI/qsEBU22SV1E5Na98IcDPx/UYwBp
	BQVZ0Gf64JCzGlgR6DXj39D2hCrOY1ltOAWr/i0X5DdhTBOlKGTQ4iqmJ6RgkfE7mQ3w9QLnd/E
	IzxVHnTSHP4VhrQlFJZyPoilAaxqKjymRnbGbNptux+Vth2GXegEEsRxTVhqX5vXfvgr6Bdn9Je
	9KIDiP+VFd9jYy9DJ04bpXC3mOcwSHsqtES8OdbCsIWaRFhTUR1ksNYeZuljg4GEMtBS7MRr0Yi
	k2S0vlGoXM1/FriI601BS6jsaJZLvquvoXK5zahLVWmZ+CeZiWy5k/kkylQJ9k61rqowElZ9piM
	KS2C9OuSLbyNOzK9xUsMxbaTuuuNezmi/mZocT0ez4Uh+pdiqi/jyqhjNKVcwj9LMhIt/zocR5J
	AT6rodySsnqwganD17KblER6HRWcthX5MTn/rA5a3qeEsCpppHaYWXPGP0B
X-Received: by 2002:a17:903:1663:b0:2e4:b6b5:b305 with SMTP id d9443c01a7336-2e4b6b5bfd2mr56716435ad.2.1791196052595;
        Mon, 05 Oct 2026 03:27:32 -0700 (PDT)
Received: from localhost.localdomain ([211.213.99.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae525sm5159935ad.19.2026.10.05.03.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:27:32 -0700 (PDT)
From: Hyeontaek Lim <jennystr233@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+d164947c037324221043@syzkaller.appspotmail.com
Subject: Re: [PATCH] kobject_uevent: fix OOB read in kobject_action_type()
Date: Mon,  5 Oct 2026 19:26:57 +0900
Message-ID: <20261005102657.67522-1-jennystr233@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026092806-life-amazingly-e68d@gregkh>
References: <2026092806-life-amazingly-e68d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You're right -- I see now that this was already fixed by commit
d516455c9405 ("kobject: fix out-of-bounds read in
kobject_action_type()") from Jiacheng Xu, merged on Sep 24

Please disregard my patch -- it's a duplicate. I should have checked
linux-next and the existing lore threads before sending; 
I'm new to this and will be more careful next time. Sorry for the noise.

Thanks,
Hyeontaek Lim
