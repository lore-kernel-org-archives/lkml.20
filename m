Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793430447;
	b=dOz/ebAEeUlvwLYcXv3ffYJN/7Iqd5YCGCBgbwjozv5TFKrYSOTqcrN4OB4Rb43jl4zy
	 ltWN7MUw4+adzURG3M+trLJPA/1yX1Omt+S+lQG0F1RtwKfZ48eEzo/SgClNIlDYZv8g6
	 6L4uQ2UnQjiaqG2qhcCHeNW2f0wHxb3BkJQskqPG/jutryYqaZ/OCTnxqeo+lgSxAoRna
	 I4AkKlQr8b8QxLnhPMOntnCBo5nR5px3a6aa6lZIiWj16wtcvG3ZRZzMRK7F2FvMyGDhY
	 FTHdjLJxTH1cvBETNt59/9UXrBVyObXIgG4DbcxLbEy8KDJYIj/7TCJJxJJwK4BxJBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=txDCh0MaBRHOsX7sa9cngelOTlX0ltFLjaAJVMdJYaM=;
	b=n76NLvZ3yateQG80vWTY4umJvXf0mlUCsdtrR0S/ngMVN5OLjtYmN7foCtcPcpoKi6Wm
	 OI95QVpNDnQQ15Q+tHjlyC0UZJ/v39HoH+Jbv1d8vPDb9+YjvA5/TPdtHlcz5Ome9AxaT
	 CLkpkjKmvPGxwmdEDjgjtcoh6pU502tB6/dHPkifWEmms8DEZ04T78o18kPcOlRQs4cUi
	 KutK0n/xI47Vr4qcruvJDqMI4wHZWRN34YmoY8D4/+nMBM7D732SrSCnkWc0H0NOMaCJ6
	 Ka/jZLRlWlqCVIJlpAsgMhon7loWIUA28J4MiI0Qocv8Bajm96FDC29N8dbocXQd7kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mUC/ZNRG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD2606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUC/ZNRG
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso2288516e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793430441; cv=none;
        d=google.com; s=arc-20260327;
        b=QLU202vK8IkYTMfQMjQL4BJwP/x33Xu/bIdNsSGef1N2VBJofAS86HiKbMQC5/YSqv
         r3RCSxhi1ro28Ql2RIHA0JXpBJtQNjdj8k1kNE33MpQWAkrbCJDhKyd0l8ihUBdFfPet
         JHuChYp8Lfjn8mLL8uHQRN4WUFWDpb5Ju0cBN4Cprk+bED8LjtwIclHu+VyJA6IhlyVV
         /k2qkPmjLhFGUFdlC+ItdYeINR8WMIlfuoYJE5l+vCka85vgz7qgvrJALuIgcekKo6Az
         9Nl84xxRCMerUVXm46XW7lsXNc2+HuDErwAal6YwSXBhNiVQRSPA8wRchIS/+N4+WO/U
         Vlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=txDCh0MaBRHOsX7sa9cngelOTlX0ltFLjaAJVMdJYaM=;
        fh=riH0HM+xFrlfPwf8/xW+lNoYS0tI5UvohOPMLE0BWMU=;
        b=g2dFeetthyM3CLrGULNh3YTsHswPsV4hDqSkpYeZ9wt7d5RKakWLyV+5hTmsgetEJ1
         ZpSXYEaHMgGpmujloigAYAH9h2sVfXuRotCtg4pkwC2ziOyXbP4IiNMJanzFTmSSN9qV
         zswsbXkuzX4RSe6A/CdqL/LXuqV9FFxAoEDwOb4vDb7fFivwzNmXjx0cpA7rR9mGtEy+
         Uq+cCKwuVpzqeBkVag7Hi1k//jrsClzNDrRRaU1gxNHt53+ay4a2gIAG1L1eGakUYuEc
         1BU/rw58CWmGf1FfDkfY46NXhzZFL+god3sq703xF98Nzg/9Au3sVpCA5t3uWUuFQoBE
         QkVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430441; x=1794035241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=txDCh0MaBRHOsX7sa9cngelOTlX0ltFLjaAJVMdJYaM=;
        b=mUC/ZNRGxHvMseEtdOEJmWVOL8SEcrnIyl+LO+rOY+pCywr6fgr+KDK2CIyE8lIsuz
         yQ1Np9gk8b8jKxaAfhEqP2bROPaNrhie/nknplsY5izO+GtjCMaTsnSI4wdjbSEFbJ2A
         v1V+FQHw3oxr+3yAX12D/DT/sUQ9qKE4G+uooZlPDxfs/u+oPXzxb9TRBVUps5TvUVPa
         1zS0+tldYvPBypmRuTh5upf+mvaRVO/3IMi4ZTkryxZGkOjq3yCeaf6+X5a4ylvGgOOQ
         lKmC7vQgmHoRcJHX40cgu4raIzql04uewGD2ZHWOa8sSFvfRTprZZlnZaInECB72XWYU
         O0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430441; x=1794035241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txDCh0MaBRHOsX7sa9cngelOTlX0ltFLjaAJVMdJYaM=;
        b=Yu4pqYJy+dKz2d5oA+HPr5X9j5G5T5m1z9w9pBB/WKIfc0h0ykmOTEdy/fXvRdS6x5
         YsPXvnal5xts9fxUurpQhB5OqOSiWan59EJBWGgXB6O20NfZCMAvXWMZi2G7DPToEf5n
         PYtm76wPfTYmRUimi3agEgZELabviKNatl+dzfEHVwRqPguHJlUo31tk73wrx4XIN+85
         9rv9G2v4C7/tGTabQHmb6bhIKmUsCexwsrBER6T6RiNZxhHannDFRj7fQv9vfv5PRB3c
         WOny5fr1svhRs9ayqRZeZG9lKZTaloUkdG293hcMsKwe2aZaYg+FzCsxExWj+Pcrj+76
         jG/g==
