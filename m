Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601996;
	b=OeviTwnAlR02W0NV1yruuuKx2wmQm1QJYCzxOmzQYMtS5sUesHpP3uTPrfdPG+SmU61a
	 9w2mRwfNEHCiZjzKkj2P9DGsMoHMx7yiUn94aoIVtIpHYHYICLljJvmo4vJIbZeB4NkzF
	 ueKQuOQvrposFJ/SAWitJ5DJsXEjqFfCR6vuVsTT2dXI0JHSq2Hk0aELaLHowE3S+RibC
	 mmlYKxA6YhaVIdDjXNSnkchXe2nbOPdLPO2J8h8sAg4umIcjlQWLQF9eNVnqmXOkUtLSC
	 zdN0mOvRn7GYtoNUJSwk90pd0ZsCvKdLhFyXEPAhFfds+IOrQa1uYBKah3M1Eexhj4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S89AT7ZTjOZtL/ZUZE4jC9K4OqNH/+RoT7oEJIPYUyc=;
	b=faH4RclmFHsNTx/Uq1ACrojMdF5n12MO6D+V6jgrYuGCmcxvqBQmf9bvG30MxcHb9qkf
	 2tITnOgC7YcV+ON1dQlLZ2z4sH6OMWjk0DibX3c1TtShIYYUyrVMn2ejjdUj6vt9czJ/P
	 4EdQK6UPhDkvnBvZDUs0KmLP/YNvR29Puru311vFLgJdUJg+1sBq/PUgU9ypc1M74cgkD
	 2tUa+MIOxmU+JDe7I11Y17e44ToLoyFjYsnrP7F7ropVImEbQ0Rn0N7y2/xM63/+4pD7X
	 csVjFGltJYA8jIEH/UocM6JpTSioZU6W/GRr423RtojSAvj/Zc9UAAdoYr3xi4c6DZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAszUpUR;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D23606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D23606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAszUpUR
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso1458739f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601995; x=1795206795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S89AT7ZTjOZtL/ZUZE4jC9K4OqNH/+RoT7oEJIPYUyc=;
        b=DAszUpUR4ifAhi449rZywFZWHvPQQAz+BM8uD5bm4/0SI8SvLDOLgPfY/96wzX5//C
         gRPOmJlsJQ5CB+hFoQ+33L4CViCUZWgCeCEckEH4lzJyfPR21f38vUI5zjNGdEHq8gf8
         GEq6385HjahGfgYyWo593mz4LOwlOUSn5SqJCImDoZKI6Pz9rgnK3hcNMO04axRjncfm
         w7U3XWHjHRMbJqVVFYzbG2s6YUQTOFyCbgcyGHaJqheaoeYOaxdI5ukuDemZ7trh5td9
         7dmS40AazweTIGvI/gb/X07yodfuXez4FKjyFAgPeqz6hSTMYPNwoTBrm/3gUAwOUgvT
         5jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601995; x=1795206795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S89AT7ZTjOZtL/ZUZE4jC9K4OqNH/+RoT7oEJIPYUyc=;
        b=M0JfsxDPyGZtpx6o43VG4/6pvzfpnhsoX8oOIi/afNH7dVjN/jNM3R26pUkuFlwWS0
         k/aM7g0+5xqCA3LyutBwNGMX4cqMJ4/tIDgklpm4IENyHFZQTQWQPCYHP1MsgBSk+2eb
         I1FzG01FbCwtoF81wCjTD7yaGg2huOY2aLwT6syQ2gaVBbonpVDqXTSiU2zIj30Mo89x
         yuiZtj5t4UxNHo7bE3K28SBjrJpiosSoirNnG1fJvwh51VC5R/bEmQI7vKdqovV41N+e
         78177dkY2xYEG/lbN9x3FakEGC9XHKy0xBdQ5OK1IK8Q52ocl7yKcqO35HZvwpzK1dr+
         F0mA==
X-Forwarded-Encrypted: i=1; AL+hErFmTQpIWSyeDDEBHW51aqXYyKNOcYK8Q2SVkDk2omGFdQ6slanvmNkcQJsV7wqQ3PYTJ10bUo3xsyWiCqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A7sNRfQ7JkekTTd8o6urCbVk/UZArsFuTnPktsDlhxl0gpsjr
	9IEkXDZg8I9O49PL6/TKkKea7Dnkx2E2cHneSoOg6QiTwhV0ZVgYo3e7
