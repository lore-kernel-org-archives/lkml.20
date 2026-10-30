Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360950;
	b=a3LzlA3dlV5Zj8Z8wZP36YQjHYjsMxvNor03BjwrCwh2JDptu1uq8zCcPfz6TefKOzlZ
	 y2V3yIG8JlYNElCEKZQelXwf6CeoVITDiFqghyHYD+WaITKJxHZ/CfAulRHkIGOGuwKOm
	 q7OwrXXS7OoZOrTEjTbx+ieJ2od+cjm7S09ubHzKGfYEmh/E1OHxTYutlp0EdR+ivY/QO
	 JrcJKL7mJdVNYhtdKo36rl7A4CuAt3L/ZqI/IXErxmrnVWMegJ9L6E8m2f/5F0NsoYMBg
	 JUm96Vss39yjg+xJ5v905jyBHfEM3YrenCQCeXWht9f1ODBdHiFbO9lv2DksdIgpznw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
	b=T9enii5hEoc58UTBUylIioUZuilffYh1unI2tP/DKEulmVbJ2jFXub/RAaBaIc1893BV
	 oGzO1EuhJ3YWpZCmVCp8/j63oTzYGAK2OyShqM6HlRvPRb4fkksxgSy/13gXrbqudb1RZ
	 khhTbNs2vkX/t4nnGOYITQ9028lLeueFldPmN43i0MoiSmub5ETtgMu8HFR9XsmQZGl7f
	 EU8nCDRPkI/5322AcDvy0sAognAntyT3+pgX+vpVrPIfqS9X8grXP3T63s+4lqXP8llpy
	 5n11AW1UJU+1ff/4foYvMvPACTdhUTuEPh0dQ7CpzIau5B4ltWceHTUUj/QWGk+kmSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBx+faCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 747E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBx+faCc
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c60e30054so7200876d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360949; cv=none;
        d=google.com; s=arc-20260327;
        b=Sz78icY9tMlycQw8YKBl23pC3vBwsFJHfI+e4IVVqBxFXjrIN/0NXziEjZsCmAL5Is
         9xo1qK6rqOQhiGx4dKQpi/NFkd7G3nMoij7MJjWeDNKfKT2c4dRtqAf2pOppd78cbQ6x
         dCz2vmw2c3DFvExLhQ/XAbVAki2Wze7auDkuTHWxkA6aVOpf5TftVxFZAdZ7PRgU4JZS
         ab9kFinIdIWyCOvfKT7hrM/xA2zryLdc5UoZeWQFN5jsXuB+fZFS6OO4GDyuYKxSDmFR
         GTPkzM6l/Ypbhon+HyTCBqBaDHftm+D7G2pY6szuzVMNK9F2eiIBqO4Pe3O4Hzy1LpYG
         yDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
        fh=cTfUncotj/Wk9cVJzgHQO+DMccIlk6JBOO6n0YLic4Y=;
        b=J1G2zDc5qd52O1n7dg6PJjy42PONKWRPe16nqWXTku/FjKqgZGY9eAxQEUoiHJTle4
         0gq9S8bwofhC+V1ej6S9Y/rhGT048Qg6NGS50QJJ91FN249tFHBxU3rhDY0fiAZsCRQL
         h4/SBt4TzGN+EQ+MtHj9eFnMLl4MVtdBloZM4+EFnY1ei3/+hNq3P26Y2k1+nr9Vzug6
         eNl1z0MC8GlWr3ptHxLhEOo/hmQKoxomhmui/mYPEXOsCk4qmp5bnGbQ4vtvKDQIFWj7
         SFJBCCeuRwInHOfMdjS2EIVqXOG3jOQ4bZ0l3yiYyWgzi0gtmn2lvH/Div198b1ynpTO
         /TPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360949; x=1793965749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
        b=FBx+faCc8UdbEPnXz2CionMZefSq8McWMXQvMV7Z+S+AAasXQo+14XwEbBhg4QJpQg
         ptOUWt+JRV8JNla0xN0S7pV4gp8UBckzhuc8739qYmq2+dDaBsyx6wmbJP8Www75WLdX
         bQlhOl5u3nN4Qwy/1voJulPXduiQSY+ZSxov7H7ebdK2+H62NzHrO7I98X1QUTxkSR7O
         fA/qsKkScK8cH1lkKX3hIodPzjs6VEi/R+uV97U5/xzXNS920pcw85lBsMOOKvTtKt2E
         a/rKdd2rbkyrPrVdmZRQS9oZRHyRUtqODnnrHMkDJM51CHM7uuJ7KjOHuMPWFQose4y3
         tZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360949; x=1793965749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
        b=seEWhGbEgYvEVrMxsyVPjLHJi7OhgHoXVqPQ1L9NhFJaO0rnSLzt95FY5Uhk1y6ie5
         K2qfkfq9vKJ/1kfZ/rQyK2AL+lTzCRbhE+0LHY5gVpsBXDEexa81Zp+2n+dgWW9XnI5Q
         Mnf+TJ70E/nt3x15nU9+SAWswmOXc+kfcXuDm7CLHZhdM9ZIkBNzOzMzLOsGvKncd5ca
         qnkHf+RJoaLwabexl9cgXmI/w+4o70/OcP0/eSwK7fMt3ao7UOJVLQvnw5FjZLSU7sD4
         mrPZZNhqmZlcOx9FZ0CAABNnR6gkyAHyrHCDowY+uLtW08zEEd4DYArHcUfofG8OX/G+
         xtcw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ/Af4+RrO5V+ls6vVVQW5fuHKlyL1i1UfbPcwZ/z55b+a5pfEf3lOPLwdQ8FgLjGvisZ2c0LaM9JJKyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhNq2b1DbQpGHJH4iurC2fkdpg105msUHZ1mv/umyFSb/SlaFe
	VpqPdCURhXftMVDFtIxmoKebZlaQT4VSJ9Da6CRVh63HMq6tp2gW2RDXXWlFSclgFHrI3aHnkAd
	dlqPWMxJPWFs4Awy1B9KPoduPaLyqbLA=
