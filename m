Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495590;
	b=kqvzfnW1TKyG9JbncgelC0xfOl+4Yc6MGaTeY5FS0PGzkZEH4w8CCRNKGbjeVZL7QuAB
	 R2w+5Lz4s5+2337dK/DDX8rU5lhSI88LwSVEXC0dK7JHrx+aJHmhBOlvXaZZ4b0Tdj/xp
	 ASPzr0zi17x3K2xgrMN6+38QZBJnvgwhMjAMc25PtnAnRpI8/MdSAI7MKVHKqIOD5aFhq
	 i5rzRS5BJGBKxIhRXvo1boLtl5NBhjOvhlsrIbCd0cBzSm7xa9z02EUAx2A1FgEXdjUr5
	 c8VfTP5MPx90rOS1E8wlglO/s8b9Ov/yeE6A06xyiY3H2KxN5+2LbhCSfePjyOBOPVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=mWI7ugCczmlr7WYE/mOm+2XZ65nCDibs51EgikULhns=;
	b=XkCm4YXgX3TFU2cHkN4A2hpMrdkNDRmvLQvOtuOQfymdk7BWO8y00xE+zedDLapDZqTU
	 wEKXI7NbT1bnbnM2SiipvBaJNUBpnlR4chC6REGl3ktx9p4uJOSyPCORh0rv+u2utUjOT
	 WYauPjgwL2QNpK4AssgJbwO+Hgmt1atRqgr1zadEQxGsSDcbPC31USlrwz6B1ka+obeoR
	 6Z06I1JjucRArd9UAwq24ePFlvsmKfZUABXv8xFff2VVphKfuwTbxhv3mwh2SMZWomr0L
	 0JSPkvZdxnMNkeepWzAVZY6xGoY0dbScirNFUOCbW8qU8X57Xgg4Q1MjPUmApQnCiTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=J+z2zQ8V;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=J+z2zQ8V
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso1484648e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794495588; x=1795100388; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mWI7ugCczmlr7WYE/mOm+2XZ65nCDibs51EgikULhns=;
        b=J+z2zQ8VHRJcFFqlTADvcSOmWe6eY03hnRX5vJEZ2vp6PkhAZXob4HPUAeA5Nz2n+x
         ez5YSJar1gW8xx/OhHDz15mhL3bhP2d78EbbkAFjWGC3AdHGieXev9cQqPKbVWOCZCMW
         R0VGWUALgmyVvdc/SdpzfFxPvE9RDU6MxVEw5KNEME3KBOUE9JgYqe6yQgqsTbHgMNso
         bPRYs3vz2LSLZoKuc1694QigbenpXDTWTxa2785Wgn175jxTQGopyRsaJjKggy40lUsu
         NLyGNPpfVf6oPwG0Xnfh+yaEV1DcYXPve38+rKv0EsMneWgHvQhYHt6yNkkjO00zsnEJ
         YCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495588; x=1795100388;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWI7ugCczmlr7WYE/mOm+2XZ65nCDibs51EgikULhns=;
        b=lKqnQzCRbHvQ0bFn/to0S8dDQOMCjRB006DjIeXJWW7jsEMQZvZWXomdEFDTTO581w
         KQyAE2NcfF9aA3duR6Xldbf8FTxW4XwKhLEu+5ud0qbw8Lo1/ivjYasvleINq7hiPYrY
         r93Uq9xlh/cJXqUo9bea8bwcNAvnhzRcFT3J6+diexrhIOXXwMx4NIdG4/TvbTm12jZO
         wQsLYaizJgkJxA36yDZoviuq8SYCyc0ybu/7iVzRyMMIVxfZTo4hE8H1jaq7yXZ1OiI/
         ZkdspiKhJGA2ooCnDMkJ1Ax53upccrpSKadPxLhqFeodQ8evGGJ2WyUuX1iu33y85rhS
         qm/Q==
X-Forwarded-Encrypted: i=1; AL+hErE76yC/d91d/F75sX2R+kDVUhYhrrKvX9aOZp+2kWVzXh43JQ7LclGDigD4xN98j72BmegMNGE1i3ufSBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AOKeCxmaGZV4a+E3xd29r8c/oGG5ccDoOgJCKvlgbQnQQqNAW
	WG+C6ogYFnoJ0Nv8j4HiQV08/hEQeRxDeasOjbmok7IMnBC3oSL5IJolO7oJMGAsHNs=
