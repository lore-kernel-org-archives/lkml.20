Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D663B42C9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128390; cv=pass; b=WR7iejOok4R4s112+UTuVzXx7Uzgx8Hd8o2cbTwhJtVP5iaI3vGmArr3ZS0UkFXlvEn6hpCvXBHZaj+pgZsLCqN+XMoHaEECXg88Cx94Akdy0dn7d1TTVaI6ExorqZfbvSAe+/uwCUY3e8ETOi7gOSFFhZVZ/25wVt+rrMRNRIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128390; c=relaxed/simple;
	bh=DKZ3QH3gyxBydoFYe8FH8qEcg50uqpETpsBdwFtBqJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jA7eVx+QoRio+gZbw/4rjo1tGx2dCiv32HIxmXmghyADCwBD1Q2iPjhPcLpgIIa9ZNwgdF+iskNflCWtSFTWC07Wi61y+B1sJj5UKuyCYCIhdsjpe5MQPhiclCGWLdynb+ls7uDtBZm0230jMFA1qnJCBUK34dmRpg76HCXFlVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1uuDc2S; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1uuDc2S"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so1261620a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791128387; cv=none;
        d=google.com; s=arc-20260327;
        b=jPFQ41cRkW6GJhjM1LOHIgT03kHVGrJVfI+YkoGBQ7XRveTzte7RPwERLvOiCrHTQS
         nyhDPtUja5ugT2My0P1G3/MtwvkO5+XyO7es403WCIRf6YaEDverNhyLmJR0sSLN0bEU
         ByWGjvnScQpaRk83kR5ypz4TuQY3it2KCnaxUcRMuCQiHXErlALGlaGQN8vUyM/uDYcd
         hB1D+ArjmPP7dTzbn/s7xEK95N2sMyzb5IDA2zdGuZk1E3fxlQ9rYerFpAhr614gUlNd
         vVFjudrVK8+KsUcnfsNIYn88zPbmPhs+VfjzRTW8E+7q5KE4Vhl0eiJQiSP9/GxgRUqR
         +zeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w3NslzmXPjfbixIKCMPYflTAUvKrQJ2PvjNFCDCiyds=;
        fh=gPLeMzte4Tu/ChsHfkxUWdbqzdG49RwYt6R0F/K3gHQ=;
        b=X3sPqPf2kRCu1x3+s10HWj7MCxXE52WgfRzUVNYcicM/MHn5CZG9alhJo8+C2l3CX7
         IfG2fmw/i6QTldUIh9tThETv9y0PSi34UXnnvu2MJM+Vc7OSE1GNfkMsvTmNkPolLnfi
         NFrdsqrUuANZKbOngq2uylJVmo6J8bjhrnNYafe7vqQcZQtKr2exT0xNsdCMfPoELNE6
         zSZ7uTnICUYjjJyLWo5n4t8xZLXYs5KQPZcJfH7YjSTzKVY2xXAxa5mD//exnVv0GfYe
         FkvZupUTJKfRZuTjM5ERsov9E3Ix/qntGD2jND3rldxJI0auU+OthGWV91Xb3rGy+WC8
         GULA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128387; x=1791733187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w3NslzmXPjfbixIKCMPYflTAUvKrQJ2PvjNFCDCiyds=;
        b=A1uuDc2SOB/6Lpe8raNJaG2KRSkYLk2OseIsiiTlRy8QiaRZGPBMn+6cRy0gtpLvfN
         BlInRRcp3Kuw/Jd78/rvJw8vmuhgFxamff1fNmWby2YLP30m+6ADDa4cVDXeZ60LtywU
         1xAEQjXBWWOPE+z0bLzahF0BGJEqsLrpMu+1X0Hpa72pS+Zgg/PC1M/TUIsPfzKOzRhE
         VRvnF0Re8hGzg7Dq7dAObTbtgUT/k2rWIFzd55r+W27LtSCixLdjaJskMO71Bn3eWive
         8wfJZbEqlNoyaBWBhsQWxuJnpTFEuTqqhkwrKn6ktAY0dTe3cO5bO/gW5pmhs3tygAQ8
         53iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128387; x=1791733187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3NslzmXPjfbixIKCMPYflTAUvKrQJ2PvjNFCDCiyds=;
        b=lvU9pkppO8iCeaKHTkIZpk1KcmeeZnBgh6JTStDnRTMlv+Lb7Xl36TKvT1D+9yro9C
         z/VKIVmJvyGp4X9+ZgzLJBZkXn3Pi+KWDWevCIn435wU5PREUG9E8Oz/AnAKwbJPGXLF
         YVN0an5dz3AovgK0z71s5xpIlEv4pe5dKxNLK9wiGijwiXyexsQLILVVVP0fqv2heqJU
         QRDaVz8KRScysf3NoAILkTXMWmERzaNJyW/CaWaqmymKDtLMKXIZUrCuoBWLbReDba3/
         dAymoM3vmsAyEZWFiXTuckd3SDBd7Ayed73RC/yYsJ/9Bp+lm1++ZknZl5ZME944WcVG
         7iww==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9ulH6qJGwGDBRJBQPBOYcUDVWqNFcqJNjE3VpX0uSfUGhh53FdNqUf5Rp8N7E4qcvrzXnlbiMwIeqz4=@vger.kernel.org
