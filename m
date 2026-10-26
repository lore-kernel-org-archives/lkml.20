Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006906;
	b=QhG84e3dHYPTRxmCkQYyHGMiYxa02nMQXXcH2HQEoE4Ejklla4j1WlG2xGp0fRk8y9md
	 zglELD+orxkZRJ4Pfkd8tt9fT/+6k9azpP5kRpdQSC9H8Rai9sOtSxRWvAGHS2hWHXw7E
	 arLN9amZngyTPTS2e2Ne3PUKx87jtnPkswgy+ymCaFTZpJdBkPIZ6V9khHtWTjbR2QrXX
	 HG7kWr/6tLBtJTZqS60HgOBmG7Zx78Q4g4Wp7cVXHGK8XJGATXVp5NXmhdkmC8NBDCKRV
	 onmTkPYb3h8DaIc6DCN4tKOpcPZ3UjWisfL2S67UTWFxbj7X2H4ZqBcxLslCfDtnLnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
	b=3+31Dbu9c93g7yLM9xQCWzIwuJxzl1UA1WfVMSzLezvYw1BrJO9Xk8pAmohfbwwFdgrp
	 wMMwKRjHAikhk72qTEO+W89hMXV4/AYNvJ2hoRJx2EqHgC6XE/eF46iiBSoKgHwncZETa
	 u0LFTKobhcmNeaZALC9OEIuYVhqe50ItCwi9LRz4hDTHQA4dmjb++zd9Ia5Co+2YRsfRy
	 ShBPSZMVTbY7XrxDBWICAApcYWbYjEptPasN8nzcD552oxX98tBFn6+d34TqgRrlxsABQ
	 vieMD3AaGyf/u+l7fe4Ah1/D4DcDhIDX2OzVJQdg0W3+NGlnvxmkvuYzUuHTjxC/ojg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CZ4B9P7w;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40360A2625
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A40360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CZ4B9P7w
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so17431525e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006903; x=1793611703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=CZ4B9P7wQDiCoHwSght5HMF1Reu0ZpEa5W9PxymJM4iRKAeArJA9+p8mAQXrRP0Y5A
         533t1AnsPiaCD41CbQs4XdyVl85RGWOO2pjj95r+rqneOJOXEwburRPd+pn4RRpCkkjO
         9BynAhJWvsvPV8cU6J/Kj7PEUdurJMpgy/N0wkHcDKZPOtPNtlEZVJBt6agC7TcorWLo
         ZcoVuCinwHjIjKyFJwHBsfK3FTyHH8JKDImrVugE1Q0JThuEUCMT7WXn+R+Fgm8Zv8Vz
         F2ab9z3r5ovxvhgO8V5SRxUTac/RZ8vyZAKQD9TaKGf3RXpiJdWrhWVCK1SInHdQ/Qyx
         98JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006903; x=1793611703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=R5Hm5zIFGd8GWir3peUlgsz9uQo5yTIqrwzYO7El8MWwfRAdFOPL8lPOe7CdQtVlTt
         R8xvRy8dph0ws11x3Ris4wQClN0OvNUnqvHVInWwxgE696/3Z3UQ+KgD7vFcy13fVK/x
         YWYgZWwODKezL1zLT0ttvCSkS+/iJPJ5gPY25/2WWPReup27Ftxqw8lCnoAWKbGjngyu
         YmZ34UHw/zZeFXx3xQTEnJmUzN7wAX+HVW8w7o1wMIeNR5xUuQPWnFBNGBGO03X/Adnu
         zuJR3XmOdZyiKLJSck2Rx3Zd6oDtYtT8WAWIIXyaNcqWBAlzzcw8IO1YZhNF9pOf8M8K
         BnzQ==
X-Forwarded-Encrypted: i=1; AKwUvByKu7DeNPrv6DIRsb3pp84G5jxqQI0xMriFGKmiQ2KppmDzwEB4iJodvLTbMpJut1Se+Fu/k5hu4jGg3DM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiUguqpesGfe7u6N6DjeG7XVnZPIM6bSTsN3FW0R2PyKWnR8XC
	w/a+UcabarAI8VZ8Bzs7R5tsQMMHzT91+/yncMR2/GZ+JCXUhMUBo5LF
