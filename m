Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126812;
	b=xpDLI+6LMeorSxw/wb9sCvUoOgtBcb41/7bQv4fsT5Eob9E9MJBtfLidCZek4xvUSnSM
	 ZZfLrodl2ltkcHh9TZGTdY8CGuVb+qvOiptOWBAr6V0fjNQdRm4KUDJBtOmyMHIAFKB+y
	 rlnaMWDOBIQIVKWnRZXsqt/6/+A2NOGiICtM6/ZqzYmesI74OnjjtW7z1RU4lgMG7sZZa
	 KDHlDyNHTvyx2Vcc5172F6ubQ0a1oDpNB7D0qIv8wbhqjZxtlVGNbDne/QP0c5N10tg3h
	 qRIIV9152/FbDaL8AdbAmbPDUaPJl1ViZBSX+0IwqzqjkeZPzuluXqAmjN99Z/55KcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
	b=nqciS5NwH5nIvfAgoadTn54ha/TfmbVKq+NNd7C9fW3lWolZmByXW8qGEFgR0H+6HjNU
	 zebav2176KJnOkl08EQ/I2DcArIleEZjvJglAYsbR6IXvkBsHlSk1MWXY+pz/q2zQmdcu
	 0thxtAbVEqSFCliEZnc/vduKSQsZlf40Yg49V2lfSZpL8LLPDjUaURrjzuZtgLiDWnFzA
	 mda2zJJ96aKZpC7bB/VZQdkZsf9hF8wT9gNTa2i2begldgtb5U4fqdb8qGYm4HaVxC1dj
	 mFU6cF4KsMxvI/76Cf/VCA427JNbArCdL+PiOeqgVEMHAmWzJsyLRXq4GTAJMyE4AlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51007606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51007606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so281833eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126811; cv=none;
        d=google.com; s=arc-20260327;
        b=GjTWRTFq6hsB4fhB8ctlVVcpZqqGgeerAh+6kuwV/JpUkrgdXQrurZwF5VhfcJOIug
         /keR3y5/K/1AnFOdC1Vu27JDEAxxIWbjOFxkDwoz9mGVcTb9Swhpr3vOC0ja52wiV7es
         sst9raVAlnlhcwKwdI+fhYqIi3GqJ/sGiwcWeYQ2yDjSa7xh9Il7EAwFMp07WFJiM9u+
         E4K1uykU6D4RY/u8pLdHy/BJ+cFX2TUc4IOg1tT4q7wsVEK+ksGmjTsG5EO2AOjEsiN/
         hHupqXNc1BtJydBOJiMj/TQbNXHpFmBGOnwjGqtSEIIiR04pPL4GPYgJxdkZshaxkY7D
         F2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        fh=LpxseBT1jJ0Gby0p0gq1dQkBCkfczXsVHayQ+5JsbMw=;
        b=aE3PW0sR94ids6NNlJXUjDIo0F+j+19a+WsIIuhGEtXS8BvKuwck2sQyS4mfdektmY
         eG2PBU0zMa+K0iX3On164WDdGy3TDKuN4xIVb60UOgq9tKIqI+8HYLqGt1bYmre6c8OA
         ln4M8/u6ZbsZjhjVxS2cG/QTa3Tfo2QLj33D4U2n2F7IMTwjJ276gY9v3tJNac8Z0oAE
         O4g+h2fB6Whovd9rWzHENqVeVhF0VUD+JqZ9LG2Lw6U4RM0ZvcfS7FQg1HDA7O0oHyBg
         9823kTwWFmVag7yiUCviqmRTJcpCbWX421zjWpP0Mm0McKEMATQ1X4AR/j6cdDs8QKqd
         rXPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126811; x=1793731611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=E2G7yvHaNkRxyW5X1e82+KIGXM5YEJiStgrdWIvG/gYSSS7qOXXR28A0GU3fx4B9qv
         39OttinzhaBsa0+GeHKfNbjNJIQz7h3J8bTmFKDp6du7ye2G+jDgrSN7sDv1jPFk/hE3
         o1BW1kG2DpmC26MFXaXofLL6r0i2h+Fh3zXcVQSF6dgwT+0hK7V8lP3VO9F1uZcL04jv
         WAOHHlYpkX56zN0B8hpKiKMIqT9WhrE9BOOBm6VyRUG+uOBWmVMkZeZOf17DJCocnc7D
         FlaAutXsgGENcLxSOMGA3Q3USXx4TGloK5IfEhnjEjIogrCqfYWQq3Kw1XP+nA2Shun/
         sIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126811; x=1793731611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=KtLUdQfq2p4Y9mGhO6dCZlCPhS3w8DkzjUPhI9p2FUBRQaaNo40cSkBXmJ1/VNtQgM
         dM3780YcYweYP7qaaFBFzdQPCcm7yzNiHlzTLfXGqngGhI39NYv3UjCR+4O4UdkYh9zY
         54/UTt7flR46kewCkEBl5LvkjvA32epcOBmQ9PXGZwzYP4Z5w71B47mwbdDgVDXQollJ
         HsjHtwRrtdLyVJdl+DxY9smyBY3AyKLsFBQNyI/2A+9mSPX+/QFcAGsii0kQ7DKNVjDR
         eGLKOJV/A4/QSoyPCocgqexsI8g5zK5atJJ2XxqJ2r8A8N2Qtsqo5KMsRhWNFu13OmF/
         lkCw==
