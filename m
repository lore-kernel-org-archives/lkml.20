Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869958;
	b=GU2L19EIF6atjdUDQGyLo45m5MgsZqQOTpc5h7DxnmgWQk7O+v9pqNBTNmKzF+PnfrQg
	 9mv2BsgGbrUASMjzbZj/ISk3ZdYA6KxYtTZG4BQYc2y6xeXkapehFl4ELSvmj5Af2kYTq
	 Vq84ETgstoFAoViwXducEfKzD9KPppWHXcmVuubpOEVRuXzoNJUaRCVEve0aKap4uenHn
	 arDBRDQkakYXe5E/BP1QwGOUOya/lYDFtcdiT4i19J5rLQPMRi39XRdiazaNC4eW3rZ/d
	 ODqXmN1ZXhK7S/xrtirB/iGGPVImwHs8VBNRfY/KOt+iCvL4jOnUh4DFPsFAh/XKkFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pQEU+Nq/6GczAyz2qU5/jfNWYEMY7F7Ws8orF2Q5XuI=;
	b=ReEAuBZhL9SR1fXNzWKnC6eEegP7Gm4Rl3BmMUk+5M/5EUWf0ShiOhDbJKF/ttSwNqX6
	 M0tsyJm9KFERZSmlcjBIdm5YEc/G/l6Sa6vnVhC0P3wOoxG6bc6vhytIWAH4dYLO05SHc
	 XekcQBFPCk5tlxVO2xRej6oaezp2/V0P/E/7CALhwE7/ndhllh+RFJPyJzBWcqNeP9z2Q
	 T52bGA9FrRV+8lEUHM8L1ZDXqaB7CsJVODoW9mfKYC7zslTCqCzrDS+olgH84FG4IzeHY
	 NzW/GlyV7SRVg68/yK53u4cADYPtY0oIdyvsEMjFf7XUP5WbjHHLrBCxsXEgxEKE+ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4timXoz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE65606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE65606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4timXoz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so12416895e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793869956; x=1794474756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQEU+Nq/6GczAyz2qU5/jfNWYEMY7F7Ws8orF2Q5XuI=;
        b=Z4timXozTwhiDpa/JA9nBzWtVFIMPkx4s2C/8VAvZe8DVnwMtZ3b9TUOBi4Sc4JtFU
         Xdj+AaVHbiWUM38ZNjE0tBsddRW4HsclbRwRM/99Oo5428d6q/fhKhjFnIAHWGMGo7iD
         RDJqcJT0nLmLhy0DCoJarpWNqQlK6qV5ZXeksrb64VgiCbO/vPYVRE/fNFWNPuAJT5Oz
         ALOIzqXaF5amu+qByQORrqz+DuFjIBdlWNxkYK2CjAWaB1zJZRjiND3KY9+MoP/ZJHo5
         ett+PJXAav+W3lsXWCdY1vX4PB4pdITwiu4nLmsPPRkhXJ+Hvb3zcSzgY0w3UZ0EodyA
         Z1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869956; x=1794474756;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQEU+Nq/6GczAyz2qU5/jfNWYEMY7F7Ws8orF2Q5XuI=;
        b=Vl95sXcESisqOHZrGSuRJoj0hNk6p88M3faLR3qU4hXFbPdaP0fN+Es/6/rGwnRmpR
         yxM7oMCpDEssnH8/nuzlzDBBuCSt7VrZ2xqhffdHo/wwnjD0GHQ1yuY/V/nzsXy9PAez
         omj9HaUPQ6Tlaea4D2e92NzwOW9valYwPKGA6O2jPM5DsgkZeaUO8mkQLeSedADq2Isx
         vN6jG+5IxR0OuyspXsLzdwR5ZR+AllR1kzvn27MHuL81i/XSHHo30Kzs12kJ6+eBpO6+
         VG56cXOnrPdSv0MGEJwp9cbssM+5hXO0UY/zi79siXlkBdybjBhAowEKLos1mRyaMd/g
         2u+g==
X-Forwarded-Encrypted: i=1; AKwUvBzozpbenEGzAtETu7CHJ+sTZFnK6fCjQzaRones9v0BaDPpRXrSkXqET08o0hKVNSaE+4KEN3N6T38Xtcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z829VtmdskROnmu57Z1ACYG3jWdkTJ/tL/b7xtZ7vKyvJc8jFK8
	TD+ND0i8V3NiN1ui0Nfmn1Z7zbz74DpzxVZIC72D9H74fHQhsWE8qYLh
X-Gm-Gg: AYBFou2Vgk4Je9J7r/2YW/RWauckV0QIyme42H3hbjmMGiz5ZWXBZszi3x3a3TirSWx
	Z8iCY+JOoqTRjv2dLxpOmcQGPFFxFdfFL1RGaKXN64ZcObu6N8lRf6sRgem/y24D2cDLcL3mY3Z
	Pfj4DjbsU/IzqbcWqJWmwtYwXSQUgot6D0VQ2dGWaZSf5/ueVxoVRFlqFsiX7z+LSqb7AZ4hkRL
	+SBwZbJ1Go5S7lyDPGOnuBRHz3bMeMoss0qOJszuTXCvzsEXCS2gX1l1FRVgZ/XKXhk5M9lRles
	crsVUZvPV8uucNMZ5chSbQ00CT5EdejyzHzAOGE+tDXtg6aFuZcbyez5ry6iRtySZHrnEHCfUXm
	7fGaHOzU6K1HELq5yoT4c54BZnn0AAW3jwwpBfd16XLsJLQJHbDSpdnf4gG0qz3Ut3R+N9kYaZE
	GL6Y3nXVCNZGswPCeQxIfCIts6GhGL5qqPCsuptSJgo5BwmECfugFduFJEzbxpBJ/3zFly3eXlj
	23irL0nfWsy96epJiMKUObEv/nSdyAZ2sfk7UtL/ni/Gt4riSnAUru3RPHHlgsOoeCccVy/DW7i
	O4zjOu9Mms8zl0BP4CrMPnSYarQtX+tati5tINsZT6Txb4P5sNNDgiKVoJcK5dI9
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4ac1932bac0mr362719635e9.29.1793869955983;
        Thu, 05 Nov 2026 01:12:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm93063255e9.2.2026.11.05.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:12:35 -0800 (PST)
Date: Thu, 5 Nov 2026 09:12:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Daniel West <daniel.west.dev@gmail.com>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Add newlines to sysfs output
Message-ID: <20261105091234.008c0c2f@pumpkin>
In-Reply-To: <2026102808-stunning-headgear-4355@gregkh>
References: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>
	<2026102808-stunning-headgear-4355@gregkh>
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

On Wed, 28 Oct 2026 05:19:45 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

...
> > WARNING: return sysfs_emit(...) formats should include a terminating newline  
> 
> Please read the archives for why this warning is ok to ignore here.

I was contemplating a patch to the sysfs code add missing '\n' and
also remove trailing ", ;" that come from generating lists.
It would make a lot of code a lot simpler.

I found one place that puts binary data into the buffer (horrid).
(I have a plan for that.)

So why is this one special, there is nothing in the commit messages.

David
  

