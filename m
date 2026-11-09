Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203421;
	b=1SFW9GBvwyIUKbtJKqjeGzrVXWZ51KoMElezbQYkIrRqsk6K5xL4RTx8i7+OSzf4oqJz
	 M0eoCgN5JIMuqFOLvxX59bukpeT9rrr4gkqt//SbyFZ8Em1fMHkZrjzzy3dU4PqcDLq4b
	 r400Yd5cPbDofyIvSU1aAA/8wXvRJ3Zo+XnmaQUkY5fyL0JEECdwweBLcJdYEuV/m8crI
	 OkK8a3OnppjA+K4qxmTCEItw47L89eyNxy5FC4257NXswI151TcYTjNGFaw1XEqL2+fwC
	 yWI2NLsawDJJ10rqJCS1/f/Ar9nj9tqxOEegP2Rb0okeYImun8p7EhTrxQigLF20abw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zOU+uPjXYv6C9BQX655dlLqEf/JlKkzYX0WVqRX6Ues=;
	b=GkrfiSj8OjxXtWVxUbysRKwcTuI4JA5C+CJlYE63gl6WvowFgcCOcKYSuy+cUq99BElR
	 8ZTlj0v5U1+mXbonYch/IPb71Jx65VbLFhkA6HavQUSCvpgRvLuivTHaVy3XoB//4yNkL
	 kAU3EindG4vw50K7st5CIt5xFwHpHhGqL2cBYtanc3ZY1Jbqg3r/SgiiDj9XLFU7A9Onl
	 /bhXmyq67++1Nr4xkS7tMCIULIPl+uPtHzkDuQxgcLexMOUIXndCu1ikkQEj7/JtwKrMQ
	 +crqbOFbBW1YDZ/1wcMHZvG6bIFrmsSwaAhOmRXwpPq79ZwUYPNHUG33Ihe7EvbioSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+JNnCsV;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80103606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80103606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+JNnCsV
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so34838f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203420; x=1794808220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOU+uPjXYv6C9BQX655dlLqEf/JlKkzYX0WVqRX6Ues=;
        b=H+JNnCsVUCgEZDoYDAfHPe7mNmuUmXaMkyL2Meu2CESJ3eF/9IkHeMSJ5HmktqlVN4
         n3KRuKvVmC6z+woxboJ9o7gIInrAYyhtmje2bHrLupmfpGViEjZuBcKKvrQZb4KycvgW
         I59LI679DZHMSG3BNeHitkyEAqjCdUhhrK/FuJr2lHZwigU8/u5i7BEylOEuOC5mSYAy
         AK9unokS5+oM+Td37rkq1ARnkUhE2qxqiD7CEce0Ms25ARC/Ori1wMfT8mYKm41dk8e9
         bWcPaAlUaoRr6iiSlW3LAoDbVBYu9kOrU6cOxHwKFdad14q57OGh93Fc1w+vrX+WC1zf
         MHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203420; x=1794808220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOU+uPjXYv6C9BQX655dlLqEf/JlKkzYX0WVqRX6Ues=;
        b=o6X4ixhyXlWf5VFlPt6DNMU1mbEOjKjvb85Sz1TxakRB2CJ/evC/3+DEJ4lJk9GdLg
         GF1bbtHxAt8rFNDbkQN3s0YyNq61+jyfwUrnS9LJ/KIRlSJMtTlWz8k8lGqNSsfmrl+Y
         reWn5/gLXcWEf0Uh5wwVpk8ESSXwf9WxXQn+Z/M2GpMCmJNOv2+dGH0AhkyuRjhMiaKb
         tefnyhWdN+GfO1wdktoKiwDJ7rGFtc5+gKN4uCgekZhwUDYv0uW/s5nRFaOyn4Qu/kKF
         5Sijl5tCRk27AwYDOQtykFPbNCoZzoccd6A24aYyZyAZQtx1bfsBdnsLOVS9Wq6QI44A
         aWyA==
X-Forwarded-Encrypted: i=1; AL+hErEvsN4JX5uneTCO66F+OZP702/kdaELdGpBi/mSDf7AWlvyLQVAzlAFzyrfO6zXo5PT+E5YXoJtpvuXbLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+4r+uZSTmiiYTesOixbq+NcRAeVInfh8e9+MIE4eclpRPZjoj
	0mCpVNFMJfnUtll61C22BRAL2hmCdlv6RSEGQedCIiDYnDd5HCTKObd6
X-Gm-Gg: AYBFou2m79YqFrmLbAWfuE/lz+0WP0+aQA73UMw6jkhqoCLxZpf00dSRvnE/cG17z6a
	fbLg1d1VqN1fHApUdsc8lxLWvPkUSMvFMYvbqUzFca91IU6fPiBqQJLEIGU0R/J8aXOZ6a+Dr8Q
	nO2DbT8fDdnOkC7yUjDG2a4QAfrO8Da6bNJpi8ay92yoe7nNADoRwRg0IL+GP9wJ/7JLUbvptWA
	qNEappFfWpMqUb5vzcSPM96oUCCiwxHxX31tl9hDrrAEgseL1uGmHcrulgMa9K4zMY3TnwtdEBC
	9FE0yuG9fNtUOYtpes13CB5K0Tq5DwifGzWyCEe2H6yq2JusGvG6ZbU0m410dvmEVoNqI1pcYF/
	jPGkdzDmgP3TjKvNhN/wfsib5yyf5SehxzhWq6/XyoeprdvAYUz78qdzm4Zmb5KrK9EAgN+08zu
	vS6uBKDgFEEaU4Kb2YCOuTxhjxqfJHdBpAGFbaQuXJIagxFk4Gc/ddAekt8qHkdMtY62TCMnO5/
	biJPRYKO55XGrCNdqjBN6bZwPnrHopD+Lq5wz2CnYqQyPqlY4B5GSgUD+aUqoTAtNG1eiFuviZB
	Rj0nv5VHcKpEBhe0OE501N8srBX57KJBkURyFDeTejcDtZofRsff0mjAZiGumaKZwwwVQEReLEZ
	ZHxBbdG2rWhAc6WwQxcSeRSbu8ACqvbYN8tn9p5rjnfcy6dBxjfqXfZYdNH5cmLyVRA==
X-Received: by 2002:a05:6000:41f0:b0:492:c04f:1dfa with SMTP id ffacd0b85a97d-49582badc4dmr5288099f8f.9.1794203419718;
        Sun, 08 Nov 2026 21:50:19 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783e39esm7566761f8f.45.2026.11.08.21.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:50:18 -0800 (PST)
Date: Mon, 9 Nov 2026 08:50:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: nVMX: Prevent potential user space corruption
Message-ID: <avFfFqotCajjCzTf@stanley.mountain>
References: <dab486f129c36ba1cfb322ceb56ec6fdef020ca3.1793959700.git.dan@cryspen.com>
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
In-Reply-To: <dab486f129c36ba1cfb322ceb56ec6fdef020ca3.1793959700.git.dan@cryspen.com>

Oops.  I sent this from the wrong mailbox so the From: header doesn't
match.  I'll resend.

regards,
dan carpenter

