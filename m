Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7087406261
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123822; cv=pass; b=h4qDzLfmpXzsiDB1jS4eAk0sZ9Bdg8k+xu4hVkko5N1sQJE3D2WqwQq2mShaOE344gt/t1oJSBS8V+ueBK2WAboKbgk8FRP550CAlmL2VQZqoN8hcppzpoGdVUcoD477FRuJqXQgH0QASexBu8GcrkTWwLX8snIATjHFFSMMQnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123822; c=relaxed/simple;
	bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoTxxXlVhTf5AYZ25jcRjvKhfrZCjXbaajMeYTgrGADYlkAMppLyPfy01rqB3OM+/SD/596DRBZOZ3uF186I0ojWa54z9Zqyh7Df/KBkZWDbU4s9fQD/3XtM00hy4TLs15J018GZFNEiBzBcz9TL6ZGi03mUfNf0pPc1F32fJow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r02GL1gi; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r02GL1gi"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso784616e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789123816; cv=none;
        d=google.com; s=arc-20260327;
        b=rrVUFzF98jwn2l8dAsgjopfrWbeeRaZwqxM64ks7853lkMBCj4uEBIbJIddyaBaeZN
         qIEKwmPbid+IgrIN5jjEnEOFkBwjqi+CiTec9cDMNcEgVbf1AKuc6ZPhP4MFOwg08eWd
         eA280tZbt4zC7bfxVxbdEm2dM1wDCvHME0vBOElkE8QohUjGdoRfGUSBrQ/hAVMEYqNE
         ODSvxo0LjHDK8puxdeRXWQy5svuhLUuf64QTCF2uEkmUniCbfS1MPSvFcbfgWh87wMp0
         5/whBilheQjWBsFr2G2yABYxf8PK1t8vxlcL+4dH08HM4qnoW+L7E1E9E0zic0EZ3Igz
         aXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
        fh=0PwwBdHEHwDYd08/y/75oASmW1GlJTWIVLJmn0CLMIg=;
        b=descyOAX6D1n46bHfvu6ahrwwwfLuOKILUwJT0r4kh3848WOuHDCd35AUvnEAO/0Tc
         xr9MRHW3JjH9XWsoZHSag9D77u/ILlh4yMFhxA6/wzCNVBxQlfqVXaWt6W0KjQSbcOdC
         qt/uMs/EBJsTHWWjmtTVYycLcTXtiYMiC4+5FkS7skGRAASHoCRe7ENky8WX7s0ERyU4
         zSSmd+RgOZH2p/3zesJWLhsf9LWJ/3Ffk5vSobp19ZyvVJkxtPvefVODrguGv47bDvp3
         Qlz0dKaViHDhaFJLzr7NcqeoJ5Z5JDTP608Mf3JWVhgqu88DhLM1yZlk3mbxOAynKZFP
         JNIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123816; x=1789728616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
        b=r02GL1gi3d79MIsNIxPtM6SHwb1mURzmrq4j+qSDDxO4qVEespU6hCNfZv8YJf23T2
         +Qbam0m1rVJDKUWE8SnGM4GMchL9FdoBpSIzlzxWQUKJlttIF0Kc6fQXkhk6S29CrkDb
         QUUFKUXeBsb8xTFZCPM/nTFRjL4MrhdJiCmhLEVZpfTWJHYCA0S9gYtC5TLDT4EMs7hQ
         uArHR8iQGxBBra7faG8koeprHsTy8jAtZcVMuJGZuv0oJzWjn7ptjLNPbFeDgRoQW+cT
         xIQJbxEX6NHnuD1lBt2uWiXf3mI8np984uavfbnqmypIQpFg5Cd3akXnCksFxPCNfiHI
         LY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123816; x=1789728616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
        b=n7m6AN0iuUHQIfw38509hCE4Tdbq9MkKTnoxwyMTwAOKPffhDlMFusJvMxHVpk+Azn
         NaOIeP2hod2W/ckV4HNpEarlpt98TCe8e9zvhwFxyD6ieYsDzEhA/Yca1G61mDCz8mIV
         AJaUl42rJZAPdlKlhKTqS/YCO+iQBFuqP2wCyAyHiJm+O5G6xBQ13t4GbLNWI89nrGe7
         I77j1SPIaOv2XsYlfbuoEMnjkSK1OJGjsRq+mSuQApj/F/dvD/E4sSwyhdogkfIrQvy/
         TC3r07wk0+4Ju7AesO8XE5T+wXQx/1w2EwwnGHw3rwLXjoYDRR2pNCaGkwVKltws873C
         NHSw==
X-Forwarded-Encrypted: i=1; AKwUvBzaugcSuw7cCvnO6ej+PB18LrXTUwrenPGmXe68ZOPHpgF9mg56X64X4C9xi5eP/Xqsl9lsaAG/3T27dmM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfai/fJRHZOsmbF6TNcICJENZW6SyD6NTM+9/NjM9CiFxwjShi
	vdyE4KDaIvnCiXNaE5keKzWVwCqlGy+pWbyN8dpMXiS2Rk/PJDtAhyZu8my5Bs0+8bg24BIYvUG
	3ueLfNfEnln1ZeEQ7Qg01HDdVlAfwvSQ=
X-Gm-Gg: AYBFou0KvK39J2Nyy3X/8uYM1IteMmWo/sK//3WruPQevZIsfpQi68DeGNzpPDFZS/c
	IznoUkU4tqRjsAMrPnMHvI+BlMc9XciZxX7isWg0/pf7AjvKqfOoOOZPofRtpOHeQWCWgmJEZGo
	tlQhKQdM9ViuEzCvwo0GeZTICGK0qURX5Ac4ZQB1KYVwkv02DAQl3GiTQl3lMlsUNFr/JopCzBa
	fY9wwHa6Foikce6cNOateQHnRkBvtM/nIAhittPucCijDaVbY4hblqrnUMUfAs89GJSGsRmODJ7
	fOezyXhily82OeE6oSgCQjqO59RImLFQfuNP4eKqZ3rSJm8BZrvhZbamDREh+l3Fwvycg3RFVLx
	9Jaeo7AqARb1HWgFReANafA==
X-Received: by 2002:a05:6512:1052:b0:5b6:1a7c:59d1 with SMTP id
 2adb3069b0e04-5b8a030478cmr770802e87.43.1789123815958; Fri, 11 Sep 2026
 03:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-5-sigefriedhyy@gmail.com> <178904820373.219967.782013244688408761@kernel.org>
In-Reply-To: <178904820373.219967.782013244688408761@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 11 Sep 2026 19:50:04 +0900
X-Gm-Features: AcwNN1Ww5UgMVw4xzqsqwXvhT3lHEUGGRDbRe6Df1222qEUmMtSjFyZfIiHQZt4
Message-ID: <CA+7S2vJpy8Y7rqBYDdbW-T_2yaBrdb+Bye0wbCRAUhmrvt7NWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/4] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:

> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909133247.113923-1-sigefriedhyy%40gmail.com

Duplicated comment as well.
