Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227406;
	b=uIVWH2uskvvfQRDcxpd6AmzsRcsX+jAH8A3mq9falUM30/QkT/oiDdPx8q9mpk2iWZ6d
	 D2fR+/hbCqtN6ksc/8znBxfZPK6jBA/Y/Fyi8lzrcZAU15eJJFAArejG7Z/szholvDHmO
	 r+D94AQRNA7+P9wwXY/X7xYxDIq7oO6k0rJ0z9UD2sVcdMr1x/GO8V7f8HrsuOut+OBl5
	 CfDVT5vHealZafvuDzOAmYyrHXIJMrzQeNybDnnD2/xxTn/whTcdfwekWGYGGgGa2mCR/
	 2KMrqRayDbnD9PezQHHge1NWRAae2UaYdPm3tZTYRuObmdAQdvxx1bqiT3mOzVl1syA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yECpefA28/MXqj384Qufm+rtjJRCtVDFYCVrS7mE970=;
	b=vSNVc6Z4KzOghiRweJ74QWASwJ+H9p5HVlIFMzMY2PGKTtpq8OX1KM2KpwSYVpMHKCpx
	 eU1sTU7dFhQHH7j5VAYh1bsx7YJeTXMn4cBHd/s3fb8X+c7HoE5M3CkU7/MoZMTBWxXkm
	 iCCqXyolbe7V26E8uJGoESSBudoN9SG1r0C32NCmbfeBcudOIpzYoFoNdn7cR6F1cm2IA
	 yGtOccsEaKLvBpEhC8JtWSlDn4n0CDcVy2l1JSxobUo+bV78hfi+6wY4ythT6Oy5jQOAN
	 kQkTDP6b/hdfchoJE+/3XIUsCHrzIHfDZTW6wZeksSc68wdRgFanJ0xfJDeKwzOClIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQp4S+Vq;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54DA606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54DA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQp4S+Vq
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93cbc3ab2fdso74203985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227405; x=1793832205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yECpefA28/MXqj384Qufm+rtjJRCtVDFYCVrS7mE970=;
        b=lQp4S+VqbSlQwdzBwvFGFKLSCJ33FEcbI1/XWwziY202gcLj+wWke+uOTIsLXFcZEZ
         OgF+l4vw4UYlH6RpbYRfsqyTouyxsFPjHes0lycbvwj3HxE0UFQS8UQokqfwjsXub8fk
         AWevC0K4eg9MhctNn/xfll6H056bR2tWkwr1dKUP9Ms/AtLrCZdwBMtvToPp1kMYZ2uh
         o6uwv4sqkR665mDVdxrs2tNh5SJ8exG8q+xqo410R3uDb14KVPEFTU52sT0+/qqFvHCK
         kuUEYlU7KJhLVIcRL31RF80b+imUNo7+il5ClzD6V1b2QebCqGuLUX9KC8vm1HMF+n6/
         T56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227405; x=1793832205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yECpefA28/MXqj384Qufm+rtjJRCtVDFYCVrS7mE970=;
        b=jv45zz1Cx1GacM77qRbPM8uoBBYWzdenaW4RzeNe1vvcz1JMrx84yLYlpu3ZCDyEH7
         UfAKEPDrZ1hx8Jn+wb+nNC6vRXBJyeuwGxBF+s3Ew8jZ4tV+oxlN2c9Q+dq0evW+dtop
         0SYNQwYUAehWwViGjGUe4nYYUYUIZ4xpWOMORKzmQ1XiBlTG2/15d04tasN0XmXdn8l6
         vCUDePohBgyo+qKT45HCri8chpki8kVla3YZ5N11wUK6YYBsekyP3phwSx6wMY//iB0t
         s8B8E9bNZ8aGhthPArGhNxUOWDRsYfus7L00Q4HycS6saPPH10gs432OSTJhN9ZmMBxz
         g49Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2umC1oRdVlJS2gpgfS+99DArirYwpjcJGSFLIPPys7Sy9LkjG+dWZJO7Di/Z/pnX+Fn0/2eeG7O/v83g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxN4ISfVkC5jHTspTN0CMzvzShSCM84A5n+lgelIryMuAapuL1
	UUQgcoChoULJXADwZk+lZJ0agWBEKHmAVif8stKPKCngLPO0R8/YzIx8pbIS4w==
