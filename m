Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985620;
	b=4ePnKfJ8KLN/2mJH6xLMBGFQCCqndP5UNSDGwzueo7D9cl7uxXkppB2R0vTEMjnQe+CP
	 hSoVVm/rKsUJowmHirqBPLbxIS+ja1L24sj/1pBg2DZIuDz4ls4FvtAwAnjc+PvkQUryJ
	 7vodHxCJuenoZw0eJVA352xeHY8ch6uSSn+1qMqgbDzTccrluuDuA5hGoG/8lnvyzGr6e
	 qw8EQd0SHH3XVYims/VhBhxg8YKkPYF+kw4IjcFuerPJAUv2NT68WQ1Lri6+6/yLeaB1K
	 r9qXU7F28SOTqtcU+b9THawd9GlDe0HoGMVLevJ176hQIZpKjNvcDeyBWb9b+KUwokg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vDe53dt4rJuBDqVFYRKRy0bDGsLtr15VB9Eg8wIwBs0=;
	b=Ixn0SjKjHZLrGxhRizo+lCweiTzdBaBvOMYNTh6eOqwSW9TGp79FedMu0XFgy3Y2cNhR
	 NPvvnrkn5xwI2qSBbOW84tB1rUZ7VZDxaGTKjZxdbZqlxveQqy4e0mq5SSszNix4g14+r
	 Ev/BH9FJBB1omvelnA34ORjKGALK0UqxQn8QYdh5GJmYHazzGambjUEE4x2eaS4qE87pd
	 buiNAx5CLI5AZuX/asb/Mjnxr8Fu2gmBuy2y05vN+qp8tnToxMoMXP1aQq6/pUnEjN2bY
	 w3Ib5qvOgXKFXjv+DWs6bmehqLinSoWxgu2dgtCN2T0oSwaarPQYcsvwXEmEEX9MNwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="YLMzM/6Z";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DC4606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4DC4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YLMzM/6Z
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so7855185e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985618; x=1794590418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDe53dt4rJuBDqVFYRKRy0bDGsLtr15VB9Eg8wIwBs0=;
        b=YLMzM/6ZkXFO/eFEQrOkWCk6uyTG5bhL7J3Qc4CMfaVtwRYLtFdaDsWBMdhAALhyhz
         JJ0N1fnmNUBALbkVfZWuZgc78u/o/YTLRNb38Bl3QqW7tZHvRIJ+QwMVbf1k1d3VeBRp
         khq9zlAxl4acLXyYHZkm6vK6+nCeovn7OruUJJuvimPhmfgaPvnxmfo/dMWQpP7fs6ZI
         Auhjho/Bz6VxbPkkQxF3ggsrcmxjsEIJBy/WveqlvDhMsUL3By8hDOtNWKn5Fvn2C8Q0
         SP1OdnNce1TkgM3y5dWKnYdCiyFhb97EKKsu1DNm7zNf9DyOw0iZysK13hvOlUY9HNbO
         R7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985618; x=1794590418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDe53dt4rJuBDqVFYRKRy0bDGsLtr15VB9Eg8wIwBs0=;
        b=zSYNR4hW9UQm6MV5KGL30EzbU3gc24jkCvI3AX2uX2mQE5ZHX++H6l5WbRZ1u5ywYp
         XTd9LuxQu6HKjpgYyGtPsbwRpogh5UBjeyd5hc1nRirnOIZFaz4SEKh4v1NygfzsPdHz
         Udh8xTTAOAfnWCh3Vtaf1Q0l+kDZloZmz1c66OT3MInG+lkQ1Q2yCH1GiaaT2XSf83Hs
         JqJZ8hkv2scrb/fgw7R/ssYfmX912HbKNZWVOg+MIHIZ3Bqmg8O3unKzEKQfQ6Jacl+7
         ScNTIhPJneErpG+v7oG0ttEwtQM4PtjsJyUv9Gf4W1FvI7AmzNrhM7vl0ZRvhLDboZE4
         5Eyw==
X-Forwarded-Encrypted: i=1; AKwUvBynPQ+XaO3nCy7y3PLP1hIGG+oJ2MgVH4zR2sI1GwanQrG34Cz0+0R4IpBrgi+uJ2rnq2MZkNKKjO1mgZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nOODRuk/55UkUMxJz4gkW6nr8EPe4G+WpazXJ1x6EqIwT1jdT
	rAj6yyMkWbiSBJh9F/XQ/NsGuCq2oRcROTyYvYoAEXZDha+HXEyLFQQtfT+gU9ZZr2c=