X-Forwarded-Encrypted: i=1; AKwUvBw2YfOqT2aKQHRJs4oEP4csn5Sog77yCKw178cB/zWgRj35F3cDuF9O4tI4xi746he9h9/ewIyEdzY6nDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK72aCKuI8QHtkLuDnH2+TI0dknAGbdxBJT0uwCQe5qkQfeaDWR
	lW+mecCMOnalXL4Ot1mT9qD+adhMyJ6gGYVdsyaF10WIvaYTLBK+M/qNMVyj0t8I0mdG5WfAWuP
	6OwiWK9vmXsuzIHURCdQ6wvzR3YZriEI=
X-Gm-Gg: AYBFou3wR0t/Swqs8LvaV8+CPP/yzceFc/ql4Swt7PbgKluAODCh1+lXjENMhpe6BNU
	knf3fFMdJvpV2Z0Xk8h4qTfywbe1YR7XaDT2PKOmT7AP7zuDL6zEx5uCFf0dM6ykskm7bTKSLqf
	veHsBZvShjrdBKuHKqjHVWWaZp3KjOjYax1LR0AIAnENs1r8J2n0woR+isyITaSuMoFZtq5hWcj
	s/j0zG4c2jVRx1qUjYFNJ2YwN0snVCMRq3hYNgeug8xWuIcNqQxKXWGeunk8HLVcdCspOmY3fJ5
	fSYyTcBzQLsyo7UAgjGOIdoiUXsbZJi5V8zdCv06yOmch7GJapyuUtOv7pVtu1ZLNmyQjpNLj5B
	1sQghXV1IjLnJ3wIiiZU0Olz6NZ1Xou81q6C0d7ZyqUP+oTFG6qE8kZJhUFYB22hrCGTufw==
X-Received: by 2002:a05:693c:638c:10b0:369:d8e1:7bb6 with SMTP id
 5a478bee46e88-36a203bc9dfmr355408eec.25.1793126811403; Tue, 27 Oct 2026
 11:46:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-2-clamor95@gmail.com>
 <179312433904.199157.11834547028241710753.b4-review@b4>
In-Reply-To: <179312433904.199157.11834547028241710753.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:46:40 +0200
X-Gm-Features: AclHuK-EdXsdf9foYz2HdBUkkAOJoPmsThEgknyKq7DwRpVYxIMIaZENdpZib5o
Message-ID: <CAPVz0n1be44e455tvaowB5H8mrYOyTyWof+PS-nmf7W5VyAtQA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Maxim MAX98088 codec provides a single DAI cell.
>
> The device has HiFi and Aux DAIs...
>
> > +  '#sound-dai-cells':
> > +    const: 1
>
> This makes sense for the device.
>

I must have set code correctly, but forgot to adjust the commit
message. I will update commit message in v2. I have to adjust wm8994
codec anyway.

> --
> Mark Brown <broonie@kernel.org>
