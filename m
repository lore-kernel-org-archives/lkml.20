Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E960F2264A3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042109; cv=none; b=QhfICnqqk+A600gAIg3gpp7Ykg+Zkj+niwnWptLK8gYxvtoVGtzrf1L9fmmgI03A4/yoYoSOIxKcDAKoslmX8UXnJsp+bajhUpmLgTEXRXUxMIK7sDJk8w3Uk9rSLw/zAK/qoqiG7GWXxMTsTlC9kjD/wyXMwYggxqx7SE/8z7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042109; c=relaxed/simple;
	bh=kmwinMqyVyK6F6efS9rTUE8kNEppKMqQ9v6+PhIJL9E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=P71q/w7ezL4XUulSG52z5rA1JVg75eOJnjGZMIsGFyWIeZQLcxI8t5KTghtxDCyQnNxH0qzicm7Rd9wa5lubgP1DZcAzxSET/UvEKsOtWrEImpAGLDPzLrE1KmkVSHC/P9AI+/1APaiQArQEQgMfHyu8t1Romco/O/dhs+l7VWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj3GvVhg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj3GvVhg"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6188so23737915ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042107; x=1790646907; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4jCTOSbAnex1HQAgqcYLzBLa9FVcPlYvAMPVHtej0s=;
        b=hj3GvVhg/r5zNBEVjeKBfncOFFaxtRWc/vBhSqZPzpcp1+NmUS6mC6XDOuS1beSbDK
         vUIvg7IflcCoaDv2jZuB5abd2c5lKNWvW+d4kxdvlsjyocjSkgLFiVRoWQ9sPWdN0sAr
         O+awGKH8ciRwq/kkBvLwX5So/5XKW0BB0klxsj2av0lXbIfRrAzTZ35TnX/ElzpkofXh
         ZWJ/wv9pGOp8ZR/z9oGVMTBjbApTGm+lqJYG7Hd+nR+1YyUK1Q+Xe00No6MzTWBczRhw
         YCScICpqiJciEsk4vwDv5Zap/t44AwNwBmRB11pdaG+fDLEBjYsrz0FR1JORtXB0/R76
         IxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042107; x=1790646907;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4jCTOSbAnex1HQAgqcYLzBLa9FVcPlYvAMPVHtej0s=;
        b=orqDl//7/A2uv4UtxmjqA4/ha2gaYonjgp57EliMnqVEevBxAixHxX7LIkfpjJbN8Y
         yGmwMIEFlMsOfiaTziwgAFRertFrhgvmGdnJDYTru1F7D5vulUx5FUssNoAdeEWIN+mB
         wJ+PhUcx8z9jYtCMZ23wysOGGZOux5+vBgXQ2TsCOQzny0nhJ0Xw1rXcHW5GznF8Is52
         X5AATBSMBINaV/WVmMQzQTMeTCp04MgE5KUOxs6WqQEiqgihwfOzrT4xHXbM5/QU0joJ
         ouokidCX2F0SqdJyeCS1UiriWzUw58YCKqm3Kx2g81wdP5KPeYe6/b97u60Svq0syWvH
         aRjg==
X-Forwarded-Encrypted: i=1; AKwUvByudnsvkM3lagFiVFp1UJK62/5eZpdJCeSTypvkXsmYF+jGcGJkFRpYiwzd7vZBuZnDOx4kglh+1d8R2xg=@vger.kernel.org
X-Gm-Message-State: AFuF++lxm/lqSax2fGodP/TgkqH+iMmC/TWyaSsEpt30NnRp7OQ/Oflw
	uTHlB9A7Ni92yfqkhgqJVDcz36exyZFKCY5ClW3BGU1cbep0NHN+VACYXuakUA==
X-Gm-Gg: AYBFou34cTHE0v2hZh1nC0/Xh2xmh0wQbA2QgNl+0ghS+3xyL+v4gloKxiW3JRS/QXB
	hR8UMK2psRRi3lHgSii5ZaCLtGgWSeByfKz6tRvCSOKQW82PHfhrtNF6AUKBMSTNJ2OlA8dk0dk
	9dicwvM3SumHPywNUjK4TEUDRs9vToYCeK32ZLzDKJnLPrvQitAoJUz0wQSfhxYHyNjZotyk51V
	AsWUGe6bc17fk9j5oIJoVk5OsANPyevpymnrHjM23C5GefYsY+iX6ZW2q/0TlOsaDzHtnJIbTox
	nV4+99uIKF01pYnsDJqvDm5Yg2obETl84I7jWDD6Cv7ngmZGayLA73ZJZ0LU/KQPoiJMOFyMhiX
	Jeqwoj6HvLNkN+WCRCepLpBaAri1l8BhTyraVOJPNZGTDUXMN8gXEw3v3Ju3CDrbcOXP2MTesP8
	WV9qKQIbHlkRwkCX7a4v6DdRPBurHM1Twfl0iJBxZE2zuAfAFpWNk1uBSbYkuFYssmNHyNLJ6jR
	xMKaIY5TyCqsqkErRBjjOBkMh8wjC7keOz4Scb1EIbVA4/tKGZmKZ3tYd5G4Ghwv7aHqxVhsqqs
	2xt+u9LBx4JMOQ==
X-Received: by 2002:a17:902:c94d:b0:2dd:c100:424a with SMTP id d9443c01a7336-2ddc100453amr120434615ad.46.1790042107183;
        Mon, 21 Sep 2026 18:55:07 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d066d3asm1193085ad.78.2026.09.21.18.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 18:55:06 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 01:55:06 +0000
Message-Id: <DLLGYV7DI406.JRNDNAZ4S29I@gmail.com>
Cc: "Amery Hung" <ameryhung@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Nicholas Carlini" <npc@anthropic.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH bpf-next v1 0/6] bpf: Scope callback arguments to their
 frame
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20260922010333.1226537-1-ihor.solodrai@linux.dev>
References: <20260922010333.1226537-1-ihor.solodrai@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 06:03 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:

> Neither has a local fix: both arguments point into a helper's own
> frame, with nothing longer-lived to anchor them to.

It's the same problem as a pointer to callee's stack.
check_stack_write_fixed_off() deals with it like this:
  if (state != cur && reg->type == PTR_TO_STACK) {
          verbose(env, "cannot spill pointers to stack into stack frame of the caller\n");
          return -EINVAL;
  }
CONST_PTR_TO_DYNPTR wasn't spillable before 7.3, so nothing depends
on parking it in the caller's frame. Reject it there too ?
and then no need for REF_TYPE_FRAME complexity?

