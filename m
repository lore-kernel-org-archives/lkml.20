Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794885328;
	b=wRDGVrPmo7i4k3fbRo+h+IFQyheNsQjJnaW8sGktPMH/ZemJM9ygdE2wqOM75cpHmwn0
	 ufx1nRHNOabwJx8NxPNv8QmeeGR3Dj4+/wY68e5CDgvuH4vEK+HPlT8OA5/XZ/OPjhBvo
	 c3rxt6LSKUQrjAXShZH/l0ayQ/cJdcEzuTtqsLCwCWtjw49ADbnqRu1t2Y/heJnELCJrM
	 NOd7ih3GlZFgSlPtqh4NrSel6YW3J1ii+zb4qI5fKv2wsh7JAdDQF6Xs/fQBhVqiMDjvN
	 n1ipAYEcUMX33gPc9YuaiK8Ip/JQ1wuSNWIDFnW4C9Ywt7ixuUONrYzTq6wGNBM4JWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
	b=P8kxOh8gWoUrZ5WGAO9kH9WxJVGRjgUkLniQw6HtBXBYDTCqSRaeBTWiPAxn6/LZL2Fw
	 8OPd0wjgBk0NPgjKNv54jeULKbsm6VuM2fxLPZBxw43LDEk0i6Bz6Evy6QIOvn6H99CXt
	 BofepVF13NNCVwd45rMM4SslUMm3tf/79+RCB854K3LcTYZdQN9cLyv8XS/UfNwDzyBF1
	 Mnr30hd6Xdxy3h0VJT2yS1vIaxbyGq+/g7+yiwiHTtqjkK+GWX6faJVa/mMfAdlrUeROg
	 MVEQINXUOmhj23r8kiSR3erkpFYqxD9bbHvhMnj1oOpFM8h5AzA2fU34fO/HB0hUl8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWuE0zna;
	arc=fail smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4AC606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4AC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWuE0zna
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so5837381a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885327; cv=none;
        d=google.com; s=arc-20260327;
        b=fRndODN+waoXXDuXAbB22qN4YW3L/TW39p0/RDt4CDy0F6Ud2i4PYL39oVbrg8aH2Y
         L9hhDkWkHiXTX13NN20LGm2E7rc/OYaGRmV0wxTuYvABvyHTCA/ohLDr/k2EoIxW4Hof
         l9xDwEfj1qF0Ah8TKmApF/YgYOZGit7qd0Q6OWDrG+RFsAoAyWaEbE9Z3dYbSAb034wb
         Ye445KgV5CKFVA0f/EquFCg4ckpihqj7Ezgf0qWRkpJvTCk4g1XSjDjQHcFYWTS0kTGY
         m6aUJt2w8dvtoOWWt5WYqg+j/NL4bAgVZVyXeAdkKsEeAlB0opThcjukoOgTKJSOVtwj
         gb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        fh=xoXxpKfdzLOE7NU8QbDZdShTwF4pFGQNN9cHSSHYMHc=;
        b=Vy8HXhB+9TFdxk36qQFk5r/I9l/FYI58U+bxCVGT5Xh1eb+seuaoYvaf5xvevfej01
         emCy7iJxG9UIocp3W3BaPE5yPHjYhB1aDPkXpB4Sl56SCSX8Y5VPq74HyuZqNFDPIZ2U
         ElHnRFSavZUEQS8huKhqqBi31zA6rxHCPSSLnu2xrhuUhYRDbxNoekSR7kU+VQNZmAIk
         VF1U1KZ/Zfz8npubU8FgK24kU8bFPsy/Gld1VZl5kvTjgSLJz+oOYgqsa9Taphab37l0
         2xXFTODFAjvLMKnDauibLWjESw2VmO5pbkcoaz1yRwYtfaLfKT7LuS1vg9OXmlbiQkhC
         /qQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794885327; x=1795490127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=UWuE0zna/Kej6vRfmnnkBRPiB7MtRAOmWnZDUwfDZnARnTtWa0lZ918fHjZc6mu5UO
         /2+zJyxEYftdneZsscW0DL8Fvl081Y38tQO4Pv5tUIPYfcIIYe6CjwGLqcKBSst9Gk21
         HyjrRa3A/10hlqRod0LbCztyuvg1+0RmyX0gzRFwGRR3oqb5tPu6tQU03asd4m3tC1Ly
         2jBUNoTFraXXJMf5dSQasvoZ/LajiRGFP3fxeQbTALoTqP2ZEYO+PCEtWNT6HsCG/4y2
         Qq35/dZdjfO2Tkf3aMOsAIjY43RWuC/9l+8ADKlIptRxOOPmsxJVEZSYuAL1Y41KbuEX
         BlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885327; x=1795490127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=OjRzzvqu/75igPSXKwv2ovK3M/cf4NuvAeVRcpJeae252JOsD0qGlky24stSnGY+K8
         pfC5F6ORpnLKeJ6ds/8U7KlKrA3UZHifIvSWtnA+1K6GnKYJKHjj7Z4Yl6qM4XO6tSsF
         O59Iw4IVP5gMtjLt85FkZZT/5znSMSTMveS5PAhKN12PZAXHN+AaAKrGZ1bHHXw+2Uxj
         S9aSyLlpdwg9hIf7RlT3B8mVyfGh/FoUBWJVvNXRcslaGfeLpoa3GYHiQTqmldDU1XHQ
         8x3RSNXJUrmZUq5rjL87XPrVm9s+gSxpAZXo67/f6feWTFfNz9qIKECtWqJFwnZLJti4
         JnLw==
