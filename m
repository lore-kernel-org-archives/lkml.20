Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561789;
	b=y/tTnWKsvWnb6icjue//BLGNZT6F5BH/ALCgfdwMtHRCKwJxvvylGyx6s68pwfSZaqh3
	 7debq93VAB207/M/SqF0ybuX38xqUd1AGQ8AzHOATU0up5LZ5vMnjbgyeUnO9cy80ckre
	 ee8oFIWEGpO7vme1Qg23RwIBzD51GsXko1tbjfl3DFnVlpx9SMEk/iu3PgnP3a4HK15AB
	 U8Ikijj+GmK56vHJK2PM4MQ6BSQuAlHKyGtvVzNp335dNSRl05XG9iH26ZIHWwuMm6P8D
	 jmBjw9Cw/TTVCfermosv5b4bRK7LsL1ObtAPL2S4fbty5f4MhqxvAkdPEWW+WUxYT8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L4U6uoKIPIkNv7imLu7Hv5jSI4mySZg6QE0cGj6iXh0=;
	b=fvU7eHQ8xAST1siahr9p78WdBODZGklZwAYOBm6V5if/UpedASCFjaeoglLkVj8Vrl0m
	 nAYfGtbaS6NhbBExf9WvEGSjlVm2igUY3TRkH66STslzup/v6/BSe0t8m3C5EFgJbNVPG
	 ZXHA59Y7Grc9ZILlHLorVx3BVwsa2IA7K7wWxm0hp3l4x0kzQC+aQOQ48iNhcZWRrl9Pw
	 eKhj3Q2MQbe6+yC1JrfdmgQo3aSbayNf5bU7O0nRi7pbiwVFxu0hl3CpMOsH/SMPmnD4s
	 fbp9dBDVKzGPtbZHqvzvNQTFmBrGMaSJb6H/a8ambJqURE5z3qUZJOMrCsHX0V2Vtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LP59ItsB;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92760606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92760606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LP59ItsB
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49a92144733so231031f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561787; x=1795166587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4U6uoKIPIkNv7imLu7Hv5jSI4mySZg6QE0cGj6iXh0=;
        b=LP59ItsBjzPAPmAVpc9v5qfl4h2UfsCvzmw2kW9VSD8yXDKbNQ9n3stqsizVnnaE9E
         4B73SbKv4HsMlbRbNF8saT66sJDybIX2y37gQsarpEzTzCBHQLlJrZfpIIgg0EMBv8NQ
         NcnFrvkWg8QIR9wh9XIdRjKhOszDzKRjWbfBUP2NEf78xvgkDm5k00dk4PrX54gJRuUD
         tsuI6uCmNcaAZYtb/784LaIEg+Z5OE2IWrxiCcaT0bCmCs1IiZ4zNakOjxi2PA42+BQN
         HkK5y0rUrPf82itvRCMNgwsKuP3l6/S5MiHVO+cjaPHvhIJdu0dcyn4va0DLc/7OFsI/
         dNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561787; x=1795166587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4U6uoKIPIkNv7imLu7Hv5jSI4mySZg6QE0cGj6iXh0=;
        b=jajRWGP9To2aVt9aje79ZgC7u/dvKPXUy/ATik2IsN1xXGxCF3SG6qhlPLdrzx36Ta
         rIOYeAaLrH6r1+FoSaoYvjiArBRwVe9hfTiY5fVuF/Mj53q8hJZGvtHIYJGS5kZ2A33M
         fvBJB09HMkpBNHD0n4ob6AxyEyEhxMsWDppizglLe/5LDzXj1GdKhqz6tlCEcn0Wt/FK
         HCzGbfuGn7AyR0owTbcIFnx1ULUutjo8J6H7zXOqUpPnfWovqsZMOqBxGYfPpYFLKCFz
         AP7KVQYycFJx5AqU1wiuIURU6y3nDFIqJ5xpuo54mZoisW9iJ/bHsiyJp04PhSxvAWxU
         7Ssg==
X-Forwarded-Encrypted: i=1; AL+hErEOM7ykOTaN2M/w8nbK59QBWUAYNfao/vL/pgneGGbay0e8ROj1rzxlHB0H5WmsvkzfyG/kLrPaU7BX7Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N+b2XWBpC60kdnE1NudAp+qJw9iYaqJJUYntvJWydtBWqsKM7
	aPvXFHqLZBsFc5kcYW08HxaqxxkdlxW12a+X5jDzpuSe3msJ4scnwAaaj3BEfv8y
