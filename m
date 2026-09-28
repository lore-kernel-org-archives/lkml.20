Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86074EB86C;
	Mon, 28 Sep 2026 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616250; cv=none; b=oiQKCKP24hygFMDbfvlUSSrIu9LXvxFcXKn/kjTWCtcPLqblxUkyX25Y5NT08YzkM7F9wtuf+pKnx1mNtl/RNOEdFEw1GRrlI0+wFhsRy0W4AkSthU+j6F0hUWrHFUtr/aKRimI6r8OkkhrPijj3hQNfkiyY4OwMmVfO48s9Kj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616250; c=relaxed/simple;
	bh=LvIkHlxbIjbbmcyGr04hQLnB7x9SDj6PnN1XwEsumv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdxNZZJTzrGbNg+5KGc+Xf9kJZ908j7pZx2Qac2cxtmGD3TZg9QiIeCB2Yqzxp0aZvv02YPhhCJOdEeZcpmFk04MU0faATb/maJFwtluhJVB12Fhdr83a1xO54s0366M0bNclp6KcdqYLQrnp9HZHVbL4/XrG1yMbcD9gLfXfYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=n9ARMlE0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n9ARMlE0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=60pwW9yS4wtzthlp9Mp9xvvjcoaCNvFlVONGyf4pqLY=; b=n9ARMlE0MSx65lhXYyIkB+7/t4
	QBbo/L6lYFgMkXifniWRSizeJNzPPlsIDQBlk8bRvRiPQox7LmLZLGpkKMyO6dLA2BWsDQBGefyRB
	kb0sAbEq1sP4wx+Zq8gro9suaSFmaedXVhnjAvvus2ysdvesahcPdL/MSmmcW9+LAdN4dNBMdID9V
	xHggVUsPNmk2nfCyjLUcE1NZ/d+356iIGHaQOHZ31f1zzTXGzjEYlCnhv5h8yTwTtgwLK+x13aWvt
	xdHN4D7AU/5mFZ2SoD4YN19YuzpeEi1TEdZfC6rdHZZmy3fXqeqDgMKR82Xh+U4gJJu9d6GP75tPG
	Wqc9suYQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF52-000000019bA-2zoW;
	Mon, 28 Sep 2026 17:23:56 +0000
Message-ID: <c3eeaf92-b1a3-401d-8ece-4f3d513c0b42@infradead.org>
Date: Mon, 28 Sep 2026 10:23:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
 peterz@infradead.org, elver@google.com, bvanassche@acm.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, kees@kernel.org, tudor.ambarus@linaro.org
References: <20260925234054.128477-1-emmaonana18@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260925234054.128477-1-emmaonana18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/26 4:40 PM, Omokefe Emmanuel Onanaroghene wrote:
> kernel-doc fails to parse struct declarations wrapped in
> context_lock_struct(), e.g. struct debugfs_cancellation:
> 
>   include/linux/debugfs.h:245 ... error: Cannot parse struct or union!
> 
> Add a struct transform that expands context_lock_struct() to a plain
> struct declaration, and apply the struct transforms to the whole
> declaration before split_struct_proto(), matching what dump_var() and
> dump_function() already do for their prototypes. The member-only
> transform in dump_struct() is then redundant.
> 
> Add a regression test for the debugfs_cancellation declaration.
> 
> Fixes: 6e530e2e3119 ("debugfs: Make debugfs_cancellation a context lock struct")
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  tools/lib/python/kdoc/kdoc_parser.py  | 11 +++++++----
>  tools/lib/python/kdoc/xforms_lists.py |  1 +
>  tools/unittests/test_kdoc_parser.py   | 26 ++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index d9ad1ddc87dd..80d4245acd17 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -831,6 +831,13 @@ class KernelDoc:
>          #
>          source = source
>          proto = trim_private_members(proto)
> +
> +        #
> +        # Expand macro-based declarations, like context_lock_struct(),
> +        # into a plain struct/union declaration before splitting it,
> +        # as dump_var() and dump_function() already do.
> +        #
> +        proto = self.xforms.apply("struct", proto)
>          struct_parts = self.split_struct_proto(proto)
>          if not struct_parts:
>              self.emit_msg(ln, f"{proto} error: Cannot parse struct or union!")
> @@ -841,10 +848,6 @@ class KernelDoc:
>              self.emit_msg(ln, f"expecting prototype for {decl_type} {self.entry.identifier}. "
>                            f"Prototype was for {decl_type} {declaration_name} instead")
>              return
> -        #
> -        # Go through the list of members applying all of our transformations.
> -        #
> -        members = self.xforms.apply("struct", members)
>  
>          #
>          # Deal with embedded struct and union members, and drop enums entirely.
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index e3dda2fe8a53..9f2c750a811b 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -62,6 +62,7 @@ class CTransforms:
>          (CMatch("struct_group_attr"), r"struct { \3+ };"),
>          (CMatch("struct_group_tagged"), r"struct { \3+ };"),
>          (CMatch("__struct_group"), r"struct { \4+ };"),
> +        (CMatch("context_lock_struct"), r"struct \1"),
>      ]
>  
>      #: Transforms for function prototypes.
> diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
> index c4a76ed13dbc..4baa78ca02b3 100755
> --- a/tools/unittests/test_kdoc_parser.py
> +++ b/tools/unittests/test_kdoc_parser.py
> @@ -418,6 +418,32 @@ class TestSelfValidate(GenerateKdocItem):
>          """
>          self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
>  
> +class TestContextLockStruct(GenerateKdocItem):
> +    def test_context_lock_struct_declaration(self):
> +        source = """
> +            /**
> +             * struct debugfs_cancellation - cancellation data
> +             * @list: internal, for keeping track
> +             * @cancel: callback to call
> +             * @cancel_data: extra data for the callback to call
> +             */
> +            context_lock_struct(debugfs_cancellation) {
> +                struct list_head list;
> +                void (*cancel)(struct dentry *, void *);
> +                void *cancel_data;
> +            };
> +        """
> +
> +        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
> +        patcher = patch('builtins.open', new_callable=mock_open,
> +                        read_data=dedent(source))
> +        with patcher:
> +            _, entries = kernel_doc.parse_kdoc()
> +
> +        self.assertEqual(len(entries), 1)
> +        self.assertEqual(entries[0].name, "debugfs_cancellation")
> +        self.assertEqual(entries[0].warnings, [])
> +
>  #
>  # Class and logic to create dynamic tests from YAML
>  #

-- 
~Randy