X-Forwarded-Encrypted: i=1; AL+hErEL+Q8Pmxhw+fETDLNuPBtPYdocf9dSrd7+Y4kOaIEOmWLKOs089+zpYpMKWQGZoTV6oG1g7xswqLG8hAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vY1uWr7/6Skb566V87dGP9B3CYC0o8AxOJ+iPZBfwgy14OeqG
	G/AvjiWnMDfrKzvK00zp5HikdxDY/07tDBZD2Pat9yA7zeCRfAbYuxZ10SjofqKWqOFz2gVuSoi
	6hHdpzBpM+BPW0SZp/St6mGG10+dGgpCR4eA7GYEH
X-Gm-Gg: AYBFou3PGcnnBoyYDnm+VfkxzZVCEGM9Mv4I7i/UAx6uw3P3mV5acuEm9Gbzkd1DW6y
	0TVdHHSOqgFqjF9o7PH89UblTt/1MzI8W7EYquQx0YBeCr9depwxNnSb57pfapp2jcCO/+Ew1Tg
	ES/eXS0U24oH0RbOQ7x5rjhme0FV4/jRmLOEHtnD9zO/4PqZQ4flnyDOEyA27Wt3Yby5rjQCvBR
	N87foSR9qt6DMhRZtkKfyUrG9FKncep/uEGLC+jQHJnK8HabZLUDons4oOXX80QELGTGeYHxk7r
	1/VEwHsnUwqyBT++z4+zWf6MWnVr2xWIXyX9tGiIqMvfvpGZ/sN7BVlae98ojMKXTVsgURSvMu1
	ULUmIVEZwgO9DzNY3Wds1iJy+f8futx4ESeBzyqtZZoR/vvJkzk+ySPEws39BHZuXzzohXos=
X-Received: by 2002:a17:907:60d3:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c50968355eemr1101863766b.48.1794885326369; Mon, 16 Nov 2026
 19:15:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261115142431.1587690a@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 16 Nov 2026 19:15:11 -0800
X-Gm-Features: AclHuK-iBEn00_VVuz6qjGQnwYZ5FRJ6bny3VEMRskBOJf02b9BDmwbxXueDduo
Message-ID: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME and
 KALLSYMS_QUERY_BY_ADDR ioctls
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 13 Nov 2026 14:12:45 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > /proc/kallsyms is the primary interface for userspace to query the kern=
el
> > symbol table. However, resolving even a handful of symbols or addresses
> > requires reading and parsing the entire text file, which is often sever=
al
> > megabytes and takes thousands of read() syscalls.
>
> Separate from this, I've wondered about separating out the /proc/kallsyms
> code from the code that actually handles the symbol table itself.
> The two parts are pretty much separate.
> IIRC it uses a static function to get the symbol type (which does most
> of the work of getting the name - which it also wants) so it isn't
> completely trivial.
>
> I'm pretty sure all (well almost all) the changes will be lower down
> the file than my changes and won't cause (hard) conflicts.
>
> I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> in userspace for testing both, but had to cut the bottom off kallsyms.c
> to get it to compile with a sane number of definitions.
>
> David

You mean separating the core symbol code (top of file) from the procfs
interface (bottom of file) into two separate files, right? If so,
seems reasonable to me, especially since the file is approaching 1000
lines even before our changes.

And agree, even with both our patches, most functions can remain
static in their new homes.
