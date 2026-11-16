Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840234;
	b=qnHB86OzXjieKPDM6J3nB9x+hpLZE5SWZy8au7sLfyEFhLpFCxL59Sptg0T9rl47Ghob
	 AplF0GJxmwIJSMtTArg6HN1IDHFj7o0ezaaDLZ0vjE5MiB55aS8CzcJ4APkEoaPiSZnvA
	 z5H0/Hiy9SErWKGYBzs90kuGEjIi6b+MjOyckuP+prQdtFfcyvbuVjpi7GqMDiCkOPLX5
	 lgKBR2nNaWFInIgWvEHrfji2qjsO1mCQr5wWLYYafFQJMTIFUHhMowZ7bYVc1N4mFN9rh
	 LeTjL92FTKC/Etk+vOwG8Q4JAVZQXxeqb8uZi7YwKvjwiPaxLF6jsjSyUVMeGNvgpmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
	b=nLZ1CYalAn3oBaqv8cYLrXLWgpUQQegE5tChJ9qJdHhIUrXsuBzki4M4nKxKRgPDRdCh
	 tUnuzCBDi8untazlE+drH6Ssc+/F9inZFy34SKMGIZ2LCgRbsVc2wtWzkI/pyQx3684QJ
	 lNai6KZzBtV9F8qadAtKdujghFeeQFZzB8UideKJeCRWdNDaraHpml7tCT4tV9Z4JAG5C
	 1YvvvnVQ/386PyxLHTgwTCS8dfa3A5k2tofviP4+v6NYkCr0B2IWsVDej4fwg7YkmHXj2
	 VYRtynkA/UJRsrG2xAjG5M9d/PbV4LPu/mXjwyT8L7zc4U7+L0Hb8RUi3Qe0SzViJYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LJZtThat;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A49606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A49606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LJZtThat
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so522882766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794840232; cv=none;
        d=google.com; s=arc-20260327;
        b=e30sNFUoF8FGcNOaokDAImWIhxvVGtmAFFFL22aIe6bxUjIwUcYK6XxJ3sKhdS190V
         xTGeQWk5VY01V9wG/ELRSgJpo5orefNO06w8IRBbeYwb/FOV+sByZ2uyt0KifEgU2R5S
         cBN9S63LxqlGIOC2L7yZtThajdUkqCNMSlxWMt+Z1zh7+oXjmd88UpP2zjPfGx6Og/Us
         Bb7S4Kl1cawR5PgbVBEw2Hbk/YBoHAwsybZ4vIyq0+a6ZLR3IOIE99QBukk0KXbGoy+A
         /Q8UY8v4Ft084o3r3uMYG1Fm5ABYFahlypA1l3nxcapbVhSBBI0kqW7e/fF3JzcoNy1o
         3uFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
        fh=ugT5Kz9ItNsBNYfo/Agq/mzkRRYt9CvMop8YUVdDxEc=;
        b=qGw1YQkHdHANirRNY53qwCRyf+V197wWnMECksE7wU/KDjxMnsXbSpVT66UZsT3h/O
         gqBM7Vq3VSJn5sjJhHS9D7HuDinHGmU7utEJXInQcAeUMd0KADvZNu7SQy9sqtOVlIbe
         6Fd8tOUtrX53bk5NqI9wRN1BAH8+j01xuDR+x6A5xe0jiYQNsGIrn3Vqxq0iaKHxr9Z5
         NqWaXHZW9vnxWfTtqECbdRhErZZ7w8EDXbYfkkOhiZr1eDgJJDGnBw2Wj2aYAtvKs51m
         yQPoz9337FWnI0j6vnwQKTJ9Y+eXWWaADTiJG8s0hASClvIHg2k1Yuv/l2sV7TGYw/+k
         ZBgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840232; x=1795445032; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
        b=LJZtThatK6K0+/QRl0VZXYdgWJbyO8o12oAmzBTtG1u2mOWrqb/fTDB2e93TBV8Qn0
         MQehSI+Kw4wCmc2sB/zKnpCGt8jAEuq0tCKk/fiVHgbRFLdudQeXTWOA2Wlk5JkSaOB7
         X53v3qdCCVGbyH8ZuiS6JbJnVShbxeKOFZLOy+8KTvH8D7FneS7qR3uxK0hj4wRhszFj
         r7xRBHVS1UZNbNFazp5shpdq+lPBAcKmegywUWURVcuTVb2GOxFSH8cby/uvAkM0GCmg
         dPyGg+e45ElNTArXV0NwprNIJcZcjxbGburToczD9HZdfkYJtUbVL5oXdKyp23tnLVKj
         DWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840232; x=1795445032;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
        b=CtXF5qMyuRjgGhjZtg6+v6HFCGjxZtVkwZ2QvQpIlhOsZriorxefcjFTQiSsV+OW7Y
         3dNegsl2vpqnLLhao+726ghqCKu6uWvbdyFo+hh+nPnoiM/zz4mEM6p4AArNNiPzbslq
         yyoKDI68gIrTfrBx4qFABK6fLi87Au8C6dqqfwCFwa+U7Sa0/3Um3maoD4xrlSEEgn+/
         cni5maSTI9wSpzJkpbwgxI8pZXpfpGFLUPjW5HweT5uYbFCpBPc/7EiQXLTMAmxXqOjC
         Eq9++wXRUkX28IulEaHQ/zRg2cllhu1WIkJplgcstEOOtXU8q8UMX44rBCbbVfQ+eWPG
         ZEQQ==
