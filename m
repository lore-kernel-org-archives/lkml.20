Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445036;
	b=D0vX+x+Wy+OF7Up3RGP32ZlWvCcjkanGuecKAF89rAV87OP6p4RF1GgItQA6Fe5RiMlk
	 c7ouCVQXDkErhPQzZ1fg6GJXjSeyVXSKLWqB1DpyQ8Hggwnkqgx1gWynrr0kxOUZNfAsM
	 4z/1ddSX5XJiBkUsCJqudhWwkpUcRu7EjzF9E3m8L6rMDoNKFVPo1vM75R85FRoVW0lSP
	 Rrt3prDpDo8zfOGW6urm5rAP4qsgxm3n3Y/XUHfIOmQ5WkGDw4qXswRPSYyoAgeJnlNxR
	 9bi98OJu8z+h538qU5TSVTKnUVcd0etzeQiWbuljf8Dj3cA8xa0qjIDrUdzj+Ej7A9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
	b=Dp7JXpHAgOqxTDKwKwEjXIvFmolrME/P/WdTqA7IYH2kOKwTmJFMLeiyDEz+8H7DCee+
	 0m2wi/56TWja5QoRQXXkuWb9BJTzxkAIpkupNdQ/uVgxyjFsKfdQTtny1z4I392vDMGat
	 /Fj9GluDZsWwdHkqXifpCx7kp6jxiO6jvsFnTa+aLskAmi9Y2RmsTkiEPQhw/q4DSmPMU
	 3eI/XNtGeOz3fjIUXMiJlua3RGdcWdCISuBmrAonNl+8FR8jSAPRs2N4hU01XLCnTHiQj
	 xUve/XBb6/VBp6HJzmV5VIFLXYRn5924XrOpkoqjn5+1MsVwlcjzhvcLDxgGgTP+HSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbgRnpKc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683A606A322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D683A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbgRnpKc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so973125e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445034; x=1793049834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=QbgRnpKcUz5rTSFrEESh5eGT4y6PY7bom6NOx7auUnO7JaG1IdgdlXTORoqwQwTUVZ
         paLiWbCPnIkUlP2WyWm/gm47nVIRU2Ev49y74gvdWyxeH0MtTlufn1qZPQQ2JAyJS4JH
         PzH1erZ+3nm2MzBK2VUyzvt9RfA16RkA5XFXo5ZJZg75/VJqME4FmXvtbEiGL8vWvjR7
         726pdggKUNcM3ljju89kYhWEn3AXo9yr0EpEg4uEJrCOkxvKgs1LACyajP2SJOUjIbgF
         Axdj+2fLUkk0zHx+SEUVTEr2K7IWdEsXxzJLv2pXmHltXTE5WWk1e+bKwyCcUAA/5wML
         KNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445034; x=1793049834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=B2r7hL49N19ln/pXgtrgbYWE+d8o4vM2lNH1J5zELvr7t7MGe3a6GBhIcDmaokKXXU
         hMiq2jFqh+msICpmlQuWnWLFai648YDpZH6sMJSJjO9o/lm+bycgPjY+9ybi5Z3eCCJp
         N2mTC6OwLHmy0dSHs1+R37VzaibVB6jzwgeuuTLjO/98LoqqO/1cfWhXL5LIWO/uoIE7
         TV1AzImYSh/KaM3kRQC1Z2X/gkIvwwYQdgWhO0TL1PMP5p967RqeduQGL80aKITqfK8U
         7Ckds3v2UyNZLCmgsZRAnXFcaFDJ4jxxTWvuY6NpydNorMXz1hz7xLG5QYTfe8Pb03Im
         gUWA==
X-Forwarded-Encrypted: i=1; AKwUvByFKPAyxwn1TkeY+lm3jRqzAN/y4zyNd733EN510ST4WEAVRZBWP2a/A2SLaRTxGYxSe42TGFJQHubEtQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdbMZmHAgwDn7NI9qWa4+yXhIC2oESqRY576VR4BD9kr9aVtou
	tL0ztDzMoAdr0mvZwF+IE+PtVWoPFfvyWcAgfyB6VTqdQCUMxFPYWOrN
X-Gm-Gg: AYBFou2U30G+tva08OT01sQ/oIQzQAY8jIzt/XFSa+ZOu8qzJjeFgY5AtVbpSZPd5Px
	sQEWmeTqd2kPNk0MHgQbBXaEziR8i5OtfmhtdKy8g8f5ipqczqmVIkueTO1rHqW92IGICg2uObF
	U8gLQwWNWjIXBaY83ldEowPuFE3AcVeiqtmSRk1qqzHDTrnlHvH8zrrdmVxb6/EFMFgsgeD154p
	VpzBsqPbdCum4NKdnhNNlQITH7ui72jWhno3hzp4ZZ0H0dMUnZGD8vmKdnHiYnes0DPEa8Td4f9
	Dmr6g5a2ldyMm6OO2YiKCa9bfPv9L9RBlDXu13xzHqG2vkDztzaJ5HsrWSKBm4QFs5fGUxMHvlF
	1JFC4F0U7WlbOlIiR2BwNg5S0qeaPNxJsVr+gCQtezehTWeD6gAq06KCOkfUOlXuM0fUN6VrA4j
	fzWeUYZMdAHJkt5D/LNq0+NZu6Lh3oVEnrDH3H7fNP0U95tDlGrL0XBf5bICIkKUbGtrAhDUlcR
	Lc5AOVZh9ouyCpVc0tO4P+B67zC8OcGsOqrl492f48VHg==
X-Received: by 2002:a05:600c:e549:20b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1d7624601mr116807835e9.26.1792445034012;
        Mon, 19 Oct 2026 14:23:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e2def9ecsm97956265e9.1.2026.10.19.14.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:23:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:23:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output
 file size
Message-ID: <20261019222351.64bb9d35@pumpkin>
In-Reply-To: <202610200336.6v4SE96n-lkp@intel.com>
References: <20261018155206.132411-15-david.laight.linux@gmail.com>
	<202610200336.6v4SE96n-lkp@intel.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 03:50:35 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-15-david.laight.linux%40gmail.com
> patch subject: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output file size
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200336.6v4SE96n-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> scripts/kallsyms.c:371:26: warning: adding 'int' to a string does not append to the string [-Wstring-plus-int]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ~~~~~~~~~~~~~~~^~~~
>    scripts/kallsyms.c:371:26: note: use array indexing to silence this warning

Hmmm it gives the same error for (!i + "string") even though that doesn't even look
like a broken attempt to append to the string.


>      371 |                         printf("\n\t.short\t" + !i);
>          |                                               ^   
>          |                                &              [   ]
> >> scripts/kallsyms.c:371:11: warning: format string is not a string literal (potentially insecure) [-Wformat-security]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ^~~~~~~~~~~~~~~~~~~

The compiler ought to do better there...
Indeed, gcc does.

...
>    366		output_label("kallsyms_token_index");
>    367		for (i = 0; i < 256; i++) {
>    368			if (i & 15)
>    369				printf(",");
>    370			else
>  > 371				printf("\n\t.short\t" + !i);  
>    372			printf("%u", best_idx[i]);
>    373		}

I knew I should have interleaved putchar() and fputs() with the printf().
They are somewhat faster - in this file it is measurable.
gcc does convert printf() to putchar() or puts() but not fputs().

The time taken to write the files halves if I initialise an array with all the
",%u" values and use fputs(str[byte_val] + !comma).
I decided someone would object to the mess.

I'll think of something for v3.

David

