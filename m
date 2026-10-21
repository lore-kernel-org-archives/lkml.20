Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602948;
	b=x8rndOB9j3Ydm3W0uJapbCEies56qBJKbeUwkGJyqsEe5gCqnFSFaALYV5MR/aLNPrTS
	 t0Z2UXihQwpHzL2n+eRjJwXwy7Z55RkRbskt1m7F0z3QE28W9vFBqS1X4sCsu7M0Bc8Px
	 ZH0ZBXWY3pEoIFY8L0LgoqyJTTojlSfeOPjWv7oP/92APz/2Mlufq5JReVYjHziRpQJEj
	 yhY7MiKbBAeyPdZSCTAnhSU/HP6qg7rrw2VgqBj7ysBy5ickfs1xgcDgF+G/dMKHYxxwS
	 Ml5Yf/Da+RKgyv0BMBkKcnTl5Tu61KFRV/5lFFSF3HWRAIIeU6sEHZpwIh2MQv+vrMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=p9BvQ0VeluCXAWmqoKdFU0SfBt1q6ntM16zBa5vzFtE=;
	b=3P/Q9bV/53Uhmu/n7xzU4c125HN/2SqPdYfEVUla0SVU/54PWTmVtuHZZJINOYWwh8eE
	 xyRl1CbcYHeJ5YO2osIvgShY0mE1E5JnByBexh7/a9zr6G7FVLeycLZ0N3LfklnUar1fI
	 rAfPxVzwWUxGHkeqPTW+eMSSPqs0dH5EPLvU//aI4ZwOnziWdJG9moay0f9sBKTIY9CAg
	 1gaTQjaSzvz8iQKxKUlPj2I++zQ+6wSR0wPZEjS8MsBw2o/KstgykxioQ//mNjVR3d16w
	 dWmKPyWWCduO8vUk75oki6OVVd9Q2ExIsEkRIoWNxAVgIPhoovrJkB6Ulb/3QJIDpJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ld2Q6zjM;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ld2Q6zjM
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15943c9c005so1156879c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602947; x=1793207747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9BvQ0VeluCXAWmqoKdFU0SfBt1q6ntM16zBa5vzFtE=;
        b=Ld2Q6zjM355/jbQmnQs79eZACeQtT9eZSUVIhd5Iysgzp/Nu+p/pKOhTu/WWo+Bi3Y
         YDzHPb2GMQHGcgieRnH8M0yHs3S9ZbhX1D6HK1y241SRPxSYmYl7PNYV1Q/joCXTVlzd
         LJLLmhyTdlossdq5uzo44GcuqvolB85SLhiRRzYkSl8SOXAIoSbQtfPnkaQgh4+yERQX
         CZZxz4E+lpVBHfyGibdgqyKV1xePoLNyaZV2NlQMl3P2WugENL4CG5tyZxDwT9WuCliE
         gcCMOywWQLjW+cwfz4o5eXweG1or6tmqp92Q5Kjf+ZlvBAxvas1gTdNLK6KgCEECqQk0
         NAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602947; x=1793207747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9BvQ0VeluCXAWmqoKdFU0SfBt1q6ntM16zBa5vzFtE=;
        b=QsmZkQg5w0WaugN1kuNnGJvGJcR6gf20jOWm+9qckVFic/tda0DkIQVJUPFQUmWWQE
         AX0CMfs5C4syumnz3tSnXG8lhr0ozc+HtcrTxKulsHaIl8JLmYbQl/CHjoNOjMFgVTx7
         +2Rkg7qoJpQWjvnCj+QZ5ks1c0o9CNH04j4Qza4rTZyRag/wQnMSyQIQKb+gMcy3NNIR
         GrbEUCiM8E1/dVuwu+gSTX4XUTZ/olVnTqAUh37W6oK3Kd3OrLgnYyeGhkQ/gGf3pPIU
         wCOtaIgIV72W40MGJs2sWp4/xQ6hQjL391UqcPICvjKagxyji5SfV/EcDXb3XBjmdLLa
         Coeg==
X-Forwarded-Encrypted: i=1; AKwUvBzfRYZDMpC0sXqH3NH8LN9cIBoAmsTTw5ELsjmcm75jqTPR0bnOVqTTXZMMNBC2hS5RgxWyE0RI3+ZMoNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHZYX50juEW7vkFrorFQzqeP8eXbAAOrpocNDZg2uH7kyaKiEB
	tIaabgVrXKQcV/Ql1J6Z8o84J/KGJHcLQv/FsMamLvY7vdHaJSAmf049
X-Gm-Gg: AYBFou2mrpndnfU3JHRZlapjuI+Q2y29naTAHV+dyR6ueLoNxFo48u72nebkSKW9q6W
	RccTUQuITpBmeqlJ6aeSvG2dhxSu9qXdmUKmdfZzlTkKDuA8518Q8fK5yE1I1b0snCcMFAx35aL
	7SHAfJ24++FDPgtwMFqsfZiELdtsUm+20HMxUeI1ZxQVH822hU/9Q1jio/VPsoIY24KSioJpsgP
	NqNwcxcMM2bhPfGEH93iRozzWQKQCyPIeuUN0HV1kPlu8IrPQ6LLiEBvMy3mYpsk3hXk0p5oIx5
	pD/iqqaKPwf8BRAzqHeNZ1sqn51Ah18r0iJiwIURMAlAtGDGbtkgO4papw27pgv+VxuVesMayWN
	utNYncyTmMaVF7jZTEiU6BOFK6yNl6iiY8aQpcd+bc9uqN6wfztUzzeEwG5WO8HrGkaZjHjrVIJ
	dKHuG+d6p8BmUpvGI9v95dtefEeAndYt5P3H5BO9W3CXDWZnOAE4QNRGX142P1ZuRKDSRWYgY8v
	wot6lwG656yj0p85w9FTNU2NzdAs5lcO76PtbIC1XaIP8PwYFzAUdhL+NZJ0me4iiQznjQozkNa
	CA2rzBqCKaBGe1rLSHdZxw==
X-Received: by 2002:a05:701b:2914:b0:18d:96e8:b913 with SMTP id a92af1059eb24-190a9eaab7amr2994159c88.47.1792602946836;
        Wed, 21 Oct 2026 10:15:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm6166666c88.2.2026.10.21.10.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:15:46 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:15:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: soc_button_array - use __free() cleanup
 facilities to free memory
Message-ID: <atjyyqxnlqEvwNxh@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
 <atjw4b-ICVGH3-2a@ashevche-desk.local>
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
In-Reply-To: <atjw4b-ICVGH3-2a@ashevche-desk.local>

On Wed, Oct 21, 2026 at 08:05:37PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 06:50:00PM -0700, Dmitry Torokhov wrote:
> > Switch to using __free(kfree) cleanup facilities instead of doing manual
> > cleanup or abusing devm for allocations that are only needed during
> > probing.
> 
> ...
> 
> > +	const union acpi_object *desc __free(kfree) = buf.pointer;
> 
> Rafael added 'acpi_object_free' for __free() (pun wasn't intended :-).

Not sure why it is better... It goes through ACPI_FREE() ->
acpi_os_free() wrappers which might be nice for ACPICA code, but has
limited utility in the rest of the kernel code...

Thanks.

-- 
Dmitry
