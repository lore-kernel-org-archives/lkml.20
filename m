Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8134EBAC4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559502; cv=pass; b=HUdBn5LcxZ9GEODguA2mxkQhvxZ8HiMq/E1IC+kGezUGM0BxCv1G7BIUX2v35sYnG8Q/MC0k4Sju11vR4QBDo0Eb2JFi7MsXyxpS5CYm8OPGDQsENe94Gp2Y+1Fl4G8oCNAPWW0DuOWhahXY7vh0vOJGNKLXGwtab3DWKbTH0BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559502; c=relaxed/simple;
	bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtpZd1/4kG/3nMAiHxIOeSdO4Dz4lFOsjzufF1V+nS15glD0l2LBU6F+kDtfiaHnDhIqTFrqsOfmuQs1/kYFwcZ2pfXXijq4Kd5ER1FX8tJ4gC1/yPHJo4hgPE43Mo1XJNOjIv8yuSDpiwsk8skpsH+qOCQWCc9FvBXe9QD0ZXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxOXBXXx; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxOXBXXx"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso8349096d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789559492; cv=none;
        d=google.com; s=arc-20260327;
        b=aqOR1ciE9ihf4YQv6M6SmOcYwTypzdlELRH04FqAwLxmNK1+1Q7kzyxpEHUR3Awh9x
         Cnop6gnEL0PwXd+RqXJWf/WXRqlNEKaX8PoAnDchAhQNf4RcmnWwE+OVdBVCMSytT61L
         K0Z6TYEceZNHGJkCX91J4aJ7mIQpVLc14hce/gvg/C8UQ3d3YHE2PK3rZvHzVwR7U33g
         br/Lcw8Bejl4Y2gi6itTQSW0hm0EZ5TxFjvmqho4O5UZ3fliHfxOHh4ZYW14DNT4lBgG
         wFXnuSgZLUgwru+sfnP2yHc4xyhhmM5w30CzKw8DhzTTXMDrjtS9wVF00tOGVHYKRC+k
         Vi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
        fh=rd0Q25NuoMrbRFR/B/u9kDjOuxfMW3eJ6FqVbRGtXt0=;
        b=DUTBsIntk1P6jKTAdj4gT4EqcRFNS8AVW0BK/SdXRJBPYKkGXyYeRNQ4c5q7Q9ZEtH
         8Xbl7enxeMSsjSmauPLhkG0Da/RumCefI14bS6Fjz/m2i2Ch9EVIK8nlS1Ck90p6pVMC
         XIyhaY5z0SieVwkJohWSrUmZ7a/Sg2lzjIBo6EolM9dLYiMsxyR1Y6kCPW3BDw+rFnnq
         oBIc2kILVIC6mZHHxnWvij+rn3DqXvjBIWvHzxrOg4OLYzFVAGQy7q9q3ltB4XBpYwkM
         c6YnVnPANkWGuKPOEg8v+Typ26MXMA9dQOzZaXp82g8n9TFdxuvhdyDGj7uBZrpSHJvv
         VADw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789559492; x=1790164292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
        b=FxOXBXXxN7hILk7vGeVOV8qNLJlRE7ZZnosVXdd+JHKUpSf2FMZYQmiD+MGrtL0pjn
         vZm666Gi4gw7S6wkeklut08njum/REyCqicGHKCYaBlPkQ4yL308n4BgJEcq/CEPGgXb
         2CwwV8KFUBh5STeE+c2L1f/jctQplthEO3HciUSBoF2askOGkL/M3HDUqgoeJcmJbj8q
         IwS4v6oyVErBHTkkmySZhFy9krF7TW74ohavWCBRnGwGBQdXqaKbySOP/66kViziLT96
         YhvEagKeVuYOrtqJZpObE4dvvQNhQ4ese+PzNWLdNa0RP5ogfNYMwPP++pIJ+DtviXFn
         Fi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559492; x=1790164292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
        b=h3ar+8GNH+5GjOP/gycOuJJaM7VliKaGtwuuFgMJuDhd7zdvpn7ZC0NcyKVmNwFdAw
         akAFO5ZOhmL7CoIdpsmRUSZ27Nu0v+h1emTy1wf5GxOe6rqudhTsTHY368H3rDp5ePje
         gX5nbMTZQ4WK+1A5rGX8uMta0p0Cv9VvsVfoFDHy1cjmtEKNEEmn9ZUOAVUB3gsFbyF0
         b7fAj4DrOcWo7P2nZANdaCKSJZQPIflCcXopk+GPaHwwSBk0WcBg0a35JJnUfPSafiBX
         nCvZx8Q8WLfAu4DDFbPO1Zpbh/GAAAFWKCoz636xpKQfJwDnUNPiKIs4CswI/0dQr7Tm
         7pHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4T/A6uhMWVl3dvjCVedhlXmFyLdr8tDw4vcGmUQyAmJiynN8nepK+uaZMKuObKncaKqvCpiMLUROnWVY=@vger.kernel.org