X-Forwarded-Encrypted: i=1; AKwUvBzZykvIpJ0t/gTffucd4bJ92qfzb/be3tFOazTiF4ZRlm+1r46J5T+fQCgHauD7yYG3nLy1lsA8pbV3y/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl1Y2sjCMVP/v2gog9yfbaiWzMmPOU+MDQ0cdWFcZXIWyyc6Cf
	vGNrmdGwKSKI/SgxhHhLE/nMyavt6S1Nn8+LVqy/JNvzjZLBxeAJ9RKbE3sqMh5KyvzX41EtF0o
	F7ajZwXOSLl3FVDxF6NnP/WwDFoxWZQ8=
X-Gm-Gg: AYBFou1O4XBsCEd2+8vKidDFZn/8Xo88oNEnR9TntyU0QsQpoYpyqMnLEdqmIxVexOG
	luXAOgHqE/hsVodjxo7teZSnDKKzirJZ425KUZp5ryu998nI1PNC2gN7Y3P8NIcZFgVImF+2ZI0
	VwgL5a2524ngJguDAWszCpqrT0PfqMsYmr4ASCXwbOAfexVVEio/0csZ2PPZDZBpp9CwrKbMOv5
	1jyeHafsL/lMhRcCaVhAcJvFBKOf1ej8PRjEL17uDRxEhYkp3bCcVZ7w5yNGrfM1Sjaznm90amy
	IAKMpbrTuSLT4hXF6G+ImjnE5GLgyrDAN7vjLQ1BYBiduKWOhDPivqq6VaWBCpfh3Y3IrM8DWRw
	apHi4MF5zLoJWfRNPbIQ3bLLwb8qzoHVK1m6Sb01U5uNikVNkaD+0QXfdwh1SLobPwDNlM6ZOIG
	BUeLAtwI2zX/NXq+pcT6wNoJBdiAlRFTJVeiFrQArn57rrUPDAL1vhHImF8Kd82n0rj6VE2SCOY
	UOEeFBP6ac=
X-Received: by 2002:a05:6512:1393:b0:5bf:cfc6:edb2 with SMTP id
 2adb3069b0e04-5bfd951d540mr1610800e87.1.1793430440393; Sat, 31 Oct 2026
 00:07:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030023248.78802-1-testwrzwrz@gmail.com> <20261030023248.78802-2-testwrzwrz@gmail.com>
 <CAL+tcoDUGqk-KfMBqdG4RBURHQc=9J+Ce7B7CZZWRN5yN7pRrw@mail.gmail.com>
 <20261030084017.16202-1-testwrzwrz@gmail.com> <CAL+tcoBThTe7299eVU=tsUdi392dS9cioXX5RA5AKRsYAGbdVg@mail.gmail.com>
 <20261030094633.27910-1-testwrzwrz@gmail.com> <auSF/bDmOW0Y7T4D@boxer>
In-Reply-To: <auSF/bDmOW0Y7T4D@boxer>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sat, 31 Oct 2026 15:06:42 +0800
X-Gm-Features: AclHuK-0fsS0Xg_Rkxrpa9yorygM-pSbQySVfqzZJZ8DT6_AjEHZacGUrZv2dts
Message-ID: <CAL+tcoC+bwVdf2N+Ku92+ifPOQMvak8KMYM9RvMpv6hkdpMt2w@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] xsk: defer software checksum until the skb is complete
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Rongzheng Wang <testwrzwrz@gmail.com>, netdev@vger.kernel.org, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:57=E2=80=AFPM Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Fri, Oct 30, 2026 at 05:46:33PM +0800, Rongzheng Wang wrote:
> > Hi Jason,
> >
> > Makes sense, thanks. I'll wait for their feedback on the selftest patch
> > before sending v5, and fold it in together with the rest.
>
> Can you stop removing all the previous conversations and rather reply
> inline to related paragraphs?
>
> I don't think v5 is necessary. And as Jason said you received 3 review/ac=
k
> tags and none of them got included in v4.

Given it's his first contribution, I suggest sending a v5 with our
tags and that change (removing else), so you don't need to re-add the
tags one by one :) And then Jakub can easily pick it up with auto
tagging.

Thanks,
Jason

>
> >
> > Thanks,
> > Rongzheng
