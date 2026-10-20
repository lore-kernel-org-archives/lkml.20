Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792493503;
	b=l8DjTgjxn5eSSMuX+4gTGo9CV30H0aQVPyxR+zEHqdivU72B3ZqnBqZeWSwv+LwSJ1Y5
	 qUueHbR1b7QUIx3uorjlRYCWsd6q4IziOBPfeJJjyYiYcknPOUV+Xk3DWv+DNhosh4PvY
	 cg1MQJFsrDRy7vzGXCuSFM13aw7tw7p78+eUPXZog8yudEHo4RqBWjRZEI2UIRsihCeIL
	 KjgTKaFM6+JeCmTcbflO4LgXqoc+lnFNxdJYixAEN6rK/EUURlZYRaIXnJoxFMZYAFi6n
	 s9Z3X5MafCGWwB5NaqEGU4imqIept2A3/L7xMccA5amjMd6PZyod95Mxfm05Yxzt6FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
	b=XKkofVCHeeOb2SPGiDEZmSrSIqLrxZbQq8b0SY1Fn928csZhXFSTGDApjDHtyQP397Wu
	 /cOtmJJk4n4IdcPhFX/8n0VMhcgH1mkCTb3SNN/iGwkOFseg5IvwtpjOkulml03fOI/YA
	 IebL8Tov2CiSZ+cOMpmOOCAzPACY3aU4wLk5a9t0iTgNZfZ/jxuCaS8HUY0D90Nq6Y8aY
	 0YWNGCRlNEpbJA24nXYYaDQ/eG0nmgy0Z4ygF1BRATW5JiwOg0L1zWevIdeNc1dV16nvE
	 NIYpLAFz49N0SKI+acifqpkaYUY0WiDGgoNnUP6jRYCpAL0rgZFOLvvU2b8kzA7dAHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cwOSNTXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2D60A2630
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A2D60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cwOSNTXj
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bb5afa736so367493eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792493502; cv=none;
        d=google.com; s=arc-20260327;
        b=esaIsv00xqh6L3dZx29I2zrvl96vTEOjgOzTl/57DFKaih3MPoWuHiNT5/9Sok61jF
         BXh5Vbut6yfMJn/svcb7SBKe7vaYN5Y4FIHjFLgvXOndeusgPPP6F97tiHEXO150VQcn
         Zr7c390Z9AjylXKTGlc98IqvaV/FD+LaVJpi1jV4EMbj/LOYy88uGtMHCk6syT0+fiC1
         NuMwwbDEqSN3qUYEykcJSoINtBp5IOWpgPO6DlUt4xJNYGL+G6q6fIbeWMh6/9Bcs3nC
         oGONA/jZWPC8uySzo2+bxSW4PzPATTbTISwRPD20JSWt4WmBvl1akCMhvsYn62z3ON3+
         SCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        fh=SVkX82C6WJ23/o1F2053uv77tjlOLNt6qMGaZfyXe1E=;
        b=DVKiTRV/xqTbIus45fMXF9kVqvV2lxMXQ6zzVgHmlZunQPYoXW1AJ4ypK0eb/+XLOL
         fgwsoQXrj52ike9g1IlnvFt/ueut5NmhoiYvBBHHAKjnrN7amqe9AIQF2tkjDiSynxTj
         auWBj8gLr/yahQy+h+Fc/Bh+Rknetw4VIlaizflYAH+E+JQ/Li15wN0peqx4QdEeOnYI
         5AflfXdNwI/Xc6lakhFW5BnZT9T9xnEFZyHPHmRlNDUKNehbiv5pfSs2Wd8qC7D2uA0j
         IXhjqHyJdPOCWFnSMc3Rzh5xqw6Q31SzZ5G24vCW6jb0XrOy1copJSOezNCSxcfbvuYc
         GZ8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493502; x=1793098302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        b=cwOSNTXjS28SgehXt3TaTWamzKfACLP/MwnKijdBbVUuyzICifMs/yMoImH3I2gWNn
         USTyfyjGr8QkS3dzFKAsKCt1bjEtj0Sv8EKFoF4rb4Q9/v1rKvGyJm1XHvc3wX3YGsHa
         vnTSEQad7MiWIcW59CzHsYl0DJ/lSUAehe3b99zH9yNXAMYdxG1vP6x4caN8/hCItjqQ
         cdKoVMmMZ8CaVbZnXhrQLzrMqAGAEvmySJLtjCSqmEnAyWrpOdlPCmt3LojGgEKWOc5L
         JD0hoYbxGBPsVJL6xaNoZsv8bBX/kmfaZL4lx51zey9ZMey9V6wyRp4kyPb5h9xaMzTs
         ktAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493502; x=1793098302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        b=fMDOj5JYk8xENrjcUpUMuZ8PvBwmTfXM+iyH8A56NI48I36GcuSvyeVTsSNh99t2XT
         AS3PhLOYVgolbe3zOI9/KE8n2/yMeagYKdIHJUN75+HNXQQKdbacEvNmqeye9lR1SsMC
         zv6G2gMig4jlCeBpJsNUfBd1M0bi07TxMrTVdAltFK2+5D+ZdorPXicVsgYjAMNS+pyW
         5Z3U0VWymtfeAiBFRduvxgkLaqheJsiPprCS19/oFAR/zRPNdod94n473SB84NNe8zqX
         xktX8M6JqgK+vTisJHQzrWxqL8eagBjtlo8F6+snqqBsmi3u+h/DgiXncZml9IOcJc9f
         LdtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpPbiWZMTJKFx3dFWnrKBUbTxKWFP8Vxk+KYyL2u5CB+ifBgCwGcOsAjd8PRsPF82DLQO4juFhjtx3UOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5L2KAhmeTIwV/Pw/Tv0SQUkqfzCsCqF0ya1iCz+OX9VyNhBpj
	uNXA3KJOFiOE2862sffhTwSsAhXDEz/j175oWqh/poqSI353MHhAJ/mo/NAuCvJ8jIWh9I3zlCl
	Z1aY1U21rgdsJlC72MYybZOTAhvpAgJWXtKp5
