Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC823F6C30
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296968; cv=pass; b=b2wR8j1iWY6ddwp/9FmEcygl5q9TSI658rF9Y6iexOGX9hzGyveXYsbikh8rcQr4jozoBx0zan28PjoETikfjglDqOOGwmXBI13FB//Nh9I0mLNPaCPM8ZWoK5igELrYL3G/RHm11lRpzxGza0Ctukxr8k2shgx5WEDy+EszNug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296968; c=relaxed/simple;
	bh=YkuqH+MK6KGcxmjE7jw3JHU6j01vKBGL30UVNb1lziY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuDbTCFBSmlX2dKJD+/i3edndBEaMXtrfCXNeAYvohyIHNgGN6vOfnzC6PAmcYYg10j6xkV/Yinp6TY6N5JNXlF4U59OZm0S+Vnhs86PJvl4LJajBZGvhETmc9CWKZnD37UvUiaZRBpRrY5jX8+MVZ5YF8dCKUUNlA8Tc+dgngM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejdvJUID; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejdvJUID"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4d198f1a591so679077b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792296957; cv=none;
        d=google.com; s=arc-20260327;
        b=USJMuwsHrHtuXFSxPEHjgERbGbxjocVJYZhz0q2H1ASVzwRUohnpjDbaOnXqMK447l
         GyVp1g+KKW7VooUYDO1ECC44yULDTZu+GCOBPW0hBwnviv3IjTCQ5cNZhIpm1d2w9gh0
         HI4BNWRU1RD1xocy3UyankOCfF8yyRHjazkDZaEwmD7A2VCMYPKdU3+YB/PR3FPwRZMN
         tmrj40R8LdELjVTiZEeGLU6za9PaztXZw8sEZfJDL57K01LZfAL06VXNjHJiij3NnO9b
         qjkJz1KR5/XPQs86m4LULOeobbPcOGmUVXRwuVxmR/XXx3OHDDtwwE6SCxBLyU3nIR11
         Tz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4NMbhygULn2TA9BcRl0hvex0kI5AbioiY6qVGqZX4c=;
        fh=9hkPOsI8K46FjBhxiJjPPob7qG7Fc3Ua7xNh8pUw9fA=;
        b=DNYTIyU5B1jC+l++u+jwI6TC7u8ctfrDMo3QxV3h00tXSHkM2wym6mwHGRJ41wfmd7
         oTbcAG2uj/Q5j8JQ3g7GGU6iDd4+f9F8/rZPoovvxk3YR+eM9evIKNSs3KmwIrms4v96
         L5aALjdhO9xjVVHqYNhEFr6g8UHBQlspDJy8/9u6WoMRQEM6BCAC6moHJt9VZwRK9mS1
         3i7kmxLyZVCnUhH/jVo5YRKjgQffx5M6LsFOSAY1o4Iz1v2wgP2K7AwhEOxVVSLa6JdP
         vhwz7Uo64EeXgKGjYCURPj33bc8gYycbdwehwfZr99WbdSKB4AMo0Lvhts5GDlpBv4hE
         O6xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792296957; x=1792901757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4NMbhygULn2TA9BcRl0hvex0kI5AbioiY6qVGqZX4c=;
        b=ejdvJUID/zLpbGc5UAZdwmgtEnUo11h6rMRjH//kSZcztNT+jSUEDraxSN2wBUwH3c
         HvwAkdmLRI9p7wVTDipqITlbqnfqxVc5e0WcAS+AWqKtSeQTTEbTiL6z2y4oVv+tdBig
         869ugRfTNkfE08Ekp3IOUq9oIqYsRZiVC1scg3Nr1dNelKnevMR4iQv03qXT1Yn2GVBQ
         FGdq0OhW3eG2IzHY1E2T+2HujI/QbLjErxHkP53P8QmsCkqvBNCbvP8IgWWzFANusKim
         aHLNR15JhBAfHUOX6I0I6wZJF2nKvFMcJM/eeRQ7/02EQBqxB0hbo+XD6u2EpHlX59Th
         D4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792296957; x=1792901757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4NMbhygULn2TA9BcRl0hvex0kI5AbioiY6qVGqZX4c=;
        b=0kU+iFvd28OEmMn4vHfEqRqeJqA5XRovxqD4v3NxBQky3bk/fYeMlxGYV04IvoXXOD
         ZDRjp6Ikwc4BRN2FvJJo+TfceL8q5WiLP9SzYICjgC0TXC9YycJupbiSuwKVQbk0R6cs
         nfnvaGp6qIkd8Jj20IerNRcdPKaubs9+nYD7kclLuhj+//zTkKe1FHewvDNjSJqzxCX5
         5vbJmkVzbptMQBzv8S61WoJKT4v5PSvrmHpjbZQZJvaonl9V5Rs3cr3KOoM8TAxlg/vK
         ZMC8+NqD12NdfXsVlRtW84gRcaHKpLz82cY+u17UiTQmTJV4/olcLUkZSgKD/LX/+fQD
         WPew==
