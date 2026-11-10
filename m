Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342880;
	b=dY7VzjyqjD/B0+amTDCYBqz4IIecVPCqGNSuVAE2wk7MA0W5hz6FwrPLbGunyjinJsPk
	 EZlsPpvkVlMuKL5HJSLqRRqO/0Pbnl+kORclOHP06jPV1IYlZnrItMzEFQLavWp4JCSFy
	 549GTH8Fp2q6fJFdfGeiPIMCSweH/1MTwYWo4TKlwcovFZ5F/4d8XjlYUur/U0etp2PD1
	 j90oHv/vHxC7xxXe8JMbRlw/k5EzRmIC5gq2HRXiVMGoWmeZER9K/iW0kR6ffTzC8HaEN
	 OjaCNS7XRhKhALr6+4okcC6ntoWIfw+F7mnO413mk88/F5rOTc96EffMjov56LGmnEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
	b=xhQ7UF1q9mxeud7Y9uuCt1zge6Ixl2G33JW06GDHYJ82UsARYWV+z2Q5NxCT0PkmSVGN
	 v28FfPbt6EihQWXn7QD1FDvjsvu1ksEMbQfdlQzZLTNr5WvGI4C+mkfzmsuG60BSU1f8e
	 tCNc45MWqHHIcWbMPQMZplzfdKwiikVdEXk5cip5u+IhlsaX3sG5qPBNosXKM5njknB1G
	 usGYU7iqcBnL936O9EvereKvrzXTbixyWXxeQ0JMKVAvzfUO7TMTnJPh6evLNRYyyeMHZ
	 siQgn54RqddL7+rSE+UoTgyIjK5E4ZWE3pX+oLor6zJnvDU8XejVLIYeERyYnLfPtYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJHWSdqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A1606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJHWSdqs
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2445350c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342879; cv=none;
        d=google.com; s=arc-20260327;
        b=KsYJcDTRFGF+9Yvnlk4kD+iEP6hHZdjLWPQA7TjWLGbswarA5ETQQ07BwIUtmpfqTf
         ixW7ozPa2IS/xXqJ4HJ/U6lrsv/G5OvXma67u7GHTHj+VP1QC+NcWNT4Ic/uLSTAtAzF
         ZbjAIiNn2ghfi9Skv+kr11lX8Fjf91UVQgtRPhPILpZlo8XnHvpsE/cV3KO5F4cjJhVS
         MYsmiFJ3Zdiir0/rAROocb6euEnI3p6QtPI++oImltvfR4Jf6exHCLi6AuIePbkS5n3o
         djzfR2tEYZFKpRKRWchO69wLkaZxkFXUG97OzzlpX8VaRLjVxBAJByzkxTMcaKNt4Imu
         BJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
        fh=alvXCeiXf3X8Y+Tx0ZjPPPtpXihCxI0YJ9Rd/g6+1dw=;
        b=cBhC+ORs3hFmC1WfDIPcynNpY3V9igoWNVJ8XQp8BX6rnSmz4KJxmAQEXdb2qk8qSI
         /ol0RNW2Yb4h+7XxrpacV9cvY8vJAO+AL3687B9NllsMQhKt1YEDtT7yYGmBVsOOHiko
         b0dCfNChUgYX6HxZDSiAa/wepd0KK0wO8KBCDb7A1LOJfM7wkwGW3MoaX0pr9WDbJvu0
         hj5QU1iybt01F/H5CpNE1uPif2D2Kv6Of6Mq/Q/TYA1PqWUuws+okuuqT4RIeM7NoqZ6
         ub3zAkDMMOFGGgM7jSD56wphnAkz30NuzpK7YlWQqoadpGjtEkx8HHgOxyMsl5GRTMb5
         IAXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342879; x=1794947679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
        b=JJHWSdqsEtM4bBU+5grCo2bl0FUiJb1cGjtLviO+HJ316nr8t93eAwbQrKRMSTg54v
         S1eD3X6ENXcfeP1135+eyE78fqh6YlByhVfnIxLyFG7Fnme7gn9oHVld+Wq+x8XHcCgU
         ruru19j4apZJUaalygL0J9pPog4yG/vMVTq376YY4QDiEFFSF48V4166IoB/ePVwxqgu
         /D+dc8LeBN8iMMdGC15ltgljl1n3cr/733lqr6mNBbguaeSVcedgduo2I4tL96AGpr4Y
         F5Cjwk7kDEsYWWPiIqIdzSPMbFSV4xONseh6BU8GmO+jDJSOZkGOTcyfvOQoysJ/zb2v
         QPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342879; x=1794947679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
        b=N0xY+Mvk0egycNiPziKUk9cb47cQ3Euth5FSvJUanNzK9W9EU3/Fai2DSfKFBgwXVI
         4Y9JQCEGtqQ/j/GNbWcRNv5w6qmO0VqchWpv42vWcI2zIAR2QI1whrDOad9M5lLnW9J4
         E1bhCl1jvd8nFFQepY41uTLPv5wDAOGJ/1wrMGfIomzWmhv7t3R2yfiswbx8cAYIOU2/
         /bsjugnFC1QtinapJ4mMNKGN87yZ/E1EYdfeQcOHHiaGZtF7krK8ZL1Tv8ja0EnhM27m
         /4iGn4MeKghqySagK0hTXbaf0DP9mXNPfC8o1g6i7CB+3dQjspJcq9Ij9rUiqF8GJQ7l
         VxGQ==