X-Gm-Message-State: AFuF++lnUkVIZmA23Q1mNwvkxxiQ/aGlqPcU/L5/pfOvSZrwRuOeWCMm
	6d8AZf6xGI00YqTZPZAAdVCD/GrM4qJJUSrALY+P8hcEX3Q7YtXtMJKj+s5DQaZFUWeJMo5pJus
	/pVW0VucS6Ol7LnfmhwFbZP+jLW1ibk8=
X-Gm-Gg: AYBFou3kQLG9evc0zKTpt3F0Q0HIEiA0OCvlyo7HPgsC8ahyNJpoyp7iNoww+t4B+e4
	dpcEKROTh3FXr2K3Dx4DAy5ywoRjDoYWidO1moGegDwGemmDH3oEieJ6beM2pysoymmXTrb72Sx
	jqQfHd85Bclt3zoFTVFj6mEOlsirl8YZOXFBXLt+wT9hPUGpghbrpjSXcxF5g7wb8GYczMuAUdh
	IsrNxWIFiP57Z96zR86mrUqk4WVHP4cbvnGx0tne4Yr8v9Kz0lfogkq6xbp6QzK5950nU6UzXAp
	EP3HctzDfocbV63nkWB2uq/uEwKhTs4RgOqyVFtM1w6/w14qOTimRGJpQAAN0Wza7ybWtkZAgOk
	H+rVQOpmwtVLpDZwAENWv50CmzWR/VX7bPGU5ctWaKHJjyuofJrbYhUU2oIU94r977YNV5MtZU0
	ISyIo=
X-Received: by 2002:a05:6214:4412:b0:910:4861:43ac with SMTP id
 6a1803df08f44-9123d714b57mr44221246d6.5.1789559491823; Wed, 16 Sep 2026
 04:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916020335.17034-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20260916020335.17034-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 08:51:20 -0300
X-Gm-Features: AcwNN1ULJzkm21Hp7DKN8NoIMr4R2FtApuYbsaPt-WrNqV1bNMsk3Fm1LeLx77k
Message-ID: <CAMAsx6cZ+w9CN44+NMAeSUewfUsAtj39u2ct2mxVzExCvcU_qw@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate generated-content.rst
To: Ygor Otavio <ygorotavio.sjc@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 15 de set. de 2026 =C3=A0s 23:04, Ygor Otavio
<ygorotavio.sjc@gmail.com> escreveu:
>
>Translate genetated-content.rst into Brazilian Portuguese,

Small typo in the commit message: "genetated-content.rst" should be
"generated-content.rst". Worth fixing when you resend.

> Assisted-by: Claude:Sonnet-5

Documentation/process/coding-assistants.rst (line 48) asks for the
literal word "LLM" here rather than the model name, in the form
"Assisted-by: LLM [TOOL1] [TOOL2]", where the optional fields are
analysis tools like coccinelle or sparse, so in your case it would
simply be "Assisted-by: LLM".
