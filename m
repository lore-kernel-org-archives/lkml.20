Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619895;
	b=cT6Oka2VPvrUyyBcQbGwKT9Z3ofvUNTSNwL2sVkoLH4RyFNQ96s3n34NH1+7Tt2onmGl
	 V4CDOcxFSzT3M7wo0uH7W06dxp2eH3P1GyjI+3gMXBMxXPRZlBBeDdrOVDYTk2UYZB3NI
	 qrWAAc+eOD2Jk4RFcYviUIKqCPAjPWFt/rNAb4u4nI56dhQLyi1Prk5pr1av/yJXgxSFx
	 9A0RlxPlchTHGqbH/5Qo6EvEpy1ug6twNEBnx0Lt69fngoI0cTYQaQD6Ko52ZMD0+G9bT
	 h7hqFwNBxBrVKBrJ18Y6mLbcuCruyx/Eh0LCUtqZ+C61Ag/4tJabvGHiYEsulb03xqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5yJ2n3i6CVJHjK6ZZv5a8G36fnS8e4GCGU0tMgw75a4=;
	b=yEiEF7BkETg9hBRKqiUuyqdDNk0VbfEndZAy32LT7vA7tf/4gUCTNbSiiMEMhIyqIKA1
	 TddWy7+sxi2oz3CKlcd2sLZEGxMNHhi0yUTwIdEQODoRg+P8aFI4mUcnsWrhjCrbD8AC1
	 +T4dJpgaRb2z8w3jsy8wZZZWPz/MSCmiRDY+rkwpYxkpisYacoTGmOqD7ntFyC60JAP/s
	 DmpjbFKhBcOS35mkINqRRmQigNJX+/MoQ6JoNaDVyHTE+5+DOvi0MP3Mg5u7NJziMWI46
	 cap16mLKg8K+t5KKNQS9NXWrruHy67w1wpy8x/xp4/DjcSJ9Z01z5c1MVJyxJ5mZ/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wj1f68AR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE2B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE2B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wj1f68AR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so9250685e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792619893; x=1793224693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yJ2n3i6CVJHjK6ZZv5a8G36fnS8e4GCGU0tMgw75a4=;
        b=Wj1f68ARfWBZ/74a3qmLkQ8FHsanPBpng52X9RNK5nMb67Fu/KWlRlocKVzYXmt0rB
         6QlqdcsruaTm7myqk/xti4GJEJP5D8JeS+Ivw8qfmTPDrv5xaAtx03JHlQ7PX8EHw7oY
         nj9aSrWiHLGYB6P8Uw/k3/mMc95SGnC/SUbqTEIsdH9fZxMwxltXEMOZSdayZXCNxq8w
         1LSdJvdC6zdM7wqgeYEuBAFsAOHl3Tv2poNqRGpWRN47cyOpz2FlNjhxQ5HEOd6tE1q3
         PWS08VdTKDDdWsL46LbT5ohhFNw9KhWPMmxpOvIUF4mOBxy0LyH/h+ys0F7sBRRx7vRN
         q5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619893; x=1793224693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yJ2n3i6CVJHjK6ZZv5a8G36fnS8e4GCGU0tMgw75a4=;
        b=2ML6XJ4tpUI3LYIdW8yl7JS1S6nnIr4la7cKVpVQjSXLc3G1saRXALd67EfyUzz1YZ
         Sg27QSK6bEEc+c+AdhmhWUxmf/p9se4N1ln6MwLf8sANtIYt/ZBUN9zULm8UtMBvIdfJ
         fsj63j6ltzXD7nxfWC+13x/ZdAWrYclxZfbDfqmiakl55lkxEOavs/+53Ca+iFsLklx6
         a45i7/9ol4Vf+h4FxohSYEqp/hDAQqt1USrvMA85KDZxUfqWQqPCL8Qj5TJSHfpLIG4W
         6+X9YpEh+plvTiN883GgZw1wiV0LtsOGrf81VTG5wfH0CZjpmpXfZUVI7eWlELW9CRVb
         9p5A==
X-Forwarded-Encrypted: i=1; AKwUvBxty80iMAOoGcPbbJGU3ojROo4Lamav4MVoMvIkrFUfPhTMjijOMBPC6gBJeI0aNNL6jM0sc9fRepfhyBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrPdrap+2PsgBkjP7lxNX25Bzd+0NtT+ggTvXnPubiMTqZIk2E
	YkxQvRx+d1rZJE3tdldFUMGPmHZwqDiwaHNrsGvlEowZrQEIsZzaVHuyaMtbqzVowOg=
