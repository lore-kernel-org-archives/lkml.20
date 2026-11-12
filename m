Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481759;
	b=rejoH4Kq7CuPnewiH4OYyVbih0tN0WY0HiO45grUIBXHiKw9Pp4uDZ3Egd92Oqe8xKlA
	 rq03up+8aURE4WGMnveCLzc9hn2H98Oi0lSsYaE2S8UqQnhQ9ipilwOQCbv0+kCnaZBdy
	 dYJqOzf4qBWN9VeqayV9NRUXilbHQMDQp7ROZaOgzPAZ9Wk23I0Lys2YP/hOKAoaDQcnC
	 gedMCJOzjtYwLlSs8AluD15fMEbRsTUG+/i79Xd6WpgI25AJKs/BH2iv2nCn2KehM6gXk
	 mFaaLLHdgLcrxH/fbt8kPjZWT0ZaywzFY0wevWfGgCzA0D3VtPWJLG8vQoTJnBQrn9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IffUWbVgejcXQC3F+05E+VTrz5GzU4svg//3Rjb0ZF4=;
	b=0QOfISWaL2lzjkAhUROTfvgEvsYVw5HVwr8pj/0B9xZzHfopExhDT3NzBiP/x1vtp2rT
	 pFseqbkucgFQsI6Jpstndqei1mbim8TXKmVVE2r6S8PDA3nJqarbaDKWu8p1lIoMqn8Tq
	 honL/LuAZHR+p/J1BVqvpW/T0j4EgvoUy5ufkkoX38P60HGEEAY/IIvoR7Mf1kWfQKIaU
	 LnlRU+PSOOwkuJSOh/teTDwQHlKWJoWCshSp9x7zudcEsiojK4ix+Sez3z7EIn/9WLXTv
	 g3NCAtwZNHKZxhsrJ0Xb4YVJ4uxY3esAMeY+3RhXXKcqCzxagy8kyiTRpUK68Ugj4DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aPArUoC3;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5C606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A5C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aPArUoC3
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2206902f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794481757; x=1795086557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IffUWbVgejcXQC3F+05E+VTrz5GzU4svg//3Rjb0ZF4=;
        b=aPArUoC35fpsLAcHPQdPX3P0Aap6FebkY5PuLtTPbhXxSpJK7zmf0xsSZY7Vqvv1Uc
         ioxr61OHpPoQKjyx43F4AkAed5eFmu1aquJ0sKdW15uLP6uscwjEkVOH2S/AlUvl6ufz
         pdDmILORfObQH4eXpc6F25yDL7+fMDzax2NfVuMN+osprMP9nPIX+vSrNh2lVmn+huNM
         YeejSxuP2GWm0FzDlyoev3GIIIkMxlTk3AQQkmhnuRME05pFZistumRg4xDyvyJOzsKm
         QMczUK96g/Yj+8nK4ITqKjm3yQtfQftTj4iPvwvNL3PpedO7yI8+vcYPmkXH/tGXc6K/
         G/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481757; x=1795086557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IffUWbVgejcXQC3F+05E+VTrz5GzU4svg//3Rjb0ZF4=;
        b=Fvkkj1b+i25cn9C9VmQwfi/J5IsavfCvNcqQQDXCHrQ5is2+/9LdhQ6KTFZvznbnNg
         XZ+dXJodx5zTx8q2fIlstM1Ob0UDoImu6c632KLqRrfwJlKd+66pAIj9lMaHdgUIawOa
         Sih4/rWrNbImUZE2OU5WA/0KmnoPLwgK486EEuXR0MSrxZZYojkB57ZDwGdxaee+qAEI
         9opj2Gjm8We1lMMy64X//OJHgyAdLipy6l7Ofi55dmoQCOcBcmKDaq5MdjjyEhhFnTRV
         4XR7YcP3KhMUwKtIiw/OPCNNpRbY3w2TF0F2HTsm7ivU39BFVVRHSsxzDv2wrzd1tVg9
         mkXg==
X-Forwarded-Encrypted: i=1; AL+hErFDcvC0oFPpwGOUhl49N1wgAMiaupN8vPhQbjqeZkmyOMoQFXVS4sqDjj/4EjTuYB1/lwXhi+ZIKbnJx0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fH8cMLKGP5TmGBKMCHtJ3j0c/909ezaGdG2MQMxKesDDKv3yF
	3/EtIqoDgeBo+Y38W/w4NcM9Ou65XPJuqGbI6XqkgBcOMuMMsuLBbWXdTB/wxVImNcI=
X-Gm-Gg: AYBFou1haDnMADxJmkzmgI/JBbnRfLa89wfvXVH8jZxSiAs/HuuANwf4J4YYtuo8xlb
	N08VZRNt1z2SG2xKPD6iqbvXVla7EmdDmL6BQNAgiX9wBgVHtaGHtzx2lQpSa5IoDxjIg0tBMY2
	Y9Fh2Mk1S9ewtjKXsWQruFjf4OG7jsHIAmZEdKMIOZZX7KrDhSwGWXIJnRGQcdRbDJ4YeriA6jZ
	vat4ioYaYQiZgn/QrxAPidXLvbT0G+b2HfHt51SAX048327A+lcj6Cj0sGBWns+PN9uPNJBmohV
	wudyniSEmeQx7baL9TpXcFBWk5OCU/J1o1DOuVK6ZxDIS4lnjnT26ahLDIt6ibkXgS4o4rYIByf
	v/TBNM8In9c94D/sOgMJd22l70jmB8toorYTI4jkHW7UZBML8aTO7VX7+DJmjFYjLI3GupyDd8m
	2iE4WdI0B5uN1AOFBCcR5DHLoXVFQnxa0+F2hJYue6AIcmTeK5kLl8laeh3nTPpRP1fDvTZzXR3
	MB0+cMghvYVM5af+IUGFBxpNYKoSoazQ6RH0r797ffjH7rBa3k9XyJbBsq88T3CWVoOdUxFA7xG
	dmZU1ZsZNtPygM5zZi6hQSEGJ4xZqxpHmHgeOw10BeoXY1Ois6DN3G/YGBd9gHt7wJ5CrA==
X-Received: by 2002:a05:6000:40db:b0:498:38b3:55a1 with SMTP id ffacd0b85a97d-499c717cc4fmr9080408f8f.15.1794481757574;
        Thu, 12 Nov 2026 03:09:17 -0800 (PST)
Received: from ?IPV6:2001:a61:1383:8501:b640:909:5395:1fbb? ([2001:a61:1383:8501:b640:909:5395:1fbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm16041397f8f.0.2026.11.12.03.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:09:17 -0800 (PST)
Message-ID: <5d30ead9-8107-46ff-a29d-8646b941a79d@suse.com>
Date: Thu, 12 Nov 2026 12:09:16 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/1] net: usb: rtl8150: break cycle between tasklet
 and URB
To: netdev-bot+sinfo@kernel.org
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112104548.693456-1-oneukum@suse.com>
 <179448073312.2168702.13029326266334825765@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <179448073312.2168702.13029326266334825765@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.11.26 11:52, netdev-bot+sinfo@kernel.org wrote:
  
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.

This is in response to a patch by Myeonghung Pak, whose patch
tried to fix the issue, but failed to, as Sashiko found out.

	HTH
		Oliver

