Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E63C4ACC74
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226771; cv=none; b=ScYSWYVn3LT94TjNdVQtVQAOzKkSPH3tld53WaWxNwyEd+cTzHAYJ2D7iyjdA/JDjoU1J6tTjeHEoWCFT/aK7VUmY11cBeSzhi9jXcF/zc42Gc/2Ehs1gPrE//IfcfePVx9rBQ4EN+rCn3uNmIxB7GPLlfQ4Q+1zBU4Uzp/VfGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226771; c=relaxed/simple;
	bh=8pdq74OFUcFbwCY2vfjAnXHHNQ7Gi23X78FCuJbWb2w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzYP/nJkgrANvlesxRlx4d4L0GwJJjiUmLD4eTBCggiSAMKuFlVOEmH2o8X/O9AvSGOufA5rLinhEYmlktgkWlGzcXyko+bXpu3AMvHdnyr7TH8IZZhADrdD0RCABb81BSUVrbWsML+EqjEGE83saYu2mXihkw0DuUq34GKFFSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vtf9AxjQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vtf9AxjQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15409855e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226767; x=1791831567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjWk17xMOqAGBvq+UzGL4BAHrsvqnOVZTs3C72lVXp4=;
        b=Vtf9AxjQZdb+g3Z9dRO0CaZnpXz9i8lp9+ajlbKAf9fPFd2LC6aPn3Ytrhi+FRopt0
         zxcDa/hQXISB3RrOgFMqdu6wXzKQOpCZiZqOViHasHYXl+saZ1O1AKPQetGYzgNGCwRQ
         y+NlWuazfIdEGRpTN7X/IgLnBD2SvwuWG3cqxbZyWxYyJKrQ7OH21l585t+SDYxuPHgv
         NANpMEHjmcPR1cDFtkiPPIwHZYbpBGuEsd9da9SDXqjis5XcfBBZ9dPdffPHGrEqaoZh
         /nV1GQh3XnHim6ocKSV77KTTCDnkl9Va8hgWoHGdbDzl3ELsLVOi/MU6uM05aQfhTrZO
         cJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226767; x=1791831567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjWk17xMOqAGBvq+UzGL4BAHrsvqnOVZTs3C72lVXp4=;
        b=O59YYcPX0xvyJEKCSQ4ZXBs+w5Peld6neqD4ZvoWiGebJZJc3q30G+RqCPx8/TI5Nb
         D9dNQOZF9KQFm9nyfceKDJRCSkt9hcGbAZCYl0RMw/v5ElJBuIbku+JL/eXB3tBzachL
         FOpO7drN0QPR7ogI31ndw0X42JT+bp+XTvyFnwad+sBFgla4aPjdsVx86QNIuszNO5Kx
         OHHf9bAq8OGDCPOjlo/jAHe/BXFZaxxcs4DX7gfho/ndz5tRDjicIAyTaeZCZ0yf1BRR
         MevJrpWA5FvN15H0rrwC1e97QYp2Qt75mx2XrsR0amEIydgdlT30lALjtUGBo6BXKxcJ
         w7xA==
X-Forwarded-Encrypted: i=1; AKwUvBxLxsiwEa3Pm2eZJPg3zS3uRTUe4b2boJwFlE9dVtIXTmMQyNVXDlAezwI5/BC/tsf/4dGuRHqS+nsSIzY=@vger.kernel.org
X-Gm-Message-State: AFuF++kG78yLQc8BWxEKrEXPC3mBApDbIncDP9W4IdR7ojjYg3zaHzpG
	yr08CYmkTHsXPvllc4TfvqvjAwVeTZ/n0nrQUAa94XsvxMIuHGUMP1Bp
X-Gm-Gg: AYBFou1OeEVABv5dGxsfo1bXoXm+11LB7XJYzAo++OHUgCqIP2k83v/LoReQlW2gqS6
	UGHA7seqhqHVgVntrqzVpB6OC1BSk9y/mTnB65xV1aaVphfE6ZWCP3VX+ygmefw1XWHov5yaWdy
	5+MC4/rpHL4VynB1euXXI5AH0/+Xw2rWFWvyXJfl0KWGK5b+xWBR6lMEyPHmwxPYEz+w88qUM8w
	AITPClWW1I0J2KV22zTvRAV58LeLptBC9pKt978vNokbCUruEToZhANJxsNI03KVoNThjfrNwAR
	oeCsVxpWVGwFYXmGwI6PBIt3tfgjjEmhSXJyLKk9G/oOLUCgElnVe506ghSf2mHYVASdM95mcfv
	+TQHPcG6yj1ea/C7onlsFZgr4nEbWQdrZuLGxtTL/kdcaZEzijNu4bh+iybF0prNO0Vqb7wui36
	IoD36M3FQlmOfQrZqlJiKi0EJD3A+Y0EbPsxXZ7BNiwOwg0kErhv8eycoH0W3khBb/Awgomcek1
	z67nykSmlr0cR9Kv/C4DbMkQOPeR5NLTiIHLlIQcyYMew==