X-Gm-Gg: AYBFou1y+ULryayeWSFpptdSyIlSM2HL7KzH9wzfVPL+Ogml7s0tQqpo3nOqA73aGMN
	IaR6nKlYzJ8UbobNwkGPuBfBO5ReUeNqwFjhfkpOTl632MOxV7ofTrcc/d/UzmpgPaOBfQy01rS
	MZTcZWtIRyOlgT2qea/dfxweeiBvVZlGLLxLMay+J1+Skk73P4Fk3SroEO1I1OUnkdECkhwvFHq
	yQubt/JnvHGkiMmmxBd3LmhnGACgdPHHEQwxnxjBVde1SaHhIJTGp/jWTa0Z0wkjJoZ9Y5nsPwB
	0e3RfWkua7CvwsBPKcon/iAMSINGBoxSWPAUH2CU6nao6koE2kMKkoGfYIvoaAFYLl3To+6//SX
	oVqYsXdUTU+f/r1N4GUE1SilOJCWBbfRje7la52zG9Ri+dlz/czc+8vUhBPshQFpnsmk1NxN1Fy
	g2RQfJLNbelDJXFbsTU468J/Z9bBz78IVI9qamHMmJEFlatPp7wmXvTIYNz9zLfvMOc8e/u/3fl
	8Ov4yEwEBAmISx+LdVwEdpI
X-Received: by 2002:a05:6214:230e:b0:91c:7f16:dd81 with SMTP id
 6a1803df08f44-91ca4b1ab28mr25702266d6.22.1793360949101; Fri, 30 Oct 2026
 04:49:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029222951.19065-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261029222951.19065-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Fri, 30 Oct 2026 08:48:57 -0300
X-Gm-Features: AclHuK8QWpHxlNT5Zke5Es-oVsU72PV8OOx-IR9iKRxSGgSHEZHP0bVpaNgsQVE
Message-ID: <CAMAsx6fmcnH6sQgMpnqbzcpc7_Jq6pDPDWAiRfTH0Hobn6d0_w@mail.gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: add maintainer PGP guide
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 07:30 PM, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> wrote:
>
> Translate the maintainer PGP guide into Brazilian Portuguese and
> add it to the pt_BR process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v3:
> - Preserve source certainty, tone, scope, and emphasis in reviewed passag=
es.
> - Restore the =E2=80=9Call downloads=E2=80=9D qualifier and remove the un=
supported software detail.
> - Clarify Nitrokey eligibility and Git tag-signature wording.

Hi Gabriel,

Looks good to me. One note please always keep the changes from the
previous versions in the changelog, or add links to them on lore.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
