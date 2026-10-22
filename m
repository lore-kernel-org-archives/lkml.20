Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702942;
	b=pyDTx4HGW/18A5cf1uiR2dlkaivxUMx4HjBYUeWbUG4ChUz459J5LsA1mx01kijGXyMS
	 LRaQsFn8JmBvVo2ESkylUrvWGcYHdKlkv+UkUhRcRu5tZdGSFddk5o4PHrWNTuLiwI+JT
	 qlaJe55WCrBHIKjvhAat7nvHJ8b6IrmZ5il19IPF0xKAMW0hlRAR1SDHAIN+qKYbzK5uW
	 doWpiBHLyKZNbcJcLi+Y2aCYpzLg4Di5XPyjs0pn0owwVgjaoto93ZTd/ks2Lp2+ZiAtE
	 tjkt2T8fD+YkS56w1cuixFVYXzJKrmNRc+7aLZOiS37Dkpski0iyDAkOcsYR3sXSGgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KckalmaIjViMDWQxTjgX00osy9mL7j2AOuEfTdMk044=;
	b=ZwQnWianUcXFRjTZj993MuRedOFIMm0DTjckKqR1uKljOHF7U7Wq77+mLGBMYmZrZ4pa
	 Q4wb04ilzIUa+Zygtzdb84K2B2OJMWrJ+8YJgtso+pMsIKcKhkE9m8ukNsB1XHuyM+W7Y
	 0mD9o/bpvgjl3kYOKl/h967nIVqTQOxPkIjgOko+hc1PSHTAxS27FFxw2NuNr6qVfKy5x
	 yi3gidex55secBDTm5yNqLDrYzE85GyemaxUpOnfAlopEGX74MUQpEc19LDG+eUHZluA4
	 3FLldzS1aTS7WwWL87N/JpmKDeqgCc03aOdtfrGbAUqHtWFXaG9dB5AF+LReGulTm7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pKU92BEi;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C57606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C57606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pKU92BEi
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e9528732b4so246342e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702940; x=1793307740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KckalmaIjViMDWQxTjgX00osy9mL7j2AOuEfTdMk044=;
        b=pKU92BEisp2UH5kF8w71Obqwmk/mLZisDs7hvnFMmyu4nRGDXSa5eJ7b0QgZIBStrn
         3UwaHFWyA9CCPJ1sSNXuhipenYht93LDoC/6/GqQCxNjNl4cQA/z2PXHWWLlf5+ay+/V
         2zwhIwLybkEkkfF/xxBLK5KGKdKuK6B91PX+npzElatDPJ6uIQ+VWGUqGU6vNCnaD/9J
         Oz9YKH7GAFyZApOLdOH03NOxyZ0QFWAu8DOWQOlHLoxSD9EDlOfmSLWG4fjEYXamW763
         T55o7g+3/jLdO1AZtl6MOucRtsEh3jAHQqe9dRV0h1OlX8BRFtpwtawjMRm4YxtsC3pC
         nPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702940; x=1793307740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KckalmaIjViMDWQxTjgX00osy9mL7j2AOuEfTdMk044=;
        b=NZ7twYszE7VU/axJ6s1wYWpLLwipuaJ0pcnt7Y/DOUVn/uw0YYQu3oJQgGsmm6o+r3
         8PnCgVIJnh3GGLj80rG5c7ZtvvQmeI9m5P/H8NPGebaFKtX7y3UGySVsGfTOObuR+1Dn
         W57+FhcrVYnCXk1qvKFPHiPEdwtAbQ+wxL/2N0TkDbfz+xMpoz61Qxp609WFel2Fcxl6
         +I1W6CAt/RAvTpwFzP7/zEnrMjxSdfNIBtZyqGLEpGDJo391HNNGeS/ZlP9BmANSlJ9+
         8PauYeV6ndRDT04+2jPhBV6UnuZk3KHG6yKkrVyDVBbTaaVIvf/S1hwagpYTWkigpZye
         9Hbg==
X-Forwarded-Encrypted: i=1; AKwUvBxw5aU9UQdPXt78DtOHZp1RnnTt8PYlOBkm/nHeG5A/R89Jje0PquZG1cQ1QOnCtzztWJ6z6twHb7U+FJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9lZr60mqM1NHbwwDRQb5YPWQ0Jc8nR/0Qb4EWfG3HZtEJYZ9l
	dFvdIBiZLHvYYo+bAPySFqw9nWwRC2x5hHRP9PpBq+pgOTRqYRfcfvq0
X-Gm-Gg: AYBFou1jAyi1CYii5xJIwjp1aTbt0E2uSCvx69EnhvoTE1aHvitaklSRdXii6UIDUN+
	EFevqbpLHNeqMU1pwwfYsc3GZ31Rqxm6KgJYW1B6u5uvIYH0H6A+9uJImusKOMJDZsF4BxoAdEp
	Ljdu84cnTEUVzcvpeZfwyVNgCLRcM5FBbT24dapnlyT1uqArnzfav4hZR8qScQIZuSCVadJjaDL
	r22/VLR/FR28Kt1VQ3wl1Xvd6cwMRv5JtWiSqbnJ2Ms77sGYNq2G1eDmGQPBiBkvGVUUQOvGS9C
	CZQXC8iGMReOUY+nIVtT/dX5TYgLgKJHbln7SPfWM8OZ5ed+nYaKnjLKCuSAVMOJXKxtisGDs+N
	VXba13f3rHmfy5k/4t7BThG8ujQcPMPIp7VyhHm4kTYlTDuGNKQUZ9LgiP6YMIZg+Qlko1/NFa5
	F+J5e84OofqKHNUQdG9KJH73Ch8p0OwfvLmZO5GWndQLn3DSHO17k9uewoQms1LC3y3eHneonSa
	B1vqCeUG3vcQZIyuSzgwny3f1wKZuiT1XaMTgjkoIfjXaquGCGC6Wn6u/OSfoqwa11gLMrJhfSb
	qRJVDlVEu3UiS0CjSSju
X-Received: by 2002:a05:6122:4909:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec14a6ff12mr25880e0c.7.1792702940525;
        Thu, 22 Oct 2026 14:02:20 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f061cfsm303526e0c.11.2026.10.22.14.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:02:19 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v2] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 18:02:03 -0300
Message-ID: <20261022210203.80641-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
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

Hi Bart,

> Shouldn't this "while" be changed into "if"?

Yes.  After the preceding while (length >= 4) loop, length is in
{0, 1, 2, 3}, so the trailing loop runs at most once.  The same
applies to the corresponding loop in __acornscsi_in(); both are now
'if' in v4.

> The above code can be simplified as shown below, isn't it?
>
>                void __iomem *cp = (void __iomem *)card;
>
>                writeb(buf[0], cp);
>                writeb(buf[1], cp + 1);

Agreed.  v4 drops get_unaligned_le16() in __acornscsi_out() and
writes the two bytes directly.  Note that __acornscsi_in() still
needs put_unaligned_le16() because the bytes come from the low
half of the 32-bit card word and buf may be unaligned.

> Isn't the above (void __iomem *) cast superfluous?

Yes.  u32 __iomem * converts implicitly to void __iomem *.  Removed
in v4.  The cast on the earlier 'cp' variable is kept because cp is
used for byte-level pointer arithmetic (cp + 1 must advance one
byte, not one 32-bit word).

v4 follows.