X-Gm-Gg: AYBFou0wzHC+AGV+m7pPgiXBwDLQnbb9VDzeDmNY4IfFsOz89Yk4lCLKR78sIFRr2fl
	/tgWK/gETKVA2m2iRfe+lIXzfY6RfXJZj5mkw4UcunjinLCEVfaJRdMcRdoLcUaLzXNx3/h84y8
	QpYTtSbPymTQJ5Hqi3UU4t/RVrEhzleMnNDh2YaCq/jlC0xTPAOGivCYqCZav7wUMvQTRWMzmw3
	u4xOi4GJ2//78dAoBhvGpH+if/uwiQRXX+D8s0zy7uUIm31C5M8mjCjriPzozKNcsRJ8q+vV0gK
	luLKBwNTbla0iyUOBJVNxJ61+1aSL36mCubhGW3N9qa7L7R7Ymg1WAqTyyxmlqZkVIdZTl5k94z
	FLPmiJXb6H+K0wrmtFxTDXfToFUOGlkOI2gdA+0Bu/Vsxi6C1xvc0P0rXBC99r/14OywqV5z00H
	fR08YV1maNYfc7AW3n0XwBxGtA2ZfpSezNdWuBLpfLwubN+l1VyeDvchqXqB67+7RWcMrSHhX55
	YqVZ51VZWYvm9nBGpxXPKv2qiVifCoGirIA/UJGRwz+GPCDYjavEEot2mjmOlVkz2ousu8tBsjk
	gnWtQPPBZQSqz7W+FpmK3ikB07BqQ8ij6GX5PNCWsgTpN0dDlb1B+GzqTk51I8UQsg==
X-Received: by 2002:a05:6000:4305:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-49c712ac8cbmr4676987f8f.20.1794561786746;
        Fri, 13 Nov 2026 01:23:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm3853502f8f.12.2026.11.13.01.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:23:06 -0800 (PST)
Date: Fri, 13 Nov 2026 09:23:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Di Wu <diwux@google.com>,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <20261113092305.00ec8be5@pumpkin>
In-Reply-To: <20261113013646.4c2f8456@jic23-hlaptop>
References: <20261111072608.3490763-1-diwux@google.com>
	<avR-KT-6e77EexZn@ashevche-desk.local>
	<20261112020439.37b0da70@jic23-hlaptop>
	<20261112220218.1adae5e5@pumpkin>
	<20261113013646.4c2f8456@jic23-hlaptop>
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

On Fri, 13 Nov 2026 01:36:46 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu, 12 Nov 2026 22:02:18 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Thu, 12 Nov 2026 02:04:39 +0000
> > Jonathan Cameron <jic23@kernel.org> wrote:
> >   
> > > On Wed, 11 Nov 2026 16:39:37 +0200
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > >     
> > > > On Wed, Nov 11, 2026 at 07:26:08AM +0000, Di Wu wrote:      
> > > > > Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> > > > > and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> > > > > PAGE_SIZE limit and is the preferred helper for show callbacks.        
> > > > 
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > 
> > > > ...
> > > >       
> > > > > -	return sprintf(buf, "%d.%06u\n",
> > > > > -		       latency / 1000,
> > > > > -		       (latency % 1000) * 1000);
> > > > > +	return sysfs_emit(buf, "%d.%06u\n",
> > > > > +			  latency / 1000,
> > > > > +			  (latency % 1000) * 1000);        
> > > > 
> > > > As David said, since you touched these lines, make the less amount of them
> > > > while at it.
> > > > 
> > > > (But no need to resend, usually Jonathan is kind to tweak this small thing.)
> > > >       
> > > Done and applied.
> > > 
> > >     
> > 
> > I just looked at that line again.
> > Why is it multiplying the remainder by 1000?
> > It could be:
> > 	return sysfs_emit(buf, "%d.%03u000\n", latency / 1000, latency % 1000);
> > if the 6 digits after the decimal point are required.  
> 
> Good point, I guess unrelated change that we could have on top.

Indeed.

> Those trailing zeros shouldn't matter.

There is a matching oddity in the set function (just above).
It calls iio_str_to_fixpoint(buf, 1000000, &integer, &fract)
then does latency = integer * 1000 + fract/1000.
Just replace the 100000 by 1000 and you don't need the divide.

iio_str_to_fixpoint() will ignore are extra fractional digits.

Although I'm not at all sure its handling of negative value is correct.
It converts -1.5 to -1/5 and -0.5 to 0/-5.
I can't see how that is useful since i*10+f for both gives -5.

I'd have though that either the fractional part should always be positive
so -1.4 would need converting to -2/6 or it would have the same sign as
the integer part and -1.4 would be converted to -1/-4.

David

> 
> > 
> > David  
> 

