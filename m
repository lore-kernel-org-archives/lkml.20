Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794174945;
	b=Knmt3YgL5z47DM91ImDPsag8u1qmLXghe+8izUR4wCCMekXo+kC2te5qhmhOZNnk0zyF
	 iBhdAhcfnyv9zSuoM/mv8ELRZHhjirBUyZa4SsLubY5KlPpeINNRGGoloj+e6jh673DdW
	 Mf1p7CxJZMBNnzNvVdALp+g1lKovZeCdUEZuFSACnVba53pbNRVyogsLAV8XI/hbbGCaw
	 /s+b4jEnslyNVCF0LvUqj/Ifa5rv9MoQjgxhraz/Set80YffnKvH5su7LuK178/X8fuhM
	 jVhKjYRa0PLGEy/+8TKtbF/Tx+l1Njjik4zTRnwzkK0IImmxHWmVx4VoabhaXRzSTAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
	b=uHnRIWaDkpcYHBZePZdNA0ccK94r2LMr3S+uSuhYOGR/NdLzrHJMaFAXRd4yN6uX0Naq
	 qqOtZtVYzzwXs6BLAAQz8mrcTL5WtsU15FWG5Bl3Uppm1pZp6n+3gO7mQrT3E4Htb030r
	 FgvtmsNxi0YG3wUkce8u4PdgvjVXNcljcAMk3u1t4Qt97QAWjkuStSAoMjJGpEwLbKYQS
	 k9uK3Q3l4ZSs8DQLDvjvDg6aE2eKDlUirs/odYnylTY0EXXMMy7kOgvtKXVsZVn6iLTl7
	 doMdYP5Ho/3S5c7AmQDmAbhC/k0OqBagzeBhkaYDABmK0qdQOAmk2Jb0OIMeN1wA+6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAaaw93y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E713606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E713606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAaaw93y
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1109567eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174944; cv=none;
        d=google.com; s=arc-20260327;
        b=kMlQkEOhhT1vlzlGXytWFhWtmFZeQeLjzR65WlnQBHViynnKo/melIUmqu+DH6BO2P
         3GokQtq605TdpGizFgsnvy9ntTtsqCibNsDGu5v2WXRkBl4aYul5reBFepIRqjWxtyly
         oMgXAlovGeZ2t5oeHsi2VA3zay+kYjmfaZSpAHGOSMLWRZZ+UxFoARrfLVRUrKMAxd48
         EPjMocVMVHUP2uIo0iqtcsxBpqIYcWtxuGvL9E0jCeQFnVLQqbSQbJKQ/1a2+01dkGjn
         lAclgQ6noJxsKgfraeRslpgryhsAoGyb0knSyB00V88am6soLJHPT49duW+2KFYmoKjW
         XJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        fh=xSUDszW5NG+KR2pz52saYNik8LZvNvZxlzPWF6JRru4=;
        b=GVbi7qZrmQ5y+GUQy0BV3QTxyMwCz96vKEU0bHaWQJnVrnXVNBGb4SFVN0/okTRVhX
         59c16eXyv3TpKF9RkG6yl047Qosogv46VRWOSl2drDPYzpwLvbYAhTQNO4/R5naaL1ve
         2UD+tgEmfBpUVv/nQoeeyNZ0Rdw0OsUdtgHM3JRM+kK3J5VuTaaDPQB9ZXUcjduKwwft
         xFI21yk/dvh+UV+ZgyYvOTjQSi6ACSK3GcjaQ5Orq+YP9W8AI+80RRkw0PfWmC4NbpYk
         OUjD6CFA7rdMNOAf6lVg51How9XJl9+5jGAfjfsWIveJwNs9A7+oOvVGMVZZoXWfVhji
         daMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174944; x=1794779744; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        b=aAaaw93ynIf3qzV6bFMeVV8YBCH8vLZqLwefUSTXJYbag8UMqZtLhtu3dkeqhn4y/G
         PC/jDS10kd9v9WjXbRDG+BsZs9wc6IlxveYW0FeXJNr57B/U/yXdtUv3X0tqASTQaDFs
         LW61Th2YoBHzSRvmRoqGd7prkZusyj08+EMqanHKAyv4Mt4zY63DsY+RCBQmC6QeyTDs
         3vTSj3lBfNI30vKbbA+uURfzme6p8cevux/4fK2Sg0uPriFBuGN9ok2FSZe5Lk5lFtHu
         15F78AIvoW0suXCCQtXw8q0F1S61Od6yMT8dzY4hJYmp0Msw8YOjVsCNDuxJVQMlejfb
         D9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174944; x=1794779744;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        b=d8z63bdFAJZ9t6CJ7zPw2d+5FQNTWRtmeHYY1N9RIxbwPaVHpDrPssbaGOdKVFYgcy
         oEvVAneqkz/wGyB1IY/IbTm7NWGP2qZ56WYPjzYAihKP7wRPU1esgtPsgCl8daqSNUma
         Xep6zEiQNmMm4lOxMo4blWoENveAWKdcmkwSmUHfigsGlYvKG4ph1Ij5NzQYC//GwKps
         EeHarnEh9e6RTFLCDays3VCiAsyuZgnrEygrRoVKjQdNz3Hf+RiYXoUHXXTdmXTFY2L8
         jpDa/vPgQz5uHjJxzrYKshyhL3Uui/PV3MyaFb6kiVlf7VhWFrLLHGEiP61tly3K/n0P
         +3Eg==