X-Forwarded-Encrypted: i=1; AL+hErFdvYjjMF0wT7aeK0MhZ7eg32Y/qfyPmJEbbxCUOTmWx8u6eZhcWiS1HC6izW4dyZyMUVqn6CW7Ove2QFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vL5c5C1Bx7XowKkGx/N8s3z6kWB+RgHbYK1yVNuKvV2lTJZTq
	NF3rsSspTtJ3u+exi7VV4YhraGApFdsNucK5mx/2pOgkdzlukGwqZlCAYJzGxNvdLPdXR7tqgSB
	86WLz4Xqs6DLKrlaKrc+C5g+sY4K45jM=
X-Gm-Gg: AYBFou0raiJnJrUnSH+iRSCkg40iPB8a+CoM33hw1Nu9ZcDAnCLk+oBo98pghWPFSiu
	VysnUHNgToFIyOdhfhonlIEBamKj+Pzm51rMIFcBFPN0iyReBbM/qzcjcsa2gXmKdvyIXN4zJ9q
	gW3K/MFOENu1xnFf3eizzYPwaBZAEVWrL/FqvfH/RC6SefF06hjYn04FkISdcH32yECJxMHVu5F
	FUnfrFDe4v+X3BFJEdgf+KTW0Y4xXaHTT0QQ2fC7n/+8Xvk9Acn/nmnt2DhH3WxmEK714x3rXEp
	WczxGaQ+1c7IzIzaH9o0gbFLOKMP6JxNg4jqWSMTG7/+cuE6abHCMBeaMtRCA6MrkFnJR472FtT
	x1Lx6LFFKgThzv9i868BPTVriNDEe/tofZ0Tq
X-Received: by 2002:a05:7022:f210:b0:1a9:cad6:5b58 with SMTP id
 a92af1059eb24-1b3b619527emr6112214c88.39.1794342879053; Tue, 10 Nov 2026
 12:34:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-legion-lighting-rfc-v1-0-a87e1db8c5e3@gmail.com>
 <20261109-legion-lighting-rfc-v1-2-a87e1db8c5e3@gmail.com> <0ff29b9d-bfd5-4d89-0e78-05497312e390@linux.intel.com>
In-Reply-To: <0ff29b9d-bfd5-4d89-0e78-05497312e390@linux.intel.com>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Tue, 10 Nov 2026 17:34:27 -0300
X-Gm-Features: AclHuK8u07v-lJ61Vl1Al48vF06fYxLioDMP6HLdGSnp9INLtz5V4nXHU_TVAE4
Message-ID: <CAPKD0HfAWsMDntCAmjKSOsc3zOeLVMUn9=uBK45OaFo2ovy-XA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] HID: lenovo-legion: Add keyboard lighting driver
 for Legion Gen 10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Tue, 10 Nov 2026, Ilpo J=C3=A4rvinen wrote:
> Thanks for the patch.

Thanks a lot for the thorough review, and sorry for all the noise in v1.

I sent v2:
https://lore.kernel.org/r/20261110-legion-lighting-rfc-v2-0-845726afb71c@gm=
ail.com

Rong asked to keep only the keyboard controller, so all the LampArray
code is gone, including the pair lock and the byte arrays for those
reports. The rest of your comments are done (struct with __le16,
guard(), devm_mutex_init(), no magic numbers, includes). Some answers
below.

> Please don't include how things were prepared into changelog, but you can
> use the area below the first --- so it won't end up into the final commit
> message if you patch is applied (our tools will automatically cut the
> part below ---).

Fixed, it's below the --- now. Sorry for the rookie mistake.

> > + spinlock_t event_lock; /* protects ready */
>
> Why does bool need a spinlock? That sounds like overkill if it's all it
> protects.

[...]

> The racing reader side might have already reading ready and unlocked. So
> what does this lock actually protect for real?

You're right, nothing. I checked hid-core: it holds driver_input_lock
during probe() and takes it before remove(), and raw_event is only
called when that lock can be taken. So raw_event can't run before
probe() is done or after remove() starts, and ready was always true. I
removed both.

> Can't the work be managed with devm_ ?

I removed this too. It was only there to call
led_classdev_notify_brightness_hw_changed() outside raw_event, but
that's fine to call from raw_event (hid-lg-g15 does it).

I kept the LED itself without devm on purpose though: devm would
unregister it after remove(), so after hid_hw_stop(), and in between
someone could still write to brightness.

Thanks,
Ciro
