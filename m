Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5FB439351
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447554; cv=none; b=IvxZvl/GLGSmFt6MVb1IKnRSKiuuljjNRj16gpuqRh2Q2Aequ+TN4layJ+L/qC6tz1ZCTYrXn3Nm4/+I8OO3HN0IPprvVG0PYU+HIR44SI1TP/21LuMWwEpf6lqvcR0eVjA3qvbCE5tHXasQNUS0Eo2yRRxHxTQ4ooBGVsaPHxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447554; c=relaxed/simple;
	bh=4Ok/dKtwK24/8nMCExhrbdONHBYDN9jELUfWl1CWXfw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Bb4sSXT7G/6rk3vVQiS+h1yXDaxIhPpN1vMNo2ni5TDScAFtOZbAdwnHJy4zNxA6wuBAAZUWGdozJaEFFe7hTWsjjQfM7c8v/ZR51tEMYnEvaRniv2PW5fyyC2yxFnk2aw4nTSrRUaLPn2OscW6SKQMmOw8HI8Plx+QCxtd4E9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lOQ7Z3C2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lOQ7Z3C2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AAF1F000FF;
	Tue, 15 Sep 2026 04:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789447545;
	bh=CWfnwtiOqRQpazb4eagRsya+YdnRLD3ji/zph1Z7bb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lOQ7Z3C2F8EGAK2Qzvxu0kNjJZekdu+JskmrEoEgP4JZ8TGfyMK4NruuQjzdTXFf0
	 DLRGMXvNw71yYGn2kNs6Y/EfZu58mvGhqBTZjieyvDtYJvb0Wr2qxa1MoOErD64k3+
	 71i7URCKWAHiaJNsysblPiD9MuwnzydUVFDsnwXM=
Date: Mon, 14 Sep 2026 21:45:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zhiling Zou <zhilinz@nebusec.ai>
Cc: linux-kernel@vger.kernel.org, kyungsik.lee@lge.com, vega@nebusec.ai
Subject: Re: [PATCH 0/1] lib: validate in-memory LZ4 chunk length
Message-Id: <20260914214544.071700ae78d44ca276bb3b44@linux-foundation.org>
In-Reply-To: <cover.1789219453.git.zhilinz@nebusec.ai>
References: <cover.1789219453.git.zhilinz@nebusec.ai>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Sep 2026 21:32:16 +0800 Zhiling Zou <zhilinz@nebusec.ai> wrote:

> Hi Linux kernel maintainers,
> 
> We found and validated an issue in lib/decompress_unlz4.c.

Thanks.

> The bug is
> reachable by a root user through kexec_file_load() with a crafted
> external initrd.
> 
> We've tested it, and it should not affect any other functionality.

OK.  I don't feel that a cc:stable backport is justified for this.  If
there was (or even might be) a non-root callsite then yes, backport it.

Do you agree that these:

hp2:/usr/src/linux-7.3-rc1> grep -rl unlz4 .
./lib/decompress_unlz4.c
./lib/Makefile
./lib/decompress.c
./scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py
./include/linux/decompress/unlz4.h
./arch/parisc/boot/compressed/misc.c
./arch/mips/boot/compressed/decompress.c
./arch/s390/boot/decompressor.c
./arch/x86/boot/compressed/misc.c
./arch/arm/boot/compressed/decompress.c
hp2:/usr/src/linux-7.3-rc1> 

are the only callers?


