Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780320;
	b=W1s5Vy/eqbrx4CINncPeiM2SE97w67p86IIfGjawfq3gWqE4R2WfLQEmNtu/7Vdv/9HP
	 +tR3YTp0cbwrs1oUE3zf5mwmx2hHiXPKEWnHhPZK6W/GXJaDOsUMLAa/QgHWTCNN1XbwH
	 X4RqhI2bX7Z2TsMB/TN9iKwmbT8BPi44hgMieu3d5pDPwAebru3xXibC6OeocLEnIrLIi
	 a/5bd1oztVx/LCHWgKaqP70ZR3dnK+d/z/4lmwA4t8BS/Ws2maMMeZ8ur6feE+sZd9rLd
	 1QHn20tiLL/wPN4PyExsj7C3WhC6WU+nVYGqrMFX5wzenal5LgJbAt3VlDWvJwIwBnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CN9AKgF/hWkL3empD3c/LQ8/9rcmhykYPSIjXEPK8gw=;
	b=D823Attp4PgWfzGr+5Aw8pxfQ/w6phlAwBBBL/fwJGcmdKYwIkk4tRaXsCjQezahfW+4
	 ZLNSLiUGTr6X6eG01jshmD0OJgGMH2Xg4KWf22acp8nV4wSznyqN2QjPlSIQa7ERUUKn5
	 mvBltK32okuxFL9Jt7Xc3lAU0Il+ZFDPdoIhwfF+Mt0tck9EW0D4wo3Jot4MCQKYqHSAd
	 y56mBXm8B5gB2h1v+Uo/7q8jEI4sa0DpJv3WYs8srsfhkNXWPwBZahTAfpx4O3gRoiJ6Q
	 qeWEqr2F/TDh1bnDM9wzWnWVn4dSdnpy1g3unVtoYIcIdxALe6DvQc84YcjCEyBYzcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdc3kRZG;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6849E606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6849E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdc3kRZG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490f38e9688so1914144f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794780318; x=1795385118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CN9AKgF/hWkL3empD3c/LQ8/9rcmhykYPSIjXEPK8gw=;
        b=tdc3kRZGgUfFdBpnCdMHtajXuF+a0jfLik8/ck/vZ/XjfT9jIMPs/l03UlKCOSqvum
         jSWFLk5CDpil5SkMkL0JcozqIzrRZ8gPt7T1zloEdJimEUGpsFzR3f66Z6omzGGDD1Z0
         AYkCaz77QXWDH6Y8EOK1j7so2l492RsbpFFZcd0kggQJO/jCad4yxO3gRSbZSRoM6XHX
         H6Na0/qCMuiQUvhDOk8kk6pJpzfTQwcY/+j+Erqhd6xRq7EV4JU6VnkUW42PS2CY9RzG
         leg9wrl6bDm4VdEGBbgxhDNGrSY32tmE7hyqn9wHTpIlmNTmjwGRySyTZYd1RcZFboLX
         JiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780318; x=1795385118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CN9AKgF/hWkL3empD3c/LQ8/9rcmhykYPSIjXEPK8gw=;
        b=Yhyk/8C6mZ9TkSNJiV6E1BNDCing6v9g3Jh0IvJdF3mfecnKvl8DTzR3L5CM3Db0Eo
         0ptNecxcB8l43sCNwBb3u7UEr4tqKEDomAu0A2MG7PtxlHspJawZGK3SnE23xtKngD9L
         R3obd8N0vCBupvEuhYcGyvcTAlafkKpwaBK++cGlXniR3khrMdoZp8CLAeXp+s3YwkI+
         qkhzrirQgspcxooS3l5PHlK1jfFBZqpUf14BYS3ytrIqCOXuVyRVOdXLgUd5Lrltr6h3
         0WzREegRkReoaWx0T/wqi/dm/Lq67wkZPDJbi92iEgJeemCwhPOpqsRtdcPeBdEco3R2
         IEvA==
X-Forwarded-Encrypted: i=1; AL+hErHZPqveqViTMc+SWVdJ0KVZTymblAyTimkAlV6K9GGAlEMb5eNsOQgmyuNtSGbJGqWeJzWSnj+xAAbi5Zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CE4skNCkWZTVs9Zl/YEdNm71Eiw4Jg0KVdOVaqhnMcxdemkG4
	9PvAF/RehS0klVovwdQlLx1celHFxi1xpO3RRJ77oSaOg4cfeB3+pF8=
