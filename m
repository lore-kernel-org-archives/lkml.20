Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BB35E1A4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818573; cv=none; b=c2eW350g8Z8yLwJEGF6BoUTcPhdU60H84D/kfFJ2ytsc9C0aRoc0/63sASMpF74DARkep8/OPnj2zX0i28ux0utvINuvrsPajDVMEN9xGrSit9hhN5comWngtSeJGUFevi8hPLAGxxSKaQY+lZFhTTHJNdCQj8fwFZO64uLT6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818573; c=relaxed/simple;
	bh=iLdqu+Ue4IoF3oJ7laKVZUnu6AmDbLf/d6lZ2bT8QRc=;
	h=Date:Message-ID:From:To:Cc:Subject; b=XBuo44IG/jmjKwzmKL1KaR2r0dZ/tm++Xje0U/1aR4l73A6ciEsao5hWDxs2Tj5l0xTnNIUHpBfsLmbdg8ylMg4YKQ1czORhI4rbQu58oSTr8TfuafENsA4a3S5Lq+XWgsPJxlDRnAh3mZt2CzhS6f/f8Pi+broR/YvfbNBO5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eKAgWwx3; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eKAgWwx3"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5a837375so231368285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790818571; x=1791423371; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9UI6oGE1TK11TaDQg6HshpZ2UDiz++aB74YJjIRaBc=;
        b=eKAgWwx3Qi6hcF5thFFlJotvOsg+HGGN5NbvW9Bku6m1s42EK2Srhkcc1pAHlaODOq
         IARjLEsnSthRNjbm0AJmGbR2sENvVG+hR+PpdHCXcQRCMJDqNBhsgwdi0ur+gyaDHj+n
         giATvyZRog97naYQ330JOupRbIFbjO9+A0/+b5d6fl/leir/fAF+I3QRg8bha+bjim4M
         IoZp0TRWKhjGrCFsHllyxHHf24o7pP+YpZoONY5VdGeL/sgYUJsxniIeU2MOaBeffGef
         isCpwZ7bLG0Ru8pCZSLN8DXFtT588KvjfjkRGvAKXEbuC7ugs4VetQ0BJAMHVI23DKIq
         0RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818571; x=1791423371;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9UI6oGE1TK11TaDQg6HshpZ2UDiz++aB74YJjIRaBc=;
        b=gKOPr6hJFr4GgxpnLJCHeOAPPRtyLJWzBDv0DQmauU7WAVJFoR0w61g7makU220jow
         1Vn8eLyY+7wvWOR32QeZM8JhY/FYdUZbMDlHUQKk144Sb0D25yqp/1j/1V5GkpRdZd0Z
         G2wiJEQvXvQ68avYD9T3GZNYf/Jzv6MO8Ybjvfw7LcpzP0LqbW3gnYuA6KGyZyKJ2jiZ
         Y//3vp0QsSafLeo83UnlS+e35jJij00W/FmEJxmKTDMnjupsP3XoDc6XlAW7s43Uph+P
         4zMMAvkz5wNp0tpJqo/3UzMKC6qkXFlFAnUjiZxXp3d0W+enDMJTHM87a1BQFQuXvpxE
         8aSA==
X-Forwarded-Encrypted: i=1; AKwUvBwMRx5il17AQMX+ohKbh0ksCtLeUNg+koUQkh236wIfma984tZ7rEhqvqJoUS021UfcvUxT4fZTJAej4Vo=@vger.kernel.org
X-Gm-Message-State: AFuF++kAsodTWLMRep7tB9yR7zVgGmqOsGRf9loW7/fUWyMUb2/WQepZ
	NpEe3XySK0HPEhJJ6sVkLSK6dq2IAdUsjTQIECeSgQ7T7lwvF8TB3P6eTV9d7cbRFw==
X-Gm-Gg: AYBFou0G/YCEWfUwEPY2beNsHmV7K9UKCSMug8OPlH+EJTHG51aU+nauIhByXk6bGQs
	xEfwS06ZkqB7CvQmHlEx6luClaqgU/aXZionImQZfPC8JKvw8artdZTM39TJoWJOyJ9xpqrKMa8
	QJZJP+zfJdHdDkZ8TfirSn25ugTSdGBMkQUhL9+e6HkUOZ7bSqLzxwX6YHEmi6mlNJp+EgsRNZ6
	t3MqYel8szi81EV8ArTlYUB2PTq8Wc296XVvYUSGQKQ/Xd0XQClrX5kRNMoAT9kVv3wEwoQqZ+Z
	kZPf/OoAIvScMRX6+xjf9am/GsouC7KZ0+xgeAZYOBsukB02Uv9NfvMbqi1/XYEsWqu8QcVjiMb
	L7r4+u76dv2fMpwkpp17yMruwBabzLBpcjHqzPX0zrSWCJZFTYqI3NeWvhIuqCsW3XjLP4T6X1a
	JkKsazXT8LgMB2SXL/wNnrc1Eitz0g2CaxoV5mlbpR88X+uzgtMTQfMXkbfh9Bd6EKOe3SnQEcm
	imOkAraYty36wH1FRF+ATkaaSK8fX9f160n+sD9MazcfezDaGAn4fflai5iCphJYMF6OcOhh64=
X-Received: by 2002:a05:620a:2806:b0:939:fb9b:2b4b with SMTP id af79cd13be357-93cb563af87mr286730985a.5.1790818570844;
        Wed, 30 Sep 2026 18:36:10 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cb64eb59esm101530885a.22.2026.09.30.18.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:36:10 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:36:09 -0400
Message-ID: <ff3a2b285345da0c7aaece963e136aa9@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] audit/audit-pr-20260930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

A single audit fix for Linux v7.3-rcX to fix a potential UAF error
in some audit filter configurations.

Paul

--
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
    tags/audit-pr-20260930

for you to fetch changes up to aa650d87a498844060eecb1d336f4d46f4d1b0b3:

  audit: fix exe mark UAF in kill_rules() (2026-09-25 16:18:51 -0400)

----------------------------------------------------------------
audit/stable-7.3 PR 20260930
----------------------------------------------------------------

Jérémy Jean (1):
      audit: fix exe mark UAF in kill_rules()

 kernel/audit_tree.c |   36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

--
paul-moore.com
