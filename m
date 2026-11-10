Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314360;
	b=mlC7zLSoGnowHL06JZQygpwSK7TZq8iC/GIst5SRcpq0wp6v4gtZE3/ueUTECEYFZaC2
	 4HdQ3xICF0oHMk4mVTl7wj2hDBF/7b/RYeufk1f0ulUBJ/OUM7fMzkPcPpEm8NKKLk9nO
	 sW9KMpMqCFkNu8cNyyPVZvhGg+KGQHdhnSIwD/TYtM6U6bXEQlROEO6vR6T20kmCuI9Fo
	 qzS4/tVXUVk8HC2B/Vf1I+khqqtwBDGscHYrvGHfXvvIy4xXY0mKulJh+pEnH6Bt/DFVb
	 MU+seZ208C/CESFwoEBpgQWWzTic2h4CWLV+GHDvPAYxj34L3fNVr+SK3Krnjv2KIPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
	b=R0fYPYqvi/J1XcTXkiOa+MKjUinnb6B09vJr22ugVxcy/ox9AyXwOlIazcIfeyE+A/se
	 tWjDDwr9OBvuC4+yPL4lgdfHPjk7B1/MTTfwzWAsUSOwqYsbuIDriM0GyazZQVUgrXJAy
	 qmExA6BFyPrDu2VXylkkz4MMqPdhXY0WXqCiE8fWimdkgWHnrzFfM0Lf/U++dRHeWAd2C
	 ny+6QWgkDgsr2wNntp2I6H7UFHWbqCu3FCnTQAMm5Blsmmej7TQfJ5Lwty0kd32WljgDu
	 MvzpV2SXwFnEXGmhlrU/uh/ZGWPzX3lqJ248rmNRHkakJ/Sc0aPpcYBOYyx6O4M/L0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZuNgMEY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09435606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09435606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZuNgMEY
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c468bd799ecso281811666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:39:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314358; cv=none;
        d=google.com; s=arc-20260327;
        b=W4fJUrMlTf/I+8S/3WBlBFDdR5EC9jqfbf/wD+1nInOLiYIFYpIU8pyaMEYL01oKEl
         QqnRdb2X8a85sv9nkCxxGoYBB5Fgj1pMb+9xCRrQ1SdHfRN94lCiIGZzzltUhA6sxmmD
         uDbY7CoMwBIuspyFEdbFNaVATlCMDasn23aZitNigLpvsRnWmt4o1rJCEXytiz0qIVnU
         zjfSeXrIygJHOQKFxIfx/jKcctRJbWvUKP5dhpAW5GOs6bCVQRQxlaFEol4Ir5d1cPD7
         2jYQ3zoR9YdO35PG6T6KPmP88L69aXzOrP2SFyLTWRUVrV0U2jgo73mVxtv54/WkvyYC
         UNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
        fh=YbsudjZIEhWzsDV3zvgVTXOrZi28Ws8cabh7UXzl1mM=;
        b=FF4JF3n9EF2a3ZL+PGUFL36uSHjvIcExVNxH0RzwkJjuIgZLOoNefo7RlP8YRfFfI6
         hHMJx3GNf/TZp12uUG6Mj6S1a9dPapcdVb4XVYY11YlvEbTCMTVNwrPoRf5gDrxKOiA0
         A8tQJCujnT39PNZvqQpy7rHHkDW6XabdFsqf+13rwlZKGFP3aUDm7kWhiylfrwdJMlpA
         PPOazvm3SKUGbhNshhA5Osr5QmfyJlDvP1RWv6tysycTGJ3eTeuNsHzlcaz9P3KNYEdL
         ikrjwFRVLgbqLjX2GT5ZIC2vYFhUyPzsgugnFpCAKZrwpprdL3v20glDNxhuns72DxwB
         tOrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314358; x=1794919158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
        b=bZuNgMEYf3516jdiaNWWytT7ss5936o3GBODpdWVXVSLo1O1kH7oYGU4eyFCfyml16
         dcN7N5S8ValOnkhd3UrFY72ZpagSzl6yxx8DVB+0aN6sSfO1AtSmuX7HP6mALMx1JwpD
         oTFE7+7fkO9nEZ2pVXd1sK3KprDBimeGycH/ABMHoEy7IZETz6iTjf2dJRM5IAgcNUqF
         5eJseQtJGQgGIQV4hK2OsL/kmRys2FdeZs6V8xZCWodRru0w2ebkC+ln+GecobIzyrhD
         PVE5plgm77HGOX4wbP2b8Ii0Sdh7RlSc2RNhGICZ8+HN0hjON/ZUvLHGjz8MlDxhihuC
         BWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314358; x=1794919158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
        b=eq9Ew20iVtCd35RlHcE051pn1S/HQel/2kYM98I5p26u42OS2N4kTEWDDpIqaFiS8p
         NlG1LIgpq5zZ9pjj9jHurtqGM5J/EV9slCRur2lZZC8BRV70T6EDw7wWnq/DQ57UpA/A
         ZBvz62TmpCz3RBLN8mdYbXEE0s6Y6SEEuM537hKWjViGMpzDSi6pyKhyZHvTq/z2gNfn
         1baJHcnBK8NXAAKMgB/jgv9sReFVl54xXeum8rntDIQKq1jaU3CJig3n5MHCvyhK8Vuf
         BocxZL5ps7MqHHZHANM9Wttyn45lRpxjh1Nes3/s2epDI7I1ZMijmGJtwU0DPm6Q0yot
         S0Pg==