X-Forwarded-Encrypted: i=1; AKwUvByDToFo98bM3Q0ZUkvvNlurDeeQnZ/ofCh54a70/HbtHWGzj4szwZLr+C/6APOkgufNqKWGLzeAwmaDyT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzsCyOgEIivlP/Hj4FFA649TydjUBC1fjdHNAk9kqeCb+k59zE
	5ffsvjFBcGlF6E6he8/CAxR0mBBE92wz1PPNdd37W7Mjl2oPdXjnWywGF9l7vvREQD05LHkCVta
	/md8y7eApuw9WRG/mZHpvThVqBAe0l5xLRJ2AVgg=
X-Gm-Gg: AYBFou0SxdUaVfm5y/3NJQlBzxH+VBTKa1mCqxJQhHj3JpgNVHsXwl2SpjFMIgXuAdD
	2OVSzuNpSfVzCUD/kizhLS7zOzwfYHUH8kVYVCIOiDwg2b0KcsXksOUAKmkl0RMrNcoXhY9K4oQ
	uYXBRQH3iMSyg9byZjrayuwPGM1nq18JUKTlKkQcGiN9VjdhHE3LsXNtvaaOhGTSqeL5imkyIn9
	BgO54dl2e35BttFEa9NHHCzEuZMq2Mk2oGlAixmQiVzi3uoyepzXKMOpWW9s+SWLkbZnVYqVZ0o
	NsIZkXRJLmDmZ2o94BGsYT1PkTH4HFumyNbdkNePMqg1JyuS2wRsYElrFiqOwAVQOR0q6t6jG4g
	TNFj05ZSvMwrJc75m23ThgzoZJl/Kowb8Eak4bcu//Qr03A==
X-Received: by 2002:a05:6808:5189:b0:4cb:f21b:6f91 with SMTP id
 5614622812f47-53cd0371300mr3801242b6e.36.1792296957151; Sat, 17 Oct 2026
 21:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009214404.722628-1-mmyangfl@gmail.com> <20261009214404.722628-2-mmyangfl@gmail.com>
 <20261012-taupe-grebe-of-nirvana-f32c6e@quoll> <828d3e2e-f204-4bcb-99e8-341a5c799335@sirena.org.uk>
In-Reply-To: <828d3e2e-f204-4bcb-99e8-341a5c799335@sirena.org.uk>
From: David Yang <mmyangfl@gmail.com>
Date: Sun, 18 Oct 2026 12:15:19 +0800
X-Gm-Features: AclHuK_0SlrU2BOKsnPge_cM0N_e9WmCPCRY0emkhYZJ6ilQF5PW33ll3T1jBQo
Message-ID: <CAAXyoMPYuL321B+yWYyCFA_uod+G5F6JCdBkVGFWqBo+37KD=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:16=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Oct 12, 2026 at 11:11:33AM +0200, Krzysztof Kozlowski wrote:
> > On Sat, Oct 10, 2026 at 05:43:39AM +0800, David Yang wrote:
>
> > > +description: |
> > > +  HiSilicon STB SoCs (Hi3798cv200/mv100/mv200) provide PWM outputs i=
n the PMOC
> > > +  block which drive an external converter.
>
> > SoCs rarely provide supplies for themselves (they are rather called
> > power domains in such case) and above wording suggests this is actually
> > something external. It also speaks about PWM but binding has no PWM.
>
> I think this is talking about something like pwm-regulator.c.
>
> > > +        compatible =3D "hisilicon,hi3798cv200-regulator";
> > > +        reg =3D <0x8a23018 0x4>;
>
> > And one word is rarely a device, which adds to the confusion.
>
> It is possible for a simple analog block...

Hi, I'm planning to spin up with another version. What should I do
with the binding next?
