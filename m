Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416226;
	b=ZWQLfLaS1QP5XbQ4I3TTTrHmLVCo3rLFYpiqZl/lrSGi/RiGuMQmBo4bSpiEWeDdqa60
	 BLFUzE5KhHoRbkO6cUnXHdRrvnty++kDgRGMXtyT3iPpsqKN0tXTqpIKoHtxEJ+YuEK4G
	 9i8T5uuVEaeHfIoe4QRvq3dikvyLotzF1bNMUY1pEQ8qPsXpMS3EnBnlJLwDfu8ILUVrF
	 QpKhsQ6bqwjG0DVi9gLn336ppnQUOua8XBKxBRXJ35owfMl4puzVzsUvmytdOo1qNy/L3
	 qFk2bIhzCK5OvcaC7tfDp9rqe7mrixTbk9If3zIcrHE2DwTLDuT0aoPTItu35ndp8Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
	b=jZgH9V9JAnJWmltjgecXecjZhtbJGuRMcr2qotMlBzYcIIDCejsHmaddC+q4QYtf6zF0
	 QVOlzQeucuCHqCh0IbZuh/Q3fFgt05l7HebDdDeccoThQiKA/pX2SnKRQYKoIWDTN/0Ct
	 VkSctFD36TQT1Wb/CfaOvlVjqPNIMTXVCSmJuKtYWcglDHN+fuNh4HMYsp8ShqhtU1Pdr
	 HPiFXIlOqsFNA9J2WN5uGmwLVeZNyUUMPISO7pcmRpPdlPrjNk7HuLQF1QIS0t1YUZmwJ
	 qSKwZU6MnhJdTwjtyKHBcaLGy9PZ5UrV15ZdWSjhCRgxOASU88+rJeJd2my3w/thmGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H03yVUwC;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC7606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AC7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H03yVUwC
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1857392a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793416224; x=1794021024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=H03yVUwCDBp/meoXXTo95GjtgwZG8nXQWbdXt+tkq/+w+2HU6Fhep5fXf0IO+sFxPo
         tYb6tEm3KEqdlWhM9yeUzDOOrCX6V2KPaYQhz7Nkcv9z99v1nA+o7fKVVnlVeo6MAlo7
         AikobQPbV3TPRR1YmPVk3AJuRJcrS0UaoEnoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416224; x=1794021024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=YU03/bnMSReKbbcgWOBDpe5C9bN2Vkd58PGDu3O1Cw5BFGTbLqIJWXH9ekPIHuC/Bb
         8RrrGkyR0KT+wED6RIt4K4I4aMfqLEc2KjXoo/B1f8h3YBIoVkLX9LvftQpMMpV0hNx9
         pG+FfZ1nwuGPv1GDgKvLo9yptQ0a4LxXCv+FJGd9PI4UtknQ2eumLOBZKSsQhFFQdoEI
         9L5AxsrwL/jLYSn8nOPyh5dMBbA7JEEt5K1z/0etbd6BMY/tjNICgN8Y9gH/AphCjc4V
         chUqpDFreibE40rLtPeT/T1/AZpAX2BxJ1qMCNfogI7kHed4DaKnvS7hflYgnxwfEP4m
         t3Vg==
X-Forwarded-Encrypted: i=1; AKwUvByXlscDsiqzIpvCuBFHcJdPxKFHqMUaomCSd2lIjqU0EgXBceqStuVFtbYtrNggpJctykr+W3zv+4Ue4lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL47axYg+ZwmxCupxeVGj3O1iknLUp8VMwLdihWo92nmkgw7iYK
	iq8k70kUv/O146m9QCUJ0fR3McQq5e8hHeEJggholhioz7RO0L4K113wjeLpgDshjuKC/gZZlzN
	0VYrsxbB2
