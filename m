Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D932165EA;
	Wed, 30 Sep 2026 00:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790728174; cv=none; b=cbRV6xmahdwFeTAtJ5d/acjB0TnUxOz6W0kV2iuJ5TFMWIsZ6fcG5pkhWJppuz2KAeQ52UyZ14mGHwYWTOZK/v82uzOXNJlyw9ezA3BLbFGtHHgLFxK9Hj40CgY5qtyJZvW6yZIhPcRt4JfxVAQqkT/6QPCWo1uJA63p3Ell1KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790728174; c=relaxed/simple;
	bh=vbll7qC4Nmh7EKoumfj3br3jNAAsP6izSlVgIlopEkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BH/MhvXA5wO7B5hVWFtl+AIE5/NNcTJ73fNOsMFcMREcCl2Z7p1Ppd3CD0B62LnecuZWBsTA7cpKHaBlnu+iCuSQO+NKMy/MzkXlQ37LCf3tIjpdhycYe6v0ssY+6ngUzq8Tu8w3E9nBpErMIVPH7wUIkn845gBWg7nG4vOE6MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=peM3sMMu; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="peM3sMMu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ahPhAQkCfSyZ/hTYflZfPypDdJtLyf5LfLIC6RVfRTM=; b=peM3sMMury3bw+vPcqjuQSzbEa
	9hspIdEa6U/KPAL2CU3STAmXGHmkiY69gkFqyKhzITmcPsUJAzfz4l8rmfN6ZOJhyFV0YUGw6bdKM
	iZLaxhU5a8G5QYzCmDZZGPnk6G8HLOOWHI3BTgE0/erai9qaRc1JO+Fv3FejgboBVCtvgt9ox/gAg
	Ps7KsjC89kpHFw8oekHcs56VktMPc01jT7FR3Bx8bV9peHblUWzZcKoSojhYj+TNfKNHPBXeXrlji
	DGGbfSnLKwi2M+W0nEXciCF6ZotIhweqxlfXD0Q8T7Cd+slopxyZq8Z0xvm8j/Z1u/IeZcJjL+Ibo
	26VIz2RA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBiCH-00000004oyl-0dEZ;
	Wed, 30 Sep 2026 00:29:21 +0000
Message-ID: <ef6f0d64-fb3c-492e-a70f-ab97ff462969@infradead.org>
Date: Tue, 29 Sep 2026 17:29:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc_output: don't add a man page tail for
 filtered-out symbols
To: simonsudarushkin@gmail.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929-kdoc-man-filter-v1-1-5f70268885d1@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260929-kdoc-man-filter-v1-1-5f70268885d1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 9/29/26 6:36 AM, Simon Sudarushkin via B4 Relay wrote:
> From: Simon Sudarushkin <simonsudarushkin@gmail.com>
> 
> ManFormat.msg() appends the "SEE ALSO" tail after every call to the base
> class msg(), even when the -e, -i, -s or --nosymbol filters dropped the
> symbol and nothing was written for it. With -s, every other symbol in
> the file leaves a stray "SEE ALSO" block behind the requested page. With
> -e on a file that exports nothing, the output is only such blocks, with
> no .TH header at all:
> 
>   $ tools/docs/kernel-doc -man -s string_get_size lib/string_helpers.c \
>       | grep -c 'SEE ALSO'
>   13
>   $ tools/docs/kernel-doc -man -e include/rdma/ib_mad.h | grep -c '^\.TH'
>   0
> 
> Only add the tail when the base class produced a page, and add unit
> tests for both cases.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/fc7978bb-a71f-456d-84bb-670c8f0426ed@infradead.org/
> Fixes: 104e0a682e12 ("tools: kernel-doc: add a see also section at man pages")
> Assisted-by: LLM
> Signed-off-by: Simon Sudarushkin <simonsudarushkin@gmail.com>
> ---
> Randy, this takes a different route from your patch in August [1]: the
> out_tail() call stays in ManFormat.msg() and is skipped when the base
> class produced no page, so OutputFormat does not need to know about it.
> DOC blocks that are shown keep their tail, since they get their own .TH.

Yes, I had already abandoned that patch and its approach. I was (slowly)
looking at doing something like this, although probably not as succinct
as this.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> 
> [1] https://lore.kernel.org/all/20260816054826.3988516-1-rdunlap@infradead.org/
> ---
>  tools/lib/python/kdoc/kdoc_output.py |  5 +++-
>  tools/unittests/test_kdoc_parser.py  | 52 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
> index 618b0d765ef5..659a2c6fb6be 100644
> --- a/tools/lib/python/kdoc/kdoc_output.py
> +++ b/tools/lib/python/kdoc/kdoc_output.py
> @@ -763,7 +763,10 @@ class ManFormat(OutputFormat):
>          Add a tail at the end of man pages output.
>          """
>          super().msg(fname, name, args)
> -        self.out_tail(fname, name, args)
> +
> +        # Symbols dropped by the output filters produce no page
> +        if self.data:
> +            self.out_tail(fname, name, args)
>  
>          return self.data
>  
> diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
> index c4a76ed13dbc..bcb1b1a5ccc6 100755
> --- a/tools/unittests/test_kdoc_parser.py
> +++ b/tools/unittests/test_kdoc_parser.py
> @@ -301,6 +301,58 @@ class CToMan(unittest.TestCase):
>          self.assertEqual(result, expected)
>  
>  
> +class ManFilterTail(unittest.TestCase):
> +    """
> +    Symbols dropped by the output filters must not leave a man page tail.
> +    """
> +
> +    source = dedent("""
> +        /**
> +         * foo - First function
> +         * @a: an argument
> +         */
> +        int foo(int a) { return 0; };
> +
> +        /**
> +         * bar - Second function
> +         * @b: an argument
> +         */
> +        int bar(int b) { return 0; };
> +    """)
> +
> +    def setUp(self):
> +        config = MockKdocConfig()
> +        kernel_doc = KernelDoc(config, "mock.c", CTransforms())
> +
> +        with patch('builtins.open', new_callable=mock_open,
> +                   read_data=self.source):
> +            _, self.entries = kernel_doc.parse_kdoc()
> +
> +        self.out_style = ManFormat()
> +        self.out_style.set_config(config)
> +
> +    def run_filter(self, **kwargs):
> +        args = {"export": False, "internal": False, "symbol": None,
> +                "nosymbol": None, "function_table": set(),
> +                "enable_lineno": False, "no_doc_sections": False}
> +        args.update(kwargs)
> +
> +        self.out_style.set_filter(**args)
> +
> +        return self.out_style.output_symbols("mock.c", self.entries)
> +
> +    def test_symbol_filter(self):
> +        """Only the selected symbol gets a page, with a single tail."""
> +        result = self.run_filter(symbol=["foo"], function_table={"foo"})
> +
> +        self.assertEqual(result.count(".TH "), 1)
> +        self.assertEqual(result.count('.SH "SEE ALSO"'), 1)
> +
> +    def test_all_filtered_out(self):
> +        """No exported symbols: no output at all."""
> +        self.assertEqual(self.run_filter(export=True), "")
> +
> +
>  class CToRest(unittest.TestCase):
>      out_style = RestFormat()
>      config = MockKdocConfig()
> 
> ---
> base-commit: 4f041d7b65b8007403cce30ecf69ad42d48ec315
> change-id: 20260929-kdoc-man-filter-eba1ff857dad
> 
> Best regards,
> --  
> Simon Sudarushkin <simonsudarushkin@gmail.com>


-- 
~Randy
