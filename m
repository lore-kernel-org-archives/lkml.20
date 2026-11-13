Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602237;
	b=IxLP01j3ODgwauH7X6kZfDqa2w0xXeFWDj+bPMsDhPDPkjcsNSHaUtP6w42HMHjYipIV
	 wnr9VZTy8UgnPvxwxQwMSl95HEg8n6EoRYHRT6laA3E3JbyWgjbwRNhm+daPzqIY4O46s
	 OFpcJqn02OGBYReuFzGz2Qb6AIi9/0SioErgYWVx0f2UEWZyY3pVevnC6/iHQMq0HuEAF
	 NJJJdFvRGLsC8Utu49GmSYQnc+edPr7n8IPt5PMRxUkgsIzA3tilpvr+xtZc6JLViQW2t
	 xUqgOMFNumo8A3SgM6hVacf+ujxLo2x06N2AILOlHlMsljRMK35E8jWhzlZ9h7sNutQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q0zmMS95Y2iOsvCJTAiye2FTSJmpfdS8NTIq4CrS7fg=;
	b=kT7K0tO6gaUwjuAPTCQskvX0tjgQQh5K3pLcVIPa5bgt9+FpbmQ60bHx/E1hbSCi2ors
	 5KAkAETUuPvgJxDBx/bNfyf4w+YJY74hBnmzZYdiB8oye0fMsv4rYChzU9ykaRFf7doZC
	 emSkLlv80CblgppJ7cg7/+HPV2y+4jgxuWmBbnPUWH/SgJ19cR6sGe/tYf0F29OkyMXn7
	 ObvYdTtU8o5KAHISE66gCtyaHpqFgDdEwXRihlFKSYNeG6d4xiSePpggXO3e1YcTLOUGB
	 4w6wxV/ZllT2LE+e1urxHD84WkucrZMoKOsxbSKsL2lx/ZsoBCOHo/NMqQbU3NQhvSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ceb14J6a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A929606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A929606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ceb14J6a
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so296542666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794602236; cv=none;
        d=google.com; s=arc-20260327;
        b=EHzbTUo1evq5lNYuk3PDAGma94LDDmk33nKNOqjSVmtHiS4+4epD4BdmM3b2EbBO5V
         GGfdhLNaVJWR7Pt5gH4TSOi7M0jic7oqjNeHsgZ6WUw/EKUdjq27bQmisHss53NAceTu
         dbindt0sHmbZvWAgXpXHJ4tMxm9E43C5p3RLg9FvKjmo0wEG8221U6DpA8jJf8Hx3JQJ
         zdJGh1Zv4XquXezsBHPwqfK2diV0tigHx29bVLOsR9OEQPEmhQxlW1moViKb1XRWkXMg
         Z6tikyibNRx4Aay14r5ho8xxK92kWAyk2ZRNiPyi2hQSx4QQwBmglHRKKV4BMPEWxivO
         88/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q0zmMS95Y2iOsvCJTAiye2FTSJmpfdS8NTIq4CrS7fg=;
        fh=8xWzjrRW1yMnamQZ+UpOhkpLY8YHOjynMQMgDv8HwXk=;
        b=b6iaoRKRvV1gY9kOJPPOT71SIuGTNbONWAY7Ya+Lg+2vCIuK+w7LhuENgHKcbrDOQr
         pKm6DHH4bgSDfFY+H/Cd76kNO8Xvs5f/a1+NzydQ7cPqqgWNG+VfbiTgSCvwz49tcu18
         8Cgg6U8zKg2BUI3PNs0liV8JxoPH2sog+S+u5mJEiVFiwRYKm0jgvYpWtatJ0s+pCCQg
         j90LWYBK72PgVRMCO6l7HwLyCp/wJcHvDBObvpBmNRMOXzrGU4bKRtsRZQbnJMjwed1f
         seIKlOPSSlQw/uAHeY1uzOu3hixHyND8jIejHg48NNdhZSWVlR+f3IQS0g6mu/9P7MB6
         m+Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794602236; x=1795207036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0zmMS95Y2iOsvCJTAiye2FTSJmpfdS8NTIq4CrS7fg=;
        b=ceb14J6aCiub8PwS3mQUNXCY86BMGZZQN0L1eWWeFCdjdbQZHzYli0Me/XBqFJklt9
         XX+If23LQbF5WHPiMWO8ua7VpEW7IhWILPW1GW9spI/dcCYFiMts30JmZND/SnlNFFH4
         S5SPkdaqTj5jyb7Fs7Da96CnEC4YLZ699XdNoh6D30NY4HloKgLGZr78cCGDsb5k4Vko
         sHZCrPg6/C58dnhlVfWwFyJamWaNhSJmmel16hhiMUjUPh3cynRPiusEyPn+IflD1z8s
         wDArTtpsxB8ee5rurZ4JN7V5z3m7nGPitzpVn1fcQUF4J4Ko1jIgJqxn8ug812tScxKG
         M8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602236; x=1795207036;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q0zmMS95Y2iOsvCJTAiye2FTSJmpfdS8NTIq4CrS7fg=;
        b=0c9hwrvKXAlR25xbQM+1TDgtalmKNGx0mq8PshOId+QLe7fBnNLVCdp4UvgJQNDkfI
         hHE+0PlZhcE4h9CdPKlnCs5EzoQwIBLXJpytg19H7ZwvbR12aVnv8QezCyg4aoy6bfdY
         Jx3jrtN+awYtpL+OEg+swQwB4H+ejydR9jA1VgWhIKhmvRHRI/uBryNrYvoVvOf93p35
         MO48CkuIHuoiOpVi5c2fDposUwNFJAQpanFFJRjJESQvZdl0tee+vYDod9DUFkr/Obfd
         KFbMVMfGamQe9C7do3CqTKyjSb9lzlpveKM7M6xtj2GplWkhfCn6yvEZrBGtwj6ug0qK
         jbyQ==