X-Received: by 2002:a05:600c:8b78:b0:4a1:74a1:7ecc with SMTP id 5b1f17b1804b1-4a174a181f9mr42335315e9.1.1791226767287;
        Mon, 05 Oct 2026 11:59:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53997sm16562205e9.12.2026.10.05.11.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:59:27 -0700 (PDT)
Date: Mon, 5 Oct 2026 19:59:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Bill Wendling <morbo@google.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, David Gow
 <david@davidgow.net>, Jiri Kosina <jikos@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Shuvam Pandey <shuvampandey1@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 05/12] seq_buf: Clear what a writer did not claim
 when a seq_buf overflows
Message-ID: <20261005195926.09e240d9@pumpkin>
In-Reply-To: <20261005155708.1471260-5-kees@kernel.org>
References: <20261005155653.late.426-kees@kernel.org>
	<20261005155708.1471260-5-kees@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  5 Oct 2026 08:56:55 -0700
Kees Cook <kees@kernel.org> wrote:

> Using seq_buf_set_overflow() would leave the bytes between "len"
> and "size" untouched, so if seq_buf_str() is used on an overflowed
> seq_buf, those bytes may be exposed. For any paths that don't claim
> partially written bytes, by setting "len = size" before calling
> seq_buf_set_overflow(), wipe the unclaimed bytes. The seq_buf_puts()
> and related APIs already claim those bytes now, so only the unclaimed
> cases remain. A specific example of this was seq_buf_path() which uses
> d_path() and would write to the tail before discovering it was out
> of space, and would correctly mark a seq_buf as overflowed, but the
> path fragment would be left over.
> 
> Clear from len to the end of the buffer in seq_buf_set_overflow(), which
> every overflow goes through, including seq_buf_commit() with a negative
> count.
> 
> Add a test that fills a seq_buf, leaves it too little room for a path, and
> checks that nothing of the path is left in the buffer. The tests run before
> anything writable is mounted, so it takes its file from shmem.
> 
> seq_buf_path() was not exported, so the test failed to link as a
> module. Export it.
> 
> Tests passed under qemu on ARCH=x86_64 with GCC 16.2.0 and CONFIG_KASAN=y,
> and on big-endian ARCH=s390 with GCC s390x-linux-gnu 16.2.0, and the
> test builds as a module (CONFIG_SEQ_BUF_KUNIT_TEST=m).
> 
> Assisted-by: LLM
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  include/linux/seq_buf.h   |  8 +++++--
>  lib/seq_buf.c             |  5 +++++
>  lib/tests/seq_buf_kunit.c | 44 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/seq_buf.h b/include/linux/seq_buf.h
> index 77e76e283370..0c0a0db04b09 100644
> --- a/include/linux/seq_buf.h
> +++ b/include/linux/seq_buf.h
> @@ -5,6 +5,7 @@
>  #include <linux/bug.h>
>  #include <linux/minmax.h>
>  #include <linux/seq_file.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
>  
>  /*
> @@ -58,12 +59,15 @@ seq_buf_has_overflowed(struct seq_buf *s)
>  /*
>   * Mark @s as overflowed, which discards the length of what it holds. The
>   * bytes up to its last one are the string from then on, as that is where
> - * seq_buf_str() terminates it, so a caller that could not fill the buffer
> - * has to NUL them itself before calling this.
> + * seq_buf_str() terminates it, so clear whatever was not written: a writer
> + * sets len to how much it filled, and anything past that was never adopted.
>   */
>  static inline void
>  seq_buf_set_overflow(struct seq_buf *s)
>  {
> +	if (s->len < s->size)
> +		memset(s->buffer + s->len, 0, s->size - s->len);

What is the performance impact of zeroing the buffer?
I don't think it would be a good idea to be zeroing the buffer on entry
either (I've not looked to see it that happens - but there will be PAGE_SIZE
buffers (maybe 64k) that get a a small number of characters written to them).
Writing a single '\0' really ought to be enough.

David

> +
>  	s->len = s->size + 1;
>  }
>  
> diff --git a/lib/seq_buf.c b/lib/seq_buf.c
> index 60e9eadb3ef7..8da2e9447adf 100644
> --- a/lib/seq_buf.c
> +++ b/lib/seq_buf.c
> @@ -76,6 +76,8 @@ int seq_buf_vprintf(struct seq_buf *s, const char *fmt, va_list args)
>  			s->len += len;
>  			return 0;
>  		}
> +		/* vsnprintf() wrote as much as fits, so none of it is stale */
> +		s->len = s->size;
>  	}
>  	seq_buf_set_overflow(s);
>  	return -1;
> @@ -164,6 +166,8 @@ int seq_buf_bprintf(struct seq_buf *s, const char *fmt, const u32 *binary)
>  			s->len += ret;
>  			return 0;
>  		}
> +		/* bstr_printf() wrote as much as fits, so none of it is stale */
> +		s->len = s->size;
>  	}
>  	seq_buf_set_overflow(s);
>  	return -1;
> @@ -343,6 +347,7 @@ int seq_buf_path(struct seq_buf *s, const struct path *path, const char *esc)
>  
>  	return res;
>  }
> +EXPORT_SYMBOL_GPL(seq_buf_path);
>  
>  /**
>   * seq_buf_to_user - copy the sequence buffer to user space
> diff --git a/lib/tests/seq_buf_kunit.c b/lib/tests/seq_buf_kunit.c
> index 046614100c77..5eaf024fa3a5 100644
> --- a/lib/tests/seq_buf_kunit.c
> +++ b/lib/tests/seq_buf_kunit.c
> @@ -7,7 +7,9 @@
>  
>  #include <kunit/test.h>
>  #include <linux/console.h>
> +#include <linux/fs.h>
>  #include <linux/seq_buf.h>
> +#include <linux/shmem_fs.h>
>  #include <linux/string.h>
>  
>  static void seq_buf_init_test(struct kunit *test)
> @@ -466,6 +468,47 @@ static void seq_buf_do_printk_test(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, seq_buf_printk_empty, 0);
>  }
>  
> +/* Long enough that it cannot fit in the room the test leaves for it. */
> +#define SEQ_BUF_TEST_PATH	"/seq_buf_kunit_path_name"
> +
> +static void seq_buf_path_overflow_test(struct kunit *test)
> +{
> +	DECLARE_SEQ_BUF(s, 32);
> +	const char *expected = "keep:xxxxxxxxxxxxxxxxxxxxxxx";
> +	struct file *file;
> +	size_t len;
> +	int i;
> +
> +	/*
> +	 * The tests run before anything writable is mounted, so take the file
> +	 * whose path gets printed from shmem, which needs no mount of its own.
> +	 */
> +	file = shmem_file_setup(SEQ_BUF_TEST_PATH, 0, EMPTY_VMA_FLAGS);
> +	if (IS_ERR(file))
> +		kunit_skip(test, "cannot create a file to print the path of");
> +
> +	/* Leave less room than the path needs, so d_path() cannot fit it. */
> +	seq_buf_puts(&s, "keep:");
> +	len = seq_buf_used(&s);
> +	for (i = len; i < 28; i++)
> +		seq_buf_putc(&s, 'x');
> +
> +	KUNIT_EXPECT_EQ(test, seq_buf_path(&s, &file->f_path, "\n"), -1);
> +	fput(file);
> +
> +	KUNIT_EXPECT_TRUE(test, seq_buf_has_overflowed(&s));
> +
> +	/*
> +	 * d_path() keeps as much of the path as fits when it does not fit
> +	 * whole, and seq_buf_str() would hand out that fragment, as it ends
> +	 * the string at the last byte of an overflowed buffer.
> +	 */
> +	for (i = 28; i < 32; i++)
> +		KUNIT_EXPECT_EQ_MSG(test, s.buffer[i], '\0',
> +				    "byte %d past the data is not cleared", i);
> +	KUNIT_EXPECT_STREQ(test, seq_buf_str(&s), expected);
> +}
> +
>  static struct kunit_case seq_buf_test_cases[] = {
>  	KUNIT_CASE(seq_buf_init_test),
>  	KUNIT_CASE(seq_buf_declare_test),
> @@ -482,6 +525,7 @@ static struct kunit_case seq_buf_test_cases[] = {
>  	KUNIT_CASE(seq_buf_puts_partial_overflow_test),
>  	KUNIT_CASE(seq_buf_putmem_partial_overflow_test),
>  	KUNIT_CASE(seq_buf_putmem_hex_partial_overflow_test),
> +	KUNIT_CASE(seq_buf_path_overflow_test),
>  	KUNIT_CASE(seq_buf_do_printk_test),
>  	{}
>  };