X-Gm-Gg: AYBFou2neNvxWTtqL/7XRrShPb0pOvbEJmr0T33Mlumq9idydNWbcezM5qwLQ3MMg+9
	teqldIIcb8wxN2bV95kR+t7/vEJLHaVLAd9KjS9qEl/gkWLB40sQJ4WBZhoS7ogVhupzjnpmIHM
	YU2GC0nKtVRmWjlXLgMgZryKRCeZONz+a0yRndZGSAClq7Pfmf7ZNwr+k3Li06pJi4w3WgcxSKd
	wC8WAoLnIPNaV741Mu890gGtPviCXVNam94Vfy8eDK1QkiyEGOZpkbMb35evsRuW0Pw1ZxsJo9O
	gfdmq07CbzGXT5Qrmw8+21JoKTGXI61Y0O1IAChQ3GUf+w9Qki+vC/y5oiE1lv/I8dfBfAThJKG
	8+l9LCJDGJd/TUOtTsh9UqgGZk0ihU2Q5R7+a2qtFjZWqW+0vQ+1FtNqHfvYa3qYLfbvjvDfuoI
	cVxLVt2iRVjk1e6PNPnrQfQgEipLDaZ44O7booU/jri9+7yroxk3in6vrZ8ZSI7M5ASJyogoIj1
	6rAoOukALIAdR1aFrMMdv3Va+D69yILtHpsNSpHHNK5LVP6MTcIkZWDHHjb3fiV6HqpvM7UKgoa
	OHazPbhe515+mMo89F5Dr1o=
X-Received: by 2002:a05:600c:c116:b0:4a1:7659:9b94 with SMTP id 5b1f17b1804b1-4a1fdd15d29mr64090935e9.13.1792619893139;
        Wed, 21 Oct 2026 14:58:13 -0700 (PDT)
Received: from gmail.com ([2a01:e0a:bc7:8550:5cd1:725:a99a:721c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254efb2csm8588852f8f.2.2026.10.21.14.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:58:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 23:58:10 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v1 07/12] perf beauty: Update copy of linux/socket.h with
 the kernel sources
Message-ID: <atk1cuJe3pqUvBya@gmail.com>
References: <20261021213007.21046-1-acme@kernel.org>
 <20261021213007.21046-8-acme@kernel.org>
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
In-Reply-To: <20261021213007.21046-8-acme@kernel.org>

On Wed, Oct 21, 2026 at 06:30:01PM -0300, Arnaldo Carvalho de Melo wrote:
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> To pick up the changes in:
> 
>   be3a5e06b962 ("net: add SO_PASSPIDFD_THREAD to get a thread-specific SCM_PIDFD")
>   5bd369c05576 ("net: Add connect_socket() helper")
> 
> That don't result in changes to the string tables generated from this header.
> 
> This addresses this perf build warning:
> 
>   Warning: Kernel ABI header differences:
>     diff -u tools/perf/trace/beauty/include/linux/socket.h include/linux/socket.h
> 
> Please see tools/include/uapi/README for further details.
> 
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Mahe Tardy <mahe.tardy@gmail.com>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Acked-by: Mahe Tardy <mahe.tardy@gmail.com>

Thank you Arnaldo.

> ---
>  tools/perf/trace/beauty/include/linux/socket.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/trace/beauty/include/linux/socket.h b/tools/perf/trace/beauty/include/linux/socket.h
> index 2a8d7b14f1d11959..b17fdb7d38a7734a 100644
> --- a/tools/perf/trace/beauty/include/linux/socket.h
> +++ b/tools/perf/trace/beauty/include/linux/socket.h
> @@ -189,10 +189,11 @@ static inline size_t msg_data_left(const struct msghdr *msg)
>  
>  /* "Socket"-level control message types: */
>  
> -#define	SCM_RIGHTS	0x01		/* rw: access rights (array of int) */
> -#define SCM_CREDENTIALS 0x02		/* rw: struct ucred		*/
> -#define SCM_SECURITY	0x03		/* rw: security label		*/
> -#define SCM_PIDFD	0x04		/* ro: pidfd (int)		*/
> +#define	SCM_RIGHTS		0x01	/* rw: access rights (array of int) */
> +#define SCM_CREDENTIALS		0x02	/* rw: struct ucred		*/
> +#define SCM_SECURITY		0x03	/* rw: security label		*/
> +#define SCM_PIDFD		0x04	/* ro: pidfd (int)		*/
> +#define SCM_PIDFD_THREAD	0x05	/* ro: thread pidfd (int)	*/
>  
>  struct ucred {
>  	__u32	pid;
> @@ -461,6 +462,8 @@ extern struct file *__sys_socket_file(int family, int type, int protocol);
>  extern int __sys_bind(int fd, struct sockaddr __user *umyaddr, int addrlen);
>  extern int __sys_bind_socket(struct socket *sock, struct sockaddr_storage *address,
>  			     int addrlen);
> +int connect_socket(struct socket *sock, struct sockaddr_storage *addr,
> +		   int addrlen, int flags);
>  extern int __sys_connect_file(struct file *file, struct sockaddr_storage *addr,
>  			      int addrlen, int file_flags);
>  extern int __sys_connect(int fd, struct sockaddr __user *uservaddr,
> -- 
> 2.56.0
> 
