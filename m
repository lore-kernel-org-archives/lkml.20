Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96F386561
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195854; cv=none; b=PeknpGVn5voA5fT6xcyAJA2qmCe86ymegZbBnJgk5kYY35fwAWEzNXalnTGd/9aE8o7zHeCk+clSiuUvG/lYtuheykx4CCHJcIpUkupWPRwXDKs0lNqPfR2OFNXSbwRrUf9zV1oZg30KZ1zukqHyU4E2divorCWcpvZdxD0JNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195854; c=relaxed/simple;
	bh=0DrTSL6jA3LDjm25WGqvSFl9avhGmUFNtOgrYeyvjB4=;
	h=Date:Message-ID:From:To:Cc:Subject; b=RZdpYlObnUuHf7soMGFtzwD/do+l/u49YzaghLyPd35NmJf+yYJRcGoFpOwcctOserDAzbEty1hTxa8JG8JoIGeT+gMLFDIT+sPRLRb47cGTVxB07Co3FZ6TuWgo3dQ08O3S3XuoQUMxy9c30DQlP7PJzSsGe73A+ccaIalLmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FshnhGi0; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FshnhGi0"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939656ff6d9so158463585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1791195851; x=1791800651; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8BpmcZNfSSdrnLD+HsvRfeM9LDp7n/LzTsg72UO35s=;
        b=FshnhGi0H4TUR1dBLS4m1a8PJEzRDa4f81vNqUFyNshMfe+Vq3cMWVXdu0+59Trezr
         jGTmaSyycB7BZV8pkr9OQDREeUvEKroNDh3vQacnI4W6r4HjmZ5HaUt41K70Bp8jRU3l
         KbrTq6Akvb2HomDu1femABsBA3m9MS6HEgBk3kqT0FrtoE9YTJDUyFB8rZISNEn5FEMO
         DQLbiXqYmhH2eextpLJPW6I+3IEEov5GDUx7+Xd2P+q07x8XjReLJC2CCJYRakymT7YS
         2ajqvpvRY1sbUjt2YgrP+C6Uops6gmy/DKSoyFbpwSDQVo7ZS5XJXlPwSdRtOUfiZfKo
         jyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195851; x=1791800651;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8BpmcZNfSSdrnLD+HsvRfeM9LDp7n/LzTsg72UO35s=;
        b=he1ULrh3xoj6El/HWSNK0I/Fg6BfqavBj68liMFf8jPZvO9tmjBS920fvR07KoHJQ7
         6LEvVT4VecyxZZULIGoxBBdwK27A1E2WqIbE9PCvF14mCXm++UdmRntICiZcN8yVH8zz
         U5YpmFPvJeBN7TvshbSaMM8Gexcpe70KZYEPVBEsJJnPOBA7zq1rD+UtGUermLsgtgat
         HhouexPH+0StceTrIlwmixjNva/CFkhxCiKZcp2DYfK4xQ57w6MGn8H2G2uoewshH2or
         OTJ5fe9Iddg85OIEoEgNQCBYPd7uwN38/D9YLM0yUP2+ZEtKJ2FQ79lZEFinQwoD/s91
         1YXw==
X-Forwarded-Encrypted: i=1; AKwUvBzZVRMV4TvmZeJcbpQVpnfYUxLe/z7bnsrvWdeTZwDywxrNVvZVv1bha+1Xg3/pQzg4BlTUmxJACVdpf8I=@vger.kernel.org
X-Gm-Message-State: AFuF++kplUUaeKjkNCvTjBbYd+1ElSsqpxd21AJVwfm2FXg8v5WCRENh
	nYquwuDyTbR457oAHgYwS3caziF6kBVEqy2v0mn2vOekVGlPUTqi6hnTe1CDNnoTxxxAknmfO6Y
	BBvJL7DT+
X-Gm-Gg: AYBFou1ZhospglEUcFyiuzHv23vzSYtmmmi/K5IPDO7ncg/A9DX/7NJdyk8l9y2qDS1
	32DefdtW0hdbOoWVBYUcV9pam3kOAltMILKo8RSAkC+KpY6sGBzAKgvWE0slDBnRQIkCgRJyKYU
	vIJWiPviXeeY/081Pi2jWOTKeSlA08MIyK6Pw9JQqdW9pxzYSqCO0oTBk4dBvOxCI8gPM8N8RQu
	77xpg3i0qL6rN35AR0Xo6E1sDgEuTMWDHRKOQdT7LCk6zUyV5k4NZdteyi2cvBr1ZfrZTDixttR
	Zz2gR4inbE8rnLPoFq55R7To5lwXvg4+VnWMhxxWMH8jAQyVto4berKUpB0TPRE+pcu3tkcDZq7
	NTmnPgA9XUyeKvhsc+ZW1w+kdNccyBiahWQKfZ4OvY/qrUu6TL8isZvTopPCVj+iz1MJBNUCOtF
	QUZNpMt17Ru3prtXQwQeCFDem5VuFNPdHFqiijKdE+bVuPQAdhwt7mOahiWOz5eLC1YRjW+5aM2
	ppw2/t46TV5eeUgjjhclFcBxrtAVA0Z4r42Uk7Ak2DBJxMsqYelIkbpm5O5kZ2g78dWiF/7M5zk
	Bm/bOwNZOA==
X-Received: by 2002:a05:620a:470d:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93e5eafe197mr913474485a.62.1791195850675;
        Mon, 05 Oct 2026 03:24:10 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b19424sm84480306d6.15.2026.10.05.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:24:09 -0700 (PDT)
Date: Mon, 05 Oct 2026 06:24:05 -0400
Message-ID: <32b99c092d7a668f114cecb3ecb22c28@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] selinux/selinux-pr-20261005
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

Two SELinux patches for the next Linux v7.3-rcX release:

- Preserve SECURITY_LSM_NATIVE_LABELS when reusing superblocks

Similar to a previous fix (see the commit description of Stephen's fix)
we need to check to see if we have already mounted/setup the superblock
passed into the security_sb_set_mnt_opts() LSM hook so we don't mistakenly
unset SECURITY_LSM_NATIVE_LABELS.

- Fix a potential AVC sequence number data race

Thanks,
Paul

--
The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
    tags/selinux-pr-20261005

for you to fetch changes up to 28b7260548af3d35773477993ad4e4de41578dd7:

  selinux: preserve NATIVE_LABELS on already-initialized sb in set_mnt_opts
    (2026-09-30 15:10:41 -0400)

----------------------------------------------------------------
selinux/stable-7.3 PR 20261005
----------------------------------------------------------------

Christian Göttsche (1):
      selinux: fix data race on AVC latest_notif

Stephen Smalley (1):
      selinux: preserve NATIVE_LABELS on already-initialized sb in
         set_mnt_opts

 security/selinux/avc.c   |    5 +++--
 security/selinux/hooks.c |    9 ++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

--
paul-moore.com