X-Gm-Gg: AYBFou0rBHCYWym/F872JzX+pj7og8igw0lME99456PMLOc/hZRniMIrUmdtaci3SBh
	w7oLLpX8VEYmzVYrZOcVZUpOpJh46IxhulWdFszUWDtFybnKwaycs1KtLNDtvMw1hRbTUrZKAcZ
	M0uOPectwnEP594vGGQMmO7XnPlXMQ5IGZdIiraiCzvM5G4k0wKARxDL5oKgOZqemdHgp5Tk3Nu
	XFWkrZjWuDqg6ME3fleYxvMNdk2fjy/Eb+QhN6w3HZsuoRTElEIhzjqmYdDH3cyEgzIXwxaA1kk
	6Frs5AYYdxE0MUlqyNkTjzALMy4DPpzbM+EE18KsAqXa+EgBuRvZpyD6Y/s8sQNcuVl/shWfmZK
	Sh49T5FbKC7zMvoQazASSKmwqDLi2YV3IfFSi/DxqK1dge9cCUb7+pX8VCFRR7gjaQlprlpEuwn
	+VsFXRl0UA8vUkshf0jCIbySlyc43bwlomwJ1sI8Ol0lahmlZDlASIeAjYpl3embcPeyF8YpthD
	e4Fce+i7ZEB3HEneaA309DkhCcsbP5kuJM8EPXKH+wxiNNnAidE4nVMsuVuUXmM6Ia8j39toMJb
	SCOGf8eX/GbYSrY3PY87/04X0LAfFw5wwjTBewSk1karnsvwqpWKko0+OMbgXMwZHHoZ3wnN4bG
	BnKEd+A==
X-Received: by 2002:a05:6000:455c:b0:48e:3c5f:a24e with SMTP id ffacd0b85a97d-49b01cf32damr18111293f8f.11.1794780317539;
        Sun, 15 Nov 2026 14:05:17 -0800 (PST)
