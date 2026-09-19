Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590C35C693
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789847611; cv=none; b=mmGNfJg0rKZtV4s7Ha8RNgx994p7pmtKZuj+9KUSFY24l8Vk1kezezhdvWmbrd5723/xxKStvdoQWdlh1a1OWZBsYv34P7//fR+6IakLECmJ59jBmzQ/XWwcKKqr0tIxAt1cESvoRs+n9Fyq7Rh/wKBt1iqew6+zBdHYwsvgfN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789847611; c=relaxed/simple;
	bh=grPi4sL38mCO/zpcl4PDe5TmClgVRLK3Akq0l20mu58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgYyHRkuMYfushqwXfY7GqPrS59f4PhXcHY928EVAVeYNxPxe6jsxE5DtZtAa7Wrni0CQ3riBOviFd9iUoI2kLfrGZWhOYtiIWSxvk5ZZJUypZs4r86RJ5h5UJJP9jv/0JhfOoUIrCJrwwx9o9nMd23eWgrPOcyncEMs+V6QKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Qj/b8MX6; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Qj/b8MX6"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so2740463a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789847607; x=1790452407; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGjddvv8oGsPTZlnHHs3B4nPTI0v+hJUCUNdoJx0o2A=;
        b=Qj/b8MX658zvmi1rvQVYol/+zfivCykahq1OMB/Qc7I1wcerCRSNVBYrW0sSA2hO7g
         ZinNjFMiD2cD+nOrAZ9CmQ670yBra+BnbPUj0metueV9jRQUIYKlnvY80JrEAsK9SzcI
         1SAKmA54UWI7TwxMXc4Y61URB0fhIqJ1cHIZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789847607; x=1790452407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iGjddvv8oGsPTZlnHHs3B4nPTI0v+hJUCUNdoJx0o2A=;
        b=oW8YQNIls/0wPfNBTRPRB7IQns1MBIaap8NNRLBctQiTdlsdHU73v9QCMDzAsM7B1N
         ZUKDk6f72UmaxEdPds6jeeJtRhRx5wV17VG+HyPBPfs/xqYiOmjBGs67H4MkdRfDkPVJ
         oflqsAXxsipTmsI18/I7WQXss/SdOS1NKK0bouMwK1s59QMQQUNyp1504T2zwf5fQKSm
         gYC/OnLXFUPx1Svjp9rcChALYmXzR2K3g+hXAeCXQZ6YKHmeTf8woTNu0w+QKCJaw1Qc
         C8MTjqAuqgTuQ4gF5q05VcRfiRVwYKpQYaJZp+1wSFXk9kCOtpPuFQcCHk1TszMWNLP2
         fgLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKInzasxkmIAG23r1uCS9kexsFSmHe4MpbJIXJOXXnBzCfNdPBX8lxe2GyDWZUQ5U72helLbaTz9o7q7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lNp6E1Czrv0bWWHOq8MPm6mgoL3TrNlg8NXGuKRsOiON+WQhWE
	lQa4s7HyzJIZ+QM7iLj1URTEubjIbAROjNm+Fw3DYqwCU47MdJe/EzyBysRJpqk+9V9Q3Zu086L
	ix1S/ZLBH9g==
X-Gm-Gg: AYBFou0vZPpNTA++A8HH4EOI1VeciA3M7t8KIbYcPpGb+3sU2LgE3nyzaz1RomTl3gq
	xqJKcV89HJX3z42iI6sfSoArX4mksCyE21OaNXLTXkFpRg/pgfSLZZ/nqbdDaafeb80ixSg1Luq
	CFBK5irKFnM3s9/hQvHP8sgxswNl3kAn9kINsl1mCy3qKE9nd4msDNu/QASn5Wv0nXd016BBJBs
	O22v0bC0oCPsxi6Au0JlM5XMX81Z49QVni89aVRf6TJntsBsu/4bSytpy18yhnZwJqQm/2TVEPc
	dQvMJhXg8KqmOIqaDMsznrq+Xtz9xRBeSNDJc7j+CS+t4b5Ke1cr76Iejobv4tD8yZ9vk+5tmVY
	7KL/sQ6YSdQp6J7v8bZY+va7GLHKy/S+MTldziOMf7Rw03d5eQ927G8EoMYwK2CrSMijntbTwPC
	pUVOKk6FRmSLDyDO3rjUa552/ze3HCfw5KSgPHwlIGXF+MBr2YQ1gtyqwhZxAeGWDiewdDE8nVu
	CGwlMHzNbigMSJ41SemxbA3asTjeaVzwKHxIONRi43kdvoVitE=
X-Received: by 2002:a17:906:9f89:b0:c29:41c1:3779 with SMTP id a640c23a62f3a-c2a159a972emr568890466b.11.1789847607001;
        Sat, 19 Sep 2026 12:53:27 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3523a063sm109874466b.8.2026.09.19.12.53.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 12:53:26 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so347854766b.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOzQiEmr5rMiU81jsqtm/ISGP+BOc+6cBL01DKp5ItFoZtX6mAIyyi4Lh0Ya8+Hzrk9hE4IWIx4sqI2IE=@vger.kernel.org
X-Received: by 2002:a17:907:1ca4:b0:c28:599b:7782 with SMTP id
 a640c23a62f3a-c2a15b11ac5mr645905766b.21.1789847606342; Sat, 19 Sep 2026
 12:53:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789845496.git.dsterba@suse.com>
In-Reply-To: <cover.1789845496.git.dsterba@suse.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2026 12:53:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwehxF3wP-vj23RXYH8RmK-Crmnq0g2wr6wNDet87S6g@mail.gmail.com>
X-Gm-Features: AcwNN1VrFvZJwPY6pA8DloIwbZXRJ8ZGYBgUm8OdHOB-IzSkClOBfTvn11h5BKU
Message-ID: <CAHk-=wjwehxF3wP-vj23RXYH8RmK-Crmnq0g2wr6wNDet87S6g@mail.gmail.com>
Subject: Re: [GIT PULL] Btrfs fixes for 7.3-rc4
To: David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Sept 2026 at 12:44, David Sterba <dsterba@suse.com> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git tags/for-7.3-rc3-tag

-ENOSUCHTAG.

I see a 'for-7.3-rc3' branch that has that top commit in it, but no
signed tags. Forgot to push?

                  Linus