X-Gm-Gg: AYBFou1lojwkH1feLDoFBXAFl1SSin/bu1zIzqMGHFWmTUzGXHvfJQo1hwPM7jzpA/p
	uFcj2fw5heVtd0CaUMmL1VPq/Hi/dVMRgUJDsRcvJ1hLdLsHpxQ+GYgayPfSLmGn+wiyx6Oy1ds
	xcRUT/MjIHMuUhIXYySZ6o1Q+ycZmpdATitybojMo4JztZb6AqK4HR15u7klIKHB7kWgZu/0YYF
	9yNXQWvaSh2PZx0t6C+JU3qgZ8QtGP+zma7HDhE4fM6mrYXZyDS9mVUvSohBON97leqBvztnyG5
	ph3qHFrR0e72v05I7FBexplguBL/8KP7F/Hw6cKBoS3mozpT7l6d+rSyanBPExWu+udBejO9ny0
	lKmtnY+oy3/gCdgsvtdHHfDkObO/RiEer3b8ejJarYZKKr0WronqwnVKsgeq39tV/oj1HXo9+ls
	XrAdHZqSSmI3UBYDlqQQIVHTGHlvIqYGPaX0qZQbtgPf+gH9vFG/Bah0RcftQKKw==
X-Received: by 2002:a05:7301:4248:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-361a0f7f3famr22708825eec.2.1792493502390; Tue, 20 Oct 2026
 03:51:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:51:26 +0200
X-Gm-Features: AclHuK8l4G5GVvkCAmIWz2nvAGdMY2Kiu_VckZsjZRukFRtMb29mqFIXRr3hCgw
Message-ID: <CANiq72niEdx6XFtUA_aA0mxtBOpuCnCU1G78rnwivxUBVXrpfQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> This series fixes a few CONFIG_CFI indirect call type mismatches that

I may pick these as fixes via `rust-fixes` if we get Acked-by's.

Thanks!

Cheers,
Miguel
