Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823187;
	b=FLL93IpZgk6aVm6sqsuHrvvB5OnkqgnGb3KrIxdntxAqAFPk37O6zExDi/KFK2lHm72M
	 WwNffzRzjTHoOW8QBw3yvztupuuseX6oo8ETeWPKoLunHdA/eA+z7ZylQme1ac6sefr6y
	 WBKA/qlCPBFKa9ijF4wkF0zNqejHycfaqBqQJrC8g8LOdg//tUCJhccwiPn3htyLSaJxk
	 IIDpbZ+qE0MeiQSBFc4uF6MAEGMvu+A+ubLVNLJB7RMU3cbK4+6tPKcybXoXpOGVRykyH
	 OeGDYPNqWQT9xGVngJPPUF8J6kHoxrIAVQFe7J1/PKGycF3pknC8qY3zgKFVgcc1Cfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=WgUxUi9pmpBzTiMdJJ86qEPTbEzM6Jfjln1Hmf3u1tPuaXRIVQrXDhItSS0g6So4NtzX
	 bY1eVKdurzeFIJpTV3fV9F1uYTOpo8LE0dz6mZFvKWiLc7bZ7OJ/bjbg+lurUekD2neLI
	 +F1QlrpBSQaVmK2gHWIQO0EU/HFQ0ZBJJlnn5faGGKFDPaPyPAU4HU5WAVWQnQcxKAS9r
	 fok/lpa49cXj/+xa/tNt3kR7Z7+LXKcBwtisxKUfEFfiG8mL7J2aTJpRNnXBQ9WZioiBb
	 be6oq5EngwcSgNb16HOgxnWxmECKAdtrorg8gMch4JyMRdWb341WUXomVw47IwsbUqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JGUQ8ecu;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2433606EE86
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2433606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JGUQ8ecu
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so83127a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793823185; x=1794427985; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=JGUQ8ecu+X7cddBnFHR/z0QG5N7JmGQbEet9vbAnPylUeP/l70s0aAM8LUCTzuz0PY
         E5W9nMJMLVFqGo9/djddtI9mWDWQt2B5vG4xf0yczlT66/zfPBHVGMK78oXZLG+PltQb
         uKuHfrOFKTHoGkHbHXylkc5Nc8/HtEbf8iyCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823185; x=1794427985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=oS/lsrdY3M7JEKS4CIoA7S02edilfyiMpUz5kp75d7ZK+7qS5MWOvF3h7F+iLQc41X
         Tn80DW3ZFkvpE44XWXnsVJwquASPL+Y5jAgCcyyhYLcQahryeWEPJMJ0mEBNKHUnS/u/
         aOzs3b9qKQaLe/kZzyzlY92klcbbi/EpPt8gd3lxGtK42jDzsGEFyhTI7UDHzgMtsgF2
         ils5ThSsJTYusxB4Z4+sK2m5t7DNyVQ99ZVYUv0we9DxDWDWuhN+krKKsvxRhN1IcZ03
         J7tI3jN4spXkUqTVB1t5aJAZ4+KRnJN1xO/YLdit06yUUV3ZJS8ZLUEPALnij41qq47X
         ogWA==
X-Forwarded-Encrypted: i=1; AKwUvByMWAxZj8+naqCA3PeH7vh4nJN74CD+rz5jMj3F5r1kqx1aTZeCSgzJCz7hyobCa+GxlFIhVlSYS9O+2Tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sHK7pXe1StLygtwuqrPpXvBgjxkjc1v1/k1VXoiOPPgCWfLZm
	X5rgirLqYgQOAyp1x0xAAzkLeDWpiCfVD55F8RUdFzDMsZ29z6jNQmXl7XDSoxfRdyIXPm5GM7j
	d153Skkwo/g==
X-Gm-Gg: AYBFou3HrAy2Ftjvwyr9vPsr4CxqcCSnH0PhfQJ8hQ3mjYWcJT7T2iED50X3hAxubTu
	HkrVhs9BrfiCCPB4EeHr5r/Spo2hMC/VjXKw88L5oIP3Kj2180KpnDSdhfpgKHXKT3aJIl9qnDW
	sJR7ocJm42bXjCOXb0yGbt3C6IehkRMfkgak5cSv/H2cjz2HWVM5MUtmz5lu0AzPtQoVrvCJ6V9
	TO96c/ptuXwbGY+UH17GqFniobVgdBDbkpDZdKmA0oRpra8ak8xg1QwYOVjJL8ab91vXyzPE43b
	Q4aRDr5e618Dwl5PEwrtsdzwNPh1/8md7qNRRzIp7UMisVQitH/FXMuroAol2YjPZF/B6bKpfEC
	uGK9DJLXPEeOCl9r7V7IRQKCFariukmelm9pdzlxZU5A9jn4ZAq4U/5Ze8+vt/dTioLzV3JvTm6
	GwYuC1l289wnFSuQfc5QHoLCdQm8el+hpsjZdBFuDus5aaAns9FNrF8LW3iIsgone9WQmUU0MbW
	YeWPGXtoC6+NizIUwd83WK8yUeWFFRBjU9lytThvpzLhXRO+p6H4UNCQq4hMuvmJCbwmx3myE6r
	rGIbvyMLSAe+LTUOZaYh3OGZwoyKvQCihjtHvpzPK8+nNNFXoRnYaY2l1EOEteY9LTrT5eRuigc
	t3L6cs4eqAgosCEcp8zJ4v30=
X-Received: by 2002:a05:6402:513:b0:6b4:1df2:244e with SMTP id 4fb4d7f45d1cf-6b4d5ed9239mr10832286a12.38.1793823185057;
        Wed, 04 Nov 2026 12:13:05 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5643f0d04sm805693a12.0.2026.11.04.12.13.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:13:04 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c423b145922so163223666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx17bGgFyYNhTb02FA/A0USqjW8V+wiR6rmXBQ51V/1ZNTcYYX43yr9QzcyZP+FUhn1ZFLgWbXzzVs/vYg=@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