X-Forwarded-Encrypted: i=1; AL+hErEFF4cZvR2nDTiCu8JjGbqDAC0kS4RU1B1BPx30AglJCRhsZiIkf/H3/HLvkVRfbqlvC+p4/BoxCG7aCtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kqZC4x7nUWPKalwhB4vwKUDqjC9nZ2/1qh1n2UifGbCcx5nHg
	9Re8RAylkfwML1ay9qhAvx8WBkPRTCQ0nYdSqvcc26CybOFCrOhBOuGrDKrF7T/CFp/M9lUStYQ
	OhApKVNzJ90sfI7B4yNMALLtsYjE76Kc=
X-Gm-Gg: AYBFou20RCwTFS8piSuW77AwvJQf+ExOvuTTJnB0ngKx1iZe0D5zGy65I0jHucvYY+b
	YHwPFy9e8ipJtQUEzInFc7WxSMKK8KYqBLHgdCeI1urXHM6jfCOyJICDYezjCgHQlOSwEYq1Aq+
	vR8wp6jGM1EVDP5V5b33exPmGTn5XQUs4GIM/gxubtjcigPTM5M0WA8LO3CYyYvbl1de5G5NlDy
	dor0AgCYxpsUinqKVYDFMWl7JAp6R4cf7XmvVY1QF3W6/ZKWSmgiztD5Gn0XazBpCbrDxBBdUcE
	E6nY4jLvlAbcJ7iwhfvulQAuuCtKHjnj6jGxKvV9sf9icettpS+tPZBKgidLrKmK4y4T2o+/xXz
	WBG91q28uqRJj8V1YSwQG5Ace1sYGBocqG92AIzs=
X-Received: by 2002:a17:907:7b9f:b0:c49:cf3a:a324 with SMTP id
 a640c23a62f3a-c50494e75cemr197141666b.22.1794314358170; Tue, 10 Nov 2026
 04:39:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-octeon-parentheses-cleanup-v1-v3-1-ea6d4ecf2ec5@gmail.com>
 <avMLsZaC_AywFjUs@stanley.mountain>
In-Reply-To: <avMLsZaC_AywFjUs@stanley.mountain>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Tue, 10 Nov 2026 06:39:06 -0600
X-Gm-Features: AclHuK8ZN9_E3C7zyQ1AMfpKZD3xshRIIAFhPJDvkybX9DTHvWqr00KVrc0S1k4
Message-ID: <CAHDi9tqpPRBC38Tin6Mm0erNbTVdccYtbVHprf8vSFo+pLjKcA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: octeon: remove unnecessary parentheses
To: Dan Carpenter <dan@cryspen.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

You are right. I ran it again with --strict and
got 0 checks.

I was analyzing the file based on the previous automated revisions
I sent, which tried to clean up things that checkpatch don't
complain about.

Thanks for the clarification, and sorry for sending unnecessary
noise T-T

Regards,
Alejandro Lucero

El mar, 10 nov 2026 a la(s) 6:19=E2=80=AFa.m., Dan Carpenter (dan@cryspen.c=
om) escribi=C3=B3:
>
> On Tue, Nov 10, 2026 at 03:37:24AM -0600, Oscar Alejandro S=C3=A1nchez Lu=
cero via B4 Relay wrote:
> > From: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com>
> >
> > Fix checkpatch.pl warnings by removing redundant parentheses around
> > conditional checks.
> >
> > Signed-off-by: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.c=
om>
> > ---
>
> Search for this on lore.
>
> https://lore.kernel.org/all/?q=3Dcvm_oct_common_change_mtu
>
> I don't even know how you are seeing these warnings because I
> changed checkpatch to not warn about it.
>
> dcarpenter@stanley:~/progs/kernel/devel$ ./scripts/checkpatch.pl -f --str=
ict drivers/staging/octeon/ethernet.c
> total: 0 errors, 0 warnings, 0 checks, 1037 lines checked
>
> drivers/staging/octeon/ethernet.c has no obvious style problems and is re=
ady for submission.
>
> regards,
> dan carpenter
>
>
>