X-Gm-Gg: AYBFou3KupACgTjQtXnWtSywuWigkolnUty9ur0Puh8ADCEZ0hQY2EDJodo3K52LhzZ
	Pvi2/mSjvPPvWGQkxSkbEKJcp2xn2Bf5OeH9nkI2ZsHm4sMb55Aw78tiVWzZNmm5sj4mTfLHGDY
	18732N2+NSINlnx80osMQHt17Z2au9TJ0lQzzBIVSVZeQdPLbjX7slJSJQUukHP5riWWVypWWGX
	euF4ZMb1RG8Eh1boWSs+fZ1VXLZADLOkgT3A+GMIeVw4QgRJ8SX5E4owCGqaVRCgY2HNCAVmyTr
	B9lUhVvARV0GXVJbRYqqJD+ydM/KNK6R0zOmvctfIqxIFMK2JuK2EZvuV4NAFZ35NTgUXeBW9Ew
	bhLG6vpa0xGTmNdtsElo1cJo4ciOnapeQKCPuRaLvuBdlQE+Je/g/o6bk+OcIugW6hWsofmIOMW
	XCIucXcgrdLXZatQbRPtX+UXl/R4w837tAE01qaEdev0lKmNqHFBoXkdSqSe5eZMy0NdnKm6hVB
	b+KfRv2wI28iayUsuJB2If3GR7X1AgXBxUBU8KRoVENDRVZ+jK8bvy03e8WnwQI6VVh1oVkgnbO
	Bf61vhkn8SjBVLXyO7uOR8N3owY1wcqFi4pcpWlt7hH/4UdxRKjVhD9F8loFO8SDJf2eprpOfGr
	Ee8fX4HY+tRXnLftWhqkJzkoIMQTVUcU=
X-Received: by 2002:a05:6102:f11:b0:7c3:8150:83e7 with SMTP id ada2fe7eead31-7d4fb24dcfdmr2020028137.9.1794495588205;
        Thu, 12 Nov 2026 06:59:48 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302239188sm5739554137.2.2026.11.12.06.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:59:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 09:59:46 -0500
Message-Id: <DMTBLFVSOEYG.K5WAQC5KN7IQ@soleen.com>
Cc: "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chen Pei" <cp0613@linux.alibaba.com>, "George
 Guo" <guodongtai@kylinos.cn>, "Kexin Liu" <liukexin@kylinos.cn>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Sourabh Jain" <sourabhjain@linux.ibm.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH v3 1/5] kho: reject zero bootmem scale
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush
 Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>

On Thu Nov 12, 2026 at 5:38 AM EST, Mike Rapoport (Microsoft) wrote:
> kho_bootmem=3D0% sets bootmem_scale to 0, and then the bootmem areas are
> sized using the explicit sizes that default to 0. KHO remains enabled,
> but there is no usable bootmem to load the next kernel.
>
> Reject zero scale the same way zero explicit sizes are rejected.
>
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers"=
)
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index 6f1f55fe31819..b30ba686cb301 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -703,16 +703,22 @@ static int __init kho_parse_bootmem_size(char *p)
>  	if (p[len - 1] =3D=3D '%') {
>  		/* unsigned int max is 4,294,967,295, 10 chars */
>  		char s_scale[11] =3D {};
> +		unsigned int scale;
>  		int ret =3D 0;
> =20
>  		if (len > ARRAY_SIZE(s_scale))
>  			return -EINVAL;
> =20
>  		memcpy(s_scale, p, len - 1);
> -		ret =3D kstrtouint(s_scale, 10, &bootmem_scale);
> -		if (!ret)
> -			pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> -		return ret;
> +		ret =3D kstrtouint(s_scale, 10, &scale);
> +		if (ret)
> +			return ret;
> +		if (!scale)
> +			return -EINVAL;
> +
> +		bootmem_scale =3D scale;
> +		pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> +		return 0;

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>=20

>  	}
> =20
>  	/* parse ll[KMG],mm[KMG],nn[KMG] */





--=20
Pasha