X-Forwarded-Encrypted: i=1; AL+hErGYPGcXDz6Q5YjYzPFMMLG+xNTsTdc4yPoRkNYnJHI0BZpzDtKaEykKf54IhNCRMGmmT/F7kfWPJznway8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hhouhLlR/CZ1O5WLOgZ80KNwjT+agg2N0p9LVm6d/PsbjzcAN
	U6Mu2pPn3sgA6WH2ZNZYil1HU7dXC9vGgpH54N8iX+Pp9Bq8Qv2R/rNB+WbbF3qmVaJqBeJT65D
	wBdK3l/vGxgIJV/AYysoHdDQHaKiyZv/duaYZSWU6
X-Gm-Gg: AYBFou0i9+3sE1P2i8VLP0oy2/YpKb1gGMIlaKkBhh5dXa6JezGiqL7oUsf92XnI1d5
	++3ol+7EBwUxEjoYmbqG31KaxdXbRnAHs9Rdol5U5o+2cTeVhWvPIHlShZS0JlXUW3WEfsPSOt1
	Yp3Uoc/6rKMUxsYx03lAGtxzSgQosy6WiuGM6OJdV+W8AL3AXXI1/iwg1ar2dR4+OW673WNv/99
	h3l0kYzrN254HHSHl21JPqRzpeQzDGVLNqKQeHVGSYslGPe30KhjbcMWYzEiL6rvzU2deIYkQIJ
	Fx9c0pESt7Gx/D1hAhWWaPufynB3qFn7HbRc+MLwdMQ/VqDbsVZOz0kAzMCqcfOkQB+JpJbOZyO
	CGMKeR8gscwIlSIo8Xq+qYMlyI6FlawyDKuFxOw==
X-Received: by 2002:a17:906:c14e:b0:c3f:c878:7c1d with SMTP id
 a640c23a62f3a-c5096307650mr316429966b.9.1794602235243; Fri, 13 Nov 2026
 12:37:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113195553.2220562-1-joshwash@google.com>
In-Reply-To: <20261113195553.2220562-1-joshwash@google.com>
From: Joshua Washington <joshwash@google.com>
Date: Fri, 13 Nov 2026 12:37:03 -0800
X-Gm-Features: AclHuK9ptA2Q7NDGZ-JiCdfTID2_a3zpW-s80Ltd9yW31n9tVs_J6wRqHrbt7_I
Message-ID: <CALuQH+XPebJ67K9ntdYoruXdLH0tSt7EFkesfd_=3ATNJiQBwQ@mail.gmail.com>
Subject: Re: [PATCH net] gve: fix checksum state and gso_segs of HW-GRO packets
To: netdev@vger.kernel.org
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch is missing my signoff. I will respin, adding the singoff
and removing the reviewed-by, after the 24 hour period.

-- Josh
