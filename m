Received: from mail-qk2-f36.google.com (mail-qk2-f36.google.com [74.125.230.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66828505E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790488956; cv=none; b=Xz4bPlVGTW8gh8YWb3EZbP18jgzgWXKWjH+KkW3JJeO0xCXIQDKAhQAiP3a5sf/IWhyQf62qVAUivnNpKDcLZl3jjLgdSXpboDjw28WSankApP48Gxsh9MSHTUDRt8iWvhmHhF/DU1NRN7MOpcyvbqpeiw8OhwFkZvRdRdPFgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790488956; c=relaxed/simple;
	bh=1jCjtYoS8P7He0eHB/co+eUvc5U6jhinCxysS9BksKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=CVAG+cODNVZ5N3SQXIHZ0GC+LM01Njd0LWJcTzKEJb6g8rbcPZPvv0PjkeT+6o/YQlDIgnWqWVsr0REsb12E7H5pfOui27rUGy+GPe8ncey+C2NbvhRfqqD1G6zsuSZhcJXbcfxzoiXbXh5SI0LF/i73QNapSqBEz4vC9eCknNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3vS2Wfv; arc=none smtp.client-ip=74.125.230.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3vS2Wfv"
Received: by mail-qk2-f36.google.com with SMTP id d75a77b69052e-533264052d0so7962201cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790488954; x=1791093754; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jCjtYoS8P7He0eHB/co+eUvc5U6jhinCxysS9BksKw=;
        b=Y3vS2WfvA+l+q781tyXHMb4Mq24JNxDkFriCO7oGUQrSpwuvCK8oNbj+29bV9C+Htx
         z7ze8JW9+WlOa2VB9vB0epTu5Qf/B6HlVU+UAO8b1B7d2w2z7r9qC5FrZ8HCH4j5ubGg
         +aaYRxJYRqnJNfPRFr7KmwDlIvgjk/kegIaR/0acgWuPrOgw3tTA6pzeK+I65jN1LG34
         d/3drkR2OPvq+DmYFG/jc9uyMtuXZJV7/oJ76v+RxzNcticqlBEPkV9kJ4k8C/9XdmcR
         lQ6gPjBNandaValARMi+4cFEf5iOc3gKxSxb+Vug3fAbv2j8pe7opRUPzyyqvpmYwmY4
         tXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790488954; x=1791093754;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1jCjtYoS8P7He0eHB/co+eUvc5U6jhinCxysS9BksKw=;
        b=Y0n+6hAqsdUEuTRwGHQqbRENo8tV2JM/uwpFEUSmhDbnxVALFZWN92ZnLzTTJwxeRG
         c/csLBvTPby66BNWVOMnHsyvuc0191tIl/Z/ePBE6zhoog1z8pG+Ok32nDpH06QfNxk1
         sSwp861eKNa65pF2BsdePLQ/AnSQ4nBlHfvFijJuBtQTPY8c0UtDVpmccxG0dLBYx6eI
         wPSgQNu8gEbzpNAoEK/ufTKnRHJ2Z0iIWiCrtFOcJoMP9aMlzv/fd0LdQCza9LEtpR/t
         QLu7jWEkt5M/aHbqip1hDLAyEdaPaUvLgRvgxQOGZ/d6meuH8XyWV+D3QDx40pmhX4QK
         WCdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNmDfNaSF28NqLNEU66E4rj7m0kcXt3lP6R9goCA6sgGiau0YSWzjp9v1cVv6/iAwepOk0IMocXxVQAOw=@vger.kernel.org
X-Gm-Message-State: AFuF++n0XTvobEvyxTWuRZ5CueWxItmQB2OxA8EHf7g1zrbvfeGSb/aI
	A1Ck8vIMYzaisQpqdRgxal5GvgOZ1DD/AR4TGVf4NI1WYGBYXrxOUplT
X-Gm-Gg: AYBFou21oyIrXgvUQQNEEoMAaRHWDkvcNH2PF/vsV9DgsyZ6sA+HIW1qdlCI1tfYcGF
	qqkhXhXSaxLltPF1dZ4uBDzmlJPH9EaLJkz705UaGKyr8Y9b3yF7UvTXqYgOJdLodnkMsxkVk9A
	YcRgDULYlNMoovdoXjJDPVddBpI0jFqBMc+OxSt9GhApS6C/LQsErSqwlakb1rcOWu0WeOmm3O/
	dVDQwTd8GXgSxebBt+Z5xtMJprNQNdAhoSDv53DCUWszJk6O6spWJgdF1fo8vmnpOlCpj39sgT7
	Bs5dtHfMaoowyHsaqvPn4MvGvtQGW/1KZAKyngkXetfJiSkxOyzSfyHtAY5CrV/6MQOYGCN0WzV
	c11RkN5ZULozFIX8j9ZZhtVyZ8ewtkKKl6ebrkJkThGEGMqSjc4bLLib6xpXGLJlArHc1KHwjME
	ZGbAHURDel9+ytU3UD4sD4KIwkEMO37mi6R12QfJt+P/wIR3Yzwn0eOhEkU5Ytn03MD200Ukjup
	qMNblY3BVli/GYM/61j9Wfor/Ft
X-Received: by 2002:a05:622a:13c8:b0:530:e52a:8ef1 with SMTP id d75a77b69052e-5330b5dff3dmr142397731cf.26.1790488953719;
        Sat, 26 Sep 2026 23:02:33 -0700 (PDT)
Received: from daniel-desktop3.localnet ([204.48.76.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332238c585sm34613801cf.20.2026.09.26.23.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:02:31 -0700 (PDT)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>,
 Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Gabriel Krisman Bertazi <krisman@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, smcv@collabora.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Subject: [BUG] Is casefold unreported in /proc/mounts?
Date: Sun, 27 Sep 2026 02:02:29 -0400
Message-ID: <5193732.31r3eYUQgx@daniel-desktop3>
In-Reply-To: <20241021-tonyk-tmpfs-v8-6-f443d5814194@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Upon successfully mounting via `sudo mount -t tmpfs -o casefold test /mnt`, I
cannot find a read-only way to determine whether this option is enabled.
`mount`, `cat /proc/mounts`, and `cat /proc/mountinfo` only display "rw",
"relatime", and "inode64", never "casefold" for both with and without
`-o casefold`. The only way on 7.0.0-34-generic to test I found is
`mkdir test ; chattr +F test ; echo $?`, but that isn't atomic. Which command
can determine, without writing anything, whether someone or some program
specified `-o casefold`? If absent, I suggest adding the missing info to
`/proc/mounts`, likely `mm/shmem.c:shmem_show_options`.

Link: https://lore.kernel.org/r/20241021-tonyk-tmpfs-v8-6-f443d5814194@igalia.com