X-Gm-Gg: AYBFou3nVjxWjIZiB74xA+qSu6sU+8uNGtBacsa4mJBIX4GZNMKJUHVdya1lKHsmhhk
	a7d7Q9BrjTXlsRjTelAeF9FCBoGZ9tHWQpPcrtFCF30TqxfCAmLjx7MgwUr0YSUsTLetE/W12O3
	ndBldf9WwVFVSS55jMQ0GFL/tdc64Ckybde1cTSVxBX8wcl/3fn41f1rGTlYOUVPLAorB+QuYbT
	Vm3/Zeh5mEPMdo/lCErAnLKkZAW6N6VTg+Np3IsNXVZoWxvUxsoR3QVt/H6SdR7hUEPeUIxnTHz
	0PFW4LkYx2YGTkUYyIQQyiaN571JEGJXxjTqLuhsrxg9pqqOshqXt7Y6QV22/9jvBwwrCLxV1oy
	4kCH6qPPSeeHB4WTDo0jtKoNmI7iiCAWCWminKiL83EHBOBEdTU7NSj4wDOu+/auDA2ozXLHZ4A
	gLBJnsMiA38FGDFF/iI8oL1LbWN64YyUCh1pKLTyRuzvMYYou9co0UbaVBUHi5VayzHWp/PQ8Rc
	qyMiVtJ6xcRzoewWaPuxb5MyWhUTnfw7rg1coJER4sMur21z4e5kpIwa0xf8cBIzf+HGZhpDiaV
	t1pKSc25EWbiqN6gDgZFDWiSZc961pqonk8ZzkoyzJdS7d7pxd54ApyNE0natp+i/RM=
X-Received: by 2002:a5d:59c9:0:b0:490:f98f:addd with SMTP id ffacd0b85a97d-49c6d63fa4dmr9093213f8f.4.1794601994645;
        Fri, 13 Nov 2026 12:33:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm7042380f8f.35.2026.11.13.12.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:14 -0800 (PST)
Date: Fri, 13 Nov 2026 20:33:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fs: pack fields `i_state` and `i_fsnotify_mask`
Message-ID: <20261113203313.487a3839@pumpkin>
In-Reply-To: <20261113114427.1845888-1-max.kellermann@ionos.com>
References: <20261113114427.1845888-1-max.kellermann@ionos.com>
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

On Fri, 13 Nov 2026 12:44:26 +0100
Max Kellermann <max.kellermann@ionos.com> wrote:

I'd use a different workd than 'pack', made me think of __packed.

> Both were 32 bit fields followed by a 32 bit hole.  This reduces size
> of `struct inode` by 8 bytes.
> 
> Moving `i_fsnotify_marks` there as well so they can be in the same
> cacheline.
> 
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
> v1->v2: move `i_fsnotify_marks` up as well because "should better be
>   in the same cacheline because these two are accessed on some
>   performance sensitive paths" (Jan Kara)
> ---
>  include/linux/fs.h | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 5b3a100aba77..fec047cc3327 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -813,7 +813,13 @@ struct inode {
>  
>  	/* Misc */
>  	struct inode_state_flags i_state;
> -	/* 32-bit hole */
> +
> +#ifdef CONFIG_FSNOTIFY
> +	__u32			i_fsnotify_mask; /* all events this inode cares about */
> +
> +	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;

#else
	/* 32-bit hole */
??

David

> +#endif
> +
>  	struct rw_semaphore	i_rwsem;
>  
>  	/* Timestamp for writeback list ordering and age checks (jiffies). */
> @@ -863,13 +869,6 @@ struct inode {
>  		unsigned		i_dir_seq;
>  	};
>  
> -
> -#ifdef CONFIG_FSNOTIFY
> -	__u32			i_fsnotify_mask; /* all events this inode cares about */
> -	/* 32-bit hole reserved for expanding i_fsnotify_mask */
> -	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
> -#endif
> -
>  	void			*i_private; /* fs or device private pointer */
>  } __randomize_layout;
>  