X-Forwarded-Encrypted: i=1; AL+hErGVPCHM83qV3WAE8CMqCKsMYWKThXNQHSNNEU3z0jevgZf0hlLEy/a+SgmEdGQhlI1FuPUw46oHg/QJe/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0v+KXlXHVQ0bBpQbAus3zq2WNkQUbupoVOdHDRVfzmiL54d2a
	O2mT0op8hhH2BRULFKMVAxzKFazFVRZur+pr1z49wQvNh8mqbAV3wd66GKiPWJaovHMt3t3SWYY
	RC03iv0/Hm8jESpC6bjbOepdDRkAHEBk=
X-Gm-Gg: AYBFou3nLRrvIK8d+rT/Ib++ocPKbFb0/02J5voXW8sZlM4of7gN7vhomzpU0YnyW7i
	2PJNzKqGCNCBMUepR9FdTQNJ4HE0llFw9W6DfM4eFbCZS3UB3er/osudbJT2d+s12X/zD9mPiqk
	uU8FS/9UZwuooAZ57J73neoVRKNz1Cwq62dAMHrsvrYH2ecyS9evw1J5EoL3hyEQvWSq9ew/t1k
	f8r8SjngcntxBpMWwVLXb4uEwTwaz/nJGq8gAb9QynymYtwbTd5Z/a6iQ3bQtTM5iql13R63vwo
	Fm9krOiD+EZo36arvlGh/wvFLUPa+9I7UnVOMwDLgzqSNviEIsy9GHgKQXrX5WOPYVPIzuYs/yl
	hYqLE5CdaUnsBGyKwxg3Gb3Mr9qZoSj3d5h+o
X-Received: by 2002:a05:7300:ea87:b0:36b:d3dd:2e9d with SMTP id
 5a478bee46e88-37255b4c438mr4848268eec.19.1794174943698; Sun, 08 Nov 2026
 13:55:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de> <20261106-tumble-hurt-d1a0be3fddae@spud>
In-Reply-To: <20261106-tumble-hurt-d1a0be3fddae@spud>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Sun, 8 Nov 2026 21:55:07 +0000
X-Gm-Features: AclHuK8qDOv8Crg02YP_zjFhxJU_hbwgG5TwapP7lp6MYqanAg0FpXCbz5Gu6Qk
Message-ID: <CALp3LZ5Vwhx-CqKz7Jr+VE+e0S1EyNO_-OA-uC0h_dz0VF0r_g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: conor@kernel.org
Cc: e@freeshell.de, kernel@esmil.dk, conor.dooley@microchip.com, 
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

You may have missed my email on Friday at 21:12.

I think E has a point. There is a separate red LED on the board that
shows power. My confusion came from the net that drives this green LED,
which is labelled STS_PWR. This green LED has no silkscreen label and the
schematic is ambiguous on this particular LED.

It is probably better to drop this patch. Apologies again.

Owen