X-Gm-Gg: AYBFou27fU69TI5NiEMWA16c0gNS5lMOKT+CB90hGVXB2moCVwXOcH5QxOT6zvtIvL0
	dTYE5RLtIyj98fAmpnYZlXa0RiY0+DHrhfbrzFKCEMw1B2apJv1PcwqEMQqlUNEYxTWto64maXI
	0lcmCUP7Alb5LhlTkDgFXFaGsfZcrLxLy3zp287jv1G4BI73YMW3dBFh4sg2UZUTHZozJ0fJIT7
	TQsbkXost7CohUnEU0yjGeaZsK9d4LoWecnFNDw9bUoBZPYa+ZX8+vN9D8RTyYqsAdk7R5EqRqW
	I6VQP6wGl/Y90o99fRmLWvNtfdKwakSGu0eDk0ih9QFknEEcU3WPBe55zGqm4f5+zvqE4gpMRaF
	eSat6mFUJPSK5HQePOHEY+jmC4NgkRmGorc/eAmug2niAO89UgbaqgjllZBDeRDy8Goy3QGROUr
	5Pil69EZeJ3/8xiXlfK8V7chvfp12CcWusxJ/GZhaxo0dj3o1UBchB91kZuFeTnEDCtaoP+odsW
	ckp3UopbbG/LvcTL0wyAlwuSOp6TYmhogZXhhfFMvyFoTVx7s6Pp6skAV/v3iIcsWA9mVgRIyur
	O/m1cLwgchN7cyN/XkY1CP3YrwiDVOA=
X-Received: by 2002:a05:600c:811b:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4b6e063f269mr51588105e9.33.1793985618030;
        Fri, 06 Nov 2026 09:20:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49354fc5ab4sm2701646f8f.30.2026.11.06.09.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:17 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 00/16] printk: Clean up preferred console handling
Date: Fri,  6 Nov 2026 18:19:36 +0100
Message-ID: <20261106171952.207909-1-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this patchset does some clean up of the code for handling preferred
consoles in the console registration code.

It is a prerequisite some more patchsets, namely:

  + for Marcos' clean up of CON_ENABLE
    flag handling. It should prevent regressions caused by the
    hidden effects of try_enable_preferred_console(), for example,
    see https://lore.kernel.org/r/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com

  + for Chris' per-console log-level, see
    https://lore.kernel.org/r/cover.1764272407.git.chris@chrisdown.name

and maybe even some more.


Changes against [v5]:

  + Updated comment about preferred_consoles[] (1st patch) [Chris]
  + Removed extra newline (1st patch) [Chris]

  + Added back two comments (4th patch) [John]
  + Fixed kernel-doc formatting (4th patch) [Chris]

  + Added check for empty @name or @devname (5th patch (new)) [Chris]

  + Fixed typos (6th patch) [Chris]

  + Added back "[*]" (7th patch) [John]

  + Removed problematic patch which allowed to override
    console options via the command line (9th patch in v5)) [Chris]

  + Added comment about that console_call_setup() was made global
    only for Braille console driver. (11th patch) [Chris]

  + Reworked description of behavior changes when preferring
    Braille over non-Braille preferred console entries (13th patch) [Chris]
  + Fixed comment: s/preferred_console/preferred_dev_console/ (13th patch) [Chris]

  + Optimize handling of preferred_dev_console list (14th patch) [Chris]

  + Added Reviewed-by and Acked-by tags. 


Changes against [v4]:

  + Removed 1st patch from v4. Already in upstream.

  +  Cleanup _braille_(un)register_console() wrappers already in 3rd
     patch. is_braille_console_preferred() will be needed sooner.

  + Split 4th patch. Start with reshufling the add_preferred_console()
    code without any functional changes. Add the various checks
    and behavior changes one by one is a followup patches.

  + Rework the code to make it clear when it is a new entry or an update.

  + Put back braille_set_options() which just updates the optional
    entry. The logic when the value should get updated is the same
    as for pc->options.

  + Make sure that options can be overridden by the command line.

  + Add preferred_dev_node to remember the ordering of preferred consoles.
    Use it when the last one becomes Braille. The previous version tried to
    remembered just the last preferred console. But the logic because
    pretty complicated when I tried to make it error proof. AI was
    able to find many scenarios where it broke. The list is
    the ultimate solution and is easier in the end.

  + Use console_call_setup() in braille_register_console() instead
    of duplicating the code [John]