X-Forwarded-Encrypted: i=1; AL+hErGA9CZgesv14Mba2BE4gPVWvw0WiwBhqamn3IAXdUig7zE0NNqfrk4kLE9x+PRXX8mbEEI5Ri2e4x95rNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zNnqU9VsWks4IXPt2ZosDjU6+4iROkiLMsNjDMFWJb3WOVZlT
	8sG/u+J3N09+QQXqsSHZJeb0NqyqZqwoDvYRGEhYKYyXamBn7luO1ghpLpeFvi+vJASE/4UkhiY
	6Gu2lWFDfokLnxiWXcw5PgHZEU3f50AqFfFi0
X-Gm-Gg: AYBFou3LwyP1BQjW33dqeSFcylaCPi3bG41UGS07gbQKw6TGtVNjuzPvF2zra+FzBSf
	D+NSpM30i+OOHTGcIVWhLgryXn7R6f3x8YqIq936TMqwIm4SwPe3z4lK061fXCtwXLFY+mbzuNx
	DtJTo3+IRJlGQVBy53ybSmvQff50essjpS/5JG3OgyvSqClns036dTxfiIHMnEoBeQIPECvoIqK
	fMSFi0ZMbRugrdQqjiebQYejyZr1yFEfAG+8waSoOZigiKTRo/LIXVBLYTKyCABToa46uz2GhTD
	Zxkll7+p+GvQAANfpaZ2k2ZKub2NWqT7opEnHnc3tSYbARpv1wVhKVJKwA1D9HKL//dejq6h0WA
	K+BA2Zn/zUjxB9NMugbp+lyuJCPIQYOzHGLgDjDv1TI5w2PgRJocXptl4mFKtrCc0gz2nmxkLfW
	cWrCv+7ww/zEz25nKeHA==
X-Received: by 2002:a17:907:7ba3:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c509636a832mr811383966b.23.1794840232163; Mon, 16 Nov 2026
 06:43:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
 <20261007125908.321186-3-erwanaliasr1@gmail.com> <73b9c9a8-479d-4a5f-9321-2e095f11951d@gmail.com>
 <20261116141150.667950-1-erwanaliasr1@gmail.com> <2ad73cfe-3ae6-43d8-c7e9-247239b72519@linux.intel.com>
In-Reply-To: <2ad73cfe-3ae6-43d8-c7e9-247239b72519@linux.intel.com>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Mon, 16 Nov 2026 15:43:40 +0100
X-Gm-Features: AclHuK8BDXpvNI0_3pllJdwQDzikwYZpRgLllXxe5RPi3P4JjVG4FqCURPk7LoA
Message-ID: <CAL2JzuyL63cqnV+DR22NfAPFHCO24G0_NkPohm1vao-U985pBw@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp
 socket devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, platform-driver-x86@vger.kernel.org, 
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> The lack of Documentation/ABI entry should not be taken as an indication
> for something not being ABI. We generally don't take away ABI without
> doing proper deprecation and waiting first.
>
> Sometimes, the old place can be covered with a symlink to the new place.

Yeah, but since the trees are very different between the current ACPI
(AMDI) and the platform (socket<x>) one, I don't think a simple
symlink would be accepted. Would it be ? That's my main issue here.
The two implementations of the same structures vary so much that
unifying the output means breaking one.
The platform structure with socket<x>/ is way easier to manage from a
monitoring software point of view.
