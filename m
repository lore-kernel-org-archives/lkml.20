Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063046;
	b=BvScF3ulU2DmHYYSPYNpo1DWVajGcNs38Wd7wGKjqWWFO3VrFeScjcEMG5D5mR+ESStZ
	 Ewmp9DBhXbGBIXU+q3IoGTy9PGys9PfbCG5pQWryXHjyvxEQ+Ca5ShvQ36l0oEsWOWqpe
	 0nU/tDJdptlTD7hY1leWncI3gB1VsbJ4iKwZFqyAiVrYlpYNH1UaoHzXJS5BLRsfN63vg
	 qS8uoicZzXF+IjZ2wTJXAIXIdpHuei3mluLwEPpsea0d709o20MQxjhne4TNZDGXmpcKS
	 oByYEzxgiJtT+r1XQcokKsEXS6zZCbKohCt+SRxxcaJT1WhUZxhs+iTyGfvWQiQy7dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=avJfK9ypBt2H+1641GuxSMWS3Ix3bhB4BbXP3Vk7Io0=;
	b=k/td99C8iQF4hQ67kt57/kfnmJvTbLPykGo2cbupjjA28oTahUsWjxzcVzSP61Taafct
	 676GtY6aybjGAk5WQYR/B5cq4Gg4oGIXE7hTsrjEkZCcHTKiJthmIWOSA3tD7PxXop6GQ
	 XUJDF8EIe6eZKGyF3St9uK5ROpxzQSoRzoYqx9GOSNNL0P7SAN40ZozlTG25YpDa3l0YV
	 F6gqJjLfD7oPkhDohTzbZekhc88jgM37gfTl1k0DHCUhi6kemR3QXjLbKjDcmIGK5yPh6
	 jQsc+OYXvYxq+sZItSL+Nt0sGiGrR5x8hGAMtmOti5eDNLUnD79syq4czJuIMrGIccA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="BrUCgXd/";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC27606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FC27606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BrUCgXd/
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1438d9363fbso464639c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063045; x=1793667845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=avJfK9ypBt2H+1641GuxSMWS3Ix3bhB4BbXP3Vk7Io0=;
        b=BrUCgXd/vMTFKCS+tslv3QI5iMM2mw/qFh1VQWsnDLDYy6bpucSGruGQUC5QV3jnCC
         2G+/qG1otv3a3TADIOQsyUMECVh5QYu9ARLAM+2uW8LZ6TSY7isyWL3wk+KIZrOMn0XI
         ewJce7Pj8wwqY9s/fHBQYH6OO9f29Hz0STqQDdzciiqeNPLFf5oOy9oMDnQnLh6vQ+Q4
         CIg8/yBLGLINaVy+zN5W1x/2BnQqoCe1EbSgqa/TO6B+YDsWkMmSQPP2QR3s1uF3rmhn
         K1jZYEFD/jIrLobGT4DnSJI6dfRwjYA3Gl1a9M5tO/KZYo3NStDgq7g5rsvVH1VXuoX4
         UtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063045; x=1793667845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avJfK9ypBt2H+1641GuxSMWS3Ix3bhB4BbXP3Vk7Io0=;
        b=jHLo2LSV0HZUssU6wRKm0Xj41rweukGxICntYZF6E1u9VBQ4Xplf6LUA0L5pFYA275
         zmRvr7Ip56YOC20Wx+QFZ1EvJ4zdkqtUWTQZNCxJ8qBnJbk05XfI4BFN8oheT3MVvQwp
         z3rfBVyi9ly4fl0QopaspetW7yQ7b+K/u6xBgMFj1gtNkWLPVy+DQE/5TrEymgOval7P
         JM46waKZ2r2B6FA4VAyH1u6N+fSdBQJGTTfkwgHl2/KED4oWPMjxKj4u3qFsANTabxWd
         TGBT2j3qccUY0A6TDxgwDKzNzV6pGUq70gM7SPsw7L+bCxdPu3BjiiMzXUuQPn512Fhh
         y7QQ==
X-Forwarded-Encrypted: i=1; AKwUvByCFgnSu/fXqvV6Q3mybXj473gAITdSl+uoeuIEjUI3xaaMdJqhZW6RE8Fr2Q4O2OVD4enB5giNUY1csvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPK2IfK5FhWHsnjwrDdaMqZdaVkDRnFvHYwbYxyJPlCrbL3nqJ
	bw6hoRn0BdH81hHGAYVw/OeFGY2EAnVsS0hkydfRnHgXVNdqgWqUuSeM
X-Gm-Gg: AYBFou2dh80oQ2bIwT/luD9B8Wn0M7vbymZBcX+wC8cf6kp11aNn4p5Db0D/+jY8yr3
	NqmrlJERvFAnu3hv58uk0X/HxGRQHxO5LmTwE9Bv8xBVnHygI6DP9B/qroIVPeM9WdVxiaUqaHn
	r7LC+fD+ieR46mD1Orv+U8yPg8ZJiRiXMs7Xtbm18GQhvbW/ohU+EVtTMXfxX2ypUcHbEIJ5RAo
	I52p5L44ZkPvpMuTknOFVatLmMtk+vv1qdOeKlF11OJ6bMoQPgcWGa12eLnvrEJIgKTWh5MdhWP
	1Km8DGFnNpAB3VtVhZvLCv/HaV0SYNKO03188M8hqh5bNpAPIu54Pq87im9UT9jB+34CX2dOJuA
	zqs1f9BOwVSI5p/kyoKxG7/0w7p5y+CahAUceg71xMQBcljnyP+7pUewlHZWU72qldXsQWbCJ/N
	PrRgHTxd5pAtGY+XZ7L8u+q84AlZeMmGZ9EFUogPljiUI5lxS49/Gs5pexSWGMsryfh/ZidzGXx
	ghB/vi+YveZ42DNlsXU/3BxGoSL6kkPp0ODcWkI0CbWc3A+NlZ5B461qH5lscE5ouic6NSKfzx3
	BiMeIaqEusvrFLexf5PfQhBqaK+EKvjUE4ZFO31nMLg=
X-Received: by 2002:a05:701b:2094:20b0:166:f097:6f10 with SMTP id a92af1059eb24-1a3c84c2d6amr1621178c88.11.1793063044277;
        Mon, 26 Oct 2026 18:04:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm937423eec.14.2026.10.26.18.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:04:03 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:04:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, tristan@talencesecurity.com
Subject: Re: [PATCH] Input: applespi - validate ACPI property buffer length
Message-ID: <at_4L4QXfXikGrAy@google.com>
References: <20261027002919.3589149-1-tristan@talencesecurity.com>
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
In-Reply-To: <20261027002919.3589149-1-tristan@talencesecurity.com>

Hi Tristan,

On Tue, Oct 27, 2026 at 12:29:19AM +0000, Tristan Madani wrote:
> applespi_get_spi_settings() reads three ACPI _DSD properties
> (spiCSDelay, resetA2RUsec, resetRecUsec) as u64 values from their
> buffer pointers without verifying that the buffer is at least 8
> bytes long.  If a firmware implementation provides a shorter buffer,
> the u64 dereference reads beyond the allocated object.
> 
> Add buffer length checks before each u64 dereference.
> 
> Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
> Cc: stable@vger.kernel.org

This makes sense but we somewhat trust system firmware so why is this
needed in stable?

> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

Why is the difference with From: ?

Thanks.

-- 
Dmitry
