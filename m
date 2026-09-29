Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3250B409
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683557; cv=none; b=SELPByw2TUoyJJoAro70SDQXS3tIGC53uBR8BDRLO2tLdab3jmN5K9I9Zt7vk2XpvNkDuN52a4vnLloCLTv17gNCs0VH/xmPdiXsQM+IxSaCnhnsk8xY4e8iBaw6aswnb2T+Ij0GcQmyBoJR7nIr5JWZy+o/86iECTJUgjb/vg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683557; c=relaxed/simple;
	bh=KJn8wtQ58M6IA7RKLkz+BlUvNzVHQD9mWFVNqF7gP48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZfeizSczizhHzn3b/XWSV2qRFj/71VECQwoitTEPkiKq1TrvnceL0Exr1dF13LOegoXNJwxLHkhF+KpIw9ktwr8TwKT1dU1gZkw51vGLfFh6KsdK7MHFpd6HQnQVvciektyQZzkx3TSUrTbw/DPoJ5qd7HhLXcaX27mJHFyHRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TctaXwUY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TctaXwUY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so22329205e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683553; x=1791288353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IV0/JgauBCmxyymKqnct/gxcGWYLV4vaqZ3QBeRuQPw=;
        b=TctaXwUYUJVo6H4+JcNYHxV9h3QKTjxUgJR0QPSg3OYlDH1IzJh93wAc2XhjaWotmJ
         gdGE4+irrbdbG42dB0bCXmFdjR/95bNACC+qN6MUWHnu5U/KkFITgPhpC/MDeXBiuVmR
         vfofNU3HdOZl/LYfFG2xu/pc6ZrvHZhcrvKwZ2Eyz8v7lNIHyrlT+DleI5fx6DOHwe6a
         pffHTrjQd/jDe0LRgUcA/adN/peuv+cxzoN7+xLn0qqbsPBK0uPDZCYIYBVeEcBsmtrI
         xYTNp5EAz0dOggzCzfDvT3lZq3BcyhDjV50vvWHIW4twwz6R2ir9ySnpWpLU6phUWX+C
         UEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683553; x=1791288353;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IV0/JgauBCmxyymKqnct/gxcGWYLV4vaqZ3QBeRuQPw=;
        b=j/VhkU3bHSX0QfwqQwf0EH7RkciKaLodZWQlzpBHCnjcX4dfd83Vm71SeYs9ln35xJ
         nfsNJaBdi+0FblVku0mwFI87aCYUdP97nnixfWRsxdIL9g8I/EhN1uAFR5lvSjOb/EUW
         WFejpj7Bndy7+lU5IGm04AJ089UB5QXdgcUr8Gaiwma+ZRwZbZmGjVpOemHMuratCRw1
         G0DsENsfetmS6JexpV/JTNanP1PwvTjMDy84DTcYanQRGoerLrwPalTc81yyHNF0p5Rh
         AkPcrN6Eisy4rCYd7uRT0NkLQCNkzMlqba5jW2GxFkIz/f6t6CrEDfpYC57yQWeLZ4ef
         AbsA==
X-Forwarded-Encrypted: i=1; AKwUvBwEjuw4+hHPDyCNHmygH86XyWtTdqECIl5pnhDDAWTYfNi+oxMPo8YDM6RN96wWeZzp1Xk05AQt9SL+x78=@vger.kernel.org
X-Gm-Message-State: AFuF++mAhuwtjI7/RGgm3X0m3FJ2tfiOeE4Q1UNh/z15vfvsOWZElLYN
	ok+e5Gp543xAKC5T3dUwVXUQnGCHOrljTmgyt+49SYxa4vGbBNUIeOvXXrtIL6QVLgk=
X-Gm-Gg: AYBFou0gllo7Chv7bJAc2x09fiUZ0YBLnZaibtTk0h9uX4ILnT047cBGSw6KwPs7Oje
	/8dqP459wZuoNmv7N/dIwmaarbRa04plnDaSrf9lWC4goPgdRvr1SMkBONDHMwB3Y/qiyoJPF3i
	qO4ssD2YkKDVbb3bcwJUSICsJ9KNcwJd7RuKhIJeKO8hYK3m5zIy250qjwx35YUQoyfczpfFUga
	4rghB7nyv01ODOIusJruKdfYUUqTaZnz4UBshj2WmpkAz36U6M4VRs67zDSNwil9H5tfaTZ4CEv
	pdYU9nJTXMZ6Yw6WOQ2Doz9npS9gpadAA6Mh5TtpsFPRjv1XF8oRqu2W/gFztYYKuM50guv4nJO
	UJvuX75JluVEdK5K6WsOJ83nAQhJpMooGeujANVD/mf/Ux9XJbImHF0pHbpaNKsAv0J1JWzW70y
	6NskHOtks7bHhRW073x1+gScSLcmHFi9vsfZKjT+PsOTNmckS0ZBiSVoAbRBWl4s4254embfUdY
	7HEo0zi
X-Received: by 2002:a05:600c:5487:b0:49f:feb4:6904 with SMTP id 5b1f17b1804b1-49ffeb46a45mr137208195e9.11.1790683553176;
        Tue, 29 Sep 2026 05:05:53 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dd27sm74831615e9.2.2026.09.29.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:05:52 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 00/16] printk: Clean up preferred console handling
Date: Tue, 29 Sep 2026 14:05:30 +0200
Message-ID: <20260929120546.328616-1-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this patchset does some clean up of the code for handling preferred
consoles in the console registration code.

It is a prerequisite for Marcos' clean up of CON_ENABLE
flag handling. It should prevent regressions caused by the
hidden effects of try_enable_preferred_console(), for example,
see https://lore.kernel.org/r/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com

Also I am working on a feature which would allow to explicitly
enable/prefer consoles proposed by SPCR, device tree, or
platform-specific code using a generic "console=platform".
This clean up is a prerequisite, see
https://github.com/pmladek/linux/tree/console-platform-poc1-iter9

Note: I split the 4th patch => should be easier for review than v4 ;-) /o\

Important: An extra fix is needed to get the Braille console
	working on a serial port using NBCON API, see
	https://lore.kernel.org/r/20260922072558.98854-1-pmladek@suse.com
	https://lore.kernel.org/r/20260925141729.173943-1-pmladek@suse.com


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

Petr Mladek (16):
  printk: Rename struct console_cmdline to preferred_console
  printk: Rename preferred_console to preferred_dev_console
  printk: Cleanup _braille_(un)register_console() wrappers
  printk: Separate code for adding/updating preferred console metadata
  printk: Prefer the console either via name or devname exclusively
  printk: Check that index is not defined when a console is preferred
    via devname
  printk: Ensure consistent name and devname when updating preferred
    console
  printk: Do not quietly ignore adding entry for a preferred console
    when there is no space
  printk: Allow to override options via the command line
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
 kernel/printk/printk.c                        | 414 ++++++++++++------
 6 files changed, 326 insertions(+), 157 deletions(-)
 rename kernel/printk/{console_cmdline.h => console_register.h} (74%)

-- 
2.55.0

