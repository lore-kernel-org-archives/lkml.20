Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920418;
	b=3qXR+x6KHlxhFvTHZce294YSTl7oX2tasgZ03H8iooeuIvRwZz8fxVqsXyUebl2Yj9zB
	 sUe/HJWIJRDg1m77ed3LUgDUzsDgKA462IsEFVWD6pNP2gwBmGXY+xTEyESvO8Oy1oQbI
	 IbgMr9iFLWwml9RAs05Zxupl/WnDkbY0cnUoQqFx7WAKkY1AuOv78zjU2fqaRh9HcHrJA
	 O4CyS4ddolAnVQ32bD5BCU7lndTT/3LLDFfPcs66KuBbKkyhcUqzUy0BimbN0HvHMBjO4
	 tDmwtHv4kcZdsYSA2aTloV3L/DxVDu1d0rnXMa2cl22SJ69i8P/VYSM98SAKj3RgvXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
	b=pVL3OajTycKRgPphs4ps57VCVK73cpTR1PEL5EukizCQUZAoDKTWC+WSCQLOEj6da2cQ
	 3oR2+Sfx+Qf3DmPgxWLI4i64Au+rhban6SnRGG8KlpzSZUCI7tuWZGsqlGXX/KFu/OyKZ
	 I1lQUulBBKFUUi0RUP6kxC5ouOd2lOvfxoo98J2JW15w7gR+IhIZm+eS+KFHOY/qCzZkU
	 AotpoCq3ocxkwLTNONzMVmKwpPlCmRGtfZpI6pQGqfyzfPx/E2zERClTNHKhgPYAUVL7w
	 hQy+DLRA3JmedOQDrOhXzCQaXHMME/AfO+zB1F+8Bq8T6E7Zrz/utyHP2rNAzJjCxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux9dP6cx;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6AF606A8B5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6AF606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux9dP6cx
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a358881793so543528f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920415; x=1795525215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=ux9dP6cxGHchfy+unLDQ6NmKaVT3R8pW2Zfa/bLFviUfqW7T1JZLWOGkLeMvqz7iUB
         zLW7dje3QrA7HvFJ9Z2e/BsWN7PkFukCWLlCC2sfZfe4C42kw1BD7+xJ9+K8ykHcfJhN
         xuB6p0p675+Q+8Ab4VBm/lPttSQUOT9MfXiQdtBTxIq64JfVXTUc/LJnriMOJrmqWlqr
         pVJv7iS/suULfBRGTO/rXud1wwmWfwrXIjLdPTrqTKyk72/ZF/FYEeTqn8YrQOIG851+
         XstWyYcmlUsM5ZYhKgaD6JN4csYJsgqj8fKhGxAJTKSZDhJpxLk/Ya/RZa7YSEnQfkFN
         FNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920415; x=1795525215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=rJz8h5ltJZyq4wGRC8TCiCZoSiXwOW2gyxK8PCL+Hu77AYINQjB4T4ZVzhjSQRRONV
         EMEd5nf3q2wi2WQK5mF3lwCVgStxIcny2/e+b7ghaqnhmyNJQ6wPMFZqAMGPdz6DBxpD
         rDTUTeR31UFKDWhmD/pyhsGmrIe/7FGElzeoE/jmH0EIB7JMC6qE7Xe/wuS5Wmx0Jor/
         4IgiBemorrehXiXcbuQCmkvEh3QUHLn/qXRVe0M0Oq9fmpNG4SLgGqWiv1XJ2WKrqN/V
         gitnq6+paupwqN8mMdVLEUso5Qrb6Gt3w6gLFp2+HBpPTCXIjXqP7DtrT8/wtjkHptyW
         UgZg==
X-Forwarded-Encrypted: i=1; AL+hErFzYnOFgN3IYIUzJG+GFMBirBLGfkWvEyqb8+KyYy0uxD3I2Xi8ZNYcZUedsSYowgrF54nqWsyrvh2CDZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z88jWN/kJFZZ0OkQC4ysyVdmV4Bon09SjGkb3aKnFzTXOJea0qV
	UEjOnusxasMME9CPkY0H3JKqXgTdAOMh8bdEdeTzIQj8sqVK3vj3wcM+