Received: from lithos ([2a02:810d:4a94:b300:2305:4cfe:af66:fa99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm18659046f8f.23.2026.11.15.14.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:05:17 -0800 (PST)
Date: Sun, 15 Nov 2026 23:05:11 +0100
From: Florian Fuchs <fuchsfl@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: arch/sh/include/asm/uaccess_32.h:204:1: error: impossible
 constraint in 'asm'
Message-ID: <avosl5rcgpWCw0Ur@lithos>
References: <202611151925.SgXid5Fj-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611151925.SgXid5Fj-lkp@intel.com>

Hi Adrian,

On 15 Nov 19:44, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   23c62304dde29abe92013d85910d03a77dada35d
> commit: 8b5dba9ea4a3f5ed994f03d6ca7686c49491b426 sh: uaccess: Require offsettable operands for 64-bit user access
> date:   6 weeks ago
> config: sh-randconfig-r2311-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151925.SgXid5Fj-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 9.5.0
> sparse: v0.6.5-rc1-21-g84ec0658
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151925.SgXid5Fj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 8b5dba9ea4a3 ("sh: uaccess: Require offsettable operands for 64-bit user access")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611151925.SgXid5Fj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/export.h:5,
>                     from drivers/gpu/drm/drm_property.c:23:
>    drivers/gpu/drm/drm_property.c: In function 'drm_mode_getproperty_ioctl':
> >> arch/sh/include/asm/uaccess_32.h:204:1: error: impossible constraint in 'asm'
>      203 | ({ \
>          | ~~~~
>      204 | __asm__ __volatile__( \
>          | ^~~~~~~~~~~~~~~~~~~~~~~
>      205 |  "1:\n\t" \
>          |  ~~~~~~~~~~
>      206 |  "mov.l %S1,%2\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~
>      207 |  "mov.l %R1,%T2\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~~
>      208 |  "2:\n" \
>          |  ~~~~~~~~
>      209 |  ".section .fixup,\"ax\"\n" \
>          |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      210 |  "3:\n\t" \
>          |  ~~~~~~~~~~
>      211 |  "mov.l 4f,%0\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~
>      212 |  "jmp @%0\n\t" \
>          |  ~~~~~~~~~~~~~~~
>      213 |  " mov %3,%0\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~
>      214 |  ".balign 4\n" \
>          |  ~~~~~~~~~~~~~~~
>      215 |  "4: .long 2b\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~
>      216 |  ".previous\n" \
>          |  ~~~~~~~~~~~~~~~
>      217 |  ".section __ex_table,\"a\"\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      218 |  ".long 1b, 3b\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~
>      219 |  ".previous" \
>          |  ~~~~~~~~~~~~~
>      220 |  : "=r" (retval) \
>          |  ~~~~~~~~~~~~~~~~~
>      221 |  : "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
>          |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      222 |         : "memory"); })
>          |         ~~~~~~~~~~~~~~~
>    include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
>       68 |  (cond) ?     \
>          |   ^~~~
>    include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
>       55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>          |                            ^~~~~~~~~~~~~~
>    drivers/gpu/drm/drm_property.c:484:3: note: in expansion of macro 'if'
>      484 |   if (i < out_resp->count_values &&
>          |   ^~
>    arch/sh/include/asm/uaccess_32.h:136:3: note: in expansion of macro '__put_user_u64'
>      136 |   __put_user_u64(x, ptr, retval);  \
>          |   ^~~~~~~~~~~~~~
>    arch/sh/include/asm/uaccess.h:72:3: note: in expansion of macro '__put_user_size'
>       72 |   __put_user_size(__pu_val, __pu_addr, (size), \
>          |   ^~~~~~~~~~~~~~~
>    arch/sh/include/asm/uaccess.h:20:26: note: in expansion of macro '__put_user_check'
>       20 | #define put_user(x,ptr)  __put_user_check((x), (ptr), sizeof(*(ptr)))
>          |                          ^~~~~~~~~~~~~~~~
>    drivers/gpu/drm/drm_property.c:485:7: note: in expansion of macro 'put_user'
>      485 |       put_user(property->values[i], values_ptr + i)) {
>          |       ^~~~~~~~
> 
> 
> vim +/asm +204 arch/sh/include/asm/uaccess_32.h
> 
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  178  
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  179  #if defined(CONFIG_CPU_LITTLE_ENDIAN)
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  180  #define __put_user_u64(val,addr,retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  181  ({ \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  182  __asm__ __volatile__( \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  183  	"1:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  184  	"mov.l	%R1,%2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  185  	"mov.l	%S1,%T2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  186  	"2:\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  187  	".section	.fixup,\"ax\"\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  188  	"3:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  189  	"mov.l	4f,%0\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  190  	"jmp	@%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  191  	" mov	%3,%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  192  	".balign	4\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  193  	"4:	.long	2b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  194  	".previous\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  195  	".section	__ex_table,\"a\"\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  196  	".long	1b, 3b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  197  	".previous" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  198  	: "=r" (retval) \
> 8b5dba9ea4a3f5 arch/sh/include/asm/uaccess_32.h Florian Fuchs 2026-07-16  199  	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  200          : "memory"); })
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  201  #else
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  202  #define __put_user_u64(val,addr,retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  203  ({ \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10 @204  __asm__ __volatile__( \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  205  	"1:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  206  	"mov.l	%S1,%2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  207  	"mov.l	%R1,%T2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  208  	"2:\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  209  	".section	.fixup,\"ax\"\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  210  	"3:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  211  	"mov.l	4f,%0\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  212  	"jmp	@%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  213  	" mov	%3,%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  214  	".balign	4\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  215  	"4:	.long	2b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  216  	".previous\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  217  	".section	__ex_table,\"a\"\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  218  	".long	1b, 3b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  219  	".previous" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  220  	: "=r" (retval) \
> 8b5dba9ea4a3f5 arch/sh/include/asm/uaccess_32.h Florian Fuchs 2026-07-16  221  	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  222          : "memory"); })
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  223  #endif
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  224  
> 
> :::::: The code at line 204 was first introduced by commit
> :::::: 9b01bd9ee6408846c0553c03fb4b864353a845c9 sh: Split out uaccess.h in to _32 and _64 variants.
> 
> :::::: TO: Paul Mundt <lethal@linux-sh.org>
> :::::: CC: Paul Mundt <lethal@linux-sh.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

with the commit 8b5dba9ea4a3 ("sh: uaccess: Require offsettable operands
for 64-bit user access") reverted, the test results in a gcc ICE in
change_address_1, which was the initial reason for the fix.
So the "o" fix from the commit does fix some cases, but doesn't prevent
every case of a non-offsetable address to reach the asm.
I think we could fully fix it, by passing the address in a register, but
I need to dig more into that.

So it is not a new issue, but caused by the same root problem. The cases
that previously triggered an ICE give now sometimes a compiler error.

Regards
Florian