X-Gm-Gg: AYBFou1uHzhBeRUGPO6EuCFJBSnCbVcRZdmlagvwTS0Lg3FiHtb90x0BRxvEkrMPThf
	CsuJ5mpFsYoSbTggUKf3aHffo4XG99PdmVhiINyJZ/uRaiof/KKbZGAaeNbcwTt0f3xBs9tTXhH
	JJCFIYZ3X/v7ylU1i6+wfD8rgHjdBfoanBEkWN/M9ucDEbJVkSLmQ6TPLFP+BchbgNR8dsAPjo/
	Sh/BXiJavjVCiY2osn/jHD7alNvuwl5ecL9rcXCmeA2Gway45NoqVjKcXo+WALO9Qb8a94cxAwH
	VB9bS/9fc03qW40hQNe96F6iSi4Oec4KcO/BGpFUa5QKGkvQsQCoCV7mBiWv+ki11xz5H3WbbdB
	FUMDEwi42UeL7nLkJoChEQjO+vmZTQSPEle7Z0D6KDUASHeOgZ+QVOS1cHGgns5dzYjbPDcnKpf
	JBx3pRuFGpfBPSco2lAIYBTwpSJQPvtTaJsudrLKyflreuAuU92iOQ371gvT9IaSeQEeud8Geox
	5p+BciEXkneJgx4NpLHatHcFjXQ31NsVF2Ep3bLZBTToTOiD9kJFiNBF+8pZcEhB8WO4XZZHBO8
	6mehs0J/I+6wcL8IC9plMHRMPHENH50UAUqr8/2fdvmQJH+REcFDCufVpLkAKlZacQoT
X-Received: by 2002:aa7:d886:0:b0:6b1:cef8:609a with SMTP id 4fb4d7f45d1cf-6b4d562e7d0mr2124068a12.38.1793416224566;
        Fri, 30 Oct 2026 20:10:24 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm587034a12.0.2026.10.30.20.10.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 20:10:23 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1405697f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUx5OnZtitsWyo0kfzs6MN5EgsKygplJWl21deexbPAOBXaL5x9YwCjxQEljf7/oaYDgGKrJJJ2r3ip1s=@vger.kernel.org
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id
 ffacd0b85a97d-48e6e4f561bmr9818154f8f.21.1793416220997; Fri, 30 Oct 2026
 20:10:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 20:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
X-Gm-Features: AclHuK-bghq4wzz1qNlwlR04GGQ-u_3zjoGTgsEW-iZ0A7dRvqdHdSoL4JcYqzo
Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2026 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > The FIT_ITS path is a second way to build image.fit alongside
> > make_fit.py, and much of it repeats what make_fit.py already does: it
> > puts the root compatible from each DTB into the configuration and
> > compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> > /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> > hand-written .its file, and the .its files repeat the DTB lists from
> > the Makefiles.
> >
> > Have you thought about extending make_fit.py to take the per-board
> > metadata (e.g. from a small file next to the DTs, or via
> > FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> > in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> > logic, and trogdor would come almost for free.
>
> I certainly can do that if that's what people want. ...and, yes, I
> think it would simplify some stuff in this patch series. The
> question is: what does it look like? Is it a file that is a list
> of devicetrees along with descriptions? The list of devicetrees
> would be to limit which devicetrees are built into the FIT
> and then each would have a description. ...and yes, that would mean
> it would need to be updated in parallel with the Makefile, but I
> don't see a significantly better way to do it. Yeah, I guess that
> could work OK.
>
> If so, I think a bunch of the patches in this series will be
> dropped or look very different. I probably won't directly reply
> to your comments on patch 2, 4, 6, and 7 if we go this way.
>
> Should I give it a shot for v2?

FWIW, I did a quick prototype of this, and it is definitely a much
smaller / less invasive patch series. I've got
"sc7180-trogdor.fitconfig" and "lga.fitconfig" files. Because they are
easy to parse in python, they're in ".ini" format in my prototype. So
"lga.fitconfig" looks like this:

+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# Each configuration description encodes board and SoC matching metadata
+# for downstream packaging tools in the format:
+#   "<Model> (<key>=3D<value>,...)"
+# where <key> includes board_id, board_rev, soc_id, and soc_rev with
+# hexadecimal <value>s (in any key order).
+
+[lga-blazer.dtb]
+description =3D Blazer
(board_id=3D0x070406,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-frankel.dtb]
+description =3D Frankel
(board_id=3D0x070306,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-mustang.dtb]
+description =3D Mustang
(board_id=3D0x070506,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)


Happy to post a v2 RFC showing what that looks like if you want...