X-Gm-Gg: AYBFou0g4SxkRvwSlx7r/ZYksjXM682o7O4DNrlV0ONflN7PbjeWevDiQLaSf3b21zY
	Z9/UgD0Mi0ClAOSowrT7Er8XWCS6RNZB4jKhLd+AWt3daKHFHU2Z+0u3m26L5i1JMFsfJ9D9rl6
	F6W7CrlXvJYmBS7/1yS7pksETRFU9SHXRZ8b9BJcp5xti9lSrFu17pDsDustDCzDaWF6VCuaKRj
	+LB3lEVGEUI8zH/0bLgfPVK1OjxmzPMQ6HdbBjpCM66REDUfXKvl3jt5EGJWfI729Re3tox49xz
	MfEkdeNEk4+6qkDA6o149Xg7nRdqaOr0NYWjfxErCHuZpLExKo7fKG0V88Ew6RRRKjXqhEEvt8C
	dcFSw6aBO3AhcPlXNF/oOFDUm69sBuCtoBZ3Ep+myOM9rFB68WXIkGaRKAITl5xyGwACwuD1EyE
	GUFFewKzC31Qe1gmqtOFipie5yVSdt5m7cO+L9jjN6gtOW3enfkKe285lxf2AioG+Dtd/iMguPH
	n0RyM2/GxHhKMkLmIXrai/PJzR6
X-Received: by 2002:a05:600c:3553:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a35aead203mr116295105e9.16.1793006903112;
        Mon, 26 Oct 2026 02:28:23 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm215058535e9.1.2026.10.26.02.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:28:22 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 26 Oct 2026 10:28:20 +0100
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
Message-ID: <at8dNNb4vwovNZcZ@krava>
References: <20261023001603.560210-8-wusamuel@google.com>
 <20261023001603.560210-12-wusamuel@google.com>
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
In-Reply-To: <20261023001603.560210-12-wusamuel@google.com>

On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:

SNIP

> +static int bpf_object__query_ksyms(struct bpf_object *obj)
> +{
> +	struct kallsyms_query q;
> +	struct extern_desc *ext;
> +	int err = 0;
> +	int fd;
> +	int i;
> +
> +	fd = open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -errno;
> +
> +	for (i = 0; i < obj->nr_extern; i++) {
> +		ext = &obj->externs[i];
> +		if (ext->type != EXT_KSYM || ext->ksym.type_id)
> +			continue;
> +
> +		q = (struct kallsyms_query){
> +			.size = sizeof(q),
> +			.query_flags = KALLSYMS_QUERY_BY_SYMBOL,
> +			.sym_name_addr = ptr_to_u64(ext->name),
> +		};
> +
> +			err = -errno;
> +			if (err == -ENOENT) {
> +				err = 0;
> +				continue;
> +			}
> +			if (err == -EADDRNOTAVAIL)
> +				pr_warn("extern (ksym) '%s': resolution is ambiguous\n",
> +					ext->name);
> +			break;
> +		}
> +		ext->is_set = true;
> +		ext->ksym.addr = q.sym_addr;
> +		pr_debug("extern (ksym) '%s': resolved in kernel to 0x%llx\n",
> +			 ext->name, ext->ksym.addr);
> +	}
> +	close(fd);
> +	return err;
> +}
> +
> +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
>  {
> +	int err;
> +
> +	err = bpf_object__query_ksyms(obj);

hi,
we could also add similar support for libbpf_available_kallsyms_parse and
probably in some other places like bpf_get_ksyms.. which makes me think it
could be useful to have KALLSYMS_QUERY support for multiple symbols

thanks,
jirka


> +	/*
> +	 * Fall back to parsing /proc/kallsyms only if the ioctl is not
> +	 * accessible: not present (-ENOTTY on older kernels) or kallsyms
> +	 * addresses hidden from this opener (-EPERM, e.g. kptr_restrict).
> +	 */
> +	if (err != -ENOTTY && err != -EPERM)
> +		return err;
> +
> +	pr_debug("KALLSYMS_QUERY unavailable (%s), falling back to /proc/kallsyms\n",
> +		 errstr(err));
>  	return libbpf_kallsyms_parse(kallsyms_cb, obj);
>  }
>  
> @@ -9922,7 +9996,7 @@ static int bpf_object__resolve_externs(struct bpf_object *obj,
>  			return -EINVAL;
>  	}
>  	if (need_kallsyms) {
> -		err = bpf_object__read_kallsyms_file(obj);
> +		err = bpf_object__resolve_typeless_ksyms(obj);
>  		if (err)
>  			return -EINVAL;
>  	}
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 