X-Gm-Gg: AYBFou0QM4c2km9QpRuyt5vikRuuQYoEotZSnSIJyX4eJqjKgt7lcNKGeIolCNT5OFx
	+g9jmLE6oxxsC0saK/wDnigW2dkqeabOJEjCi3K83KBHdCrsB35q7W60snN7PreAzCDGYsyTaEB
	aq1j1Fgw55wHwVttEwkIxcBWZ/dRphbbyOB0GSIflhKGMQlxz5DD3BT1jGe8XbsnP79UzBPwoCo
	FazaRp4rw7YUFqUXPzhbvzHOA7UQfefAP7YdEB6fQGpqx6kqPi/sIFh2kkTEPaCG9jGwr1HtJfH
	DVszxGcoxjhGFlFDrZYgWWhx3LcWfFUrTdHN7HC5gqByRApTgY6G41Uq9x0JW5FgWQVboSNWSbc
	NOUNMWTOB50qpH9BP/WdwaSUQNL5CtBIGlz2PTpIiBn7B04J0mHOKed+EOAC5LOOP047vBgki78
	2vQ6iSNdzXPZba9Xk5YsDaLa5U91hvvoGjlt9h3lUso3V9fvj0iNo377rxvK6vrRXJSxarUjXjR
	e2Tsyy3xpBPYAMadssuB1Sr+TyFbIXLrGsa1UUr3bL1Yzc+IKVBY3owUM9NDUjI7wNkj/FxPAsw
	rVxOP9n7f5nlFtQ7zL+0ecPwEqp0mo1YrQIivL1W5gOUn+eNrXxs7+0sifFLaRAIpKTZKpZUVJH
	H5SP7Iy/J9r824yoigTQqLC1/8b7u/3stse1ZX9ptlkdFOp6/wFI=
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr565214385a.68.1793227404758;
        Wed, 28 Oct 2026 15:43:24 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:b8:5aeb:4bda:886])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm1370085685a.28.2026.10.28.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:43:24 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH v2 0/2] KVM: riscv: Unify and optimize FP register loops
Date: Wed, 28 Oct 2026 18:43:07 -0400
Message-ID: <cover.1793223506.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change to both patches in this series is a 
structural/architectural one. Both functions set_reg and get_reg use 
identical code to locate the register the application specified in the 
token even though they do different things with that location 
information: the set_reg function adds data the application requested 
to send to that identified location  (in the copy_from_user function) 
while the get_reg function retrieves what data is at that identified 
location and sends it to the application (using the copy_to_user 
function). Everything else is the same. That is the only difference 
between the code. 

Therefore I was able to apply the same solution to both of the 
function's finding-the-requested-register parts (which is everything 
up until the final if statement) which were filled with redundancy. 
The solution I came up with is to create local variables for the 
entire function for all the variables of the original code that would 
be different, depending on the floating point type. Then once I ask 
whether it is a double floating point or single floating point mode, I 
assign the aforementioned variables to the values they should have for 
that mode so that when I go through the if statements that ask whether 
the requested register number is a status control register or data 
register, I only have to go through it once because the respective 
floating point values/addresses would have been assigned to the 
aforementioned local variables, so the whole code kind of changes or 
is tailored to the floating point type. 

This architectural change/solution will make the cpu execute the code 
faster (as the cpu will have less decisions to make and the bare-metal 
math used to figure out the address of the register is executed faster 
by the cpu than looking up object properties and array indexes), is 
more maintainable, and is more readable.

---
v2: 
  - Both patches had the same flawed line of code. The checking if the 
    token's size was 32 or 64 bits line allowed token's with mismatched 
    sizes & types to pass. I fixed this by checking it had the right 
    size for its type by replacing the u32/u64 parts with a 
    mode-dependent local variable, byte_offset. 

Paul White (2):
  KVM: riscv: Eliminate redundancy in get_reg function via pointers
  KVM: riscv: Eliminate redundancy in set_reg function via pointers

 arch/riscv/kvm/vcpu_fp.c | 124 +++++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 52 deletions(-)

-- 
2.53.0