X-Gm-Gg: AZFdTZdQNRRxct/nbqMHLvP4l9xQPZK6YqbPYVp3SCr64C+SVEPso+3iDdHjOl5LhTj
	m5FeqxDtFoEYO0lsLKU+tI5K8ME+ctAZDMozZNpw3Vz4aYUmZ50QsB6rjQHvpSzi2NDtXuNDsvZ
	1tshVr0MsUKXvkm3ibDL8ESdIF+yJJ3hzh1vdAyL1JPHODOXb3Ymfq31x8f9IJqyPO8RVSSdFVj
	2/SgWHjxLuAwI5zWXUj39tloNOr41gxDJvX6J/31koZJH+6yy4QvNH24i4p5VLf7WL7jaChADTk
	GM/aT/uelppAprTgNcbf1AQTeUxR04MuNTc2H0pafko9KeSGdCrZad3bcYjDLfzuNuq9UZslzuw
	PkdVJFouResPtYcM6MLxdWP+sbyocs/W0BubPoWekrYPMVZDGquz+03hGhoNOI9F/vHGMXpW37Q
	YCl3pb6nirySx3qDOlRvs3ClchPAmFkHKpQw/YdIZoPum+eu7+4ZcO3AjJeqQMf5RJHidhFSq/A
	y8nz70+ysyjXKhoysJtyRxVESpEmKUHVWwAJQl6yqQ89QmX/uTZ6ErpChArvg2I4+nYY8NyhF7d
	Crp5qMBiHF2hrz8J28DD6zr5mbPLcMMxUYoqkO4V3IR+2CA/sl8I5bJjtYQRJbNb2Wt9ePiZa1j
	0LwVvh1N6E4Y=
X-Received: by 2002:a05:6000:46d0:b0:498:2754:6a80 with SMTP id ffacd0b85a97d-49c725e538bmr20536616f8f.28.1794920414596;
        Tue, 17 Nov 2026 05:00:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm28207005f8f.28.2026.11.17.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:13 -0800 (PST)
Date: Tue, 17 Nov 2026 13:00:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261117130011.05eee0a9@pumpkin>
In-Reply-To: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
	<20261115142431.1587690a@pumpkin>
	<CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 19:15:11 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Fri, 13 Nov 2026 14:12:45 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> > =20
> > > /proc/kallsyms is the primary interface for userspace to query the ke=
rnel
> > > symbol table. However, resolving even a handful of symbols or address=
es
> > > requires reading and parsing the entire text file, which is often sev=
eral
> > > megabytes and takes thousands of read() syscalls. =20
> >
> > Separate from this, I've wondered about separating out the /proc/kallsy=
ms
> > code from the code that actually handles the symbol table itself.
> > The two parts are pretty much separate.
> > IIRC it uses a static function to get the symbol type (which does most
> > of the work of getting the name - which it also wants) so it isn't
> > completely trivial.
> >
> > I'm pretty sure all (well almost all) the changes will be lower down
> > the file than my changes and won't cause (hard) conflicts.
> >
> > I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> > in userspace for testing both, but had to cut the bottom off kallsyms.c
> > to get it to compile with a sane number of definitions.
> >
> > David =20
>=20
> You mean separating the core symbol code (top of file) from the procfs
> interface (bottom of file) into two separate files, right? If so,
> seems reasonable to me, especially since the file is approaching 1000
> lines even before our changes.
>=20
> And agree, even with both our patches, most functions can remain
> static in their new homes.

I just tried it (on 7.4-rc1).
Only had to make kallsymbols_get_symbol_type(), kallsymbols_expand_symbol()
and get_symbol_offset() non-static (added to kallsyms_internal.h) and
split the file before the definition of kallysms_iter.
Then tidied up a few #includes.

I've found a much bigger problem though.
All the sprint_symbol() functions do unchecked writes into the caller
supplied buffer (no length is passed).
While the buffer is (usually) long enough for the name, there isn't
guaranteed to be enough space for the "+0xoffset [modulename buildid]"
that might easily be another 60 characters.

Some of the people who have modified that code recently really ought
to have fixed it.

David