Changes against [v3]:

  + Move the handling of pre-enabled consoles into register_console()
    as 1st patch. It prevents a possible invalid access. [Petr]

  + Move the code for handling pre-enabled to console to
    try_enable_console() in 7th patch. The resulting code
    is the same as in v3.

    This 2nd move was not needed in v3 because the code
    was moved to this final location later. [Petr]

  + Switch order of the 10th and 11th patch. Aka make
    try_enable_default_console() return an err before
    refactoring try_enable_console() call
    try_enable_preferred_console() only when there is any.
    [Petr]

  + Initialize err value in try_enable_console() in 11th patch.
    It prevents using a non-initialized variable. [AI:gemini-3]

  + Make sure that pre-enabled consoles won't get registered
    when something went wrong in try_enable_console()
    in 11th patch [Petr]


Changes against [v2]:

  + Move static_assert() after declaration (1st patch) [Steven]

  + Rename update_preferred_console() to add_or_update_preferred_console() [John]
  + WARN_ON() when called without "name" and "devname" [John]
  + print error when reached MAX_PREFERRED_CONSOLES
  + Add comment above code adding new entries [John]
    (all in 4th patch)

  + Call console->setup() under console_lock() in braille_register_console()
    (new patch) [Sashiko]

  + Use "No functional changes." phrase in commit messages. [Steven]

  + Call try_enable_preferred_console() only when there is no
    preferred console (reworked and split 9th patch) [Petr]

  + Added taken Reviewed-by and Acked-by tags [John, Macros]


Changes against [v1]:

  + Fix stale comment (1st patch, Chris)

  + Add comment descibing update_preferred_console() behavior (3rd patch, John)

  + Better describe behavior changes caused by update_preferred_console()
    in the commit message (3rd patch, Chris)

  + Use unsigned int for iterating/indexing preferred_consoles[]
    table (3rd patch, John)

  + Add a check preventing an update via "devname" is already assigned
    to a real "name". (3rd patch, Petr)

  + Use only Braille entries when trying to enable Braille console (Chris)

  + Split all try_enable_*console() calls into new try_enable_console()
    and return early when try_enable_braille_console() succeeded.
    Note that we do not longer need to initialize "err" variable
    in this case. (new 5th patch, Chris, Petr)

  + Put back the explicit check of CON_BRL flag in register_console()
    so that it returns prelimitary only when the driver is used in Braille
    mode. (6th patch, Chris, Petr)

  + Add comments explaining that try_enable_braille_console() might succeeded
    also when newcon->match() succeeded. In this case, the Braille mode can't
    be used because the console device was already used as an early console.[*]
    (6th patch, Chris, Petr)

  + Reset preferred_dev_console_prev when used to revert the value.
    (7th patch, John)

  + Add Acked-by and Reviewed-by tags (1st, 2nd, 4th patch, Chris, Marcos)


[v1] https://lore.kernel.org/r/20260206165002.496724-1-pmladek@suse.com
[v2] https://lore.kernel.org/r/20260423130015.85175-1-pmladek@suse.com
[v3] https://lore.kernel.org/r/20260602085312.228251-1-pmladek@suse.com
[v4] https://lore.kernel.org/r/20260604101459.393162-1-pmladek@suse.com
[v5] https://lore.kernel.org/r/20260929120546.328616-1-pmladek@suse.com

Petr Mladek (16):
  printk: Rename struct console_cmdline to preferred_console
  printk: Rename preferred_console to preferred_dev_console
  printk: Cleanup _braille_(un)register_console() wrappers
  printk: Separate code for adding/updating preferred console metadata
  printk: Do not accept an empty name or devname as a preferred console
  printk: Prefer the console either via name or devname exclusively
  printk: Check that index is not defined when a console is preferred
    via devname
  printk: Ensure consistent name and devname when updating preferred
    console
  printk: Do not quietly ignore adding entry for a preferred console
    when there is no space
  printk: Allow to debug misuse of add_or_update_preferred_console()
  console/braille: Lock console->setup() call during the registration
  printk: Separate code for enabling console
  printk: Try to register each console as Braille first
  printk: Do not set Braille console as preferred_console
  printk: Modify try_enable_default_console() to return error/success
  printk: Try enable preferred consoles only when there are any

 .../accessibility/braille/braille_console.c   |  17 +-
 include/linux/console.h                       |   1 +
 kernel/printk/braille.c                       |  20 +-
 kernel/printk/braille.h                       |  22 +-
 .../{console_cmdline.h => console_register.h} |   9 +-
 kernel/printk/printk.c                        | 429 ++++++++++++------
 6 files changed, 338 insertions(+), 160 deletions(-)
 rename kernel/printk/{console_cmdline.h => console_register.h} (74%)

-- 
2.56.0