X-Gm-Message-State: AFuF++kEfaC1HbKKCTCLcbY8OatdUpB7r32CD8tCVXd4CkA5/mKWAKEJ
	XYqLYJ0o2g7/gjXz5h/YYvZm7DqY+HEfAXb0uVw4Go8duYn+hGiKAFvfiAa2UuA36QisnsYPOdK
	4dcZrDzdjp/X10DVEbiN1Z7tLi8TazwQ=
X-Gm-Gg: AYBFou1Vp9n8LE/V8Rt6MVQYmmsJ63SZSSqVtEdkTjUru5KzX5S4s+6Qq5lXnura18l
	TrduLU67SODZsBPTGHkm8ncUqK/97v9TD8afh8W5CQCfdtdPzpHD5lBHgIAdPIldQiLu/oKM88i
	MHcovkD5o185rmQnAc2hxCHD+33NXS2IVy+q3xo1iJ0F7ZG1bXJTV6uDpxeFx94qgHVnUjEqc8G
	zPfRDFqrCMCmditz8hdgHZi48HGlnFpV3Y251w1ZzA2lcScAYF8PqwElBWoDrSko+cUoe2jwBNo
	YbqAF+9pXQGft/tkvvYqjUuI4IU7jDfWYiC8gMPv167ED8YcGxV1cdvFWHg/Cs1zeGMdXjnhRkE
	oZ0W10zxPMclkGU5paqIYPKL0Y8zpFdqhf4UBa1i5N30=
X-Received: by 2002:a05:6402:4019:b0:6aa:f260:b851 with SMTP id
 4fb4d7f45d1cf-6af9e30ec5dmr6817737a12.33.1791128386479; Sun, 04 Oct 2026
 08:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002161515.932316-1-linmag7@gmail.com> <20261002161515.932316-5-linmag7@gmail.com>
 <24db4eb5-19ac-404c-9dd8-c3af42bcf4cf@kernel.org>
In-Reply-To: <24db4eb5-19ac-404c-9dd8-c3af42bcf4cf@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 4 Oct 2026 17:39:34 +0200
X-Gm-Features: AclHuK8RSMN5OQSVW7fKvKmMGHupwE_st8Qcavj33tip96j2ukzukPLnhWfvabs
Message-ID: <CA+=Fv5QzqSQ8+=OpLbchKZ=t6An1HoyOH_OyR1+AiY1dF6Nzxg@mail.gmail.com>
Subject: Re: [PATCH 4/7] sparc64: add SPARC64 VII CPU, MMU and SMP support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sparclinux@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-kernel@vger.kernel.org, 
	Oleg Nesterov <oleg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun, Oct 4, 2026 at 4:59=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 02/10/2026 18:14, Magnus Lindholm wrote:
> > diff --git a/arch/sparc/kernel/prom_64.c b/arch/sparc/kernel/prom_64.c
> > index aa4799cbb9c1..11437bbfc73b 100644
> > --- a/arch/sparc/kernel/prom_64.c
> > +++ b/arch/sparc/kernel/prom_64.c
> > @@ -564,6 +564,12 @@ static void *fill_in_one_cpu(struct device_node *d=
p, int cpuid, int arg)
> >
> >               cpu_data(cpuid).core_id =3D portid + 1;
> >               cpu_data(cpuid).proc_id =3D portid;
> > +             if (tlb_type =3D=3D sparc64_vii &&
> > +                 of_property_match_string(of_root, "model", "IKKAKU") =
>=3D 0) {
>
> Are the values documented as ABI anywhere? Usually the compatible is the
> ABI, not the model.
>
Thanks alot for taking the time to review this.

I haven't found documentation guaranteeing "IKKAKU" as an ABI;
the match came from this machine's firmware properties. Its root
node has no compatible property, although the core nodes advertise
"FJSV,SPARC64-VII+".

The firmware also describes the cmp/core/cpu hierarchy. I'll look
at deriving the topology from that instead of relying on the model
string and hard-coded CPU-ID layout.

> > +                     /* IKKAKU: two adjacent ITIDs per physical core. =
*/
> > +                     cpu_data(cpuid).core_id =3D (cpuid >> 1) + 1;
> > +                     cpu_data(cpuid).proc_id =3D 0;
> > +             }

Regards,

Magnus
